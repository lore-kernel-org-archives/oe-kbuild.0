Content-Type: multipart/mixed; boundary="===============0156967320834319368=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vireshk-pm:opp/test 52/53] drivers/opp/core.c:2358 _opp_clear_config() warn: bitwise AND condition is false here
Date: Tue, 28 Jun 2022 10:40:14 +0800
Message-ID: <202206281001.mI9ESYuw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0156967320834319368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/=
test
head:   cd70d7b1958e83764fe7aac2d4e899d9a518f560
commit: 18de56a26e2120bb2f537c8d27858faa8c2356e8 [52/53] temp
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001-20220627 (https://download.01.org/0day-ci/ar=
chive/20220628/202206281001.mI9ESYuw-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/opp/core.c:2358 _opp_clear_config() warn: bitwise AND condition is =
false here

Old smatch warnings:
drivers/opp/core.c:877 dev_pm_opp_config_clks_simple() error: uninitialized=
 symbol 'ret'.
drivers/opp/core.c:2304 _opp_attach_genpd() warn: passing zero to 'PTR_ERR'

vim +2358 drivers/opp/core.c

b4b9e223eccaee Dmitry Osipenko 2021-01-18  2345  =

18de56a26e2120 Viresh Kumar    2022-06-27  2346  static void _opp_clear_con=
fig(struct opp_config_idr *data)
18de56a26e2120 Viresh Kumar    2022-06-27  2347  {
18de56a26e2120 Viresh Kumar    2022-06-27  2348  	if (data->flags & OPP_CON=
FIG_GENPD)
18de56a26e2120 Viresh Kumar    2022-06-27  2349  		_opp_detach_genpd(data->=
opp_table);
18de56a26e2120 Viresh Kumar    2022-06-27  2350  	if (data->flags & OPP_CON=
FIG_REGULATOR)
18de56a26e2120 Viresh Kumar    2022-06-27  2351  		_opp_put_regulators(data=
->opp_table);
18de56a26e2120 Viresh Kumar    2022-06-27  2352  	if (data->flags & OPP_CON=
FIG_SUPPORTED_HW)
18de56a26e2120 Viresh Kumar    2022-06-27  2353  		_opp_put_supported_hw(da=
ta->opp_table);
18de56a26e2120 Viresh Kumar    2022-06-27  2354  	if (data->flags & OPP_CON=
FIG_REGULATOR_HELPER)
18de56a26e2120 Viresh Kumar    2022-06-27  2355  		_opp_put_config_regulato=
rs_helper(data->opp_table);
18de56a26e2120 Viresh Kumar    2022-06-27  2356  	if (data->flags & OPP_CON=
FIG_PROP_NAME)
18de56a26e2120 Viresh Kumar    2022-06-27  2357  		_opp_put_prop_name(data-=
>opp_table);
18de56a26e2120 Viresh Kumar    2022-06-27 @2358  	if (data->flags & OPP_CON=
FIG_CLK)
18de56a26e2120 Viresh Kumar    2022-06-27  2359  		_opp_put_clknames(data->=
opp_table);
18de56a26e2120 Viresh Kumar    2022-06-27  2360  =

18de56a26e2120 Viresh Kumar    2022-06-27  2361  	dev_pm_opp_put_opp_table(=
data->opp_table);
18de56a26e2120 Viresh Kumar    2022-06-27  2362  	kfree(data);
18de56a26e2120 Viresh Kumar    2022-06-27  2363  }
18de56a26e2120 Viresh Kumar    2022-06-27  2364  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0156967320834319368==--

