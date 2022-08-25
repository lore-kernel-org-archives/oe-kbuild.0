Content-Type: multipart/mixed; boundary="===============5671932863541516943=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: Add Sunplus SP7021 clock driver
Date: Thu, 25 Aug 2022 22:17:19 +0800
Message-ID: <202208252211.VA2BkGfo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5671932863541516943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/c=
lk/clk-sp7021.c:417:25: warning: Parameter 'prate' can be declared with con=
st [constParameter]"
:::::: =


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
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5673230d6a56d6c37b8db18d202c0ef526f52b2e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/clk-sp7021.c:417:25: warning: Parameter 'prate' can be decla=
red with const [constParameter]
            unsigned long *prate)
                           ^

vim +/prate +417 drivers/clk/clk-sp7021.c

5673230d6a56d6 Qin Jian 2022-08-17  415  =

5673230d6a56d6 Qin Jian 2022-08-17  416  static long sp_pll_round_rate(stru=
ct clk_hw *hw, unsigned long rate,
5673230d6a56d6 Qin Jian 2022-08-17 @417  			      unsigned long *prate)
5673230d6a56d6 Qin Jian 2022-08-17  418  {
5673230d6a56d6 Qin Jian 2022-08-17  419  	struct sp_pll *clk =3D to_sp_pll(=
hw);
5673230d6a56d6 Qin Jian 2022-08-17  420  	long ret;
5673230d6a56d6 Qin Jian 2022-08-17  421  =

5673230d6a56d6 Qin Jian 2022-08-17  422  	if (rate =3D=3D *prate) {
5673230d6a56d6 Qin Jian 2022-08-17  423  		ret =3D *prate; /* bypass */
5673230d6a56d6 Qin Jian 2022-08-17  424  	} else if (clk->div_width =3D=3D =
DIV_A) {
5673230d6a56d6 Qin Jian 2022-08-17  425  		ret =3D plla_round_rate(clk, rat=
e);
5673230d6a56d6 Qin Jian 2022-08-17  426  	} else if (clk->div_width =3D=3D =
DIV_TV) {
5673230d6a56d6 Qin Jian 2022-08-17  427  		ret =3D plltv_div(clk, rate);
5673230d6a56d6 Qin Jian 2022-08-17  428  		if (ret < 0)
5673230d6a56d6 Qin Jian 2022-08-17  429  			ret =3D *prate;
5673230d6a56d6 Qin Jian 2022-08-17  430  	} else {
5673230d6a56d6 Qin Jian 2022-08-17  431  		ret =3D sp_pll_calc_div(clk, rat=
e) * clk->brate;
5673230d6a56d6 Qin Jian 2022-08-17  432  	}
5673230d6a56d6 Qin Jian 2022-08-17  433  =

5673230d6a56d6 Qin Jian 2022-08-17  434  	return ret;
5673230d6a56d6 Qin Jian 2022-08-17  435  }
5673230d6a56d6 Qin Jian 2022-08-17  436  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5671932863541516943==--

