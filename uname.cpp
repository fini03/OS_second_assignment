#include <iostream>
#include <sys/utsname.h>

int main() {
    // Declare a struct to hold system information
    struct utsname sysinfo;
    // Call uname() to populate the sysinfo struct with the current system information
    uname(&sysinfo);

    // Output the name of the operating system
    std::cout << "OS: " << sysinfo.sysname << "\n";
    // Output the hostname of the current system
    std::cout << "Hostname: " << sysinfo.nodename << "\n";
    // Output the release version of the operating system
    std::cout << "Release: " << sysinfo.release << "\n";
    // Output the version of the operating system
    std::cout << "Version: " << sysinfo.version << "\n";

    return 0;
}
