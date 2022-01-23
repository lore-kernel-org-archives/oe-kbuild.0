Content-Type: multipart/mixed; boundary="===============0147264690819937116=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/vc4/vc4_kms.c:414 vc4_atomic_commit_setup() warn: passing zero to 'PTR_ERR'
Date: Sun, 23 Jan 2022 12:58:30 +0800
Message-ID: <202201231255.I5OPKZM2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0147264690819937116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maxime Ripard <maxime@cerno.tech>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1c52283265a462a100ae63ddf58b4e5884acde86
commit: f927767978d201d4ac023fcd797adbb963a6565d drm/vc4: kms: Fix return c=
ode check
date:   8 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 weeks ago
config: powerpc64-randconfig-m031-20220120 (https://download.01.org/0day-ci=
/archive/20220123/202201231255.I5OPKZM2-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/vc4/vc4_kms.c:414 vc4_atomic_commit_setup() warn: passing z=
ero to 'PTR_ERR'
drivers/gpu/drm/vc4/vc4_kms.c:425 vc4_atomic_commit_setup() error: 'hvs_sta=
te' dereferencing possible ERR_PTR()

vim +/PTR_ERR +414 drivers/gpu/drm/vc4/vc4_kms.c

b501bacc6060fd Eric Anholt   2015-11-30  404  =

9ec03d7f1ed394 Maxime Ripard 2020-12-04  405  static int vc4_atomic_commit_=
setup(struct drm_atomic_state *state)
9ec03d7f1ed394 Maxime Ripard 2020-12-04  406  {
9ec03d7f1ed394 Maxime Ripard 2020-12-04  407  	struct drm_crtc_state *crtc_=
state;
9ec03d7f1ed394 Maxime Ripard 2020-12-04  408  	struct vc4_hvs_state *hvs_st=
ate;
9ec03d7f1ed394 Maxime Ripard 2020-12-04  409  	struct drm_crtc *crtc;
9ec03d7f1ed394 Maxime Ripard 2020-12-04  410  	unsigned int i;
9ec03d7f1ed394 Maxime Ripard 2020-12-04  411  =

9ec03d7f1ed394 Maxime Ripard 2020-12-04  412  	hvs_state =3D vc4_hvs_get_ne=
w_global_state(state);
f927767978d201 Maxime Ripard 2021-11-17  413  	if (WARN_ON(IS_ERR(hvs_state=
)))
f927767978d201 Maxime Ripard 2021-11-17 @414  		return PTR_ERR(hvs_state);
9ec03d7f1ed394 Maxime Ripard 2020-12-04  415  =

9ec03d7f1ed394 Maxime Ripard 2020-12-04  416  	for_each_new_crtc_in_state(s=
tate, crtc, crtc_state, i) {
9ec03d7f1ed394 Maxime Ripard 2020-12-04  417  		struct vc4_crtc_state *vc4_=
crtc_state =3D
9ec03d7f1ed394 Maxime Ripard 2020-12-04  418  			to_vc4_crtc_state(crtc_sta=
te);
9ec03d7f1ed394 Maxime Ripard 2020-12-04  419  		unsigned int channel =3D
9ec03d7f1ed394 Maxime Ripard 2020-12-04  420  			vc4_crtc_state->assigned_c=
hannel;
9ec03d7f1ed394 Maxime Ripard 2020-12-04  421  =

9ec03d7f1ed394 Maxime Ripard 2020-12-04  422  		if (channel =3D=3D VC4_HVS_=
CHANNEL_DISABLED)
9ec03d7f1ed394 Maxime Ripard 2020-12-04  423  			continue;
9ec03d7f1ed394 Maxime Ripard 2020-12-04  424  =

9ec03d7f1ed394 Maxime Ripard 2020-12-04 @425  		if (!hvs_state->fifo_state[=
channel].in_use)
9ec03d7f1ed394 Maxime Ripard 2020-12-04  426  			continue;
9ec03d7f1ed394 Maxime Ripard 2020-12-04  427  =

9ec03d7f1ed394 Maxime Ripard 2020-12-04  428  		hvs_state->fifo_state[chann=
el].pending_commit =3D
9ec03d7f1ed394 Maxime Ripard 2020-12-04  429  			drm_crtc_commit_get(crtc_s=
tate->commit);
9ec03d7f1ed394 Maxime Ripard 2020-12-04  430  	}
9ec03d7f1ed394 Maxime Ripard 2020-12-04  431  =

9ec03d7f1ed394 Maxime Ripard 2020-12-04  432  	return 0;
9ec03d7f1ed394 Maxime Ripard 2020-12-04  433  }
9ec03d7f1ed394 Maxime Ripard 2020-12-04  434  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0147264690819937116==--

