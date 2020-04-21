Content-Type: multipart/mixed; boundary="===============8054505180412932576=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [marex:ks8851-v5 18/20] drivers/net/ethernet/micrel/ks8851_par.c:68:13: sparse: sparse: context imbalance in 'ks8851_lock_par' - wrong count at exit
Date: Tue, 21 Apr 2020 21:17:43 +0800
Message-ID: <202004212140.Q9NfMacy%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8054505180412932576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Marek Vasut <marex@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/marex/linux-2.6.git=
 ks8851-v5
head:   52117de6ac7930a4517345943cf8c9be9abb0e17
commit: a385abbd26b7d823630a325a71b3cc7a4e195494 [18/20] net: ks8851: Imple=
ment Parallel bus operations
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout a385abbd26b7d823630a325a71b3cc7a4e195494
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/micrel/ks8851_par.c:68:13: sparse: sparse: context =
imbalance in 'ks8851_lock_par' - wrong count at exit
>> drivers/net/ethernet/micrel/ks8851_par.c:82:13: sparse: sparse: context =
imbalance in 'ks8851_unlock_par' - unexpected unlock

# https://git.kernel.org/pub/scm/linux/kernel/git/marex/linux-2.6.git/commi=
t/?id=3Da385abbd26b7d823630a325a71b3cc7a4e195494
git remote add marex https://git.kernel.org/pub/scm/linux/kernel/git/marex/=
linux-2.6.git
git remote update marex
git checkout a385abbd26b7d823630a325a71b3cc7a4e195494
vim +/ks8851_lock_par +68 drivers/net/ethernet/micrel/ks8851_par.c

a385abbd26b7d8 Marek Vasut 2020-03-23  60  =

a385abbd26b7d8 Marek Vasut 2020-03-23  61  /**
a385abbd26b7d8 Marek Vasut 2020-03-23  62   * ks8851_lock_par - register ac=
cess lock
a385abbd26b7d8 Marek Vasut 2020-03-23  63   * @ks: The chip state
a385abbd26b7d8 Marek Vasut 2020-03-23  64   * @flags: Spinlock flags
a385abbd26b7d8 Marek Vasut 2020-03-23  65   *
a385abbd26b7d8 Marek Vasut 2020-03-23  66   * Claim chip register access lo=
ck
a385abbd26b7d8 Marek Vasut 2020-03-23  67   */
a385abbd26b7d8 Marek Vasut 2020-03-23 @68  static void ks8851_lock_par(stru=
ct ks8851_net *ks, unsigned long *flags)
a385abbd26b7d8 Marek Vasut 2020-03-23  69  {
a385abbd26b7d8 Marek Vasut 2020-03-23  70  	struct ks8851_net_par *ksp =3D =
to_ks8851_par(ks);
a385abbd26b7d8 Marek Vasut 2020-03-23  71  =

a385abbd26b7d8 Marek Vasut 2020-03-23  72  	spin_lock_irqsave(&ksp->lock, *=
flags);
a385abbd26b7d8 Marek Vasut 2020-03-23  73  }
a385abbd26b7d8 Marek Vasut 2020-03-23  74  =

a385abbd26b7d8 Marek Vasut 2020-03-23  75  /**
a385abbd26b7d8 Marek Vasut 2020-03-23  76   * ks8851_unlock_par - register =
access unlock
a385abbd26b7d8 Marek Vasut 2020-03-23  77   * @ks: The chip state
a385abbd26b7d8 Marek Vasut 2020-03-23  78   * @flags: Spinlock flags
a385abbd26b7d8 Marek Vasut 2020-03-23  79   *
a385abbd26b7d8 Marek Vasut 2020-03-23  80   * Release chip register access =
lock
a385abbd26b7d8 Marek Vasut 2020-03-23  81   */
a385abbd26b7d8 Marek Vasut 2020-03-23 @82  static void ks8851_unlock_par(st=
ruct ks8851_net *ks, unsigned long *flags)
a385abbd26b7d8 Marek Vasut 2020-03-23  83  {
a385abbd26b7d8 Marek Vasut 2020-03-23  84  	struct ks8851_net_par *ksp =3D =
to_ks8851_par(ks);
a385abbd26b7d8 Marek Vasut 2020-03-23  85  =

a385abbd26b7d8 Marek Vasut 2020-03-23  86  	spin_unlock_irqrestore(&ksp->lo=
ck, *flags);
a385abbd26b7d8 Marek Vasut 2020-03-23  87  }
a385abbd26b7d8 Marek Vasut 2020-03-23  88  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8054505180412932576==--

