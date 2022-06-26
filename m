Content-Type: multipart/mixed; boundary="===============8283073925703454844=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1579/5720] drivers/phy/qualcomm/phy-qcom-qmp-usb.c:2127:19: warning: Value stored to 'qmp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 27 Jun 2022 01:31:01 +0800
Message-ID: <202206270120.Sc2SMKX0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8283073925703454844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/p=
hy/qualcomm/phy-qcom-qmp-usb.c:2127:19: warning: Value stored to 'qmp' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2f9cb3d3bd73fc2225d66aa8fcffb632ed3eb235
commit: faf83af5d59498509eb84015453073fd5e85231e [1579/5720] phy: qcom-qmp-=
usb: cleanup the driver
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220617
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dfaf83af5d59498509eb84015453073fd5e85231e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout faf83af5d59498509eb84015453073fd5e85231e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   drivers/video/fbdev/cirrusfb.c:1750:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&modded, region, sizeof(struct fb_fillrect));
           ^~~~~~
   drivers/video/fbdev/cirrusfb.c:1786:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&modded, area, sizeof(struct fb_copyarea));
           ^~~~~~
   drivers/video/fbdev/cirrusfb.c:1786:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&modded, area, sizeof(struct fb_copyarea));
           ^~~~~~
   drivers/video/fbdev/cirrusfb.c:1852:3: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(info->screen_base, image->data, size);
                   ^~~~~~
   drivers/video/fbdev/cirrusfb.c:1852:3: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(info->screen_base, image->data, size);
                   ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/thermal/sprd_thermal.c:142:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(val, buf, len);
           ^~~~~~
   drivers/thermal/sprd_thermal.c:142:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(val, buf, len);
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/media/i2c/s5k6aa.c:1099:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fmt->reserved, 0, sizeof(fmt->reserved));
           ^~~~~~
   drivers/media/i2c/s5k6aa.c:1099:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(fmt->reserved, 0, sizeof(fmt->reserved));
           ^~~~~~
   drivers/media/i2c/s5k6aa.c:1178:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sel->reserved, 0, sizeof(sel->reserved));
           ^~~~~~
   drivers/media/i2c/s5k6aa.c:1178:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(sel->reserved, 0, sizeof(sel->reserved));
           ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/i2c/saa6588.c:157:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &s->buffer[s->rd_index], 3);
           ^~~~~~
   drivers/media/i2c/saa6588.c:157:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &s->buffer[s->rd_index], 3);
           ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/i2c/saa7110.c:93:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(decoder->reg + reg, data + 1, len - 1);
                   ^~~~~~
   drivers/media/i2c/saa7110.c:93:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(decoder->reg + reg, data + 1, len - 1);
                   ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/media/tuners/tea5767.c:289:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buffer, 0, 5);
           ^~~~~~
   drivers/media/tuners/tea5767.c:289:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(buffer, 0, 5);
           ^~~~~~
   drivers/media/tuners/tea5767.c:419:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&priv->ctrl, priv_cfg, sizeof(priv->ctrl));
           ^~~~~~
   drivers/media/tuners/tea5767.c:419:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&priv->ctrl, priv_cfg, sizeof(priv->ctrl));
           ^~~~~~
   drivers/media/tuners/tea5767.c:460:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &tea5767_tuner_ops,
           ^~~~~~
   drivers/media/tuners/tea5767.c:460:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &tea5767_tuner_ops,
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> drivers/phy/qualcomm/phy-qcom-qmp-usb.c:2127:19: warning: Value stored t=
o 'qmp' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:2127:19: note: Value stored to '=
qmp' during its initialization is never read
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:2576:2: warning: Call to functio=
n 'snprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'snprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:2576:2: note: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:582:2: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&inno->dphy_cfg, &opts->mipi_dphy, sizeof(inno->dphy_cfg)=
);
           ^~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:582:2: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&inno->dphy_cfg, &opts->mipi_dphy, sizeof(inno->dphy_cfg)=
);
           ^~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (54 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/md/bcache/util.c:111:16: warning: The result of the left shift i=
s undefined because the left operand is negative [clang-analyzer-core.Undef=
inedBinaryOperatorResult]
                   t =3D q & ~(~0 << 10);
                             ~~ ^
   drivers/md/bcache/util.c:99:6: note: Assuming 'v' is >=3D 0
           if (v < 0)
               ^~~~~
   drivers/md/bcache/util.c:99:2: note: Taking false branch
           if (v < 0)
           ^
   drivers/md/bcache/util.c:111:16: note: The result of the left shift is u=
ndefined because the left operand is negative
                   t =3D q & ~(~0 << 10);
                             ~~ ^
   drivers/md/bcache/util.c:119:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "-%llu.%i%c", q, t * 10 / 1024, unit=
s[u]);
                          ^~~~~~~
   drivers/md/bcache/util.c:119:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "-%llu.%i%c", q, t * 10 / 1024, unit=
s[u]);
                          ^~~~~~~
   drivers/md/bcache/util.c:121:10: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%llu.%i%c", q, t * 10 / 1024, units=
[u]);
                          ^~~~~~~
   drivers/md/bcache/util.c:121:10: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%llu.%i%c", q, t * 10 / 1024, units=
[u]);
                          ^~~~~~~
   drivers/md/bcache/util.c:138:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(uuid, 0, 16);
           ^~~~~~
   drivers/md/bcache/util.c:138:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(uuid, 0, 16);
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/md/dm-log.c:393:6: warning: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(argv[0], "%u%c", &region_size, &dummy) !=3D 1 ||
               ^~~~~~
   drivers/md/dm-log.c:393:6: note: Call to function 'sscanf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sscanf_s' in case of C11
           if (sscanf(argv[0], "%u%c", &region_size, &dummy) !=3D 1 ||
               ^~~~~~
   drivers/md/dm-log.c:482:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(lc->clean_bits, -1, bitset_size);
           ^~~~~~
   drivers/md/dm-log.c:482:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(lc->clean_bits, -1, bitset_size);
           ^~~~~~
   drivers/md/dm-log.c:495:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(lc->sync_bits, (sync =3D=3D NOSYNC) ? -1 : 0, bitset_size=
);
           ^~~~~~
   drivers/md/dm-log.c:495:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(lc->sync_bits, (sync =3D=3D NOSYNC) ? -1 : 0, bitset_size=
);
           ^~~~~~
   drivers/md/dm-log.c:623:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(lc->sync_bits, lc->clean_bits, size);
           ^~~~~~
   drivers/md/dm-log.c:623:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(lc->sync_bits, lc->clean_bits, size);
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/qmp +2127 drivers/phy/qualcomm/phy-qcom-qmp-usb.c

94a407cc17a445 Dmitry Baryshkov 2022-06-08  2123  =

09b492a3794023 Dmitry Baryshkov 2022-06-08  2124  static int qcom_qmp_phy_u=
sb_init(struct phy *phy)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2125  {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2126  	struct qmp_phy *qphy =3D=
 phy_get_drvdata(phy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08 @2127  	struct qcom_qmp *qmp =3D=
 qphy->qmp;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2128  	int ret;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2129  	dev_vdbg(qmp->dev, "Init=
ializing QMP phy\n");
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2130  =

09b492a3794023 Dmitry Baryshkov 2022-06-08  2131  	ret =3D qcom_qmp_phy_usb=
_com_init(qphy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2132  	if (ret)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2133  		return ret;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2134  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  2135  	return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2136  }
94a407cc17a445 Dmitry Baryshkov 2022-06-08  2137  =


:::::: The code at line 2127 was first introduced by commit
:::::: 94a407cc17a445ddb3f7315cee0b0916d35d177c phy: qcom-qmp: create copie=
s of QMP PHY driver

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8283073925703454844==--

