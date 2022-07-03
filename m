Content-Type: multipart/mixed; boundary="===============5021664351700408673=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [isilence:zc_v3 18/28] io_uring/notif.c:54 io_uring_tx_zerocopy_callback() warn: if statement not indented
Date: Sun, 03 Jul 2022 08:31:53 +0800
Message-ID: <202207030820.61aWmZmk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5021664351700408673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux zc_v3
head:   cd0bc816ae8dbc546df5c09cee92459ad759c4d1
commit: 591b24351034d95bc4f39a3d1cbbb7132109218d [18/28] io_uring: complete=
 notifiers in tw
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20703/202207030820.61aWmZmk-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
io_uring/notif.c:54 io_uring_tx_zerocopy_callback() warn: if statement not =
indented

vim +54 io_uring/notif.c

2239fd796a3a31 Pavel Begunkov 2022-05-05  42  =

2239fd796a3a31 Pavel Begunkov 2022-05-05  43  static void io_uring_tx_zeroc=
opy_callback(struct sk_buff *skb,
2239fd796a3a31 Pavel Begunkov 2022-05-05  44  					  struct ubuf_info *uarg,
2239fd796a3a31 Pavel Begunkov 2022-05-05  45  					  bool success)
2239fd796a3a31 Pavel Begunkov 2022-05-05  46  {
2239fd796a3a31 Pavel Begunkov 2022-05-05  47  	struct io_notif *notif =3D c=
ontainer_of(uarg, struct io_notif, uarg);
2239fd796a3a31 Pavel Begunkov 2022-05-05  48  =

2239fd796a3a31 Pavel Begunkov 2022-05-05  49  	if (!refcount_dec_and_test(&=
uarg->refcnt))
2239fd796a3a31 Pavel Begunkov 2022-05-05  50  		return;
591b24351034d9 Pavel Begunkov 2022-05-05  51  =

591b24351034d9 Pavel Begunkov 2022-05-05  52  	if (likely(notif->task)) {
591b24351034d9 Pavel Begunkov 2022-05-05  53  		init_task_work(&notif->task=
_work, __io_notif_complete_tw);
591b24351034d9 Pavel Begunkov 2022-05-05 @54  		if (likely(!task_work_add(n=
otif->task, &notif->task_work,
591b24351034d9 Pavel Begunkov 2022-05-05  55  					  TWA_SIGNAL)))
591b24351034d9 Pavel Begunkov 2022-05-05  56  		return;
591b24351034d9 Pavel Begunkov 2022-05-05  57  	}
591b24351034d9 Pavel Begunkov 2022-05-05  58  =

2239fd796a3a31 Pavel Begunkov 2022-05-05  59  	INIT_WORK(&notif->commit_wor=
k, io_notif_complete_wq);
2239fd796a3a31 Pavel Begunkov 2022-05-05  60  	queue_work(system_unbound_wq=
, &notif->commit_work);
2239fd796a3a31 Pavel Begunkov 2022-05-05  61  }
2239fd796a3a31 Pavel Begunkov 2022-05-05  62  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5021664351700408673==--

