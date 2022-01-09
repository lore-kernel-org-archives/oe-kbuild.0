Content-Type: multipart/mixed; boundary="===============7274685623078240409=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] cgroup: add cpu.stat_percpu
Date: Sun, 09 Jan 2022 18:26:26 +0800
Message-ID: <202201091818.NHNmVifK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7274685623078240409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220107234138.1765668-1-joshdon@google.com>
References: <20220107234138.1765668-1-joshdon@google.com>
TO: Josh Don <joshdon@google.com>
TO: Tejun Heo <tj@kernel.org>
TO: Zefan Li <lizefan.x@bytedance.com>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Juri Lelli <juri.lelli@redhat.com>
TO: Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Ben Segall <bsegall@google.com>

Hi Josh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tj-cgroup/for-next]
[also build test WARNING on tip/sched/core tip/master v5.16-rc8 next-202201=
07]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Josh-Don/cgroup-add-cpu-st=
at_percpu/20220108-074316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-n=
ext
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-m001-20220107 (https://download.01.org/0day-ci/ar=
chive/20220109/202201091818.NHNmVifK-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/cgroup/rstat.c:531 cgroup_base_stat_percpu_cputime_show() warn: slee=
ping in atomic context

vim +531 kernel/cgroup/rstat.c

d70517c43ca623 Josh Don 2022-01-07  515  =

d70517c43ca623 Josh Don 2022-01-07  516  void cgroup_base_stat_percpu_cputi=
me_show(struct seq_file *seq)
d70517c43ca623 Josh Don 2022-01-07  517  {
d70517c43ca623 Josh Don 2022-01-07  518  	static DEFINE_MUTEX(mutex);
d70517c43ca623 Josh Don 2022-01-07  519  	static DEFINE_PER_CPU(struct cgro=
up_base_stat, cached_percpu_stats);
d70517c43ca623 Josh Don 2022-01-07  520  	struct cgroup_base_stat *cached_b=
stat;
d70517c43ca623 Josh Don 2022-01-07  521  	struct cgroup *cgrp =3D seq_css(s=
eq)->cgroup;
d70517c43ca623 Josh Don 2022-01-07  522  	u64 val;
d70517c43ca623 Josh Don 2022-01-07  523  	int cpu;
d70517c43ca623 Josh Don 2022-01-07  524  =

d70517c43ca623 Josh Don 2022-01-07  525  	/* protects cached_percpu_stats */
d70517c43ca623 Josh Don 2022-01-07  526  	mutex_lock(&mutex);
d70517c43ca623 Josh Don 2022-01-07  527  =

d70517c43ca623 Josh Don 2022-01-07  528  	if (cgroup_parent(cgrp)) {
d70517c43ca623 Josh Don 2022-01-07  529  		struct cgroup_base_stat *bstat_c=
pu;
d70517c43ca623 Josh Don 2022-01-07  530  =

d70517c43ca623 Josh Don 2022-01-07 @531  		cgroup_rstat_flush_hold(cgrp);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7274685623078240409==--

