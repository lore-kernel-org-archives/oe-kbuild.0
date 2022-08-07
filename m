Content-Type: multipart/mixed; boundary="===============4567777091212932793=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: io_uring/net.c:235:23: warning: use of uninitialized value '*(int *)((char *)&msg + offsetof(struct msghdr, msg_control_is_user))' [CWE-457]
Date: Sun, 07 Aug 2022 13:52:58 +0800
Message-ID: <202208071316.9ggj3213-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4567777091212932793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: io_uring/=
net.c:235:23: warning: use of uninitialized value '*(int *)((char *)&msg + =
offsetof(struct msghdr, msg_control_is_user))' [CWE-457] [-Wanalyzer-use-of=
-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: f9ead18c10589a351f395ac5aa107360f2f6ce53 io_uring: split network re=
lated opcodes into its own file
date:   13 days ago
:::::: branch date: 5 hours ago
:::::: commit date: 13 days ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220807/202208071316.9ggj3213-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df9ead18c10589a351f395ac5aa107360f2f6ce53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f9ead18c10589a351f395ac5aa107360f2f6ce53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   io_uring/net.c: In function 'io_sendmsg':
   io_uring/net.c:177:32: warning: use of uninitialized value '*(int *)((ch=
ar *)&iomsg + offsetof(struct io_async_msghdr, fast_iov[6].iov_len))' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]
     177 |         struct io_async_msghdr iomsg, *kmsg;
         |                                ^~~~~
     'io_sendmsg': events 1-2
       |
       |  177 |         struct io_async_msghdr iomsg, *kmsg;
       |      |                                ^~~~~
       |      |                                |
       |      |                                (1) region created on stack =
here
       |      |                                (2) use of uninitialized val=
ue '*(int *)((char *)&iomsg + offsetof(struct io_async_msghdr, fast_iov[6].=
iov_len))' here
       |
   io_uring/net.c: In function 'io_send':
>> io_uring/net.c:235:23: warning: use of uninitialized value '*(int *)((ch=
ar *)&msg + offsetof(struct msghdr, msg_control_is_user))' [CWE-457] [-Wana=
lyzer-use-of-uninitialized-value]
     235 |         struct msghdr msg;
         |                       ^~~
     'io_send': events 1-2
       |
       |  235 |         struct msghdr msg;
       |      |                       ^~~
       |      |                       |
       |      |                       (1) region created on stack here
       |      |                       (2) use of uninitialized value '*(int=
 *)((char *)&msg + offsetof(struct msghdr, msg_control_is_user))' here
       |
   io_uring/net.c: In function '__io_recvmsg_copy_hdr':
>> io_uring/net.c:293:30: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     293 |         struct iovec __user *uiov;
         |                              ^~~~
     '__io_recvmsg_copy_hdr': event 1
       |
       |  293 |         struct iovec __user *uiov;
       |      |                              ^~~~
       |      |                              |
       |      |                              (1) use of uninitialized value=
 '<unknown>' here
       |
   io_uring/net.c:294:16: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     294 |         size_t iov_len;
         |                ^~~~~~~
     '__io_recvmsg_copy_hdr': event 1
       |
       |  294 |         size_t iov_len;
       |      |                ^~~~~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   io_uring/net.c: In function 'io_recvmsg':
   io_uring/net.c:415:32: warning: use of uninitialized value '*(int *)((ch=
ar *)&iomsg + offsetof(struct io_async_msghdr, fast_iov[6].iov_len))' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]
     415 |         struct io_async_msghdr iomsg, *kmsg;
         |                                ^~~~~
     'io_recvmsg': events 1-2
       |
       |  415 |         struct io_async_msghdr iomsg, *kmsg;
       |      |                                ^~~~~
       |      |                                |
       |      |                                (1) region created on stack =
here
       |      |                                (2) use of uninitialized val=
ue '*(int *)((char *)&iomsg + offsetof(struct io_async_msghdr, fast_iov[6].=
iov_len))' here
       |
   io_uring/net.c: In function 'io_recv':
   io_uring/net.c:492:23: warning: use of uninitialized value '*(int *)((ch=
ar *)&msg + offsetof(struct msghdr, msg_control_is_user))' [CWE-457] [-Wana=
lyzer-use-of-uninitialized-value]
     492 |         struct msghdr msg;
         |                       ^~~
     'io_recv': events 1-2
       |
       |  492 |         struct msghdr msg;
       |      |                       ^~~
       |      |                       |
       |      |                       (1) region created on stack here
       |      |                       (2) use of uninitialized value '*(int=
 *)((char *)&msg + offsetof(struct msghdr, msg_control_is_user))' here
       |

vim +235 io_uring/net.c

f9ead18c10589a Jens Axboe 2022-05-25  231  =

f9ead18c10589a Jens Axboe 2022-05-25  232  int io_send(struct io_kiocb *req=
, unsigned int issue_flags)
f9ead18c10589a Jens Axboe 2022-05-25  233  {
f9ead18c10589a Jens Axboe 2022-05-25  234  	struct io_sr_msg *sr =3D io_kio=
cb_to_cmd(req);
f9ead18c10589a Jens Axboe 2022-05-25 @235  	struct msghdr msg;
f9ead18c10589a Jens Axboe 2022-05-25  236  	struct iovec iov;
f9ead18c10589a Jens Axboe 2022-05-25  237  	struct socket *sock;
f9ead18c10589a Jens Axboe 2022-05-25  238  	unsigned flags;
f9ead18c10589a Jens Axboe 2022-05-25  239  	int min_ret =3D 0;
f9ead18c10589a Jens Axboe 2022-05-25  240  	int ret;
f9ead18c10589a Jens Axboe 2022-05-25  241  =

f9ead18c10589a Jens Axboe 2022-05-25  242  	if (!(req->flags & REQ_F_POLLED=
) &&
f9ead18c10589a Jens Axboe 2022-05-25  243  	    (sr->flags & IORING_RECVSEN=
D_POLL_FIRST))
f9ead18c10589a Jens Axboe 2022-05-25  244  		return -EAGAIN;
f9ead18c10589a Jens Axboe 2022-05-25  245  =

f9ead18c10589a Jens Axboe 2022-05-25  246  	sock =3D sock_from_file(req->fi=
le);
f9ead18c10589a Jens Axboe 2022-05-25  247  	if (unlikely(!sock))
f9ead18c10589a Jens Axboe 2022-05-25  248  		return -ENOTSOCK;
f9ead18c10589a Jens Axboe 2022-05-25  249  =

f9ead18c10589a Jens Axboe 2022-05-25  250  	ret =3D import_single_range(WRI=
TE, sr->buf, sr->len, &iov, &msg.msg_iter);
f9ead18c10589a Jens Axboe 2022-05-25  251  	if (unlikely(ret))
f9ead18c10589a Jens Axboe 2022-05-25  252  		return ret;
f9ead18c10589a Jens Axboe 2022-05-25  253  =

f9ead18c10589a Jens Axboe 2022-05-25  254  	msg.msg_name =3D NULL;
f9ead18c10589a Jens Axboe 2022-05-25  255  	msg.msg_control =3D NULL;
f9ead18c10589a Jens Axboe 2022-05-25  256  	msg.msg_controllen =3D 0;
f9ead18c10589a Jens Axboe 2022-05-25  257  	msg.msg_namelen =3D 0;
f9ead18c10589a Jens Axboe 2022-05-25  258  =

f9ead18c10589a Jens Axboe 2022-05-25  259  	flags =3D sr->msg_flags;
f9ead18c10589a Jens Axboe 2022-05-25  260  	if (issue_flags & IO_URING_F_NO=
NBLOCK)
f9ead18c10589a Jens Axboe 2022-05-25  261  		flags |=3D MSG_DONTWAIT;
f9ead18c10589a Jens Axboe 2022-05-25  262  	if (flags & MSG_WAITALL)
f9ead18c10589a Jens Axboe 2022-05-25  263  		min_ret =3D iov_iter_count(&ms=
g.msg_iter);
f9ead18c10589a Jens Axboe 2022-05-25  264  =

f9ead18c10589a Jens Axboe 2022-05-25  265  	msg.msg_flags =3D flags;
f9ead18c10589a Jens Axboe 2022-05-25  266  	ret =3D sock_sendmsg(sock, &msg=
);
f9ead18c10589a Jens Axboe 2022-05-25  267  	if (ret < min_ret) {
f9ead18c10589a Jens Axboe 2022-05-25  268  		if (ret =3D=3D -EAGAIN && (iss=
ue_flags & IO_URING_F_NONBLOCK))
f9ead18c10589a Jens Axboe 2022-05-25  269  			return -EAGAIN;
f9ead18c10589a Jens Axboe 2022-05-25  270  		if (ret =3D=3D -ERESTARTSYS)
f9ead18c10589a Jens Axboe 2022-05-25  271  			ret =3D -EINTR;
f9ead18c10589a Jens Axboe 2022-05-25  272  		if (ret > 0 && io_net_retry(so=
ck, flags)) {
f9ead18c10589a Jens Axboe 2022-05-25  273  			sr->len -=3D ret;
f9ead18c10589a Jens Axboe 2022-05-25  274  			sr->buf +=3D ret;
f9ead18c10589a Jens Axboe 2022-05-25  275  			sr->done_io +=3D ret;
f9ead18c10589a Jens Axboe 2022-05-25  276  			req->flags |=3D REQ_F_PARTIAL=
_IO;
f9ead18c10589a Jens Axboe 2022-05-25  277  			return -EAGAIN;
f9ead18c10589a Jens Axboe 2022-05-25  278  		}
f9ead18c10589a Jens Axboe 2022-05-25  279  		req_set_fail(req);
f9ead18c10589a Jens Axboe 2022-05-25  280  	}
f9ead18c10589a Jens Axboe 2022-05-25  281  	if (ret >=3D 0)
f9ead18c10589a Jens Axboe 2022-05-25  282  		ret +=3D sr->done_io;
f9ead18c10589a Jens Axboe 2022-05-25  283  	else if (sr->done_io)
f9ead18c10589a Jens Axboe 2022-05-25  284  		ret =3D sr->done_io;
f9ead18c10589a Jens Axboe 2022-05-25  285  	io_req_set_res(req, ret, 0);
f9ead18c10589a Jens Axboe 2022-05-25  286  	return IOU_OK;
f9ead18c10589a Jens Axboe 2022-05-25  287  }
f9ead18c10589a Jens Axboe 2022-05-25  288  =

f9ead18c10589a Jens Axboe 2022-05-25  289  static int __io_recvmsg_copy_hdr=
(struct io_kiocb *req,
f9ead18c10589a Jens Axboe 2022-05-25  290  				 struct io_async_msghdr *iom=
sg)
f9ead18c10589a Jens Axboe 2022-05-25  291  {
f9ead18c10589a Jens Axboe 2022-05-25  292  	struct io_sr_msg *sr =3D io_kio=
cb_to_cmd(req);
f9ead18c10589a Jens Axboe 2022-05-25 @293  	struct iovec __user *uiov;
f9ead18c10589a Jens Axboe 2022-05-25  294  	size_t iov_len;
f9ead18c10589a Jens Axboe 2022-05-25  295  	int ret;
f9ead18c10589a Jens Axboe 2022-05-25  296  =

f9ead18c10589a Jens Axboe 2022-05-25  297  	ret =3D __copy_msghdr_from_user=
(&iomsg->msg, sr->umsg,
f9ead18c10589a Jens Axboe 2022-05-25  298  					&iomsg->uaddr, &uiov, &iov_=
len);
f9ead18c10589a Jens Axboe 2022-05-25  299  	if (ret)
f9ead18c10589a Jens Axboe 2022-05-25  300  		return ret;
f9ead18c10589a Jens Axboe 2022-05-25  301  =

f9ead18c10589a Jens Axboe 2022-05-25  302  	if (req->flags & REQ_F_BUFFER_S=
ELECT) {
f9ead18c10589a Jens Axboe 2022-05-25  303  		if (iov_len > 1)
f9ead18c10589a Jens Axboe 2022-05-25  304  			return -EINVAL;
f9ead18c10589a Jens Axboe 2022-05-25  305  		if (copy_from_user(iomsg->fast=
_iov, uiov, sizeof(*uiov)))
f9ead18c10589a Jens Axboe 2022-05-25  306  			return -EFAULT;
f9ead18c10589a Jens Axboe 2022-05-25  307  		sr->len =3D iomsg->fast_iov[0]=
.iov_len;
f9ead18c10589a Jens Axboe 2022-05-25  308  		iomsg->free_iov =3D NULL;
f9ead18c10589a Jens Axboe 2022-05-25  309  	} else {
f9ead18c10589a Jens Axboe 2022-05-25  310  		iomsg->free_iov =3D iomsg->fas=
t_iov;
f9ead18c10589a Jens Axboe 2022-05-25  311  		ret =3D __import_iovec(READ, u=
iov, iov_len, UIO_FASTIOV,
f9ead18c10589a Jens Axboe 2022-05-25  312  				     &iomsg->free_iov, &ioms=
g->msg.msg_iter,
f9ead18c10589a Jens Axboe 2022-05-25  313  				     false);
f9ead18c10589a Jens Axboe 2022-05-25  314  		if (ret > 0)
f9ead18c10589a Jens Axboe 2022-05-25  315  			ret =3D 0;
f9ead18c10589a Jens Axboe 2022-05-25  316  	}
f9ead18c10589a Jens Axboe 2022-05-25  317  =

f9ead18c10589a Jens Axboe 2022-05-25  318  	return ret;
f9ead18c10589a Jens Axboe 2022-05-25  319  }
f9ead18c10589a Jens Axboe 2022-05-25  320  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4567777091212932793==--

