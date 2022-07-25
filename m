Content-Type: multipart/mixed; boundary="===============3622488644918745640=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 9/9] sched/psi: add PSI_IRQ to track IRQ/SOFTIRQ pressure
Date: Mon, 25 Jul 2022 09:41:34 +0800
Message-ID: <202207250938.YmyF2l5b-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3622488644918745640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220721040439.2651-10-zhouchengming@bytedance.com>
References: <20220721040439.2651-10-zhouchengming@bytedance.com>
TO: Chengming Zhou <zhouchengming@bytedance.com>
TO: hannes(a)cmpxchg.org
TO: surenb(a)google.com
TO: mingo(a)redhat.com
TO: peterz(a)infradead.org
TO: tj(a)kernel.org
TO: corbet(a)lwn.net
TO: akpm(a)linux-foundation.org
TO: rdunlap(a)infradead.org
CC: linux-doc(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: songmuchun(a)bytedance.com
CC: cgroups(a)vger.kernel.org
CC: Chengming Zhou <zhouchengming@bytedance.com>

Hi Chengming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on akpm-mm/mm-everything linus/master v5.19-rc8]
[cannot apply to tj-cgroup/for-next next-20220722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengming-Zhou/sched=
-psi-some-optimization-and-extension/20220721-120833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 401e496=
3bf45c800e3e9ea0d3a0289d738005fd4
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
725/202207250938.YmyF2l5b-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/psi.c:1475 psi_proc_init() warn: proc file '"pressure/irq"' is=
 world writable

vim +1475 kernel/sched/psi.c

d14f2a9ff31fef Chengming Zhou     2022-07-21  1466  =

eb414681d5a07d Johannes Weiner    2018-10-26  1467  static int __init psi_p=
roc_init(void)
eb414681d5a07d Johannes Weiner    2018-10-26  1468  {
3d817689a62cf7 Wang Long          2019-12-18  1469  	if (psi_enable) {
eb414681d5a07d Johannes Weiner    2018-10-26  1470  		proc_mkdir("pressure"=
, NULL);
6db12ee0456d0e Josh Hunt          2021-04-01  1471  		proc_create("pressure=
/io", 0666, NULL, &psi_io_proc_ops);
6db12ee0456d0e Josh Hunt          2021-04-01  1472  		proc_create("pressure=
/memory", 0666, NULL, &psi_memory_proc_ops);
6db12ee0456d0e Josh Hunt          2021-04-01  1473  		proc_create("pressure=
/cpu", 0666, NULL, &psi_cpu_proc_ops);
d14f2a9ff31fef Chengming Zhou     2022-07-21  1474  #ifdef CONFIG_IRQ_TIME_=
ACCOUNTING
d14f2a9ff31fef Chengming Zhou     2022-07-21 @1475  		proc_create("pressure=
/irq", 0666, NULL, &psi_irq_proc_ops);
d14f2a9ff31fef Chengming Zhou     2022-07-21  1476  #endif
3d817689a62cf7 Wang Long          2019-12-18  1477  	}
eb414681d5a07d Johannes Weiner    2018-10-26  1478  	return 0;
eb414681d5a07d Johannes Weiner    2018-10-26  1479  }
eb414681d5a07d Johannes Weiner    2018-10-26  1480  module_init(psi_proc_in=
it);
5102bb1c9f8285 Suren Baghdasaryan 2022-01-19  1481  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3622488644918745640==--

