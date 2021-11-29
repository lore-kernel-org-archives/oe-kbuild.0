Content-Type: multipart/mixed; boundary="===============6145889391546160437=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3329/3897] drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c:267 amdgpu_ctx_do_set_pstate_profile() warn: variable dereferenced before check 'ctx' (see line 262)
Date: Mon, 29 Nov 2021 10:35:49 +0800
Message-ID: <202111291005.m0XHMUFG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6145889391546160437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f30a24ed97b401416118756fa35fbe5d28f999e3
commit: c8d265840be604ebaa66a426913ecd4adb619311 [3329/3897] drm/amdgpu/UAP=
I: add new CTX OP for setting profile modes
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20211128 (https://download.01.org/0day-ci/arch=
ive/20211129/202111291005.m0XHMUFG-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c:267 amdgpu_ctx_do_set_pstate_profil=
e() warn: variable dereferenced before check 'ctx' (see line 262)

vim +/ctx +267 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c

47f38501f11fa4 Christian K=C3=B6nig 2015-08-04  258  =

c8d265840be604 Alex Deucher    2021-11-23  259  static int amdgpu_ctx_do_se=
t_pstate_profile(struct amdgpu_ctx *ctx,
c8d265840be604 Alex Deucher    2021-11-23  260  					    u32 pstate_profile)
c8d265840be604 Alex Deucher    2021-11-23  261  {
c8d265840be604 Alex Deucher    2021-11-23 @262  	struct amdgpu_device *adev=
 =3D ctx->adev;
c8d265840be604 Alex Deucher    2021-11-23  263  	const struct amd_pm_funcs =
*pp_funcs =3D adev->powerplay.pp_funcs;
c8d265840be604 Alex Deucher    2021-11-23  264  	enum amd_dpm_forced_level =
level, current_level;
c8d265840be604 Alex Deucher    2021-11-23  265  	int r =3D 0;
c8d265840be604 Alex Deucher    2021-11-23  266  =

c8d265840be604 Alex Deucher    2021-11-23 @267  	if (!ctx)
c8d265840be604 Alex Deucher    2021-11-23  268  		return -EINVAL;
c8d265840be604 Alex Deucher    2021-11-23  269  =

c8d265840be604 Alex Deucher    2021-11-23  270  	mutex_lock(&adev->pstate_p=
rofile_ctx_lock);
c8d265840be604 Alex Deucher    2021-11-23  271  	if (adev->pstate_profile_c=
tx && adev->pstate_profile_ctx !=3D ctx) {
c8d265840be604 Alex Deucher    2021-11-23  272  		r =3D -EBUSY;
c8d265840be604 Alex Deucher    2021-11-23  273  		goto done;
c8d265840be604 Alex Deucher    2021-11-23  274  	}
c8d265840be604 Alex Deucher    2021-11-23  275  =

c8d265840be604 Alex Deucher    2021-11-23  276  	switch (pstate_profile) {
c8d265840be604 Alex Deucher    2021-11-23  277  	case AMDGPU_CTX_PSTATE_PRO=
FILE_NONE:
c8d265840be604 Alex Deucher    2021-11-23  278  		level =3D AMD_DPM_FORCED_=
LEVEL_AUTO;
c8d265840be604 Alex Deucher    2021-11-23  279  		break;
c8d265840be604 Alex Deucher    2021-11-23  280  	case AMDGPU_CTX_PSTATE_PRO=
FILE_STANDARD:
c8d265840be604 Alex Deucher    2021-11-23  281  		level =3D AMD_DPM_FORCED_=
LEVEL_PROFILE_STANDARD;
c8d265840be604 Alex Deucher    2021-11-23  282  		break;
c8d265840be604 Alex Deucher    2021-11-23  283  	case AMDGPU_CTX_PSTATE_PRO=
FILE_MIN_SCLK:
c8d265840be604 Alex Deucher    2021-11-23  284  		level =3D AMD_DPM_FORCED_=
LEVEL_PROFILE_MIN_SCLK;
c8d265840be604 Alex Deucher    2021-11-23  285  		break;
c8d265840be604 Alex Deucher    2021-11-23  286  	case AMDGPU_CTX_PSTATE_PRO=
FILE_MIN_MCLK:
c8d265840be604 Alex Deucher    2021-11-23  287  		level =3D AMD_DPM_FORCED_=
LEVEL_PROFILE_MIN_MCLK;
c8d265840be604 Alex Deucher    2021-11-23  288  		break;
c8d265840be604 Alex Deucher    2021-11-23  289  	case AMDGPU_CTX_PSTATE_PRO=
FILE_PEAK:
c8d265840be604 Alex Deucher    2021-11-23  290  		level =3D AMD_DPM_FORCED_=
LEVEL_PROFILE_PEAK;
c8d265840be604 Alex Deucher    2021-11-23  291  		break;
c8d265840be604 Alex Deucher    2021-11-23  292  	default:
c8d265840be604 Alex Deucher    2021-11-23  293  		r =3D -EINVAL;
c8d265840be604 Alex Deucher    2021-11-23  294  		goto done;
c8d265840be604 Alex Deucher    2021-11-23  295  	}
c8d265840be604 Alex Deucher    2021-11-23  296  =

c8d265840be604 Alex Deucher    2021-11-23  297  	if (pp_funcs->get_performa=
nce_level)
c8d265840be604 Alex Deucher    2021-11-23  298  		current_level =3D amdgpu_=
dpm_get_performance_level(adev);
c8d265840be604 Alex Deucher    2021-11-23  299  	else
c8d265840be604 Alex Deucher    2021-11-23  300  		current_level =3D adev->p=
m.dpm.forced_level;
c8d265840be604 Alex Deucher    2021-11-23  301  =

c8d265840be604 Alex Deucher    2021-11-23  302  	if ((current_level !=3D le=
vel) && pp_funcs->force_performance_level) {
c8d265840be604 Alex Deucher    2021-11-23  303  		mutex_lock(&adev->pm.mute=
x);
c8d265840be604 Alex Deucher    2021-11-23  304  		r =3D amdgpu_dpm_force_pe=
rformance_level(adev, level);
c8d265840be604 Alex Deucher    2021-11-23  305  		if (!r)
c8d265840be604 Alex Deucher    2021-11-23  306  			adev->pm.dpm.forced_leve=
l =3D level;
c8d265840be604 Alex Deucher    2021-11-23  307  		mutex_unlock(&adev->pm.mu=
tex);
c8d265840be604 Alex Deucher    2021-11-23  308  	}
c8d265840be604 Alex Deucher    2021-11-23  309  =

c8d265840be604 Alex Deucher    2021-11-23  310  	if (level =3D=3D AMD_DPM_F=
ORCED_LEVEL_AUTO)
c8d265840be604 Alex Deucher    2021-11-23  311  		adev->pstate_profile_ctx =
=3D NULL;
c8d265840be604 Alex Deucher    2021-11-23  312  	else
c8d265840be604 Alex Deucher    2021-11-23  313  		adev->pstate_profile_ctx =
=3D ctx;
c8d265840be604 Alex Deucher    2021-11-23  314  done:
c8d265840be604 Alex Deucher    2021-11-23  315  	mutex_unlock(&adev->pstate=
_profile_ctx_lock);
c8d265840be604 Alex Deucher    2021-11-23  316  =

c8d265840be604 Alex Deucher    2021-11-23  317  	return r;
c8d265840be604 Alex Deucher    2021-11-23  318  }
c8d265840be604 Alex Deucher    2021-11-23  319  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6145889391546160437==--

