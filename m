Content-Type: multipart/mixed; boundary="===============2109039706927008608=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/amd/yc/acp6x-pdm-dma.c:54:2: warning: Value stored to 'pdm_ctrl' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 04 May 2022 06:56:36 +0800
Message-ID: <202205040602.3zBPzvCl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2109039706927008608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef8e4d3c2ab1f47f63b6c7e578266b7e5cc9cd1b
commit: 89728d97db3f078aceb967ebe5ed2d0797b6a117 ASoC: amd: enable Yellow c=
arp acp6x drivers build
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20220502 (https://download.01.org/0day-ci/ar=
chive/20220504/202205040602.3zBPzvCl-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d=
36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D89728d97db3f078aceb967ebe5ed2d0797b6a117
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 89728d97db3f078aceb967ebe5ed2d0797b6a117
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/scsi/mvumi.c:351:9: note: Taking false branch
                   cmd =3D list_first_entry(&mhba->cmd_pool, struct mvumi_c=
md,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/scsi/mvumi.c:351:9: note: Loop condition is false.  Exiting loop
                   cmd =3D list_first_entry(&mhba->cmd_pool, struct mvumi_c=
md,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/scsi/mvumi.c:353:3: note: Calling 'list_del'
                   list_del(&cmd->queue_pointer);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   1 warning generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   sound/pci/emu10k1/emu10k1_main.c:255:3: warning: Value stored to 'tmp' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D inl(emu->port + A_IOCFG);
                   ^
   sound/pci/emu10k1/emu10k1_main.c:255:3: note: Value stored to 'tmp' is n=
ever read
   1 warning generated.
   sound/pci/emu10k1/emumpu401.c:329:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->name, name);
           ^~~~~~
   sound/pci/emu10k1/emumpu401.c:329:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(rmidi->name, name);
           ^~~~~~
   3 warnings generated.
   sound/pci/emu10k1/io.c:148:2: warning: Value stored to 'tmp' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           tmp =3D snd_emu10k1_ptr20_read(emu, reg, 0); /* write post */
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/emu10k1/io.c:148:2: note: Value stored to 'tmp' is never read
           tmp =3D snd_emu10k1_ptr20_read(emu, reg, 0); /* write post */
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/emu10k1/io.c:166:2: warning: Value stored to 'tmp' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           tmp =3D snd_emu10k1_ptr20_read(emu, reg, 0); /* Write post */
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/emu10k1/io.c:166:2: note: Value stored to 'tmp' is never read
           tmp =3D snd_emu10k1_ptr20_read(emu, reg, 0); /* Write post */
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/emu10k1/io.c:196:2: warning: Value stored to 'tmp' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           tmp =3D snd_emu10k1_ptr20_read(emu, P17V_I2C_1, 0); /* write pos=
t */
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/emu10k1/io.c:196:2: note: Value stored to 'tmp' is never read
           tmp =3D snd_emu10k1_ptr20_read(emu, P17V_I2C_1, 0); /* write pos=
t */
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
>> sound/soc/amd/yc/acp6x-pdm-dma.c:54:2: warning: Value stored to 'pdm_ctr=
l' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_ctrl =3D 0x00;
           ^          ~~~~
   sound/soc/amd/yc/acp6x-pdm-dma.c:54:2: note: Value stored to 'pdm_ctrl' =
is never read
           pdm_ctrl =3D 0x00;
           ^          ~~~~
>> sound/soc/amd/yc/acp6x-pdm-dma.c:121:2: warning: Value stored to 'pdm_en=
able' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_enable =3D 0x00;
           ^            ~~~~
   sound/soc/amd/yc/acp6x-pdm-dma.c:121:2: note: Value stored to 'pdm_enabl=
e' is never read
           pdm_enable =3D 0x00;
           ^            ~~~~
>> sound/soc/amd/yc/acp6x-pdm-dma.c:122:2: warning: Value stored to 'pdm_dm=
a_enable' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_dma_enable  =3D 0x00;
           ^                 ~~~~
   sound/soc/amd/yc/acp6x-pdm-dma.c:122:2: note: Value stored to 'pdm_dma_e=
nable' is never read
           pdm_dma_enable  =3D 0x00;
           ^                 ~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   sound/soc/img/img-i2s-in.c:449:25: warning: The result of the left shift=
 is undefined because the right operand is negative [clang-analyzer-core.Un=
definedBinaryOperatorResult]
           max_i2s_chan_pow_2 =3D 1 << get_count_order(i2s->max_i2s_chan);
                                  ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-i2s-in.c:430:6: note: Assuming 'i2s' is non-null
           if (!i2s)
               ^~~~
   sound/soc/img/img-i2s-in.c:430:2: note: Taking false branch
           if (!i2s)
           ^
   sound/soc/img/img-i2s-in.c:438:2: note: Taking false branch
           if (IS_ERR(base))
           ^
   sound/soc/img/img-i2s-in.c:443:2: note: Taking false branch
           if (of_property_read_u32(pdev->dev.of_node, "img,i2s-channels",
           ^
   sound/soc/img/img-i2s-in.c:449:28: note: Calling 'get_count_order'
           max_i2s_chan_pow_2 =3D 1 << get_count_order(i2s->max_i2s_chan);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:195:6: note: Assuming 'count' is equal to 0
           if (count =3D=3D 0)
               ^~~~~~~~~~
   include/linux/bitops.h:195:2: note: Taking true branch
           if (count =3D=3D 0)
           ^
   include/linux/bitops.h:196:3: note: Returning the value -1
                   return -1;
                   ^~~~~~~~~
   sound/soc/img/img-i2s-in.c:449:28: note: Returning from 'get_count_order'
           max_i2s_chan_pow_2 =3D 1 << get_count_order(i2s->max_i2s_chan);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/img/img-i2s-in.c:449:25: note: The result of the left shift is=
 undefined because the right operand is negative
           max_i2s_chan_pow_2 =3D 1 << get_count_order(i2s->max_i2s_chan);
                                  ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
   drivers/md/md.c:2458:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D sysfs_create_link(&rdev->kobj, bdev_kobj(rdev->bdev), "b=
lock");
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/md/md.c:2458:2: note: Value stored to 'err' is never read
           err =3D sysfs_create_link(&rdev->kobj, bdev_kobj(rdev->bdev), "b=
lock");
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/md/md.c:5209:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(page, "none\n");
           ^~~~~~
   drivers/md/md.c:5209:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(page, "none\n");
           ^~~~~~
   drivers/md/md.c:5685:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(disk->disk_name, name);
                   ^~~~~~
   drivers/md/md.c:5685:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(disk->disk_name, name);
                   ^~~~~~
   drivers/md/md.c:9654:5: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                                   ret =3D remove_and_add_spares(mddev, rde=
v2);
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md.c:9654:5: note: Value stored to 'ret' is never read
                                   ret =3D remove_and_add_spares(mddev, rde=
v2);
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
   drivers/md/md-bitmap.c:1682:8: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
                   *bmc |=3D NEEDED_MASK;
                        ^
   drivers/md/md-bitmap.c:1989:2: note: Taking false branch
           if (IS_ERR(bitmap)) {
           ^
   drivers/md/md-bitmap.c:1995:14: note: Assuming 'j' is < field 'chunks'
           for (j =3D 0; j < counts->chunks; j++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:1995:2: note: Loop condition is true.  Entering l=
oop body
           for (j =3D 0; j < counts->chunks; j++) {
           ^
   drivers/md/md-bitmap.c:1997:7: note: Assuming the condition is true
                   if (md_bitmap_file_test_bit(bitmap, block)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md-bitmap.c:1997:3: note: Taking true branch
                   if (md_bitmap_file_test_bit(bitmap, block)) {
                   ^
   drivers/md/md-bitmap.c:1998:9: note: 'lo' is 0
                           if (!lo)
                                ^~
   drivers/md/md-bitmap.c:1998:4: note: Taking true branch
                           if (!lo)
                           ^
   drivers/md/md-bitmap.c:2002:4: note: Calling 'md_bitmap_set_memory_bits'
                           md_bitmap_set_memory_bits(mddev->bitmap, block, =
1);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~

vim +/pdm_ctrl +54 sound/soc/amd/yc/acp6x-pdm-dma.c

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   48  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   49  static void acp6x_enable_p=
dm_clock(void __iomem *acp_base)
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   50  {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   51  	u32 pdm_clk_enable, pdm_c=
trl;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   52  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   53  	pdm_clk_enable =3D ACP_PD=
M_CLK_FREQ_MASK;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  @54  	pdm_ctrl =3D 0x00;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   55  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   56  	acp6x_writel(pdm_clk_enab=
le, acp_base + ACP_WOV_CLK_CTRL);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   57  	pdm_ctrl =3D acp6x_readl(=
acp_base + ACP_WOV_MISC_CTRL);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   58  	pdm_ctrl |=3D ACP_WOV_MIS=
C_CTRL_MASK;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   59  	acp6x_writel(pdm_ctrl, ac=
p_base + ACP_WOV_MISC_CTRL);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   60  }
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   61  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   62  static void acp6x_enable_p=
dm_interrupts(void __iomem *acp_base)
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   63  {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   64  	u32 ext_int_ctrl;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   65  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   66  	ext_int_ctrl =3D acp6x_re=
adl(acp_base + ACP_EXTERNAL_INTR_CNTL);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   67  	ext_int_ctrl |=3D PDM_DMA=
_INTR_MASK;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   68  	acp6x_writel(ext_int_ctrl=
, acp_base + ACP_EXTERNAL_INTR_CNTL);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   69  }
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   70  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   71  static void acp6x_disable_=
pdm_interrupts(void __iomem *acp_base)
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   72  {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   73  	u32 ext_int_ctrl;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   74  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   75  	ext_int_ctrl =3D acp6x_re=
adl(acp_base + ACP_EXTERNAL_INTR_CNTL);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   76  	ext_int_ctrl &=3D ~PDM_DM=
A_INTR_MASK;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   77  	acp6x_writel(ext_int_ctrl=
, acp_base + ACP_EXTERNAL_INTR_CNTL);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   78  }
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   79  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   80  static bool acp6x_check_pd=
m_dma_status(void __iomem *acp_base)
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   81  {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   82  	bool pdm_dma_status;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   83  	u32 pdm_enable, pdm_dma_e=
nable;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   84  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   85  	pdm_dma_status =3D false;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   86  	pdm_enable =3D acp6x_read=
l(acp_base + ACP_WOV_PDM_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   87  	pdm_dma_enable =3D acp6x_=
readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   88  	if ((pdm_enable & ACP_PDM=
_ENABLE) && (pdm_dma_enable & ACP_PDM_DMA_EN_STATUS))
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   89  		pdm_dma_status =3D true;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   90  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   91  	return pdm_dma_status;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   92  }
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   93  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   94  static int acp6x_start_pdm=
_dma(void __iomem *acp_base)
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   95  {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   96  	u32 pdm_enable;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   97  	u32 pdm_dma_enable;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   98  	int timeout;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18   99  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  100  	pdm_enable =3D 0x01;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  101  	pdm_dma_enable  =3D 0x01;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  102  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  103  	acp6x_enable_pdm_clock(ac=
p_base);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  104  	acp6x_writel(pdm_enable, =
acp_base + ACP_WOV_PDM_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  105  	acp6x_writel(pdm_dma_enab=
le, acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  106  	timeout =3D 0;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  107  	while (++timeout < ACP_CO=
UNTER) {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  108  		pdm_dma_enable =3D acp6x=
_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  109  		if ((pdm_dma_enable & 0x=
02) =3D=3D ACP_PDM_DMA_EN_STATUS)
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  110  			return 0;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  111  		udelay(DELAY_US);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  112  	}
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  113  	return -ETIMEDOUT;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  114  }
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  115  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  116  static int acp6x_stop_pdm_=
dma(void __iomem *acp_base)
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  117  {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  118  	u32 pdm_enable, pdm_dma_e=
nable;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  119  	int timeout;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  120  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18 @121  	pdm_enable =3D 0x00;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18 @122  	pdm_dma_enable  =3D 0x00;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  123  =

ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  124  	pdm_enable =3D acp6x_read=
l(acp_base + ACP_WOV_PDM_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  125  	pdm_dma_enable =3D acp6x_=
readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  126  	if (pdm_dma_enable & 0x01=
) {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  127  		pdm_dma_enable =3D 0x02;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  128  		acp6x_writel(pdm_dma_ena=
ble, acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  129  		timeout =3D 0;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  130  		while (++timeout < ACP_C=
OUNTER) {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  131  			pdm_dma_enable =3D acp6=
x_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  132  			if ((pdm_dma_enable & 0=
x02) =3D=3D 0x00)
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  133  				break;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  134  			udelay(DELAY_US);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  135  		}
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  136  		if (timeout =3D=3D ACP_C=
OUNTER)
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  137  			return -ETIMEDOUT;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  138  	}
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  139  	if (pdm_enable =3D=3D ACP=
_PDM_ENABLE) {
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  140  		pdm_enable =3D ACP_PDM_D=
ISABLE;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  141  		acp6x_writel(pdm_enable,=
 acp_base + ACP_WOV_PDM_ENABLE);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  142  	}
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  143  	acp6x_writel(0x01, acp_ba=
se + ACP_WOV_PDM_FIFO_FLUSH);
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  144  	return 0;
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  145  }
ceb4fcc13ae581 Vijendar Mukunda 2021-10-18  146  =


:::::: The code@line 54 was first introduced by commit
:::::: ceb4fcc13ae58102ad31aa4071d9e57e57eea3df ASoC: amd: add acp6x pdm dr=
iver dma ops

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2109039706927008608==--

