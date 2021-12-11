Content-Type: multipart/mixed; boundary="===============8766888095836926461=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/versatile/clk-icst.c:277:24: warning: Redundant condition: If 'rate <= 25000000', the comparison 'rate < 29000000' is always true. [redundantCondition]
Date: Sun, 12 Dec 2021 03:20:07 +0800
Message-ID: <202112120345.PzUJBXFx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8766888095836926461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jean Delvare <jdelvare@suse.de>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: 323fd5955f844d1b6acf1a1af488da460f657ff2 clk: versatile: Rename ICS=
T to CLK_ICST
date:   8 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 weeks ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/versatile/clk-icst.c:277:24: warning: Redundant condition: I=
f 'rate <=3D 25000000', the comparison 'rate < 29000000' is always true. [r=
edundantCondition]
     if (rate <=3D 25000000 || rate < 29000000)
                          ^

vim +277 drivers/clk/versatile/clk-icst.c

91b87a4795c42b Linus Walleij 2012-06-11  236  =

91b87a4795c42b Linus Walleij 2012-06-11  237  static long icst_round_rate(s=
truct clk_hw *hw, unsigned long rate,
91b87a4795c42b Linus Walleij 2012-06-11  238  			    unsigned long *prate)
91b87a4795c42b Linus Walleij 2012-06-11  239  {
91b87a4795c42b Linus Walleij 2012-06-11  240  	struct clk_icst *icst =3D to=
_icst(hw);
91b87a4795c42b Linus Walleij 2012-06-11  241  	struct icst_vco vco;
91b87a4795c42b Linus Walleij 2012-06-11  242  =

5e23c593057520 Linus Walleij 2016-08-22  243  	if (icst->ctype =3D=3D ICST_=
INTEGRATOR_AP_CM ||
5e23c593057520 Linus Walleij 2016-08-22  244  	    icst->ctype =3D=3D ICST_=
INTEGRATOR_CP_CM_CORE) {
5e23c593057520 Linus Walleij 2016-08-22  245  		if (rate <=3D 12000000)
5e23c593057520 Linus Walleij 2016-08-22  246  			return 12000000;
5e23c593057520 Linus Walleij 2016-08-22  247  		if (rate >=3D 160000000)
5e23c593057520 Linus Walleij 2016-08-22  248  			return 160000000;
5e23c593057520 Linus Walleij 2016-08-22  249  		/* Slam to closest megahert=
z */
5e23c593057520 Linus Walleij 2016-08-22  250  		return DIV_ROUND_CLOSEST(ra=
te, 1000000) * 1000000;
5e23c593057520 Linus Walleij 2016-08-22  251  	}
5e23c593057520 Linus Walleij 2016-08-22  252  =

5e23c593057520 Linus Walleij 2016-08-22  253  	if (icst->ctype =3D=3D ICST_=
INTEGRATOR_CP_CM_MEM) {
5e23c593057520 Linus Walleij 2016-08-22  254  		if (rate <=3D 6000000)
5e23c593057520 Linus Walleij 2016-08-22  255  			return 6000000;
5e23c593057520 Linus Walleij 2016-08-22  256  		if (rate >=3D 66000000)
5e23c593057520 Linus Walleij 2016-08-22  257  			return 66000000;
5e23c593057520 Linus Walleij 2016-08-22  258  		/* Slam to closest 0.5 mega=
hertz */
5e23c593057520 Linus Walleij 2016-08-22  259  		return DIV_ROUND_CLOSEST(ra=
te, 500000) * 500000;
5e23c593057520 Linus Walleij 2016-08-22  260  	}
5e23c593057520 Linus Walleij 2016-08-22  261  =

fa62e10d2613b9 Linus Walleij 2016-08-27  262  	if (icst->ctype =3D=3D ICST_=
INTEGRATOR_AP_SYS) {
fa62e10d2613b9 Linus Walleij 2016-08-27  263  		/* Divides between 3 and 50=
 MHz in steps of 0.25 MHz */
fa62e10d2613b9 Linus Walleij 2016-08-27  264  		if (rate <=3D 3000000)
fa62e10d2613b9 Linus Walleij 2016-08-27  265  			return 3000000;
fa62e10d2613b9 Linus Walleij 2016-08-27  266  		if (rate >=3D 50000000)
fa62e10d2613b9 Linus Walleij 2016-08-27  267  			return 5000000;
fa62e10d2613b9 Linus Walleij 2016-08-27  268  		/* Slam to closest 0.25 MHz=
 */
fa62e10d2613b9 Linus Walleij 2016-08-27  269  		return DIV_ROUND_CLOSEST(ra=
te, 250000) * 250000;
fa62e10d2613b9 Linus Walleij 2016-08-27  270  	}
fa62e10d2613b9 Linus Walleij 2016-08-27  271  =

fa62e10d2613b9 Linus Walleij 2016-08-27  272  	if (icst->ctype =3D=3D ICST_=
INTEGRATOR_AP_PCI) {
fa62e10d2613b9 Linus Walleij 2016-08-27  273  		/*
fa62e10d2613b9 Linus Walleij 2016-08-27  274  		 * If we're below or less t=
han halfway from 25 to 33 MHz
fa62e10d2613b9 Linus Walleij 2016-08-27  275  		 * select 25 MHz
fa62e10d2613b9 Linus Walleij 2016-08-27  276  		 */
fa62e10d2613b9 Linus Walleij 2016-08-27 @277  		if (rate <=3D 25000000 || r=
ate < 29000000)
fa62e10d2613b9 Linus Walleij 2016-08-27  278  			return 25000000;
fa62e10d2613b9 Linus Walleij 2016-08-27  279  		/* Else just return the def=
ault frequency */
fa62e10d2613b9 Linus Walleij 2016-08-27  280  		return 33000000;
fa62e10d2613b9 Linus Walleij 2016-08-27  281  	}
fa62e10d2613b9 Linus Walleij 2016-08-27  282  =

91b87a4795c42b Linus Walleij 2012-06-11  283  	vco =3D icst_hz_to_vco(icst-=
>params, rate);
91b87a4795c42b Linus Walleij 2012-06-11  284  	return icst_hz(icst->params,=
 vco);
91b87a4795c42b Linus Walleij 2012-06-11  285  }
91b87a4795c42b Linus Walleij 2012-06-11  286  =


:::::: The code at line 277 was first introduced by commit
:::::: fa62e10d2613b9e9edbe944b890644b30e9d4ed7 clk: versatile/icst: suppor=
t for AP baseboard clocks

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8766888095836926461==--

