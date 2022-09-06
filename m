Content-Type: multipart/mixed; boundary="===============1512307580365634949=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4878/5667] drivers/gpu/drm/vkms/vkms_plane.c:105 vkms_plane_atomic_update() warn: variable dereferenced before check 'fb' (see line 103)
Date: Wed, 07 Sep 2022 06:03:40 +0800
Message-ID: <202209070630.keeEK7fw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1512307580365634949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Igor Torrente <igormtorrente@gmail.com>
CC: Melissa Wen <melissa.srw@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   840126e36e8ff272cb63158646433fa1324533d9
commit: 8ba1648567e289c90fa4f65b4204d0f160e22ac3 [4878/5667] drm: vkms: Ref=
actor the plane composer to accept new formats
:::::: branch date: 10 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20907/202209070630.keeEK7fw-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/vkms/vkms_plane.c:105 vkms_plane_atomic_update() warn: vari=
able dereferenced before check 'fb' (see line 103)

vim +/fb +105 drivers/gpu/drm/vkms/vkms_plane.c

854502fa0a38dc Rodrigo Siqueira  2018-05-16   93  =

c27d931d402b51 Haneen Mohammed   2018-09-06   94  static void vkms_plane_at=
omic_update(struct drm_plane *plane,
977697e20b3d75 Maxime Ripard     2021-02-19   95  				     struct drm_atomi=
c_state *state)
42ac03213b7f10 Rodrigo Siqueira  2018-07-12   96  {
37418bf14c1392 Maxime Ripard     2021-02-19   97  	struct drm_plane_state *=
new_state =3D drm_atomic_get_new_plane_state(state,
37418bf14c1392 Maxime Ripard     2021-02-19   98  									   plane);
6c234fe37c5762 Haneen Mohammed   2018-08-02   99  	struct vkms_plane_state =
*vkms_plane_state;
bbeb7461c7eed2 Thomas Zimmermann 2021-07-05  100  	struct drm_shadow_plane_=
state *shadow_plane_state;
e05162c017e2e1 Maxime Ripard     2021-02-19  101  	struct drm_framebuffer *=
fb =3D new_state->fb;
1645e7b9667f14 Igor Torrente     2022-09-05  102  	struct vkms_frame_info *=
frame_info;
8ba1648567e289 Igor Torrente     2022-09-05 @103  	u32 fmt =3D fb->format->=
format;
6c234fe37c5762 Haneen Mohammed   2018-08-02  104  =

e05162c017e2e1 Maxime Ripard     2021-02-19 @105  	if (!new_state->crtc || =
!fb)
6c234fe37c5762 Haneen Mohammed   2018-08-02  106  		return;
6c234fe37c5762 Haneen Mohammed   2018-08-02  107  =

e05162c017e2e1 Maxime Ripard     2021-02-19  108  	vkms_plane_state =3D to_=
vkms_plane_state(new_state);
bbeb7461c7eed2 Thomas Zimmermann 2021-07-05  109  	shadow_plane_state =3D &=
vkms_plane_state->base;
db7f419c06d7cc Haneen Mohammed   2018-09-06  110  =

1645e7b9667f14 Igor Torrente     2022-09-05  111  	frame_info =3D vkms_plan=
e_state->frame_info;
1645e7b9667f14 Igor Torrente     2022-09-05  112  	memcpy(&frame_info->src,=
 &new_state->src, sizeof(struct drm_rect));
1645e7b9667f14 Igor Torrente     2022-09-05  113  	memcpy(&frame_info->dst,=
 &new_state->dst, sizeof(struct drm_rect));
2eef1ef6e22b24 Igor Torrente     2022-09-05  114  	frame_info->fb =3D fb;
1645e7b9667f14 Igor Torrente     2022-09-05  115  	memcpy(&frame_info->map,=
 &shadow_plane_state->data, sizeof(frame_info->map));
2eef1ef6e22b24 Igor Torrente     2022-09-05  116  	drm_framebuffer_get(fram=
e_info->fb);
1645e7b9667f14 Igor Torrente     2022-09-05  117  	frame_info->offset =3D f=
b->offsets[0];
1645e7b9667f14 Igor Torrente     2022-09-05  118  	frame_info->pitch =3D fb=
->pitches[0];
1645e7b9667f14 Igor Torrente     2022-09-05  119  	frame_info->cpp =3D fb->=
format->cpp[0];
8ba1648567e289 Igor Torrente     2022-09-05  120  	vkms_plane_state->plane_=
read =3D get_frame_to_line_function(fmt);
42ac03213b7f10 Rodrigo Siqueira  2018-07-12  121  }
42ac03213b7f10 Rodrigo Siqueira  2018-07-12  122  =


:::::: The code at line 105 was first introduced by commit
:::::: e05162c017e2e14b94dfd4e55d2f006a9a642c6d drm: Store new plane state =
in a variable for atomic_update and disable

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Maxime Ripard <maxime@cerno.tech>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1512307580365634949==--

