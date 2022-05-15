Content-Type: multipart/mixed; boundary="===============2423543625840502948=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 6/7] sched/fair: Add sched group latency support
Date: Sun, 15 May 2022 16:28:48 +0800
Message-ID: <202205151601.2cHPPsvk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2423543625840502948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220512163534.2572-7-vincent.guittot@linaro.org>
References: <20220512163534.2572-7-vincent.guittot@linaro.org>
TO: Vincent Guittot <vincent.guittot@linaro.org>

Hi Vincent,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linux/master tip/master linus/master v5.18-rc6 =
next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Guittot/Add-=
latency_nice-priority/20220513-005836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 734387e=
c2f9d77b00276042b1fa7c95f48ee879d
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220515/202205151601.2cHPPsvk-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/sched/fair.c:11785 sched_group_set_latency() error: buffer overflow =
'sched_latency_to_weight' 40 <=3D 40
kernel/sched/fair.c:11785 sched_group_set_latency() error: buffer overflow =
'sched_latency_to_weight' 40 <=3D 40

vim +/sched_latency_to_weight +11785 kernel/sched/fair.c

304000390f88d0 Josh Don        2021-07-29  11761  =

632b7c939b164d Vincent Guittot 2022-05-12  11762  int sched_group_set_laten=
cy(struct task_group *tg, long latency_prio)
632b7c939b164d Vincent Guittot 2022-05-12  11763  {
632b7c939b164d Vincent Guittot 2022-05-12  11764  	int i;
632b7c939b164d Vincent Guittot 2022-05-12  11765  =

632b7c939b164d Vincent Guittot 2022-05-12  11766  	if (tg =3D=3D &root_task=
_group)
632b7c939b164d Vincent Guittot 2022-05-12  11767  		return -EINVAL;
632b7c939b164d Vincent Guittot 2022-05-12  11768  =

632b7c939b164d Vincent Guittot 2022-05-12  11769  	if (latency_prio < 0 ||
632b7c939b164d Vincent Guittot 2022-05-12  11770  	    latency_prio > LATEN=
CY_NICE_WIDTH)
632b7c939b164d Vincent Guittot 2022-05-12  11771  		return -EINVAL;
632b7c939b164d Vincent Guittot 2022-05-12  11772  =

632b7c939b164d Vincent Guittot 2022-05-12  11773  	mutex_lock(&shares_mutex=
);
632b7c939b164d Vincent Guittot 2022-05-12  11774  =

632b7c939b164d Vincent Guittot 2022-05-12  11775  	if (tg->latency_prio =3D=
=3D latency_prio) {
632b7c939b164d Vincent Guittot 2022-05-12  11776  		mutex_unlock(&shares_mu=
tex);
632b7c939b164d Vincent Guittot 2022-05-12  11777  		return 0;
632b7c939b164d Vincent Guittot 2022-05-12  11778  	}
632b7c939b164d Vincent Guittot 2022-05-12  11779  =

632b7c939b164d Vincent Guittot 2022-05-12  11780  	tg->latency_prio =3D lat=
ency_prio;
632b7c939b164d Vincent Guittot 2022-05-12  11781  =

632b7c939b164d Vincent Guittot 2022-05-12  11782  	for_each_possible_cpu(i)=
 {
632b7c939b164d Vincent Guittot 2022-05-12  11783  		struct sched_entity *se=
 =3D tg->se[i];
632b7c939b164d Vincent Guittot 2022-05-12  11784  =

632b7c939b164d Vincent Guittot 2022-05-12 @11785  		WRITE_ONCE(se->latency_=
weight, sched_latency_to_weight[latency_prio]);
632b7c939b164d Vincent Guittot 2022-05-12  11786  	}
632b7c939b164d Vincent Guittot 2022-05-12  11787  =

632b7c939b164d Vincent Guittot 2022-05-12  11788  	mutex_unlock(&shares_mut=
ex);
632b7c939b164d Vincent Guittot 2022-05-12  11789  	return 0;
632b7c939b164d Vincent Guittot 2022-05-12  11790  }
632b7c939b164d Vincent Guittot 2022-05-12  11791  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2423543625840502948==--

