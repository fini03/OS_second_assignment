#include <iostream>
#include <sys/utsname.h>
int main() {
	struct utsname sysinfo;
	uname(&sysinfo);
	std::cout << "OS: " << sysinfo.sysname << "\n";
	std::cout << "Hostname: " << sysinfo.nodename << "\n";
	std::cout << "Release: " << sysinfo.release << "\n";
	std::cout << "Version: " << sysinfo.version << "\n";
	return 0;
}
