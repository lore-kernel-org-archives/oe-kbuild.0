Content-Type: multipart/mixed; boundary="===============3601750300382166610=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/armada/armada_plane.c:124 armada_drm_plane_atomic_check() warn: variable dereferenced before check 'state' (see line 111)
Date: Mon, 17 Jan 2022 07:46:18 +0800
Message-ID: <202201170744.uress2oV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3601750300382166610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maxime Ripard <maxime@cerno.tech>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79e06c4c4950be2abd8ca5d2428a8c915aa62c24
commit: dec92020671c48da231189eb06a5f755f492f87f drm: Use the state pointer=
 directly in planes atomic_check
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-m031-20220116 (https://download.01.org/0day-ci/archi=
ve/20220117/202201170744.uress2oV-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/armada/armada_plane.c:124 armada_drm_plane_atomic_check() w=
arn: variable dereferenced before check 'state' (see line 111)

vim +/state +124 drivers/gpu/drm/armada/armada_plane.c

d40af7b1ae23da Russell King  2018-07-30  107  =

d40af7b1ae23da Russell King  2018-07-30  108  int armada_drm_plane_atomic_c=
heck(struct drm_plane *plane,
7c11b99a8e58c0 Maxime Ripard 2021-02-19  109  	struct drm_atomic_state *sta=
te)
d40af7b1ae23da Russell King  2018-07-30  110  {
7c11b99a8e58c0 Maxime Ripard 2021-02-19 @111  	struct drm_plane_state *new_=
plane_state =3D drm_atomic_get_new_plane_state(state,
7c11b99a8e58c0 Maxime Ripard 2021-02-19  112  										 plane);
ba5c1649465d40 Maxime Ripard 2021-02-19  113  	struct armada_plane_state *s=
t =3D to_armada_plane_state(new_plane_state);
ba5c1649465d40 Maxime Ripard 2021-02-19  114  	struct drm_crtc *crtc =3D ne=
w_plane_state->crtc;
d40af7b1ae23da Russell King  2018-07-30  115  	struct drm_crtc_state *crtc_=
state;
1d1547ec12bc7d Russell King  2019-01-25  116  	bool interlace;
1d1547ec12bc7d Russell King  2019-01-25  117  	int ret;
1d1547ec12bc7d Russell King  2019-01-25  118  =

ba5c1649465d40 Maxime Ripard 2021-02-19  119  	if (!new_plane_state->fb || =
WARN_ON(!new_plane_state->crtc)) {
ba5c1649465d40 Maxime Ripard 2021-02-19  120  		new_plane_state->visible =
=3D false;
1d1547ec12bc7d Russell King  2019-01-25  121  		return 0;
1d1547ec12bc7d Russell King  2019-01-25  122  	}
d40af7b1ae23da Russell King  2018-07-30  123  =

dec92020671c48 Maxime Ripard 2021-02-19 @124  	if (state)
dec92020671c48 Maxime Ripard 2021-02-19  125  		crtc_state =3D drm_atomic_g=
et_existing_crtc_state(state,
ba5c1649465d40 Maxime Ripard 2021-02-19  126  								crtc);
d40af7b1ae23da Russell King  2018-07-30  127  	else
d40af7b1ae23da Russell King  2018-07-30  128  		crtc_state =3D crtc->state;
1d1547ec12bc7d Russell King  2019-01-25  129  =

ba5c1649465d40 Maxime Ripard 2021-02-19  130  	ret =3D drm_atomic_helper_ch=
eck_plane_state(new_plane_state, crtc_state,
ba5c1649465d40 Maxime Ripard 2021-02-19  131  						  0,
1d1547ec12bc7d Russell King  2019-01-25  132  						  INT_MAX, true, false);
1d1547ec12bc7d Russell King  2019-01-25  133  	if (ret)
1d1547ec12bc7d Russell King  2019-01-25  134  		return ret;
1d1547ec12bc7d Russell King  2019-01-25  135  =

1d1547ec12bc7d Russell King  2019-01-25  136  	interlace =3D crtc_state->ad=
justed_mode.flags & DRM_MODE_FLAG_INTERLACE;
1d1547ec12bc7d Russell King  2019-01-25  137  	if (interlace) {
ba5c1649465d40 Maxime Ripard 2021-02-19  138  		if ((new_plane_state->dst.y=
1 | new_plane_state->dst.y2) & 1)
1d1547ec12bc7d Russell King  2019-01-25  139  			return -EINVAL;
ba5c1649465d40 Maxime Ripard 2021-02-19  140  		st->src_hw =3D drm_rect_hei=
ght(&new_plane_state->src) >> 17;
ba5c1649465d40 Maxime Ripard 2021-02-19  141  		st->dst_yx =3D new_plane_st=
ate->dst.y1 >> 1;
ba5c1649465d40 Maxime Ripard 2021-02-19  142  		st->dst_hw =3D drm_rect_hei=
ght(&new_plane_state->dst) >> 1;
d40af7b1ae23da Russell King  2018-07-30  143  	} else {
ba5c1649465d40 Maxime Ripard 2021-02-19  144  		st->src_hw =3D drm_rect_hei=
ght(&new_plane_state->src) >> 16;
ba5c1649465d40 Maxime Ripard 2021-02-19  145  		st->dst_yx =3D new_plane_st=
ate->dst.y1;
ba5c1649465d40 Maxime Ripard 2021-02-19  146  		st->dst_hw =3D drm_rect_hei=
ght(&new_plane_state->dst);
d40af7b1ae23da Russell King  2018-07-30  147  	}
1d1547ec12bc7d Russell King  2019-01-25  148  =

1d1547ec12bc7d Russell King  2019-01-25  149  	st->src_hw <<=3D 16;
ba5c1649465d40 Maxime Ripard 2021-02-19  150  	st->src_hw |=3D drm_rect_wid=
th(&new_plane_state->src) >> 16;
1d1547ec12bc7d Russell King  2019-01-25  151  	st->dst_yx <<=3D 16;
ba5c1649465d40 Maxime Ripard 2021-02-19  152  	st->dst_yx |=3D new_plane_st=
ate->dst.x1 & 0x0000ffff;
1d1547ec12bc7d Russell King  2019-01-25  153  	st->dst_hw <<=3D 16;
ba5c1649465d40 Maxime Ripard 2021-02-19  154  	st->dst_hw |=3D drm_rect_wid=
th(&new_plane_state->dst) & 0x0000ffff;
1d1547ec12bc7d Russell King  2019-01-25  155  =

ba5c1649465d40 Maxime Ripard 2021-02-19  156  	armada_drm_plane_calc(new_pl=
ane_state, st->addrs, st->pitches,
ba5c1649465d40 Maxime Ripard 2021-02-19  157  			      interlace);
7d62237da6ec07 Russell King  2019-01-25  158  	st->interlace =3D interlace;
7d62237da6ec07 Russell King  2019-01-25  159  =

d40af7b1ae23da Russell King  2018-07-30  160  	return 0;
d40af7b1ae23da Russell King  2018-07-30  161  }
d40af7b1ae23da Russell King  2018-07-30  162  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3601750300382166610==--

