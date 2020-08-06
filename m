Content-Type: multipart/mixed; boundary="===============8171428628474976186=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/pensando/ionic/ionic_txrx.c:608:3: warning: Variable 'done' is modified but its new value is never used.
Date: Thu, 06 Aug 2020 09:17:02 +0800
Message-ID: <202008060900.ZJvfjgZ9%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8171428628474976186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shannon Nelson <snelson@pensando.io>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fffe3ae0ee84e25d2befe2ae59bc32aa2b6bc77b
commit: f9c00e2cf258d215a1ed2a7b2ae5b91ac2f29582 ionic: clean tx queue of u=
nfinished requests
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/pensando/ionic/ionic_txrx.c:608:3: warning: Variabl=
e 'done' is modified but its new value is never used. [unreadVariable]
     done++;
     ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Df9c00e2cf258d215a1ed2a7b2ae5b91ac2f29582
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout f9c00e2cf258d215a1ed2a7b2ae5b91ac2f29582
vim +/done +608 drivers/net/ethernet/pensando/ionic/ionic_txrx.c

0f3154e6bcb3549 Shannon Nelson 2019-09-03  595  =

f9c00e2cf258d21 Shannon Nelson 2020-03-27  596  void ionic_tx_empty(struct =
ionic_queue *q)
f9c00e2cf258d21 Shannon Nelson 2020-03-27  597  {
f9c00e2cf258d21 Shannon Nelson 2020-03-27  598  	struct ionic_desc_info *de=
sc_info;
f9c00e2cf258d21 Shannon Nelson 2020-03-27  599  	int done =3D 0;
f9c00e2cf258d21 Shannon Nelson 2020-03-27  600  =

f9c00e2cf258d21 Shannon Nelson 2020-03-27  601  	/* walk the not completed =
tx entries, if any */
f9c00e2cf258d21 Shannon Nelson 2020-03-27  602  	while (q->head !=3D q->tai=
l) {
f9c00e2cf258d21 Shannon Nelson 2020-03-27  603  		desc_info =3D q->tail;
f9c00e2cf258d21 Shannon Nelson 2020-03-27  604  		q->tail =3D desc_info->ne=
xt;
f9c00e2cf258d21 Shannon Nelson 2020-03-27  605  		ionic_tx_clean(q, desc_in=
fo, NULL, desc_info->cb_arg);
f9c00e2cf258d21 Shannon Nelson 2020-03-27  606  		desc_info->cb =3D NULL;
f9c00e2cf258d21 Shannon Nelson 2020-03-27  607  		desc_info->cb_arg =3D NUL=
L;
f9c00e2cf258d21 Shannon Nelson 2020-03-27 @608  		done++;
f9c00e2cf258d21 Shannon Nelson 2020-03-27  609  	}
f9c00e2cf258d21 Shannon Nelson 2020-03-27  610  }
f9c00e2cf258d21 Shannon Nelson 2020-03-27  611  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8171428628474976186==--

