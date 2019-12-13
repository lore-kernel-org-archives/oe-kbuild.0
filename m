Content-Type: multipart/mixed; boundary="===============1443121196552513911=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/clk/ingenic/jz4770-cgu.c:442 jz4770_cgu_init() error: we previously assumed 'cgu' could be null (see line 435)
Date: Fri, 13 Dec 2019 13:07:37 +0300
Message-ID: <20191213100737.GC2407@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1443121196552513911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9455d25f4e3b3d009fa1b810862e5b06229530e4
commit: cd94eade0b2ab7673a97223d09406abf668b7f73 clk: ingenic: Allow driver=
s to be built with COMPILE_TEST
date:   2 weeks ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/ingenic/jz4770-cgu.c:442 jz4770_cgu_init() error: we previously=
 assumed 'cgu' could be null (see line 435)

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dcd94eade0b2ab7673a97223d09406abf668b7f73
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout cd94eade0b2ab7673a97223d09406abf668b7f73
vim +/cgu +442 drivers/clk/ingenic/jz4770-cgu.c

7a01c19007ad3c Paul Cercueil 2018-01-16  429  static void __init jz4770_cgu=
_init(struct device_node *np)
7a01c19007ad3c Paul Cercueil 2018-01-16  430  {
7a01c19007ad3c Paul Cercueil 2018-01-16  431  	int retval;
7a01c19007ad3c Paul Cercueil 2018-01-16  432  =

7a01c19007ad3c Paul Cercueil 2018-01-16  433  	cgu =3D ingenic_cgu_new(jz47=
70_cgu_clocks,
7a01c19007ad3c Paul Cercueil 2018-01-16  434  			      ARRAY_SIZE(jz4770_cg=
u_clocks), np);
7a01c19007ad3c Paul Cercueil 2018-01-16 @435  	if (!cgu)
7a01c19007ad3c Paul Cercueil 2018-01-16  436  		pr_err("%s: failed to initi=
alise CGU\n", __func__);
7a01c19007ad3c Paul Cercueil 2018-01-16  437  =

7a01c19007ad3c Paul Cercueil 2018-01-16  438  	retval =3D ingenic_cgu_regis=
ter_clocks(cgu);
7a01c19007ad3c Paul Cercueil 2018-01-16  439  	if (retval)
7a01c19007ad3c Paul Cercueil 2018-01-16  440  		pr_err("%s: failed to regis=
ter CGU Clocks\n", __func__);
7a01c19007ad3c Paul Cercueil 2018-01-16  441  =

2ee93e3c953b72 Paul Cercueil 2019-06-11 @442  	ingenic_cgu_register_syscore=
_ops(cgu);
7a01c19007ad3c Paul Cercueil 2018-01-16  443  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============1443121196552513911==--

