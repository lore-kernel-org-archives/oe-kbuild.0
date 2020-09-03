Content-Type: multipart/mixed; boundary="===============5607187685659873871=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-linux-intel-lts:5.4/yocto 6714/10733] drivers/gpu/drm/drm_dp_mst_topology.c:2108:25: warning: Possible null pointer dereference: guid
Date: Thu, 03 Sep 2020 21:38:56 +0800
Message-ID: <202009032151.V9ahDLGK%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5607187685659873871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lyude Paul <lyude@redhat.com>
CC: "Qin, Chao" <chao.qin@intel.com>
CC: Sean Paul <sean@poorly.run>

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   4fcfbf1c440e6edc6001241495e31211b01ad217
commit: 7b11b589277c4fc2eca90ff428d39817468e0bc8 [6714/10733] drm/dp_mst: H=
andle UP requests asynchronously
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/drm_dp_mst_topology.c:2108:25: warning: Possible null po=
inter dereference: guid [nullPointer]
    if (memcmp(mstb->guid, guid, 16) =3D=3D 0)
                           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3289:20: note: Assignment 'guid=3D=
NULL', assigned value is 0
     const u8 *guid =3D NULL;
                      ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3296:52: note: Calling function 'd=
rm_dp_get_mst_branch_device_by_guid', 2nd argument 'guid' value is 0
     mstb =3D drm_dp_get_mst_branch_device_by_guid(mgr, guid);
                                                      ^
   drivers/gpu/drm/drm_dp_mst_topology.c:2135:64: note: Calling function 'g=
et_mst_branch_device_by_guid_helper', 2nd argument 'guid' value is 0
    mstb =3D get_mst_branch_device_by_guid_helper(mgr->mst_primary, guid);
                                                                  ^
   drivers/gpu/drm/drm_dp_mst_topology.c:2108:25: note: Null pointer derefe=
rence
    if (memcmp(mstb->guid, guid, 16) =3D=3D 0)
                           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4043:7: warning: Variable 'ret' is=
 reassigned a value before the old one has been used. [redundantAssignment]
     ret =3D drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4041:7: note: Variable 'ret' is re=
assigned a value before the old one has been used.
     ret =3D drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_S=
IZE);
         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4043:7: note: Variable 'ret' is re=
assigned a value before the old one has been used.
     ret =3D drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4045:7: warning: Variable 'ret' is=
 reassigned a value before the old one has been used. [redundantAssignment]
     ret =3D drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4043:7: note: Variable 'ret' is re=
assigned a value before the old one has been used.
     ret =3D drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4045:7: note: Variable 'ret' is re=
assigned a value before the old one has been used.
     ret =3D drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4049:7: warning: Variable 'ret' is=
 reassigned a value before the old one has been used. [redundantAssignment]
     ret =3D drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_H=
EADER_SIZE);
         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4045:7: note: Variable 'ret' is re=
assigned a value before the old one has been used.
     ret =3D drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
         ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4049:7: note: Variable 'ret' is re=
assigned a value before the old one has been used.
     ret =3D drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_H=
EADER_SIZE);
         ^

# https://github.com/intel/linux-intel-lts/commit/7b11b589277c4fc2eca90ff42=
8d39817468e0bc8
git remote add intel-linux-intel-lts https://github.com/intel/linux-intel-l=
ts.git
git fetch --no-tags intel-linux-intel-lts 5.4/yocto
git checkout 7b11b589277c4fc2eca90ff428d39817468e0bc8
vim +2108 drivers/gpu/drm/drm_dp_mst_topology.c

ad7f8a1f9ced7f Dave Airlie    2014-06-05  2100  =

bd9343208704fc Mykola Lysenko 2015-12-18  2101  static struct drm_dp_mst_br=
anch *get_mst_branch_device_by_guid_helper(
bd9343208704fc Mykola Lysenko 2015-12-18  2102  	struct drm_dp_mst_branch *=
mstb,
4318acbc81b142 Lyude Paul     2019-09-03  2103  	const uint8_t *guid)
bd9343208704fc Mykola Lysenko 2015-12-18  2104  {
bd9343208704fc Mykola Lysenko 2015-12-18  2105  	struct drm_dp_mst_branch *=
found_mstb;
bd9343208704fc Mykola Lysenko 2015-12-18  2106  	struct drm_dp_mst_port *po=
rt;
bd9343208704fc Mykola Lysenko 2015-12-18  2107  =

5e93b8208d3c41 Hersen Wu      2016-01-22 @2108  	if (memcmp(mstb->guid, gui=
d, 16) =3D=3D 0)
5e93b8208d3c41 Hersen Wu      2016-01-22  2109  		return mstb;
5e93b8208d3c41 Hersen Wu      2016-01-22  2110  =

5e93b8208d3c41 Hersen Wu      2016-01-22  2111  =

bd9343208704fc Mykola Lysenko 2015-12-18  2112  	list_for_each_entry(port, =
&mstb->ports, next) {
bd9343208704fc Mykola Lysenko 2015-12-18  2113  		if (!port->mstb)
bd9343208704fc Mykola Lysenko 2015-12-18  2114  			continue;
bd9343208704fc Mykola Lysenko 2015-12-18  2115  =

bd9343208704fc Mykola Lysenko 2015-12-18  2116  		found_mstb =3D get_mst_br=
anch_device_by_guid_helper(port->mstb, guid);
bd9343208704fc Mykola Lysenko 2015-12-18  2117  =

bd9343208704fc Mykola Lysenko 2015-12-18  2118  		if (found_mstb)
bd9343208704fc Mykola Lysenko 2015-12-18  2119  			return found_mstb;
bd9343208704fc Mykola Lysenko 2015-12-18  2120  	}
bd9343208704fc Mykola Lysenko 2015-12-18  2121  =

bd9343208704fc Mykola Lysenko 2015-12-18  2122  	return NULL;
bd9343208704fc Mykola Lysenko 2015-12-18  2123  }
bd9343208704fc Mykola Lysenko 2015-12-18  2124  =


:::::: The code at line 2108 was first introduced by commit
:::::: 5e93b8208d3c419b515fb75e2601931c027e12ab drm/dp/mst: move GUID stora=
ge from mgr, port to only mst branch

:::::: TO: Hersen Wu <hersenxs.wu@amd.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5607187685659873871==--

