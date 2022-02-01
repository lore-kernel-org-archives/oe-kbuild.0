Content-Type: multipart/mixed; boundary="===============6838573965168577354=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/sof/intel/hda-ipc.c:150:3: warning: Value stored to 'msg_ext' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 02 Feb 2022 07:55:51 +0800
Message-ID: <202202020733.Npgk5OGk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6838573965168577354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Takashi Iwai <tiwai@suse.de>
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>
CC: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
CC: Bard Liao <bard.liao@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 8d4ba1be3d2257606e04aff412829d8972670750 ASoC: SOF: pci: split PCI =
into different drivers
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20220131 (https://download.01.org/0day-ci/arc=
hive/20220202/202202020733.Npgk5OGk-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbac=
a3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8d4ba1be3d2257606e04aff412829d8972670750
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8d4ba1be3d2257606e04aff412829d8972670750
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   sound/core/seq/seq_prioq.c:292:16: note: Access to field 'next' results =
in a dereference of a null pointer (loaded from variable 'prev')
                                   prev->next =3D cell->next;
                                   ~~~~       ^
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
   sound/soc/xtensa/xtfpga-i2s.c:285:11: warning: Value stored to 'channels=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           unsigned channels =3D params_channels(params);
                    ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/xtensa/xtfpga-i2s.c:285:11: note: Value stored to 'channels' d=
uring its initialization is never read
           unsigned channels =3D params_channels(params);
                    ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/hda/hdmi_chmap.c:331:3: warning: Value stored to 'channel' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   channel =3D chmap->ops.pin_get_slot_channel(
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/hda/hdmi_chmap.c:331:3: note: Value stored to 'channel' is never r=
ead
                   channel =3D chmap->ops.pin_get_slot_channel(
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   5 warnings generated.
   sound/soc/generic/audio-graph-card.c:618:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:618:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:634:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:634:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:653:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:653:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
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
   sound/soc/bcm/bcm2835-i2s.c:356:2: warning: Value stored to 'data_delay'=
 is never read [clang-analyzer-deadcode.DeadStores]
           data_delay =3D 0;
           ^            ~
   sound/soc/bcm/bcm2835-i2s.c:356:2: note: Value stored to 'data_delay' is=
 never read
           data_delay =3D 0;
           ^            ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> sound/soc/sof/intel/hda-ipc.c:150:3: warning: Value stored to 'msg_ext' =
is never read [clang-analyzer-deadcode.DeadStores]
                   msg_ext =3D hipcie & HDA_DSP_REG_HIPCIE_MSG_MASK;
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/intel/hda-ipc.c:150:3: note: Value stored to 'msg_ext' is =
never read
                   msg_ext =3D hipcie & HDA_DSP_REG_HIPCIE_MSG_MASK;
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/intel/hda-ipc.c:187:3: warning: Value stored to 'msg' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   msg =3D hipct & HDA_DSP_REG_HIPCT_MSG_MASK;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/intel/hda-ipc.c:187:3: note: Value stored to 'msg' is neve=
r read
                   msg =3D hipct & HDA_DSP_REG_HIPCT_MSG_MASK;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> sound/soc/sof/intel/hda-dai.c:265:22: warning: Value stored to 'sdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_sof_dev *sdev =3D
                               ^~~~
   sound/soc/sof/intel/hda-dai.c:265:22: note: Value stored to 'sdev' durin=
g its initialization is never read
           struct snd_sof_dev *sdev =3D
                               ^~~~
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
>> sound/soc/sof/intel/cnl.c:50:3: warning: Value stored to 'msg_ext' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   msg_ext =3D hipci & CNL_DSP_REG_HIPCIDR_MSG_MASK;
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/intel/cnl.c:50:3: note: Value stored to 'msg_ext' is never=
 read
                   msg_ext =3D hipci & CNL_DSP_REG_HIPCIDR_MSG_MASK;
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/intel/cnl.c:77:3: warning: Value stored to 'msg' is never =
read [clang-analyzer-deadcode.DeadStores]
                   msg =3D hipctdr & CNL_DSP_REG_HIPCTDR_MSG_MASK;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/intel/cnl.c:77:3: note: Value stored to 'msg' is never read
                   msg =3D hipctdr & CNL_DSP_REG_HIPCTDR_MSG_MASK;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   sound/soc/codecs/wm8903.c:434:3: warning: Value stored to 'best' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8903.c:434:3: note: Value stored to 'best' is never r=
ead
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8903.c:1552:2: warning: Value stored to 'best_val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           best_val =3D ((clk_sys * 10) / bclk_divs[0].ratio) - bclk;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8903.c:1552:2: note: Value stored to 'best_val' is ne=
ver read
           best_val =3D ((clk_sys * 10) / bclk_divs[0].ratio) - bclk;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8903.c:1559:3: warning: Value stored to 'best_val' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   best_val =3D cur_val;
                   ^          ~~~~~~~
   sound/soc/codecs/wm8903.c:1559:3: note: Value stored to 'best_val' is ne=
ver read
                   best_val =3D cur_val;
                   ^          ~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/soc/codecs/wm8960.c:508:18: warning: Access to field 'lout1' resul=
ts in a dereference of a null pointer (loaded from variable 'wm8960') [clan=
g-analyzer-core.NullDereference]
                           wm8960->lout1 =3D w;
                                         ^
   sound/soc/codecs/wm8960.c:1349:6: note: Assuming field 'capless' is false
           if (pdata->capless)
               ^~~~~~~~~~~~~~
   sound/soc/codecs/wm8960.c:1349:2: note: Taking false branch
           if (pdata->capless)
           ^
   sound/soc/codecs/wm8960.c:1356:2: note: Calling 'wm8960_add_widgets'
           wm8960_add_widgets(component);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8960.c:472:2: note: 'wm8960' initialized here
           struct wm8960_priv *wm8960 =3D snd_soc_component_get_drvdata(com=
ponent);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8960.c:485:6: note: Assuming 'pdata' is null
           if (pdata && pdata->capless) {
               ^~~~~
   sound/soc/codecs/wm8960.c:485:12: note: Left side of '&&' is false
           if (pdata && pdata->capless) {
                     ^
   sound/soc/codecs/wm8960.c:504:2: note: Left side of '&&' is false
           list_for_each_entry(w, &component->card->widgets, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/soc/codecs/wm8960.c:504:2: note: Taking false branch
           list_for_each_entry(w, &component->card->widgets, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/soc/codecs/wm8960.c:504:2: note: Loop condition is false.  Exiting=
 loop
           list_for_each_entry(w, &component->card->widgets, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'

vim +/msg_ext +150 sound/soc/sof/intel/hda-ipc.c

6e9cde974863dc Liam Girdwood         2019-04-12  127  =

6e9cde974863dc Liam Girdwood         2019-04-12  128  /* IPC handler thread=
 */
6e9cde974863dc Liam Girdwood         2019-04-12  129  irqreturn_t hda_dsp_i=
pc_irq_thread(int irq, void *context)
6e9cde974863dc Liam Girdwood         2019-04-12  130  {
6e9cde974863dc Liam Girdwood         2019-04-12  131  	struct snd_sof_dev *=
sdev =3D context;
6e9cde974863dc Liam Girdwood         2019-04-12  132  	u32 hipci;
6e9cde974863dc Liam Girdwood         2019-04-12  133  	u32 hipcie;
6e9cde974863dc Liam Girdwood         2019-04-12  134  	u32 hipct;
6e9cde974863dc Liam Girdwood         2019-04-12  135  	u32 hipcte;
6e9cde974863dc Liam Girdwood         2019-04-12  136  	u32 msg;
6e9cde974863dc Liam Girdwood         2019-04-12  137  	u32 msg_ext;
66e65339b824a5 Pierre-Louis Bossart  2019-06-03  138  	bool ipc_irq =3D fal=
se;
6e9cde974863dc Liam Girdwood         2019-04-12  139  =

6e9cde974863dc Liam Girdwood         2019-04-12  140  	/* read IPC status */
6e9cde974863dc Liam Girdwood         2019-04-12  141  	hipcie =3D snd_sof_d=
sp_read(sdev, HDA_DSP_BAR,
6e9cde974863dc Liam Girdwood         2019-04-12  142  				  HDA_DSP_REG_HIP=
CIE);
6e9cde974863dc Liam Girdwood         2019-04-12  143  	hipct =3D snd_sof_ds=
p_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
5dbeb828742198 Pierre-Louis Bossart  2019-06-03  144  	hipci =3D snd_sof_ds=
p_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI);
5dbeb828742198 Pierre-Louis Bossart  2019-06-03  145  	hipcte =3D snd_sof_d=
sp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCTE);
6e9cde974863dc Liam Girdwood         2019-04-12  146  =

6e9cde974863dc Liam Girdwood         2019-04-12  147  	/* is this a reply m=
essage from the DSP */
09a173a63fbb89 Pierre-Louis Bossart  2019-06-03  148  	if (hipcie & HDA_DSP=
_REG_HIPCIE_DONE) {
6e9cde974863dc Liam Girdwood         2019-04-12  149  		msg =3D hipci & HDA=
_DSP_REG_HIPCI_MSG_MASK;
6e9cde974863dc Liam Girdwood         2019-04-12 @150  		msg_ext =3D hipcie =
& HDA_DSP_REG_HIPCIE_MSG_MASK;
6e9cde974863dc Liam Girdwood         2019-04-12  151  =

6e9cde974863dc Liam Girdwood         2019-04-12  152  		dev_vdbg(sdev->dev,
6e9cde974863dc Liam Girdwood         2019-04-12  153  			 "ipc: firmware re=
sponse, msg:0x%x, msg_ext:0x%x\n",
6e9cde974863dc Liam Girdwood         2019-04-12  154  			 msg, msg_ext);
6e9cde974863dc Liam Girdwood         2019-04-12  155  =

6e9cde974863dc Liam Girdwood         2019-04-12  156  		/* mask Done interr=
upt */
6e9cde974863dc Liam Girdwood         2019-04-12  157  		snd_sof_dsp_update_=
bits(sdev, HDA_DSP_BAR,
6e9cde974863dc Liam Girdwood         2019-04-12  158  					HDA_DSP_REG_HIPC=
CTL,
6e9cde974863dc Liam Girdwood         2019-04-12  159  					HDA_DSP_REG_HIPC=
CTL_DONE, 0);
6e9cde974863dc Liam Girdwood         2019-04-12  160  =

1183e9a634db06 Guennadi Liakhovetski 2019-05-24  161  		/*
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  162  		 * Make sure the in=
terrupt thread cannot be preempted between
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  163  		 * waking up the se=
nder and re-enabling the interrupt. Also
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  164  		 * protect against =
a theoretical race with sof_ipc_tx_message():
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  165  		 * if the DSP is fa=
st enough to receive an IPC message, reply to
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  166  		 * it, and the host=
 interrupt processing calls this function on
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  167  		 * a different core=
 from the one, where the sending is taking
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  168  		 * place, the messa=
ge might not yet be marked as expecting a
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  169  		 * reply.
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  170  		 */
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  171  		spin_lock_irq(&sdev=
->ipc_lock);
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  172  =

9b65b2a80e700c Amery Song            2020-03-12  173  		/* handle immediate=
 reply from DSP core */
6e9cde974863dc Liam Girdwood         2019-04-12  174  		hda_dsp_ipc_get_rep=
ly(sdev);
6e9cde974863dc Liam Girdwood         2019-04-12  175  		snd_sof_ipc_reply(s=
dev, msg);
6e9cde974863dc Liam Girdwood         2019-04-12  176  =

6e9cde974863dc Liam Girdwood         2019-04-12  177  		/* set the done bit=
 */
6e9cde974863dc Liam Girdwood         2019-04-12  178  		hda_dsp_ipc_dsp_don=
e(sdev);
6e9cde974863dc Liam Girdwood         2019-04-12  179  =

1183e9a634db06 Guennadi Liakhovetski 2019-05-24  180  		spin_unlock_irq(&sd=
ev->ipc_lock);
1183e9a634db06 Guennadi Liakhovetski 2019-05-24  181  =

66e65339b824a5 Pierre-Louis Bossart  2019-06-03  182  		ipc_irq =3D true;
6e9cde974863dc Liam Girdwood         2019-04-12  183  	}
6e9cde974863dc Liam Girdwood         2019-04-12  184  =

6e9cde974863dc Liam Girdwood         2019-04-12  185  	/* is this a new mes=
sage from DSP */
09a173a63fbb89 Pierre-Louis Bossart  2019-06-03  186  	if (hipct & HDA_DSP_=
REG_HIPCT_BUSY) {
6e9cde974863dc Liam Girdwood         2019-04-12 @187  		msg =3D hipct & HDA=
_DSP_REG_HIPCT_MSG_MASK;
6e9cde974863dc Liam Girdwood         2019-04-12  188  		msg_ext =3D hipcte =
& HDA_DSP_REG_HIPCTE_MSG_MASK;
6e9cde974863dc Liam Girdwood         2019-04-12  189  =

6e9cde974863dc Liam Girdwood         2019-04-12  190  		dev_vdbg(sdev->dev,
6e9cde974863dc Liam Girdwood         2019-04-12  191  			 "ipc: firmware in=
itiated, msg:0x%x, msg_ext:0x%x\n",
6e9cde974863dc Liam Girdwood         2019-04-12  192  			 msg, msg_ext);
6e9cde974863dc Liam Girdwood         2019-04-12  193  =

6e9cde974863dc Liam Girdwood         2019-04-12  194  		/* mask BUSY interr=
upt */
6e9cde974863dc Liam Girdwood         2019-04-12  195  		snd_sof_dsp_update_=
bits(sdev, HDA_DSP_BAR,
6e9cde974863dc Liam Girdwood         2019-04-12  196  					HDA_DSP_REG_HIPC=
CTL,
6e9cde974863dc Liam Girdwood         2019-04-12  197  					HDA_DSP_REG_HIPC=
CTL_BUSY, 0);
6e9cde974863dc Liam Girdwood         2019-04-12  198  =

6e9cde974863dc Liam Girdwood         2019-04-12  199  		/* handle messages =
from DSP */
6e9cde974863dc Liam Girdwood         2019-04-12  200  		if ((hipct & SOF_IP=
C_PANIC_MAGIC_MASK) =3D=3D SOF_IPC_PANIC_MAGIC) {
6e9cde974863dc Liam Girdwood         2019-04-12  201  			/* this is a PANIC=
 message !! */
6e9cde974863dc Liam Girdwood         2019-04-12  202  			snd_sof_dsp_panic(=
sdev, HDA_DSP_PANIC_OFFSET(msg_ext));
6e9cde974863dc Liam Girdwood         2019-04-12  203  		} else {
6e9cde974863dc Liam Girdwood         2019-04-12  204  			/* normal message =
- process normally */
6e9cde974863dc Liam Girdwood         2019-04-12  205  			snd_sof_ipc_msgs_r=
x(sdev);
6e9cde974863dc Liam Girdwood         2019-04-12  206  		}
6e9cde974863dc Liam Girdwood         2019-04-12  207  =

6e9cde974863dc Liam Girdwood         2019-04-12  208  		hda_dsp_ipc_host_do=
ne(sdev);
6e9cde974863dc Liam Girdwood         2019-04-12  209  =

66e65339b824a5 Pierre-Louis Bossart  2019-06-03  210  		ipc_irq =3D true;
6e9cde974863dc Liam Girdwood         2019-04-12  211  	}
6e9cde974863dc Liam Girdwood         2019-04-12  212  =

66e65339b824a5 Pierre-Louis Bossart  2019-06-03  213  	if (!ipc_irq) {
66e65339b824a5 Pierre-Louis Bossart  2019-06-03  214  		/*
66e65339b824a5 Pierre-Louis Bossart  2019-06-03  215  		 * This interrupt i=
s not shared so no need to return IRQ_NONE.
66e65339b824a5 Pierre-Louis Bossart  2019-06-03  216  		 */
717dedb1dcee92 Kai Vehmanen          2019-07-22  217  		dev_dbg_ratelimited=
(sdev->dev,
717dedb1dcee92 Kai Vehmanen          2019-07-22  218  				    "nothing to d=
o in IPC IRQ thread\n");
66e65339b824a5 Pierre-Louis Bossart  2019-06-03  219  	}
66e65339b824a5 Pierre-Louis Bossart  2019-06-03  220  =

66e65339b824a5 Pierre-Louis Bossart  2019-06-03  221  	return IRQ_HANDLED;
6e9cde974863dc Liam Girdwood         2019-04-12  222  }
6e9cde974863dc Liam Girdwood         2019-04-12  223  =


:::::: The code at line 150 was first introduced by commit
:::::: 6e9cde974863dc9d9c6cdb178f625e410c5be3d0 ASoC: SOF: Intel: Add Intel=
 specific HDA IPC mechanisms.

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6838573965168577354==--

