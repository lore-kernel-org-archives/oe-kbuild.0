Content-Type: multipart/mixed; boundary="===============0544454509675099120=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1869 iwl_pcie_irq_handler() error: call of '__iwl_err' with no format argument
Date: Mon, 21 Feb 2022 13:57:17 +0800
Message-ID: <202202211320.VtxL4IEd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0544454509675099120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>
CC: Luca Coelho <luciano.coelho@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cfb92440ee71adcc2105b0890bb01ac3cddb8507
commit: e5f1cc98cc1bd07bc6d4f75e34d89db06a2f8bdb iwlwifi: allow rate-limite=
d error messages
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: ia64-randconfig-m031-20220220 (https://download.01.org/0day-ci/arch=
ive/20220221/202202211320.VtxL4IEd-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1869 iwl_pcie_irq_handler() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:2286 iwl_pcie_irq_msix_handler=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1108 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1271 iwl_txq_gen2_init() erro=
r: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/iwl-io.c:315 iwl_dump_rfh() error: call =
of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-io.c:392 iwl_dump_fh() error: call o=
f '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info-gen3.c:71 iwl_pcie_ctxt_i=
nfo_dbg_enable() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:390 iwl_send_phy_db_data() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1230 get_crf_id() error: call=
 of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c:121 iwl_pcie_gen2_enqueue=
_hcmd() error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:432 iwl_trans_pcie_gen=
2_start_fw() error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:208 iwl_pcie_txq_unmap() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:513 iwl_pcie_tx_alloc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1006 iwl_pcie_enqueue_hcmd() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:1655 iwl_dump_ini_mon_fill_head=
er() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2698 iwl_fw_dbg_collect_sync() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2813 iwl_fw_dbg_read_d3_debug_d=
ata() error: call of '__iwl_err' with no format argument
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

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1915 iwl_pcie_irq_handler() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:2295 iwl_pcie_irq_msix_handler=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1115 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1120 iwl_txq_dyn_alloc_dma() =
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
drivers/net/wireless/intel/iwlwifi/fw/dump.c:228 iwl_fwrt_dump_lmac_error_l=
og() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:312 iwl_fwrt_dump_tcm_error_lo=
g() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:335 iwl_fwrt_dump_tcm_error_lo=
g() error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1337 iwl_pci_probe() warn: we=
 never enter this loop
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1486 iwl_pci_probe() error: u=
ninitialized symbol 'ret'.
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:196 iwl_read_otp_word(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:218 iwl_is_otp_empty()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-eeprom-read.c:333 iwl_read_eeprom() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1050 iwl_set_hw_address_=
family_8000() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1562 iwl_read_external_n=
vm() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1593 iwl_read_external_n=
vm() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:890 iwl_dbg_tlv_set_period=
ic_trigs() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:520 iwl_pcie_tx_alloc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:528 iwl_pcie_tx_alloc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2704 iwl_fw_dbg_collect_sync() =
error: call of '__iwl_err' with no format argument
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

vim +/__iwl_err +1869 drivers/net/wireless/intel/iwlwifi/pcie/rx.c

3a6e168baa7097 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2017-04-25  1784  =

2bfb50924c7e92 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-12-27  1785  irqreturn_t iwl_pcie_irq_handler(int irq, void *de=
v_id)
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1786  {
2bfb50924c7e92 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-12-27  1787  	struct iwl_trans *trans =3D dev_id;
20d3b6475226fb drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Johannes Be=
rg     2012-05-16  1788  	struct iwl_trans_pcie *trans_pcie =3D IWL_TRANS_G=
ET_PCIE_TRANS(trans);
20d3b6475226fb drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Johannes Be=
rg     2012-05-16  1789  	struct isr_statistics *isr_stats =3D &trans_pcie-=
>isr_stats;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1790  	u32 inta =3D 0;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1791  	u32 handled =3D 0;
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  1792  	bool polling =3D false;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1793  =

2bfb50924c7e92 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-12-27  1794  	lock_map_acquire(&trans->sync_cmd_lockdep_map);
2bfb50924c7e92 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-12-27  1795  =

25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  1796  	spin_lock_bh(&trans_pcie->irq_lock);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1797  =

0fec954249b553 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1798  	/* dram interrupt table not set yet,
0fec954249b553 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1799  	 * use legacy interrupt.
0fec954249b553 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1800  	 */
0fec954249b553 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1801  	if (likely(trans_pcie->use_ict))
7117c000c83700 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1802  		inta =3D iwl_pcie_int_cause_ict(trans);
0fec954249b553 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1803  	else
7117c000c83700 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1804  		inta =3D iwl_pcie_int_cause_non_ict(trans);
0fec954249b553 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1805  =

7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1806  	if (iwl_have_debug_level(IWL_DL_ISR)) {
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1807  		IWL_DEBUG_ISR(trans,
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1808  			      "ISR inta 0x%08x, enabled 0x%08x(sw), ena=
bled(hw) 0x%08x, fh 0x%08x\n",
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1809  			      inta, trans_pcie->inta_mask,
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1810  			      iwl_read32(trans, CSR_INT_MASK),
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1811  			      iwl_read32(trans, CSR_FH_INT_STATUS));
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1812  		if (inta & (~trans_pcie->inta_mask))
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1813  			IWL_DEBUG_ISR(trans,
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1814  				      "We got a masked interrupt (0x%08x)\n",
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1815  				      inta & (~trans_pcie->inta_mask));
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1816  	}
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1817  =

7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1818  	inta &=3D trans_pcie->inta_mask;
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1819  =

7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1820  	/*
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1821  	 * Ignore interrupt if there's nothing in NIC to =
service.
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1822  	 * This may be due to IRQ shared with another dev=
ice,
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1823  	 * or due to sporadic interrupts thrown from our =
NIC.
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1824  	 */
7117c000c83700 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1825  	if (unlikely(!inta)) {
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1826  		IWL_DEBUG_ISR(trans, "Ignore interrupt, inta =3D=
=3D 0\n");
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1827  		/*
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1828  		 * Re-enable interrupts here since we don't
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1829  		 * have anything to service
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1830  		 */
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1831  		if (test_bit(STATUS_INT_ENABLED, &trans->status))
f16c3ebfa64fdf drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2016-06-13  1832  			_iwl_enable_interrupts(trans);
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  1833  		spin_unlock_bh(&trans_pcie->irq_lock);
7117c000c83700 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1834  		lock_map_release(&trans->sync_cmd_lockdep_map);
7117c000c83700 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1835  		return IRQ_NONE;
7117c000c83700 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1836  	}
7117c000c83700 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1837  =

7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1838  	if (unlikely(inta =3D=3D 0xFFFFFFFF || (inta & 0x=
FFFFFFF0) =3D=3D 0xa5a5a5a0)) {
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1839  		/*
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1840  		 * Hardware disappeared. It might have
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1841  		 * already raised an interrupt.
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1842  		 */
7ba1faa45f5d1e drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1843  		IWL_WARN(trans, "HARDWARE GONE?? INTA =3D=3D 0x%=
08x\n", inta);
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  1844  		spin_unlock_bh(&trans_pcie->irq_lock);
7117c000c83700 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1845  		goto out;
a0f337cc3592b8 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1846  	}
a0f337cc3592b8 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1847  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1848  	/* Ack/clear/reset pending uCode interrupts.
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1849  	 * Note:  Some bits in CSR_INT are "OR" of bits i=
n CSR_FH_INT_STATUS,
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1850  	 */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1851  	/* There is a hardware bug in the interrupt mask =
function that some
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1852  	 * interrupts (i.e. CSR_INT_BIT_SCD) can still be=
 generated even if
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1853  	 * they are disabled in the CSR_INT_MASK register=
. Furthermore the
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1854  	 * ICT interrupt handling mechanism has another b=
ug that might cause
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1855  	 * these unmasked interrupts fail to be detected.=
 We workaround the
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1856  	 * hardware bugs here by ACKing all the possible =
interrupts so that
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1857  	 * interrupt coalescing can still be achieved.
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1858  	 */
7117c000c83700 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2013-12-11  1859  	iwl_write32(trans, CSR_INT, inta | ~trans_pcie->i=
nta_mask);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1860  =

51cd53ad120f33 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2013-06-12  1861  	if (iwl_have_debug_level(IWL_DL_ISR))
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1862  		IWL_DEBUG_ISR(trans, "inta 0x%08x, enabled 0x%08=
x\n",
51cd53ad120f33 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2013-06-12  1863  			      inta, iwl_read32(trans, CSR_INT_MASK));
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1864  =

25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  1865  	spin_unlock_bh(&trans_pcie->irq_lock);
b49ba04a3a0382 drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Johannes Be=
rg     2012-01-19  1866  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1867  	/* Now service all interrupt bits discovered abov=
e. */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1868  	if (inta & CSR_INT_BIT_HW_ERR) {
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25 @1869  		IWL_ERR(trans, "Hardware error detected.  Restar=
ting.\n");
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1870  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1871  		/* Tell the device to stop sending interrupts */
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1872  		iwl_disable_interrupts(trans);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1873  =

1f7b6172db86e9 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1874  		isr_stats->hw++;
990aa6d7b28d26 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2012-11-14  1875  		iwl_pcie_irq_handle_error(trans);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1876  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1877  		handled |=3D CSR_INT_BIT_HW_ERR;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1878  =

2bfb50924c7e92 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-12-27  1879  		goto out;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1880  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1881  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1882  	/* NIC fires this, but we don't use it, redundant=
 with WAKEUP */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1883  	if (inta & CSR_INT_BIT_SCD) {
51cd53ad120f33 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2013-06-12  1884  		IWL_DEBUG_ISR(trans,
51cd53ad120f33 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2013-06-12  1885  			      "Scheduler finished to transmit the frame=
/frames.\n");
1f7b6172db86e9 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1886  		isr_stats->sch++;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1887  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1888  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1889  	/* Alive notification via Rx interrupt will do th=
e real work */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1890  	if (inta & CSR_INT_BIT_ALIVE) {
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1891  		IWL_DEBUG_ISR(trans, "Alive interrupt\n");
1f7b6172db86e9 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1892  		isr_stats->alive++;
286ca8eb4d0a97 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Luca Coelho=
       2019-07-12  1893  		if (trans->trans_cfg->gen2) {
eda50cde58de73 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Sara Sharon=
       2016-09-28  1894  			/*
eda50cde58de73 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Sara Sharon=
       2016-09-28  1895  			 * We can restock, since firmware configured
eda50cde58de73 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Sara Sharon=
       2016-09-28  1896  			 * the RFH
eda50cde58de73 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Sara Sharon=
       2016-09-28  1897  			 */
eda50cde58de73 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Sara Sharon=
       2016-09-28  1898  			iwl_pcie_rxmq_restock(trans, trans_pcie->rxq);
eda50cde58de73 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Sara Sharon=
       2016-09-28  1899  		}
ed3e4c6d3cd8f0 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2019-05-20  1900  =

ed3e4c6d3cd8f0 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2019-05-20  1901  		handled |=3D CSR_INT_BIT_ALIVE;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1902  	}
51cd53ad120f33 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2013-06-12  1903  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1904  	/* Safely ignore these bits for debug checks belo=
w */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1905  	inta &=3D ~(CSR_INT_BIT_SCD | CSR_INT_BIT_ALIVE);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1906  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1907  	/* HW RF KILL switch toggled */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1908  	if (inta & CSR_INT_BIT_RF_KILL) {
3a6e168baa7097 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2017-04-25  1909  		iwl_pcie_handle_rfkill_irq(trans);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1910  		handled |=3D CSR_INT_BIT_RF_KILL;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1911  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1912  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1913  	/* Chip got too hot and stopped itself */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1914  	if (inta & CSR_INT_BIT_CT_KILL) {
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1915  		IWL_ERR(trans, "Microcode CT kill error detected=
.\n");
1f7b6172db86e9 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1916  		isr_stats->ctkill++;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1917  		handled |=3D CSR_INT_BIT_CT_KILL;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1918  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1919  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1920  	/* Error detected by uCode */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1921  	if (inta & CSR_INT_BIT_SW_ERR) {
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1922  		IWL_ERR(trans, "Microcode SW error detected. "
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1923  			" Restarting 0x%X.\n", inta);
1f7b6172db86e9 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1924  		isr_stats->sw++;
990aa6d7b28d26 drivers/net/wireless/iwlwifi/pcie/rx.c           Emmanuel Gr=
umbach 2012-11-14  1925  		iwl_pcie_irq_handle_error(trans);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1926  		handled |=3D CSR_INT_BIT_SW_ERR;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1927  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1928  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1929  	/* uCode wakes up after power-down sleep */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1930  	if (inta & CSR_INT_BIT_WAKEUP) {
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1931  		IWL_DEBUG_ISR(trans, "Wakeup interrupt\n");
5d63f926d119ff drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2014-02-27  1932  		iwl_pcie_rxq_check_wrptr(trans);
ea68f46070c7ba drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2014-02-27  1933  		iwl_pcie_txq_check_wrptrs(trans);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1934  =

1f7b6172db86e9 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1935  		isr_stats->wakeup++;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1936  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1937  		handled |=3D CSR_INT_BIT_WAKEUP;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1938  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1939  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1940  	/* All uCode command responses, including Tx comm=
and responses,
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1941  	 * Rx "responses" (frame-received notification), =
and other
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1942  	 * notifications from uCode come through here*/
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1943  	if (inta & (CSR_INT_BIT_FH_RX | CSR_INT_BIT_SW_RX=
 |
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1944  		    CSR_INT_BIT_RX_PERIODIC)) {
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1945  		IWL_DEBUG_ISR(trans, "Rx interrupt\n");
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1946  		if (inta & (CSR_INT_BIT_FH_RX | CSR_INT_BIT_SW_R=
X)) {
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1947  			handled |=3D (CSR_INT_BIT_FH_RX | CSR_INT_BIT_S=
W_RX);
1042db2af183b9 drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Emmanuel Gr=
umbach 2012-01-03  1948  			iwl_write32(trans, CSR_FH_INT_STATUS,
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1949  					CSR_FH_INT_RX_MASK);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1950  		}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1951  		if (inta & CSR_INT_BIT_RX_PERIODIC) {
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1952  			handled |=3D CSR_INT_BIT_RX_PERIODIC;
1042db2af183b9 drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Emmanuel Gr=
umbach 2012-01-03  1953  			iwl_write32(trans,
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1954  				CSR_INT, CSR_INT_BIT_RX_PERIODIC);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1955  		}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1956  		/* Sending RX interrupt require many steps to be=
 done in the
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1957  		 * the device:
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1958  		 * 1- write interrupt to current index in ICT ta=
ble.
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1959  		 * 2- dma RX frame.
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1960  		 * 3- update RX shared data to indicate last wri=
te index.
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1961  		 * 4- send interrupt.
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1962  		 * This could lead to RX race, driver could rece=
ive RX interrupt
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1963  		 * but the shared data changes does not reflect =
this;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1964  		 * periodic interrupt will detect any dangling R=
x activity.
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1965  		 */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1966  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1967  		/* Disable periodic interrupt; we use it as just=
 a one-shot. */
1042db2af183b9 drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Emmanuel Gr=
umbach 2012-01-03  1968  		iwl_write8(trans, CSR_INT_PERIODIC_REG,
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1969  			    CSR_INT_PERIODIC_DIS);
6379103e896a5e drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-09-06  1970  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1971  		/*
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1972  		 * Enable periodic interrupt in 8 msec only if w=
e received
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1973  		 * real RX interrupt (instead of just periodic i=
nt), to catch
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1974  		 * any dangling Rx interrupt.  If it was just th=
e periodic
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1975  		 * interrupt, there was no dangling Rx activity,=
 and no need
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1976  		 * to extend the periodic interrupt; one-shot is=
 enough.
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1977  		 */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1978  		if (inta & (CSR_INT_BIT_FH_RX | CSR_INT_BIT_SW_R=
X))
1042db2af183b9 drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Emmanuel Gr=
umbach 2012-01-03  1979  			iwl_write8(trans, CSR_INT_PERIODIC_REG,
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1980  				   CSR_INT_PERIODIC_ENA);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1981  =

1f7b6172db86e9 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1982  		isr_stats->rx++;
f14d6b39c0b351 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2014-03-21  1983  =

f14d6b39c0b351 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2014-03-21  1984  		local_bh_disable();
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  1985  		if (napi_schedule_prep(&trans_pcie->rxq[0].napi)=
) {
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  1986  			polling =3D true;
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  1987  			__napi_schedule(&trans_pcie->rxq[0].napi);
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  1988  		}
f14d6b39c0b351 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2014-03-21  1989  		local_bh_enable();
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1990  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1991  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1992  	/* This "Tx" DMA channel is used only for loading=
 uCode */
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1993  	if (inta & CSR_INT_BIT_FH_TX) {
1042db2af183b9 drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Emmanuel Gr=
umbach 2012-01-03  1994  		iwl_write32(trans, CSR_FH_INT_STATUS, CSR_FH_INT=
_TX_MASK);
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1995  		IWL_DEBUG_ISR(trans, "uCode load interrupt\n");
1f7b6172db86e9 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  1996  		isr_stats->tx++;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1997  		handled |=3D CSR_INT_BIT_FH_TX;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  1998  		/* Wake up uCode load routine, now that load is =
complete */
13df1aab4aa3cd drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Johannes Be=
rg     2012-03-06  1999  		trans_pcie->ucode_write_complete =3D true;
13df1aab4aa3cd drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Johannes Be=
rg     2012-03-06  2000  		wake_up(&trans_pcie->ucode_write_waitq);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2001  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2002  =

ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2003  	if (inta & ~handled) {
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  2004  		IWL_ERR(trans, "Unhandled INTA bits 0x%08x\n", i=
nta & ~handled);
1f7b6172db86e9 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  2005  		isr_stats->unhandled++;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2006  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2007  =

0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  2008  	if (inta & ~(trans_pcie->inta_mask)) {
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  2009  		IWL_WARN(trans, "Disabled INTA bits 0x%08x were =
pending\n",
0c325769a39455 drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-08-25  2010  			 inta & ~trans_pcie->inta_mask);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2011  	}
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2012  =

25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  2013  	if (!polling) {
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  2014  		spin_lock_bh(&trans_pcie->irq_lock);
f16c3ebfa64fdf drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2016-06-13  2015  		/* only Re-enable all interrupt if disabled by i=
rq */
f16c3ebfa64fdf drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2016-06-13  2016  		if (test_bit(STATUS_INT_ENABLED, &trans->status))
f16c3ebfa64fdf drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2016-06-13  2017  			_iwl_enable_interrupts(trans);
a6bd005fe92dc1 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2016-01-31  2018  		/* we are loading the firmware, enable FH_TX int=
errupt only */
f16c3ebfa64fdf drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2016-06-13  2019  		else if (handled & CSR_INT_BIT_FH_TX)
a6bd005fe92dc1 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2016-01-31  2020  			iwl_enable_fw_load_int(trans);
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2021  		/* Re-enable RF_KILL if it occurred */
8722c899a07f45 drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Stanislaw G=
ruszka 2012-03-07  2022  		else if (handled & CSR_INT_BIT_RF_KILL)
8722c899a07f45 drivers/net/wireless/iwlwifi/iwl-trans-pcie-rx.c Stanislaw G=
ruszka 2012-03-07  2023  			iwl_enable_rfkill_int(trans);
ed3e4c6d3cd8f0 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2019-05-20  2024  		/* Re-enable the ALIVE / Rx interrupt if it occu=
rred */
ed3e4c6d3cd8f0 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2019-05-20  2025  		else if (handled & (CSR_INT_BIT_ALIVE | CSR_INT_=
BIT_FH_RX))
ed3e4c6d3cd8f0 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Emmanuel Gr=
umbach 2019-05-20  2026  			iwl_enable_fw_load_int_ctx_info(trans);
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  2027  		spin_unlock_bh(&trans_pcie->irq_lock);
25edc8f259c710 drivers/net/wireless/intel/iwlwifi/pcie/rx.c     Johannes Be=
rg     2021-01-17  2028  	}
2bfb50924c7e92 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-12-27  2029  =

2bfb50924c7e92 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-12-27  2030  out:
2bfb50924c7e92 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-12-27  2031  	lock_map_release(&trans->sync_cmd_lockdep_map);
2bfb50924c7e92 drivers/net/wireless/iwlwifi/pcie/rx.c           Johannes Be=
rg     2012-12-27  2032  	return IRQ_HANDLED;
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2033  }
ab697a9f1e73ba drivers/net/wireless/iwlwifi/iwl-trans-rx-pcie.c Emmanuel Gr=
umbach 2011-07-11  2034  =


:::::: The code at line 1869 was first introduced by commit
:::::: 0c325769a394559941acda83e888a1d9b1ef8b7f iwlagn: move ISR related da=
ta to transport layer

:::::: TO: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0544454509675099120==--

