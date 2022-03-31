Content-Type: multipart/mixed; boundary="===============7029121236054208269=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/clk-lmk04832.c:357:15: warning: Variable 'pll2_p' can be declared with const [constVariable]
Date: Thu, 31 Mar 2022 20:28:58 +0800
Message-ID: <202203312017.5YW13Jr4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7029121236054208269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Liam Beguin <lvb@xiphos.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: 3bc61cfd6f4a57de32132075b15b0ac8987ced1d clk: add support for the l=
mk04832
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/clk-lmk04832.c:357:15: warning: Variable 'pll2_p' can be dec=
lared with const [constVariable]
    unsigned int pll2_p[] =3D {8, 2, 2, 3, 4, 5, 6, 7};
                 ^

vim +/pll2_p +357 drivers/clk/clk-lmk04832.c

3bc61cfd6f4a57d Liam Beguin 2021-04-22  352  =

3bc61cfd6f4a57d Liam Beguin 2021-04-22  353  static unsigned long lmk04832_=
vco_recalc_rate(struct clk_hw *hw,
3bc61cfd6f4a57d Liam Beguin 2021-04-22  354  					      unsigned long prate)
3bc61cfd6f4a57d Liam Beguin 2021-04-22  355  {
3bc61cfd6f4a57d Liam Beguin 2021-04-22  356  	struct lmk04832 *lmk =3D cont=
ainer_of(hw, struct lmk04832, vco);
3bc61cfd6f4a57d Liam Beguin 2021-04-22 @357  	unsigned int pll2_p[] =3D {8,=
 2, 2, 3, 4, 5, 6, 7};
3bc61cfd6f4a57d Liam Beguin 2021-04-22  358  	unsigned int pll2_n, p, pll2_=
r;
3bc61cfd6f4a57d Liam Beguin 2021-04-22  359  	unsigned int pll2_misc;
3bc61cfd6f4a57d Liam Beguin 2021-04-22  360  	unsigned long vco_rate;
3bc61cfd6f4a57d Liam Beguin 2021-04-22  361  	u8 tmp[3];
3bc61cfd6f4a57d Liam Beguin 2021-04-22  362  	int ret;
3bc61cfd6f4a57d Liam Beguin 2021-04-22  363  =

3bc61cfd6f4a57d Liam Beguin 2021-04-22  364  	ret =3D regmap_read(lmk->regm=
ap, LMK04832_REG_PLL2_MISC, &pll2_misc);
3bc61cfd6f4a57d Liam Beguin 2021-04-22  365  	if (ret)
3bc61cfd6f4a57d Liam Beguin 2021-04-22  366  		return ret;
3bc61cfd6f4a57d Liam Beguin 2021-04-22  367  =

3bc61cfd6f4a57d Liam Beguin 2021-04-22  368  	p =3D FIELD_GET(LMK04832_BIT_=
PLL2_MISC_P, pll2_misc);
3bc61cfd6f4a57d Liam Beguin 2021-04-22  369  =

3bc61cfd6f4a57d Liam Beguin 2021-04-22  370  	ret =3D regmap_bulk_read(lmk-=
>regmap, LMK04832_REG_PLL2_N_0, &tmp, 3);
3bc61cfd6f4a57d Liam Beguin 2021-04-22  371  	if (ret)
3bc61cfd6f4a57d Liam Beguin 2021-04-22  372  		return ret;
3bc61cfd6f4a57d Liam Beguin 2021-04-22  373  =

3bc61cfd6f4a57d Liam Beguin 2021-04-22  374  	pll2_n =3D FIELD_PREP(0x03000=
0, tmp[0]) |
3bc61cfd6f4a57d Liam Beguin 2021-04-22  375  		 FIELD_PREP(0x00ff00, tmp[1]=
) |
3bc61cfd6f4a57d Liam Beguin 2021-04-22  376  		 FIELD_PREP(0x0000ff, tmp[2]=
);
3bc61cfd6f4a57d Liam Beguin 2021-04-22  377  =

3bc61cfd6f4a57d Liam Beguin 2021-04-22  378  	ret =3D regmap_bulk_read(lmk-=
>regmap, LMK04832_REG_PLL2_R_MSB, &tmp, 2);
3bc61cfd6f4a57d Liam Beguin 2021-04-22  379  	if (ret)
3bc61cfd6f4a57d Liam Beguin 2021-04-22  380  		return ret;
3bc61cfd6f4a57d Liam Beguin 2021-04-22  381  =

3bc61cfd6f4a57d Liam Beguin 2021-04-22  382  	pll2_r =3D FIELD_PREP(0x0f00,=
 tmp[0]) |
3bc61cfd6f4a57d Liam Beguin 2021-04-22  383  		 FIELD_PREP(0x00ff, tmp[1]);
3bc61cfd6f4a57d Liam Beguin 2021-04-22  384  =

3bc61cfd6f4a57d Liam Beguin 2021-04-22  385  	vco_rate =3D (prate << FIELD_=
GET(LMK04832_BIT_PLL2_MISC_REF_2X_EN,
3bc61cfd6f4a57d Liam Beguin 2021-04-22  386  				       pll2_misc)) * pll2_=
n * pll2_p[p] / pll2_r;
3bc61cfd6f4a57d Liam Beguin 2021-04-22  387  =

3bc61cfd6f4a57d Liam Beguin 2021-04-22  388  	return vco_rate;
3bc61cfd6f4a57d Liam Beguin 2021-04-22  389  };
3bc61cfd6f4a57d Liam Beguin 2021-04-22  390  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7029121236054208269==--

