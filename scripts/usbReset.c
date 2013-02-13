#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <linux/usbdevice_fs.h>
//Thanks to http://www.roman10.net/how-to-reset-usb-device-in-linux/
void main(int argc, char **argv)
{
  const char *filename;
  int fd;
  filename = argv[1];
  fd = open(filename, O_WRONLY);
  ioctl(fd, USBDEVFS_RESET, 0);
  close(fd);
  return;
}
