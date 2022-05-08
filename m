Content-Type: multipart/mixed; boundary="===============5150480144101218059=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/amd/yc/acp6x-pdm-dma.c:54:2: warning: Value stored to 'pdm_ctrl' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 08 May 2022 18:39:27 +0800
Message-ID: <202205081814.DiL0W8Cw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5150480144101218059==
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
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: 89728d97db3f078aceb967ebe5ed2d0797b6a117 ASoC: amd: enable Yellow c=
arp acp6x drivers build
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20220502 (https://download.01.org/0day-ci/ar=
chive/20220508/202205081814.DiL0W8Cw-lkp(a)intel.com/config)
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
   sound/core/info.c:114:3: warning: Value stored to 'offset' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/info.c:114:3: note: Value stored to 'offset' is never read
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
   sound/soc/codecs/lpass-tx-macro.c:771:4: warning: 2nd function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   sound/soc/codecs/lpass-tx-macro.c:736:2: note: 'mic_sel_reg' declared wi=
thout an initial value
           u16 mic_sel_reg;
           ^~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:742:2: note: 'Default' branch taken. E=
xecution continues on line 769
           switch (e->reg) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:769:6: note: Assuming 'val' is not equ=
al to 0
           if (val !=3D 0) {
               ^~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:769:2: note: Taking true branch
           if (val !=3D 0) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:770:7: note: Assuming 'val' is < 5
                   if (val < 5) {
                       ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:770:3: note: Taking true branch
                   if (val < 5) {
                   ^
   sound/soc/codecs/lpass-tx-macro.c:771:4: note: 2nd function call argumen=
t is an uninitialized value
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   sound/soc/codecs/lpass-tx-macro.c:774:4: warning: 2nd function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   sound/soc/codecs/lpass-tx-macro.c:736:2: note: 'mic_sel_reg' declared wi=
thout an initial value
           u16 mic_sel_reg;
           ^~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:742:2: note: 'Default' branch taken. E=
xecution continues on line 769
           switch (e->reg) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:769:6: note: Assuming 'val' is not equ=
al to 0
           if (val !=3D 0) {
               ^~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:769:2: note: Taking true branch
           if (val !=3D 0) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:770:7: note: Assuming 'val' is >=3D 5
                   if (val < 5) {
                       ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:770:3: note: Taking false branch
                   if (val < 5) {
                   ^
   sound/soc/codecs/lpass-tx-macro.c:774:4: note: 2nd function call argumen=
t is an uninitialized value
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/pci/oxygen/oxygen_pcm.c:758:3: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pcm->name, outs ? "Front Panel" : "Analog 2");
                   ^~~~~~
   sound/pci/oxygen/oxygen_pcm.c:758:3: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
                   strcpy(pcm->name, outs ? "Front Panel" : "Analog 2");
                   ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/pci/oxygen/xonar_dg.c:102:13: warning: Value stored to 'data' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dg *data =3D chip->model_data;
                      ^~~~   ~~~~~~~~~~~~~~~~
   sound/pci/oxygen/xonar_dg.c:102:13: note: Value stored to 'data' during =
its initialization is never read
           struct dg *data =3D chip->model_data;
                      ^~~~   ~~~~~~~~~~~~~~~~
   4 warnings generated.
   fs/btrfs/ioctl.c:1426:16: warning: Value stored to 'cluster' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long cluster =3D max_cluster;
                         ^~~~~~~   ~~~~~~~~~~~
   fs/btrfs/ioctl.c:1426:16: note: Value stored to 'cluster' during its ini=
tialization is never read
           unsigned long cluster =3D max_cluster;
                         ^~~~~~~   ~~~~~~~~~~~
   fs/btrfs/ioctl.c:2117:3: warning: Value stored to 'i' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   i =3D nritems;
                   ^   ~~~~~~~
   fs/btrfs/ioctl.c:2117:3: note: Value stored to 'i' is never read
                   i =3D nritems;
                   ^   ~~~~~~~
   fs/btrfs/ioctl.c:2431:3: warning: Value stored to 'dirid' is never read =
[clang-analyzer-deadcode.DeadStores]
                   dirid =3D key.objectid;
                   ^       ~~~~~~~~~~~~
   fs/btrfs/ioctl.c:2431:3: note: Value stored to 'dirid' is never read
                   dirid =3D key.objectid;
                   ^       ~~~~~~~~~~~~
   fs/btrfs/ioctl.c:4682:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(super_block->label, label);
           ^~~~~~
   fs/btrfs/ioctl.c:4682:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(super_block->label, label);
           ^~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/soc/sof/sof-audio.c:874:29: warning: Value stored to 'desc' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct sof_dev_desc *desc =3D sof_pdata->desc;
                                      ^~~~   ~~~~~~~~~~~~~~~
   sound/soc/sof/sof-audio.c:874:29: note: Value stored to 'desc' during it=
s initialization is never read
           const struct sof_dev_desc *desc =3D sof_pdata->desc;
                                      ^~~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
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
   include/linux/etherdevice.h:119:2: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           u32 a =3D *(const u32 *)addr;

vim +/pdm_ctrl +54 sound/soc/amd/yc/acp6x-pdm-dma.c

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   48  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   49  static void acp6x_enable_=
pdm_clock(void __iomem *acp_base)
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   50  {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   51  	u32 pdm_clk_enable, pdm_=
ctrl;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   52  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   53  	pdm_clk_enable =3D ACP_P=
DM_CLK_FREQ_MASK;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  @54  	pdm_ctrl =3D 0x00;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   55  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   56  	acp6x_writel(pdm_clk_ena=
ble, acp_base + ACP_WOV_CLK_CTRL);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   57  	pdm_ctrl =3D acp6x_readl=
(acp_base + ACP_WOV_MISC_CTRL);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   58  	pdm_ctrl |=3D ACP_WOV_MI=
SC_CTRL_MASK;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   59  	acp6x_writel(pdm_ctrl, a=
cp_base + ACP_WOV_MISC_CTRL);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   60  }
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   61  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   62  static void acp6x_enable_=
pdm_interrupts(void __iomem *acp_base)
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   63  {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   64  	u32 ext_int_ctrl;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   65  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   66  	ext_int_ctrl =3D acp6x_r=
eadl(acp_base + ACP_EXTERNAL_INTR_CNTL);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   67  	ext_int_ctrl |=3D PDM_DM=
A_INTR_MASK;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   68  	acp6x_writel(ext_int_ctr=
l, acp_base + ACP_EXTERNAL_INTR_CNTL);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   69  }
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   70  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   71  static void acp6x_disable=
_pdm_interrupts(void __iomem *acp_base)
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   72  {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   73  	u32 ext_int_ctrl;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   74  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   75  	ext_int_ctrl =3D acp6x_r=
eadl(acp_base + ACP_EXTERNAL_INTR_CNTL);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   76  	ext_int_ctrl &=3D ~PDM_D=
MA_INTR_MASK;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   77  	acp6x_writel(ext_int_ctr=
l, acp_base + ACP_EXTERNAL_INTR_CNTL);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   78  }
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   79  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   80  static bool acp6x_check_p=
dm_dma_status(void __iomem *acp_base)
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   81  {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   82  	bool pdm_dma_status;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   83  	u32 pdm_enable, pdm_dma_=
enable;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   84  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   85  	pdm_dma_status =3D false;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   86  	pdm_enable =3D acp6x_rea=
dl(acp_base + ACP_WOV_PDM_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   87  	pdm_dma_enable =3D acp6x=
_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   88  	if ((pdm_enable & ACP_PD=
M_ENABLE) && (pdm_dma_enable & ACP_PDM_DMA_EN_STATUS))
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   89  		pdm_dma_status =3D true;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   90  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   91  	return pdm_dma_status;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   92  }
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   93  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   94  static int acp6x_start_pd=
m_dma(void __iomem *acp_base)
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   95  {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   96  	u32 pdm_enable;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   97  	u32 pdm_dma_enable;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   98  	int timeout;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18   99  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  100  	pdm_enable =3D 0x01;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  101  	pdm_dma_enable  =3D 0x01;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  102  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  103  	acp6x_enable_pdm_clock(a=
cp_base);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  104  	acp6x_writel(pdm_enable,=
 acp_base + ACP_WOV_PDM_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  105  	acp6x_writel(pdm_dma_ena=
ble, acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  106  	timeout =3D 0;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  107  	while (++timeout < ACP_C=
OUNTER) {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  108  		pdm_dma_enable =3D acp6=
x_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  109  		if ((pdm_dma_enable & 0=
x02) =3D=3D ACP_PDM_DMA_EN_STATUS)
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  110  			return 0;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  111  		udelay(DELAY_US);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  112  	}
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  113  	return -ETIMEDOUT;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  114  }
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  115  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  116  static int acp6x_stop_pdm=
_dma(void __iomem *acp_base)
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  117  {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  118  	u32 pdm_enable, pdm_dma_=
enable;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  119  	int timeout;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  120  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18 @121  	pdm_enable =3D 0x00;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18 @122  	pdm_dma_enable  =3D 0x00;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  123  =

ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  124  	pdm_enable =3D acp6x_rea=
dl(acp_base + ACP_WOV_PDM_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  125  	pdm_dma_enable =3D acp6x=
_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  126  	if (pdm_dma_enable & 0x0=
1) {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  127  		pdm_dma_enable =3D 0x02;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  128  		acp6x_writel(pdm_dma_en=
able, acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  129  		timeout =3D 0;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  130  		while (++timeout < ACP_=
COUNTER) {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  131  			pdm_dma_enable =3D acp=
6x_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  132  			if ((pdm_dma_enable & =
0x02) =3D=3D 0x00)
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  133  				break;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  134  			udelay(DELAY_US);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  135  		}
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  136  		if (timeout =3D=3D ACP_=
COUNTER)
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  137  			return -ETIMEDOUT;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  138  	}
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  139  	if (pdm_enable =3D=3D AC=
P_PDM_ENABLE) {
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  140  		pdm_enable =3D ACP_PDM_=
DISABLE;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  141  		acp6x_writel(pdm_enable=
, acp_base + ACP_WOV_PDM_ENABLE);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  142  	}
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  143  	acp6x_writel(0x01, acp_b=
ase + ACP_WOV_PDM_FIFO_FLUSH);
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  144  	return 0;
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  145  }
ceb4fcc13ae5810 Vijendar Mukunda 2021-10-18  146  =


:::::: The code@line 54 was first introduced by commit
:::::: ceb4fcc13ae58102ad31aa4071d9e57e57eea3df ASoC: amd: add acp6x pdm dr=
iver dma ops

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5150480144101218059==--

