Content-Type: multipart/mixed; boundary="===============5996687862983930520=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:69:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arg...
Date: Thu, 28 Apr 2022 10:00:50 +0800
Message-ID: <202204280942.fNkqr8CI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5996687862983930520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   46cf2c613f4b10eb12f749207b0fd2c1bfae3088
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   7 weeks ago
:::::: branch date: 26 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-c006-20220425 (https://download.01.org/0day-ci/arc=
hive/20220428/202204280942.fNkqr8CI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   35 warnings generated.
   lib/842/842_decompress.c:205:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(p->out, &p->ostart[offset], size);
           ^~~~~~
   lib/842/842_decompress.c:205:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(p->out, &p->ostart[offset], size);
           ^~~~~~
   lib/842/842_decompress.c:319:5: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(p.out, p.out - 8, 8);
                                   ^~~~~~
   lib/842/842_decompress.c:319:5: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(p.out, p.out - 8, 8);
                                   ^~~~~~
   lib/842/842_decompress.c:332:4: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(p.out, 0, 8);
                           ^~~~~~
   lib/842/842_decompress.c:332:4: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                           memset(p.out, 0, 8);
                           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:92:2: warning: Undefined or garba=
ge value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return r;
           ^
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:102:2: note: Taking false branch
           dev_dbg(adev->dev, "Aldebaran prepare hw context\n");
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:104:6: note: Assuming the conditi=
on is true
           if (!amdgpu_sriov_vf(adev))
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:104:2: note: Taking true branch
           if (!amdgpu_sriov_vf(adev))
           ^
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:105:7: note: Calling 'aldebaran_m=
ode2_suspend_ip'
                   r =3D aldebaran_mode2_suspend_ip(adev);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:68:6: note: 'r' declared without =
an initial value
           int r, i;
               ^
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:73:36: note: Assuming 'i' is < 0
           for (i =3D adev->num_ip_blocks - 1; i >=3D 0; i--) {
                                             ^~~~~~
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:73:2: note: Loop condition is fal=
se. Execution continues on line 92
           for (i =3D adev->num_ip_blocks - 1; i >=3D 0; i--) {
           ^
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:92:2: note: Undefined or garbage =
value returned to caller
           return r;
           ^      ~
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:140:24: warning: Value stored to =
'adev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct amdgpu_device *adev =3D (struct amdgpu_device *)reset_ctl=
->handle;
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:140:24: note: Value stored to 'ad=
ev' during its initialization is never read
           struct amdgpu_device *adev =3D (struct amdgpu_device *)reset_ctl=
->handle;
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:368:2: warning: Undefined or garb=
age value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return r;
           ^      ~
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:322:2: note: 'r' declared without=
 an initial value
           int r;
           ^~~~~
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:325:6: note: Assuming field 'hive=
' is not equal to NULL
           if (reset_context->hive =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:325:2: note: Taking false branch
           if (reset_context->hive =3D=3D NULL) {
           ^
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:330:2: note: Loop condition is fa=
lse. Execution continues on line 368
           list_for_each_entry(tmp_adev, &reset_context->hive->device_list,
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/gpu/drm/amd/amdgpu/aldebaran.c:368:2: note: Undefined or garbage=
 value returned to caller
           return r;
           ^      ~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:69:10: warning: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecated=
OrUnsafeBufferHandling]
                   return sprintf(buf, "%s\n", amdgpu_pmu_attr->event_str);
                          ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:69:10: note: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11
                   return sprintf(buf, "%s\n", amdgpu_pmu_attr->event_str);
                          ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:71:9: warning: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedO=
rUnsafeBufferHandling]
           return sprintf(buf, "%s,type=3D0x%x\n",
                  ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:71:9: note: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11
           return sprintf(buf, "%s,type=3D0x%x\n",
                  ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:546:2: warning: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d", pmu_entry->pmu_file_p=
refix,
           ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:546:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d", pmu_entry->pmu_file_p=
refix,
           ^~~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/video/backlight/gpio_backlight.c:75:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(props));
           ^~~~~~
   drivers/video/backlight/gpio_backlight.c:75:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(props));
           ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/video/fbdev/core/fbmem.c:621:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fb_logo, 0, sizeof(struct logo_data));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:621:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&fb_logo, 0, sizeof(struct logo_data));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:808:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   fb_memcpy_fromfb(dst, src, c);
                   ^
   include/linux/fb.h:574:26: note: expanded from macro 'fb_memcpy_fromfb'
   #define fb_memcpy_fromfb memcpy
                            ^~~~~~
   drivers/video/fbdev/core/fbmem.c:808:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   fb_memcpy_fromfb(dst, src, c);
                   ^
   include/linux/fb.h:574:26: note: expanded from macro 'fb_memcpy_fromfb'
   #define fb_memcpy_fromfb memcpy
                            ^~~~~~
   drivers/video/fbdev/core/fbmem.c:809:3: warning: Value stored to 'dst' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:809:3: note: Value stored to 'dst' is n=
ever read
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:885:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   fb_memcpy_tofb(dst, src, c);
                   ^
   include/linux/fb.h:575:24: note: expanded from macro 'fb_memcpy_tofb'
   #define fb_memcpy_tofb memcpy
                          ^~~~~~
   drivers/video/fbdev/core/fbmem.c:885:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   fb_memcpy_tofb(dst, src, c);
                   ^
   include/linux/fb.h:575:24: note: expanded from macro 'fb_memcpy_tofb'
   #define fb_memcpy_tofb memcpy
                          ^~~~~~
   drivers/video/fbdev/core/fbmem.c:887:3: warning: Value stored to 'src' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   src +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:887:3: note: Value stored to 'src' is n=
ever read
                   src +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:943:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&caps, 0, sizeof(caps));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:943:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&caps, 0, sizeof(caps));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:944:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fbcaps, 0, sizeof(fbcaps));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:944:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&fbcaps, 0, sizeof(fbcaps));
           ^~~~~~
   drivers/video/fbdev/core/fbmem.c:1122:3: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&fix, &info->fix, sizeof(fix));

vim +69 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c

9c7c85f7ea1fe5 Jonathan Kim 2019-06-19  59  =

b4a7db71ea0602 Jonathan Kim 2020-09-01  60  static ssize_t amdgpu_pmu_event=
_show(struct device *dev,
b4a7db71ea0602 Jonathan Kim 2020-09-01  61  				struct device_attribute *at=
tr, char *buf)
b4a7db71ea0602 Jonathan Kim 2020-09-01  62  {
b4a7db71ea0602 Jonathan Kim 2020-09-01  63  	struct amdgpu_pmu_event_attrib=
ute *amdgpu_pmu_attr;
b4a7db71ea0602 Jonathan Kim 2020-09-01  64  =

b4a7db71ea0602 Jonathan Kim 2020-09-01  65  	amdgpu_pmu_attr =3D container_=
of(attr, struct amdgpu_pmu_event_attribute,
b4a7db71ea0602 Jonathan Kim 2020-09-01  66  									attr);
b4a7db71ea0602 Jonathan Kim 2020-09-01  67  =

b4a7db71ea0602 Jonathan Kim 2020-09-01  68  	if (!amdgpu_pmu_attr->type)
b4a7db71ea0602 Jonathan Kim 2020-09-01 @69  		return sprintf(buf, "%s\n", a=
mdgpu_pmu_attr->event_str);
b4a7db71ea0602 Jonathan Kim 2020-09-01  70  =

b4a7db71ea0602 Jonathan Kim 2020-09-01  71  	return sprintf(buf, "%s,type=
=3D0x%x\n",
b4a7db71ea0602 Jonathan Kim 2020-09-01  72  			amdgpu_pmu_attr->event_str, =
amdgpu_pmu_attr->type);
b4a7db71ea0602 Jonathan Kim 2020-09-01  73  }
b4a7db71ea0602 Jonathan Kim 2020-09-01  74  =


:::::: The code at line 69 was first introduced by commit
:::::: b4a7db71ea060218529e6a4c660c37687ecb5669 drm/amdgpu: add per device =
user friendly xgmi events for vega20

:::::: TO: Jonathan Kim <jonathan.kim@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5996687862983930520==--

