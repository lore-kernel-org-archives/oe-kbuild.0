Content-Type: multipart/mixed; boundary="===============4292090334933719358=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-msm:msm-next-staging 64/68] drivers/gpu/drm/msm/dp/dp_catalog.c:629:24: warning: Variable 'opts_dp->set_voltages' is reassigned a value before the old one has been used.
Date: Mon, 21 Sep 2020 08:51:45 +0800
Message-ID: <202009210844.N0HgnbjX%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4292090334933719358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Stephen Boyd <swboyd@chromium.org>
CC: Rob Clark <robdclark@chromium.org>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-staging
head:   ca9b38e6d671616e95bdf247cf5ded269e3f3fb9
commit: 937f941ca06f2f3ab64baebf31be2c16d57ae7b8 [64/68] drm/msm/dp: Use qm=
p phy for DP PLL and PHY
:::::: branch date: 7 hours ago
:::::: commit date: 5 days ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/msm/dp/dp_catalog.c:629:24: warning: Variable 'opts_dp->=
set_voltages' is reassigned a value before the old one has been used. [redu=
ndantAssignment]
    opts_dp->set_voltages =3D 0;
                          ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:627:24: note: Variable 'opts_dp->set=
_voltages' is reassigned a value before the old one has been used.
    opts_dp->set_voltages =3D 1;
                          ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:629:24: note: Variable 'opts_dp->set=
_voltages' is reassigned a value before the old one has been used.
    opts_dp->set_voltages =3D 0;
                          ^

git remote add drm-msm https://gitlab.freedesktop.org/drm/msm.git
git fetch --no-tags drm-msm msm-next-staging
git checkout 937f941ca06f2f3ab64baebf31be2c16d57ae7b8
vim +629 drivers/gpu/drm/msm/dp/dp_catalog.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  614  =

c943b4948b5848 Chandan Uddaraju 2020-08-27  615  int dp_catalog_ctrl_update=
_vx_px(struct dp_catalog *dp_catalog,
c943b4948b5848 Chandan Uddaraju 2020-08-27  616  		u8 v_level, u8 p_level)
c943b4948b5848 Chandan Uddaraju 2020-08-27  617  {
c943b4948b5848 Chandan Uddaraju 2020-08-27  618  	struct dp_catalog_private=
 *catalog =3D container_of(dp_catalog,
c943b4948b5848 Chandan Uddaraju 2020-08-27  619  				struct dp_catalog_priv=
ate, dp_catalog);
937f941ca06f2f Stephen Boyd     2020-09-09  620  	struct dp_io *dp_io =3D c=
atalog->io;
937f941ca06f2f Stephen Boyd     2020-09-09  621  	struct phy *phy =3D dp_io=
->phy;
937f941ca06f2f Stephen Boyd     2020-09-09  622  	struct phy_configure_opts=
_dp *opts_dp =3D &dp_io->phy_opts.dp;
937f941ca06f2f Stephen Boyd     2020-09-09  623  =

937f941ca06f2f Stephen Boyd     2020-09-09  624  	/* TODO: Update for all l=
anes instead of just first one */
937f941ca06f2f Stephen Boyd     2020-09-09  625  	opts_dp->voltage[0] =3D v=
_level;
937f941ca06f2f Stephen Boyd     2020-09-09  626  	opts_dp->pre[0] =3D p_lev=
el;
937f941ca06f2f Stephen Boyd     2020-09-09  627  	opts_dp->set_voltages =3D=
 1;
937f941ca06f2f Stephen Boyd     2020-09-09  628  	phy_configure(phy, &dp_io=
->phy_opts);
937f941ca06f2f Stephen Boyd     2020-09-09 @629  	opts_dp->set_voltages =3D=
 0;
c943b4948b5848 Chandan Uddaraju 2020-08-27  630  =

c943b4948b5848 Chandan Uddaraju 2020-08-27  631  	return 0;
c943b4948b5848 Chandan Uddaraju 2020-08-27  632  }
c943b4948b5848 Chandan Uddaraju 2020-08-27  633  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4292090334933719358==--

