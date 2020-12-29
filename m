Content-Type: multipart/mixed; boundary="===============8159475318731167535=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 13725/14034] fs/io_uring.c:9408:6: warning: Unused variable: ret
Date: Tue, 29 Dec 2020 13:22:07 +0800
Message-ID: <202012291354.EUjsNHFD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8159475318731167535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Pavel Begunkov <asml.silence@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d7a03a44a5e93f39ece70ec75d25c6088caa0fdb
commit: efc2519f427b09ecdfc5ee722025da5e01a9b58d [13725/14034] io_uring: fi=
x double io_uring free
:::::: branch date: 6 days ago
:::::: commit date: 7 days ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

         ^
   fs/io_uring.c:8429:7: note: Variable 'ret' is reassigned a value before =
the old one has been used.
     ret =3D 0;
         ^
>> fs/io_uring.c:9408:6: warning: Unused variable: ret [unusedVariable]
    int ret;
        ^

vim +9408 fs/io_uring.c

efc2519f427b09e Pavel Begunkov 2020-12-21  9398  =

2b188cc1bb857a9 Jens Axboe     2019-01-07  9399  /*
2b188cc1bb857a9 Jens Axboe     2019-01-07  9400   * Allocate an anonymous f=
d, this is what constitutes the application
2b188cc1bb857a9 Jens Axboe     2019-01-07  9401   * visible backing of an i=
o_uring instance. The application mmaps this
2b188cc1bb857a9 Jens Axboe     2019-01-07  9402   * fd to gain access to th=
e SQ/CQ ring details. If UNIX sockets are enabled,
2b188cc1bb857a9 Jens Axboe     2019-01-07  9403   * we have to tie this fd =
to a socket for file garbage collection purposes.
2b188cc1bb857a9 Jens Axboe     2019-01-07  9404   */
efc2519f427b09e Pavel Begunkov 2020-12-21  9405  static struct file *io_uri=
ng_get_file(struct io_ring_ctx *ctx)
2b188cc1bb857a9 Jens Axboe     2019-01-07  9406  {
2b188cc1bb857a9 Jens Axboe     2019-01-07  9407  	struct file *file;
2b188cc1bb857a9 Jens Axboe     2019-01-07 @9408  	int ret;
2b188cc1bb857a9 Jens Axboe     2019-01-07  9409  =


:::::: The code at line 9408 was first introduced by commit
:::::: 2b188cc1bb857a9d4701ae59aa7768b5124e262e Add io_uring IO interface

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8159475318731167535==--

