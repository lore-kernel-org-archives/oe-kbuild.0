Content-Type: multipart/mixed; boundary="===============5724562387429124336=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] sched/core: add forced idle accounting for cgroups
Date: Sat, 21 May 2022 15:32:29 +0800
Message-ID: <202205211525.XlF6P8dM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5724562387429124336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220520235138.3140590-1-joshdon@google.com>
References: <20220520235138.3140590-1-joshdon@google.com>
TO: Josh Don <joshdon@google.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Juri Lelli <juri.lelli@redhat.com>
TO: Vincent Guittot <vincent.guittot@linaro.org>
TO: Tejun Heo <tj@kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Ben Segall <bsegall@google.com>
CC: Mel Gorman <mgorman@suse.de>
CC: Daniel Bristot de Oliveira <bristot@redhat.com>
CC: Valentin Schneider <vschneid@redhat.com>
CC: linux-kernel(a)vger.kernel.org
CC: Cruz Zhao <CruzZhao@linux.alibaba.com>
CC: Josh Don <joshdon@google.com>

Hi Josh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tj-cgroup/for-next]
[also build test WARNING on tip/sched/core tip/master v5.18-rc7 next-202205=
20]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Don/sched-core-=
add-forced-idle-accounting-for-cgroups/20220521-075311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-n=
ext
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20521/202205211525.XlF6P8dM-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/cgroup/rstat.c:489 cgroup_base_stat_cputime_show() error: uninitiali=
zed symbol 'forceidle_time'.

vim +/forceidle_time +489 kernel/cgroup/rstat.c

936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  459  =

d4ff749b5e0f1e kernel/cgroup/rstat.c Tejun Heo    2018-04-26  460  void cgr=
oup_base_stat_cputime_show(struct seq_file *seq)
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  461  {
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  462  	struct =
cgroup *cgrp =3D seq_css(seq)->cgroup;
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  463  	u64 usa=
ge, utime, stime;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  464  	struct =
cgroup_base_stat bstat;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  465  	u64 __m=
aybe_unused forceidle_time;
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  466  =

936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  467  	if (cgr=
oup_parent(cgrp)) {
6162cef0f741c7 kernel/cgroup/rstat.c Tejun Heo    2018-04-26  468  		cgroup=
_rstat_flush_hold(cgrp);
d4ff749b5e0f1e kernel/cgroup/rstat.c Tejun Heo    2018-04-26  469  		usage =
=3D cgrp->bstat.cputime.sum_exec_runtime;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  470  		cputim=
e_adjust(&cgrp->bstat.cputime, &cgrp->prev_cputime,
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  471  			     =
  &utime, &stime);
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  472  #ifdef C=
ONFIG_SCHED_CORE
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  473  		forcei=
dle_time =3D cgrp->bstat.forceidle_sum;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  474  #endif
6162cef0f741c7 kernel/cgroup/rstat.c Tejun Heo    2018-04-26  475  		cgroup=
_rstat_flush_release();
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  476  	} else {
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  477  		root_c=
group_cputime(&bstat);
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  478  		usage =
=3D bstat.cputime.sum_exec_runtime;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  479  		utime =
=3D bstat.cputime.utime;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  480  		stime =
=3D bstat.cputime.stime;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  481  #ifdef C=
ONFIG_SCHED_CORE
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  482  		forcei=
dle_time =3D bstat.forceidle_sum;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  483  #endif
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  484  	}
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  485  =

041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  486  	do_div(=
usage, NSEC_PER_USEC);
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  487  	do_div(=
utime, NSEC_PER_USEC);
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  488  	do_div(=
stime, NSEC_PER_USEC);
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20 @489  	do_div(=
forceidle_time, NSEC_PER_USEC);
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  490  =

d41bf8c9deaed1 kernel/cgroup/stat.c  Tejun Heo    2017-10-23  491  	seq_pri=
ntf(seq, "usage_usec %llu\n"
d41bf8c9deaed1 kernel/cgroup/stat.c  Tejun Heo    2017-10-23  492  		   "us=
er_usec %llu\n"
d41bf8c9deaed1 kernel/cgroup/stat.c  Tejun Heo    2017-10-23  493  		   "sy=
stem_usec %llu\n",
d41bf8c9deaed1 kernel/cgroup/stat.c  Tejun Heo    2017-10-23  494  		   usa=
ge, utime, stime);
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  495  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5724562387429124336==--

