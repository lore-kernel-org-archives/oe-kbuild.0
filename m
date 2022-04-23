Content-Type: multipart/mixed; boundary="===============3503142536120392175=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bvanassche:ufs-for-next 30/30] drivers/ufs/core/ufshcd.c:699:23: warning: Value stored to 'priv' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 24 Apr 2022 00:29:05 +0800
Message-ID: <202204240001.PHb9Wbua-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3503142536120392175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   364862347ebdd7a5e122b6ab6892b307759cce2a
commit: 364862347ebdd7a5e122b6ab6892b307759cce2a [30/30] scsi: ufs: Split s=
truct ufs_hba
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20220422 (https://download.01.org/0day-ci/archi=
ve/20220424/202204240001.PHb9Wbua-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd873=
50a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/bvanassche/linux/commit/364862347ebdd7a5e122b6=
ab6892b307759cce2a
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche ufs-for-next
        git checkout 364862347ebdd7a5e122b6ab6892b307759cce2a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~
   drivers/usb/storage/ene_ub6250.c:2020:13: note: Left side of '&&' is fal=
se
           if (result && (btBlk2nd !=3D MS_LB_NOT_USED))
                      ^
   drivers/usb/storage/ene_ub6250.c:2023:6: note: 'result' is 0
           if (result) {
               ^~~~~~
   drivers/usb/storage/ene_ub6250.c:2023:2: note: Taking false branch
           if (result) {
           ^
   drivers/usb/storage/ene_ub6250.c:2028:2: note: Loop condition is false. =
Execution continues on line 2031
           for (TmpBlock =3D 0; TmpBlock < btBlk1st; TmpBlock++)
           ^
   drivers/usb/storage/ene_ub6250.c:2031:36: note: Array access (via field =
'Phy2LogMap') results in a null pointer dereference
           info->MS_Lib.Phy2LogMap[btBlk1st] =3D MS_LB_BOOT_BLOCK;
                        ~~~~~~~~~~           ^
   drivers/usb/storage/ene_ub6250.c:2088:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bcb, 0, sizeof(struct bulk_cb_wrap));
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
   drivers/usb/storage/ene_ub6250.c:2088:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(bcb, 0, sizeof(struct bulk_cb_wrap));
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
   drivers/usb/storage/ene_ub6250.c:2141:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bcb, 0, sizeof(struct bulk_cb_wrap));
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
   drivers/usb/storage/ene_ub6250.c:2141:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(bcb, 0, sizeof(struct bulk_cb_wrap));
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
   drivers/usb/storage/ene_ub6250.c:2159:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bcb, 0, sizeof(struct bulk_cb_wrap));
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
   drivers/usb/storage/ene_ub6250.c:2159:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(bcb, 0, sizeof(struct bulk_cb_wrap));
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
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (58 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   124 warnings generated.
>> drivers/ufs/core/ufshcd.c:699:23: warning: Value stored to 'priv' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ufs_hba_priv *priv =3D container_of(hba, typeof(*priv), h=
ba);
                                ^~~~
   drivers/ufs/core/ufshcd.c:699:23: note: Value stored to 'priv' during it=
s initialization is never read
           struct ufs_hba_priv *priv =3D container_of(hba, typeof(*priv), h=
ba);
                                ^~~~
   drivers/ufs/core/ufshcd.c:951:23: warning: Value stored to 'priv' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ufs_hba_priv *priv =3D container_of(hba, typeof(*priv), h=
ba);
                                ^~~~
   drivers/ufs/core/ufshcd.c:951:23: note: Value stored to 'priv' during it=
s initialization is never read
           struct ufs_hba_priv *priv =3D container_of(hba, typeof(*priv), h=
ba);
                                ^~~~
   drivers/ufs/core/ufshcd.c:1199:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&new_pwr_info, &priv->clk_scaling.saved_pwr_info.=
info,
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
   drivers/ufs/core/ufshcd.c:1199:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&new_pwr_info, &priv->clk_scaling.saved_pwr_info.=
info,
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
   drivers/ufs/core/ufshcd.c:1202:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&new_pwr_info, &hba->pwr_info,
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
   drivers/ufs/core/ufshcd.c:1202:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&new_pwr_info, &hba->pwr_info,
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
   drivers/ufs/core/ufshcd.c:1208:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&priv->clk_scaling.saved_pwr_info.info,
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
   drivers/ufs/core/ufshcd.c:1208:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&priv->clk_scaling.saved_pwr_info.info,
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
   drivers/ufs/core/ufshcd.c:1428:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(stat, 0, sizeof(*stat));
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

vim +/priv +699 drivers/ufs/core/ufshcd.c

5a0b0cb9bee767 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2013-07-30  690=
  =

2fbd009b40967f drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  691=
  /**
2fbd009b40967f drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  692=
   * ufshcd_get_intr_mask - Get the interrupt bit mask
8aa29f192ca675 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2018-03-01  693=
   * @hba: Pointer to adapter instance
2fbd009b40967f drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  694=
   *
2fbd009b40967f drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  695=
   * Returns interrupt bit mask per version
2fbd009b40967f drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  696=
   */
2fbd009b40967f drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  697=
  static inline u32 ufshcd_get_intr_mask(struct ufs_hba *hba)
2fbd009b40967f drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  698=
  {
364862347ebdd7 drivers/ufs/core/ufshcd.c Bart Van Assche    2022-03-19 @699=
  	struct ufs_hba_priv *priv =3D container_of(hba, typeof(*priv), hba);
364862347ebdd7 drivers/ufs/core/ufshcd.c Bart Van Assche    2022-03-19  700=
  =

5142881801786a drivers/scsi/ufs/ufshcd.c Caleb Connolly     2021-03-10  701=
  	if (hba->ufs_version =3D=3D ufshci_version(1, 0))
5142881801786a drivers/scsi/ufs/ufshcd.c Caleb Connolly     2021-03-10  702=
  		return INTERRUPT_MASK_ALL_VER_10;
5142881801786a drivers/scsi/ufs/ufshcd.c Caleb Connolly     2021-03-10  703=
  	if (hba->ufs_version <=3D ufshci_version(2, 0))
5142881801786a drivers/scsi/ufs/ufshcd.c Caleb Connolly     2021-03-10  704=
  		return INTERRUPT_MASK_ALL_VER_11;
c01848c67d48aa drivers/scsi/ufs/ufshcd.c Yaniv Gardi        2016-12-05  705=
  =

5142881801786a drivers/scsi/ufs/ufshcd.c Caleb Connolly     2021-03-10  706=
  	return INTERRUPT_MASK_ALL_VER_21;
2fbd009b40967f drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  707=
  }
2fbd009b40967f drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  708=
  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3503142536120392175==--

