Content-Type: multipart/mixed; boundary="===============0269505229308762269=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:390 iwl_send_phy_db_data() error: call of '__iwl_err' with no format argument
Date: Wed, 23 Feb 2022 15:13:15 +0800
Message-ID: <202202231545.vhD9scty-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0269505229308762269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>
CC: Luca Coelho <luciano.coelho@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5c1ee569660d4a205dced9cb4d0306b907fb7599
commit: e5f1cc98cc1bd07bc6d4f75e34d89db06a2f8bdb iwlwifi: allow rate-limite=
d error messages
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: ia64-randconfig-m031-20220220 (https://download.01.org/0day-ci/arch=
ive/20220223/202202231545.vhD9scty-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:390 iwl_send_phy_db_data() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:95 iwl_eeprom_verify_s=
ignature() warn: excess argument passed to '__iwl_err'
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:95 iwl_eeprom_verify_s=
ignature() warn: excess argument passed to '__iwl_err'
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:123 iwl_nvm_is_otp() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:188 iwl_read_otp_word(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:214 iwl_is_otp_empty()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:326 iwl_read_eeprom() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1230 get_crf_id() error: call=
 of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-io.c:315 iwl_dump_rfh() error: call =
of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-io.c:392 iwl_dump_fh() error: call o=
f '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:432 iwl_trans_pcie_gen=
2_start_fw() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info-gen3.c:71 iwl_pcie_ctxt_i=
nfo_dbg_enable() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1034 iwl_set_hw_address_=
family_8000() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1076 iwl_set_hw_address(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1171 iwl_parse_nvm_data(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1526 iwl_read_external_n=
vm() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1688 iwl_get_nvm() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c:121 iwl_pcie_gen2_enqueue=
_hcmd() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1869 iwl_pcie_irq_handler() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:2286 iwl_pcie_irq_msix_handler=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:874 iwl_dbg_tlv_set_period=
ic_trigs() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:183 iwl_request_firmware() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:469 iwl_parse_v1_v2_firmware()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:696 iwl_parse_tlv_firmware() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1391 iwl_req_fw_callback() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1692 iwl_drv_start() error: ca=
ll of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:65 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:620 iwl_pcie_prepare_card_h=
w() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:675 iwl_pcie_load_firmware_=
chunk() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1331 iwl_trans_pcie_start_f=
w() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1540 iwl_trans_pcie_d3_resu=
me() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1732 iwl_trans_pcie_clear_p=
ersistence_bit() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2077 __iwl_trans_pcie_grab_=
nic_access() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2434 iwl_pcie_dump_csr() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:208 iwl_pcie_txq_unmap() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:513 iwl_pcie_tx_alloc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1006 iwl_pcie_enqueue_hcmd() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:162 iwl_fwrt_dump_umac_error_l=
og() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:212 iwl_fwrt_dump_lmac_error_l=
og() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:358 iwl_fwrt_dump_iml_error_lo=
g() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:399 iwl_fwrt_dump_fseq_regs() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:412 iwl_fwrt_dump_error_logs()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1108 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1271 iwl_txq_gen2_init() erro=
r: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:1655 iwl_dump_ini_mon_fill_head=
er() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2698 iwl_fw_dbg_collect_sync() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2813 iwl_fw_dbg_read_d3_debug_d=
ata() error: call of '__iwl_err' with no format argument

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:396 iwl_send_phy_db_data() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:404 iwl_send_phy_db_data() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:411 iwl_send_phy_db_data() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:421 iwl_send_phy_db_data() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:431 iwl_send_phy_db_data() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:196 iwl_read_otp_word(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:218 iwl_is_otp_empty()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:333 iwl_read_eeprom() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1337 iwl_pci_probe() warn: we=
 never enter this loop
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1486 iwl_pci_probe() error: u=
ninitialized symbol 'ret'.
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1050 iwl_set_hw_address_=
family_8000() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1562 iwl_read_external_n=
vm() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1593 iwl_read_external_n=
vm() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1915 iwl_pcie_irq_handler() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:2295 iwl_pcie_irq_msix_handler=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:890 iwl_dbg_tlv_set_period=
ic_trigs() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:195 iwl_request_firmware() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:488 iwl_parse_v1_v2_firmware()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:861 iwl_parse_tlv_firmware() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:917 iwl_parse_tlv_firmware() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1009 iwl_parse_tlv_firmware() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1195 iwl_parse_tlv_firmware() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1219 iwl_parse_tlv_firmware() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:69 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:75 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:82 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1488 iwl_trans_pcie_d3_susp=
end() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1570 iwl_trans_pcie_d3_resu=
me() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2086 __iwl_trans_pcie_grab_=
nic_access() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2435 iwl_pcie_dump_csr() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:520 iwl_pcie_tx_alloc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:528 iwl_pcie_tx_alloc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:228 iwl_fwrt_dump_lmac_error_l=
og() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:312 iwl_fwrt_dump_tcm_error_lo=
g() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:335 iwl_fwrt_dump_tcm_error_lo=
g() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1115 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1120 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2704 iwl_fw_dbg_collect_sync() =
error: call of '__iwl_err' with no format argument

vim +/__iwl_err +390 drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c

b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  376  =

b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  377  int iwl_send_phy_db_data(struct iwl_phy_db *phy_db)
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  378  {
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  379  	u8 *data =3D NULL;
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  380  	u16 size =3D 0;
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  381  	int err;
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  382  =

b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  383  	IWL_DEBUG_INFO(phy_db->trans,
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  384  		       "Sending phy db data and configuration to runtime ima=
ge\n");
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  385  =

b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  386  	/* Send PHY DB CFG section */
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  387  	err =3D iwl_phy_db_get_section_data(phy_db, IWL_PHY_DB_CFG,
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  388  					  &data, &size, 0);
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24  389  	if (err) {
b1e1adfa7d30cd drivers/net/wireless/iwlwifi/iwl-phy-db.c Johannes Berg 2013=
-01-24 @390  		IWL_ERR(phy_db->trans, "Cannot get Phy DB cfg section\n");

:::::: The code at line 390 was first introduced by commit
:::::: b1e1adfa7d30cd0e8ad9a5c6a89e8c45ebe084f4 iwlwifi: add NVM and PHY DB=
 code for new MVM driver

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0269505229308762269==--

