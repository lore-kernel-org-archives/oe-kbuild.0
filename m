Content-Type: multipart/mixed; boundary="===============1958168805403087839=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2582:17: warning: Uninitialized variable: ras_node->ras_obj [uninitvar]
Date: Sun, 17 Apr 2022 08:47:46 +0800
Message-ID: <202204170818.1tfa5bTN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1958168805403087839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: yipechai <YiPeng.Chai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Tao Zhou <tao.zhou1@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   90ea17a9e27b5778ec517efb1ce0b81d36905654
commit: 1f211a827cbda87bd0ec145a1f44f2615c3f56d3 drm/amdgpu: centrally call=
s the .ras_fini function of all ras blocks
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 1f211a827cbda87bd0ec145a1f44f2615c3f56d3
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1443:42: warning: Uninitialized =
variable: obj->head [uninitvar]
     if (amdgpu_ras_is_supported(adev, obj->head.block) &&
                                            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1437:35: note: Assuming conditio=
n is false
    if (!IS_ENABLED(CONFIG_DEBUG_FS) || !con)
                                     ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1443:42: note: Uninitialized var=
iable: obj->head
     if (amdgpu_ras_is_supported(adev, obj->head.block) &&
                                            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2508:44: warning: Uninitialized =
variable: obj->head [uninitvar]
      if (!amdgpu_ras_is_supported(adev, obj->head.block)) {
                                              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2488:25: note: Assuming conditio=
n is false
    if (!adev->ras_enabled || !con) {
                           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2508:44: note: Uninitialized var=
iable: obj->head
      if (!amdgpu_ras_is_supported(adev, obj->head.block)) {
                                              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2537:14: warning: Uninitialized =
variable: node->ras_obj [uninitvar]
     if (!node->ras_obj) {
                ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2582:17: warning: Uninitialized =
variable: ras_node->ras_obj [uninitvar]
     if (ras_node->ras_obj) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2578:25: note: Assuming conditio=
n is false
    if (!adev->ras_enabled || !con)
                           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2582:17: note: Uninitialized var=
iable: ras_node->ras_obj
     if (ras_node->ras_obj) {
                   ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2584:38: warning: Uninitialized =
variable: obj [uninitvar]
      if (amdgpu_ras_is_supported(adev, obj->ras_comm.block) &&
                                        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2578:25: note: Assuming conditio=
n is false
    if (!adev->ras_enabled || !con)
                           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2583:18: note: Assignment 'obj=
=3Dras_node->ras_obj', assigned value is <Uninit>
      obj =3D ras_node->ras_obj;
                    ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2584:38: note: Uninitialized var=
iable: obj
      if (amdgpu_ras_is_supported(adev, obj->ras_comm.block) &&
                                        ^

vim +2582 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c

c030f2e4166c3f xinhui pan        2018-10-31  2571  =

c030f2e4166c3f xinhui pan        2018-10-31  2572  int amdgpu_ras_fini(stru=
ct amdgpu_device *adev)
c030f2e4166c3f xinhui pan        2018-10-31  2573  {
d5e8ff5f7b2a41 yipechai          2022-01-29  2574  	struct amdgpu_ras_block=
_list *ras_node, *tmp;
1f211a827cbda8 yipechai          2022-02-14  2575  	struct amdgpu_ras_block=
_object *obj =3D NULL;
c030f2e4166c3f xinhui pan        2018-10-31  2576  	struct amdgpu_ras *con =
=3D amdgpu_ras_get_context(adev);
c030f2e4166c3f xinhui pan        2018-10-31  2577  =

8ab0d6f030bab4 Luben Tuikov      2021-05-04  2578  	if (!adev->ras_enabled =
|| !con)
c030f2e4166c3f xinhui pan        2018-10-31  2579  		return 0;
c030f2e4166c3f xinhui pan        2018-10-31  2580  =

1f211a827cbda8 yipechai          2022-02-14  2581  	list_for_each_entry_saf=
e(ras_node, tmp, &adev->ras_list, node) {
1f211a827cbda8 yipechai          2022-02-14 @2582  		if (ras_node->ras_obj)=
 {
1f211a827cbda8 yipechai          2022-02-14  2583  			obj =3D ras_node->ras=
_obj;
1f211a827cbda8 yipechai          2022-02-14 @2584  			if (amdgpu_ras_is_sup=
ported(adev, obj->ras_comm.block) &&
1f211a827cbda8 yipechai          2022-02-14  2585  			    obj->ras_fini)
1f211a827cbda8 yipechai          2022-02-14  2586  				obj->ras_fini(adev, =
&obj->ras_comm);
1f211a827cbda8 yipechai          2022-02-14  2587  		}
1f211a827cbda8 yipechai          2022-02-14  2588  =

1f211a827cbda8 yipechai          2022-02-14  2589  		/* Clear ras blocks fr=
om ras_list and free ras block list node */
1f211a827cbda8 yipechai          2022-02-14  2590  		list_del(&ras_node->no=
de);
1f211a827cbda8 yipechai          2022-02-14  2591  		kfree(ras_node);
1f211a827cbda8 yipechai          2022-02-14  2592  	}
1f211a827cbda8 yipechai          2022-02-14  2593  =

c030f2e4166c3f xinhui pan        2018-10-31  2594  	amdgpu_ras_fs_fini(adev=
);
c030f2e4166c3f xinhui pan        2018-10-31  2595  	amdgpu_ras_interrupt_re=
move_all(adev);
c030f2e4166c3f xinhui pan        2018-10-31  2596  =

c030f2e4166c3f xinhui pan        2018-10-31  2597  	WARN(con->features, "Fe=
ature mask is not cleared");
c030f2e4166c3f xinhui pan        2018-10-31  2598  =

c030f2e4166c3f xinhui pan        2018-10-31  2599  	if (con->features)
c030f2e4166c3f xinhui pan        2018-10-31  2600  		amdgpu_ras_disable_all=
_features(adev, 1);
c030f2e4166c3f xinhui pan        2018-10-31  2601  =

05adfd80cc52e0 Luben Tuikov      2021-05-21  2602  	cancel_delayed_work_syn=
c(&con->ras_counte_delay_work);
05adfd80cc52e0 Luben Tuikov      2021-05-21  2603  =

c030f2e4166c3f xinhui pan        2018-10-31  2604  	amdgpu_ras_set_context(=
adev, NULL);
c030f2e4166c3f xinhui pan        2018-10-31  2605  	kfree(con);
c030f2e4166c3f xinhui pan        2018-10-31  2606  =

c030f2e4166c3f xinhui pan        2018-10-31  2607  	return 0;
c030f2e4166c3f xinhui pan        2018-10-31  2608  }
7c6e68c777f109 Andrey Grodzovsky 2019-09-13  2609  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1958168805403087839==--

