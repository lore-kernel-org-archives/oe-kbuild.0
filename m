Content-Type: multipart/mixed; boundary="===============1473319131975157959=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vireshk-pm:opp/linux-next 52/52] drivers/opp/core.c:858 dev_pm_opp_config_clks_simple() error: uninitialized symbol 'ret'.
Date: Sat, 11 Jun 2022 06:54:07 +0800
Message-ID: <202206110613.ltpHAnzV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1473319131975157959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/=
linux-next
head:   76c4db9b37866c60306d39ed982cba56af15ff00
commit: 76c4db9b37866c60306d39ed982cba56af15ff00 [52/52] OPP: Provide a sim=
ple implementation to configure multiple clocks
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20611/202206110613.ltpHAnzV-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/opp/core.c:858 dev_pm_opp_config_clks_simple() error: uninitialized=
 symbol 'ret'.

Old smatch warnings:
drivers/opp/core.c:2283 _opp_attach_genpd() warn: passing zero to 'PTR_ERR'

vim +/ret +858 drivers/opp/core.c

947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar 2016-12-01  827  =

76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  828  =
/*
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  829  =
 * Simple implementation for configuring multiple clocks. Configure clocks =
in
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  830  =
 * the order in which they are present in the array while scaling up.
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  831  =
 */
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  832  =
int dev_pm_opp_config_clks_simple(struct device *dev,
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  833  =
		struct opp_table *opp_table, struct dev_pm_opp *opp, void *data,
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  834  =
		bool scaling_down)
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  835  {
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  836  =
	int ret, i;
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  837  =

76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  838  =
	if (scaling_down) {
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  839  =
		for (i =3D opp_table->clk_count - 1; i >=3D 0; i--) {
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  840  =
			ret =3D clk_set_rate(opp_table->clks[i], opp->rates[i]);
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  841  =
			if (ret) {
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  842  =
				dev_err(dev, "%s: failed to set clock rate: %d\n", __func__,
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  843  =
					ret);
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  844  =
				return ret;
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  845  =
			}
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  846  =
		}
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  847  =
	} else {
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  848  =
		for (i =3D 0; i < opp_table->clk_count; i++) {
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  849  =
			ret =3D clk_set_rate(opp_table->clks[i], opp->rates[i]);
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  850  =
			if (ret) {
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  851  =
				dev_err(dev, "%s: failed to set clock rate: %d\n", __func__,
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  852  =
					ret);
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  853  =
				return ret;
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  854  =
			}
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  855  =
		}
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  856  =
	}
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  857  =

76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10 @858  =
	return ret;
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  859  }
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  860  =
EXPORT_SYMBOL_GPL(dev_pm_opp_config_clks_simple);
76c4db9b37866c drivers/opp/core.c            Viresh Kumar 2022-06-10  861  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1473319131975157959==--

