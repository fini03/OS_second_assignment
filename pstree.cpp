#include <fstream>
#include <iostream>
#include <filesystem>
#include <vector>
#include <string>
#include <sstream>
#include <cstring>
#include <map>
#include <algorithm>

struct ProcessNode {
    std::string pid;
    std::string name;
    std::vector<std::string> child_pids;

    ProcessNode(std::string pid, std::string name, std::vector<std::string> child_pids = {}) :
        pid{pid}, name{name}, child_pids{child_pids} {}

    void add_child(std::string child_pid) {
        child_pids.push_back(child_pid);
    }

    std::string print_node(std::map<std::string, ProcessNode*>& ptr) {
        std::string out = "{";
        out += "\"pid\":" + pid;
        out += ",\"name\":\"" + std::string(name) + "\"";
        out += ",\"children\":[";

        bool first = true;
        for (auto& child_pid : child_pids) {
            if (!first) out += ",";
            else first = false;

            if (ptr.count(child_pid)) out += ptr[child_pid]->print_node(ptr);
            else out += child_pid + " ";
        }

        out += "]}";
        return out;
    }
};

bool has_only_digits(const std::string& str) {
    return std::all_of(str.begin(), str.end(), ::isdigit);
}

std::pair<std::string, std::string> get_parent_pid_and_process_name(std::string pid) {
    const std::filesystem::path pid_path {"/proc/" + pid + "/status"};
    std::ifstream input_file(pid_path);

    std::string parent_pid;
    std::string process_name;

    for (int i = 0; i < 7; ++i) {
        std::string status_line;
        std::getline(input_file, status_line);

        if (i == 0) {
            process_name = status_line.substr(6);
        } else if (i == 6) {
            parent_pid = status_line.substr(6);
        }
    }

    return {parent_pid, process_name};
}

int main() {
    std::map<std::string, ProcessNode*> process_tree;
    std::vector<std::string> root_processes;

    for (const auto& dir_entry : std::filesystem::directory_iterator{"/proc"}) {
        if (dir_entry.is_directory()) {
            std::string pid_string = dir_entry.path().filename().string();
            if (!has_only_digits(pid_string)) continue;

            std::pair<std::string, std::string> parent_pid_and_process_name = get_parent_pid_and_process_name(pid_string);
            std::string parent_pid = parent_pid_and_process_name.first;
            std::string process_name = parent_pid_and_process_name.second;

            ProcessNode* process_node;
            if (process_tree.count(pid_string)) {
                process_node = process_tree[pid_string];
                process_node->name = process_name;
            } else {
                process_node = new ProcessNode(pid_string, process_name);
                process_tree[pid_string] = process_node;
            }

            if (parent_pid == "0") root_processes.push_back(pid_string);

            if (!process_tree.count(parent_pid)) {
                process_tree[parent_pid] = new ProcessNode(parent_pid, "");
            }
            process_tree[parent_pid]->add_child(pid_string);
        }
    }

    std::cout << "[";
    bool first = true;
    for (const auto& root_process : root_processes) {
        if (!first) std::cout << ",";
        else first = false;
        std::cout << process_tree[root_process]->print_node(process_tree);
    }
    std::cout << "]";

    for (auto& process : process_tree) delete process.second;

  return 0;
}
