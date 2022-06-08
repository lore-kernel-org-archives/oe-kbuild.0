Content-Type: multipart/mixed; boundary="===============9115443644688459871=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/omap/omapfb_main.c:1811:16: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 09 Jun 2022 04:06:57 +0800
Message-ID: <202206090354.icGVmug7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9115443644688459871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/v=
ideo/fbdev/omap/omapfb_main.c:1811:16: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34f4335c16a5f4bb7da6c8d2d5e780b6a163846a
commit: 804f7f19c2e2928aeb8eafef8379fe8b8d13f98b fbdev: omap: avoid using m=
ach/*.h files
date:   7 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220608 (https://download.01.org/0day-ci/archi=
ve/20220609/202206090354.icGVmug7-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436=
efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D804f7f19c2e2928aeb8eafef8379fe8b8d13f98b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 804f7f19c2e2928aeb8eafef8379fe8b8d13f98b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   42 warnings generated.
   drivers/regulator/qcom-labibb-regulator.c:864:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&vreg->desc, reg_data->desc, sizeof(vreg->desc));
                   ^~~~~~
   drivers/regulator/qcom-labibb-regulator.c:864:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&vreg->desc, reg_data->desc, sizeof(vreg->desc));
                   ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/regulator/pwm-regulator.c:335:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&drvdata->desc, &pwm_regulator_desc, sizeof(drvdata->desc=
));
           ^~~~~~
   drivers/regulator/pwm-regulator.c:335:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&drvdata->desc, &pwm_regulator_desc, sizeof(drvdata->desc=
));
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/regulator/rk808-regulator.c:274:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_write(rdev->regmap, rdev->desc->vsel_reg,=
 val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/regulator/rk808-regulator.c:274:3: note: Value stored to 'ret' i=
s never read
                   ret =3D regmap_write(rdev->regmap, rdev->desc->vsel_reg,=
 val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
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
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   kernel/cgroup/cgroup.c:1248:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cset->subsys, template, sizeof(cset->subsys));
           ^~~~~~
   kernel/cgroup/cgroup.c:1248:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(cset->subsys, template, sizeof(cset->subsys));
           ^~~~~~
   kernel/cgroup/cgroup.c:1497:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, CGROUP_FILE_NAME_MAX, "%s%s.%s",
                   ^~~~~~~~
   kernel/cgroup/cgroup.c:1497:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf, CGROUP_FILE_NAME_MAX, "%s%s.%s",
                   ^~~~~~~~
   kernel/cgroup/cgroup.c:4708:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(it, 0, sizeof(*it));
           ^~~~~~
   kernel/cgroup/cgroup.c:4708:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(it, 0, sizeof(*it));
           ^~~~~~
   kernel/cgroup/cgroup.c:5224:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(css, 0, sizeof(*css));
           ^~~~~~
   kernel/cgroup/cgroup.c:5224:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(css, 0, sizeof(*css));
           ^~~~~~
   kernel/cgroup/cgroup.c:6640:7: warning: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (!sscanf(input, "%lld.%n%lld%n", &whole, &fstart, &frac, &fen=
d))
                ^~~~~~
   kernel/cgroup/cgroup.c:6640:7: note: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11
           if (!sscanf(input, "%lld.%n%lld%n", &whole, &fstart, &frac, &fen=
d))
                ^~~~~~
   kernel/cgroup/cgroup.c:6727:11: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret +=3D snprintf(buf + ret, size - ret, "%s.", =
prefix);
                                  ^~~~~~~~
   kernel/cgroup/cgroup.c:6727:11: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                           ret +=3D snprintf(buf + ret, size - ret, "%s.", =
prefix);
                                  ^~~~~~~~
   kernel/cgroup/cgroup.c:6729:10: warning: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret +=3D snprintf(buf + ret, size - ret, "%s\n", cft->na=
me);
                          ^~~~~~~~
   kernel/cgroup/cgroup.c:6729:10: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   ret +=3D snprintf(buf + ret, size - ret, "%s\n", cft->na=
me);
                          ^~~~~~~~
   kernel/cgroup/cgroup.c:6760:9: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE,
                  ^~~~~~~~
   kernel/cgroup/cgroup.c:6760:9: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE,
                  ^~~~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/video/fbdev/omap/lcd_mipid.c:66:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xfer, 0, sizeof(xfer));
           ^~~~~~
   drivers/video/fbdev/omap/lcd_mipid.c:66:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(xfer, 0, sizeof(xfer));
           ^~~~~~
>> drivers/video/fbdev/omap/lcd_mipid.c:264:3: warning: Value stored to 'pi=
xel' is never read [clang-analyzer-deadcode.DeadStores]
                   pixel =3D 0;
                   ^       ~
   drivers/video/fbdev/omap/lcd_mipid.c:264:3: note: Value stored to 'pixel=
' is never read
                   pixel =3D 0;
                   ^       ~
   Suppressed 42 warnings (42 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:670:49: warning: The result=
 of the left shift is undefined because the left operand is negative [clang=
-analyzer-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->gcb, ct-=
>gcr));
                                                          ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:666:21: note: expanded from=
 macro 'CVAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:60:42: note: expanded from ma=
cro 'FLD_VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4049:6: note: Assuming the =
condition is true
           if (REG_GET(DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_ONLY) {
               ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:49:2: note: expanded from m=
acro 'REG_GET'
           FLD_GET(dispc_read_reg(idx), start, end)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:61:34: note: expanded from ma=
cro 'FLD_GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4049:2: note: Taking true b=
ranch
           if (REG_GET(DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_ONLY) {
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4050:3: note: Calling '_oma=
p_dispc_initial_config'
                   _omap_dispc_initial_config();
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3721:6: note: Assuming the =
condition is false
           if (dss_has_feature(FEAT_CORE_CLK_DIV)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3721:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_CORE_CLK_DIV)) {
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:6: note: Assuming the =
condition is false
           if (dss_has_feature(FEAT_FUNCGATED))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_FUNCGATED))
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3735:2: note: Calling 'disp=
c_setup_color_conv_coef'
           dispc_setup_color_conv_coef();
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:14: note: Assuming 'i' =
is >=3D 'num_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:2: note: Loop condition=
 is false. Execution continues on line 695
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:695:6: note: Assuming field=
 'has_writeback' is true
           if (dispc.feat->has_writeback)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:695:2: note: Taking true br=
anch
           if (dispc.feat->has_writeback)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:696:3: note: Calling 'dispc=
_ovl_write_color_conv_coef'
                   dispc_ovl_write_color_conv_coef(OMAP_DSS_WB, &ctbl_bt601=
_5_wb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:670:49: note: The result of=
 the left shift is undefined because the left operand is negative
           dispc_write_reg(DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->gcb, ct-=
>gcr));
                                                          ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:666:21: note: expanded from=
 macro 'CVAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:60:42: note: expanded from ma=
cro 'FLD_VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/usb/core/devio.c:257:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mem, 0, size);
           ^~~~~~
   drivers/usb/core/devio.c:257:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(mem, 0, size);
           ^~~~~~
   drivers/usb/core/devio.c:325:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&temp_desc, &dev->descriptor, sizeof(dev->descrip=
tor));
                   ^~~~~~
   drivers/usb/core/devio.c:325:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&temp_desc, &dev->descriptor, sizeof(dev->descrip=
tor));
                   ^~~~~~
   drivers/usb/core/devio.c:1444:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ci, 0, sizeof(ci));
           ^~~~~~
   drivers/usb/core/devio.c:1444:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&ci, 0, sizeof(ci));
--
           ^~~~~~~~
   drivers/media/platform/ti/am437x/am437x-vpfe.c:1278:2: note: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cap->bus_info, sizeof(cap->bus_info),
           ^~~~~~~~
   drivers/media/platform/ti/am437x/am437x-vpfe.c:1411:2: warning: Value st=
ored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/media/platform/ti/am437x/am437x-vpfe.c:1411:2: note: Value store=
d to 'ret' is never read
           ret =3D 0;
           ^     ~
   drivers/media/platform/ti/am437x/am437x-vpfe.c:1515:2: warning: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fsize->reserved, 0x0, sizeof(fsize->reserved));
           ^~~~~~
   drivers/media/platform/ti/am437x/am437x-vpfe.c:1515:2: note: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(fsize->reserved, 0x0, sizeof(fsize->reserved));
           ^~~~~~
   drivers/media/platform/ti/am437x/am437x-vpfe.c:1517:2: warning: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fse, 0x0, sizeof(fse));
           ^~~~~~
   drivers/media/platform/ti/am437x/am437x-vpfe.c:1517:2: note: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&fse, 0x0, sizeof(fse));
           ^~~~~~
   drivers/media/platform/ti/am437x/am437x-vpfe.c:2176:3: warning: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&mbus_code, 0, sizeof(mbus_code));
                   ^~~~~~
   drivers/media/platform/ti/am437x/am437x-vpfe.c:2176:3: note: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&mbus_code, 0, sizeof(mbus_code));
                   ^~~~~~
   Suppressed 46 warnings (45 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/video/fbdev/omap/omapfb_main.c:599:3: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new_var, &fbi->var, sizeof(*new_var));
                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:599:3: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(new_var, &fbi->var, sizeof(*new_var));
                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:605:4: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&fbi->var, new_var, sizeof(*new_var));
                           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:605:4: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&fbi->var, new_var, sizeof(*new_var));
                           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:843:5: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(new_var, &fbi->var, sizeof(*new_v=
ar));
                                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:843:5: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(new_var, &fbi->var, sizeof(*new_v=
ar));
                                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:863:5: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&fbi->var, new_var, sizeof(fbi->v=
ar));
                                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:863:5: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(&fbi->var, new_var, sizeof(fbi->v=
ar));
                                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:891:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mi, 0, sizeof(*mi));
           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:891:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(mi, 0, sizeof(*mi));
           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1017:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(caps, 0, sizeof(*caps));
           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1017:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(caps, 0, sizeof(*caps));
           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1031:3: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&win, 0, sizeof(win));
                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1031:3: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                   memset(&win, 0, sizeof(win));
                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1100:4: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(u->reserved, 0, sizeof(u->reserved));
                           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1100:4: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                           memset(u->reserved, 0, sizeof(u->reserved));
                           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1334:7: warning: Call to function=
 'sscanf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(buf, "%10d", &level) =3D=3D 1) {
                       ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1334:7: note: Call to function 's=
scanf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sscanf_s' in case of C11
                   if (sscanf(buf, "%10d", &level) =3D=3D 1) {
                       ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1451:2: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(fix->id, MODULE_NAME, sizeof(fix->id));
           ^~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1451:2: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(fix->id, MODULE_NAME, sizeof(fix->id));
           ^~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1577:2: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(name, conf->lcd.ctrl_name, sizeof(name) - 1);
           ^~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1577:2: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(name, conf->lcd.ctrl_name, sizeof(name) - 1);
           ^~~~~~~
>> drivers/video/fbdev/omap/omapfb_main.c:1811:16: warning: Use of memory a=
fter it is freed [clang-analyzer-unix.Malloc]
           fbdev->dssdev =3D NULL;
           ~~~~~~~~~~~~~ ^
   drivers/video/fbdev/omap/omapfb_main.c:1808:2: note: Calling 'omapfb_fre=
e_resources'
           omapfb_free_resources(fbdev, saved_state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1530:2: note: Control jumps to 'c=
ase 1:'  at line 1555
           switch (state) {
           ^
   drivers/video/fbdev/omap/omapfb_main.c:1557:3: note: Memory is released
                   kfree(fbdev);
                   ^~~~~~~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1558:3: note:  Execution continue=
s on line 1557
                   break;
                   ^
   drivers/video/fbdev/omap/omapfb_main.c:1808:2: note: Returning; memory w=
as released via 1st parameter
           omapfb_free_resources(fbdev, saved_state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1811:16: note: Use of memory afte=
r it is freed
           fbdev->dssdev =3D NULL;
           ~~~~~~~~~~~~~ ^
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/video/fbdev/core/fbsysfs.c:121:9: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(&buf[offset], PAGE_SIZE - offset, "%c:%dx%d%c-%d=
\n",
                  ^~~~~~~~
   drivers/video/fbdev/core/fbsysfs.c:121:9: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(&buf[offset], PAGE_SIZE - offset, "%c:%dx%d%c-%d=
\n",
                  ^~~~~~~~
   drivers/video/fbdev/core/fbsysfs.c:137:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&var, 0, sizeof(var));
           ^~~~~~
   drivers/video/fbdev/core/fbsysfs.c:137:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&var, 0, sizeof(var));
           ^~~~~~
   drivers/video/fbdev/core/fbsysfs.c:443:7: warning: Call to function 'ssc=
anf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(&buf[i * 24],
                       ^~~~~~
   drivers/video/fbdev/core/fbsysfs.c:443:7: note: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11
                   if (sscanf(&buf[i * 24],
                       ^~~~~~
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
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
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
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/cpufreq/brcmstb-avs-cpufreq.c:658:10: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "<unknown>\n");
                          ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:658:10: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "<unknown>\n");
                          ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:660:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", pstate);
                  ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:660:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", pstate);
                  ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:669:10: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "<unknown>\n");
                          ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:669:10: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "<unknown>\n");
                          ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:671:9: warning: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling]
           return sprintf(buf, "%s %u\n", brcm_avs_mode_to_string(pmap.mode=
),
                  ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:671:9: note: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11
           return sprintf(buf, "%s %u\n", brcm_avs_mode_to_string(pmap.mode=
),
                  ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:683:10: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "<unknown>\n");
                          ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:683:10: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "<unknown>\n");
                          ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:688:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x 0x%08x %u %u %u %u %u %u %u %u %u\n",
                  ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:688:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x 0x%08x %u %u %u %u %u %u %u %u %u\n",
                  ^~~~~~~
   drivers/cpufreq/brcmstb-avs-cpufreq.c:697:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", brcm_avs_get_voltage(priv->base)=
);

vim +1811 drivers/video/fbdev/omap/omapfb_main.c

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1798  =

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1799  /* Called when the device is being detached from the driver */
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1800  static int omapfb_remove(struct platform_device *pdev)
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1801  {
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1802  	struct omapfb_device *fbdev =3D platform_get_drvdata(pdev);
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1803  	enum omapfb_state saved_state =3D fbdev->state;
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1804  =

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1805  	/* FIXME: wait till completion of pending events */
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1806  =

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1807  	fbdev->state =3D OMAPFB_DISABLED;
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1808  	omapfb_free_resources(fbdev, saved_state);
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1809  =

f778a12dd33200 drivers/video/omap/omapfb_main.c Tomi Valkeinen 2009-12-16  =
1810  	platform_device_unregister(&omapdss_device);
f778a12dd33200 drivers/video/omap/omapfb_main.c Tomi Valkeinen 2009-12-16 @=
1811  	fbdev->dssdev =3D NULL;
f778a12dd33200 drivers/video/omap/omapfb_main.c Tomi Valkeinen 2009-12-16  =
1812  =

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1813  	return 0;
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1814  }
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1815  =


:::::: The code at line 1811 was first introduced by commit
:::::: f778a12dd33200513596a0d4d3ba4d5f09e79c09 OMAP: OMAPFB: fix clk_get f=
or RFBI

:::::: TO: Tomi Valkeinen <tomi.valkeinen@nokia.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@nokia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9115443644688459871==--

