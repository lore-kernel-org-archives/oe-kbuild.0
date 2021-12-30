Content-Type: multipart/mixed; boundary="===============2139239178966787054=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v1 1/3] io_uring: Rename `io_{send, recv}` to `io_{sendto, recvfrom}`
Date: Fri, 31 Dec 2021 00:54:48 +0800
Message-ID: <202112310016.rALniPPT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2139239178966787054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211230013250.103267-1-ammar.faizi@intel.com>
References: <20211230013250.103267-1-ammar.faizi@intel.com>
TO: Ammar Faizi <ammarfaizi2@gmail.com>

Hi Ammar,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on aafc6e6eba29c890b0031267fc37c43490447c81]

url:    https://github.com/0day-ci/linux/commits/Ammar-Faizi/io_uring-Add-s=
endto-2-and-recvfrom-2-support/20211230-093703
base:   aafc6e6eba29c890b0031267fc37c43490447c81
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-m021-20211230 (https://download.01.org/0day-ci/arch=
ive/20211231/202112310016.rALniPPT-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/io_uring.c:5550 io_recvfrom() error: uninitialized symbol 'flags'.

Old smatch warnings:
fs/io_uring.c:6364 io_timeout_cancel() warn: passing a valid pointer to 'PT=
R_ERR'
fs/io_uring.c:6421 io_timeout_update() warn: passing a valid pointer to 'PT=
R_ERR'
fs/io_uring.c:8722 io_sqe_files_register() error: we previously assumed 'ct=
x->file_data' could be null (see line 8694)

vim +/flags +5550 fs/io_uring.c

0fa03c624d8fc9 Jens Axboe        2019-04-19  5501  =

9cfe685bad5431 Ammar Faizi       2021-12-30  5502  static int io_recvfrom(s=
truct io_kiocb *req, unsigned int issue_flags)
fddafacee287b3 Jens Axboe        2020-01-04  5503  {
6b754c8b912a16 Pavel Begunkov    2020-07-16  5504  	struct io_buffer *kbuf;
fddafacee287b3 Jens Axboe        2020-01-04  5505  	struct io_sr_msg *sr =
=3D &req->sr_msg;
fddafacee287b3 Jens Axboe        2020-01-04  5506  	struct msghdr msg;
7a7cacba8b4560 Pavel Begunkov    2020-07-16  5507  	void __user *buf =3D sr=
->buf;
7a7cacba8b4560 Pavel Begunkov    2020-07-16  5508  	struct socket *sock;
fddafacee287b3 Jens Axboe        2020-01-04  5509  	struct iovec iov;
fddafacee287b3 Jens Axboe        2020-01-04  5510  	unsigned flags;
d1fd1c201d7507 Pavel Begunkov    2021-12-05  5511  	int ret, min_ret =3D 0;
45d189c6062922 Pavel Begunkov    2021-02-10  5512  	bool force_nonblock =3D=
 issue_flags & IO_URING_F_NONBLOCK;
7a7cacba8b4560 Pavel Begunkov    2020-07-16  5513  =

dba4a9256bb4d7 Florent Revest    2020-12-04  5514  	sock =3D sock_from_file=
(req->file);
7a7cacba8b4560 Pavel Begunkov    2020-07-16  5515  	if (unlikely(!sock))
dba4a9256bb4d7 Florent Revest    2020-12-04  5516  		return -ENOTSOCK;
fddafacee287b3 Jens Axboe        2020-01-04  5517  =

bc02ef3325e3ef Pavel Begunkov    2020-07-16  5518  	if (req->flags & REQ_F_=
BUFFER_SELECT) {
51aac424aef980 Pavel Begunkov    2021-10-14  5519  		kbuf =3D io_recv_buffe=
r_select(req, issue_flags);
bcda7baaa3f15c Jens Axboe        2020-02-23  5520  		if (IS_ERR(kbuf))
bcda7baaa3f15c Jens Axboe        2020-02-23  5521  			return PTR_ERR(kbuf);
bcda7baaa3f15c Jens Axboe        2020-02-23  5522  		buf =3D u64_to_user_pt=
r(kbuf->addr);
bcda7baaa3f15c Jens Axboe        2020-02-23  5523  	}
fddafacee287b3 Jens Axboe        2020-01-04  5524  =

7a7cacba8b4560 Pavel Begunkov    2020-07-16  5525  	ret =3D import_single_r=
ange(READ, buf, sr->len, &iov, &msg.msg_iter);
14c32eee928662 Pavel Begunkov    2020-07-16  5526  	if (unlikely(ret))
14c32eee928662 Pavel Begunkov    2020-07-16  5527  		goto out_free;
fddafacee287b3 Jens Axboe        2020-01-04  5528  =

fddafacee287b3 Jens Axboe        2020-01-04  5529  	msg.msg_name =3D NULL;
fddafacee287b3 Jens Axboe        2020-01-04  5530  	msg.msg_control =3D NUL=
L;
fddafacee287b3 Jens Axboe        2020-01-04  5531  	msg.msg_controllen =3D =
0;
fddafacee287b3 Jens Axboe        2020-01-04  5532  	msg.msg_namelen =3D 0;
fddafacee287b3 Jens Axboe        2020-01-04  5533  	msg.msg_iocb =3D NULL;
fddafacee287b3 Jens Axboe        2020-01-04  5534  	msg.msg_flags =3D 0;
fddafacee287b3 Jens Axboe        2020-01-04  5535  =

044118069a23fd Pavel Begunkov    2021-04-01  5536  	flags =3D req->sr_msg.m=
sg_flags;
044118069a23fd Pavel Begunkov    2021-04-01  5537  	if (force_nonblock)
fddafacee287b3 Jens Axboe        2020-01-04  5538  		flags |=3D MSG_DONTWAI=
T;
0031275d119efe Stefan Metzmacher 2021-03-20  5539  	if (flags & MSG_WAITALL)
0031275d119efe Stefan Metzmacher 2021-03-20  5540  		min_ret =3D iov_iter_c=
ount(&msg.msg_iter);
0031275d119efe Stefan Metzmacher 2021-03-20  5541  =

0b7b21e42ba2d6 Jens Axboe        2020-01-31  5542  	ret =3D sock_recvmsg(so=
ck, &msg, flags);
7297ce3d59449d Pavel Begunkov    2021-11-23  5543  out_free:
7297ce3d59449d Pavel Begunkov    2021-11-23  5544  	if (ret < min_ret) {
7297ce3d59449d Pavel Begunkov    2021-11-23  5545  		if (ret =3D=3D -EAGAIN=
 && force_nonblock)
fddafacee287b3 Jens Axboe        2020-01-04  5546  			return -EAGAIN;
fddafacee287b3 Jens Axboe        2020-01-04  5547  		if (ret =3D=3D -ERESTA=
RTSYS)
fddafacee287b3 Jens Axboe        2020-01-04  5548  			ret =3D -EINTR;
7297ce3d59449d Pavel Begunkov    2021-11-23  5549  		req_set_fail(req);
7297ce3d59449d Pavel Begunkov    2021-11-23 @5550  	} else if ((flags & MSG=
_WAITALL) && (msg.msg_flags & (MSG_TRUNC | MSG_CTRUNC))) {
7297ce3d59449d Pavel Begunkov    2021-11-23  5551  		req_set_fail(req);
7297ce3d59449d Pavel Begunkov    2021-11-23  5552  	}
d1fd1c201d7507 Pavel Begunkov    2021-12-05  5553  =

d1fd1c201d7507 Pavel Begunkov    2021-12-05  5554  	__io_req_complete(req, =
issue_flags, ret, io_put_kbuf(req));
fddafacee287b3 Jens Axboe        2020-01-04  5555  	return 0;
fddafacee287b3 Jens Axboe        2020-01-04  5556  }
fddafacee287b3 Jens Axboe        2020-01-04  5557  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2139239178966787054==--

