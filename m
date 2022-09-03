Content-Type: multipart/mixed; boundary="===============3607861767741830528=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:axboe/linux-block/for-next 7/20] io_uring/io_uring.c:499:5-24: atomic_dec_and_test variation before object free at line 501.
Date: Sat, 03 Sep 2022 18:19:08 +0800
Message-ID: <202209031829.UctGBuNW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3607861767741830528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Dylan Yudaken <dylany@fb.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-ne=
xt
head:   e64191f335e960a46b422bd7642bc4d5dffa805d
commit: 7723238b4361cc43fa91dfc09f7b9a0e1d2d7f6c [7/20] io_uring: signal re=
gistered eventfd to process deferred task work
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-c043-20220901 (https://download.01.org/0day-ci/arc=
hive/20220903/202209031829.UctGBuNW-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> io_uring/io_uring.c:499:5-24: atomic_dec_and_test variation before objec=
t free at line 501.

vim +499 io_uring/io_uring.c

0451894522108d fs/io_uring.c       Pavel Begunkov 2020-05-26  485  =

7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  486  =

7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  487  static v=
oid io_eventfd_ops(struct rcu_head *rcu)
e971db8da1ccbb io_uring/io_uring.c Dylan Yudaken  2022-08-30  488  {
e971db8da1ccbb io_uring/io_uring.c Dylan Yudaken  2022-08-30  489  	struct =
io_ev_fd *ev_fd =3D container_of(rcu, struct io_ev_fd, rcu);
7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  490  	int ops=
 =3D atomic_xchg(&ev_fd->ops, 0);
7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  491  =

7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  492  	if (ops=
 & BIT(IO_EVENTFD_OP_SIGNAL_BIT))
7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  493  		eventf=
d_signal(ev_fd->cq_ev_fd, 1);
e971db8da1ccbb io_uring/io_uring.c Dylan Yudaken  2022-08-30  494  =

7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  495  	/* IO_E=
VENTFD_OP_FREE_BIT may not be set here depending on callback
7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  496  	 * orde=
ring in a race but if references are 0 we know we have to free
7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  497  	 * it r=
egardless.
7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  498  	 */
7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30 @499  	if (ato=
mic_dec_and_test(&ev_fd->refs)) {
e971db8da1ccbb io_uring/io_uring.c Dylan Yudaken  2022-08-30  500  		eventf=
d_ctx_put(ev_fd->cq_ev_fd);
e971db8da1ccbb io_uring/io_uring.c Dylan Yudaken  2022-08-30 @501  		kfree(=
ev_fd);
e971db8da1ccbb io_uring/io_uring.c Dylan Yudaken  2022-08-30  502  	}
7723238b4361cc io_uring/io_uring.c Dylan Yudaken  2022-08-30  503  }
e971db8da1ccbb io_uring/io_uring.c Dylan Yudaken  2022-08-30  504  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3607861767741830528==--

