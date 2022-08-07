Content-Type: multipart/mixed; boundary="===============7737908964067131831=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3071:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 07 Aug 2022 09:57:54 +0800
Message-ID: <202208070923.mD9P1QnE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7737908964067131831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3071:13: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d1044fcb996e8de9b9ab392f4a767890e45202d
commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make DEBUG_=
INFO selectable from a choice
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220803 (https://download.01.org/0day-ci/archi=
ve/20220807/202208070923.mD9P1QnE-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df9b3cd24578401e7a392974b3353277286e49cee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f9b3cd24578401e7a392974b3353277286e49cee
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c: In function 'gfx_v7_0_compute_que=
ue_init':
>> drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3071:13: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    3071 |         u64 mqd_gpu_addr;
         |             ^~~~~~~~~~~~
     'gfx_v7_0_cp_compute_resume': events 1-4
       |
       | 3107 | static int gfx_v7_0_cp_compute_resume(struct amdgpu_device =
*adev)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'gfx_v7_0_cp_compute_resume'
       |......
       | 3124 |         for (i =3D 0; i < adev->gfx.num_compute_rings; i++)=
 {
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (2) following 'true' branch...
       | 3125 |                 r =3D gfx_v7_0_compute_queue_init(adev, i);
       |      |                 ~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |   |
       |      |                 |   (4) calling 'gfx_v7_0_compute_queue_ini=
t' from 'gfx_v7_0_cp_compute_resume'
       |      |                 (3) ...to here
       |
       +--> 'gfx_v7_0_compute_queue_init': events 5-6
              |
              | 3068 | static int gfx_v7_0_compute_queue_init(struct amdgpu=
_device *adev, int ring_id)
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'gfx_v7_0_compute_queue_init'
              |......
              | 3071 |         u64 mqd_gpu_addr;
              |      |             ~~~~~~~~~~~~
              |      |             |
              |      |             (6) use of uninitialized value '<unknown=
>' here
              |
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3072:25: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    3072 |         struct cik_mqd *mqd;
         |                         ^~~
     'gfx_v7_0_cp_compute_resume': events 1-4
       |
       | 3107 | static int gfx_v7_0_cp_compute_resume(struct amdgpu_device =
*adev)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'gfx_v7_0_cp_compute_resume'
       |......
       | 3124 |         for (i =3D 0; i < adev->gfx.num_compute_rings; i++)=
 {
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (2) following 'true' branch...
       | 3125 |                 r =3D gfx_v7_0_compute_queue_init(adev, i);
       |      |                 ~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |   |
       |      |                 |   (4) calling 'gfx_v7_0_compute_queue_ini=
t' from 'gfx_v7_0_cp_compute_resume'
       |      |                 (3) ...to here
       |
       +--> 'gfx_v7_0_compute_queue_init': events 5-6
              |
              | 3068 | static int gfx_v7_0_compute_queue_init(struct amdgpu=
_device *adev, int ring_id)
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'gfx_v7_0_compute_queue_init'
              |......
              | 3072 |         struct cik_mqd *mqd;
              |      |                         ~~~
              |      |                         |
              |      |                         (6) use of uninitialized val=
ue '<unknown>' here
              |

vim +3071 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c

34130fb1493c91 Andres Rodriguez 2017-04-12  3067  =

34130fb1493c91 Andres Rodriguez 2017-04-12  3068  static int gfx_v7_0_compu=
te_queue_init(struct amdgpu_device *adev, int ring_id)
34130fb1493c91 Andres Rodriguez 2017-04-12  3069  {
34130fb1493c91 Andres Rodriguez 2017-04-12  3070  	int r;
34130fb1493c91 Andres Rodriguez 2017-04-12 @3071  	u64 mqd_gpu_addr;
486d807cd9a95e Andres Rodriguez 2017-02-01  3072  	struct cik_mqd *mqd;
34130fb1493c91 Andres Rodriguez 2017-04-12  3073  	struct amdgpu_ring *ring=
 =3D &adev->gfx.compute_ring[ring_id];
34130fb1493c91 Andres Rodriguez 2017-04-12  3074  =

a4a02777892c16 Christian K=C3=B6nig  2017-07-27  3075  	r =3D amdgpu_bo_cre=
ate_reserved(adev, sizeof(struct cik_mqd), PAGE_SIZE,
a4a02777892c16 Christian K=C3=B6nig  2017-07-27  3076  				      AMDGPU_GEM=
_DOMAIN_GTT, &ring->mqd_obj,
a4a02777892c16 Christian K=C3=B6nig  2017-07-27  3077  				      &mqd_gpu_a=
ddr, (void **)&mqd);
34130fb1493c91 Andres Rodriguez 2017-04-12  3078  	if (r) {
34130fb1493c91 Andres Rodriguez 2017-04-12  3079  		dev_warn(adev->dev, "(%=
d) create MQD bo failed\n", r);
34130fb1493c91 Andres Rodriguez 2017-04-12  3080  		return r;
34130fb1493c91 Andres Rodriguez 2017-04-12  3081  	}
34130fb1493c91 Andres Rodriguez 2017-04-12  3082  =

34130fb1493c91 Andres Rodriguez 2017-04-12  3083  	mutex_lock(&adev->srbm_m=
utex);
34130fb1493c91 Andres Rodriguez 2017-04-12  3084  	cik_srbm_select(adev, ri=
ng->me, ring->pipe, ring->queue, 0);
34130fb1493c91 Andres Rodriguez 2017-04-12  3085  =

34130fb1493c91 Andres Rodriguez 2017-04-12  3086  	gfx_v7_0_mqd_init(adev, =
mqd, mqd_gpu_addr, ring);
34130fb1493c91 Andres Rodriguez 2017-04-12  3087  	gfx_v7_0_mqd_deactivate(=
adev);
34130fb1493c91 Andres Rodriguez 2017-04-12  3088  	gfx_v7_0_mqd_commit(adev=
, mqd);
a2e73f56fa6282 Alex Deucher     2015-04-20  3089  =

a2e73f56fa6282 Alex Deucher     2015-04-20  3090  	cik_srbm_select(adev, 0,=
 0, 0, 0);
a2e73f56fa6282 Alex Deucher     2015-04-20  3091  	mutex_unlock(&adev->srbm=
_mutex);
a2e73f56fa6282 Alex Deucher     2015-04-20  3092  =

a2e73f56fa6282 Alex Deucher     2015-04-20  3093  	amdgpu_bo_kunmap(ring->m=
qd_obj);
a2e73f56fa6282 Alex Deucher     2015-04-20  3094  	amdgpu_bo_unreserve(ring=
->mqd_obj);
34130fb1493c91 Andres Rodriguez 2017-04-12  3095  	return 0;
34130fb1493c91 Andres Rodriguez 2017-04-12  3096  }
a2e73f56fa6282 Alex Deucher     2015-04-20  3097  =


:::::: The code at line 3071 was first introduced by commit
:::::: 34130fb1493c91d50b04daaeb25e82eecc4483c6 drm/amdgpu: refactor MQD/HQ=
D initialization v3

:::::: TO: Andres Rodriguez <andresx7@gmail.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7737908964067131831==--

