Content-Type: multipart/mixed; boundary="===============3269146412082671056=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vireshk-pm:opp/linux-next-test 5/50] drivers/opp/core.c:2638 _opp_clear_config() warn: bitwise AND condition is false here
Date: Fri, 15 Jul 2022 01:44:13 +0800
Message-ID: <202207150157.Yid4l1j2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3269146412082671056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/=
linux-next-test
head:   d7f671015564465f7efb949cc6038d547519ba7c
commit: 2732befa43efb7c0f46a93104ad4b1859ff22432 [5/50] OPP: Add dev_pm_opp=
_set_config() and friends
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20715/202207150157.Yid4l1j2-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/opp/core.c:2638 _opp_clear_config() warn: bitwise AND condition is =
false here

Old smatch warnings:
drivers/opp/core.c:2544 dev_pm_opp_attach_genpd() warn: passing zero to 'PT=
R_ERR'

vim +2638 drivers/opp/core.c

b4b9e223eccaeec Dmitry Osipenko 2021-01-18  2625  =

2732befa43efb7c Viresh Kumar    2022-05-25  2626  static void _opp_clear_co=
nfig(struct opp_config_idr *data)
2732befa43efb7c Viresh Kumar    2022-05-25  2627  {
2732befa43efb7c Viresh Kumar    2022-05-25  2628  	if (data->flags & OPP_CO=
NFIG_GENPD)
2732befa43efb7c Viresh Kumar    2022-05-25  2629  		dev_pm_opp_detach_genpd=
(data->opp_table);
2732befa43efb7c Viresh Kumar    2022-05-25  2630  	if (data->flags & OPP_CO=
NFIG_REGULATOR)
2732befa43efb7c Viresh Kumar    2022-05-25  2631  		dev_pm_opp_put_regulato=
rs(data->opp_table);
2732befa43efb7c Viresh Kumar    2022-05-25  2632  	if (data->flags & OPP_CO=
NFIG_SUPPORTED_HW)
2732befa43efb7c Viresh Kumar    2022-05-25  2633  		dev_pm_opp_put_supporte=
d_hw(data->opp_table);
2732befa43efb7c Viresh Kumar    2022-05-25  2634  	if (data->flags & OPP_CO=
NFIG_REGULATOR_HELPER)
2732befa43efb7c Viresh Kumar    2022-05-25  2635  		dev_pm_opp_unregister_s=
et_opp_helper(data->opp_table);
2732befa43efb7c Viresh Kumar    2022-05-25  2636  	if (data->flags & OPP_CO=
NFIG_PROP_NAME)
2732befa43efb7c Viresh Kumar    2022-05-25  2637  		dev_pm_opp_put_prop_nam=
e(data->opp_table);
2732befa43efb7c Viresh Kumar    2022-05-25 @2638  	if (data->flags & OPP_CO=
NFIG_CLK)
2732befa43efb7c Viresh Kumar    2022-05-25  2639  		dev_pm_opp_put_clkname(=
data->opp_table);
2732befa43efb7c Viresh Kumar    2022-05-25  2640  =

2732befa43efb7c Viresh Kumar    2022-05-25  2641  	dev_pm_opp_put_opp_table=
(data->opp_table);
2732befa43efb7c Viresh Kumar    2022-05-25  2642  	kfree(data);
2732befa43efb7c Viresh Kumar    2022-05-25  2643  }
2732befa43efb7c Viresh Kumar    2022-05-25  2644  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3269146412082671056==--

