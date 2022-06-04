Content-Type: multipart/mixed; boundary="===============5113509011053729377=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 25/29] drivers/ide/ide-sysfs.c:27:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provide...
Date: Sun, 05 Jun 2022 03:43:03 +0800
Message-ID: <202206050345.X64j1LSC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5113509011053729377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/ide/ide-sysfs.c:27:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   eac8b965b3d595180654d8895d89bf1c21dba722
commit: 56f22b8f6853d26be82709a978e89db6856af6b4 [25/29] BACKPORT: Kbuild: =
move to -std=3Dgnu11
:::::: branch date: 23 hours ago
:::::: commit date: 3 weeks ago
config: powerpc-randconfig-c003-20220531 (https://download.01.org/0day-ci/a=
rchive/20220605/202206050345.X64j1LSC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 56f22b8f6853d26be82709a978e89db6856af6b4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~
   drivers/gpu/drm/drm_debugfs.c:245:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < count; i++) {
           ^
   drivers/gpu/drm/drm_debugfs.c:246:22: note: Use of memory after it is fr=
eed
                   list_for_each_safe(pos, q, &minor->debugfs_list) {
                                      ^
   include/linux/list.h:624:31: note: expanded from macro 'list_for_each_sa=
fe'
           for (pos =3D (head)->next, n =3D pos->next; pos !=3D (head); \
                                        ^~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/watchdog/wm831x_wdt.c:234:4: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           ret =3D wm831x_reg_write(wm831x, WM831X_WATCHDOG=
, reg);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/watchdog/wm831x_wdt.c:234:4: note: Value stored to 'ret' is neve=
r read
                           ret =3D wm831x_reg_write(wm831x, WM831X_WATCHDOG=
, reg);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/ide/ide-pm.c:21:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rqpm, 0, sizeof(rqpm));
           ^~~~~~
   drivers/ide/ide-pm.c:21:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&rqpm, 0, sizeof(rqpm));
           ^~~~~~
   drivers/ide/ide-pm.c:79:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rqpm, 0, sizeof(rqpm));
           ^~~~~~
   drivers/ide/ide-pm.c:79:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&rqpm, 0, sizeof(rqpm));
           ^~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/ide/ide-park.c:70:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/ide/ide-park.c:70:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/ide/ide-park.c:112:9: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, 20, "%u\n", msecs);
                  ^~~~~~~~
   drivers/ide/ide-park.c:112:9: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, 20, "%u\n", msecs);
                  ^~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
>> drivers/ide/ide-sysfs.c:27:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           return sprintf(buf, "%s\n", ide_media_string(drive));
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:27:9: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           return sprintf(buf, "%s\n", ide_media_string(drive));
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:35:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           return sprintf(buf, "%s\n", drive->name);
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:35:9: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           return sprintf(buf, "%s\n", drive->name);
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:43:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           return sprintf(buf, "ide:m-%s\n", ide_media_string(drive));
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:43:9: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           return sprintf(buf, "ide:m-%s\n", ide_media_string(drive));
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:51:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           return sprintf(buf, "%s\n", (char *)&drive->id[ATA_ID_PROD]);
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:51:9: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           return sprintf(buf, "%s\n", (char *)&drive->id[ATA_ID_PROD]);
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:59:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           return sprintf(buf, "%s\n", (char *)&drive->id[ATA_ID_FW_REV]);
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:59:9: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           return sprintf(buf, "%s\n", (char *)&drive->id[ATA_ID_FW_REV]);
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:67:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           return sprintf(buf, "%s\n", (char *)&drive->id[ATA_ID_SERNO]);
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:67:9: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           return sprintf(buf, "%s\n", (char *)&drive->id[ATA_ID_SERNO]);
                  ^~~~~~~
   drivers/ide/ide-sysfs.c:142:2: warning: Undefined or garbage value retur=
ned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return rc;
           ^      ~~
   drivers/ide/ide-sysfs.c:134:9: note: 'rc' declared without an initial va=
lue
           int i, rc;
                  ^~
   drivers/ide/ide-sysfs.c:136:2: note: Loop condition is false. Execution =
continues on line 142
           for (i =3D 0; ide_port_attrs[i]; i++) {
           ^
   drivers/ide/ide-sysfs.c:142:2: note: Undefined or garbage value returned=
 to caller
           return rc;
           ^      ~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/hwmon/adc128d818.c:159:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/adc128d818.c:159:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/adc128d818.c:199:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp * 500);/* 0.5 degrees C resolut=
ion */
                  ^~~~~~~
   drivers/hwmon/adc128d818.c:199:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp * 500);/* 0.5 degrees C resolut=
ion */
                  ^~~~~~~
   drivers/hwmon/adc128d818.c:218:29: warning: The result of the left shift=
 is undefined because the left operand is negative [clang-analyzer-core.Und=
efinedBinaryOperatorResult]
           data->temp[index] =3D regval << 1;
                               ~~~~~~ ^
   drivers/hwmon/adc128d818.c:207:14: note: Left side of '&&' is false
           int index =3D to_sensor_dev_attr(attr)->index;
                       ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:855:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwmon/adc128d818.c:207:14: note: Taking false branch
           int index =3D to_sensor_dev_attr(attr)->index;
                       ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:855:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/adc128d818.c:207:14: note: Loop condition is false.  Exiti=
ng loop
           int index =3D to_sensor_dev_attr(attr)->index;
                       ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
--
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1112:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1122:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1122:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1158:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", data->alarm_mask);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1158:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", data->alarm_mask);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1199:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", data->gpio);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1199:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", data->gpio);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1233:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", data->gpio_mask);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1233:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", data->gpio_mask);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1267:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", PWM_FROM_REG(data->pwm1.pwm));
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1267:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", PWM_FROM_REG(data->pwm1.pwm));
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1297:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwm1.auto_pwm_min);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1297:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwm1.auto_pwm_min);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1328:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ADM1026_PWM_MAX);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1328:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ADM1026_PWM_MAX);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1335:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->pwm1.enable);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1335:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->pwm1.enable);
                  ^~~~~~~
   drivers/hwmon/adm1026.c:1574:6: warning: Value stored to 'address' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int address =3D client->addr;
               ^~~~~~~   ~~~~~~~~~~~~
   drivers/hwmon/adm1026.c:1574:6: note: Value stored to 'address' during i=
ts initialization is never read
           int address =3D client->addr;
               ^~~~~~~   ~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/block/virtio_blk.c:526:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req.%d", i);
                   ^~~~~~~~
   drivers/block/virtio_blk.c:526:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req.%d", i);
                   ^~~~~~~~
   drivers/block/virtio_blk.c:572:2: warning: Call to function 'memmove' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(begin, p, end - p);
           ^~~~~~~
   drivers/block/virtio_blk.c:572:2: note: Call to function 'memmove' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memmove_s' in case of C11
           memmove(begin, p, end - p);
           ^~~~~~~
   drivers/block/virtio_blk.c:573:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, prefix, strlen(prefix));
           ^~~~~~
   drivers/block/virtio_blk.c:573:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, prefix, strlen(prefix));
           ^~~~~~
   drivers/block/virtio_blk.c:637:9: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, 40, "%s\n", virtblk_cache_types[writeback]);
                  ^~~~~~~~
   drivers/block/virtio_blk.c:637:9: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, 40, "%s\n", virtblk_cache_types[writeback]);
                  ^~~~~~~~
   drivers/block/virtio_blk.c:769:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&vblk->tag_set, 0, sizeof(vblk->tag_set));
           ^~~~~~
   drivers/block/virtio_blk.c:769:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&vblk->tag_set, 0, sizeof(vblk->tag_set));
           ^~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
>> drivers/gpu/drm/drm_dp_aux_dev.c:115:8: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           res =3D sprintf(buf, "%s\n", aux_dev->aux->name);
                 ^~~~~~~
   drivers/gpu/drm/drm_dp_aux_dev.c:115:8: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           res =3D sprintf(buf, "%s\n", aux_dev->aux->name);
                 ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/gpu/drm/selftests/test-drm_mm.c:212:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mm, 0, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:212:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&mm, 0, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:218:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mm, 0xff, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:218:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&mm, 0xff, sizeof(mm));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:236:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:236:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:277:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(nodes, 0, sizeof(nodes));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:277:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(nodes, 0, sizeof(nodes));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:600:4: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(node, 0, sizeof(*node));
                           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:600:4: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                           memset(node, 0, sizeof(*node));
                           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1471:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1471:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&tmp, 0, sizeof(tmp));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1952:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsvd_lo, 0, sizeof(rsvd_lo));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1952:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&rsvd_lo, 0, sizeof(rsvd_lo));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1961:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rsvd_hi, 0, sizeof(rsvd_hi));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1961:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&rsvd_hi, 0, sizeof(rsvd_hi));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1976:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&node, 0, sizeof(node));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:1976:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&node, 0, sizeof(node));
           ^~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2181:2: warning: Use of memory a=
fter it is freed [clang-analyzer-unix.Malloc]
           drm_mm_for_each_node_safe(node, nn, &mm) {
           ^
   include/drm/drm_mm.h:374:2: note: expanded from macro 'drm_mm_for_each_n=
ode_safe'
           list_for_each_entry_safe(entry, next, drm_mm_nodes(mm), node_lis=
t)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/list.h:742:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:854:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: Assuming '__UNIQU=
E_ID___x323' is >=3D '__UNIQUE_ID___y324'
           const unsigned int count =3D min(4096u, max_iterations);
                                      ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/selftests/test-drm_mm.c:2034:29: note: '?' condition is =
false
           const unsigned int count =3D min(4096u, max_iterations);
--
           ^~~~~~~~
   drivers/nvme/host/fabrics.c:148:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:148:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:194:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:194:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:239:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:239:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:379:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:379:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:401:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:401:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:402:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:402:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:449:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:449:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&cmd, 0, sizeof(cmd));
           ^~~~~~
   drivers/nvme/host/fabrics.c:464:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:464:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:465:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:465:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/mtd/nand/raw/mxic_nand.c:354:4: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&data, txbuf + pos, nbytes);
                           ^~~~~~
   drivers/mtd/nand/raw/mxic_nand.c:354:4: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&data, txbuf + pos, nbytes);
                           ^~~~~~
   drivers/mtd/nand/raw/mxic_nand.c:377:4: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(rxbuf + pos, &data, nbytes);
                           ^~~~~~
   drivers/mtd/nand/raw/mxic_nand.c:377:4: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(rxbuf + pos, &data, nbytes);
                           ^~~~~~
   drivers/mtd/nand/raw/mxic_nand.c:409:11: warning: The result of the left=
 shift is undefined because the left operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
                                  OP_CMD_BYTES(0), nfc->regs + SS_CTRL(0));
                                  ^
   drivers/mtd/nand/raw/mxic_nand.c:73:37: note: expanded from macro 'OP_CM=
D_BYTES'
   #define OP_CMD_BYTES(x)         (((x) - 1) << 13)
                                    ~~~~~~~~~ ^
   drivers/mtd/nand/raw/mxic_nand.c:396:6: note: Assuming 'check_only' is f=
alse
           if (check_only)
               ^~~~~~~~~~
   drivers/mtd/nand/raw/mxic_nand.c:396:2: note: Taking false branch
           if (check_only)
           ^
   drivers/mtd/nand/raw/mxic_nand.c:401:18: note: Assuming 'op_id' is < fie=
ld 'ninstrs'
           for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
                           ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/mxic_nand.c:401:2: note: Loop condition is true.  E=
ntering loop body
           for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
           ^
   drivers/mtd/nand/raw/mxic_nand.c:404:3: note: Control jumps to 'case NAN=
D_OP_CMD_INSTR:'  at line 405
                   switch (instr->type) {
                   ^
   drivers/mtd/nand/raw/mxic_nand.c:409:11: note: The result of the left sh=
ift is undefined because the left operand is negative
                                  OP_CMD_BYTES(0), nfc->regs + SS_CTRL(0));
                                  ^
   drivers/mtd/nand/raw/mxic_nand.c:73:37: note: expanded from macro 'OP_CM=
D_BYTES'
   #define OP_CMD_BYTES(x)         (((x) - 1) << 13)
                                    ~~~~~~~~~ ^
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
>> drivers/mmc/host/android-goldfish.c:139:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", goldfish_mmc_cover_is_open(host) ? "=
open" :
                  ^~~~~~~
   drivers/mmc/host/android-goldfish.c:139:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", goldfish_mmc_cover_is_open(host) ? "=
open" :
                  ^~~~~~~
   drivers/mmc/host/android-goldfish.c:155:2: warning: Value stored to 'cmd=
type' is never read [clang-analyzer-deadcode.DeadStores]
           cmdtype =3D 0;
           ^         ~
   drivers/mmc/host/android-goldfish.c:155:2: note: Value stored to 'cmdtyp=
e' is never read
           cmdtype =3D 0;
           ^         ~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/md/dm-bufio.c:1774:3: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(slab_name, sizeof slab_name, "dm_bufio_cache-%u=
", block_size);
                   ^~~~~~~~
   drivers/md/dm-bufio.c:1774:3: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
                   snprintf(slab_name, sizeof slab_name, "dm_bufio_cache-%u=
", block_size);
                   ^~~~~~~~
   drivers/md/dm-bufio.c:1783:3: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(slab_name, sizeof slab_name, "dm_bufio_buffer-%=
u", aux_size);
                   ^~~~~~~~
   drivers/md/dm-bufio.c:1783:3: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
                   snprintf(slab_name, sizeof slab_name, "dm_bufio_buffer-%=
u", aux_size);
                   ^~~~~~~~
   drivers/md/dm-bufio.c:1785:3: warning: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(slab_name, sizeof slab_name, "dm_bufio_buffer");
                   ^~~~~~~~
   drivers/md/dm-bufio.c:1785:3: note: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11
                   snprintf(slab_name, sizeof slab_name, "dm_bufio_buffer");
                   ^~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/md/dm-bio-prison-v1.c:80:8: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
          memcpy(&cell->key, key, sizeof(cell->key));
          ^~~~~~
   drivers/md/dm-bio-prison-v1.c:80:8: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
          memcpy(&cell->key, key, sizeof(cell->key));
          ^~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/mmc/core/bus.c:37:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "MMC\n");
                          ^~~~~~~
   drivers/mmc/core/bus.c:37:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "MMC\n");
                          ^~~~~~~
   drivers/mmc/core/bus.c:39:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "SD\n");
                          ^~~~~~~
   drivers/mmc/core/bus.c:39:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "SD\n");
                          ^~~~~~~
   drivers/mmc/core/bus.c:41:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "SDIO\n");
                          ^~~~~~~
   drivers/mmc/core/bus.c:41:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "SDIO\n");
                          ^~~~~~~
   drivers/mmc/core/bus.c:43:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "SDcombo\n");
                          ^~~~~~~
   drivers/mmc/core/bus.c:43:10: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "SDcombo\n");
                          ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/mmc/core/mmc.c:306:2: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           sprintf(card->part[card->nr_parts].name, name, idx);
           ^~~~~~~
   drivers/mmc/core/mmc.c:306:2: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           sprintf(card->part[card->nr_parts].name, name, idx);
           ^~~~~~~
   drivers/mmc/core/mmc.c:628:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(card->ext_csd.fwrev, &ext_csd[EXT_CSD_FIRMWARE_VE=
RSION],
                   ^~~~~~
   drivers/mmc/core/mmc.c:628:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(card->ext_csd.fwrev, &ext_csd[EXT_CSD_FIRMWARE_VE=
RSION],
                   ^~~~~~
   drivers/mmc/core/mmc.c:776:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(cid, "%08x%08x%08x%08x\n", card->raw_cid[0], card->raw_cid[=
1],
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/mmc.c:776:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(cid, "%08x%08x%08x%08x\n", card->raw_cid[0], card->raw_cid[=
1],
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \

vim +27 drivers/ide/ide-sysfs.c

ebdab07dad3d3a0 Bartlomiej Zolnierkiewicz 2009-01-02  22  =

ebdab07dad3d3a0 Bartlomiej Zolnierkiewicz 2009-01-02  23  static ssize_t me=
dia_show(struct device *dev, struct device_attribute *attr,
ebdab07dad3d3a0 Bartlomiej Zolnierkiewicz 2009-01-02  24  			  char *buf)
ebdab07dad3d3a0 Bartlomiej Zolnierkiewicz 2009-01-02  25  {
ebdab07dad3d3a0 Bartlomiej Zolnierkiewicz 2009-01-02  26  	ide_drive_t *dri=
ve =3D to_ide_device(dev);
ebdab07dad3d3a0 Bartlomiej Zolnierkiewicz 2009-01-02 @27  	return sprintf(b=
uf, "%s\n", ide_media_string(drive));
ebdab07dad3d3a0 Bartlomiej Zolnierkiewicz 2009-01-02  28  }
fb3fed7926545e4 Greg Kroah-Hartman        2013-10-07  29  static DEVICE_ATT=
R_RO(media);
ebdab07dad3d3a0 Bartlomiej Zolnierkiewicz 2009-01-02  30  =


:::::: The code at line 27 was first introduced by commit
:::::: ebdab07dad3d3a008e519b0a028e1e1ad5ecaef0 ide: move sysfs support to =
ide-sysfs.c

:::::: TO: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
:::::: CC: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5113509011053729377==--

