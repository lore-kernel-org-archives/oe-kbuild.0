Content-Type: multipart/mixed; boundary="===============3848954374784082377=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.4/yocto 16103/20884] drivers/gpu/drm/drm_edid.c:5597 drm_update_tile_info() error: uninitialized symbol 'length'.
Date: Fri, 04 Mar 2022 01:40:29 +0800
Message-ID: <202203040132.Io7NUZVa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3848954374784082377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
CC: "Mazlan, Hazwan Arif" <hazwan.arif.mazlan@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   b711391ad7048370874e7f32e00b452cd7da6f72
commit: 8e2b1510d279aecb1f89907553283c79c1b2b226 [16103/20884] drm/edid: Fi=
x DispID tile parsing for override EDID
:::::: branch date: 3 weeks ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20304/202203040132.Io7NUZVa-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/drm_edid.c:5597 drm_update_tile_info() error: uninitialized=
 symbol 'length'.
drivers/gpu/drm/drm_edid.c:5597 drm_update_tile_info() error: uninitialized=
 symbol 'idx'.

Old smatch warnings:
drivers/gpu/drm/drm_edid.c:1485 drm_edid_are_equal() error: we previously a=
ssumed 'edid2' could be null (see line 1478)

vim +/length +5597 drivers/gpu/drm/drm_edid.c

40d9b043a89e230 Dave Airlie   2014-10-20  5583  =

8e2b1510d279aec Ville Syrj=C3=A4l=C3=A4 2020-03-13  5584  void drm_update_t=
ile_info(struct drm_connector *connector,
8e2b1510d279aec Ville Syrj=C3=A4l=C3=A4 2020-03-13  5585  			  const struct=
 edid *edid)
40d9b043a89e230 Dave Airlie   2014-10-20  5586  {
8e2b1510d279aec Ville Syrj=C3=A4l=C3=A4 2020-03-13  5587  	const void *disp=
layid =3D NULL;
8e2b1510d279aec Ville Syrj=C3=A4l=C3=A4 2020-03-13  5588  	int length, idx;
40d9b043a89e230 Dave Airlie   2014-10-20  5589  	int ret;
40d9b043a89e230 Dave Airlie   2014-10-20  5590  	connector->has_tile =3D fa=
lse;
40d9b043a89e230 Dave Airlie   2014-10-20  5591  	displayid =3D drm_find_dis=
playid_extension(edid);
40d9b043a89e230 Dave Airlie   2014-10-20  5592  	if (!displayid) {
40d9b043a89e230 Dave Airlie   2014-10-20  5593  		/* drop reference to any =
tile group we had */
40d9b043a89e230 Dave Airlie   2014-10-20  5594  		goto out_drop_ref;
40d9b043a89e230 Dave Airlie   2014-10-20  5595  	}
40d9b043a89e230 Dave Airlie   2014-10-20  5596  =

8e2b1510d279aec Ville Syrj=C3=A4l=C3=A4 2020-03-13 @5597  	ret =3D drm_disp=
layid_parse_tiled(connector, displayid, length, idx);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3848954374784082377==--

