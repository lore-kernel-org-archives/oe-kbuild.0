Content-Type: multipart/mixed; boundary="===============5773631940385328740=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: Add Sunplus SP7021 clock driver
Date: Sun, 21 Aug 2022 21:40:45 +0800
Message-ID: <202208212144.aUofUlUt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5773631940385328740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220817070113.415971-1-qinjian@cqplus1.com>
References: <20220817070113.415971-1-qinjian@cqplus1.com>
TO: Qin Jian <qinjian@cqplus1.com>
TO: sboyd(a)kernel.org
CC: mturquette(a)baylibre.com
CC: linux-kernel(a)vger.kernel.org
CC: linux-clk(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: Qin Jian <qinjian@cqplus1.com>

Hi Qin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 568035b01cfb107af8d2e4bd2fb9aea22cf5b868]

url:    https://github.com/intel-lab-lkp/linux/commits/Qin-Jian/clk-Add-Sun=
plus-SP7021-clock-driver/20220817-151010
base:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-m031-20220821 (https://download.01.org/0day-ci/arc=
hive/20220821/202208212144.aUofUlUt-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/clk-sp7021.c:171 plltv_integer_div() error: buffer overflow 'm_=
table' 19 <=3D 19 (assuming for loop doesn't break)

vim +171 drivers/clk/clk-sp7021.c

5673230d6a56d6 Qin Jian 2022-08-17  144  =

5673230d6a56d6 Qin Jian 2022-08-17  145  static long plltv_integer_div(stru=
ct sp_pll *clk, unsigned long freq)
5673230d6a56d6 Qin Jian 2022-08-17  146  {
5673230d6a56d6 Qin Jian 2022-08-17  147  	/* valid m values: 27M must be di=
visible by m */
5673230d6a56d6 Qin Jian 2022-08-17  148  	static const u32 m_table[] =3D {
5673230d6a56d6 Qin Jian 2022-08-17  149  		1, 2, 3, 4, 5, 6, 8, 9, 10, 12, =
15, 16, 18, 20, 24, 25, 27, 30, 32
5673230d6a56d6 Qin Jian 2022-08-17  150  	};
5673230d6a56d6 Qin Jian 2022-08-17  151  	u32 m, n, r;
5673230d6a56d6 Qin Jian 2022-08-17  152  	unsigned long fvco, nf;
5673230d6a56d6 Qin Jian 2022-08-17  153  	long ret;
5673230d6a56d6 Qin Jian 2022-08-17  154  =

5673230d6a56d6 Qin Jian 2022-08-17  155  	freq =3D clamp(freq, F_MIN, F_MAX=
);
5673230d6a56d6 Qin Jian 2022-08-17  156  =

5673230d6a56d6 Qin Jian 2022-08-17  157  	/* DIVR 0~3 */
5673230d6a56d6 Qin Jian 2022-08-17  158  	for (r =3D 0; r <=3D 3; r++) {
5673230d6a56d6 Qin Jian 2022-08-17  159  		fvco =3D freq << r;
5673230d6a56d6 Qin Jian 2022-08-17  160  		if (fvco <=3D FVCO_MAX)
5673230d6a56d6 Qin Jian 2022-08-17  161  			break;
5673230d6a56d6 Qin Jian 2022-08-17  162  	}
5673230d6a56d6 Qin Jian 2022-08-17  163  =

5673230d6a56d6 Qin Jian 2022-08-17  164  	/* DIVM */
5673230d6a56d6 Qin Jian 2022-08-17  165  	for (m =3D 0; m < ARRAY_SIZE(m_ta=
ble); m++) {
5673230d6a56d6 Qin Jian 2022-08-17  166  		nf =3D fvco * m_table[m];
5673230d6a56d6 Qin Jian 2022-08-17  167  		n =3D nf / F_27M;
5673230d6a56d6 Qin Jian 2022-08-17  168  		if ((n * F_27M) =3D=3D nf)
5673230d6a56d6 Qin Jian 2022-08-17  169  			break;
5673230d6a56d6 Qin Jian 2022-08-17  170  	}
5673230d6a56d6 Qin Jian 2022-08-17 @171  	m =3D m_table[m];
5673230d6a56d6 Qin Jian 2022-08-17  172  =

5673230d6a56d6 Qin Jian 2022-08-17  173  	if (!m) {
5673230d6a56d6 Qin Jian 2022-08-17  174  		ret =3D -EINVAL;
5673230d6a56d6 Qin Jian 2022-08-17  175  		goto err_not_found;
5673230d6a56d6 Qin Jian 2022-08-17  176  	}
5673230d6a56d6 Qin Jian 2022-08-17  177  =

5673230d6a56d6 Qin Jian 2022-08-17  178  	/* save parameters */
5673230d6a56d6 Qin Jian 2022-08-17  179  	clk->p[SEL_FRA] =3D 0;
5673230d6a56d6 Qin Jian 2022-08-17  180  	clk->p[DIVR]    =3D r;
5673230d6a56d6 Qin Jian 2022-08-17  181  	clk->p[DIVN]    =3D n;
5673230d6a56d6 Qin Jian 2022-08-17  182  	clk->p[DIVM]    =3D m;
5673230d6a56d6 Qin Jian 2022-08-17  183  =

5673230d6a56d6 Qin Jian 2022-08-17  184  	return freq;
5673230d6a56d6 Qin Jian 2022-08-17  185  =

5673230d6a56d6 Qin Jian 2022-08-17  186  err_not_found:
5673230d6a56d6 Qin Jian 2022-08-17  187  	pr_err("%s: %s freq:%lu not found=
 a valid setting\n",
5673230d6a56d6 Qin Jian 2022-08-17  188  	       __func__, clk_hw_get_name(=
&clk->hw), freq);
5673230d6a56d6 Qin Jian 2022-08-17  189  =

5673230d6a56d6 Qin Jian 2022-08-17  190  	return ret;
5673230d6a56d6 Qin Jian 2022-08-17  191  }
5673230d6a56d6 Qin Jian 2022-08-17  192  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5773631940385328740==--

