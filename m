Content-Type: multipart/mixed; boundary="===============1867376546937425463=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/selftests: selftest for timeline semaphore
Date: Sat, 11 Apr 2020 13:52:33 +0800
Message-ID: <202004111318.VlLDNk0s%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1867376546937425463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200410165158.29546-4-venkata.s.dhanalakota@intel.com>
References: <20200410165158.29546-4-venkata.s.dhanalakota@intel.com>
TO: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
CC: intel-gfx(a)lists.freedesktop.org
CC: chris.p.wilson(a)intel.com

Hi Venkata,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next linus/master v5.6 next-20200410]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Venkata-Sandeep-Dhanalakot=
a/drm-i915-introduce-a-mechanism-to-extend-execbuf2/20200411-031057
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:335:20: warning:=
 The scope of the variable 'f' can be reduced. [variableScope]
    struct dma_fence *f;
                      ^
   drivers/gpu/drm/selftests/drm_selftest.c:96:6: warning: The scope of the=
 variable 'err' can be reduced. [variableScope]
    int err;
        ^
>> drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:410:24: warning:=
 Local variable 'timeline' shadows outer function [shadowFunction]
    struct mock_timeline *timeline =3D arg;
                          ^
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:91:30: note: Sha=
dowed declaration
   static struct mock_timeline *timeline(u64 point, u32 flags)
                                ^
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:410:24: note: Sh=
adow variable
    struct mock_timeline *timeline =3D arg;
                          ^
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:425:24: warning:=
 Local variable 'timeline' shadows outer function [shadowFunction]
    struct mock_timeline *timeline =3D arg;
                          ^
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:91:30: note: Sha=
dowed declaration
   static struct mock_timeline *timeline(u64 point, u32 flags)
                                ^
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:425:24: note: Sh=
adow variable
    struct mock_timeline *timeline =3D arg;
                          ^

# https://github.com/0day-ci/linux/commit/362cf777546c74e0be786cf6ae2f42031=
a6a03c8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 362cf777546c74e0be786cf6ae2f42031a6a03c8
vim +/timeline +410 drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  407  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  408  static int __si=
gnal_timeline(void *arg)
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  409  {
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10 @410  	struct mock_ti=
meline *timeline =3D arg;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  411  	struct dma_fen=
ce *f;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  412  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  413  	f =3D drm_sync=
obj_fence_get(timeline->syncobj);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  414  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  415  	if (f && dma_f=
ence_wait(f, true)){
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  416  		drm_syncobj_p=
ut(timeline->syncobj);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  417  		return -EIO;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  418  	}
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  419  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  420  	return 0;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  421  }
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  422  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1867376546937425463==--

