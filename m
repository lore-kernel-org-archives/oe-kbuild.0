Content-Type: multipart/mixed; boundary="===============7283792234486595298=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-5.18/io_uring 2/5] fs/io_uring.c:9406:9: warning: Uninitialized variable: ret [uninitvar]
Date: Sun, 06 Feb 2022 05:02:22 +0800
Message-ID: <202202060419.bpwBH36K-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7283792234486595298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Usama Arif <usama.arif@bytedance.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.18/io_uring
head:   971d72eb476604fc91a8e82f0421e6f599f9c300
commit: b77e315a96445e5f19a83546c73d2abbcedfa5db [2/5] io_uring: avoid ring=
 quiesce while registering/unregistering eventfd
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
        ^
   fs/io_uring.c:9160:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -ENOMEM;
        ^
   fs/io_uring.c:9175:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D 0;
        ^
   fs/io_uring.c:6635:2: warning: Redundant assignment of 'req' to itself. =
[selfAssignment]
    io_for_each_link(req, req)
    ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

        ^
   fs/io_uring.c:9160:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -ENOMEM;
        ^
   fs/io_uring.c:9175:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D 0;
        ^
>> fs/io_uring.c:9406:9: warning: Uninitialized variable: ret [uninitvar]
    return ret;
           ^
   fs/io_uring.c:5910:19: warning: Uninitialized variable: req [uninitvar]
     if (sqe_addr !=3D req->user_data)
                     ^
   fs/io_uring.c:5914:10: warning: Uninitialized variable: req [uninitvar]
     return req;
            ^
   fs/io_uring.c:10373:46: warning: Uninitialized variable: req [uninitvar]
      seq_printf(m, "  op=3D%d, task_works=3D%dn", req->opcode,
                                                ^
   fs/io_uring.c:10374:6: warning: Uninitialized variable: req [uninitvar]
        req->task->task_works !=3D NULL);
        ^
>> net/ieee802154/nl802154.c:43:6: warning: Local variable wpan_dev_id shad=
ows outer function [shadowFunction]
    u64 wpan_dev_id;
        ^
   net/ieee802154/nl802154.c:659:19: note: Shadowed declaration
   static inline u64 wpan_dev_id(struct wpan_dev *wpan_dev)
                     ^
   net/ieee802154/nl802154.c:43:6: note: Shadow variable
    u64 wpan_dev_id;
        ^
   net/ieee802154/nl802154.c:109:7: warning: Local variable wpan_dev_id sha=
dows outer function [shadowFunction]
     u64 wpan_dev_id =3D nla_get_u64(attrs[NL802154_ATTR_WPAN_DEV]);
         ^
   net/ieee802154/nl802154.c:659:19: note: Shadowed declaration
   static inline u64 wpan_dev_id(struct wpan_dev *wpan_dev)
                     ^
   net/ieee802154/nl802154.c:109:7: note: Shadow variable
     u64 wpan_dev_id =3D nla_get_u64(attrs[NL802154_ATTR_WPAN_DEV]);
         ^

vim +9406 fs/io_uring.c

634d00df5e1cfc Pavel Begunkov 2021-04-25  9379  =

9b402849e80c85 Jens Axboe     2019-04-11  9380  static int io_eventfd_regis=
ter(struct io_ring_ctx *ctx, void __user *arg)
9b402849e80c85 Jens Axboe     2019-04-11  9381  {
b77e315a96445e Usama Arif     2022-02-04  9382  	struct io_ev_fd *ev_fd;
9b402849e80c85 Jens Axboe     2019-04-11  9383  	__s32 __user *fds =3D arg;
b77e315a96445e Usama Arif     2022-02-04  9384  	int fd, ret;
9b402849e80c85 Jens Axboe     2019-04-11  9385  =

b77e315a96445e Usama Arif     2022-02-04  9386  	ev_fd =3D rcu_dereference_=
protected(ctx->io_ev_fd,
b77e315a96445e Usama Arif     2022-02-04  9387  					lockdep_is_held(&ctx->=
uring_lock));
b77e315a96445e Usama Arif     2022-02-04  9388  	if (ev_fd)
9b402849e80c85 Jens Axboe     2019-04-11  9389  		return -EBUSY;
9b402849e80c85 Jens Axboe     2019-04-11  9390  =

9b402849e80c85 Jens Axboe     2019-04-11  9391  	if (copy_from_user(&fd, fd=
s, sizeof(*fds)))
9b402849e80c85 Jens Axboe     2019-04-11  9392  		return -EFAULT;
9b402849e80c85 Jens Axboe     2019-04-11  9393  =

b77e315a96445e Usama Arif     2022-02-04  9394  	ev_fd =3D kmalloc(sizeof(*=
ev_fd), GFP_KERNEL);
b77e315a96445e Usama Arif     2022-02-04  9395  	if (!ev_fd)
b77e315a96445e Usama Arif     2022-02-04  9396  		return -ENOMEM;
fe7e3257502991 Pavel Begunkov 2021-06-24  9397  =

b77e315a96445e Usama Arif     2022-02-04  9398  	ev_fd->cq_ev_fd =3D eventf=
d_ctx_fdget(fd);
b77e315a96445e Usama Arif     2022-02-04  9399  	if (IS_ERR(ev_fd->cq_ev_fd=
)) {
b77e315a96445e Usama Arif     2022-02-04  9400  		ret =3D PTR_ERR(ev_fd->cq=
_ev_fd);
b77e315a96445e Usama Arif     2022-02-04  9401  		kfree(ev_fd);
9b402849e80c85 Jens Axboe     2019-04-11  9402  		return ret;
9b402849e80c85 Jens Axboe     2019-04-11  9403  	}
9b402849e80c85 Jens Axboe     2019-04-11  9404  =

b77e315a96445e Usama Arif     2022-02-04  9405  	rcu_assign_pointer(ctx->io=
_ev_fd, ev_fd);
b77e315a96445e Usama Arif     2022-02-04 @9406  	return ret;
b77e315a96445e Usama Arif     2022-02-04  9407  }
b77e315a96445e Usama Arif     2022-02-04  9408  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7283792234486595298==--

