#include <iostream>
#include <filesystem>
#include <math.h>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include<vector>
#include <fstream>
#include <algorithm>
#include <dirent.h>
extern "C" {
  #include <unistd.h>
	#include <sys/syscall.h>
}
using namespace std;
namespace fs = filesystem;
using namespace fs;
bool isNumber(const string& str) {
	for(char const &c : str) {
		if(std::isdigit(c) == 0) return false;
  }
  return true;
}

int main() {
	cout << "[";
	path proc("/proc");
	bool first = true;
	for(const auto& entry : directory_iterator(proc)) {
		if(isNumber(entry.path().filename())) {
			string pid = entry.path().filename();
			path exe("/proc/" + pid + "/exe"), cwd("/proc/" + pid + "/cwd"), base("/proc/" + pid + "/map_files");
			try {
				if(exists(exe) && exists(cwd)) {          
					if(first) {
						first = false;
					}
					else {
						cout << ",";
					}
					cout << "{" << "\"pid\":" << pid << "," << "\"exe\":" << read_symlink(exe) << "," << "\"cwd\":" << read_symlink(cwd) << ",";
					vector<unsigned long int> adress = {};
					for(const auto& entry1 : directory_iterator(base)) {
						string name = entry1.path().filename();
						string address = name.substr(0, name.find("-"));
						unsigned long int x;
						stringstream s1;
						s1 << hex << address;
						s1 >> x;
						adress.push_back(x);  
					}
					unsigned long int min = *min_element(adress.begin(), adress.end(),
																							 [&] (const unsigned long int& a, const unsigned long int& b) {
																											return a < b;
																							 });          
					cout << "\"base_adresse\":" << min << ",";
					ifstream status("/proc/" + pid + "/status");
					vector<string> state = {};
					for(string line; getline(status, line);) {
						state.push_back(line); 
					}                   
					string str = state.at(2);
					cout << "\"state\":" << "\"" << str.at(7) << "\",";
					ifstream cmdline("/proc/" + pid + "/cmdline");
					vector<string> help = {};
					for(string line; getline(cmdline, line);) {
						help.push_back(line);
					}
					string line2 = help.at(0);
					vector<string> commandline = {};
					string current_cmd = "";
					for(size_t i = 0; i < line2.length(); i++) {
						if(line2[i] == '\0') {
							commandline.push_back(current_cmd);
							current_cmd = "";
						}
						else {
							current_cmd += line2[i];
						}
					}
					cout << "\"cmdline\":[";
					for(size_t i = 0; i < commandline.size(); i++) {
						cout << "\"" << commandline.at(i) << "\"";
						if(i != commandline.size()-1) {
							cout << ",";
						}
					}
					cout << "]}";
				}
			} catch(const std::exception& e) {
				continue;
			}
		}      
	}
	cout << "]";
  return 0;
}
