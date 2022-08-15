Content-Type: multipart/mixed; boundary="===============0678621522759268571=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] LoongArch: Add perf events support
Date: Tue, 16 Aug 2022 05:22:31 +0800
Message-ID: <202208160536.N2sRhiCY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0678621522759268571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220815124702.3330803-1-chenhuacai@loongson.cn>
References: <20220815124702.3330803-1-chenhuacai@loongson.cn>
TO: Huacai Chen <chenhuacai@loongson.cn>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Huacai Chen <chenhuacai@kernel.org>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
CC: loongarch(a)lists.linux.dev
CC: linux-arch(a)vger.kernel.org
CC: Xuefeng Li <lixuefeng@loongson.cn>
CC: Guo Ren <guoren@kernel.org>
CC: Xuerui Wang <kernel@xen0n.name>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: linux-perf-users(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Huacai,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc1 next-20220815]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/LoongArc=
h-Add-perf-events-support/20220815-204852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
568035b01cfb107af8d2e4bd2fb9aea22cf5b868
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: loongarch-randconfig-c041-20220815 (https://download.01.org/0day-ci=
/archive/20220816/202208160536.N2sRhiCY-lkp(a)intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/perf_event.c:795:2-8: preceding lock on line 785
   arch/loongarch/kernel/perf_event.c:584:4-10: preceding lock on line 578

vim +795 arch/loongarch/kernel/perf_event.c

0e6d9490ff3f61 Huacai Chen 2022-08-15  768  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  769  static int __hw_perf_event_init=
(struct perf_event *event)
0e6d9490ff3f61 Huacai Chen 2022-08-15  770  {
0e6d9490ff3f61 Huacai Chen 2022-08-15  771  	struct perf_event_attr *attr =
=3D &event->attr;
0e6d9490ff3f61 Huacai Chen 2022-08-15  772  	struct hw_perf_event *hwc =3D =
&event->hw;
0e6d9490ff3f61 Huacai Chen 2022-08-15  773  	const struct loongarch_perf_ev=
ent *pev;
0e6d9490ff3f61 Huacai Chen 2022-08-15  774  	int err;
0e6d9490ff3f61 Huacai Chen 2022-08-15  775  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  776  	/* Returning LoongArch event d=
escriptor for generic perf event. */
0e6d9490ff3f61 Huacai Chen 2022-08-15  777  	if (PERF_TYPE_HARDWARE =3D=3D =
event->attr.type) {
0e6d9490ff3f61 Huacai Chen 2022-08-15  778  		if (event->attr.config >=3D P=
ERF_COUNT_HW_MAX)
0e6d9490ff3f61 Huacai Chen 2022-08-15  779  			return -EINVAL;
0e6d9490ff3f61 Huacai Chen 2022-08-15  780  		pev =3D loongarch_pmu_map_gen=
eral_event(event->attr.config);
0e6d9490ff3f61 Huacai Chen 2022-08-15  781  	} else if (PERF_TYPE_HW_CACHE =
=3D=3D event->attr.type) {
0e6d9490ff3f61 Huacai Chen 2022-08-15  782  		pev =3D loongarch_pmu_map_cac=
he_event(event->attr.config);
0e6d9490ff3f61 Huacai Chen 2022-08-15  783  	} else if (PERF_TYPE_RAW =3D=
=3D event->attr.type) {
0e6d9490ff3f61 Huacai Chen 2022-08-15  784  		/* We are working on the glob=
al raw event. */
0e6d9490ff3f61 Huacai Chen 2022-08-15 @785  		mutex_lock(&raw_event_mutex);
0e6d9490ff3f61 Huacai Chen 2022-08-15  786  		pev =3D loongarch_pmu.map_raw=
_event(event->attr.config);
0e6d9490ff3f61 Huacai Chen 2022-08-15  787  	} else {
0e6d9490ff3f61 Huacai Chen 2022-08-15  788  		/* The event type is not (yet=
) supported. */
0e6d9490ff3f61 Huacai Chen 2022-08-15  789  		return -EOPNOTSUPP;
0e6d9490ff3f61 Huacai Chen 2022-08-15  790  	}
0e6d9490ff3f61 Huacai Chen 2022-08-15  791  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  792  	if (IS_ERR(pev)) {
0e6d9490ff3f61 Huacai Chen 2022-08-15  793  		if (PERF_TYPE_RAW =3D=3D even=
t->attr.type)
0e6d9490ff3f61 Huacai Chen 2022-08-15  794  			mutex_unlock(&raw_event_mute=
x);
0e6d9490ff3f61 Huacai Chen 2022-08-15 @795  		return PTR_ERR(pev);
0e6d9490ff3f61 Huacai Chen 2022-08-15  796  	}
0e6d9490ff3f61 Huacai Chen 2022-08-15  797  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  798  	/*
0e6d9490ff3f61 Huacai Chen 2022-08-15  799  	 * We allow max flexibility on=
 how each individual counter shared
0e6d9490ff3f61 Huacai Chen 2022-08-15  800  	 * by the single CPU operates =
(the mode exclusion and the range).
0e6d9490ff3f61 Huacai Chen 2022-08-15  801  	 */
0e6d9490ff3f61 Huacai Chen 2022-08-15  802  	hwc->config_base =3D CSR_PERFC=
TRL_IE;
0e6d9490ff3f61 Huacai Chen 2022-08-15  803  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  804  	hwc->event_base =3D loongarch_=
pmu_perf_event_encode(pev);
0e6d9490ff3f61 Huacai Chen 2022-08-15  805  	if (PERF_TYPE_RAW =3D=3D event=
->attr.type)
0e6d9490ff3f61 Huacai Chen 2022-08-15  806  		mutex_unlock(&raw_event_mutex=
);
0e6d9490ff3f61 Huacai Chen 2022-08-15  807  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  808  	if (!attr->exclude_user) {
0e6d9490ff3f61 Huacai Chen 2022-08-15  809  		hwc->config_base |=3D CSR_PER=
FCTRL_PLV3;
0e6d9490ff3f61 Huacai Chen 2022-08-15  810  		hwc->config_base |=3D CSR_PER=
FCTRL_PLV2;
0e6d9490ff3f61 Huacai Chen 2022-08-15  811  	}
0e6d9490ff3f61 Huacai Chen 2022-08-15  812  	if (!attr->exclude_kernel) {
0e6d9490ff3f61 Huacai Chen 2022-08-15  813  		hwc->config_base |=3D CSR_PER=
FCTRL_PLV0;
0e6d9490ff3f61 Huacai Chen 2022-08-15  814  	}
0e6d9490ff3f61 Huacai Chen 2022-08-15  815  	if (!attr->exclude_hv) {
0e6d9490ff3f61 Huacai Chen 2022-08-15  816  		hwc->config_base |=3D CSR_PER=
FCTRL_PLV1;
0e6d9490ff3f61 Huacai Chen 2022-08-15  817  	}
0e6d9490ff3f61 Huacai Chen 2022-08-15  818  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  819  	hwc->config_base &=3D M_PERFCT=
L_CONFIG_MASK;
0e6d9490ff3f61 Huacai Chen 2022-08-15  820  	/*
0e6d9490ff3f61 Huacai Chen 2022-08-15  821  	 * The event can belong to ano=
ther cpu. We do not assign a local
0e6d9490ff3f61 Huacai Chen 2022-08-15  822  	 * counter for it for now.
0e6d9490ff3f61 Huacai Chen 2022-08-15  823  	 */
0e6d9490ff3f61 Huacai Chen 2022-08-15  824  	hwc->idx =3D -1;
0e6d9490ff3f61 Huacai Chen 2022-08-15  825  	hwc->config =3D 0;
0e6d9490ff3f61 Huacai Chen 2022-08-15  826  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  827  	if (!hwc->sample_period) {
0e6d9490ff3f61 Huacai Chen 2022-08-15  828  		hwc->sample_period  =3D loong=
arch_pmu.max_period;
0e6d9490ff3f61 Huacai Chen 2022-08-15  829  		hwc->last_period    =3D hwc->=
sample_period;
0e6d9490ff3f61 Huacai Chen 2022-08-15  830  		local64_set(&hwc->period_left=
, hwc->sample_period);
0e6d9490ff3f61 Huacai Chen 2022-08-15  831  	}
0e6d9490ff3f61 Huacai Chen 2022-08-15  832  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  833  	err =3D 0;
0e6d9490ff3f61 Huacai Chen 2022-08-15  834  	if (event->group_leader !=3D e=
vent)
0e6d9490ff3f61 Huacai Chen 2022-08-15  835  		err =3D validate_group(event);
0e6d9490ff3f61 Huacai Chen 2022-08-15  836  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  837  	event->destroy =3D hw_perf_eve=
nt_destroy;
0e6d9490ff3f61 Huacai Chen 2022-08-15  838  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  839  	if (err)
0e6d9490ff3f61 Huacai Chen 2022-08-15  840  		event->destroy(event);
0e6d9490ff3f61 Huacai Chen 2022-08-15  841  =

0e6d9490ff3f61 Huacai Chen 2022-08-15  842  	return err;
0e6d9490ff3f61 Huacai Chen 2022-08-15  843  }
0e6d9490ff3f61 Huacai Chen 2022-08-15  844  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0678621522759268571==--

