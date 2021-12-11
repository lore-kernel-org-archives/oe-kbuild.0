Content-Type: multipart/mixed; boundary="===============4491440428203915548=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 1438/2818] sound/soc/amd/renoir/rn-pci-acp3x.c:181:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 12 Dec 2021 04:01:12 +0800
Message-ID: <202112120339.YOUNwU7y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4491440428203915548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   b4852fbf90916fdc2f1e0e282e100f7e0e889d77
commit: 2dce795e59f452c6e526029669aa2c269bb99dfc [1438/2818] CHROMIUM: ASoC=
: amd: acp driver changes to support I2S and dmic
:::::: branch date: 13 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-c001-20211210 (https://download.01.org/0day-ci/arch=
ive/20211212/202112120339.YOUNwU7y-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 2dce795e59f452c6e526029669aa2c269bb99dfc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/md/persistent-data/dm-btree.c:406:8: warning: Assigned value is =
garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   root =3D le64_to_cpu(internal_value_le);
                        ^
   drivers/md/persistent-data/dm-btree.c:375:2: note: 'internal_value_le' d=
eclared without an initial value
           __le64 internal_value_le;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:379:18: note: Assuming 'level' is =
< field 'levels'
           for (level =3D 0; level < info->levels; level++) {
                           ^~~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:379:2: note: Loop condition is tru=
e.  Entering loop body
           for (level =3D 0; level < info->levels; level++) {
           ^
   drivers/md/persistent-data/dm-btree.c:383:7: note: Assuming 'level' is e=
qual to 'last_level'
                   if (level =3D=3D last_level) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:383:3: note: Taking true branch
                   if (level =3D=3D last_level) {
                   ^
   drivers/md/persistent-data/dm-btree.c:396:7: note: Assuming 'r' is 0
                   if (!r) {
                       ^~
   drivers/md/persistent-data/dm-btree.c:396:3: note: Taking true branch
                   if (!r) {
                   ^
   drivers/md/persistent-data/dm-btree.c:397:8: note: Assuming the conditio=
n is false
                           if (rkey !=3D keys[level]) {
                               ^~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:397:4: note: Taking false branch
                           if (rkey !=3D keys[level]) {
                           ^
   drivers/md/persistent-data/dm-btree.c:406:8: note: Assigned value is gar=
bage or undefined
                   root =3D le64_to_cpu(internal_value_le);
                        ^
   drivers/md/persistent-data/dm-btree.c:1091:3: warning: Value stored to '=
node' is never read [clang-analyzer-deadcode.DeadStores]
                   node =3D dm_block_data(shadow_current(s));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:1091:3: note: Value stored to 'nod=
e' is never read
                   node =3D dm_block_data(shadow_current(s));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:1155:3: warning: Value stored to '=
node' is never read [clang-analyzer-deadcode.DeadStores]
                   node =3D dm_block_data(shadow_current(s));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/persistent-data/dm-btree.c:1155:3: note: Value stored to 'nod=
e' is never read
                   node =3D dm_block_data(shadow_current(s));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings generated.
   sound/soc/generic/audio-graph-card.c:367:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:367:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> sound/soc/amd/renoir/rn-pci-acp3x.c:181:2: warning: Value stored to 'err=
' is never read [clang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   sound/soc/amd/renoir/rn-pci-acp3x.c:181:2: note: Value stored to 'err' i=
s never read
           err =3D 0;
           ^     ~
   sound/soc/amd/renoir/rn-pci-acp3x.c:225:3: warning: Value stored to 'err=
' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D rn_readl(adata->acp_base + ACP_SW_I2S_ERROR_REAS=
ON);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/amd/renoir/rn-pci-acp3x.c:225:3: note: Value stored to 'err' i=
s never read
                   err =3D rn_readl(adata->acp_base + ACP_SW_I2S_ERROR_REAS=
ON);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/soc/fsl/fsl_sai.c:63:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &sai->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_sai.c:63:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D &sai->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/cifs/transport.c:557:4: warning: Value stored to 'scredits' is never =
read [clang-analyzer-deadcode.DeadStores]
                           scredits =3D *credits;
                           ^          ~~~~~~~~
   fs/cifs/transport.c:557:4: note: Value stored to 'scredits' is never read
                           scredits =3D *credits;
                           ^          ~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/cifs/ioctl.c:334:4: warning: Value stored to 'caps' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           caps =3D le64_to_cpu(tcon->fsUnixInfo.Capability=
);
                           ^
   fs/cifs/ioctl.c:334:4: note: Value stored to 'caps' is never read
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).

vim +/err +181 sound/soc/amd/renoir/rn-pci-acp3x.c

85ded495640e63 Vijendar Mukunda 2020-05-19  164  =

2dce795e59f452 Vijendar Mukunda 2021-04-15  165  static irqreturn_t acp_irq=
_handler(int irq, void *dev_id)
718c406e1ffaca Jaroslav Kysela  2020-12-08  166  {
2dce795e59f452 Vijendar Mukunda 2021-04-15  167  	struct acp_dev_data *adat=
a;
2dce795e59f452 Vijendar Mukunda 2021-04-15  168  	struct i2s_dev_data *rn_i=
2s_data;
2dce795e59f452 Vijendar Mukunda 2021-04-15  169  	struct pdm_dev_data *rn_p=
dm_data;
2dce795e59f452 Vijendar Mukunda 2021-04-15  170  	u16 play_flag, cap_flag, =
err_flag;
2dce795e59f452 Vijendar Mukunda 2021-04-15  171  	u32 val;
2dce795e59f452 Vijendar Mukunda 2021-04-15  172  	u32 err;
2dce795e59f452 Vijendar Mukunda 2021-04-15  173  =

2dce795e59f452 Vijendar Mukunda 2021-04-15  174  	adata =3D dev_id;
2dce795e59f452 Vijendar Mukunda 2021-04-15  175  	if (!adata)
2dce795e59f452 Vijendar Mukunda 2021-04-15  176  		return IRQ_NONE;
2dce795e59f452 Vijendar Mukunda 2021-04-15  177  =

2dce795e59f452 Vijendar Mukunda 2021-04-15  178  	play_flag =3D 0;
2dce795e59f452 Vijendar Mukunda 2021-04-15  179  	cap_flag =3D 0;
2dce795e59f452 Vijendar Mukunda 2021-04-15  180  	err_flag =3D 0;
2dce795e59f452 Vijendar Mukunda 2021-04-15 @181  	err =3D 0;
2dce795e59f452 Vijendar Mukunda 2021-04-15  182  	val =3D rn_readl(adata->a=
cp_base + ACP_EXTERNAL_INTR_STAT);
2dce795e59f452 Vijendar Mukunda 2021-04-15  183  	if (val & BIT(BT_TX_THRES=
HOLD)) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  184  		rn_i2s_data =3D dev_get_=
drvdata(&adata->pdev[0]->dev);
2dce795e59f452 Vijendar Mukunda 2021-04-15  185  		rn_writel(BIT(BT_TX_THRE=
SHOLD), adata->acp_base +
2dce795e59f452 Vijendar Mukunda 2021-04-15  186  			  ACP_EXTERNAL_INTR_STA=
T);
2dce795e59f452 Vijendar Mukunda 2021-04-15  187  		if (rn_i2s_data->play_st=
ream)
2dce795e59f452 Vijendar Mukunda 2021-04-15  188  			snd_pcm_period_elapsed(=
rn_i2s_data->play_stream);
2dce795e59f452 Vijendar Mukunda 2021-04-15  189  		play_flag =3D 1;
2dce795e59f452 Vijendar Mukunda 2021-04-15  190  	}
2dce795e59f452 Vijendar Mukunda 2021-04-15  191  	if (val & BIT(I2S_TX_THRE=
SHOLD)) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  192  		rn_i2s_data =3D dev_get_=
drvdata(&adata->pdev[0]->dev);
2dce795e59f452 Vijendar Mukunda 2021-04-15  193  		rn_writel(BIT(I2S_TX_THR=
ESHOLD),
2dce795e59f452 Vijendar Mukunda 2021-04-15  194  			  adata->acp_base + ACP=
_EXTERNAL_INTR_STAT);
2dce795e59f452 Vijendar Mukunda 2021-04-15  195  		if (rn_i2s_data->i2ssp_p=
lay_stream)
2dce795e59f452 Vijendar Mukunda 2021-04-15  196  			snd_pcm_period_elapsed(=
rn_i2s_data->i2ssp_play_stream);
2dce795e59f452 Vijendar Mukunda 2021-04-15  197  		play_flag =3D 1;
2dce795e59f452 Vijendar Mukunda 2021-04-15  198  	}
2dce795e59f452 Vijendar Mukunda 2021-04-15  199  =

2dce795e59f452 Vijendar Mukunda 2021-04-15  200  	if (val & BIT(BT_RX_THRES=
HOLD)) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  201  		rn_i2s_data =3D dev_get_=
drvdata(&adata->pdev[0]->dev);
2dce795e59f452 Vijendar Mukunda 2021-04-15  202  		rn_writel(BIT(BT_RX_THRE=
SHOLD), adata->acp_base +
2dce795e59f452 Vijendar Mukunda 2021-04-15  203  			  ACP_EXTERNAL_INTR_STA=
T);
2dce795e59f452 Vijendar Mukunda 2021-04-15  204  		if (rn_i2s_data->capture=
_stream)
2dce795e59f452 Vijendar Mukunda 2021-04-15  205  			snd_pcm_period_elapsed(=
rn_i2s_data->capture_stream);
2dce795e59f452 Vijendar Mukunda 2021-04-15  206  		cap_flag =3D 1;
2dce795e59f452 Vijendar Mukunda 2021-04-15  207  	}
2dce795e59f452 Vijendar Mukunda 2021-04-15  208  	if (val & BIT(I2S_RX_THRE=
SHOLD)) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  209  		rn_i2s_data =3D dev_get_=
drvdata(&adata->pdev[0]->dev);
2dce795e59f452 Vijendar Mukunda 2021-04-15  210  		rn_writel(BIT(I2S_RX_THR=
ESHOLD),
2dce795e59f452 Vijendar Mukunda 2021-04-15  211  			  adata->acp_base + ACP=
_EXTERNAL_INTR_STAT);
2dce795e59f452 Vijendar Mukunda 2021-04-15  212  		if (rn_i2s_data->i2ssp_c=
apture_stream)
2dce795e59f452 Vijendar Mukunda 2021-04-15  213  			snd_pcm_period_elapsed(=
rn_i2s_data->i2ssp_capture_stream);
2dce795e59f452 Vijendar Mukunda 2021-04-15  214  		cap_flag =3D 1;
2dce795e59f452 Vijendar Mukunda 2021-04-15  215  	}
2dce795e59f452 Vijendar Mukunda 2021-04-15  216  	if (val & BIT(PDM_DMA_STA=
T)) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  217  		rn_pdm_data =3D dev_get_=
drvdata(&adata->pdev[1]->dev);
2dce795e59f452 Vijendar Mukunda 2021-04-15  218  		rn_writel(BIT(PDM_DMA_ST=
AT), adata->acp_base +
2dce795e59f452 Vijendar Mukunda 2021-04-15  219  			  ACP_EXTERNAL_INTR_STA=
T);
2dce795e59f452 Vijendar Mukunda 2021-04-15  220  		if (rn_pdm_data->capture=
_stream)
2dce795e59f452 Vijendar Mukunda 2021-04-15  221  			snd_pcm_period_elapsed(=
rn_pdm_data->capture_stream);
2dce795e59f452 Vijendar Mukunda 2021-04-15  222  		cap_flag =3D 1;
718c406e1ffaca Jaroslav Kysela  2020-12-08  223  	}
2dce795e59f452 Vijendar Mukunda 2021-04-15  224  	if (val & BIT(29)) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  225  		err =3D rn_readl(adata->=
acp_base + ACP_SW_I2S_ERROR_REASON);
2dce795e59f452 Vijendar Mukunda 2021-04-15  226  		rn_writel(BIT(29), adata=
->acp_base + ACP_EXTERNAL_INTR_STAT);
2dce795e59f452 Vijendar Mukunda 2021-04-15  227  		err_flag =3D 1;
275565997ade6f Jaroslav Kysela  2020-12-27  228  	}
2dce795e59f452 Vijendar Mukunda 2021-04-15  229  	if (play_flag | cap_flag =
| err_flag)
2dce795e59f452 Vijendar Mukunda 2021-04-15  230  		return IRQ_HANDLED;
2dce795e59f452 Vijendar Mukunda 2021-04-15  231  	else
2dce795e59f452 Vijendar Mukunda 2021-04-15  232  		return IRQ_NONE;
1f092d1c881967 Jaroslav Kysela  2020-12-27  233  }
718c406e1ffaca Jaroslav Kysela  2020-12-08  234  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4491440428203915548==--

