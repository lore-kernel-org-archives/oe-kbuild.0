Content-Type: multipart/mixed; boundary="===============8361656824539716973=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mailbox/imx-mailbox.c:436:3: warning: %i in format string (no. 2) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Tue, 22 Jun 2021 08:23:13 +0800
Message-ID: <202106220809.OHjTzZXq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8361656824539716973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a96bfed64c8986d6404e553f18203cae1f5ac7e6
commit: 7d37cb2c912dc5c25ffac784a4f9b98c06c6bd08 lib: fix kconfig dependenc=
y on ARCH_WANT_FRAME_POINTERS
date:   2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 2 months ago
compiler: csky-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +436 drivers/mailbox/imx-mailbox.c

2bb7005696e224 Oleksij Rempel 2018-08-03  424  =

2bb7005696e224 Oleksij Rempel 2018-08-03  425  static void imx_mu_init_gene=
ric(struct imx_mu_priv *priv)
2bb7005696e224 Oleksij Rempel 2018-08-03  426  {
63b383575c388f Peng Fan       2020-03-19  427  	unsigned int i;
63b383575c388f Peng Fan       2020-03-19  428  =

63b383575c388f Peng Fan       2020-03-19  429  	for (i =3D 0; i < IMX_MU_CH=
ANS; i++) {
63b383575c388f Peng Fan       2020-03-19  430  		struct imx_mu_con_priv *cp=
 =3D &priv->con_priv[i];
63b383575c388f Peng Fan       2020-03-19  431  =

63b383575c388f Peng Fan       2020-03-19  432  		cp->idx =3D i % 4;
63b383575c388f Peng Fan       2020-03-19  433  		cp->type =3D i >> 2;
63b383575c388f Peng Fan       2020-03-19  434  		cp->chan =3D &priv->mbox_c=
hans[i];
63b383575c388f Peng Fan       2020-03-19  435  		priv->mbox_chans[i].con_pr=
iv =3D cp;
63b383575c388f Peng Fan       2020-03-19 @436  		snprintf(cp->irq_desc, siz=
eof(cp->irq_desc),
63b383575c388f Peng Fan       2020-03-19  437  			 "imx_mu_chan[%i-%i]", cp=
->type, cp->idx);
63b383575c388f Peng Fan       2020-03-19  438  	}
63b383575c388f Peng Fan       2020-03-19  439  =

63b383575c388f Peng Fan       2020-03-19  440  	priv->mbox.num_chans =3D IM=
X_MU_CHANS;
63b383575c388f Peng Fan       2020-03-19  441  	priv->mbox.of_xlate =3D imx=
_mu_xlate;
63b383575c388f Peng Fan       2020-03-19  442  =

2bb7005696e224 Oleksij Rempel 2018-08-03  443  	if (priv->side_b)
2bb7005696e224 Oleksij Rempel 2018-08-03  444  		return;
2bb7005696e224 Oleksij Rempel 2018-08-03  445  =

2bb7005696e224 Oleksij Rempel 2018-08-03  446  	/* Set default MU configura=
tion */
c6c6bc6ea9fce3 Richard Zhu    2019-10-09  447  	imx_mu_write(priv, 0, priv-=
>dcfg->xCR);
2bb7005696e224 Oleksij Rempel 2018-08-03  448  }
2bb7005696e224 Oleksij Rempel 2018-08-03  449  =


:::::: The code at line 436 was first introduced by commit
:::::: 63b383575c388fe16aa52de04b95c5791d53c8ba mailbox: imx: restructure c=
ode to make easy for new MU

:::::: TO: Peng Fan <peng.fan@nxp.com>
:::::: CC: Jassi Brar <jaswinder.singh@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8361656824539716973==--

