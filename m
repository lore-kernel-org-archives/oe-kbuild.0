Content-Type: multipart/mixed; boundary="===============3970135814736993298=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [agd5f:drm-next 190/296] drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:188:10: warning: %llu in format string (no. 1) requires 'unsigned long long' but the argument type is 'unsigned long'. [invalidPrintfArgType_uint]
Date: Sun, 01 Aug 2021 17:59:26 +0800
Message-ID: <202108011712.e6WHcfp4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3970135814736993298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Kim <jonathan.kim@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   8b15864cb6023e43f0e1682f108dcdfb8366875b
commit: 3f46c4e9ce25bbcb9d619dbce57c8737c856b272 [190/296] drm/amdkfd: repo=
rt xgmi bandwidth between direct peers to the kfd
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
compiler: ia64-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_l=
ink.c:
>> drivers/gpu/drm/amd/display/dc/core/dc_link.c:3627:6: warning: Uninitial=
ized variable: link_stream [uninitvar]
    if (link_stream->dpms_off)
        ^
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:188:10: warning: %llu in format=
 string (no. 1) requires 'unsigned long long' but the argument type is 'uns=
igned long'. [invalidPrintfArgType_uint]
     return snprintf(buf, PAGE_SIZE, "%llun", hive->hive_id);
            ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:568:59: warning: Uninitialize=
d variable: peer_adev [uninitvar]
    num_links =3D is_min ? 1 : amdgpu_xgmi_get_num_links(adev, peer_adev);
                                                             ^

vim +188 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c

1c1e53f7f2ce19 Tom St Denis      2019-05-24  180  =

d95e8e97e2d522 Dennis Li         2020-08-18  181  static ssize_t amdgpu_xgm=
i_show_attrs(struct kobject *kobj,
d95e8e97e2d522 Dennis Li         2020-08-18  182  	struct attribute *attr, =
char *buf)
b1fa8c89556e8d Andrey Grodzovsky 2019-03-05  183  {
d95e8e97e2d522 Dennis Li         2020-08-18  184  	struct amdgpu_hive_info =
*hive =3D container_of(
d95e8e97e2d522 Dennis Li         2020-08-18  185  		kobj, struct amdgpu_hiv=
e_info, kobj);
b1fa8c89556e8d Andrey Grodzovsky 2019-03-05  186  =

d95e8e97e2d522 Dennis Li         2020-08-18  187  	if (attr =3D=3D &amdgpu_=
xgmi_hive_id)
b1fa8c89556e8d Andrey Grodzovsky 2019-03-05 @188  		return snprintf(buf, PA=
GE_SIZE, "%llu\n", hive->hive_id);
d95e8e97e2d522 Dennis Li         2020-08-18  189  =

d95e8e97e2d522 Dennis Li         2020-08-18  190  	return 0;
b1fa8c89556e8d Andrey Grodzovsky 2019-03-05  191  }
b1fa8c89556e8d Andrey Grodzovsky 2019-03-05  192  =


:::::: The code at line 188 was first introduced by commit
:::::: b1fa8c89556e8d704e9a2e014151c47c64f02e06 drm/amdgpu: Add sysfs entri=
es  for xgmi hive v2.

:::::: TO: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3970135814736993298==--

