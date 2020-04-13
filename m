Content-Type: multipart/mixed; boundary="===============7800077890376597115=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 5/5] ACPI: processor: do update when maximum cooling state changed
Date: Mon, 13 Apr 2020 13:07:45 +0800
Message-ID: <202004131330.xccnU9tF%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7800077890376597115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200408041917.2329-5-rui.zhang@intel.com>
References: <20200408041917.2329-5-rui.zhang@intel.com>
TO: Zhang Rui <rui.zhang@intel.com>

Hi Zhang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on pm/linux-next]
[also build test WARNING on linus/master v5.7-rc1 next-20200412]
[cannot apply to soc-thermal/next]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Zhang-Rui/thermal-rename-t=
hermal_cooling_device_stats_update/20200408-122131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 linux-next
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/acpi/processor_thermal.c:158 acpi_thermal_cpufreq_exit() error: we =
previously assumed 'pr' could be null (see line 156)

# https://github.com/0day-ci/linux/commit/7d1c8f3879a36c7230c2842c651c4a3ce=
66b3d61
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 7d1c8f3879a36c7230c2842c651c4a3ce66b3d61
vim +/pr +158 drivers/acpi/processor_thermal.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  148  =

3000ce3c52f8b8 Rafael J. Wysocki 2019-10-16  149  void acpi_thermal_cpufreq=
_exit(struct cpufreq_policy *policy)
4be44fcd3bf648 Len Brown         2005-08-05  150  {
a1bb46c36ce389 Rafael J. Wysocki 2019-10-25  151  	unsigned int cpu;
a1bb46c36ce389 Rafael J. Wysocki 2019-10-25  152  =

a1bb46c36ce389 Rafael J. Wysocki 2019-10-25  153  	for_each_cpu(cpu, policy=
->related_cpus) {
3000ce3c52f8b8 Rafael J. Wysocki 2019-10-16  154  		struct acpi_processor *=
pr =3D per_cpu(processors, policy->cpu);
^1da177e4c3f41 Linus Torvalds    2005-04-16  155  =

2d8b39a62a5d38 Rafael J. Wysocki 2019-10-15 @156  		if (pr)
3000ce3c52f8b8 Rafael J. Wysocki 2019-10-16  157  			freq_qos_remove_reques=
t(&pr->thermal_req);
7d1c8f3879a36c Zhang Rui         2020-04-08 @158  		thermal_cdev_stats_upda=
te_max(pr->cdev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  159  	}
a1bb46c36ce389 Rafael J. Wysocki 2019-10-25  160  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  161  #else				/* ! CONFIG_CPU_=
FREQ */
d9460fd227ed2c Zhang Rui         2008-01-17  162  static int cpufreq_get_ma=
x_state(unsigned int cpu)
d9460fd227ed2c Zhang Rui         2008-01-17  163  {
d9460fd227ed2c Zhang Rui         2008-01-17  164  	return 0;
d9460fd227ed2c Zhang Rui         2008-01-17  165  }
d9460fd227ed2c Zhang Rui         2008-01-17  166  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7800077890376597115==--

