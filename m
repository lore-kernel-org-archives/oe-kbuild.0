Content-Type: multipart/mixed; boundary="===============5827879225545248283=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/driver-override-rpmsg-fix 4/5] drivers/rpmsg/rpmsg_core.c:607:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clan...
Date: Sat, 30 Apr 2022 16:55:04 +0800
Message-ID: <202204301637.YvZw3VA5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5827879225545248283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/driver-override-rpmsg-fix
head:   6c8aa4c7657743ea1f60d415fd2cba0e581af45d
commit: 8650264e492b730081fb73505f3ca7a7041fc1c1 [4/5] rpmsg: Fix calling d=
evice_lock() on non-initialized device
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-c002-20220428 (https://download.01.org/0day-ci/archi=
ve/20220430/202204301637.YvZw3VA5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/krzk/linux/commit/8650264e492b730081fb73505f3c=
a7a7041fc1c1
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/driver-override-rpmsg-fix
        git checkout 8650264e492b730081fb73505f3ca7a7041fc1c1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/helene.c:1093:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &helene_tuner_ops,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/rpmsg/rpmsg_core.c:436:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
   rpmsg_show_attr(name, id.name, "%s\n");
   ^
   drivers/rpmsg/rpmsg_core.c:393:9: note: expanded from macro 'rpmsg_show_=
attr'
           return sprintf(buf, format_string, rpdev->path);                \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:436:1: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
   rpmsg_show_attr(name, id.name, "%s\n");
   ^
   drivers/rpmsg/rpmsg_core.c:393:9: note: expanded from macro 'rpmsg_show_=
attr'
           return sprintf(buf, format_string, rpdev->path);                \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:437:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   rpmsg_show_attr(src, src, "0x%x\n");
   ^
   drivers/rpmsg/rpmsg_core.c:393:9: note: expanded from macro 'rpmsg_show_=
attr'
           return sprintf(buf, format_string, rpdev->path);                \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:437:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   rpmsg_show_attr(src, src, "0x%x\n");
   ^
   drivers/rpmsg/rpmsg_core.c:393:9: note: expanded from macro 'rpmsg_show_=
attr'
           return sprintf(buf, format_string, rpdev->path);                \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:438:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   rpmsg_show_attr(dst, dst, "0x%x\n");
   ^
   drivers/rpmsg/rpmsg_core.c:393:9: note: expanded from macro 'rpmsg_show_=
attr'
           return sprintf(buf, format_string, rpdev->path);                \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:438:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   rpmsg_show_attr(dst, dst, "0x%x\n");
   ^
   drivers/rpmsg/rpmsg_core.c:393:9: note: expanded from macro 'rpmsg_show_=
attr'
           return sprintf(buf, format_string, rpdev->path);                \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:439:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
   rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
   ^
   drivers/rpmsg/rpmsg_core.c:393:9: note: expanded from macro 'rpmsg_show_=
attr'
           return sprintf(buf, format_string, rpdev->path);                \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:439:1: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
   rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
   ^
   drivers/rpmsg/rpmsg_core.c:393:9: note: expanded from macro 'rpmsg_show_=
attr'
           return sprintf(buf, format_string, rpdev->path);                \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:440:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
   rpmsg_string_attr(driver_override, driver_override);
   ^
   drivers/rpmsg/rpmsg_core.c:431:9: note: expanded from macro 'rpmsg_strin=
g_attr'
           return sprintf(buf, "%s\n", rpdev->member);                     \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:440:1: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
   rpmsg_string_attr(driver_override, driver_override);
   ^
   drivers/rpmsg/rpmsg_core.c:431:9: note: expanded from macro 'rpmsg_strin=
g_attr'
           return sprintf(buf, "%s\n", rpdev->member);                     \
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:452:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.na=
me);
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:452:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.na=
me);
                  ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:529:3: warning: Call to function 'strncpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
                   ^~~~~~~
   drivers/rpmsg/rpmsg_core.c:529:3: note: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11
                   strncpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
                   ^~~~~~~
>> drivers/rpmsg/rpmsg_core.c:607:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(rpdev->id.name, driver_override);
                   ^~~~~~
   drivers/rpmsg/rpmsg_core.c:607:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(rpdev->id.name, driver_override);
                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/power/supply/apm_power.c:78:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&bp, 0, sizeof(struct find_bat_param));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/power/supply/apm_power.c:78:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&bp, 0, sizeof(struct find_bat_param));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/power/supply/wm8350_power.c:179:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", charge);
                  ^~~~~~~
   drivers/power/supply/wm8350_power.c:179:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", charge);
                  ^~~~~~~
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   drivers/power/supply/test_power.c:309:2: warning: Call to function 'strn=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'strncpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(buf, key, MAX_KEYLENGTH);
           ^~~~~~~
   drivers/power/supply/test_power.c:309:2: note: Call to function 'strncpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(buf, key, MAX_KEYLENGTH);
           ^~~~~~~
   drivers/power/supply/test_power.c:355:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:355:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:368:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:368:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:382:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:382:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:396:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:396:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:411:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:411:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:427:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:427:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buffer, "%s\n",
                  ^~~~~~~
   drivers/power/supply/test_power.c:437:11: warning: Call to function 'ssc=
anf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (1 !=3D sscanf(key, "%d", &tmp))
                    ^~~~~~
   drivers/power/supply/test_power.c:437:11: note: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11
           if (1 !=3D sscanf(key, "%d", &tmp))
                    ^~~~~~
   drivers/power/supply/test_power.c:452:11: warning: Call to function 'ssc=
anf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (1 !=3D sscanf(key, "%d", &tmp))

vim +607 drivers/rpmsg/rpmsg_core.c

5e619b48677ca8 Bjorn Andersson     2016-09-01  595  =

8650264e492b73 Krzysztof Kozlowski 2022-04-29  596  /*
8650264e492b73 Krzysztof Kozlowski 2022-04-29  597   * A helper for registe=
ring rpmsg device with driver override and name.
8650264e492b73 Krzysztof Kozlowski 2022-04-29  598   * Drivers should not b=
e using it, but instead rpmsg_register_device().
8650264e492b73 Krzysztof Kozlowski 2022-04-29  599   */
8650264e492b73 Krzysztof Kozlowski 2022-04-29  600  int rpmsg_register_devi=
ce_override(struct rpmsg_device *rpdev,
8650264e492b73 Krzysztof Kozlowski 2022-04-29  601  				   const char *driv=
er_override)
5e619b48677ca8 Bjorn Andersson     2016-09-01  602  {
5e619b48677ca8 Bjorn Andersson     2016-09-01  603  	struct device *dev =3D=
 &rpdev->dev;
5e619b48677ca8 Bjorn Andersson     2016-09-01  604  	int ret;
5e619b48677ca8 Bjorn Andersson     2016-09-01  605  =

8650264e492b73 Krzysztof Kozlowski 2022-04-29  606  	if (driver_override)
8650264e492b73 Krzysztof Kozlowski 2022-04-29 @607  		strcpy(rpdev->id.name=
, driver_override);
8650264e492b73 Krzysztof Kozlowski 2022-04-29  608  =

63447646ac657f Loic Pallardy       2016-12-15  609  	dev_set_name(&rpdev->d=
ev, "%s.%s.%d.%d", dev_name(dev->parent),
63447646ac657f Loic Pallardy       2016-12-15  610  		     rpdev->id.name, =
rpdev->src, rpdev->dst);
5e619b48677ca8 Bjorn Andersson     2016-09-01  611  =

5e619b48677ca8 Bjorn Andersson     2016-09-01  612  	rpdev->dev.bus =3D &rp=
msg_bus;
5e619b48677ca8 Bjorn Andersson     2016-09-01  613  =

8650264e492b73 Krzysztof Kozlowski 2022-04-29  614  	device_initialize(dev);
8650264e492b73 Krzysztof Kozlowski 2022-04-29  615  	if (driver_override) {
8650264e492b73 Krzysztof Kozlowski 2022-04-29  616  		ret =3D driver_set_ov=
erride(dev, &rpdev->driver_override,
8650264e492b73 Krzysztof Kozlowski 2022-04-29  617  					  driver_override,
8650264e492b73 Krzysztof Kozlowski 2022-04-29  618  					  strlen(driver_ov=
erride));
5e619b48677ca8 Bjorn Andersson     2016-09-01  619  		if (ret) {
8650264e492b73 Krzysztof Kozlowski 2022-04-29  620  			dev_err(dev, "device=
_set_override failed: %d\n", ret);
8650264e492b73 Krzysztof Kozlowski 2022-04-29  621  			return ret;
8650264e492b73 Krzysztof Kozlowski 2022-04-29  622  		}
8650264e492b73 Krzysztof Kozlowski 2022-04-29  623  	}
8650264e492b73 Krzysztof Kozlowski 2022-04-29  624  =

8650264e492b73 Krzysztof Kozlowski 2022-04-29  625  	ret =3D device_add(dev=
);
8650264e492b73 Krzysztof Kozlowski 2022-04-29  626  	if (ret) {
8650264e492b73 Krzysztof Kozlowski 2022-04-29  627  		dev_err(dev, "device_=
add failed: %d\n", ret);
8650264e492b73 Krzysztof Kozlowski 2022-04-29  628  		kfree(rpdev->driver_o=
verride);
8650264e492b73 Krzysztof Kozlowski 2022-04-29  629  		rpdev->driver_overrid=
e =3D NULL;
5e619b48677ca8 Bjorn Andersson     2016-09-01  630  		put_device(&rpdev->de=
v);
5e619b48677ca8 Bjorn Andersson     2016-09-01  631  	}
5e619b48677ca8 Bjorn Andersson     2016-09-01  632  =

5e619b48677ca8 Bjorn Andersson     2016-09-01  633  	return ret;
5e619b48677ca8 Bjorn Andersson     2016-09-01  634  }
8650264e492b73 Krzysztof Kozlowski 2022-04-29  635  EXPORT_SYMBOL(rpmsg_reg=
ister_device_override);
8650264e492b73 Krzysztof Kozlowski 2022-04-29  636  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5827879225545248283==--

