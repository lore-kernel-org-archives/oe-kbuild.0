Content-Type: multipart/mixed; boundary="===============1902284898378840765=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/2] memory: tegra30-emc: Print additional memory info
Date: Thu, 30 Dec 2021 01:28:05 +0800
Message-ID: <202112300102.VBqWE1HN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1902284898378840765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211222043215.28237-1-digetx@gmail.com>
References: <20211222043215.28237-1-digetx@gmail.com>
TO: Dmitry Osipenko <digetx@gmail.com>

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on v5.16-rc7]
[cannot apply to next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/memory-teg=
ra30-emc-Print-additional-memory-info/20211222-123518
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for=
-next
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-c002-20211226 (https://download.01.org/0day-ci/archi=
ve/20211230/202112300102.VBqWE1HN-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 0c553c=
c1af2e4c14100df6cf4a6fc91987e778e6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/8290e021c14675d913f019811=
25996647bb3fee3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/memory-tegra30-emc=
-Print-additional-memory-info/20211222-123518
        git checkout 8290e021c14675d913f01981125996647bb3fee3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/dvb-frontends/stv0367.c:1103:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D stv0367_readbits(state, F367TER_TRL_NOMRATE_HI) * 512 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1103:2: note: Value stored to 'tem=
p' is never read
           temp =3D stv0367_readbits(state, F367TER_TRL_NOMRATE_HI) * 512 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1109:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D stv0367_readbits(state, F367TER_GAIN_SRC_HI) * 256 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1109:2: note: Value stored to 'tem=
p' is never read
           temp =3D stv0367_readbits(state, F367TER_GAIN_SRC_HI) * 256 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1530:3: warning: Value stored to '=
tber' is never read [clang-analyzer-deadcode.DeadStores]
                   tber =3D ter_state->pBER;
                   ^      ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1530:3: note: Value stored to 'tbe=
r' is never read
                   tber =3D ter_state->pBER;
                   ^      ~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/dvb-frontends/cxd2841er.c:3600:25: warning: Value stored t=
o 'priv' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3600:25: note: Value stored to '=
priv' during its initialization is never read
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3759:25: warning: Value stored t=
o 'priv' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3759:25: note: Value stored to '=
priv' during its initialization is never read
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3812:34: warning: Value stored t=
o 'p' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3812:34: note: Value stored to '=
p' during its initialization is never read
           struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:123:6: warning: Value st=
ored to 'mux_buf_sz' during its initialization is never read [clang-analyze=
r-deadcode.DeadStores]
           u32 mux_buf_sz =3D mux_buf_sz_pkts * TS_PACKET_LEN;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:123:6: note: Value store=
d to 'mux_buf_sz' during its initialization is never read
           u32 mux_buf_sz =3D mux_buf_sz_pkts * TS_PACKET_LEN;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:206:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D &dvb->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vidtv/vidtv_bridge.c:206:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D &dvb->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: warning: Value sto=
red to 'nbytes_per_unit' is never read [clang-analyzer-deadcode.DeadStores]
                   nbytes_per_unit =3D 0;
                   ^                 ~
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: note: Value stored=
 to 'nbytes_per_unit' is never read
                   nbytes_per_unit =3D 0;
                   ^                 ~
   Suppressed 2 warnings (2 in non-user code).
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
   6 warnings generated.
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/vme/vme.c:297:16: warning: Access to field 'next' results in a d=
ereference of a null pointer (loaded from variable 'slave_pos') [clang-anal=
yzer-core.NullDereference]
           list_for_each(slave_pos, &bridge->slave_resources) {
                         ^
   include/linux/list.h:573:48: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; pos !=3D (head); pos =3D pos->next)
                                                         ^~~
   drivers/vme/vme.c:291:6: note: Assuming 'bridge' is non-null
           if (!bridge) {
               ^~~~~~~
   drivers/vme/vme.c:291:2: note: Taking false branch
           if (!bridge) {
           ^
   drivers/vme/vme.c:297:16: note: Value assigned to 'slave_pos'
           list_for_each(slave_pos, &bridge->slave_resources) {
                         ^
   include/linux/list.h:573:7: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; pos !=3D (head); pos =3D pos->next)
                ^~~~~~~~~~~~~~~~~~
   drivers/vme/vme.c:297:2: note: Loop condition is true.  Entering loop bo=
dy
           list_for_each(slave_pos, &bridge->slave_resources) {
           ^
   include/linux/list.h:573:2: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; pos !=3D (head); pos =3D pos->next)
           ^
   drivers/vme/vme.c:301:7: note: Assuming 'slave_image' is null
                   if (!slave_image) {
                       ^~~~~~~~~~~~
   drivers/vme/vme.c:301:3: note: Taking true branch
                   if (!slave_image) {
                   ^
   drivers/vme/vme.c:302:4: note: Loop condition is false.  Exiting loop
                           printk(KERN_ERR "Registered NULL Slave resource\=
n");
                           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/vme/vme.c:303:4: note:  Execution continues on line 297
                           continue;
                           ^
   drivers/vme/vme.c:297:16: note: Access to field 'next' results in a dere=
ference of a null pointer (loaded from variable 'slave_pos')
           list_for_each(slave_pos, &bridge->slave_resources) {
                         ^
   include/linux/list.h:573:48: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; pos !=3D (head); pos =3D pos->next)
                                                         ^~~
   drivers/vme/vme.c:498:16: warning: Access to field 'next' results in a d=
ereference of a null pointer (loaded from variable 'master_pos') [clang-ana=
lyzer-core.NullDereference]
           list_for_each(master_pos, &bridge->master_resources) {
                         ^
   include/linux/list.h:573:48: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; pos !=3D (head); pos =3D pos->next)
                                                         ^~~
   drivers/vme/vme.c:492:6: note: Assuming 'bridge' is non-null
           if (!bridge) {
               ^~~~~~~
   drivers/vme/vme.c:492:2: note: Taking false branch
           if (!bridge) {
           ^
   drivers/vme/vme.c:498:16: note: Value assigned to 'master_pos'
           list_for_each(master_pos, &bridge->master_resources) {
                         ^
   include/linux/list.h:573:7: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; pos !=3D (head); pos =3D pos->next)
                ^~~~~~~~~~~~~~~~~~
   drivers/vme/vme.c:498:2: note: Loop condition is true.  Entering loop bo=
dy
           list_for_each(master_pos, &bridge->master_resources) {

vim +/dram_type_str +1164 drivers/memory/tegra/tegra30-emc.c

8290e021c14675 Dmitry Osipenko 2021-12-22  1117  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1118  static int emc_setup_hw(st=
ruct tegra_emc *emc)
e34212c75a6899 Dmitry Osipenko 2019-08-12  1119  {
8290e021c14675 Dmitry Osipenko 2021-12-22  1120  	u32 fbio_cfg5, emc_cfg, e=
mc_dbg, emc_adr_cfg;
930c68180ffb05 Dmitry Osipenko 2020-03-19  1121  	u32 intmask =3D EMC_REFRE=
SH_OVERFLOW_INT;
8290e021c14675 Dmitry Osipenko 2021-12-22  1122  	static bool print_sdram_i=
nfo_once;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1123  	enum emc_dram_type dram_t=
ype;
8290e021c14675 Dmitry Osipenko 2021-12-22  1124  	const char *dram_type_str;
8290e021c14675 Dmitry Osipenko 2021-12-22  1125  	unsigned int emem_numdev;
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

8290e021c14675 Dmitry Osipenko 2021-12-22  1162  	switch (dram_type) {
8290e021c14675 Dmitry Osipenko 2021-12-22  1163  	case DRAM_TYPE_DDR1:
8290e021c14675 Dmitry Osipenko 2021-12-22 @1164  		dram_type_str =3D "DDR1";
8290e021c14675 Dmitry Osipenko 2021-12-22  1165  		break;
8290e021c14675 Dmitry Osipenko 2021-12-22  1166  	case DRAM_TYPE_LPDDR2:
8290e021c14675 Dmitry Osipenko 2021-12-22  1167  		dram_type_str =3D "LPDDR=
2";
8290e021c14675 Dmitry Osipenko 2021-12-22  1168  		break;
8290e021c14675 Dmitry Osipenko 2021-12-22  1169  	case DRAM_TYPE_DDR2:
8290e021c14675 Dmitry Osipenko 2021-12-22  1170  		dram_type_str =3D "DDR2";
8290e021c14675 Dmitry Osipenko 2021-12-22  1171  		break;
8290e021c14675 Dmitry Osipenko 2021-12-22  1172  	case DRAM_TYPE_DDR3:
8290e021c14675 Dmitry Osipenko 2021-12-22  1173  		dram_type_str =3D "DDR3";
8290e021c14675 Dmitry Osipenko 2021-12-22  1174  		break;
8290e021c14675 Dmitry Osipenko 2021-12-22  1175  	}
8290e021c14675 Dmitry Osipenko 2021-12-22  1176  =

8290e021c14675 Dmitry Osipenko 2021-12-22  1177  	emc_adr_cfg =3D readl_rel=
axed(emc->regs + EMC_ADR_CFG);
8290e021c14675 Dmitry Osipenko 2021-12-22  1178  	emem_numdev =3D FIELD_GET=
(EMC_ADR_CFG_EMEM_NUMDEV, emc_adr_cfg) + 1;
8290e021c14675 Dmitry Osipenko 2021-12-22  1179  =

8290e021c14675 Dmitry Osipenko 2021-12-22  1180  	dev_info_once(emc->dev, "=
%u %s %s attached\n", emem_numdev,
8290e021c14675 Dmitry Osipenko 2021-12-22  1181  		      dram_type_str, eme=
m_numdev =3D=3D 2 ? "devices" : "device");
8290e021c14675 Dmitry Osipenko 2021-12-22  1182  =

8290e021c14675 Dmitry Osipenko 2021-12-22  1183  	if (dram_type =3D=3D DRAM=
_TYPE_LPDDR2 && !print_sdram_info_once) {
8290e021c14675 Dmitry Osipenko 2021-12-22  1184  		while (emem_numdev--)
8290e021c14675 Dmitry Osipenko 2021-12-22  1185  			emc_read_lpddr_sdram_in=
fo(emc, emem_numdev);
8290e021c14675 Dmitry Osipenko 2021-12-22  1186  =

8290e021c14675 Dmitry Osipenko 2021-12-22  1187  		print_sdram_info_once =
=3D true;
8290e021c14675 Dmitry Osipenko 2021-12-22  1188  	}
8290e021c14675 Dmitry Osipenko 2021-12-22  1189  =

e34212c75a6899 Dmitry Osipenko 2019-08-12  1190  	return 0;
e34212c75a6899 Dmitry Osipenko 2019-08-12  1191  }
e34212c75a6899 Dmitry Osipenko 2019-08-12  1192  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1902284898378840765==--

