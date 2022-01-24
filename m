Content-Type: multipart/mixed; boundary="===============3331818231738334226=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/vc4/vc4_kms.c:369 vc4_atomic_commit_tail() error: 'new_hvs_state' dereferencing possible ERR_PTR()
Date: Tue, 25 Jan 2022 03:24:07 +0800
Message-ID: <202201250306.F7iqo5yp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3331818231738334226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 99b03ca651f1c409d296d6c6e9440d9b005c722f Merge v5.16-rc5 into drm-n=
ext
date:   6 weeks ago
:::::: branch date: 27 hours ago
:::::: commit date: 6 weeks ago
config: powerpc64-randconfig-m031-20220120 (https://download.01.org/0day-ci=
/archive/20220125/202201250306.F7iqo5yp-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/vc4/vc4_kms.c:369 vc4_atomic_commit_tail() error: 'new_hvs_=
state' dereferencing possible ERR_PTR()
drivers/gpu/drm/vc4/vc4_kms.c:380 vc4_atomic_commit_tail() error: 'old_hvs_=
state' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/gpu/drm/vc4/vc4_kms.c:433 vc4_atomic_commit_setup() warn: passing z=
ero to 'PTR_ERR'
drivers/gpu/drm/vc4/vc4_kms.c:444 vc4_atomic_commit_setup() error: 'hvs_sta=
te' dereferencing possible ERR_PTR()

vim +/new_hvs_state +369 drivers/gpu/drm/vc4/vc4_kms.c

87ebcd42fb7b8d Maxime Ripard   2020-09-03  337  =

f3c420fe19f8cc Maxime Ripard   2020-12-04  338  static void vc4_atomic_comm=
it_tail(struct drm_atomic_state *state)
b501bacc6060fd Eric Anholt     2015-11-30  339  {
b501bacc6060fd Eric Anholt     2015-11-30  340  	struct drm_device *dev =3D=
 state->dev;
b501bacc6060fd Eric Anholt     2015-11-30  341  	struct vc4_dev *vc4 =3D to=
_vc4_dev(dev);
d7d96c00e585ce Maxime Ripard   2020-09-03  342  	struct vc4_hvs *hvs =3D vc=
4->hvs;
596356678fb429 Maxime Ripard   2020-09-03  343  	struct drm_crtc_state *new=
_crtc_state;
16e101051f329f Maxime Ripard   2021-10-25  344  	struct vc4_hvs_state *new_=
hvs_state;
596356678fb429 Maxime Ripard   2020-09-03  345  	struct drm_crtc *crtc;
9ec03d7f1ed394 Maxime Ripard   2020-12-04  346  	struct vc4_hvs_state *old_=
hvs_state;
6052a3110be208 Maxime Ripard   2021-11-17  347  	unsigned int channel;
531a1b622da9ad Boris Brezillon 2019-02-20  348  	int i;
531a1b622da9ad Boris Brezillon 2019-02-20  349  =

16e101051f329f Maxime Ripard   2021-10-25  350  	old_hvs_state =3D vc4_hvs_=
get_old_global_state(state);
99b03ca651f1c4 Daniel Vetter   2021-12-14  351  	if (WARN_ON(IS_ERR(old_hvs=
_state)))
16e101051f329f Maxime Ripard   2021-10-25  352  		return;
16e101051f329f Maxime Ripard   2021-10-25  353  =

16e101051f329f Maxime Ripard   2021-10-25  354  	new_hvs_state =3D vc4_hvs_=
get_new_global_state(state);
99b03ca651f1c4 Daniel Vetter   2021-12-14  355  	if (WARN_ON(IS_ERR(new_hvs=
_state)))
16e101051f329f Maxime Ripard   2021-10-25  356  		return;
16e101051f329f Maxime Ripard   2021-10-25  357  =

596356678fb429 Maxime Ripard   2020-09-03  358  	for_each_new_crtc_in_state=
(state, crtc, new_crtc_state, i) {
87ebcd42fb7b8d Maxime Ripard   2020-09-03  359  		struct vc4_crtc_state *vc=
4_crtc_state;
596356678fb429 Maxime Ripard   2020-09-03  360  =

596356678fb429 Maxime Ripard   2020-09-03  361  		if (!new_crtc_state->comm=
it)
531a1b622da9ad Boris Brezillon 2019-02-20  362  			continue;
531a1b622da9ad Boris Brezillon 2019-02-20  363  =

87ebcd42fb7b8d Maxime Ripard   2020-09-03  364  		vc4_crtc_state =3D to_vc4=
_crtc_state(new_crtc_state);
87ebcd42fb7b8d Maxime Ripard   2020-09-03  365  		vc4_hvs_mask_underrun(dev=
, vc4_crtc_state->assigned_channel);
531a1b622da9ad Boris Brezillon 2019-02-20  366  	}
b501bacc6060fd Eric Anholt     2015-11-30  367  =

16e101051f329f Maxime Ripard   2021-10-25  368  	if (vc4->hvs->hvs5) {
16e101051f329f Maxime Ripard   2021-10-25 @369  		unsigned long core_rate =
=3D max_t(unsigned long,
16e101051f329f Maxime Ripard   2021-10-25  370  						500000000,
16e101051f329f Maxime Ripard   2021-10-25  371  						new_hvs_state->core_c=
lock_rate);
d7d96c00e585ce Maxime Ripard   2020-09-03  372  =

16e101051f329f Maxime Ripard   2021-10-25  373  		clk_set_min_rate(hvs->cor=
e_clk, core_rate);
16e101051f329f Maxime Ripard   2021-10-25  374  	}
9ec03d7f1ed394 Maxime Ripard   2020-12-04  375  =

6052a3110be208 Maxime Ripard   2021-11-17  376  	for (channel =3D 0; channe=
l < HVS_NUM_CHANNELS; channel++) {
049cfff8d53a30 Maxime Ripard   2021-11-17  377  		struct drm_crtc_commit *c=
ommit;
b99c2c95412c0b Maxime Ripard   2021-01-11  378  		int ret;
9ec03d7f1ed394 Maxime Ripard   2020-12-04  379  =

9ec03d7f1ed394 Maxime Ripard   2020-12-04 @380  		if (!old_hvs_state->fifo_=
state[channel].in_use)
9ec03d7f1ed394 Maxime Ripard   2020-12-04  381  			continue;
9ec03d7f1ed394 Maxime Ripard   2020-12-04  382  =

049cfff8d53a30 Maxime Ripard   2021-11-17  383  		commit =3D old_hvs_state-=
>fifo_state[channel].pending_commit;
049cfff8d53a30 Maxime Ripard   2021-11-17  384  		if (!commit)
9ec03d7f1ed394 Maxime Ripard   2020-12-04  385  			continue;
9ec03d7f1ed394 Maxime Ripard   2020-12-04  386  =

049cfff8d53a30 Maxime Ripard   2021-11-17  387  		ret =3D drm_crtc_commit_w=
ait(commit);
b99c2c95412c0b Maxime Ripard   2021-01-11  388  		if (ret)
b99c2c95412c0b Maxime Ripard   2021-01-11  389  			drm_err(dev, "Timed out =
waiting for commit\n");
049cfff8d53a30 Maxime Ripard   2021-11-17  390  =

049cfff8d53a30 Maxime Ripard   2021-11-17  391  		drm_crtc_commit_put(commi=
t);
d134c5ff71c7f2 Maxime Ripard   2021-11-17  392  		old_hvs_state->fifo_state=
[channel].pending_commit =3D NULL;
9ec03d7f1ed394 Maxime Ripard   2020-12-04  393  	}
9ec03d7f1ed394 Maxime Ripard   2020-12-04  394  =

b501bacc6060fd Eric Anholt     2015-11-30  395  	drm_atomic_helper_commit_m=
odeset_disables(dev, state);
b501bacc6060fd Eric Anholt     2015-11-30  396  =

766cc6b1f7fc9e Stefan Schake   2018-04-20  397  	vc4_ctm_commit(vc4, state);
766cc6b1f7fc9e Stefan Schake   2018-04-20  398  =

87ebcd42fb7b8d Maxime Ripard   2020-09-03  399  	if (vc4->hvs->hvs5)
87ebcd42fb7b8d Maxime Ripard   2020-09-03  400  		vc5_hvs_pv_muxing_commit(=
vc4, state);
87ebcd42fb7b8d Maxime Ripard   2020-09-03  401  	else
87ebcd42fb7b8d Maxime Ripard   2020-09-03  402  		vc4_hvs_pv_muxing_commit(=
vc4, state);
87ebcd42fb7b8d Maxime Ripard   2020-09-03  403  =

2b58e98d42af85 Liu Ying        2016-08-29  404  	drm_atomic_helper_commit_p=
lanes(dev, state, 0);
b501bacc6060fd Eric Anholt     2015-11-30  405  =

b501bacc6060fd Eric Anholt     2015-11-30  406  	drm_atomic_helper_commit_m=
odeset_enables(dev, state);
b501bacc6060fd Eric Anholt     2015-11-30  407  =

1ebe99a75eeda1 Boris Brezillon 2018-07-03  408  	drm_atomic_helper_fake_vbl=
ank(state);
1ebe99a75eeda1 Boris Brezillon 2018-07-03  409  =

34c8ea400ff638 Boris Brezillon 2017-06-02  410  	drm_atomic_helper_commit_h=
w_done(state);
34c8ea400ff638 Boris Brezillon 2017-06-02  411  =

184d3cf4f73896 Boris Brezillon 2018-07-03  412  	drm_atomic_helper_wait_for=
_flip_done(dev, state);
b501bacc6060fd Eric Anholt     2015-11-30  413  =

b501bacc6060fd Eric Anholt     2015-11-30  414  	drm_atomic_helper_cleanup_=
planes(dev, state);
b501bacc6060fd Eric Anholt     2015-11-30  415  =

16e101051f329f Maxime Ripard   2021-10-25  416  	if (vc4->hvs->hvs5) {
16e101051f329f Maxime Ripard   2021-10-25  417  		drm_dbg(dev, "Running the=
 core clock at %lu Hz\n",
16e101051f329f Maxime Ripard   2021-10-25  418  			new_hvs_state->core_cloc=
k_rate);
16e101051f329f Maxime Ripard   2021-10-25  419  =

16e101051f329f Maxime Ripard   2021-10-25  420  		clk_set_min_rate(hvs->cor=
e_clk, new_hvs_state->core_clock_rate);
16e101051f329f Maxime Ripard   2021-10-25  421  	}
b501bacc6060fd Eric Anholt     2015-11-30  422  }
b501bacc6060fd Eric Anholt     2015-11-30  423  =


:::::: The code at line 369 was first introduced by commit
:::::: 16e101051f329f5f3f2dd810f3687d166580aa3a drm/vc4: Increase the core =
clock based on HVS load

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Maxime Ripard <maxime@cerno.tech>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3331818231738334226==--

