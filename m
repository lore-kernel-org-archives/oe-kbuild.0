Content-Type: multipart/mixed; boundary="===============2916246776312538738=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:testing/io_uring-sendto-recvfrom.v1 3/5] fs/io_uring.c:5238 io_recvfrom() error: uninitialized symbol 'flags'.
Date: Sat, 29 Jan 2022 19:46:23 +0800
Message-ID: <202201291904.XsrR06KW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2916246776312538738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block testing/io_uring-sendto-=
recvfrom.v1
head:   68d110c39241b887ec388cd3316dbedb85b0cbcf
commit: 8d597f720657a5156c4b3cbced8d1571ba151f62 [3/5] io_uring: Rename `io=
_{send,recv}` to `io_{sendto,recvfrom}`
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20129/202201291904.XsrR06KW-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/io_uring.c:5238 io_recvfrom() error: uninitialized symbol 'flags'.

Old smatch warnings:
fs/io_uring.c:8422 io_sqe_files_register() error: we previously assumed 'ct=
x->file_data' could be null (see line 8394)

vim +/flags +5238 fs/io_uring.c

0fa03c624d8fc9 Jens Axboe        2019-04-19  5189  =

8d597f720657a5 Ammar Faizi       2022-01-07  5190  static int io_recvfrom(s=
truct io_kiocb *req, unsigned int issue_flags)
fddafacee287b3 Jens Axboe        2020-01-04  5191  {
6b754c8b912a16 Pavel Begunkov    2020-07-16  5192  	struct io_buffer *kbuf;
fddafacee287b3 Jens Axboe        2020-01-04  5193  	struct io_sr_msg *sr =
=3D &req->sr_msg;
fddafacee287b3 Jens Axboe        2020-01-04  5194  	struct msghdr msg;
7a7cacba8b4560 Pavel Begunkov    2020-07-16  5195  	void __user *buf =3D sr=
->buf;
7a7cacba8b4560 Pavel Begunkov    2020-07-16  5196  	struct socket *sock;
fddafacee287b3 Jens Axboe        2020-01-04  5197  	struct iovec iov;
fddafacee287b3 Jens Axboe        2020-01-04  5198  	unsigned flags;
d1fd1c201d7507 Pavel Begunkov    2021-12-05  5199  	int ret, min_ret =3D 0;
45d189c6062922 Pavel Begunkov    2021-02-10  5200  	bool force_nonblock =3D=
 issue_flags & IO_URING_F_NONBLOCK;
7a7cacba8b4560 Pavel Begunkov    2020-07-16  5201  =

dba4a9256bb4d7 Florent Revest    2020-12-04  5202  	sock =3D sock_from_file=
(req->file);
7a7cacba8b4560 Pavel Begunkov    2020-07-16  5203  	if (unlikely(!sock))
dba4a9256bb4d7 Florent Revest    2020-12-04  5204  		return -ENOTSOCK;
fddafacee287b3 Jens Axboe        2020-01-04  5205  =

bc02ef3325e3ef Pavel Begunkov    2020-07-16  5206  	if (req->flags & REQ_F_=
BUFFER_SELECT) {
51aac424aef980 Pavel Begunkov    2021-10-14  5207  		kbuf =3D io_recv_buffe=
r_select(req, issue_flags);
bcda7baaa3f15c Jens Axboe        2020-02-23  5208  		if (IS_ERR(kbuf))
bcda7baaa3f15c Jens Axboe        2020-02-23  5209  			return PTR_ERR(kbuf);
bcda7baaa3f15c Jens Axboe        2020-02-23  5210  		buf =3D u64_to_user_pt=
r(kbuf->addr);
bcda7baaa3f15c Jens Axboe        2020-02-23  5211  	}
fddafacee287b3 Jens Axboe        2020-01-04  5212  =

7a7cacba8b4560 Pavel Begunkov    2020-07-16  5213  	ret =3D import_single_r=
ange(READ, buf, sr->len, &iov, &msg.msg_iter);
14c32eee928662 Pavel Begunkov    2020-07-16  5214  	if (unlikely(ret))
14c32eee928662 Pavel Begunkov    2020-07-16  5215  		goto out_free;
fddafacee287b3 Jens Axboe        2020-01-04  5216  =

fddafacee287b3 Jens Axboe        2020-01-04  5217  	msg.msg_name =3D NULL;
fddafacee287b3 Jens Axboe        2020-01-04  5218  	msg.msg_control =3D NUL=
L;
fddafacee287b3 Jens Axboe        2020-01-04  5219  	msg.msg_controllen =3D =
0;
fddafacee287b3 Jens Axboe        2020-01-04  5220  	msg.msg_namelen =3D 0;
fddafacee287b3 Jens Axboe        2020-01-04  5221  	msg.msg_iocb =3D NULL;
fddafacee287b3 Jens Axboe        2020-01-04  5222  	msg.msg_flags =3D 0;
fddafacee287b3 Jens Axboe        2020-01-04  5223  =

044118069a23fd Pavel Begunkov    2021-04-01  5224  	flags =3D req->sr_msg.m=
sg_flags;
044118069a23fd Pavel Begunkov    2021-04-01  5225  	if (force_nonblock)
fddafacee287b3 Jens Axboe        2020-01-04  5226  		flags |=3D MSG_DONTWAI=
T;
0031275d119efe Stefan Metzmacher 2021-03-20  5227  	if (flags & MSG_WAITALL)
0031275d119efe Stefan Metzmacher 2021-03-20  5228  		min_ret =3D iov_iter_c=
ount(&msg.msg_iter);
0031275d119efe Stefan Metzmacher 2021-03-20  5229  =

0b7b21e42ba2d6 Jens Axboe        2020-01-31  5230  	ret =3D sock_recvmsg(so=
ck, &msg, flags);
7297ce3d59449d Pavel Begunkov    2021-11-23  5231  out_free:
7297ce3d59449d Pavel Begunkov    2021-11-23  5232  	if (ret < min_ret) {
7297ce3d59449d Pavel Begunkov    2021-11-23  5233  		if (ret =3D=3D -EAGAIN=
 && force_nonblock)
fddafacee287b3 Jens Axboe        2020-01-04  5234  			return -EAGAIN;
fddafacee287b3 Jens Axboe        2020-01-04  5235  		if (ret =3D=3D -ERESTA=
RTSYS)
fddafacee287b3 Jens Axboe        2020-01-04  5236  			ret =3D -EINTR;
93d2bcd2cbfed2 Pavel Begunkov    2021-05-16  5237  		req_set_fail(req);
7297ce3d59449d Pavel Begunkov    2021-11-23 @5238  	} else if ((flags & MSG=
_WAITALL) && (msg.msg_flags & (MSG_TRUNC | MSG_CTRUNC))) {
7297ce3d59449d Pavel Begunkov    2021-11-23  5239  		req_set_fail(req);
7297ce3d59449d Pavel Begunkov    2021-11-23  5240  	}
d1fd1c201d7507 Pavel Begunkov    2021-12-05  5241  =

d1fd1c201d7507 Pavel Begunkov    2021-12-05  5242  	__io_req_complete(req, =
issue_flags, ret, io_put_kbuf(req));
fddafacee287b3 Jens Axboe        2020-01-04  5243  	return 0;
fddafacee287b3 Jens Axboe        2020-01-04  5244  }
fddafacee287b3 Jens Axboe        2020-01-04  5245  =


:::::: The code@line 5238 was first introduced by commit
:::::: 7297ce3d59449de49d3c9e1f64ae25488750a1fc io_uring: improve send/recv=
 error handling

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2916246776312538738==--

