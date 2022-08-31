#include <iostream> 
#include <string> 
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h> 
using namespace std;
int main(int argc, char** argv) {
	if(argc != 2) {
		return -1;
  }
	string path = argv[1];
	struct statx stx;
	statx(AT_FDCWD, path.c_str(), AT_SYMLINK_NOFOLLOW, STATX_MODE, &stx);
	std::cout << (stx.stx_mode & S_IRUSR  ? "r" : "-") << (stx.stx_mode & S_IWUSR  ? "w" : "-") << (stx.stx_mode & S_IXUSR  ? "x" : "-");
	std::cout << (stx.stx_mode & S_IRGRP  ? "r" : "-") << (stx.stx_mode & S_IWGRP  ? "w" : "-") << (stx.stx_mode & S_IXGRP  ? "x" : "-");
	std::cout << (stx.stx_mode & S_IROTH  ? "r" : "-") << (stx.stx_mode & S_IWOTH  ? "w" : "-") << (stx.stx_mode & S_IXOTH  ? "x" : "-") << "\n";
	
	statx(AT_FDCWD, path.c_str(), AT_SYMLINK_NOFOLLOW, STATX_GID | STATX_UID, &stx);
	std::cout << "UID: " << stx.stx_uid << ", GID: " << stx.stx_gid  << '\n';
	
	statx(AT_FDCWD, path.c_str(), AT_SYMLINK_NOFOLLOW, STATX_SIZE, &stx);
	std::cout << "Size: " << stx.stx_size << '\n';
	return 0;
}