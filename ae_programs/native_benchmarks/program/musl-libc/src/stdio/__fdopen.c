#include "stdio_impl.h"
#include <stdlib.h>
#include <termios.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>

FILE *__fdopen(int fd, const char *mode)
{
	FILE *f;
	struct termios tio;

	/* Check for valid initial mode character */
	if (!strchr("rwa", *mode)) {
		errno = EINVAL;
		return 0;
	}
// printf("%s,%u",__FUNCTION__,__LINE__);
	/* Allocate FILE+buffer or fail */
	if (!(f=malloc(sizeof *f + UNGET + BUFSIZ))) return 0;

	/* Zero-fill only the struct, not the buffer */
	memset(f, 0, sizeof *f);
// printf("%s,%u",__FUNCTION__,__LINE__);
	/* Impose mode restrictions */
	if (!strchr(mode, '+')) f->flags = (*mode == 'r') ? F_NOWR : F_NORD;

	/* Apply close-on-exec flag */
	if (strchr(mode, 'e')) __syscall(SYS_fcntl, fd, F_SETFD, FD_CLOEXEC);
// printf("%s,%u",__FUNCTION__,__LINE__);
	/* Set append mode on fd if opened for append */
	if (*mode == 'a') {
		int flags = __syscall(SYS_fcntl, fd, F_GETFL);
		if (!(flags & O_APPEND))
			__syscall(SYS_fcntl, fd, F_SETFL, flags | O_APPEND);
		f->flags |= F_APP;
	}
// printf("%s,%u",__FUNCTION__,__LINE__);
	f->fd = fd;
	f->buf = (unsigned char *)f + sizeof *f + UNGET;
	f->buf_size = BUFSIZ;
// printf("%s,%u",__FUNCTION__,__LINE__);
	/* Activate line buffered mode for terminals */
	f->lbf = EOF;
	// if (!(f->flags & F_NOWR) && !__syscall(SYS_ioctl, fd, TCGETS, &tio))
	 	f->lbf = '\n';
// printf("%s,%u",__FUNCTION__,__LINE__);
	/* Initialize op ptrs. No problem if some are unneeded. */
	f->read = __stdio_read;
	f->write = __stdio_write;
	f->seek = __stdio_seek;
	f->close = __stdio_close;
// printf("%s,%u",__FUNCTION__,__LINE__);
	if (!libc.threaded) f->lock = -1;
// printf("%s,%u",__FUNCTION__,__LINE__);
	/* Add new FILE to open file list */
	OFLLOCK();
	f->next = libc.ofl_head;
	if (libc.ofl_head) libc.ofl_head->prev = f;
	libc.ofl_head = f;
	OFLUNLOCK();

	return f;
}

weak_alias(__fdopen, fdopen);
