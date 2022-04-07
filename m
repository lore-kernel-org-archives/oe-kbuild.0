Content-Type: multipart/mixed; boundary="===============0866734279420888235=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/xilinx/ll_temac_main.c:1257:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support leng...
Date: Thu, 07 Apr 2022 20:19:15 +0800
Message-ID: <202204072012.B5Q31TQt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0866734279420888235==
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
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   4 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220405 (https://download.01.org/0day-ci/archi=
ve/20220407/202204072012.B5Q31TQt-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->zone[nr].limit) +
                  ^~~~~~~
   drivers/hwmon/lm85.c:1252:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->zone[nr].critica=
l));
                  ^~~~~~~
   drivers/hwmon/lm85.c:1252:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->zone[nr].critica=
l));
                  ^~~~~~~
   drivers/hwmon/lm85.c:1469:6: warning: Value stored to 'address' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           int address =3D client->addr;
               ^~~~~~~   ~~~~~~~~~~~~
   drivers/hwmon/lm85.c:1469:6: note: Value stored to 'address' during its =
initialization is never read
           int address =3D client->addr;
               ^~~~~~~   ~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/hwmon/adm1029.c:164:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/adm1029.c:164:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/adm1029.c:177:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adm1029.c:177:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adm1029.c:182:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/adm1029.c:182:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/adm1029.c:192:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adm1029.c:192:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0\n");
                          ^~~~~~~
   drivers/hwmon/adm1029.c:193:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->ind=
ex]));
                  ^~~~~~~
   drivers/hwmon/adm1029.c:193:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[attr->ind=
ex]));
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: warning: The resu=
lt of the left shift is undefined because the left operand is negative [cla=
ng-analyzer-core.UndefinedBinaryOperatorResult]
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:6: note: Assuming fi=
eld 'crtc' is non-null
           if (!new_s->crtc || !new_s->fb)
               ^~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:22: note: Assuming f=
ield 'fb' is non-null
           if (!new_s->crtc || !new_s->fb)
                               ^~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:2: note: Taking fals=
e branch
           if (!new_s->crtc || !new_s->fb)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:746:6: note: Assuming fi=
eld 'visible' is true
           if (!hstate->base.visible) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:746:2: note: Taking fals=
e branch
           if (!hstate->base.visible) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:756:2: note: Calling 'at=
mel_hlcdc_plane_update_disc_area'
           atmel_hlcdc_plane_update_disc_area(plane, hstate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Assuming fi=
eld 'disc_pos' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:27: note: Assuming f=
ield 'disc_size' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
                                    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:2: note: Taking fals=
e branch
           if (!layout->disc_pos || !layout->disc_size)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: note: The result =
of the left shift is undefined because the left operand is negative
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                 ~~~~~~~~~ ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:819:39: warning: Value s=
tored to 'desc' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:819:39: note: Value stor=
ed to 'desc' during its initialization is never read
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
>> drivers/net/ethernet/xilinx/ll_temac_main.c:1257:10: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide bounding of the memory =
buffer or security checks introduced in the C11 standard. Replace with anal=
ogous functions that support length arguments or provides boundary checks s=
uch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depr=
ecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf + len, "%.8x%s", lp->dma_in(lp, i),
                          ^~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1257:10: note: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf + len, "%.8x%s", lp->dma_in(lp, i),
                          ^~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1259:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1259:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1595:3: warning: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(lp->phy_name, sizeof(lp->phy_name),
                   ^~~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1595:3: note: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(lp->phy_name, sizeof(lp->phy_name),
                   ^~~~~~~~
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/char/hw_random/ixp4xx-rng.c:44:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   drivers/char/hw_random/ixp4xx-rng.c:44:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (41 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/hwmon/da9055-hwmon.c:166:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", volt_reg_to_mv(adc, channel));
                  ^~~~~~~
   drivers/hwmon/da9055-hwmon.c:166:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", volt_reg_to_mv(adc, channel));
                  ^~~~~~~
   drivers/hwmon/da9055-hwmon.c:194:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(-4084 * (tjunc - t=
offset)
                  ^~~~~~~
   drivers/hwmon/da9055-hwmon.c:194:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", DIV_ROUND_CLOSEST(-4084 * (tjunc - t=
offset)
                  ^~~~~~~
>> drivers/hwmon/da9055-hwmon.c:201:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/hwmon/da9055-hwmon.c:201:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/hwmon/dme1737.c:827:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:827:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:911:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:911:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1003:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1003:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1117:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1117:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1253:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1253:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", res);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1468:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1468:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->vrm);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1494:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1494:9: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1502:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   drivers/hwmon/dme1737.c:1502:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s\n", data->name);
                  ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/hwmon/lm87.c:272:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in[nr],
                  ^~~~~~~
   drivers/hwmon/lm87.c:272:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in[nr],
                  ^~~~~~~
   drivers/hwmon/lm87.c:282:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[nr],
                  ^~~~~~~
   drivers/hwmon/lm87.c:282:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_min[nr],
                  ^~~~~~~
   drivers/hwmon/lm87.c:292:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[nr],
                  ^~~~~~~
   drivers/hwmon/lm87.c:292:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", IN_FROM_REG(data->in_max[nr],
                  ^~~~~~~
   drivers/hwmon/lm87.c:369:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr]));
                  ^~~~~~~
   drivers/hwmon/lm87.c:369:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr]));
                  ^~~~~~~
   drivers/hwmon/lm87.c:378:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/lm87.c:378:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/lm87.c:388:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/lm87.c:388:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n",
                  ^~~~~~~
   drivers/hwmon/lm87.c:448:9: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit_int));
                  ^~~~~~~
   drivers/hwmon/lm87.c:448:9: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit_int));

vim +1257 drivers/net/ethernet/xilinx/ll_temac_main.c

92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1245  =

92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1246  =
/* ---------------------------------------------------------------------
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1247  =
 * SYSFS device attributes
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1248  =
 */
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1249  =
static ssize_t temac_show_llink_regs(struct device *dev,
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1250  =
				     struct device_attribute *attr, char *buf)
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1251  {
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1252  =
	struct net_device *ndev =3D dev_get_drvdata(dev);
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1253  =
	struct temac_local *lp =3D netdev_priv(ndev);
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1254  =
	int i, len =3D 0;
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1255  =

92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1256  =
	for (i =3D 0; i < 0x11; i++)
e44171f115de3de drivers/net/ll_temac_main.c John Linn    2010-04-08 @1257  =
		len +=3D sprintf(buf + len, "%.8x%s", lp->dma_in(lp, i),
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1258  =
			       (i % 8) =3D=3D 7 ? "\n" : " ");
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1259  =
	len +=3D sprintf(buf + len, "\n");
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1260  =

92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1261  =
	return len;
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1262  }
92744989533cbe8 drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1263  =


:::::: The code at line 1257 was first introduced by commit
:::::: e44171f115de3dedf34064646206deb91549865f Add non-Virtex5 support for=
 LL TEMAC driver

:::::: TO: John Linn <john.linn@xilinx.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0866734279420888235==--

