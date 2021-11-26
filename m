Content-Type: multipart/mixed; boundary="===============2795996032303180942=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7441 handle_cursor_update() error: we previously assumed 'afb' could be null (see line 7400)
Date: Fri, 26 Nov 2021 17:55:22 +0800
Message-ID: <202111261753.acm85tTj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2795996032303180942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Simon Ser <contact@emersion.fr>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 03a663673063d04c2358be754a08e62a465bb8f0 drm/amd/display: use FB pi=
tch to fill dc_cursor_attributes
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-m001-20211116 (https://download.01.org/0day-ci/ar=
chive/20211126/202111261753.acm85tTj-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7441 handle_cur=
sor_update() error: we previously assumed 'afb' could be null (see line 740=
0)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1193 amdgpu_dm_=
fini() warn: variable dereferenced before check 'adev->dm.dc' (see line 118=
2)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5245 create_str=
eam_for_sink() error: we previously assumed 'aconnector->dc_sink' could be =
null (see line 5120)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9327 amdgpu_dm_=
atomic_check() warn: variable dereferenced before check 'new_crtc_state' (s=
ee line 9310)

vim +/afb +7441 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

2a8f6ccb665c6ac Harry Wentland      2017-07-31  7391  =

3ee6b26b78e4782 Alex Deucher        2017-10-10  7392  static void handle_cu=
rsor_update(struct drm_plane *plane,
e7b07ceef2a650e Harry Wentland      2017-08-10  7393  				 struct drm_plane=
_state *old_plane_state)
e7b07ceef2a650e Harry Wentland      2017-08-10  7394  {
1348969ab68cb86 Luben Tuikov        2020-08-24  7395  	struct amdgpu_device=
 *adev =3D drm_to_adev(plane->dev);
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7396  	struct amdgpu_frameb=
uffer *afb =3D to_amdgpu_framebuffer(plane->state->fb);
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7397  	struct drm_crtc *crt=
c =3D afb ? plane->state->crtc : old_plane_state->crtc;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7398  	struct dm_crtc_state=
 *crtc_state =3D crtc ? to_dm_crtc_state(crtc->state) : NULL;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7399  	struct amdgpu_crtc *=
amdgpu_crtc =3D to_amdgpu_crtc(crtc);
2a8f6ccb665c6ac Harry Wentland      2017-07-31 @7400  	uint64_t address =3D=
 afb ? afb->address : 0;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7401  	struct dc_cursor_pos=
ition position;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7402  	struct dc_cursor_att=
ributes attributes;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7403  	int ret;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7404  =

e7b07ceef2a650e Harry Wentland      2017-08-10  7405  	if (!plane->state->f=
b && !old_plane_state->fb)
e7b07ceef2a650e Harry Wentland      2017-08-10  7406  		return;
e7b07ceef2a650e Harry Wentland      2017-08-10  7407  =

f1ad2f5efd29dc8 Harry Wentland      2017-09-12  7408  	DRM_DEBUG_DRIVER("%s=
: crtc_id=3D%d with size %d to %d\n",
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7409  			 __func__,
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7410  			 amdgpu_crtc->crtc=
_id,
e7b07ceef2a650e Harry Wentland      2017-08-10  7411  			 plane->state->crt=
c_w,
e7b07ceef2a650e Harry Wentland      2017-08-10  7412  			 plane->state->crt=
c_h);
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7413  =

2a8f6ccb665c6ac Harry Wentland      2017-07-31  7414  	ret =3D get_cursor_p=
osition(plane, crtc, &position);
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7415  	if (ret)
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7416  		return;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7417  =

2a8f6ccb665c6ac Harry Wentland      2017-07-31  7418  	if (!position.enable=
) {
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7419  		/* turn off cursor =
*/
674e78acae0dfb4 Nicholas Kazlauskas 2018-12-05  7420  		if (crtc_state && c=
rtc_state->stream) {
674e78acae0dfb4 Nicholas Kazlauskas 2018-12-05  7421  			mutex_lock(&adev->=
dm.dc_lock);
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7422  			dc_stream_set_curs=
or_position(crtc_state->stream,
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7423  						      &position=
);
674e78acae0dfb4 Nicholas Kazlauskas 2018-12-05  7424  			mutex_unlock(&adev=
->dm.dc_lock);
674e78acae0dfb4 Nicholas Kazlauskas 2018-12-05  7425  		}
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7426  		return;
e7b07ceef2a650e Harry Wentland      2017-08-10  7427  	}
e7b07ceef2a650e Harry Wentland      2017-08-10  7428  =

2a8f6ccb665c6ac Harry Wentland      2017-07-31  7429  	amdgpu_crtc->cursor_=
width =3D plane->state->crtc_w;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7430  	amdgpu_crtc->cursor_=
height =3D plane->state->crtc_h;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7431  =

c1cefe115d1cdc4 tiancyin            2019-04-01  7432  	memset(&attributes, =
0, sizeof(attributes));
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7433  	attributes.address.h=
igh_part =3D upper_32_bits(address);
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7434  	attributes.address.l=
ow_part  =3D lower_32_bits(address);
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7435  	attributes.width    =
         =3D plane->state->crtc_w;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7436  	attributes.height   =
         =3D plane->state->crtc_h;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7437  	attributes.color_for=
mat      =3D CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7438  	attributes.rotation_=
angle    =3D 0;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7439  	attributes.attribute=
_flags.value =3D 0;
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7440  =

03a663673063d04 Simon Ser           2020-12-02 @7441  	attributes.pitch =3D=
 afb->base.pitches[0] / afb->base.format->cpp[0];
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7442  =

886daac91d4c794 Jerry Zuo           2017-10-05  7443  	if (crtc_state->stre=
am) {
674e78acae0dfb4 Nicholas Kazlauskas 2018-12-05  7444  		mutex_lock(&adev->d=
m.dc_lock);
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7445  		if (!dc_stream_set_=
cursor_attributes(crtc_state->stream,
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7446  							 &attributes))
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7447  			DRM_ERROR("DC fail=
ed to set cursor attributes\n");
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7448  =

2a8f6ccb665c6ac Harry Wentland      2017-07-31  7449  		if (!dc_stream_set_=
cursor_position(crtc_state->stream,
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7450  						   &position))
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7451  			DRM_ERROR("DC fail=
ed to set cursor position\n");
674e78acae0dfb4 Nicholas Kazlauskas 2018-12-05  7452  		mutex_unlock(&adev-=
>dm.dc_lock);
2a8f6ccb665c6ac Harry Wentland      2017-07-31  7453  	}
886daac91d4c794 Jerry Zuo           2017-10-05  7454  }
e7b07ceef2a650e Harry Wentland      2017-08-10  7455  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2795996032303180942==--

