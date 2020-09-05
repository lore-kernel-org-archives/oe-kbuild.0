Content-Type: multipart/mixed; boundary="===============8428720712641371253=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [block:for-5.10/io_uring 20/21] fs/io_uring.c:3394:24: warning: Either the condition 'req' is redundant or there is possible null pointer dereference: req.
Date: Sun, 06 Sep 2020 05:37:55 +0800
Message-ID: <202009060553.DjzztKlL%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8428720712641371253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.10/io_uring
head:   bc5a2c856fa0b2ce94430e6a1997635c27e3e886
commit: ced2548d361df70b58b03887164dcde1e286bc0e [20/21] io_uring: add supp=
ort for shutdown(2)
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   ^
   fs/io_uring.c:8559:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -EOPNOTSUPP;
        ^
   fs/io_uring.c:8563:6: warning: Variable 'ret' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    ret =3D -ENXIO;
        ^
   fs/io_uring.c:8559:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -EOPNOTSUPP;
        ^
   fs/io_uring.c:8563:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -ENXIO;
        ^
   fs/io_uring.c:8576:6: warning: Variable 'ret' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   fs/io_uring.c:8563:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -ENXIO;
        ^
   fs/io_uring.c:8576:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D 0;
        ^
   fs/io_uring.c:9006:6: warning: Variable 'ret' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    ret =3D -EINVAL;
        ^
   fs/io_uring.c:9003:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -EFAULT;
        ^
   fs/io_uring.c:9006:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -EINVAL;
        ^
   fs/io_uring.c:9021:6: warning: Variable 'ret' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   fs/io_uring.c:9006:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -EINVAL;
        ^
   fs/io_uring.c:9021:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D 0;
        ^
   fs/io_uring.c:9295:6: warning: Variable 'ret' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    ret =3D -EOPNOTSUPP;
        ^
   fs/io_uring.c:9288:0: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    long ret =3D -EBADF;
   ^
   fs/io_uring.c:9295:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -EOPNOTSUPP;
        ^
   fs/io_uring.c:9302:6: warning: Variable 'ret' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    ret =3D __io_uring_register(ctx, opcode, arg, nr_args);
        ^
   fs/io_uring.c:9295:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D -EOPNOTSUPP;
        ^
   fs/io_uring.c:9302:6: note: Variable 'ret' is reassigned a value before =
the old one has been used.
    ret =3D __io_uring_register(ctx, opcode, arg, nr_args);
        ^
   fs/io_uring.c:2344:6: warning: Variable 'ret' is reassigned a value befo=
re the old one has been used. 'break;' missing? [redundantAssignInSwitch]
    ret =3D io_import_iovec(rw, req, &iovec, &iter, false);
        ^
   fs/io_uring.c:2318:0: note: Variable 'ret' is reassigned a value before =
the old one has been used. 'break;' missing?
    ssize_t ret =3D -ECANCELED;
   ^
   fs/io_uring.c:2344:6: note: Variable 'ret' is reassigned a value before =
the old one has been used. 'break;' missing?
    ret =3D io_import_iovec(rw, req, &iovec, &iter, false);
        ^
>> fs/io_uring.c:3394:24: warning: Either the condition 'req' is redundant =
or there is possible null pointer dereference: req. [nullPointerRedundantCh=
eck]
    sock =3D sock_from_file(req->file, &ret);
                          ^
   fs/io_uring.c:5985:7: note: Assuming that condition 'req' is not redunda=
nt
     if (req) {
         ^
   fs/io_uring.c:5990:21: note: Calling function 'io_shutdown', 1st argumen=
t 'req' value is 0
     ret =3D io_shutdown(req, force_nonblock);
                       ^
   fs/io_uring.c:3394:24: note: Null pointer dereference
    sock =3D sock_from_file(req->file, &ret);
                          ^
   fs/io_uring.c:3398:34: warning: Either the condition 'req' is redundant =
or there is possible null pointer dereference: req. [nullPointerRedundantCh=
eck]
    ret =3D __sys_shutdown_sock(sock, req->shutdown.how);
                                    ^
   fs/io_uring.c:5985:7: note: Assuming that condition 'req' is not redunda=
nt
     if (req) {
         ^
   fs/io_uring.c:5990:21: note: Calling function 'io_shutdown', 1st argumen=
t 'req' value is 0
     ret =3D io_shutdown(req, force_nonblock);
                       ^
   fs/io_uring.c:3398:34: note: Null pointer dereference
    ret =3D __sys_shutdown_sock(sock, req->shutdown.how);
                                    ^

# https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/com=
mit/?id=3Dced2548d361df70b58b03887164dcde1e286bc0e
git remote add block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/=
linux-block.git
git fetch --no-tags block for-5.10/io_uring
git checkout ced2548d361df70b58b03887164dcde1e286bc0e
vim +/req +3394 fs/io_uring.c

ced2548d361df7 Jens Axboe 2020-09-05  3384  =

ced2548d361df7 Jens Axboe 2020-09-05  3385  static int io_shutdown(struct i=
o_kiocb *req, bool force_nonblock)
ced2548d361df7 Jens Axboe 2020-09-05  3386  {
ced2548d361df7 Jens Axboe 2020-09-05  3387  #if defined(CONFIG_NET)
ced2548d361df7 Jens Axboe 2020-09-05  3388  	struct socket *sock;
ced2548d361df7 Jens Axboe 2020-09-05  3389  	int ret;
ced2548d361df7 Jens Axboe 2020-09-05  3390  =

ced2548d361df7 Jens Axboe 2020-09-05  3391  	if (force_nonblock)
ced2548d361df7 Jens Axboe 2020-09-05  3392  		return -EAGAIN;
ced2548d361df7 Jens Axboe 2020-09-05  3393  =

ced2548d361df7 Jens Axboe 2020-09-05 @3394  	sock =3D sock_from_file(req->f=
ile, &ret);
ced2548d361df7 Jens Axboe 2020-09-05  3395  	if (unlikely(!sock))
ced2548d361df7 Jens Axboe 2020-09-05  3396  		return ret;
ced2548d361df7 Jens Axboe 2020-09-05  3397  =

ced2548d361df7 Jens Axboe 2020-09-05  3398  	ret =3D __sys_shutdown_sock(so=
ck, req->shutdown.how);
ced2548d361df7 Jens Axboe 2020-09-05  3399  	io_req_complete(req, ret);
ced2548d361df7 Jens Axboe 2020-09-05  3400  	return 0;
ced2548d361df7 Jens Axboe 2020-09-05  3401  #else
ced2548d361df7 Jens Axboe 2020-09-05  3402  	return -EOPNOTSUPP;
ced2548d361df7 Jens Axboe 2020-09-05  3403  #endif
ced2548d361df7 Jens Axboe 2020-09-05  3404  }
ced2548d361df7 Jens Axboe 2020-09-05  3405  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8428720712641371253==--

