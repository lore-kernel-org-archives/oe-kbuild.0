Content-Type: multipart/mixed; boundary="===============0170927686925343400=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:188:10: warning: %llu in format string (no. 1) requires 'unsigned long long' but the argument type is 'unsigned long'. [invalidPrintfArgType_uint]
Date: Sun, 09 Jan 2022 05:19:00 +0800
Message-ID: <202201090406.QX49eHDE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0170927686925343400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Kim <jonathan.kim@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d1587f7bfe9a0f97a75d42ac1489aeda551106bc
commit: 3f46c4e9ce25bbcb9d619dbce57c8737c856b272 drm/amdkfd: report xgmi ba=
ndwidth between direct peers to the kfd
date:   6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 months ago
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arctu=
rus_ppt.c:
>> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1581:4: warning: Variable 'num=
_of_active_display' is modified but its new value is never used. [unreadVar=
iable]
      num_of_active_display++;
      ^
>> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:169:9: warning: Uninitialized =
variable: clk_freq [uninitvar]
    return clk_freq * 100;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:183:9: warning: Uninitialized =
variable: clk_freq [uninitvar]
    return clk_freq * 100;
           ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/s=
mu7_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c:5514:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%3d %14s %s: %8d %16d %16d %16d %16d %=
16dn",
              ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c:5525:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%3d %16s: %8d %16d %16d ",
              ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c:5530:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%3d %16s: %8s %16s %16s ",
              ^
>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:1109:15: warning: Shifting signed 32-=
bit value by 31 bits is undefined behaviour. See condition at line 1107. [s=
hiftTooManyBitsSigned]
      *mask |=3D 1 << level;
                 ^
   drivers/gpu/drm/amd/pm/amdgpu_pm.c:1107:21: note: Assuming that conditio=
n 'level>31' is not redundant
      if (ret || level > 31)
                       ^
   drivers/gpu/drm/amd/pm/amdgpu_pm.c:1109:15: note: Shift
      *mask |=3D 1 << level;
                 ^
>> drivers/gpu/drm/amd/display/dc/core/dc_link.c:3627:6: warning: Uninitial=
ized variable: link_stream [uninitvar]
    if (link_stream->dpms_off)
        ^
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: warning: Returning p=
ointer to local variable 'formats' that will be invalid when returning. [re=
turnDanglingLifetime]
      return &formats[i];
             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: note: Address of var=
iable taken here.
      return &formats[i];
             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:594:49: note: Variable creat=
ed here.
   lookup_format_info(const struct drm_format_info formats[],
                                                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: note: Returning poin=
ter to local variable 'formats' that will be invalid when returning.
      return &formats[i];
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
--===============0170927686925343400==--

