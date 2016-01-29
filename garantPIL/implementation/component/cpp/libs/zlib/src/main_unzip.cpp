#include "shared/Core/fix/mpcxc.h"
#include "pack.h"

#include <iostream>
#include <cstdlib>

const unsigned int EXTRAFSIZE = 65536;
const unsigned int EXTRAPRATIO = 10;

int main(int argc, char* argv[]) {

try {
  int fd = ace_os_open (argv[1], O_RDONLY);
  if (fd == -1) throw std::logic_error ("bad open file");
  long fsize = ace_os_filesize (fd);
  if (fsize < 0) throw std::logic_error ("bad file size");
  char* buf = new char [fsize];
  int res = ace_os_read (fd, buf, fsize);
  ace_os_close (fd);
  
  if (res != int(fsize)) throw std::logic_error ("bad file read");
  char* unpacked_buf = new char [EXTRAPRATIO*fsize+EXTRAFSIZE];
  unsigned int unpacked_fsize = Zip::UnZip (buf, fsize, unpacked_buf, EXTRAPRATIO*fsize+EXTRAFSIZE);
  if (unpacked_fsize == 0) throw std::logic_error ("bad unzip");

  int fdout = ace_os_open (argv[2], O_CREAT | O_TRUNC | O_WRONLY);
  if (fdout == -1) throw std::logic_error ("bad create file");
  int resout = ace_os_write (fdout, unpacked_buf, unpacked_fsize);
  if (resout != int(unpacked_fsize)) throw std::logic_error ("bad file write");
  ace_os_close (fdout);
  
  delete [] buf;
  delete [] unpacked_buf;
  return 0;
}
catch (std::logic_error& e) {
  std::cerr<<e.what ()<<std::endl;
  return 1;
}  
}
