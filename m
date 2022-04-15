Content-Type: multipart/mixed; boundary="===============0340989230796948687=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [esmil:visionfive 41/54] drivers/gpu/drm/i2c/tda998x_drv.c:1605:3: warning: Value stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 15 Apr 2022 20:39:33 +0800
Message-ID: <202204152034.mBC7RsS5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0340989230796948687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "sw.multimedia" <sw.multimedia@starfivetech.com>
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: "jack.zhu" <jack.zhu@starfivetech.com>
CC: "keith.zhao" <keith.zhao@starfivetech.com>

tree:   https://github.com/esmil/linux visionfive
head:   4d0bf74de3a2e2bb05b6c110d3b258d005430d7f
commit: 5d3f821210ca45e0ac9ae84f63d51765ca72f2b8 [41/54] drm/i2c/tda998x: H=
ardcode register values for Starlight
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220414 (https://download.01.org/0day-ci/archi=
ve/20220415/202204152034.mBC7RsS5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6e=
a489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/esmil/linux/commit/5d3f821210ca45e0ac9ae84f63d=
51765ca72f2b8
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 5d3f821210ca45e0ac9ae84f63d51765ca72f2b8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/char/hw_random/core.c:90:2: note: Taking false branch
           BUG_ON(!mutex_is_locked(&rng_mutex));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/char/hw_random/core.c:90:2: note: Loop condition is false.  Exit=
ing loop
           BUG_ON(!mutex_is_locked(&rng_mutex));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/char/hw_random/core.c:92:19: note: Passing null pointer value vi=
a 1st parameter 'rng'
           err =3D hwrng_init(rng);
                            ^~~
   drivers/char/hw_random/core.c:92:8: note: Calling 'hwrng_init'
           err =3D hwrng_init(rng);
                 ^~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:149:6: note: Assuming the condition is true
           if (kref_get_unless_zero(&rng->ref))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/core.c:149:2: note: Taking true branch
           if (kref_get_unless_zero(&rng->ref))
           ^
   drivers/char/hw_random/core.c:150:3: note: Control jumps to line 164
                   goto skip_init;
                   ^
   drivers/char/hw_random/core.c:164:7: note: Access to field 'quality' res=
ults in a dereference of a null pointer (loaded from variable 'rng')
           if (!rng->quality)
                ^~~
   drivers/char/hw_random/core.c:372:8: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, PAGE_SIZE, "%s\n", rng ? rng->name : "none=
");
                 ^~~~~~~~
   drivers/char/hw_random/core.c:372:8: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, PAGE_SIZE, "%s\n", rng ? rng->name : "none=
");
                 ^~~~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/gpu/drm/i2c/tda998x_drv.c:623:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buf[1], p, cnt);
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:623:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&buf[1], p, cnt);
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1075:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(audio.status, params->iec.status,
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1075:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(audio.status, params->iec.status,
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1155:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, priv->connector.eld,
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1155:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, priv->connector.eld,
           ^~~~~~
>> drivers/gpu/drm/i2c/tda998x_drv.c:1605:3: warning: Value stored to 'reg'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   reg |=3D VIP_CNTRL_3_V_TGL;
                   ^
   drivers/gpu/drm/i2c/tda998x_drv.c:1605:3: note: Value stored to 'reg' is=
 never read
   drivers/gpu/drm/i2c/tda998x_drv.c:1773:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(priv->audio.status, p->audio_params.status,
                   ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1773:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(priv->audio.status, p->audio_params.status,
                   ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1953:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cec_info, 0, sizeof(cec_info));
           ^~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:1953:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&cec_info, 0, sizeof(cec_info));
           ^~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/hwmon/adm1021.c:152:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:152:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:161:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_max[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:161:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_max[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:170:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_min[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:170:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_min[index]);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:178:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> index) & 1);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:178:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> index) & 1);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:186:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:186:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:245:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->low_power);
                  ^~~~~~~
   drivers/hwmon/adm1021.c:245:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->low_power);
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/hwmon/w83l785ts.c:117:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/w83l785ts.c:117:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index=
]));
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/hwmon/wm831x-hwmon.c:41:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(ret, 1000));
                  ^~~~~~~
   drivers/hwmon/wm831x-hwmon.c:41:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(ret, 1000));
                  ^~~~~~~
   drivers/hwmon/wm831x-hwmon.c:59:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
   drivers/hwmon/wm831x-hwmon.c:59:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", ret);
                  ^~~~~~~
   drivers/hwmon/wm831x-hwmon.c:67:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", input_names[channel]);
                  ^~~~~~~
   drivers/hwmon/wm831x-hwmon.c:67:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", input_names[channel]);
                  ^~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/hwmon/ibmpex.c:262:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           return sprintf(buf, "%s\n", DRVNAME);
                  ^~~~~~~
   drivers/hwmon/ibmpex.c:262:9: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           return sprintf(buf, "%s\n", DRVNAME);
                  ^~~~~~~
   drivers/hwmon/ibmpex.c:275:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/ibmpex.c:275:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/ibmpex.c:338:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]

vim +/reg +1605 drivers/gpu/drm/i2c/tda998x_drv.c

e7792ce2da5ded8 Rob Clark             2013-01-08  1429  =

30bd8b862f5466f Russell King          2018-08-02  1430  static void tda998x=
_bridge_mode_set(struct drm_bridge *bridge,
63f8f3badf799c8 Laurent Pinchart      2018-04-06  1431  				    const struc=
t drm_display_mode *mode,
63f8f3badf799c8 Laurent Pinchart      2018-04-06  1432  				    const struc=
t drm_display_mode *adjusted_mode)
e7792ce2da5ded8 Rob Clark             2013-01-08  1433  {
30bd8b862f5466f Russell King          2018-08-02  1434  	struct tda998x_pri=
v *priv =3D bridge_to_tda998x_priv(bridge);
926a299c42e38bb Russell King          2018-08-02  1435  	unsigned long tmds=
_clock;
e66e03abf80f701 Russell King          2015-06-06  1436  	u16 ref_pix, ref_l=
ine, n_pix, n_line;
e66e03abf80f701 Russell King          2015-06-06  1437  	u16 hs_pix_s, hs_p=
ix_e;
e66e03abf80f701 Russell King          2015-06-06  1438  	u16 vs1_pix_s, vs1=
_pix_e, vs1_line_s, vs1_line_e;
e66e03abf80f701 Russell King          2015-06-06  1439  	u16 vs2_pix_s, vs2=
_pix_e, vs2_line_s, vs2_line_e;
e66e03abf80f701 Russell King          2015-06-06  1440  	u16 vwin1_line_s, =
vwin1_line_e;
e66e03abf80f701 Russell King          2015-06-06  1441  	u16 vwin2_line_s, =
vwin2_line_e;
e66e03abf80f701 Russell King          2015-06-06  1442  	u16 de_pix_s, de_p=
ix_e;
2807ba75970367c Russell King          2018-07-08  1443  	u8 reg, div, rep, =
sel_clk;
e7792ce2da5ded8 Rob Clark             2013-01-08  1444  =

fcc22c5f9ddaa8d Russell King          2018-07-31  1445  	/*
fcc22c5f9ddaa8d Russell King          2018-07-31  1446  	 * Since we are "c=
omputer" like, our source invariably produces
fcc22c5f9ddaa8d Russell King          2018-07-31  1447  	 * full-range RGB.=
  If the monitor supports full-range, then use
fcc22c5f9ddaa8d Russell King          2018-07-31  1448  	 * it, otherwise r=
educe to limited-range.
fcc22c5f9ddaa8d Russell King          2018-07-31  1449  	 */
fcc22c5f9ddaa8d Russell King          2018-07-31  1450  	priv->rgb_quant_ra=
nge =3D
fcc22c5f9ddaa8d Russell King          2018-07-31  1451  		priv->connector.d=
isplay_info.rgb_quant_range_selectable ?
fcc22c5f9ddaa8d Russell King          2018-07-31  1452  		HDMI_QUANTIZATION=
_RANGE_FULL :
fcc22c5f9ddaa8d Russell King          2018-07-31  1453  		drm_default_rgb_q=
uant_range(adjusted_mode);
e7792ce2da5ded8 Rob Clark             2013-01-08  1454  =

088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1455  	/*
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1456  	 * Internally TDA9=
98x is using ITU-R BT.656 style sync but
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1457  	 * we get VESA sty=
le sync. TDA998x is using a reference pixel
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1458  	 * relative to ITU=
 to sync to the input frame and for output
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1459  	 * sync generation=
. Currently, we are using reference detection
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1460  	 * from HS/VS, i.e=
. REFPIX/REFLINE denote frame start sync point
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1461  	 * which is positi=
on of rising VS with coincident rising HS.
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1462  	 *
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1463  	 * Now there is so=
me issues to take care of:
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1464  	 * - HDMI data isl=
ands require sync-before-active
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1465  	 * - TDA998x regis=
ter values must be > 0 to be enabled
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1466  	 * - REFLINE needs=
 an additional offset of +1
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1467  	 * - REFPIX needs =
an addtional offset of +1 for UYUV and +3 for RGB
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1468  	 *
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1469  	 * So we add +1 to=
 all horizontal and vertical register values,
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1470  	 * plus an additio=
nal +3 for REFPIX as we are using RGB input only.
e7792ce2da5ded8 Rob Clark             2013-01-08  1471  	 */
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1472  	n_pix        =3D m=
ode->htotal;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1473  	n_line       =3D m=
ode->vtotal;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1474  =

088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1475  	hs_pix_e     =3D m=
ode->hsync_end - mode->hdisplay;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1476  	hs_pix_s     =3D m=
ode->hsync_start - mode->hdisplay;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1477  	de_pix_e     =3D m=
ode->htotal;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1478  	de_pix_s     =3D m=
ode->htotal - mode->hdisplay;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1479  	ref_pix      =3D 3=
 + hs_pix_s;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1480  =

179f1aa407b466c Sebastian Hesselbarth 2013-08-14  1481  	/*
179f1aa407b466c Sebastian Hesselbarth 2013-08-14  1482  	 * Attached LCD co=
ntrollers may generate broken sync. Allow
179f1aa407b466c Sebastian Hesselbarth 2013-08-14  1483  	 * those to adjust=
 the position of the rising VS edge by adding
179f1aa407b466c Sebastian Hesselbarth 2013-08-14  1484  	 * HSKEW to ref_pi=
x.
179f1aa407b466c Sebastian Hesselbarth 2013-08-14  1485  	 */
179f1aa407b466c Sebastian Hesselbarth 2013-08-14  1486  	if (adjusted_mode-=
>flags & DRM_MODE_FLAG_HSKEW)
179f1aa407b466c Sebastian Hesselbarth 2013-08-14  1487  		ref_pix +=3D adju=
sted_mode->hskew;
179f1aa407b466c Sebastian Hesselbarth 2013-08-14  1488  =

088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1489  	if ((mode->flags &=
 DRM_MODE_FLAG_INTERLACE) =3D=3D 0) {
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1490  		ref_line     =3D =
1 + mode->vsync_start - mode->vdisplay;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1491  		vwin1_line_s =3D =
mode->vtotal - mode->vdisplay - 1;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1492  		vwin1_line_e =3D =
vwin1_line_s + mode->vdisplay;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1493  		vs1_pix_s    =3D =
vs1_pix_e =3D hs_pix_s;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1494  		vs1_line_s   =3D =
mode->vsync_start - mode->vdisplay;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1495  		vs1_line_e   =3D =
vs1_line_s +
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1496  			       mode->vsy=
nc_end - mode->vsync_start;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1497  		vwin2_line_s =3D =
vwin2_line_e =3D 0;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1498  		vs2_pix_s    =3D =
vs2_pix_e  =3D 0;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1499  		vs2_line_s   =3D =
vs2_line_e =3D 0;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1500  	} else {
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1501  		ref_line     =3D =
1 + (mode->vsync_start - mode->vdisplay)/2;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1502  		vwin1_line_s =3D =
(mode->vtotal - mode->vdisplay)/2;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1503  		vwin1_line_e =3D =
vwin1_line_s + mode->vdisplay/2;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1504  		vs1_pix_s    =3D =
vs1_pix_e =3D hs_pix_s;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1505  		vs1_line_s   =3D =
(mode->vsync_start - mode->vdisplay)/2;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1506  		vs1_line_e   =3D =
vs1_line_s +
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1507  			       (mode->vs=
ync_end - mode->vsync_start)/2;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1508  		vwin2_line_s =3D =
vwin1_line_s + mode->vtotal/2;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1509  		vwin2_line_e =3D =
vwin2_line_s + mode->vdisplay/2;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1510  		vs2_pix_s    =3D =
vs2_pix_e =3D hs_pix_s + mode->htotal/2;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1511  		vs2_line_s   =3D =
vs1_line_s + mode->vtotal/2 ;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1512  		vs2_line_e   =3D =
vs2_line_s +
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1513  			       (mode->vs=
ync_end - mode->vsync_start)/2;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1514  	}
e7792ce2da5ded8 Rob Clark             2013-01-08  1515  =

2807ba75970367c Russell King          2018-07-08  1516  	/*
2807ba75970367c Russell King          2018-07-08  1517  	 * Select pixel re=
peat depending on the double-clock flag
2807ba75970367c Russell King          2018-07-08  1518  	 * (which means we=
 have to repeat each pixel once.)
2807ba75970367c Russell King          2018-07-08  1519  	 */
2807ba75970367c Russell King          2018-07-08  1520  	rep =3D mode->flag=
s & DRM_MODE_FLAG_DBLCLK ? 1 : 0;
2807ba75970367c Russell King          2018-07-08  1521  	sel_clk =3D SEL_CL=
K_ENA_SC_CLK | SEL_CLK_SEL_CLK1 |
2807ba75970367c Russell King          2018-07-08  1522  		  SEL_CLK_SEL_VRF=
_CLK(rep ? 2 : 0);
2807ba75970367c Russell King          2018-07-08  1523  =

2807ba75970367c Russell King          2018-07-08  1524  	/* the TMDS clock =
is scaled up by the pixel repeat */
2807ba75970367c Russell King          2018-07-08  1525  	tmds_clock =3D mod=
e->clock * (1 + rep);
926a299c42e38bb Russell King          2018-08-02  1526  =

926a299c42e38bb Russell King          2018-08-02  1527  	/*
926a299c42e38bb Russell King          2018-08-02  1528  	 * The divisor is =
power-of-2. The TDA9983B datasheet gives
926a299c42e38bb Russell King          2018-08-02  1529  	 * this as ranges =
of Msample/s, which is 10x the TMDS clock:
926a299c42e38bb Russell King          2018-08-02  1530  	 *   0 - 800 to 15=
00 Msample/s
926a299c42e38bb Russell King          2018-08-02  1531  	 *   1 - 400 to 80=
0 Msample/s
926a299c42e38bb Russell King          2018-08-02  1532  	 *   2 - 200 to 40=
0 Msample/s
926a299c42e38bb Russell King          2018-08-02  1533  	 *   3 - as 2 above
926a299c42e38bb Russell King          2018-08-02  1534  	 */
926a299c42e38bb Russell King          2018-08-02  1535  	for (div =3D 0; di=
v < 3; div++)
926a299c42e38bb Russell King          2018-08-02  1536  		if (80000 >> div =
<=3D tmds_clock)
926a299c42e38bb Russell King          2018-08-02  1537  			break;
e7792ce2da5ded8 Rob Clark             2013-01-08  1538  =

2cae8e028ecb440 Russell King          2016-11-02  1539  	mutex_lock(&priv->=
audio_mutex);
2cae8e028ecb440 Russell King          2016-11-02  1540  =

2807ba75970367c Russell King          2018-07-08  1541  	priv->tmds_clock =
=3D tmds_clock;
2807ba75970367c Russell King          2018-07-08  1542  =

e7792ce2da5ded8 Rob Clark             2013-01-08  1543  	/* mute the audio =
FIFO: */
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1544  	reg_set(priv, REG_=
AIP_CNTRL_0, AIP_CNTRL_0_RST_FIFO);
e7792ce2da5ded8 Rob Clark             2013-01-08  1545  =

e7792ce2da5ded8 Rob Clark             2013-01-08  1546  	/* set HDMI HDCP m=
ode off: */
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1547  	reg_write(priv, RE=
G_TBG_CNTRL_1, TBG_CNTRL_1_DWIN_DIS);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1548  	reg_clear(priv, RE=
G_TX33, TX33_HDMI);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1549  	reg_write(priv, RE=
G_ENC_CNTRL, ENC_CNTRL_CTL_CODE(0));
e7792ce2da5ded8 Rob Clark             2013-01-08  1550  =

e7792ce2da5ded8 Rob Clark             2013-01-08  1551  	/* no pre-filter o=
r interpolator: */
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1552  	reg_write(priv, RE=
G_HVF_CNTRL_0, HVF_CNTRL_0_PREFIL(0) |
e7792ce2da5ded8 Rob Clark             2013-01-08  1553  			HVF_CNTRL_0_INTP=
OL(0));
9476ed2e3883b11 Russell King          2016-11-03  1554  	reg_set(priv, REG_=
FEAT_POWERDOWN, FEAT_POWERDOWN_PREFILT);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1555  	reg_write(priv, RE=
G_VIP_CNTRL_5, VIP_CNTRL_5_SP_CNT(0));
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1556  	reg_write(priv, RE=
G_VIP_CNTRL_4, VIP_CNTRL_4_BLANKIT(0) |
e7792ce2da5ded8 Rob Clark             2013-01-08  1557  			VIP_CNTRL_4_BLC(=
0));
e7792ce2da5ded8 Rob Clark             2013-01-08  1558  =

2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1559  	reg_clear(priv, RE=
G_PLL_SERIAL_1, PLL_SERIAL_1_SRL_MAN_IZ);
a8b517e5312124e Jean-Francois Moine   2014-01-25  1560  	reg_clear(priv, RE=
G_PLL_SERIAL_3, PLL_SERIAL_3_SRL_CCIR |
a8b517e5312124e Jean-Francois Moine   2014-01-25  1561  					  PLL_SERIAL_3=
_SRL_DE);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1562  	reg_write(priv, RE=
G_SERIALIZER, 0);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1563  	reg_write(priv, RE=
G_HVF_CNTRL_1, HVF_CNTRL_1_VQR(0));
e7792ce2da5ded8 Rob Clark             2013-01-08  1564  =

2807ba75970367c Russell King          2018-07-08  1565  	reg_write(priv, RE=
G_RPT_CNTRL, RPT_CNTRL_REPEAT(rep));
2807ba75970367c Russell King          2018-07-08  1566  	reg_write(priv, RE=
G_SEL_CLK, sel_clk);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1567  	reg_write(priv, RE=
G_PLL_SERIAL_2, PLL_SERIAL_2_SRL_NOSC(div) |
e7792ce2da5ded8 Rob Clark             2013-01-08  1568  			PLL_SERIAL_2_SRL=
_PR(rep));
e7792ce2da5ded8 Rob Clark             2013-01-08  1569  =

fcc22c5f9ddaa8d Russell King          2018-07-31  1570  	/* set color matri=
x according to output rgb quant range */
fcc22c5f9ddaa8d Russell King          2018-07-31  1571  	if (priv->rgb_quan=
t_range =3D=3D HDMI_QUANTIZATION_RANGE_LIMITED) {
fcc22c5f9ddaa8d Russell King          2018-07-31  1572  		static u8 tda998x=
_full_to_limited_range[] =3D {
fcc22c5f9ddaa8d Russell King          2018-07-31  1573  			MAT_CONTRL_MAT_S=
C(2),
fcc22c5f9ddaa8d Russell King          2018-07-31  1574  			0x00, 0x00, 0x00=
, 0x00, 0x00, 0x00,
fcc22c5f9ddaa8d Russell King          2018-07-31  1575  			0x03, 0x6f, 0x00=
, 0x00, 0x00, 0x00,
fcc22c5f9ddaa8d Russell King          2018-07-31  1576  			0x00, 0x00, 0x03=
, 0x6f, 0x00, 0x00,
fcc22c5f9ddaa8d Russell King          2018-07-31  1577  			0x00, 0x00, 0x00=
, 0x00, 0x03, 0x6f,
fcc22c5f9ddaa8d Russell King          2018-07-31  1578  			0x00, 0x40, 0x00=
, 0x40, 0x00, 0x40
fcc22c5f9ddaa8d Russell King          2018-07-31  1579  		};
fcc22c5f9ddaa8d Russell King          2018-07-31  1580  		reg_clear(priv, R=
EG_FEAT_POWERDOWN, FEAT_POWERDOWN_CSC);
fcc22c5f9ddaa8d Russell King          2018-07-31  1581  		reg_write_range(p=
riv, REG_MAT_CONTRL,
fcc22c5f9ddaa8d Russell King          2018-07-31  1582  				tda998x_full_to=
_limited_range,
fcc22c5f9ddaa8d Russell King          2018-07-31  1583  				sizeof(tda998x_=
full_to_limited_range));
fcc22c5f9ddaa8d Russell King          2018-07-31  1584  	} else {
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1585  		reg_write(priv, R=
EG_MAT_CONTRL, MAT_CONTRL_MAT_BP |
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1586  					MAT_CONTRL_MAT=
_SC(1));
9476ed2e3883b11 Russell King          2016-11-03  1587  		reg_set(priv, REG=
_FEAT_POWERDOWN, FEAT_POWERDOWN_CSC);
fcc22c5f9ddaa8d Russell King          2018-07-31  1588  	}
e7792ce2da5ded8 Rob Clark             2013-01-08  1589  =

e7792ce2da5ded8 Rob Clark             2013-01-08  1590  	/* set BIAS tmds v=
alue: */
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1591  	reg_write(priv, RE=
G_ANA_GENERAL, 0x09);
e7792ce2da5ded8 Rob Clark             2013-01-08  1592  =

088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1593  	/*
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1594  	 * Sync on rising =
HSYNC/VSYNC
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1595  	 */
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1596  	reg =3D VIP_CNTRL_=
3_SYNC_HS;
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1597  =

088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1598  	/*
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1599  	 * TDA19988 requir=
es high-active sync at input stage,
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1600  	 * so invert low-a=
ctive sync provided by master encoder here
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1601  	 */
088d61d1fdfde56 Sebastian Hesselbarth 2013-08-14  1602  	if (mode->flags & =
DRM_MODE_FLAG_NHSYNC)
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1603  		reg |=3D VIP_CNTR=
L_3_H_TGL;
e7792ce2da5ded8 Rob Clark             2013-01-08  1604  	if (mode->flags & =
DRM_MODE_FLAG_NVSYNC)
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25 @1605  		reg |=3D VIP_CNTR=
L_3_V_TGL;
5d3f821210ca45e sw.multimedia         2021-08-31  1606  	//reg_write(priv, =
REG_VIP_CNTRL_3, reg);
5d3f821210ca45e sw.multimedia         2021-08-31  1607  	reg_write(priv, RE=
G_VIP_CNTRL_3, 0x26);
5d3f821210ca45e sw.multimedia         2021-08-31  1608  	reg_write(priv, RE=
G_VIDFORMAT, 0x06);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1609  =

2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1610  	reg_write(priv, RE=
G_VIDFORMAT, 0x00);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1611  	reg_write16(priv, =
REG_REFPIX_MSB, ref_pix);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1612  	reg_write16(priv, =
REG_REFLINE_MSB, ref_line);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1613  	reg_write16(priv, =
REG_NPIX_MSB, n_pix);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1614  	reg_write16(priv, =
REG_NLINE_MSB, n_line);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1615  	reg_write16(priv, =
REG_VS_LINE_STRT_1_MSB, vs1_line_s);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1616  	reg_write16(priv, =
REG_VS_PIX_STRT_1_MSB, vs1_pix_s);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1617  	reg_write16(priv, =
REG_VS_LINE_END_1_MSB, vs1_line_e);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1618  	reg_write16(priv, =
REG_VS_PIX_END_1_MSB, vs1_pix_e);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1619  	reg_write16(priv, =
REG_VS_LINE_STRT_2_MSB, vs2_line_s);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1620  	reg_write16(priv, =
REG_VS_PIX_STRT_2_MSB, vs2_pix_s);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1621  	reg_write16(priv, =
REG_VS_LINE_END_2_MSB, vs2_line_e);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1622  	reg_write16(priv, =
REG_VS_PIX_END_2_MSB, vs2_pix_e);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1623  	reg_write16(priv, =
REG_HS_PIX_START_MSB, hs_pix_s);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1624  	reg_write16(priv, =
REG_HS_PIX_STOP_MSB, hs_pix_e);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1625  	reg_write16(priv, =
REG_VWIN_START_1_MSB, vwin1_line_s);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1626  	reg_write16(priv, =
REG_VWIN_END_1_MSB, vwin1_line_e);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1627  	reg_write16(priv, =
REG_VWIN_START_2_MSB, vwin2_line_s);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1628  	reg_write16(priv, =
REG_VWIN_END_2_MSB, vwin2_line_e);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1629  	reg_write16(priv, =
REG_DE_START_MSB, de_pix_s);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1630  	reg_write16(priv, =
REG_DE_STOP_MSB, de_pix_e);
e7792ce2da5ded8 Rob Clark             2013-01-08  1631  =

e7792ce2da5ded8 Rob Clark             2013-01-08  1632  	if (priv->rev =3D=
=3D TDA19988) {
e7792ce2da5ded8 Rob Clark             2013-01-08  1633  		/* let incoming p=
ixels fill the active space (if any) */
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1634  		reg_write(priv, R=
EG_ENABLE_SPACE, 0x00);
e7792ce2da5ded8 Rob Clark             2013-01-08  1635  	}
e7792ce2da5ded8 Rob Clark             2013-01-08  1636  =

81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1637  	/*
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1638  	 * Always generate=
 sync polarity relative to input sync and
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1639  	 * revert input st=
age toggled sync at output stage
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1640  	 */
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1641  	reg =3D TBG_CNTRL_=
1_DWIN_DIS | TBG_CNTRL_1_TGL_EN;
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1642  	if (mode->flags & =
DRM_MODE_FLAG_NHSYNC)
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1643  		reg |=3D TBG_CNTR=
L_1_H_TGL;
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1644  	if (mode->flags & =
DRM_MODE_FLAG_NVSYNC)
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1645  		reg |=3D TBG_CNTR=
L_1_V_TGL;
5d3f821210ca45e sw.multimedia         2021-08-31  1646  	//reg_write(priv, =
REG_TBG_CNTRL_1, reg);
5d3f821210ca45e sw.multimedia         2021-08-31  1647  	reg_write(priv, RE=
G_TBG_CNTRL_1, 0x46);
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1648  =

e7792ce2da5ded8 Rob Clark             2013-01-08  1649  	/* must be last re=
gister set: */
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1650  	reg_write(priv, RE=
G_TBG_CNTRL_0, 0);
c4c11dd160a8cc9 Russell King          2013-08-14  1651  =

896a4130b8e60cb Russell King          2016-10-23  1652  	/* CEA-861B sectio=
n 6 says that:
896a4130b8e60cb Russell King          2016-10-23  1653  	 * CEA version 1 (=
CEA-861) has no support for infoframes.
896a4130b8e60cb Russell King          2016-10-23  1654  	 * CEA version 2 (=
CEA-861A) supports version 1 AVI infoframes,
896a4130b8e60cb Russell King          2016-10-23  1655  	 * and optional ba=
sic audio.
896a4130b8e60cb Russell King          2016-10-23  1656  	 * CEA version 3 (=
CEA-861B) supports version 1 and 2 AVI infoframes,
896a4130b8e60cb Russell King          2016-10-23  1657  	 * and optional di=
gital audio, with audio infoframes.
896a4130b8e60cb Russell King          2016-10-23  1658  	 *
896a4130b8e60cb Russell King          2016-10-23  1659  	 * Since we only s=
upport generation of version 2 AVI infoframes,
896a4130b8e60cb Russell King          2016-10-23  1660  	 * ignore CEA vers=
ion 2 and below (iow, behave as if we're a
896a4130b8e60cb Russell King          2016-10-23  1661  	 * CEA-861 source.)
896a4130b8e60cb Russell King          2016-10-23  1662  	 */
896a4130b8e60cb Russell King          2016-10-23  1663  	priv->supports_inf=
oframes =3D priv->connector.display_info.cea_rev >=3D 3;
896a4130b8e60cb Russell King          2016-10-23  1664  =

896a4130b8e60cb Russell King          2016-10-23  1665  	if (priv->supports=
_infoframes) {
c4c11dd160a8cc9 Russell King          2013-08-14  1666  		/* We need to tur=
n HDMI HDCP stuff on to get audio through */
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1667  		reg &=3D ~TBG_CNT=
RL_1_DWIN_DIS;
81b53a166f5cdf4 Jean-Francois Moine   2014-01-25  1668  		reg_write(priv, R=
EG_TBG_CNTRL_1, reg);
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1669  		reg_write(priv, R=
EG_ENC_CNTRL, ENC_CNTRL_CTL_CODE(1));
2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1670  		reg_set(priv, REG=
_TX33, TX33_HDMI);
c4c11dd160a8cc9 Russell King          2013-08-14  1671  =

2f7f730a4f0fd33 Jean-Francois Moine   2014-01-25  1672  		tda998x_write_avi=
(priv, adjusted_mode);
45a19dd397886a9 Russell King          2018-12-05  1673  		tda998x_write_vsi=
(priv, adjusted_mode);
c4c11dd160a8cc9 Russell King          2013-08-14  1674  =

82642ab7345d7e7 Russell King          2019-03-01  1675  		if (priv->sink_ha=
s_audio)
900b2b7250b8fe4 Russell King          2019-03-01  1676  			tda998x_configur=
e_audio(priv);
95db3b255fde4e8 Jyri Sarha            2016-08-09  1677  	}
319e658c78befa5 Russell King          2016-10-23  1678  =

319e658c78befa5 Russell King          2016-10-23  1679  	mutex_unlock(&priv=
->audio_mutex);
c4c11dd160a8cc9 Russell King          2013-08-14  1680  }
e7792ce2da5ded8 Rob Clark             2013-01-08  1681  =


:::::: The code at line 1605 was first introduced by commit
:::::: 81b53a166f5cdf4e5bec47fc8884c994de82dc6b drm/i2c: tda998x: don't rea=
d write-only registers

:::::: TO: Jean-Francois Moine <moinejf@free.fr>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0340989230796948687==--

