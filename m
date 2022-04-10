Content-Type: multipart/mixed; boundary="===============7079624490137454562=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/lpass-cdc-dma.c:274:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 10 Apr 2022 13:57:34 +0800
Message-ID: <202204101322.kzHZodrj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7079624490137454562==
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
head:   e1f700ebd6bea293abe3c7e2807b252018efde01
commit: b62c4e5fba2f910bc9f23ae152d11627e4c2f00f ASoC: qcom: lpass-sc7280: =
Add platform driver for lpass audio
date:   6 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220406 (https://download.01.org/0day-ci/archi=
ve/20220410/202204101322.kzHZodrj-lkp(a)intel.com/config)
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
   sound/soc/sh/rcar/rsnd.h:529:33: note: expanded from macro 'rsnd_io_to_r=
untime'
   #define rsnd_io_to_runtime(io) ((io)->substream ? \
                                   ^~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:933:36: note: '?' condition is false
           struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
                                             ^
   sound/soc/sh/rcar/rsnd.h:529:33: note: expanded from macro 'rsnd_io_to_r=
untime'
   #define rsnd_io_to_runtime(io) ((io)->substream ? \
                                   ^
   sound/soc/sh/rcar/ssi.c:933:2: note: 'runtime' initialized to a null poi=
nter value
           struct snd_pcm_runtime *runtime =3D rsnd_io_to_runtime(io);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sh/rcar/ssi.c:935:38: note: Left side of '||' is false
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   sound/soc/sh/rcar/ssi.c:935:38: note: Left side of '||' is false
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   sound/soc/sh/rcar/ssi.c:935:38: note: Left side of '||' is true
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   sound/soc/sh/rcar/ssi.c:935:38: note: Taking false branch
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/soc/sh/rcar/ssi.c:935:38: note: Loop condition is false.  Exiting =
loop
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                               ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/soc/sh/rcar/ssi.c:935:29: note: Passing null pointer value via 1st=
 parameter 'runtime'
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                                      ^~~~~~~
   sound/soc/sh/rcar/ssi.c:935:13: note: Calling 'bytes_to_frames'
           *pointer =3D bytes_to_frames(runtime, READ_ONCE(ssi->byte_pos));
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/pcm.h:686:20: note: Access to field 'frame_bits' results i=
n a dereference of a null pointer (loaded from variable 'runtime')
           return size * 8 / runtime->frame_bits;
                             ^~~~~~~
   sound/soc/sh/rcar/ssi.c:365:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
   sound/soc/sh/rcar/ssi.c:365:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D rsnd_priv_to_dev(priv);
                          ^~~
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
   fs/ntfs3/xattr.c:966:3: warning: 2nd function call argument is an uninit=
ialized value [clang-analyzer-core.CallAndMessage]
                   i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:960:6: note: Calling 'ntfs_get_ea'
           if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:209:6: note: Assuming the condition is false
           if (!(ni->ni_flags & NI_FLAG_EA))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:209:2: note: Taking false branch
           if (!(ni->ni_flags & NI_FLAG_EA))
           ^
   fs/ntfs3/xattr.c:212:7: note: 'required' is non-null
           if (!required)
                ^~~~~~~~
   fs/ntfs3/xattr.c:212:2: note: Taking false branch
           if (!required)
           ^
   fs/ntfs3/xattr.c:217:6: note: 'name_len' is <=3D 255
           if (name_len > 255) {
               ^~~~~~~~
   fs/ntfs3/xattr.c:217:2: note: Taking false branch
           if (name_len > 255) {
           ^
   fs/ntfs3/xattr.c:223:6: note: 'err' is not equal to 0
           if (err)
               ^~~
   fs/ntfs3/xattr.c:223:2: note: Taking true branch
           if (err)
           ^
   fs/ntfs3/xattr.c:224:3: note: Control jumps to line 253
                   goto out;
                   ^
   fs/ntfs3/xattr.c:254:7: note: 'required' is non-null
           if (!required)
                ^~~~~~~~
   fs/ntfs3/xattr.c:254:2: note: Taking false branch
           if (!required)
           ^
   fs/ntfs3/xattr.c:257:9: note: 'err' is not equal to 0
           return err ? err : len;
                  ^~~
   fs/ntfs3/xattr.c:257:9: note: '?' condition is true
   fs/ntfs3/xattr.c:257:2: note: Returning without writing to '*buffer'
           return err ? err : len;
           ^
   fs/ntfs3/xattr.c:960:6: note: Returning from 'ntfs_get_ea'
           if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:960:6: note: Assuming the condition is true
           if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:960:6: note: Left side of '&&' is true
   fs/ntfs3/xattr.c:962:6: note: Assuming the condition is true
               ntfs_get_ea(inode, "$LXGID", sizeof("$LXGID") - 1, &value[1],

vim +274 sound/soc/qcom/lpass-cdc-dma.c

b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  256  =

b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  257  static int lpass_cd=
c_dma_daiops_trigger(struct snd_pcm_substream *substream,
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  258  				    int cmd, st=
ruct snd_soc_dai *dai)
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  259  {
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  260  	struct snd_soc_pcm=
_runtime *soc_runtime =3D asoc_substream_to_rtd(substream);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  261  	struct lpaif_dmact=
l *dmactl;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  262  	int ret =3D 0, id;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  263  =

b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  264  	switch (cmd) {
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  265  	case SNDRV_PCM_TRI=
GGER_START:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  266  	case SNDRV_PCM_TRI=
GGER_RESUME:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  267  	case SNDRV_PCM_TRI=
GGER_PAUSE_RELEASE:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  268  		__lpass_platform_=
codec_intf_init(dai, substream);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  269  		break;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  270  	case SNDRV_PCM_TRI=
GGER_STOP:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  271  	case SNDRV_PCM_TRI=
GGER_SUSPEND:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  272  	case SNDRV_PCM_TRI=
GGER_PAUSE_PUSH:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  273  		__lpass_get_dmact=
l_handle(substream, dai, &dmactl, &id);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24 @274  		if (!dmactl)
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  275  			return -EINVAL;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  276  =

b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  277  		ret =3D regmap_fi=
elds_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  278  		if (ret) {
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  279  			dev_err(soc_runt=
ime->dev,
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  280  				"error writing =
to dmactl codec_enable reg: %d\n", ret);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  281  			return ret;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  282  		}
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  283  		break;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  284  	default:
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  285  		ret =3D -EINVAL;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  286  		dev_err(soc_runti=
me->dev, "%s: invalid %d interface\n", __func__, cmd);
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  287  		break;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  288  	}
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  289  	return ret;
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  290  }
b81af585ea54ee Srinivasa Rao Mandadapu 2022-02-24  291  =


:::::: The code at line 274 was first introduced by commit
:::::: b81af585ea54ee9f749391e594ee9cbd44061eae ASoC: qcom: Add lpass CPU d=
river for codec dma control

:::::: TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7079624490137454562==--

