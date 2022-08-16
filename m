Content-Type: multipart/mixed; boundary="===============6621059805391158995=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/memory/tegra/tegra20-emc.c:645:3: warning: Value stored to 'dram_type_str' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 17 Aug 2022 04:46:20 +0800
Message-ID: <202208170440.tT3tsh2C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6621059805391158995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
emory/tegra/tegra20-emc.c:645:3: warning: Value stored to 'dram_type_str' i=
s never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3cc40a443a04d52b0c95255dce264068b01e9bfe
commit: 131dd9a436d8f6dbaf3d9597803765d271b2fc19 memory: tegra20-emc: Suppo=
rt matching timings by LPDDR2 configuration
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220814 (https://download.01.org/0day-ci/archi=
ve/20220817/202208170440.tT3tsh2C-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 3329ce=
c2f79185bafd678f310fafadba2a8c76d2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D131dd9a436d8f6dbaf3d9597803765d271b2fc19
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 131dd9a436d8f6dbaf3d9597803765d271b2fc19
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/hwmon/occ/common.c:1109:3: warning: Value stored to 'old_offset'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   old_offset =3D offset;
                   ^            ~~~~~~
   drivers/hwmon/occ/common.c:1109:3: note: Value stored to 'old_offset' is=
 never read
                   old_offset =3D offset;
                   ^            ~~~~~~
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
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   6 warnings generated.
>> drivers/memory/tegra/tegra20-emc.c:645:3: warning: Value stored to 'dram=
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
   include/linux/etherdevice.h:121:2: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           u16 a =3D *(const u16 *)addr;
           ^
   net/llc/llc_sap.c:425:2: note: Calling 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, laddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:278:6: note: Assuming the condition is false
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:278:2: note: Taking false branch
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
           ^
   net/llc/llc_sap.c:425:2: note: Returning from 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, laddr.mac);

vim +/dram_type_str +645 drivers/memory/tegra/tegra20-emc.c

131dd9a436d8f6 Dmitry Osipenko 2021-10-07  595  =

96e5da7c842424 Dmitry Osipenko 2018-10-21  596  static int emc_setup_hw(str=
uct tegra_emc *emc)
96e5da7c842424 Dmitry Osipenko 2018-10-21  597  {
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  598  	u32 emc_cfg, emc_dbg, emc_=
fbio, emc_adr_cfg;
adbcec8862cd7e Dmitry Osipenko 2020-03-19  599  	u32 intmask =3D EMC_REFRES=
H_OVERFLOW_INT;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  600  	static bool print_sdram_in=
fo_once;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  601  	enum emc_dram_type dram_ty=
pe;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  602  	const char *dram_type_str;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  603  	unsigned int emem_numdev;
96e5da7c842424 Dmitry Osipenko 2018-10-21  604  =

96e5da7c842424 Dmitry Osipenko 2018-10-21  605  	emc_cfg =3D readl_relaxed(=
emc->regs + EMC_CFG_2);
96e5da7c842424 Dmitry Osipenko 2018-10-21  606  =

96e5da7c842424 Dmitry Osipenko 2018-10-21  607  	/*
96e5da7c842424 Dmitry Osipenko 2018-10-21  608  	 * Depending on a memory t=
ype, DRAM should enter either self-refresh
96e5da7c842424 Dmitry Osipenko 2018-10-21  609  	 * or power-down state on =
EMC clock change.
96e5da7c842424 Dmitry Osipenko 2018-10-21  610  	 */
96e5da7c842424 Dmitry Osipenko 2018-10-21  611  	if (!(emc_cfg & EMC_CLKCHA=
NGE_PD_ENABLE) &&
96e5da7c842424 Dmitry Osipenko 2018-10-21  612  	    !(emc_cfg & EMC_CLKCHA=
NGE_SR_ENABLE)) {
96e5da7c842424 Dmitry Osipenko 2018-10-21  613  		dev_err(emc->dev,
96e5da7c842424 Dmitry Osipenko 2018-10-21  614  			"bootloader didn't speci=
fy DRAM auto-suspend mode\n");
96e5da7c842424 Dmitry Osipenko 2018-10-21  615  		return -EINVAL;
96e5da7c842424 Dmitry Osipenko 2018-10-21  616  	}
96e5da7c842424 Dmitry Osipenko 2018-10-21  617  =

96e5da7c842424 Dmitry Osipenko 2018-10-21  618  	/* enable EMC and CAR to h=
andshake on PLL divider/source changes */
96e5da7c842424 Dmitry Osipenko 2018-10-21  619  	emc_cfg |=3D EMC_CLKCHANGE=
_REQ_ENABLE;
96e5da7c842424 Dmitry Osipenko 2018-10-21  620  	writel_relaxed(emc_cfg, em=
c->regs + EMC_CFG_2);
96e5da7c842424 Dmitry Osipenko 2018-10-21  621  =

96e5da7c842424 Dmitry Osipenko 2018-10-21  622  	/* initialize interrupt */
96e5da7c842424 Dmitry Osipenko 2018-10-21  623  	writel_relaxed(intmask, em=
c->regs + EMC_INTMASK);
96e5da7c842424 Dmitry Osipenko 2018-10-21  624  	writel_relaxed(intmask, em=
c->regs + EMC_INTSTATUS);
96e5da7c842424 Dmitry Osipenko 2018-10-21  625  =

c72396f941fb9d Dmitry Osipenko 2019-08-12  626  	/* ensure that unwanted de=
bug features are disabled */
c72396f941fb9d Dmitry Osipenko 2019-08-12  627  	emc_dbg =3D readl_relaxed(=
emc->regs + EMC_DBG);
c72396f941fb9d Dmitry Osipenko 2019-08-12  628  	emc_dbg |=3D EMC_DBG_CFG_P=
RIORITY;
c72396f941fb9d Dmitry Osipenko 2019-08-12  629  	emc_dbg &=3D ~EMC_DBG_READ=
_MUX_ASSEMBLY;
c72396f941fb9d Dmitry Osipenko 2019-08-12  630  	emc_dbg &=3D ~EMC_DBG_WRIT=
E_MUX_ACTIVE;
c72396f941fb9d Dmitry Osipenko 2019-08-12  631  	emc_dbg &=3D ~EMC_DBG_FORC=
E_UPDATE;
c72396f941fb9d Dmitry Osipenko 2019-08-12  632  	writel_relaxed(emc_dbg, em=
c->regs + EMC_DBG);
c72396f941fb9d Dmitry Osipenko 2019-08-12  633  =

d5ef16ba5fbe12 Dmitry Osipenko 2020-11-04  634  	emc_fbio =3D readl_relaxed=
(emc->regs + EMC_FBIO_CFG5);
d5ef16ba5fbe12 Dmitry Osipenko 2020-11-04  635  =

d5ef16ba5fbe12 Dmitry Osipenko 2020-11-04  636  	if (emc_fbio & EMC_FBIO_CF=
G5_DRAM_WIDTH_X16)
d5ef16ba5fbe12 Dmitry Osipenko 2020-11-04  637  		emc->dram_bus_width =3D 1=
6;
d5ef16ba5fbe12 Dmitry Osipenko 2020-11-04  638  	else
d5ef16ba5fbe12 Dmitry Osipenko 2020-11-04  639  		emc->dram_bus_width =3D 3=
2;
d5ef16ba5fbe12 Dmitry Osipenko 2020-11-04  640  =

131dd9a436d8f6 Dmitry Osipenko 2021-10-07  641  	dram_type =3D FIELD_GET(EM=
C_FBIO_CFG5_DRAM_TYPE, emc_fbio);
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  642  =

131dd9a436d8f6 Dmitry Osipenko 2021-10-07  643  	switch (dram_type) {
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  644  	case DRAM_TYPE_RESERVED:
131dd9a436d8f6 Dmitry Osipenko 2021-10-07 @645  		dram_type_str =3D "INVALI=
D";
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  646  		break;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  647  	case DRAM_TYPE_DDR1:
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  648  		dram_type_str =3D "DDR1";
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  649  		break;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  650  	case DRAM_TYPE_LPDDR2:
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  651  		dram_type_str =3D "LPDDR2=
";
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  652  		break;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  653  	case DRAM_TYPE_DDR2:
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  654  		dram_type_str =3D "DDR2";
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  655  		break;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  656  	}
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  657  =

131dd9a436d8f6 Dmitry Osipenko 2021-10-07  658  	emc_adr_cfg =3D readl_rela=
xed(emc->regs + EMC_ADR_CFG_0);
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  659  	emem_numdev =3D FIELD_GET(=
EMC_ADR_CFG_0_EMEM_NUMDEV, emc_adr_cfg) + 1;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  660  =

131dd9a436d8f6 Dmitry Osipenko 2021-10-07  661  	dev_info_once(emc->dev, "%=
ubit DRAM bus, %u %s %s attached\n",
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  662  		      emc->dram_bus_width=
, emem_numdev, dram_type_str,
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  663  		      emem_numdev =3D=3D =
2 ? "devices" : "device");
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  664  =

131dd9a436d8f6 Dmitry Osipenko 2021-10-07  665  	if (dram_type =3D=3D DRAM_=
TYPE_LPDDR2) {
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  666  		while (emem_numdev--)
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  667  			emc_read_lpddr_sdram_inf=
o(emc, emem_numdev,
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  668  						  !print_sdram_info_o=
nce);
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  669  		print_sdram_info_once =3D=
 true;
131dd9a436d8f6 Dmitry Osipenko 2021-10-07  670  	}
d5ef16ba5fbe12 Dmitry Osipenko 2020-11-04  671  =

96e5da7c842424 Dmitry Osipenko 2018-10-21  672  	return 0;
96e5da7c842424 Dmitry Osipenko 2018-10-21  673  }
96e5da7c842424 Dmitry Osipenko 2018-10-21  674  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6621059805391158995==--

