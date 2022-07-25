Content-Type: multipart/mixed; boundary="===============8096967075503763402=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cpufreq/scmi-cpufreq.c:35:23: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 25 Jul 2022 10:22:20 +0800
Message-ID: <202207251018.79bEqs2S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8096967075503763402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/cpufreq/scmi-cpufreq.c:35:23: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: e8419c24bacee45bfe3504814e91fc89ff8c23de firmware: arm_scmi: Make S=
CMI transports configurable
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220725/202207251018.79bEqs2S-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8419c24bacee45bfe3504814e91fc89ff8c23de
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8419c24bacee45bfe3504814e91fc89ff8c23de
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/cpufreq/scmi-cpufreq.c: In function 'scmi_cpufreq_get_rate':
>> drivers/cpufreq/scmi-cpufreq.c:35:23: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      35 |         unsigned long rate;
         |                       ^~~~
     'scmi_cpufreq_get_rate': event 1
       |
       |   35 |         unsigned long rate;
       |      |                       ^~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   drivers/cpufreq/scmi-cpufreq.c: In function 'scmi_cpufreq_init':
   drivers/cpufreq/scmi-cpufreq.c:125:41: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     125 |         struct cpufreq_frequency_table *freq_table;
         |                                         ^~~~~~~~~~
     'scmi_cpufreq_init': event 1
       |
       |  125 |         struct cpufreq_frequency_table *freq_table;
       |      |                                         ^~~~~~~~~~
       |      |                                         |
       |      |                                         (1) use of uninitia=
lized value '<unknown>' here
       |
--
   drivers/reset/reset-scmi.c: In function 'scmi_reset_probe':
>> drivers/reset/reset-scmi.c:95:38: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      95 |         struct scmi_protocol_handle *ph;
         |                                      ^~
     'scmi_reset_probe': event 1
       |
       |   95 |         struct scmi_protocol_handle *ph;
       |      |                                      ^~
       |      |                                      |
       |      |                                      (1) use of uninitializ=
ed value '<unknown>' here
       |

vim +35 drivers/cpufreq/scmi-cpufreq.c

99d6bdf3387734 Sudeep Holla     2017-06-18  30  =

99d6bdf3387734 Sudeep Holla     2017-06-18  31  static unsigned int scmi_cp=
ufreq_get_rate(unsigned int cpu)
99d6bdf3387734 Sudeep Holla     2017-06-18  32  {
99d6bdf3387734 Sudeep Holla     2017-06-18  33  	struct cpufreq_policy *pol=
icy =3D cpufreq_cpu_get_raw(cpu);
99d6bdf3387734 Sudeep Holla     2017-06-18  34  	struct scmi_data *priv =3D=
 policy->driver_data;
99d6bdf3387734 Sudeep Holla     2017-06-18 @35  	unsigned long rate;
99d6bdf3387734 Sudeep Holla     2017-06-18  36  	int ret;
99d6bdf3387734 Sudeep Holla     2017-06-18  37  =

eb1d35c6e3fc71 Cristian Marussi 2021-03-16  38  	ret =3D perf_ops->freq_get=
(ph, priv->domain_id, &rate, false);
99d6bdf3387734 Sudeep Holla     2017-06-18  39  	if (ret)
99d6bdf3387734 Sudeep Holla     2017-06-18  40  		return 0;
99d6bdf3387734 Sudeep Holla     2017-06-18  41  	return rate / 1000;
99d6bdf3387734 Sudeep Holla     2017-06-18  42  }
99d6bdf3387734 Sudeep Holla     2017-06-18  43  =


:::::: The code at line 35 was first introduced by commit
:::::: 99d6bdf3387734d75e3e34e94a58b8a355b7a9c8 cpufreq: add support for CP=
U DVFS based on SCMI message protocol

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8096967075503763402==--

