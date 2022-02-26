Content-Type: multipart/mixed; boundary="===============6647576165708867704=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/iwl-io.c:315 iwl_dump_rfh() error: call of '__iwl_err' with no format argument
Date: Sun, 27 Feb 2022 03:14:23 +0800
Message-ID: <202202270006.n84xepJY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6647576165708867704==
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
commit: e5f1cc98cc1bd07bc6d4f75e34d89db06a2f8bdb iwlwifi: allow rate-limite=
d error messages
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: ia64-randconfig-m031-20220220 (https://download.01.org/0day-ci/arch=
ive/20220227/202202270006.n84xepJY-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/iwl-io.c:315 iwl_dump_rfh() error: call =
of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-io.c:392 iwl_dump_fh() error: call o=
f '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:390 iwl_send_phy_db_data() =
error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1230 get_crf_id() error: call=
 of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info-gen3.c:71 iwl_pcie_ctxt_i=
nfo_dbg_enable() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:432 iwl_trans_pcie_gen=
2_start_fw() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c:121 iwl_pcie_gen2_enqueue=
_hcmd() error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:874 iwl_dbg_tlv_set_period=
ic_trigs() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1869 iwl_pcie_irq_handler() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:2286 iwl_pcie_irq_msix_handler=
() error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:1655 iwl_dump_ini_mon_fill_head=
er() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2698 iwl_fw_dbg_collect_sync() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2813 iwl_fw_dbg_read_d3_debug_d=
ata() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1108 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1271 iwl_txq_gen2_init() erro=
r: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:208 iwl_pcie_txq_unmap() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:513 iwl_pcie_tx_alloc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1006 iwl_pcie_enqueue_hcmd() e=
rror: call of '__iwl_err' with no format argument

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:196 iwl_read_otp_word(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:218 iwl_is_otp_empty()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:333 iwl_read_eeprom() =
error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/fw/dump.c:228 iwl_fwrt_dump_lmac_error_l=
og() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:312 iwl_fwrt_dump_tcm_error_lo=
g() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:335 iwl_fwrt_dump_tcm_error_lo=
g() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1337 iwl_pci_probe() warn: we=
 never enter this loop
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1486 iwl_pci_probe() error: u=
ninitialized symbol 'ret'.
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
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1050 iwl_set_hw_address_=
family_8000() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1562 iwl_read_external_n=
vm() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1593 iwl_read_external_n=
vm() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:890 iwl_dbg_tlv_set_period=
ic_trigs() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1915 iwl_pcie_irq_handler() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:2295 iwl_pcie_irq_msix_handler=
() error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2704 iwl_fw_dbg_collect_sync() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1115 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1120 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:520 iwl_pcie_tx_alloc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:528 iwl_pcie_tx_alloc() error:=
 call of '__iwl_err' with no format argument

vim +/__iwl_err +315 drivers/net/wireless/intel/iwlwifi/iwl-io.c

f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  314  =

f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22 @315  	IWL_ERR(trans, "RFH register values:\n");
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  316  	for (i =3D 0; i < ARRAY_SIZE(rfh_tbl); i++)
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  317  		IWL_ERR(trans, "  %34s: 0X%08x\n",
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  318  			get_rfh_string(rfh_tbl[i]),
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  319  			iwl_read_prph(trans, rfh_tbl[i]));
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  320  =

f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  321  	for (i =3D 0; i < ARRAY_SIZE(rfh_mq_tbl); i++)
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  322  		for (q =3D 0; q < num_q; q++) {
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  323  			u32 addr =3D rfh_mq_tbl[i].addr;
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  324  =

f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  325  			addr +=3D q * (rfh_mq_tbl[i].is64 ? 8 : 4);
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  326  			IWL_ERR(trans, "  %34s(q %d): 0X%08x\n",
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  327  				get_rfh_string(addr), q,
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  328  				iwl_read_prph(trans, addr));
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  329  		}
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  330  =

f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  331  	return 0;
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  332  }
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  333  =

f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  334  static const char *get_fh_string(int cmd)
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  335  {
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  336  	switch (cmd) {
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  337  	IWL_CMD(FH_RSCSR_CHNL0_STTS_WPTR_REG);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  338  	IWL_CMD(FH_RSCSR_CHNL0_RBDCB_BASE_REG);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  339  	IWL_CMD(FH_RSCSR_CHNL0_WPTR);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  340  	IWL_CMD(FH_MEM_RCSR_CHNL0_CONFIG_REG);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  341  	IWL_CMD(FH_MEM_RSSR_SHARED_CTRL_REG);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  342  	IWL_CMD(FH_MEM_RSSR_RX_STATUS_REG);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  343  	IWL_CMD(FH_MEM_RSSR_RX_ENABLE_ERR_IRQ2DRV);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  344  	IWL_CMD(FH_TSSR_TX_STATUS_REG);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  345  	IWL_CMD(FH_TSSR_TX_ERROR_REG);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  346  	default:
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  347  		return "UNKNOWN";
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  348  	}
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  349  #undef IWL_CMD
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  350  }
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  351  =

313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  352  int iwl_dump_fh(struct iwl_trans *trans, char **buf)
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  353  {
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  354  	int i;
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  355  	static const u32 fh_tbl[] =3D {
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  356  		FH_RSCSR_CHNL0_STTS_WPTR_REG,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  357  		FH_RSCSR_CHNL0_RBDCB_BASE_REG,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  358  		FH_RSCSR_CHNL0_WPTR,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  359  		FH_MEM_RCSR_CHNL0_CONFIG_REG,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  360  		FH_MEM_RSSR_SHARED_CTRL_REG,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  361  		FH_MEM_RSSR_RX_STATUS_REG,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  362  		FH_MEM_RSSR_RX_ENABLE_ERR_IRQ2DRV,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  363  		FH_TSSR_TX_STATUS_REG,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  364  		FH_TSSR_TX_ERROR_REG
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  365  	};
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  366  =

286ca8eb4d0a97 drivers/net/wireless/intel/iwlwifi/iwl-io.c Luca Coelho   20=
19-07-12  367  	if (trans->trans_cfg->mq_rx_supported)
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  368  		return iwl_dump_rfh(trans, buf);
f65ebd888c5660 drivers/net/wireless/intel/iwlwifi/iwl-io.c Sara Sharon   20=
16-05-22  369  =

313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  370  #ifdef CONFIG_IWLWIFI_DEBUGFS
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  371  	if (buf) {
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  372  		int pos =3D 0;
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  373  		size_t bufsz =3D ARRAY_SIZE(fh_tbl) * 48 + 40;
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  374  =

313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  375  		*buf =3D kmalloc(bufsz, GFP_KERNEL);
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  376  		if (!*buf)
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  377  			return -ENOMEM;
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  378  =

313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  379  		pos +=3D scnprintf(*buf + pos, bufsz - pos,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  380  				"FH register values:\n");
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  381  =

313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  382  		for (i =3D 0; i < ARRAY_SIZE(fh_tbl); i++)
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  383  			pos +=3D scnprintf(*buf + pos, bufsz - pos,
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  384  				"  %34s: 0X%08x\n",
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  385  				get_fh_string(fh_tbl[i]),
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  386  				iwl_read_direct32(trans, fh_tbl[i]));
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  387  =

313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  388  		return pos;
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  389  	}
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  390  #endif
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  391  =

313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24 @392  	IWL_ERR(trans, "FH register values:\n");
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  393  	for (i =3D 0; i <  ARRAY_SIZE(fh_tbl); i++)
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  394  		IWL_ERR(trans, "  %34s: 0X%08x\n",
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  395  			get_fh_string(fh_tbl[i]),
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  396  			iwl_read_direct32(trans, fh_tbl[i]));
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  397  =

313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  398  	return 0;
313b0a294f8cc9 drivers/net/wireless/iwlwifi/iwl-io.c       Inbal Hacohen 20=
13-06-24  399  }
c96b5eec2105cc drivers/net/wireless/intel/iwlwifi/iwl-io.c Johannes Berg 20=
18-12-10  400  =


:::::: The code@line 315 was first introduced by commit
:::::: f65ebd888c5660e97b73fdcb94156a4f357a885d iwlwifi: add dump of RFH

:::::: TO: Sara Sharon <sara.sharon@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6647576165708867704==--

