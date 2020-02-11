Content-Type: multipart/mixed; boundary="===============8464482255152448210=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-next:master 1282/1397] fs/io_uring.c:3728 io_poll_double_wake() error: uninitialized symbol 'ret'.
Date: Tue, 11 Feb 2020 15:48:25 +0300
Message-ID: <20200211124825.GB7838@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8464482255152448210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git__;!!GqivPVa7Brio!PGWMsjXmbbqZt_LPI1Vj4bMZj_O4v=
T5eESYZSXkbyGnBfwvTLA-a3S3cFPn9LN8IxQ$  master
head:   ac431e2d7b1be81bfe58163b9f81ba79bc987dc3
commit: 2b10058375d18e69d14955888fd55591cc553582 [1282/1397] io_uring: allo=
w POLL_ADD with double poll_wait() users

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/io_uring.c:3728 io_poll_double_wake() error: uninitialized symbol 'ret'.

Old smatch warnings:
fs/io_uring.c:2191 io_setup_async_rw() error: we previously assumed 'req->i=
o' could be null (see line 2187)
fs/io_uring.c:5949 __io_sqe_files_update() error: uninitialized symbol 'err=
'.

# https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/g=
it/next/linux-next.git/commit/?id=3D2b10058375d18e69d14955888fd55591cc55358=
2__;!!GqivPVa7Brio!PGWMsjXmbbqZt_LPI1Vj4bMZj_O4vT5eESYZSXkbyGnBfwvTLA-a3S3c=
FPnHp1qyaA$ =

git remote add linux-next https://urldefense.com/v3/__https://git.kernel.or=
g/pub/scm/linux/kernel/git/next/linux-next.git__;!!GqivPVa7Brio!PGWMsjXmbbq=
Zt_LPI1Vj4bMZj_O4vT5eESYZSXkbyGnBfwvTLA-a3S3cFPn9LN8IxQ$ =

git remote update linux-next
git checkout 2b10058375d18e69d14955888fd55591cc553582
vim +/ret +3728 fs/io_uring.c

2b10058375d18e Jens Axboe 2020-02-10  3703  static int io_poll_double_wake(=
struct wait_queue_entry *wait, unsigned mode,
2b10058375d18e Jens Axboe 2020-02-10  3704  			       int sync, void *key)
2b10058375d18e Jens Axboe 2020-02-10  3705  {
2b10058375d18e Jens Axboe 2020-02-10  3706  	struct io_kiocb *req =3D wait-=
>private;
2b10058375d18e Jens Axboe 2020-02-10  3707  	struct io_poll_iocb *poll =3D =
(void *) req->io;
2b10058375d18e Jens Axboe 2020-02-10  3708  	__poll_t mask =3D key_to_poll(=
key);
2b10058375d18e Jens Axboe 2020-02-10  3709  	bool done =3D true;
2b10058375d18e Jens Axboe 2020-02-10  3710  	int ret;
2b10058375d18e Jens Axboe 2020-02-10  3711  =

2b10058375d18e Jens Axboe 2020-02-10  3712  	/* for instances that support =
it check for an event match first: */
2b10058375d18e Jens Axboe 2020-02-10  3713  	if (mask && !(mask & poll->eve=
nts))
2b10058375d18e Jens Axboe 2020-02-10  3714  		return 0;
2b10058375d18e Jens Axboe 2020-02-10  3715  =

2b10058375d18e Jens Axboe 2020-02-10  3716  	if (req->poll.head) {
2b10058375d18e Jens Axboe 2020-02-10  3717  		unsigned long flags;
2b10058375d18e Jens Axboe 2020-02-10  3718  =

2b10058375d18e Jens Axboe 2020-02-10  3719  		spin_lock_irqsave(&req->poll.=
head->lock, flags);
2b10058375d18e Jens Axboe 2020-02-10  3720  		done =3D list_empty(&req->pol=
l.wait.entry);
2b10058375d18e Jens Axboe 2020-02-10  3721  		if (!done)
2b10058375d18e Jens Axboe 2020-02-10  3722  			list_del_init(&req->poll.wai=
t.entry);
2b10058375d18e Jens Axboe 2020-02-10  3723  		spin_unlock_irqrestore(&req->=
poll.head->lock, flags);
2b10058375d18e Jens Axboe 2020-02-10  3724  	}
2b10058375d18e Jens Axboe 2020-02-10  3725  	if (!done)
2b10058375d18e Jens Axboe 2020-02-10  3726  		__io_poll_wake(req, poll, mas=
k);
2b10058375d18e Jens Axboe 2020-02-10  3727  	refcount_dec(&req->refs);
2b10058375d18e Jens Axboe 2020-02-10 @3728  	return ret;

return 0;

2b10058375d18e Jens Axboe 2020-02-10  3729  }
2b10058375d18e Jens Axboe 2020-02-10  3730  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://urldefense.com/v3/__https://lists.01.org/hyperkitty/list/kbuild-all=
(a)lists.01.org__;!!GqivPVa7Brio!PGWMsjXmbbqZt_LPI1Vj4bMZj_O4vT5eESYZSXkbyG=
nBfwvTLA-a3S3cFPn5mEgCTQ$=20
--===============8464482255152448210==--

