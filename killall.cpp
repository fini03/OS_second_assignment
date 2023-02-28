#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>
#include <vector>
#include <signal.h>
#include <unistd.h>

namespace fs = std::filesystem;

bool isNumber(const std::string& str) {
    for (const char &c : str) {
        if (!std::isdigit(c)) return false;
    }
    return true;
}

std::string name(const std::string& pid) {
    std::ifstream status("/proc/" + pid + "/status");
    std::vector<std::string> state;
    for (std::string line; getline(status, line); ) {
        state.push_back(line);
    }
    std::string str = state.at(0);
    return str.substr(6);
}

int main(int argc, char** argv) {
    if (argc != 2) {
        return -1;
    }

    fs::path proc("/proc");
    for (const auto & entry : fs::directory_iterator(proc)) {
        if (isNumber(entry.path().filename())) {
            std::string pid = entry.path().filename();
            std::string name_s = name(pid);
            if (name_s.find(argv[1]) != std::string::npos) {
                kill(stoi(pid), SIGKILL);
            }
        }
    }

    return 0;
}
