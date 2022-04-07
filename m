Content-Type: multipart/mixed; boundary="===============6338692407825622389=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/lpass-cdc-dma.c:274:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Thu, 07 Apr 2022 20:30:09 +0800
Message-ID: <202204072046.fGtVLP42-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6338692407825622389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
CC: Mark Brown <broonie@kernel.org>
CC: Venkata Prasad Potturu <quic_potturu@quicinc.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: b62c4e5fba2f910bc9f23ae152d11627e4c2f00f ASoC: qcom: lpass-sc7280: =
Add platform driver for lpass audio
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220406 (https://download.01.org/0day-ci/archi=
ve/20220407/202204072046.fGtVLP42-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db62c4e5fba2f910bc9f23ae152d11627e4c2f00f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b62c4e5fba2f910bc9f23ae152d11627e4c2f00f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/fsi/fsi-scom.c:219:6: note: Assuming the condition is true
           if (addr & XSCOM_ADDR_IND_FLAG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:219:2: note: Taking true branch
           if (addr & XSCOM_ADDR_IND_FLAG) {
           ^
   drivers/fsi/fsi-scom.c:220:7: note: Assuming the condition is true
                   if (addr & XSCOM_ADDR_INF_FORM1)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:220:3: note: Taking true branch
                   if (addr & XSCOM_ADDR_INF_FORM1)
                   ^
   drivers/fsi/fsi-scom.c:221:11: note: Calling 'put_indirect_scom_form1'
                           return put_indirect_scom_form1(scom, value, addr=
, status);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/fsi/fsi-scom.c:179:6: note: Assuming the condition is true
           if (value & ~XSCOM_DATA_IND_FORM1_DATA)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:179:2: note: Taking true branch
           if (value & ~XSCOM_DATA_IND_FORM1_DATA)
           ^
   drivers/fsi/fsi-scom.c:180:3: note: Returning without writing to '*statu=
s'
                   return -EINVAL;
                   ^
   drivers/fsi/fsi-scom.c:221:11: note: Returning from 'put_indirect_scom_f=
orm1'
                           return put_indirect_scom_form1(scom, value, addr=
, status);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/fsi/fsi-scom.c:221:4: note: Returning without writing to '*statu=
s'
                           return put_indirect_scom_form1(scom, value, addr=
, status);
                           ^
   drivers/fsi/fsi-scom.c:291:7: note: Returning from 'raw_put_scom'
           rc =3D raw_put_scom(scom, value, addr, &status);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:292:2: note: Taking false branch
           if (rc =3D=3D -ENODEV)
           ^
   drivers/fsi/fsi-scom.c:295:7: note: 2nd function call argument is an uni=
nitialized value
           rc =3D handle_fsi2pib_status(scom, status);
                ^                           ~~~~~~
   drivers/fsi/fsi-scom.c:314:7: warning: 2nd function call argument is an =
uninitialized value [clang-analyzer-core.CallAndMessage]
           rc =3D handle_fsi2pib_status(scom, status);
                ^
   drivers/fsi/fsi-scom.c:331:6: note: Assuming the condition is false
           if (len !=3D sizeof(uint64_t))
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:331:2: note: Taking false branch
           if (len !=3D sizeof(uint64_t))
           ^
   drivers/fsi/fsi-scom.c:335:6: note: Assuming field 'dead' is false
           if (scom->dead)
               ^~~~~~~~~~
   drivers/fsi/fsi-scom.c:335:2: note: Taking false branch
           if (scom->dead)
           ^
   drivers/fsi/fsi-scom.c:338:8: note: Calling 'get_scom'
                   rc =3D get_scom(scom, &val, *offset);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:307:2: note: 'status' declared without an initial=
 value
           uint32_t status;
           ^~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:310:7: note: Calling 'raw_get_scom'
           rc =3D raw_get_scom(scom, value, addr, &status);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:231:6: note: Assuming the condition is true
           if (addr & XSCOM_ADDR_IND_FLAG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:231:2: note: Taking true branch
           if (addr & XSCOM_ADDR_IND_FLAG) {
           ^
   drivers/fsi/fsi-scom.c:232:7: note: Assuming the condition is true
                   if (addr & XSCOM_ADDR_INF_FORM1)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:232:3: note: Taking true branch
                   if (addr & XSCOM_ADDR_INF_FORM1)
                   ^
   drivers/fsi/fsi-scom.c:233:4: note: Returning without writing to '*statu=
s'
                           return -ENXIO;
                           ^
   drivers/fsi/fsi-scom.c:310:7: note: Returning from 'raw_get_scom'
           rc =3D raw_get_scom(scom, value, addr, &status);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:311:2: note: Taking false branch
           if (rc =3D=3D -ENODEV)
           ^
   drivers/fsi/fsi-scom.c:314:7: note: 2nd function call argument is an uni=
nitialized value
           rc =3D handle_fsi2pib_status(scom, status);
                ^                           ~~~~~~
   drivers/fsi/fsi-scom.c:327:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &scom->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:327:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D &scom->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:357:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &scom->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:357:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D &scom->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> sound/soc/qcom/lpass-cdc-dma.c:274:7: warning: Branch condition evaluate=
s to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (!dmactl)
                       ^~~~~~~
   sound/soc/qcom/lpass-cdc-dma.c:261:2: note: 'dmactl' declared without an=
 initial value
           struct lpaif_dmactl *dmactl;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass-cdc-dma.c:264:2: note: Control jumps to 'case 3:'  =
at line 272
           switch (cmd) {
           ^
   sound/soc/qcom/lpass-cdc-dma.c:273:3: note: Calling '__lpass_get_dmactl_=
handle'
                   __lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass-cdc-dma.c:43:2: note: Control jumps to the 'default=
' case at line 56
           switch (dai_id) {
           ^
   sound/soc/qcom/lpass-cdc-dma.c:57:3: note: Loop condition is false.  Exi=
ting loop
                   dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %=
d\n", dai_id);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   sound/soc/qcom/lpass-cdc-dma.c:58:3: note:  Execution continues on line =
57
                   break;
                   ^
   sound/soc/qcom/lpass-cdc-dma.c:60:1: note: Returning without writing to =
'*dmactl'
   }
   ^
   sound/soc/qcom/lpass-cdc-dma.c:273:3: note: Returning from '__lpass_get_=
dmactl_handle'
                   __lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/lpass-cdc-dma.c:274:7: note: Branch condition evaluates t=
o a garbage value
                   if (!dmactl)
                       ^~~~~~~
   1 warning generated.
   fs/xfs/libxfs/xfs_rmap.c:244:2: warning: 4th function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           xfs_warn(mp,
           ^
   fs/xfs/libxfs/xfs_rmap.c:2677:9: note: Assuming the condition is false
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
                  ^
   fs/xfs/libxfs/xfs_format.h:1433:43: note: expanded from macro 'XFS_RMAP_=
NON_INODE_OWNER'
   #define XFS_RMAP_NON_INODE_OWNER(owner) (!!((owner) & (1ULL << 63)))
                                             ^
   fs/xfs/xfs_linux.h:208:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_rmap.c:2677:41: note: Left side of '||' is true
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
                                                  ^
   fs/xfs/libxfs/xfs_rmap.c:2677:2: note: '?' condition is true
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
           ^
   fs/xfs/xfs_linux.h:208:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_rmap.c:2682:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_rmap.c:2682:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_rmap.c:2684:6: note: Assuming 'has_record' is not equa=
l to 0
           if (!has_record) {
               ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:2684:2: note: Taking false branch
           if (!has_record) {
           ^
   fs/xfs/libxfs/xfs_rmap.c:2689:10: note: Calling 'xfs_rmap_get_rec'
           error =3D xfs_rmap_get_rec(cur, &irec, &has_record);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:6: note: Assuming 'error' is 0
           if (error || !*stat)
               ^~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_rmap.c:209:15: note: Assuming the condition is false
           if (error || !*stat)
                        ^~~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:2: note: Taking false branch
           if (error || !*stat)
           ^
   fs/xfs/libxfs/xfs_rmap.c:212:6: note: Calling 'xfs_rmap_btrec_to_irec'
           if (xfs_rmap_btrec_to_irec(rec, irec))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +274 sound/soc/qcom/lpass-cdc-dma.c

b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  256  =

b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  257  static int lpass_c=
dc_dma_daiops_trigger(struct snd_pcm_substream *substream,
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  258  				    int cmd, s=
truct snd_soc_dai *dai)
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  259  {
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  260  	struct snd_soc_pc=
m_runtime *soc_runtime =3D asoc_substream_to_rtd(substream);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  261  	struct lpaif_dmac=
tl *dmactl;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  262  	int ret =3D 0, id;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  263  =

b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  264  	switch (cmd) {
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  265  	case SNDRV_PCM_TR=
IGGER_START:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  266  	case SNDRV_PCM_TR=
IGGER_RESUME:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  267  	case SNDRV_PCM_TR=
IGGER_PAUSE_RELEASE:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  268  		__lpass_platform=
_codec_intf_init(dai, substream);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  269  		break;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  270  	case SNDRV_PCM_TR=
IGGER_STOP:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  271  	case SNDRV_PCM_TR=
IGGER_SUSPEND:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  272  	case SNDRV_PCM_TR=
IGGER_PAUSE_PUSH:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  273  		__lpass_get_dmac=
tl_handle(substream, dai, &dmactl, &id);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24 @274  		if (!dmactl)
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  275  			return -EINVAL;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  276  =

b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  277  		ret =3D regmap_f=
ields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  278  		if (ret) {
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  279  			dev_err(soc_run=
time->dev,
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  280  				"error writing=
 to dmactl codec_enable reg: %d\n", ret);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  281  			return ret;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  282  		}
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  283  		break;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  284  	default:
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  285  		ret =3D -EINVAL;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  286  		dev_err(soc_runt=
ime->dev, "%s: invalid %d interface\n", __func__, cmd);
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  287  		break;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  288  	}
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  289  	return ret;
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  290  }
b81af585ea54ee9 Srinivasa Rao Mandadapu 2022-02-24  291  =


:::::: The code at line 274 was first introduced by commit
:::::: b81af585ea54ee9f749391e594ee9cbd44061eae ASoC: qcom: Add lpass CPU d=
river for codec dma control

:::::: TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6338692407825622389==--

