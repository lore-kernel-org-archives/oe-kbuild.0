Content-Type: multipart/mixed; boundary="===============2748034549907698512=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.4/yocto 16103/20394] drivers/gpu/drm/drm_edid.c:5597 drm_update_tile_info() error: uninitialized symbol 'length'.
Date: Sat, 22 Jan 2022 10:14:26 +0800
Message-ID: <202201221048.9ikBv1GJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2748034549907698512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
CC: "Mazlan, Hazwan Arif" <hazwan.arif.mazlan@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   36f93ff941f127f4137ab369aecbdd995fb58c66
commit: 8e2b1510d279aecb1f89907553283c79c1b2b226 [16103/20394] drm/edid: Fi=
x DispID tile parsing for override EDID
:::::: branch date: 9 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20122/202201221048.9ikBv1GJ-lkp(a)intel.com/config)
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

40d9b043a89e23 Dave Airlie   2014-10-20  5583  =

8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13  5584  void drm_update_ti=
le_info(struct drm_connector *connector,
8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13  5585  			  const struct =
edid *edid)
40d9b043a89e23 Dave Airlie   2014-10-20  5586  {
8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13  5587  	const void *displ=
ayid =3D NULL;
8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13  5588  	int length, idx;
40d9b043a89e23 Dave Airlie   2014-10-20  5589  	int ret;
40d9b043a89e23 Dave Airlie   2014-10-20  5590  	connector->has_tile =3D fal=
se;
40d9b043a89e23 Dave Airlie   2014-10-20  5591  	displayid =3D drm_find_disp=
layid_extension(edid);
40d9b043a89e23 Dave Airlie   2014-10-20  5592  	if (!displayid) {
40d9b043a89e23 Dave Airlie   2014-10-20  5593  		/* drop reference to any t=
ile group we had */
40d9b043a89e23 Dave Airlie   2014-10-20  5594  		goto out_drop_ref;
40d9b043a89e23 Dave Airlie   2014-10-20  5595  	}
40d9b043a89e23 Dave Airlie   2014-10-20  5596  =

8e2b1510d279ae Ville Syrj=C3=A4l=C3=A4 2020-03-13 @5597  	ret =3D drm_displ=
ayid_parse_tiled(connector, displayid, length, idx);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2748034549907698512==--

