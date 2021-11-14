Content-Type: multipart/mixed; boundary="===============4220355287880490071=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/io_uring.c:1407:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Sun, 14 Nov 2021 17:54:03 +0800
Message-ID: <202111141738.gZi0bfKc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4220355287880490071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Pavel Begunkov <asml.silence@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c8c109546a19613d323a319d0c921cb1f317e629
commit: f237c30a5610d35a584f3296d397b93d80ce374e io_uring: batch task work =
locking
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
compiler: mips64el-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> fs/io_uring.c:6064:2: warning: Redundant assignment of 'req' to itself. =
[selfAssignment]
    io_for_each_link(req, req)
    ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/io_uring.c:1407:2: warning: Assignment of function parameter has no e=
ffect outside the function. Did you forget dereferencing it? [uselessAssign=
mentPtrArg]
    locked =3D NULL;
    ^
>> fs/io_uring.c:5373:19: warning: Uninitialized variable: req [uninitvar]
     if (sqe_addr !=3D req->user_data)
                     ^
   fs/io_uring.c:5377:10: warning: Uninitialized variable: req [uninitvar]
     return req;
            ^
   fs/io_uring.c:9563:46: warning: Uninitialized variable: req [uninitvar]
      seq_printf(m, "  op=3D%d, task_works=3D%dn", req->opcode,
                                                ^
   fs/io_uring.c:9564:6: warning: Uninitialized variable: req [uninitvar]
        req->task->task_works !=3D NULL);
        ^

vim +1407 fs/io_uring.c

54a91f3bb9b96e Jens Axboe     2019-09-10  1399  =

f237c30a5610d3 Pavel Begunkov 2021-08-18  1400  static void io_queue_async_=
work(struct io_kiocb *req, bool *locked)
561fb04a6a2257 Jens Axboe     2019-10-24  1401  {
a197f664a0db8a Jackie Liu     2019-11-08  1402  	struct io_ring_ctx *ctx =
=3D req->ctx;
cbdcb4357c0008 Pavel Begunkov 2020-06-29  1403  	struct io_kiocb *link =3D =
io_prep_linked_timeout(req);
5aa75ed5b93f08 Jens Axboe     2021-02-16  1404  	struct io_uring_task *tctx=
 =3D req->task->io_uring;
561fb04a6a2257 Jens Axboe     2019-10-24  1405  =

f237c30a5610d3 Pavel Begunkov 2021-08-18  1406  	/* must not take the lock,=
 NULL it as a precaution */
f237c30a5610d3 Pavel Begunkov 2021-08-18 @1407  	locked =3D NULL;
f237c30a5610d3 Pavel Begunkov 2021-08-18  1408  =

3bfe6106693b6b Jens Axboe     2021-02-16  1409  	BUG_ON(!tctx);
3bfe6106693b6b Jens Axboe     2021-02-16  1410  	BUG_ON(!tctx->io_wq);
561fb04a6a2257 Jens Axboe     2019-10-24  1411  =

cbdcb4357c0008 Pavel Begunkov 2020-06-29  1412  	/* init ->work of the whol=
e link before punting */
cbdcb4357c0008 Pavel Begunkov 2020-06-29  1413  	io_prep_async_link(req);
991468dcf198bb Jens Axboe     2021-07-23  1414  =

991468dcf198bb Jens Axboe     2021-07-23  1415  	/*
991468dcf198bb Jens Axboe     2021-07-23  1416  	 * Not expected to happen,=
 but if we do have a bug where this _can_
991468dcf198bb Jens Axboe     2021-07-23  1417  	 * happen, catch it here a=
nd ensure the request is marked as
991468dcf198bb Jens Axboe     2021-07-23  1418  	 * canceled. That will mak=
e io-wq go through the usual work cancel
991468dcf198bb Jens Axboe     2021-07-23  1419  	 * procedure rather than a=
ttempt to run this request (or create a new
991468dcf198bb Jens Axboe     2021-07-23  1420  	 * worker for it).
991468dcf198bb Jens Axboe     2021-07-23  1421  	 */
991468dcf198bb Jens Axboe     2021-07-23  1422  	if (WARN_ON_ONCE(!same_thr=
ead_group(req->task, current)))
991468dcf198bb Jens Axboe     2021-07-23  1423  		req->work.flags |=3D IO_W=
Q_WORK_CANCEL;
991468dcf198bb Jens Axboe     2021-07-23  1424  =

d07f1e8a42614c Pavel Begunkov 2021-03-22  1425  	trace_io_uring_queue_async=
_work(ctx, io_wq_is_hashed(&req->work), req,
d07f1e8a42614c Pavel Begunkov 2021-03-22  1426  					&req->work, req->flags=
);
ebf936670721be Pavel Begunkov 2021-03-01  1427  	io_wq_enqueue(tctx->io_wq,=
 &req->work);
7271ef3a93a832 Jens Axboe     2020-08-10  1428  	if (link)
7271ef3a93a832 Jens Axboe     2020-08-10  1429  		io_queue_linked_timeout(l=
ink);
cbdcb4357c0008 Pavel Begunkov 2020-06-29  1430  }
cbdcb4357c0008 Pavel Begunkov 2020-06-29  1431  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4220355287880490071==--

