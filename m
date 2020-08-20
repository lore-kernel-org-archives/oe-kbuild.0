Content-Type: multipart/mixed; boundary="===============4022513150998614185=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/i915_pmu.c:1131:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Thu, 20 Aug 2020 10:09:25 +0800
Message-ID: <202008201020.yt5sI91v%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4022513150998614185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CC: Chris Wilson <chris@chris-wilson.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   18445bf405cb331117bc98427b1ba6f12418ad17
commit: fb26eee0600dbd6b2eb20356b7d425cb71413ea2 drm/i915/pmu: Fix uninitia=
lized variable on error path
date:   10 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 10 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   In file included from drivers/gpu/drm/i915/i915_pmu.c:
>> drivers/gpu/drm/i915/i915_pmu.c:1131:6: warning: Variable 'ret' is reass=
igned a value before the old one has been used. [redundantAssignment]
    ret =3D perf_pmu_register(&pmu->base, pmu->name, -1);
        ^
   drivers/gpu/drm/i915/i915_pmu.c:1097:0: note: Variable 'ret' is reassign=
ed a value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   drivers/gpu/drm/i915/i915_pmu.c:1131:6: note: Variable 'ret' is reassign=
ed a value before the old one has been used.
    ret =3D perf_pmu_register(&pmu->base, pmu->name, -1);
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dfb26eee0600dbd6b2eb20356b7d425cb71413ea2
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout fb26eee0600dbd6b2eb20356b7d425cb71413ea2
vim +/ret +1131 drivers/gpu/drm/i915/i915_pmu.c

05488673a4d413 Tvrtko Ursulin 2019-10-16  1093  =

b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1094  void i915_pmu_register(stru=
ct drm_i915_private *i915)
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1095  {
908091c85003d0 Tvrtko Ursulin 2019-08-01  1096  	struct i915_pmu *pmu =3D &=
i915->pmu;
fb26eee0600dbd Tvrtko Ursulin 2019-10-18  1097  	int ret =3D -ENOMEM;
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1098  =

b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1099  	if (INTEL_GEN(i915) <=3D 2=
) {
88f8065ca73ff8 Chris Wilson   2019-08-15  1100  		dev_info(i915->drm.dev, "=
PMU not supported for this GPU.");
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1101  		return;
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1102  	}
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1103  =

908091c85003d0 Tvrtko Ursulin 2019-08-01  1104  	i915_pmu_events_attr_group=
.attrs =3D create_event_attributes(pmu);
fb26eee0600dbd Tvrtko Ursulin 2019-10-18  1105  	if (!i915_pmu_events_attr_=
group.attrs)
109ec558370f78 Tvrtko Ursulin 2018-01-11  1106  		goto err;
109ec558370f78 Tvrtko Ursulin 2018-01-11  1107  =

908091c85003d0 Tvrtko Ursulin 2019-08-01  1108  	pmu->base.attr_groups	=3D =
i915_pmu_attr_groups;
908091c85003d0 Tvrtko Ursulin 2019-08-01  1109  	pmu->base.task_ctx_nr	=3D =
perf_invalid_context;
908091c85003d0 Tvrtko Ursulin 2019-08-01  1110  	pmu->base.event_init	=3D i=
915_pmu_event_init;
908091c85003d0 Tvrtko Ursulin 2019-08-01  1111  	pmu->base.add		=3D i915_pm=
u_event_add;
908091c85003d0 Tvrtko Ursulin 2019-08-01  1112  	pmu->base.del		=3D i915_pm=
u_event_del;
908091c85003d0 Tvrtko Ursulin 2019-08-01  1113  	pmu->base.start		=3D i915_=
pmu_event_start;
908091c85003d0 Tvrtko Ursulin 2019-08-01  1114  	pmu->base.stop		=3D i915_p=
mu_event_stop;
908091c85003d0 Tvrtko Ursulin 2019-08-01  1115  	pmu->base.read		=3D i915_p=
mu_event_read;
908091c85003d0 Tvrtko Ursulin 2019-08-01  1116  	pmu->base.event_idx	=3D i9=
15_pmu_event_event_idx;
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1117  =

908091c85003d0 Tvrtko Ursulin 2019-08-01  1118  	spin_lock_init(&pmu->lock);
908091c85003d0 Tvrtko Ursulin 2019-08-01  1119  	hrtimer_init(&pmu->timer, =
CLOCK_MONOTONIC, HRTIMER_MODE_REL);
908091c85003d0 Tvrtko Ursulin 2019-08-01  1120  	pmu->timer.function =3D i9=
15_sample;
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1121  =

05488673a4d413 Tvrtko Ursulin 2019-10-16  1122  	if (!is_igp(i915))
05488673a4d413 Tvrtko Ursulin 2019-10-16  1123  		pmu->name =3D kasprintf(G=
FP_KERNEL,
05488673a4d413 Tvrtko Ursulin 2019-10-16  1124  				      "i915-%s",
05488673a4d413 Tvrtko Ursulin 2019-10-16  1125  				      dev_name(i915->dr=
m.dev));
05488673a4d413 Tvrtko Ursulin 2019-10-16  1126  	else
05488673a4d413 Tvrtko Ursulin 2019-10-16  1127  		pmu->name =3D "i915";
05488673a4d413 Tvrtko Ursulin 2019-10-16  1128  	if (!pmu->name)
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1129  		goto err;
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1130  =

05488673a4d413 Tvrtko Ursulin 2019-10-16 @1131  	ret =3D perf_pmu_register(=
&pmu->base, pmu->name, -1);
05488673a4d413 Tvrtko Ursulin 2019-10-16  1132  	if (ret)
05488673a4d413 Tvrtko Ursulin 2019-10-16  1133  		goto err_name;
05488673a4d413 Tvrtko Ursulin 2019-10-16  1134  =

908091c85003d0 Tvrtko Ursulin 2019-08-01  1135  	ret =3D i915_pmu_register_=
cpuhp_state(pmu);
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1136  	if (ret)
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1137  		goto err_unreg;
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1138  =

b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1139  	return;
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1140  =

b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1141  err_unreg:
908091c85003d0 Tvrtko Ursulin 2019-08-01  1142  	perf_pmu_unregister(&pmu->=
base);
05488673a4d413 Tvrtko Ursulin 2019-10-16  1143  err_name:
05488673a4d413 Tvrtko Ursulin 2019-10-16  1144  	if (!is_igp(i915))
05488673a4d413 Tvrtko Ursulin 2019-10-16  1145  		kfree(pmu->name);
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1146  err:
908091c85003d0 Tvrtko Ursulin 2019-08-01  1147  	pmu->base.event_init =3D N=
ULL;
908091c85003d0 Tvrtko Ursulin 2019-08-01  1148  	free_event_attributes(pmu);
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1149  	DRM_NOTE("Failed to regist=
er PMU! (err=3D%d)\n", ret);
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1150  }
b46a33e271ed81 Tvrtko Ursulin 2017-11-21  1151  =


:::::: The code at line 1131 was first introduced by commit
:::::: 05488673a4d41383f9dd537f298e525e6b00fb93 drm/i915/pmu: Support multi=
ple GPUs

:::::: TO: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
:::::: CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4022513150998614185==--

