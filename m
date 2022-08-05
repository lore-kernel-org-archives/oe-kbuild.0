Content-Type: multipart/mixed; boundary="===============6276974460905485660=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8547/14565] drivers/opp/core.c:876 dev_pm_opp_config_clks_simple() error: uninitialized symbol 'ret'.
Date: Sat, 06 Aug 2022 05:12:30 +0800
Message-ID: <202208060502.J5TJW2Zh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6276974460905485660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e894659f149e779bc1b49016231d75994f6a29e9
commit: 8174a3a613af1a911ab19da812824f7180b261f9 [8547/14565] OPP: Provide =
a simple implementation to configure multiple clocks
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
806/202208060502.J5TJW2Zh-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/opp/core.c:876 dev_pm_opp_config_clks_simple() error: uninitialized=
 symbol 'ret'.

Old smatch warnings:
drivers/opp/core.c:2372 _opp_attach_genpd() warn: passing zero to 'PTR_ERR'
drivers/opp/core.c:2811 _opp_set_availability() warn: passing a valid point=
er to 'PTR_ERR'
drivers/opp/core.c:2887 dev_pm_opp_adjust_voltage() warn: passing a valid p=
ointer to 'PTR_ERR'

vim +/ret +876 drivers/opp/core.c

947355850fcb3b drivers/base/power/opp/core.c Viresh Kumar 2016-12-01  845  =

8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  846  =
/*
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  847  =
 * Simple implementation for configuring multiple clocks. Configure clocks =
in
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  848  =
 * the order in which they are present in the array while scaling up.
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  849  =
 */
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  850  =
int dev_pm_opp_config_clks_simple(struct device *dev,
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  851  =
		struct opp_table *opp_table, struct dev_pm_opp *opp, void *data,
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  852  =
		bool scaling_down)
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  853  {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  854  =
	int ret, i;
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  855  =

8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  856  =
	if (scaling_down) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  857  =
		for (i =3D opp_table->clk_count - 1; i >=3D 0; i--) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  858  =
			ret =3D clk_set_rate(opp_table->clks[i], opp->rates[i]);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  859  =
			if (ret) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  860  =
				dev_err(dev, "%s: failed to set clock rate: %d\n", __func__,
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  861  =
					ret);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  862  =
				return ret;
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  863  =
			}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  864  =
		}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  865  =
	} else {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  866  =
		for (i =3D 0; i < opp_table->clk_count; i++) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  867  =
			ret =3D clk_set_rate(opp_table->clks[i], opp->rates[i]);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  868  =
			if (ret) {
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  869  =
				dev_err(dev, "%s: failed to set clock rate: %d\n", __func__,
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  870  =
					ret);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  871  =
				return ret;
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  872  =
			}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  873  =
		}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  874  =
	}
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  875  =

8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10 @876  =
	return ret;
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  877  }
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  878  =
EXPORT_SYMBOL_GPL(dev_pm_opp_config_clks_simple);
8174a3a613af1a drivers/opp/core.c            Viresh Kumar 2022-06-10  879  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6276974460905485660==--

