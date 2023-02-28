#include <iostream>
#include <string>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char** argv) {
    // Check if the user provided a file path argument
    if (argc != 2) {
        // If not, exit with an error code
        return -1;
    }
    // Extract the file path from the argument vector
    std::string path = argv[1];

    // Get file permissions
    struct statx stx;
    statx(AT_FDCWD, path.c_str(), AT_SYMLINK_NOFOLLOW, STATX_MODE, &stx);
    // Print file permissions
    std::cout << (stx.stx_mode & S_IRUSR  ? "r" : "-") << (stx.stx_mode & S_IWUSR  ? "w" : "-") << (stx.stx_mode & S_IXUSR  ? "x" : "-");
    std::cout << (stx.stx_mode & S_IRGRP  ? "r" : "-") << (stx.stx_mode & S_IWGRP  ? "w" : "-") << (stx.stx_mode & S_IXGRP  ? "x" : "-");
    std::cout << (stx.stx_mode & S_IROTH  ? "r" : "-") << (stx.stx_mode & S_IWOTH  ? "w" : "-") << (stx.stx_mode & S_IXOTH  ? "x" : "-") << "\n";

    // Get file owner and group ID
    statx(AT_FDCWD, path.c_str(), AT_SYMLINK_NOFOLLOW, STATX_GID | STATX_UID, &stx);
    // Print file owner and group ID
    std::cout << "UID: " << stx.stx_uid << ", GID: " << stx.stx_gid << '\n';

    // Get file size
    statx(AT_FDCWD, path.c_str(), AT_SYMLINK_NOFOLLOW, STATX_SIZE, &stx);
    // Print file size
    std::cout << "Size: " << stx.stx_size << '\n';

    return 0;
}
