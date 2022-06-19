Content-Type: multipart/mixed; boundary="===============2896119708810630454=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5412 fill_blending_from_plane_state() warn: variable dereferenced before check 'per_pixel_alpha' (see line 5387)
Date: Sun, 19 Jun 2022 17:50:32 +0800
Message-ID: <202206191752.JhkxXCi7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2896119708810630454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sung Joon Kim <Sungjoon.Kim@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Melissa Wen <mwen@igalia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 76818cdd11a25ac6cb1d98875719935d8d0e2e51 drm/amd/display: add Cover=
age blend mode for overlay plane
date:   3 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: ia64-randconfig-m031-20220616 (https://download.01.org/0day-ci/arch=
ive/20220619/202206191752.JhkxXCi7-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5412 fill_blend=
ing_from_plane_state() warn: variable dereferenced before check 'per_pixel_=
alpha' (see line 5387)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1726 amdgpu_dm_=
fini() warn: variable dereferenced before check 'adev->dm.dc' (see line 169=
9)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2707 dm_resume(=
) error: we previously assumed 'aconnector->dc_link' could be null (see lin=
e 2694)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3995 amdgpu_dm_=
backlight_update_status() error: testing array offset 'i' after use.
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4037 amdgpu_dm_=
backlight_get_brightness() error: testing array offset 'i' after use.
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6507 create_str=
eam_for_sink() error: we previously assumed 'aconnector->dc_sink' could be =
null (see line 6406)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8894 handle_cur=
sor_update() error: we previously assumed 'afb' could be null (see line 885=
3)

vim +/per_pixel_alpha +5412 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm=
/amdgpu_dm.c

7df7e505e82a2b Nicholas Kazlauskas 2019-01-02  5381  =

d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5382  static void
695af5f9a51914 Nicholas Kazlauskas 2019-03-28  5383  fill_blending_from_pla=
ne_state(const struct drm_plane_state *plane_state,
76818cdd11a25a Sung Joon Kim       2022-05-19  5384  			       bool *per_pi=
xel_alpha, bool *pre_multiplied_alpha,
76818cdd11a25a Sung Joon Kim       2022-05-19  5385  			       bool *global=
_alpha, int *global_alpha_value)
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5386  {
d74004b694ea88 Nicholas Kazlauskas 2019-02-21 @5387  	*per_pixel_alpha =3D =
false;
76818cdd11a25a Sung Joon Kim       2022-05-19  5388  	*pre_multiplied_alpha=
 =3D true;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5389  	*global_alpha =3D fal=
se;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5390  	*global_alpha_value =
=3D 0xff;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5391  =

d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5392  	if (plane_state->plan=
e->type !=3D DRM_PLANE_TYPE_OVERLAY)
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5393  		return;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5394  =

76818cdd11a25a Sung Joon Kim       2022-05-19  5395  	if (plane_state->pixe=
l_blend_mode =3D=3D DRM_MODE_BLEND_PREMULTI ||
76818cdd11a25a Sung Joon Kim       2022-05-19  5396  		plane_state->pixel_b=
lend_mode =3D=3D DRM_MODE_BLEND_COVERAGE) {
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5397  		static const uint32_=
t alpha_formats[] =3D {
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5398  			DRM_FORMAT_ARGB8888,
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5399  			DRM_FORMAT_RGBA8888,
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5400  			DRM_FORMAT_ABGR8888,
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5401  		};
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5402  		uint32_t format =3D =
plane_state->fb->format->format;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5403  		unsigned int i;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5404  =

d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5405  		for (i =3D 0; i < AR=
RAY_SIZE(alpha_formats); ++i) {
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5406  			if (format =3D=3D a=
lpha_formats[i]) {
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5407  				*per_pixel_alpha =
=3D true;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5408  				break;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5409  			}
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5410  		}
76818cdd11a25a Sung Joon Kim       2022-05-19  5411  =

76818cdd11a25a Sung Joon Kim       2022-05-19 @5412  		if (per_pixel_alpha =
&& plane_state->pixel_blend_mode =3D=3D DRM_MODE_BLEND_COVERAGE)
76818cdd11a25a Sung Joon Kim       2022-05-19  5413  			*pre_multiplied_alp=
ha =3D false;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5414  	}
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5415  =

d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5416  	if (plane_state->alph=
a < 0xffff) {
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5417  		*global_alpha =3D tr=
ue;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5418  		*global_alpha_value =
=3D plane_state->alpha >> 8;
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5419  	}
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5420  }
d74004b694ea88 Nicholas Kazlauskas 2019-02-21  5421  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2896119708810630454==--

