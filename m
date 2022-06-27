Content-Type: multipart/mixed; boundary="===============3945873683911716587=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1576/5720] drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:1884:19: warning: Value stored to 'qmp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 27 Jun 2022 03:04:31 +0000
Message-ID: <202206260850.k8lg9V5r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3945873683911716587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/p=
hy/qualcomm/phy-qcom-qmp-pcie.c:1884:19: warning: Value stored to 'qmp' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]"
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
commit: fd9269945f34dccac3e6e33d8ba46c4628d2fc19 [1576/5720] phy: qcom-qmp-=
pcie: cleanup the driver
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
it/commit/?id=3Dfd9269945f34dccac3e6e33d8ba46c4628d2fc19
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fd9269945f34dccac3e6e33d8ba46c4628d2fc19
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwmon/max6621.c:316:2: note: Control jumps to 'case hwmon_temp:'=
  at line 317
           switch (type) {
           ^
   drivers/hwmon/max6621.c:318:3: note: Control jumps to 'case hwmon_temp_o=
ffset:'  at line 319
                   switch (attr) {
                   ^
   drivers/hwmon/max6621.c:321:10: note: Assuming '__UNIQUE_ID___x256' is <=
=3D '__UNIQUE_ID___y257'
                           val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
                                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/max6621.c:321:10: note: '?' condition is false
                           val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
                                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/max6621.c:321:10: note: '__UNIQUE_ID___x258' is < '__UNIQU=
E_ID___y259'
                           val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
                                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/max6621.c:321:10: note: '?' condition is true
                           val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
                                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/max6621.c:323:10: note: Calling 'max6621_temp_mc2reg'
                           val =3D max6621_temp_mc2reg(val);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/max6621.c:135:23: note: The result of the left shift is un=
defined because the left operand is negative
           return (val / 1000L) << MAX6621_REG_TEMP_SHIFT;
                  ~~~~~~~~~~~~~ ^
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:1884:19: warning: Value stored =
to 'qmp' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:1884:19: note: Value stored to =
'qmp' during its initialization is never read
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2256:2: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2256:2: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:1104:2: warning: Call t=
o function 'snprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'snprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:1104:2: note: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:1121:3: warning: Call t=
o function 'snprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'snprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   snprintf(prop_name, sizeof(prop_name), "lane%d", id);
                   ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c:1121:3: note: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11
                   snprintf(prop_name, sizeof(prop_name), "lane%d", id);
                   ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   kernel/rcu/tree.c:2434:19: warning: Value stored to 'rnp' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rcu_node *rnp =3D rdp->mynode;
                            ^~~   ~~~~~~~~~~~
   kernel/rcu/tree.c:2434:19: note: Value stored to 'rnp' during its initia=
lization is never read
           struct rcu_node *rnp =3D rdp->mynode;
                            ^~~   ~~~~~~~~~~~
   kernel/rcu/tree.c:2499:19: warning: Value stored to 'rnp' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rcu_node *rnp =3D rdp->mynode;  /* Outgoing CPU's rdp & r=
np. */
                            ^~~   ~~~~~~~~~~~
   kernel/rcu/tree.c:2499:19: note: Value stored to 'rnp' during its initia=
lization is never read
           struct rcu_node *rnp =3D rdp->mynode;  /* Outgoing CPU's rdp & r=
np. */
                            ^~~   ~~~~~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/video/backlight/qcom-wled.c:1126:3: warning: Value stored to 'rc=
' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D regmap_update_bits(wled->regmap, addr,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/qcom-wled.c:1126:3: note: Value stored to 'rc' i=
s never read
                   rc =3D regmap_update_bits(wled->regmap, addr,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/qcom-wled.c:1710:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   drivers/video/backlight/qcom-wled.c:1710:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(struct backlight_properties));
           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/video/backlight/wm831x_bl.c:182:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(props));
           ^~~~~~
   drivers/video/backlight/wm831x_bl.c:182:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(props));
           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/video/fbdev/core/fbmem.c:805:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   fb_memcpy_fromfb(dst, src, c);
                   ^
   include/linux/fb.h:584:26: note: expanded from macro 'fb_memcpy_fromfb'
   #define fb_memcpy_fromfb memcpy
                            ^~~~~~
   drivers/video/fbdev/core/fbmem.c:805:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   fb_memcpy_fromfb(dst, src, c);
                   ^
   include/linux/fb.h:584:26: note: expanded from macro 'fb_memcpy_fromfb'
   #define fb_memcpy_fromfb memcpy
                            ^~~~~~
   drivers/video/fbdev/core/fbmem.c:806:3: warning: Value stored to 'dst' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:806:3: note: Value stored to 'dst' is n=
ever read
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:882:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   fb_memcpy_tofb(dst, src, c);
                   ^
   include/linux/fb.h:585:24: note: expanded from macro 'fb_memcpy_tofb'
   #define fb_memcpy_tofb memcpy
                          ^~~~~~
   drivers/video/fbdev/core/fbmem.c:882:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   fb_memcpy_tofb(dst, src, c);
                   ^
   include/linux/fb.h:585:24: note: expanded from macro 'fb_memcpy_tofb'
   #define fb_memcpy_tofb memcpy

vim +/qmp +1884 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1880  =

5dbc7d86d1aa25 Dmitry Baryshkov 2022-06-08  1881  static int qcom_qmp_phy_p=
cie_init(struct phy *phy)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1882  {
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1883  	struct qmp_phy *qphy =3D=
 phy_get_drvdata(phy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08 @1884  	struct qcom_qmp *qmp =3D=
 qphy->qmp;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1885  	int ret;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1886  	dev_vdbg(qmp->dev, "Init=
ializing QMP phy\n");
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1887  =

5dbc7d86d1aa25 Dmitry Baryshkov 2022-06-08  1888  	ret =3D qcom_qmp_phy_pci=
e_com_init(qphy);
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1889  	if (ret)
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1890  		return ret;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1891  =

94a407cc17a445 Dmitry Baryshkov 2022-06-08  1892  	return 0;
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1893  }
94a407cc17a445 Dmitry Baryshkov 2022-06-08  1894  =


:::::: The code at line 1884 was first introduced by commit
:::::: 94a407cc17a445ddb3f7315cee0b0916d35d177c phy: qcom-qmp: create copie=
s of QMP PHY driver

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3945873683911716587==--

