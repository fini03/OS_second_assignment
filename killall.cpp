#include <iostream>
#include <filesystem>
#include <math.h>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <fstream>
#include <algorithm>
#include <dirent.h>
#include <map>
#include <string>
#include <string_view>
#include <signal.h>
#include <string>
extern "C" {
    #include <unistd.h>
    #include <sys/syscall.h>
}
using namespace std;
namespace fs = filesystem;
using namespace fs;
using namespace std;

bool isNumber(const string& str) {
	for(char const &c : str) {
		if(std::isdigit(c) == 0) return false;
  }
  return true;
}
string name(string pid) {
	ifstream status("/proc/" + pid + "/status");
  vector<string> state;
  for(string line; getline(status, line);) {
		state.push_back(line); 
  }                           
  string str = state.at(0);
  return str.substr(6);
}
int main(int argc, char** argv) {
	if(argc != 2) {
		return -1;
  }
  path proc("/proc");
  for(const auto & entry : directory_iterator(proc)) {
		if(isNumber(entry.path().filename())) {  
			string pid = entry.path().filename();
      string name_s = name(pid);     
			if(name_s.find(argv[1]) != string::npos) {
				kill(stoi(pid), SIGKILL);
      }
		}
	}
  return 0;
}
