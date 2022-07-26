Content-Type: multipart/mixed; boundary="===============3244214017112394340=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [isilence:zc_perf_tests 10/10] io_uring/net.c:1113 io_sendzc1() warn: ignoring unreachable code.
Date: Tue, 26 Jul 2022 15:16:59 +0800
Message-ID: <202207261540.tELcS8V6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3244214017112394340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux zc_perf_tests
head:   0909a53e1c81ca9432cbb58d15b87e500595bcbd
commit: 0909a53e1c81ca9432cbb58d15b87e500595bcbd [10/10] io_uring: simple zc
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20726/202207261540.tELcS8V6-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
io_uring/net.c:1113 io_sendzc1() warn: ignoring unreachable code.

vim +1113 io_uring/net.c

0909a53e1c81ca Pavel Begunkov 2022-07-24  1086  =

0909a53e1c81ca Pavel Begunkov 2022-07-24  1087  int io_sendzc1(struct io_ki=
ocb *req, unsigned int issue_flags)
0909a53e1c81ca Pavel Begunkov 2022-07-24  1088  {
0909a53e1c81ca Pavel Begunkov 2022-07-24  1089  	struct io_sendzc1 *zc =3D =
io_kiocb_to_cmd(req);
0909a53e1c81ca Pavel Begunkov 2022-07-24  1090  	struct msghdr msg;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1091  	struct iovec iov;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1092  	struct socket *sock;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1093  	unsigned msg_flags;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1094  	int ret, min_ret =3D 0;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1095  =

0909a53e1c81ca Pavel Begunkov 2022-07-24  1096  	sock =3D sock_from_file(re=
q->file);
0909a53e1c81ca Pavel Begunkov 2022-07-24  1097  	if (unlikely(!sock))
0909a53e1c81ca Pavel Begunkov 2022-07-24  1098  		return -ENOTSOCK;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1099  =

0909a53e1c81ca Pavel Begunkov 2022-07-24  1100  	msg.msg_name =3D NULL;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1101  	msg.msg_control =3D NULL;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1102  	msg.msg_controllen =3D 0;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1103  	msg.msg_namelen =3D 0;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1104  =

0909a53e1c81ca Pavel Begunkov 2022-07-24  1105  	if (req->imu) {
0909a53e1c81ca Pavel Begunkov 2022-07-24  1106  		ret =3D io_import_fixed(W=
RITE, &msg.msg_iter, req->imu,
0909a53e1c81ca Pavel Begunkov 2022-07-24  1107  				      (u64)(uintptr_t)z=
c->buf, zc->len);
0909a53e1c81ca Pavel Begunkov 2022-07-24  1108  		if (unlikely(ret))
0909a53e1c81ca Pavel Begunkov 2022-07-24  1109  			return ret;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1110  	} else {
0909a53e1c81ca Pavel Begunkov 2022-07-24  1111  		return -EFAULT;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1112  =

0909a53e1c81ca Pavel Begunkov 2022-07-24 @1113  		ret =3D import_single_ran=
ge(WRITE, zc->buf, zc->len, &iov,
0909a53e1c81ca Pavel Begunkov 2022-07-24  1114  					  &msg.msg_iter);
0909a53e1c81ca Pavel Begunkov 2022-07-24  1115  		if (unlikely(ret))
0909a53e1c81ca Pavel Begunkov 2022-07-24  1116  			return ret;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1117  		/* TODO: add pinning acco=
unting */
0909a53e1c81ca Pavel Begunkov 2022-07-24  1118  	}
0909a53e1c81ca Pavel Begunkov 2022-07-24  1119  =

0909a53e1c81ca Pavel Begunkov 2022-07-24  1120  	msg_flags =3D zc->msg_flag=
s | MSG_ZEROCOPY;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1121  	if (issue_flags & IO_URING=
_F_NONBLOCK)
0909a53e1c81ca Pavel Begunkov 2022-07-24  1122  		msg_flags |=3D MSG_DONTWA=
IT;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1123  	if (msg_flags & MSG_WAITAL=
L)
0909a53e1c81ca Pavel Begunkov 2022-07-24  1124  		min_ret =3D iov_iter_coun=
t(&msg.msg_iter);
0909a53e1c81ca Pavel Begunkov 2022-07-24  1125  =

0909a53e1c81ca Pavel Begunkov 2022-07-24  1126  	msg.msg_flags =3D msg_flag=
s;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1127  	msg.msg_ubuf =3D &zc->ubuf;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1128  	msg.sg_from_iter =3D io_sg=
_from_iter;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1129  	ret =3D sock_sendmsg(sock,=
 &msg);
0909a53e1c81ca Pavel Begunkov 2022-07-24  1130  =

0909a53e1c81ca Pavel Begunkov 2022-07-24  1131  	req->cqe.res =3D ret;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1132  	if (refcount_dec_and_test(=
&zc->ubuf.refcnt)) {
0909a53e1c81ca Pavel Begunkov 2022-07-24  1133  		io_req_set_res(req, req->=
cqe.res, 0);
0909a53e1c81ca Pavel Begunkov 2022-07-24  1134  		return IOU_OK;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1135  	}
0909a53e1c81ca Pavel Begunkov 2022-07-24  1136  	return IOU_ISSUE_SKIP_COMP=
LETE;
0909a53e1c81ca Pavel Begunkov 2022-07-24  1137  }
0909a53e1c81ca Pavel Begunkov 2022-07-24  1138  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3244214017112394340==--

