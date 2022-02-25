Content-Type: multipart/mixed; boundary="===============6943738553393943721=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1767/8646] drivers/memory/tegra/tegra30-emc.c:1164:3: warning: Value stored to 'dram_type_str' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Feb 2022 05:07:15 +0800
Message-ID: <202202260552.TPnzbKMS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6943738553393943721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   44948bd49d878dad6c9707e34f4a06df73c3a800
commit: e3aabb3c7dbe66201b45d7b2c20132196f491ad4 [1767/8646] memory: tegra3=
0-emc: Print additional memory info
:::::: branch date: 19 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220223 (https://download.01.org/0day-ci/archi=
ve/20220226/202202260552.TPnzbKMS-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De3aabb3c7dbe66201b45d7b2c20132196f491ad4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e3aabb3c7dbe66201b45d7b2c20132196f491ad4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/media/tuners/tuner-xc2028.c:1037:3: note: Value stored to 'rc' i=
s never read
   Suppressed 2 warnings (2 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   2 warnings generated.
   drivers/media/v4l2-core/videobuf-core.c:712:10: warning: Access to field=
 'state' results in a dereference of a null pointer (loaded from variable '=
buf') [clang-analyzer-core.NullDereference]
           switch (buf->state) {
                   ^~~
   drivers/media/v4l2-core/videobuf-core.c:698:2: note: 'buf' initialized t=
o a null pointer value
           struct videobuf_buffer *buf =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/videobuf-core.c:701:2: note: Assuming field 'mag=
ic' is equal to 304484355
           MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);
           ^
   drivers/media/v4l2-core/videobuf-core.c:27:16: note: expanded from macro=
 'MAGIC_CHECK'
                   if (unlikely((is) !=3D (should))) {                     =
  \
                       ~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/media/v4l2-core/videobuf-core.c:701:2: note: Taking false branch
           MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);
           ^
   drivers/media/v4l2-core/videobuf-core.c:27:3: note: expanded from macro =
'MAGIC_CHECK'
                   if (unlikely((is) !=3D (should))) {                     =
  \
                   ^
   drivers/media/v4l2-core/videobuf-core.c:701:2: note: Loop condition is f=
alse.  Exiting loop
           MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);
           ^
   drivers/media/v4l2-core/videobuf-core.c:26:2: note: expanded from macro =
'MAGIC_CHECK'
           do {                                                            \
           ^
   drivers/media/v4l2-core/videobuf-core.c:706:11: note: Calling 'stream_ne=
xt_buffer'
           retval =3D stream_next_buffer(q, &buf, nonblocking);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/videobuf-core.c:682:6: note: Assuming 'retval' i=
s not equal to 0
           if (retval)
               ^~~~~~
   drivers/media/v4l2-core/videobuf-core.c:682:2: note: Taking true branch
           if (retval)
           ^
   drivers/media/v4l2-core/videobuf-core.c:683:3: note: Control jumps to li=
ne 692
                   goto done;
                   ^
   drivers/media/v4l2-core/videobuf-core.c:692:2: note: Returning without w=
riting to '*vb'
           return retval;
           ^
   drivers/media/v4l2-core/videobuf-core.c:706:11: note: Returning from 'st=
ream_next_buffer'
           retval =3D stream_next_buffer(q, &buf, nonblocking);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/videobuf-core.c:707:6: note: Assuming 'retval' i=
s >=3D 0
           if (retval < 0) {
               ^~~~~~~~~~
   drivers/media/v4l2-core/videobuf-core.c:707:2: note: Taking false branch
           if (retval < 0) {
           ^
   drivers/media/v4l2-core/videobuf-core.c:712:10: note: Access to field 's=
tate' results in a dereference of a null pointer (loaded from variable 'buf=
')
           switch (buf->state) {
                   ^~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/input/keyboard/lm8323.c:333:3: warning: Value stored to 'active'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
   drivers/input/keyboard/lm8323.c:333:3: note: Value stored to 'active' is=
 never read
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
   1 warning generated.
   lib/xarray.c:2029:18: warning: Value stored to 'node' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   lib/xarray.c:2029:18: note: Value stored to 'node' during its initializa=
tion is never read
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   4 warnings generated.
   drivers/memory/tegra/tegra20-emc.c:645:3: warning: Value stored to 'dram=
_type_str' is never read [clang-analyzer-deadcode.DeadStores]
                   dram_type_str =3D "INVALID";
                   ^               ~~~~~~~~~
   drivers/memory/tegra/tegra20-emc.c:645:3: note: Value stored to 'dram_ty=
pe_str' is never read
                   dram_type_str =3D "INVALID";
                   ^               ~~~~~~~~~
   drivers/memory/tegra/tegra20-emc.c:648:3: warning: Value stored to 'dram=
_type_str' is never read [clang-analyzer-deadcode.DeadStores]
                   dram_type_str =3D "DDR1";
                   ^               ~~~~~~
   drivers/memory/tegra/tegra20-emc.c:648:3: note: Value stored to 'dram_ty=
pe_str' is never read
                   dram_type_str =3D "DDR1";
                   ^               ~~~~~~
   drivers/memory/tegra/tegra20-emc.c:651:3: warning: Value stored to 'dram=
_type_str' is never read [clang-analyzer-deadcode.DeadStores]
                   dram_type_str =3D "LPDDR2";
                   ^               ~~~~~~~~
   drivers/memory/tegra/tegra20-emc.c:651:3: note: Value stored to 'dram_ty=
pe_str' is never read
                   dram_type_str =3D "LPDDR2";
                   ^               ~~~~~~~~
   drivers/memory/tegra/tegra20-emc.c:654:3: warning: Value stored to 'dram=
_type_str' is never read [clang-analyzer-deadcode.DeadStores]
                   dram_type_str =3D "DDR2";
                   ^               ~~~~~~
   drivers/memory/tegra/tegra20-emc.c:654:3: note: Value stored to 'dram_ty=
pe_str' is never read
                   dram_type_str =3D "DDR2";
                   ^               ~~~~~~
   4 warnings generated.
>> drivers/memory/tegra/tegra30-emc.c:1164:3: warning: Value stored to 'dra=
m_type_str' is never read [clang-analyzer-deadcode.DeadStores]
                   dram_type_str =3D "DDR1";
                   ^               ~~~~~~
   drivers/memory/tegra/tegra30-emc.c:1164:3: note: Value stored to 'dram_t=
ype_str' is never read
                   dram_type_str =3D "DDR1";
                   ^               ~~~~~~
   drivers/memory/tegra/tegra30-emc.c:1167:3: warning: Value stored to 'dra=
m_type_str' is never read [clang-analyzer-deadcode.DeadStores]
                   dram_type_str =3D "LPDDR2";
                   ^               ~~~~~~~~
   drivers/memory/tegra/tegra30-emc.c:1167:3: note: Value stored to 'dram_t=
ype_str' is never read
                   dram_type_str =3D "LPDDR2";
                   ^               ~~~~~~~~
   drivers/memory/tegra/tegra30-emc.c:1170:3: warning: Value stored to 'dra=
m_type_str' is never read [clang-analyzer-deadcode.DeadStores]
                   dram_type_str =3D "DDR2";
                   ^               ~~~~~~
   drivers/memory/tegra/tegra30-emc.c:1170:3: note: Value stored to 'dram_t=
ype_str' is never read
                   dram_type_str =3D "DDR2";
                   ^               ~~~~~~
   drivers/memory/tegra/tegra30-emc.c:1173:3: warning: Value stored to 'dra=
m_type_str' is never read [clang-analyzer-deadcode.DeadStores]
                   dram_type_str =3D "DDR3";
                   ^               ~~~~~~
   drivers/memory/tegra/tegra30-emc.c:1173:3: note: Value stored to 'dram_t=
ype_str' is never read
                   dram_type_str =3D "DDR3";
                   ^               ~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/staging/ks7010/ks_wlan_net.c:2104:2: warning: Value stored to 'p=
' is never read [clang-analyzer-deadcode.DeadStores]
           p =3D memcpy(priv->wps.ie + 1, p, len);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/ks7010/ks_wlan_net.c:2104:2: note: Value stored to 'p' i=
s never read
           p =3D memcpy(priv->wps.ie + 1, p, len);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/media/tuners/fc0011.c:252:3: warning: Value stored to 'bandwidth=
' is never read [clang-analyzer-deadcode.DeadStores]
                   bandwidth =3D 6000;
                   ^           ~~~~
   drivers/media/tuners/fc0011.c:252:3: note: Value stored to 'bandwidth' i=
s never read
                   bandwidth =3D 6000;
                   ^           ~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/media/tuners/it913x.c:151:26: warning: Value stored to 'pdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/tuners/it913x.c:151:26: note: Value stored to 'pdev' durin=
g its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/tuners/it913x.c:210:26: warning: Value stored to 'pdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   drivers/media/tuners/it913x.c:210:26: note: Value stored to 'pdev' durin=
g its initialization is never read
           struct platform_device *pdev =3D dev->pdev;
                                   ^~~~   ~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/tuners/m88rs6000t.c:475:25: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct m88rs6000t_dev *dev =3D fe->tuner_priv;
                                  ^~~   ~~~~~~~~~~~~~~
   drivers/media/tuners/m88rs6000t.c:475:25: note: Value stored to 'dev' du=
ring its initialization is never read
           struct m88rs6000t_dev *dev =3D fe->tuner_priv;
                                  ^~~   ~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   lib/radix-tree.c:1046:3: warning: 4th function call argument is an unini=
tialized value [clang-analyzer-core.CallAndMessage]
                   node_tag_clear(root, parent, tag, offset);
                   ^                                 ~~~~~~
   lib/radix-tree.c:1032:2: note: 'offset' declared without an initial value
           int offset;
           ^~~~~~~~~~
   lib/radix-tree.c:1035:6: note: Assuming 'index' is <=3D 'maxindex'
           if (index > maxindex)
               ^~~~~~~~~~~~~~~~
   lib/radix-tree.c:1035:2: note: Taking false branch
           if (index > maxindex)
           ^
   lib/radix-tree.c:1040:2: note: Loop condition is false. Execution contin=
ues on line 1045
           while (radix_tree_is_internal_node(node)) {
           ^
   lib/radix-tree.c:1045:6: note: Assuming 'node' is non-null
           if (node)
               ^~~~
   lib/radix-tree.c:1045:2: note: Taking true branch
           if (node)
           ^
   lib/radix-tree.c:1046:3: note: 4th function call argument is an uninitia=
lized value
                   node_tag_clear(root, parent, tag, offset);
                   ^                                 ~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/input/keyboard/atkbd.c:1078:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]

vim +/dram_type_str +1164 drivers/memory/tegra/tegra30-emc.c

e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1117  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1118  static int emc_setup_hw(st=
ruct tegra_emc *emc)
e34212c75a6899 Dmitry Osipenko 2019-08-12  1119  {
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1120  	u32 fbio_cfg5, emc_cfg, e=
mc_dbg, emc_adr_cfg;
930c68180ffb05 Dmitry Osipenko 2020-03-19  1121  	u32 intmask =3D EMC_REFRE=
SH_OVERFLOW_INT;
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1122  	static bool print_sdram_i=
nfo_once;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1123  	enum emc_dram_type dram_t=
ype;
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1124  	const char *dram_type_str;
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1125  	unsigned int emem_numdev;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1126  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1127  	fbio_cfg5 =3D readl_relax=
ed(emc->regs + EMC_FBIO_CFG5);
e34212c75a6899 Dmitry Osipenko 2019-08-12  1128  	dram_type =3D fbio_cfg5 &=
 EMC_FBIO_CFG5_DRAM_TYPE_MASK;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1129  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1130  	emc_cfg =3D readl_relaxed=
(emc->regs + EMC_CFG_2);
e34212c75a6899 Dmitry Osipenko 2019-08-12  1131  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1132  	/* enable EMC and CAR to =
handshake on PLL divider/source changes */
e34212c75a6899 Dmitry Osipenko 2019-08-12  1133  	emc_cfg |=3D EMC_CLKCHANG=
E_REQ_ENABLE;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1134  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1135  	/* configure clock change=
 mode accordingly to DRAM type */
e34212c75a6899 Dmitry Osipenko 2019-08-12  1136  	switch (dram_type) {
e34212c75a6899 Dmitry Osipenko 2019-08-12  1137  	case DRAM_TYPE_LPDDR2:
e34212c75a6899 Dmitry Osipenko 2019-08-12  1138  		emc_cfg |=3D EMC_CLKCHAN=
GE_PD_ENABLE;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1139  		emc_cfg &=3D ~EMC_CLKCHA=
NGE_SR_ENABLE;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1140  		break;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1141  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1142  	default:
e34212c75a6899 Dmitry Osipenko 2019-08-12  1143  		emc_cfg &=3D ~EMC_CLKCHA=
NGE_SR_ENABLE;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1144  		emc_cfg &=3D ~EMC_CLKCHA=
NGE_PD_ENABLE;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1145  		break;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1146  	}
e34212c75a6899 Dmitry Osipenko 2019-08-12  1147  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1148  	writel_relaxed(emc_cfg, e=
mc->regs + EMC_CFG_2);
e34212c75a6899 Dmitry Osipenko 2019-08-12  1149  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1150  	/* initialize interrupt */
e34212c75a6899 Dmitry Osipenko 2019-08-12  1151  	writel_relaxed(intmask, e=
mc->regs + EMC_INTMASK);
e34212c75a6899 Dmitry Osipenko 2019-08-12  1152  	writel_relaxed(0xffffffff=
, emc->regs + EMC_INTSTATUS);
e34212c75a6899 Dmitry Osipenko 2019-08-12  1153  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1154  	/* ensure that unwanted d=
ebug features are disabled */
e34212c75a6899 Dmitry Osipenko 2019-08-12  1155  	emc_dbg =3D readl_relaxed=
(emc->regs + EMC_DBG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  1156  	emc_dbg |=3D EMC_DBG_CFG_=
PRIORITY;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1157  	emc_dbg &=3D ~EMC_DBG_REA=
D_MUX_ASSEMBLY;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1158  	emc_dbg &=3D ~EMC_DBG_WRI=
TE_MUX_ACTIVE;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1159  	emc_dbg &=3D ~EMC_DBG_FOR=
CE_UPDATE;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1160  	writel_relaxed(emc_dbg, e=
mc->regs + EMC_DBG);
e34212c75a6899 Dmitry Osipenko 2019-08-12  1161  =

e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1162  	switch (dram_type) {
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1163  	case DRAM_TYPE_DDR1:
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22 @1164  		dram_type_str =3D "DDR1";
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1165  		break;
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1166  	case DRAM_TYPE_LPDDR2:
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1167  		dram_type_str =3D "LPDDR=
2";
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1168  		break;
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1169  	case DRAM_TYPE_DDR2:
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1170  		dram_type_str =3D "DDR2";
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1171  		break;
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1172  	case DRAM_TYPE_DDR3:
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1173  		dram_type_str =3D "DDR3";
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1174  		break;
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1175  	}
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1176  =

e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1177  	emc_adr_cfg =3D readl_rel=
axed(emc->regs + EMC_ADR_CFG);
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1178  	emem_numdev =3D FIELD_GET=
(EMC_ADR_CFG_EMEM_NUMDEV, emc_adr_cfg) + 1;
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1179  =

e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1180  	dev_info_once(emc->dev, "=
%u %s %s attached\n", emem_numdev,
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1181  		      dram_type_str, eme=
m_numdev =3D=3D 2 ? "devices" : "device");
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1182  =

e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1183  	if (dram_type =3D=3D DRAM=
_TYPE_LPDDR2 && !print_sdram_info_once) {
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1184  		while (emem_numdev--)
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1185  			emc_read_lpddr_sdram_in=
fo(emc, emem_numdev);
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1186  =

e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1187  		print_sdram_info_once =
=3D true;
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1188  	}
e3aabb3c7dbe66 Dmitry Osipenko 2021-12-22  1189  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1190  	return 0;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1191  }
e34212c75a6899 Dmitry Osipenko 2019-08-12  1192  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6943738553393943721==--

