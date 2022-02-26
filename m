Content-Type: multipart/mixed; boundary="===============0105285959196586926=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/trans.c:422 iwl_pcie_apm_lp_xtal_enable() error: call of '__iwl_err' with no format argument
Date: Sun, 27 Feb 2022 05:07:00 +0800
Message-ID: <202202270527.O6vbDFx4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0105285959196586926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>
CC: Luca Coelho <luciano.coelho@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9137eda53752ef73148e42b0d7640a00f1bc96b1
commit: 15bf5ac6cd93b655ef82c6bb837cb3c19bce7f36 iwlwifi: pcie: retake owne=
rship after reset
date:   3 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 months ago
config: ia64-randconfig-m031-20220220 (https://download.01.org/0day-ci/arch=
ive/20220227/202202270527.O6vbDFx4-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:422 iwl_pcie_apm_lp_xtal_en=
able() error: call of '__iwl_err' with no format argument

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:66 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:70 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:76 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:83 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:636 iwl_pcie_prepare_card_h=
w() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:648 iwl_pcie_prepare_card_h=
w() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:703 iwl_pcie_load_firmware_=
chunk() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1377 iwl_trans_pcie_start_f=
w() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1608 iwl_trans_pcie_d3_resu=
me() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1785 iwl_trans_pcie_clear_p=
ersistence_bit() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2130 __iwl_trans_pcie_grab_=
nic_access() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2139 __iwl_trans_pcie_grab_=
nic_access() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2487 iwl_pcie_dump_csr() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2488 iwl_pcie_dump_csr() er=
ror: call of '__iwl_err' with no format argument

vim +/__iwl_err +422 drivers/net/wireless/intel/iwlwifi/pcie/trans.c

a6c684ee489a99 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Emmanuel Gru=
mbach 2012-01-08  372  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  373  /*
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  374   * Enable LP XTAL to avoid HW bug where device may c=
onsume much power if
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  375   * FW is not loaded after device reset. LP XTAL is d=
isabled by default
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  376   * after device HW reset. Do it only if XTAL is fed =
by internal source.
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  377   * Configure device's "persistence" mode to avoid re=
setting XTAL again when
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  378   * SHRD_HW_RST occurs in S3.
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  379   */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  380  static void iwl_pcie_apm_lp_xtal_enable(struct iwl_t=
rans *trans)
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  381  {
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  382  	int ret;
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  383  	u32 apmg_gp1_reg;
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  384  	u32 apmg_xtal_cfg_reg;
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  385  	u32 dl_cfg_reg;
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  386  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  387  	/* Force XTAL ON */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  388  	__iwl_trans_pcie_set_bit(trans, CSR_GP_CNTRL,
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  389  				 CSR_GP_CNTRL_REG_FLAG_XTAL_ON);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  390  =

15bf5ac6cd93b6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Ber=
g     2021-12-04  391  	ret =3D iwl_trans_pcie_sw_reset(trans, true);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  392  =

15bf5ac6cd93b6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Ber=
g     2021-12-04  393  	if (!ret)
425d66d8ddfc4a drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Ber=
g     2021-10-17  394  		ret =3D iwl_finish_nic_init(trans);
15bf5ac6cd93b6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Ber=
g     2021-12-04  395  =

c96b5eec2105cc drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Ber=
g     2018-12-10  396  	if (WARN_ON(ret)) {
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  397  		/* Release XTAL ON request */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  398  		__iwl_trans_pcie_clear_bit(trans, CSR_GP_CNTRL,
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  399  					   CSR_GP_CNTRL_REG_FLAG_XTAL_ON);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  400  		return;
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  401  	}
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  402  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  403  	/*
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  404  	 * Clear "disable persistence" to avoid LP XTAL res=
etting when
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  405  	 * SHRD_HW_RST is applied in S3.
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  406  	 */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  407  	iwl_clear_bits_prph(trans, APMG_PCIDEV_STT_REG,
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  408  				    APMG_PCIDEV_STT_VAL_PERSIST_DIS);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  409  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  410  	/*
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  411  	 * Force APMG XTAL to be active to prevent its disa=
bling by HW
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  412  	 * caused by APMG idle state.
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  413  	 */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  414  	apmg_xtal_cfg_reg =3D iwl_trans_pcie_read_shr(trans,
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  415  						    SHR_APMG_XTAL_CFG_REG);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  416  	iwl_trans_pcie_write_shr(trans, SHR_APMG_XTAL_CFG_R=
EG,
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  417  				 apmg_xtal_cfg_reg |
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  418  				 SHR_APMG_XTAL_CFG_XTAL_ON_REQ);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  419  =

15bf5ac6cd93b6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Ber=
g     2021-12-04  420  	ret =3D iwl_trans_pcie_sw_reset(trans, true);
15bf5ac6cd93b6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Ber=
g     2021-12-04  421  	if (ret)
15bf5ac6cd93b6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Ber=
g     2021-12-04 @422  		IWL_ERR(trans,
15bf5ac6cd93b6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Ber=
g     2021-12-04  423  			"iwl_pcie_apm_lp_xtal_enable: failed to retake NI=
C ownership\n");
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  424  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  425  	/* Enable LP XTAL by indirect access through CSR */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  426  	apmg_gp1_reg =3D iwl_trans_pcie_read_shr(trans, SHR=
_APMG_GP1_REG);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  427  	iwl_trans_pcie_write_shr(trans, SHR_APMG_GP1_REG, a=
pmg_gp1_reg |
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  428  				 SHR_APMG_GP1_WF_XTAL_LP_EN |
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  429  				 SHR_APMG_GP1_CHICKEN_BIT_SELECT);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  430  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  431  	/* Clear delay line clock power up */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  432  	dl_cfg_reg =3D iwl_trans_pcie_read_shr(trans, SHR_A=
PMG_DL_CFG_REG);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  433  	iwl_trans_pcie_write_shr(trans, SHR_APMG_DL_CFG_REG=
, dl_cfg_reg &
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  434  				 ~SHR_APMG_DL_CFG_DL_CLOCK_POWER_UP);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  435  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  436  	/*
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  437  	 * Enable persistence mode to avoid LP XTAL resetti=
ng when
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  438  	 * SHRD_HW_RST is applied in S3.
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  439  	 */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  440  	iwl_set_bit(trans, CSR_HW_IF_CONFIG_REG,
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  441  		    CSR_HW_IF_CONFIG_REG_PERSIST_MODE);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  442  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  443  	/*
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  444  	 * Clear "initialization complete" bit to move adap=
ter from
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  445  	 * D0A* (powered-up Active) --> D0U* (Uninitialized=
) state.
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  446  	 */
6dece0e99faa2a drivers/net/wireless/intel/iwlwifi/pcie/trans.c Luca Coelho =
      2019-10-10  447  	iwl_clear_bit(trans, CSR_GP_CNTRL, CSR_GP_CNTRL_REG=
_FLAG_INIT_DONE);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  448  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  449  	/* Activates XTAL resources monitor */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  450  	__iwl_trans_pcie_set_bit(trans, CSR_MONITOR_CFG_REG,
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  451  				 CSR_MONITOR_XTAL_RESOURCES);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  452  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  453  	/* Release XTAL ON request */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  454  	__iwl_trans_pcie_clear_bit(trans, CSR_GP_CNTRL,
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  455  				   CSR_GP_CNTRL_REG_FLAG_XTAL_ON);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  456  	udelay(10);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  457  =

a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  458  	/* Release APMG XTAL */
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  459  	iwl_trans_pcie_write_shr(trans, SHR_APMG_XTAL_CFG_R=
EG,
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  460  				 apmg_xtal_cfg_reg &
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  461  				 ~SHR_APMG_XTAL_CFG_XTAL_ON_REQ);
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  462  }
a812cba9bb1412 drivers/net/wireless/iwlwifi/pcie/trans.c       Alexander Bo=
ndar  2014-02-18  463  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0105285959196586926==--

