Content-Type: multipart/mixed; boundary="===============1812071218528148790=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/base/power/domain.c:1040:2: warning: There is an unknown macro here somewhere. Configuration is required. If list_for_each_entry is a macro then please configure it. [unknownMacro]
Date: Tue, 05 Apr 2022 10:46:19 +0800
Message-ID: <202204051006.vaIwVaWF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1812071218528148790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include drivers/=
firmware/Kconfig unconditionally
date:   6 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 6 months ago
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/base/power/domain.c:1040:2: warning: There is an unknown macro h=
ere somewhere. Configuration is required. If list_for_each_entry is a macro=
 then please configure it. [unknownMacro]
    list_for_each_entry(genpd, &gpd_list, gpd_list_node)
    ^

vim +1040 drivers/base/power/domain.c

39ac5ba51b69a7 Tushar Behera     2014-03-28  1025  =

17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1026  /**
86e12eac1f7f84 Ulf Hansson       2016-12-08  1027   * genpd_power_off_unuse=
d - Power off all PM domains with no devices in use.
17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1028   */
86e12eac1f7f84 Ulf Hansson       2016-12-08  1029  static int __init genpd_=
power_off_unused(void)
17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1030  {
17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1031  	struct generic_pm_domai=
n *genpd;
17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1032  =

39ac5ba51b69a7 Tushar Behera     2014-03-28  1033  	if (pd_ignore_unused) {
39ac5ba51b69a7 Tushar Behera     2014-03-28  1034  		pr_warn("genpd: Not di=
sabling unused power domains\n");
bb4b72fc63d4c1 Ulf Hansson       2015-10-06  1035  		return 0;
39ac5ba51b69a7 Tushar Behera     2014-03-28  1036  	}
39ac5ba51b69a7 Tushar Behera     2014-03-28  1037  =

17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1038  	mutex_lock(&gpd_list_lo=
ck);
17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1039  =

17f2ae7f677f02 Rafael J. Wysocki 2011-08-14 @1040  	list_for_each_entry(gen=
pd, &gpd_list, gpd_list_node)
17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1041  		genpd_queue_power_off_=
work(genpd);
17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1042  =

17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1043  	mutex_unlock(&gpd_list_=
lock);
17f2ae7f677f02 Rafael J. Wysocki 2011-08-14  1044  =

2fe71dcdfd10d3 Ulf Hansson       2014-09-03  1045  	return 0;
2fe71dcdfd10d3 Ulf Hansson       2014-09-03  1046  }
86e12eac1f7f84 Ulf Hansson       2016-12-08  1047  late_initcall(genpd_powe=
r_off_unused);
2fe71dcdfd10d3 Ulf Hansson       2014-09-03  1048  =


:::::: The code at line 1040 was first introduced by commit
:::::: 17f2ae7f677f023997e02fd2ebabd90ea2a0390d PM / Domains: Fix build for=
 CONFIG_PM_RUNTIME unset

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1812071218528148790==--

