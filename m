Content-Type: multipart/mixed; boundary="===============6754627470689784148=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/edac/synopsys_edac.c:1043:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or ...
Date: Tue, 26 Jul 2022 21:03:28 +0800
Message-ID: <202207262049.bP4ZpZLy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6754627470689784148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/edac/synopsys_edac.c:1043:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sherry Sun <sherry.sun@nxp.com>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: 5297ecfe2465951682f888b5f4c2efebe23d011a EDAC/synopsys: Add driver =
support for i.MX platforms
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220721 (https://download.01.org/0day-ci/archi=
ve/20220726/202207262049.bP4ZpZLy-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d=
68c137551cce816416190a18d45b4d4e2a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5297ecfe2465951682f888b5f4c2efebe23d011a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5297ecfe2465951682f888b5f4c2efebe23d011a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/edac/synopsys_edac.c:521:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(p, 0, sizeof(*p));
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
   drivers/edac/synopsys_edac.c:564:3: warning: 1st function call argument =
is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   writel(regval, priv->baseaddr + DDR_QOS_IRQ_STAT_OFST);
                   ^
   arch/arm/include/asm/io.h:311:36: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                                 ^~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:303:29: note: expanded from macro 'writel_rela=
xed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v=
),c)
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:92:22: note: expanded from macro '__raw_writel'
   #define __raw_writel __raw_writel
                        ^
   drivers/edac/synopsys_edac.c:536:14: note: 'regval' declared without an =
initial value
           int status, regval;
                       ^~~~~~
   drivers/edac/synopsys_edac.c:545:6: note: Assuming the condition is false
           if (!(priv->p_data->quirks & DDR_ECC_INTR_SELF_CLEAR)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/synopsys_edac.c:545:2: note: Taking false branch
           if (!(priv->p_data->quirks & DDR_ECC_INTR_SELF_CLEAR)) {
           ^
   drivers/edac/synopsys_edac.c:553:6: note: Assuming 'status' is 0
           if (status)
               ^~~~~~
   drivers/edac/synopsys_edac.c:553:2: note: Taking false branch
           if (status)
           ^
   drivers/edac/synopsys_edac.c:560:11: note: Assuming 'edac_debug_level' i=
s < 3
           edac_dbg(3, "Total error count CE %d UE %d\n",
                    ^
   drivers/edac/edac_mc.h:75:6: note: expanded from macro 'edac_dbg'
           if (level <=3D edac_debug_level)                                =
  \
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/synopsys_edac.c:560:2: note: Taking false branch
           edac_dbg(3, "Total error count CE %d UE %d\n",
           ^
   drivers/edac/edac_mc.h:75:2: note: expanded from macro 'edac_dbg'
           if (level <=3D edac_debug_level)                                =
  \
           ^
   drivers/edac/synopsys_edac.c:560:2: note: Loop condition is false.  Exit=
ing loop
           edac_dbg(3, "Total error count CE %d UE %d\n",
           ^
   drivers/edac/edac_mc.h:73:39: note: expanded from macro 'edac_dbg'
   #define edac_dbg(level, fmt, ...)                                       \
                                                                           ^
   drivers/edac/synopsys_edac.c:563:6: note: Assuming the condition is true
           if (!(priv->p_data->quirks & DDR_ECC_INTR_SELF_CLEAR))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/synopsys_edac.c:563:2: note: Taking true branch
           if (!(priv->p_data->quirks & DDR_ECC_INTR_SELF_CLEAR))
           ^
   drivers/edac/synopsys_edac.c:564:3: note: Loop condition is false.  Exit=
ing loop
                   writel(regval, priv->baseaddr + DDR_QOS_IRQ_STAT_OFST);
                   ^
   arch/arm/include/asm/io.h:311:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:170:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/edac/synopsys_edac.c:564:3: note: 1st function call argument is =
an uninitialized value
                   writel(regval, priv->baseaddr + DDR_QOS_IRQ_STAT_OFST);
                   ^
   arch/arm/include/asm/io.h:311:36: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                                 ^~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:303:29: note: expanded from macro 'writel_rela=
xed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v=
),c)
                                   ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:92:22: note: expanded from macro '__raw_writel'
   #define __raw_writel __raw_writel
                        ^
   drivers/edac/synopsys_edac.c:1014:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(data, "Poison0 Addr: 0x%08x\n\rPoison1 Addr: 0x%0=
8x\n\r"
                  ^~~~~~~
   drivers/edac/synopsys_edac.c:1014:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(data, "Poison0 Addr: 0x%08x\n\rPoison1 Addr: 0x%0=
8x\n\r"
                  ^~~~~~~
>> drivers/edac/synopsys_edac.c:1043:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           return sprintf(data, "Data Poisoning: %s\n\r",
                  ^~~~~~~
   drivers/edac/synopsys_edac.c:1043:9: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           return sprintf(data, "Data Poisoning: %s\n\r",
                  ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/iio/dac/ti-dac5571.c:43:8: warning: Excessive padding in 'struct=
 dac5571_data' (57 padding bytes, where 25 is optimal). Optimal fields orde=
r: buf, powerdown, powerdown_mode, client, id, vref, spec, dac5571_cmd, dac=
5571_pwrdwn, lock, val, consider reordering the fields or adding explicit p=
adding members [clang-analyzer-optin.performance.Padding]
   struct dac5571_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ti-dac5571.c:43:8: note: Excessive padding in 'struct da=
c5571_data' (57 padding bytes, where 25 is optimal). Optimal fields order: =
buf, powerdown, powerdown_mode, client, id, vref, spec, dac5571_cmd, dac557=
1_pwrdwn, lock, val, consider reordering the fields or adding explicit padd=
ing members
   struct dac5571_data {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/iio/gyro/fxas21002c_core.c:137:8: warning: Excessive padding in =
'struct fxas21002c_data' (51 padding bytes, where 19 is optimal). Optimal f=
ields order: buffer, timestamp, mode, prev_mode, regmap, dready_trig, irq, =
vdd, vddio, lock, regmap_fields, chip_id, consider reordering the fields or=
 adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct fxas21002c_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/gyro/fxas21002c_core.c:137:8: note: Excessive padding in 'st=
ruct fxas21002c_data' (51 padding bytes, where 19 is optimal). Optimal fiel=
ds order: buffer, timestamp, mode, prev_mode, regmap, dready_trig, irq, vdd=
, vddio, lock, regmap_fields, chip_id, consider reordering the fields or ad=
ding explicit padding members
   struct fxas21002c_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/iio/gyro/itg3200_core.c:94:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:94:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/rpmsg/qcom_glink_ssr.c:110:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
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
   drivers/rpmsg/qcom_glink_ssr.c:110:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
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
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/nvmem/meson-mx-efuse.c:158:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf + i, &tmp,
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
   drivers/nvmem/meson-mx-efuse.c:158:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf + i, &tmp,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'

vim +1043 drivers/edac/synopsys_edac.c

1a81361f75d8a5 Manish Narani 2018-10-25  1035  =

1a81361f75d8a5 Manish Narani 2018-10-25  1036  static ssize_t inject_data_p=
oison_show(struct device *dev,
1a81361f75d8a5 Manish Narani 2018-10-25  1037  				       struct device_att=
ribute *mattr,
1a81361f75d8a5 Manish Narani 2018-10-25  1038  				       char *data)
1a81361f75d8a5 Manish Narani 2018-10-25  1039  {
1a81361f75d8a5 Manish Narani 2018-10-25  1040  	struct mem_ctl_info *mci =
=3D to_mci(dev);
1a81361f75d8a5 Manish Narani 2018-10-25  1041  	struct synps_edac_priv *pri=
v =3D mci->pvt_info;
1a81361f75d8a5 Manish Narani 2018-10-25  1042  =

1a81361f75d8a5 Manish Narani 2018-10-25 @1043  	return sprintf(data, "Data =
Poisoning: %s\n\r",
1a81361f75d8a5 Manish Narani 2018-10-25  1044  			(((readl(priv->baseaddr +=
 ECC_CFG1_OFST)) & 0x3) =3D=3D 0x3)
1a81361f75d8a5 Manish Narani 2018-10-25  1045  			? ("Correctable Error") :=
 ("UnCorrectable Error"));
1a81361f75d8a5 Manish Narani 2018-10-25  1046  }
1a81361f75d8a5 Manish Narani 2018-10-25  1047  =


:::::: The code at line 1043 was first introduced by commit
:::::: 1a81361f75d8a5cbe9d77c30fe0f42b7cda621c8 EDAC, synopsys: Add Error I=
njection support for ZynqMP DDR controller

:::::: TO: Manish Narani <manish.narani@xilinx.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6754627470689784148==--

