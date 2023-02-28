#include <iostream>
#include <fstream>
#include <filesystem>
#include <algorithm>
#include <string>
#include <vector>

namespace fs = std::filesystem;

int main() {
    std::cout << "[";

    bool first = true;
    // Iterate through all processes in the /proc directory
    for (const auto& entry : fs::directory_iterator("/proc")) {
        // Get the process ID from the directory name
        const std::string& pid = entry.path().filename().string();
        // Ignore directories that do not contain a numeric process ID
        if (!std::all_of(pid.begin(), pid.end(), ::isdigit)) {
            continue;
        }

        // Construct file system paths for the process's executable, current working directory, and memory map
        fs::path proc = "/proc";
        const fs::path exe = proc / pid / "exe";
        const fs::path cwd = proc / pid / "cwd";
        const fs::path base = proc / pid / "map_files";

        try {
            // Check that the process's executable and current working directory exist
            if (fs::exists(exe) && fs::exists(cwd)) {
                if (first) {
                    first = false;
                } else {
                    std::cout << ",";
                }

                // Print the process's PID, executable path, current working directory, and base address of its memory map
                std::cout << "{\"pid\":" << pid << ","
                          << "\"exe\":\"" << fs::read_symlink(exe).string() << "\","
                          << "\"cwd\":\"" << fs::read_symlink(cwd).string() << "\",";
                // Get the base addresses of all memory map files for the process
                std::vector<unsigned long> addresses;
                for (const auto& map_entry : fs::directory_iterator(base)) {
                    const std::string& map_file = map_entry.path().filename().string();
                    const std::string& address_str = map_file.substr(0, map_file.find('-'));

                    // Convert hexadecimal string to unsigned long
                    unsigned long address = std::stoul(address_str, nullptr, 16);

                    addresses.push_back(address);
                }

                // Print the process's state (from /proc/[pid]/status)
                std::string line;
                std::ifstream status_file("/proc/" + pid + "/status");
                while (std::getline(status_file, line)) {
                    if (line.find("State:") == 0) {
                        std::string state = line.substr(7, 1); // extract first character of state
                        std::cout << "\"state\":\"" << state << "\",";
                        break;
                    }
                }

                // Print the process's command line (from /proc/[pid]/cmdline)
                std::ifstream cmdline("/proc/" + pid + "/cmdline");
                std::vector<std::string> command_line;
                std::string arg;
                while (std::getline(cmdline, arg, '\0')) {
                    command_line.push_back(arg);
                }
                std::cout << "\"base_address\":" << *std::min_element(addresses.begin(), addresses.end()) << ","
                          << "\"cmdline\":[";
                for (size_t i = 0; i < command_line.size(); i++) {
                    std::cout << "\"" << command_line[i] << "\"";
                    if (i < command_line.size() - 1) {
                        std::cout << ",";
                    }
                }
                std::cout << "]}";
            }
        } catch(const std::exception& e) {
            // Ignore any exceptions thrown while processing a process directory
            continue;
        }
    }
    std::cout << "]";
    return 0;
}
