Content-Type: multipart/mixed; boundary="===============3251775651552968247=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-5.18/io_uring 19/25] fs/io_uring.c:4338:42-56: duplicated argument to && or ||
Date: Sat, 12 Mar 2022 03:22:42 +0800
Message-ID: <202203120306.eNEnYxKX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3251775651552968247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.18/io_uring
head:   bcbb7bf6ccde7cb969a5642879832bc84ebf06a3
commit: 4f57f06ce2186c31c3da52386125dc57b1cd6f96 [19/25] io_uring: add supp=
ort for IORING_OP_MSG_RING command
:::::: branch date: 23 hours ago
:::::: commit date: 27 hours ago
config: csky-randconfig-c004-20220310 (https://download.01.org/0day-ci/arch=
ive/20220312/202203120306.eNEnYxKX-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/io_uring.c:4338:42-56: duplicated argument to && or ||

vim +4338 fs/io_uring.c

2b188cc1bb857a Jens Axboe 2019-01-07  4334  =

4f57f06ce2186c Jens Axboe 2022-03-10  4335  static int io_msg_ring_prep(str=
uct io_kiocb *req,
4f57f06ce2186c Jens Axboe 2022-03-10  4336  			    const struct io_uring_sq=
e *sqe)
4f57f06ce2186c Jens Axboe 2022-03-10  4337  {
4f57f06ce2186c Jens Axboe 2022-03-10 @4338  	if (unlikely(sqe->addr || sqe-=
>ioprio || sqe->buf_index ||
4f57f06ce2186c Jens Axboe 2022-03-10  4339  		     sqe->rw_flags || sqe->sp=
lice_fd_in || sqe->buf_index ||
4f57f06ce2186c Jens Axboe 2022-03-10  4340  		     sqe->personality))
4f57f06ce2186c Jens Axboe 2022-03-10  4341  		return -EINVAL;
4f57f06ce2186c Jens Axboe 2022-03-10  4342  =

4f57f06ce2186c Jens Axboe 2022-03-10  4343  	if (req->file->f_op !=3D &io_u=
ring_fops)
4f57f06ce2186c Jens Axboe 2022-03-10  4344  		return -EBADFD;
4f57f06ce2186c Jens Axboe 2022-03-10  4345  =

4f57f06ce2186c Jens Axboe 2022-03-10  4346  	req->msg.user_data =3D READ_ON=
CE(sqe->off);
4f57f06ce2186c Jens Axboe 2022-03-10  4347  	req->msg.len =3D READ_ONCE(sqe=
->len);
4f57f06ce2186c Jens Axboe 2022-03-10  4348  	return 0;
4f57f06ce2186c Jens Axboe 2022-03-10  4349  }
4f57f06ce2186c Jens Axboe 2022-03-10  4350  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3251775651552968247==--

