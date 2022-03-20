Content-Type: multipart/mixed; boundary="===============6109210881949493976=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bvanassche:ufs-for-next 317/317] drivers/scsi/ufs/ufshcd.c:690:23: warning: Value stored to 'priv' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 21 Mar 2022 01:54:02 +0800
Message-ID: <202203210141.ha243aFw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6109210881949493976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   905917fe701f16ad2d895c3fef85ca92efd86a06
commit: 905917fe701f16ad2d895c3fef85ca92efd86a06 [317/317] scsi: ufs: Split=
 struct ufs_hba
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: riscv-randconfig-c006-20220320 (https://download.01.org/0day-ci/arc=
hive/20220321/202203210141.ha243aFw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/bvanassche/linux/commit/905917fe701f16ad2d895c=
3fef85ca92efd86a06
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche ufs-for-next
        git checkout 905917fe701f16ad2d895c3fef85ca92efd86a06
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   sound/core/device.c:226:17: note: Assuming 'card' is non-null
           if (snd_BUG_ON(!card))
                          ^
   include/sound/core.h:413:25: note: expanded from macro 'snd_BUG_ON'
           int __ret_warn_on =3D !!(condition); \
                                  ^~~~~~~~~
   sound/core/device.c:226:2: note: Taking false branch
           if (snd_BUG_ON(!card))
           ^
   sound/core/device.c:228:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:772:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:230:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_CONTROL
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:7: note: Left side of '||' is false
   sound/core/device.c:231:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_LOWLEVEL
                       dev->type =3D=3D SNDRV_DEV_LOWLEVEL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:3: note: Taking false branch
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                   ^
   sound/core/device.c:233:3: note: Calling '__snd_device_free'
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:6: note: Assuming field 'dev_free' is null
           if (dev->ops->dev_free) {
               ^~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:2: note: Taking false branch
           if (dev->ops->dev_free) {
           ^
   sound/core/device.c:79:2: note: Memory is released
           kfree(dev);
           ^~~~~~~~~~
   sound/core/device.c:233:3: note: Returning; memory was released via 1st =
parameter
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:228:2: note: Loop condition is false. Execution cont=
inues on line 237
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:772:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:237:2: note: Use of memory after it is freed
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:773:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:572:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/clk/bcm/clk-iproc-pll.c:182:3: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   val =3D readl(base + offset);
                   ^
   drivers/clk/bcm/clk-iproc-pll.c:182:3: note: Value stored to 'val' is ne=
ver read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
>> drivers/scsi/ufs/ufshcd.c:690:23: warning: Value stored to 'priv' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ufs_hba_priv *priv =3D container_of(hba, typeof(*priv), h=
ba);
                                ^~~~
   drivers/scsi/ufs/ufshcd.c:690:23: note: Value stored to 'priv' during it=
s initialization is never read
           struct ufs_hba_priv *priv =3D container_of(hba, typeof(*priv), h=
ba);
                                ^~~~
   drivers/scsi/ufs/ufshcd.c:942:23: warning: Value stored to 'priv' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ufs_hba_priv *priv =3D container_of(hba, typeof(*priv), h=
ba);
                                ^~~~
   drivers/scsi/ufs/ufshcd.c:942:23: note: Value stored to 'priv' during it=
s initialization is never read
           struct ufs_hba_priv *priv =3D container_of(hba, typeof(*priv), h=
ba);
                                ^~~~
   drivers/scsi/ufs/ufshcd.c:5371:36: warning: Access to field 'cmd_active'=
 results in a dereference of a null pointer (loaded from field 'active_uic_=
cmd') [clang-analyzer-core.NullDereference]
                   priv->active_uic_cmd->cmd_active =3D 0;
                                                    ^
   drivers/scsi/ufs/ufshcd.c:6729:16: note: Loop condition is false.  Exiti=
ng loop
           intr_status =3D ufshcd_readl(hba, REG_INTERRUPT_STATUS);
                         ^
   drivers/scsi/ufs/ufshcd.h:1016:2: note: expanded from macro 'ufshcd_read=
l'
           readl((hba)->mmio_base + (reg))
           ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/scsi/ufs/ufshcd.c:6739:9: note: Assuming 'intr_status' is not eq=
ual to 0
           while (intr_status && retries--) {
                  ^~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:6739:9: note: Left side of '&&' is true
   drivers/scsi/ufs/ufshcd.c:6739:2: note: Loop condition is true.  Enterin=
g loop body
           while (intr_status && retries--) {
           ^
   drivers/scsi/ufs/ufshcd.c:6741:18: note: Loop condition is false.  Exiti=
ng loop
                           intr_status & ufshcd_readl(hba, REG_INTERRUPT_EN=
ABLE);
                                         ^
   drivers/scsi/ufs/ufshcd.h:1016:2: note: expanded from macro 'ufshcd_read=
l'
           readl((hba)->mmio_base + (reg))
           ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/scsi/ufs/ufshcd.c:6742:3: note: Loop condition is false.  Exitin=
g loop
                   ufshcd_writel(hba, intr_status, REG_INTERRUPT_STATUS);
                   ^
   drivers/scsi/ufs/ufshcd.h:1014:2: note: expanded from macro 'ufshcd_writ=
el'
           writel((val), (hba)->mmio_base + (reg))
           ^
   arch/riscv/include/asm/mmio.h:144:58: note: expanded from macro 'writel'
   #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
                                                               ^
   arch/riscv/include/asm/mmio.h:136:19: note: expanded from macro '__io_aw'
   #define __io_aw()       mmiowb_set_pending()
                           ^
   include/asm-generic/mmiowb.h:61:31: note: expanded from macro 'mmiowb_se=
t_pending'
   #define mmiowb_set_pending()            do { } while (0)
                                           ^
   drivers/scsi/ufs/ufshcd.c:6743:7: note: Assuming 'enabled_intr_status' i=
s not equal to 0
                   if (enabled_intr_status)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:6743:3: note: Taking true branch
                   if (enabled_intr_status)
                   ^
   drivers/scsi/ufs/ufshcd.c:6744:14: note: Calling 'ufshcd_sl_intr'
                           retval |=3D ufshcd_sl_intr(hba, enabled_intr_sta=
tus);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/scsi/ufs/ufshcd.c:6697:6: note: Assuming the condition is true
           if (intr_status & UFSHCD_UIC_MASK)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:6697:2: note: Taking true branch
           if (intr_status & UFSHCD_UIC_MASK)
           ^
   drivers/scsi/ufs/ufshcd.c:6698:13: note: Calling 'ufshcd_uic_cmd_compl'
                   retval |=3D ufshcd_uic_cmd_compl(hba, intr_status);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:5356:2: note: Taking false branch
           if (ufshcd_is_auto_hibern8_error(hba, intr_status))
           ^
   drivers/scsi/ufs/ufshcd.c:5359:7: note: Assuming the condition is true
           if ((intr_status & UIC_COMMAND_COMPL) && priv->active_uic_cmd) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:5359:6: note: Left side of '&&' is true
           if ((intr_status & UIC_COMMAND_COMPL) && priv->active_uic_cmd) {
               ^
   drivers/scsi/ufs/ufshcd.c:5359:43: note: Assuming field 'active_uic_cmd'=
 is null
           if ((intr_status & UIC_COMMAND_COMPL) && priv->active_uic_cmd) {
                                                    ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:5359:6: note: Assuming pointer value is null
           if ((intr_status & UIC_COMMAND_COMPL) && priv->active_uic_cmd) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:5359:2: note: Taking false branch
           if ((intr_status & UIC_COMMAND_COMPL) && priv->active_uic_cmd) {
           ^
   drivers/scsi/ufs/ufshcd.c:5370:7: note: Assuming the condition is true
           if ((intr_status & UFSHCD_UIC_PWR_MASK) && priv->uic_async_done)=
 {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:5370:6: note: Left side of '&&' is true

vim +/priv +690 drivers/scsi/ufs/ufshcd.c

5a0b0cb9bee767 Sujit Reddy Thumma 2013-07-30  681  =

2fbd009b40967f Seungwon Jeon      2013-06-26  682  /**
2fbd009b40967f Seungwon Jeon      2013-06-26  683   * ufshcd_get_intr_mask =
- Get the interrupt bit mask
8aa29f192ca675 Bart Van Assche    2018-03-01  684   * @hba: Pointer to adap=
ter instance
2fbd009b40967f Seungwon Jeon      2013-06-26  685   *
2fbd009b40967f Seungwon Jeon      2013-06-26  686   * Returns interrupt bit=
 mask per version
2fbd009b40967f Seungwon Jeon      2013-06-26  687   */
2fbd009b40967f Seungwon Jeon      2013-06-26  688  static inline u32 ufshcd=
_get_intr_mask(struct ufs_hba *hba)
2fbd009b40967f Seungwon Jeon      2013-06-26  689  {
905917fe701f16 Bart Van Assche    2022-03-19 @690  	struct ufs_hba_priv *pr=
iv =3D container_of(hba, typeof(*priv), hba);
905917fe701f16 Bart Van Assche    2022-03-19  691  =

5142881801786a Caleb Connolly     2021-03-10  692  	if (hba->ufs_version =
=3D=3D ufshci_version(1, 0))
5142881801786a Caleb Connolly     2021-03-10  693  		return INTERRUPT_MASK_=
ALL_VER_10;
5142881801786a Caleb Connolly     2021-03-10  694  	if (hba->ufs_version <=
=3D ufshci_version(2, 0))
5142881801786a Caleb Connolly     2021-03-10  695  		return INTERRUPT_MASK_=
ALL_VER_11;
c01848c67d48aa Yaniv Gardi        2016-12-05  696  =

5142881801786a Caleb Connolly     2021-03-10  697  	return INTERRUPT_MASK_A=
LL_VER_21;
2fbd009b40967f Seungwon Jeon      2013-06-26  698  }
2fbd009b40967f Seungwon Jeon      2013-06-26  699  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6109210881949493976==--

