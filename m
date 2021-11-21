Content-Type: multipart/mixed; boundary="===============8708700304447674778=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/iwl-phy-db.c:390 iwl_send_phy_db_data() error: call of '__iwl_err' with no format argument
Date: Sun, 21 Nov 2021 17:24:04 +0800
Message-ID: <202111211756.slJo24ET-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8708700304447674778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>
CC: Luca Coelho <luciano.coelho@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   923dcc5eb0c111eccd51cc7ce1658537e3c38b25
commit: e5f1cc98cc1bd07bc6d4f75e34d89db06a2f8bdb iwlwifi: allow rate-limite=
d error messages
date:   4 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-m031-20211104 (attached as .config)
compiler: mips-linux-gcc (GCC) 11.2.0

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
drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:432 iwl_trans_pcie_gen=
2_start_fw() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-io.c:315 iwl_dump_rfh() error: call =
of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/iwl-io.c:392 iwl_dump_fh() error: call o=
f '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info-gen3.c:71 iwl_pcie_ctxt_i=
nfo_dbg_enable() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c:121 iwl_pcie_gen2_enqueue=
_hcmd() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:162 iwl_fwrt_dump_umac_error_l=
og() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:212 iwl_fwrt_dump_lmac_error_l=
og() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:312 iwl_fwrt_dump_tcm_error_lo=
g() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:358 iwl_fwrt_dump_iml_error_lo=
g() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:399 iwl_fwrt_dump_fseq_regs() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:412 iwl_fwrt_dump_error_logs()=
 error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1108 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1271 iwl_txq_gen2_init() erro=
r: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/paging.c:137 iwl_fill_paging_mem() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/paging.c:283 iwl_init_paging() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:65 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:620 iwl_pcie_prepare_card_h=
w() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:675 iwl_pcie_load_firmware_=
chunk() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1331 iwl_trans_pcie_start_f=
w() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1488 iwl_trans_pcie_d3_susp=
end() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1540 iwl_trans_pcie_d3_resu=
me() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1732 iwl_trans_pcie_clear_p=
ersistence_bit() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2077 __iwl_trans_pcie_grab_=
nic_access() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2434 iwl_pcie_dump_csr() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1869 iwl_pcie_irq_handler() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:2286 iwl_pcie_irq_msix_handler=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:1655 iwl_dump_ini_mon_fill_head=
er() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2698 iwl_fw_dbg_collect_sync() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2813 iwl_fw_dbg_read_d3_debug_d=
ata() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/mac80211.c:274 __iwl_up() error: cal=
l of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/mac80211.c:411 iwl_resume_status_fn(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/mac80211.c:1106 iwlagn_mac_flush() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:198 iwlagn_send_beacon_cmd() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:271 iwl_bg_beacon_update() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:677 iwl_rf_kill_ct_config() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:755 iwl_send_bt_config() erro=
r: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1037 iwl_bg_restart() error: =
call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1177 iwl_eeprom_init_hw_param=
s() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1387 iwl_op_mode_dvm_start() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1634 iwl_dump_nic_error_log()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1849 iwl_dump_nic_event_log()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1928 iwlagn_fw_error() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1964 iwl_cmd_queue_full() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:2030 iwl_wimax_active() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/ucode.c:179 iwl_send_prio_tbl() erro=
r: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/ucode.c:193 iwl_send_bt_env() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/ucode.c:332 iwl_load_ucode_wait_aliv=
e() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:568 rate_n_flags_from_tbl() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:1681 rs_move_siso_to_other() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:2273 rs_rate_scale_perform() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:338 iwl_mvm_load_ucode_wait_ali=
ve() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1410 iwl_mvm_up() error: call o=
f '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/nvm.c:196 iwl_nvm_read_section() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/nvm.c:229 iwl_parse_nvm_sections() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/nvm.c:372 iwl_nvm_init() error: call=
 of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/lib.c:156 iwlagn_dev_txfifo_flush() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/lib.c:237 iwlagn_send_advance_bt_con=
fig() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/lib.c:899 iwlagn_wowlan_program_keys=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/ops.c:1127 iwl_op_mode_mvm_start() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/ops.c:1606 iwl_mvm_nic_restart() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rx.c:633 iwlagn_pass_packet_to_mac80=
211() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rx.c:789 iwlagn_rx_reply_rx() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tx.c:584 iwlagn_tx_agg_start() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tx.c:656 iwlagn_tx_agg_flush() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1102 iwl_check_abort_status() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1280 iwlagn_rx_reply_compressed=
_ba() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/scan.c:463 iwl_get_channel_for_reset=
_scan() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:264 iwl_mvm_mac_ctxt_init=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:1480 iwl_mvm_rx_stored_be=
acon_notif() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/led.c:70 iwl_blink_compensation() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/utils.c:447 iwl_mvm_send_low_latency=
_cmd() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/utils.c:553 iwl_mvm_get_bss_vif() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/sta.c:57 iwl_process_add_sta_resp() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/sta.c:440 iwl_send_remove_station() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/sta.c:869 iwl_sta_alloc_lq() error: =
call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/sta.c:1272 iwlagn_alloc_bcast_statio=
n() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/sta.c:1310 iwl_update_bcast_station(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tt.c:302 iwl_legacy_tt_handler() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tt.c:439 iwl_advance_tt_handler() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tt.c:491 iwl_bg_ct_enter() error: ca=
ll of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tt.c:523 iwl_bg_ct_exit() error: cal=
l of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tt.c:617 iwl_tt_initialize() error: =
call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:130 iwlagn_disable_pan() erro=
r: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:177 iwlagn_update_qos() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:177 iwlagn_update_qos() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:490 iwlagn_rxon_connect() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:662 _iwl_set_rxon_ht() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:1063 iwlagn_commit_rxon() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:1376 iwlagn_chain_noise_reset=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:1514 iwlagn_bss_info_changed(=
) warn: excess argument passed to '__iwl_err'
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:1514 iwlagn_bss_info_changed(=
) warn: excess argument passed to '__iwl_err'
drivers/net/wireless/intel/iwlwifi/dvm/rxon.c:1521 iwlagn_bss_info_changed(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/rx.c:323 iwl_mvm_rx_rx_mpdu() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/binding.c:160 iwl_mvm_binding_remove=
_vif() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c:1723 iwl_mvm_rx_mpdu_mq() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c:2058 iwl_mvm_rx_monitor_no_da=
ta() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sf.c:182 iwl_mvm_sf_config() error: =
call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:429 iwl_mvm_mac_setup_reg=
ister() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:1263 iwl_mvm_get_free_phy=
_ctxt() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:1437 iwl_mvm_mac_add_inte=
rface() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:2236 iwl_mvm_cfg_he_sta()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:2293 iwl_mvm_bss_info_cha=
nged_station() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:3673 iwl_mvm_rx_aux_roc()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:3864 iwl_mvm_roc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:4044 __iwl_mvm_add_chanct=
x() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:4326 iwl_mvm_switch_vif_c=
hanctx_swap() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:4383 iwl_mvm_switch_vif_c=
hanctx_reassign() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:4451 iwl_mvm_set_tim() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:4827 iwl_mvm_mac_flush() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/tx.c:642 iwl_mvm_probe_resp_set_noa(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/tx.c:720 iwl_mvm_tx_skb_non_sta() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:215 iwl_mvm_sta_send_to_fw() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:592 iwl_mvm_get_shared_queue()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:1416 iwl_mvm_reserve_sta_strea=
m() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:1760 iwl_mvm_rm_sta_common() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2417 __iwl_mvm_remove_sta_key(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2617 iwl_mvm_sta_rx_agg() warn=
: excess argument passed to '__iwl_err'
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2617 iwl_mvm_sta_rx_agg() warn=
: excess argument passed to '__iwl_err'
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2734 iwl_mvm_sta_tx_agg() warn=
: excess argument passed to '__iwl_err'
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2734 iwl_mvm_sta_tx_agg() warn=
: excess argument passed to '__iwl_err'
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2810 iwl_mvm_sta_tx_agg_start(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2949 iwl_mvm_sta_tx_agg_oper()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:3121 iwl_mvm_sta_tx_agg_flush(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:3360 iwl_mvm_send_sta_key() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:3493 __iwl_mvm_set_sta_key() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:3531 iwl_mvm_set_sta_key() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/scan.c:443 iwl_mvm_rx_lmac_scan_comp=
lete_notif() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/scan.c:2501 iwl_mvm_scan_timeout_wk(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/scan.c:2600 iwl_mvm_reg_scan_start()=
 error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/scan.c:2695 iwl_mvm_sched_scan_start=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:454 iwl_mvm_te_notif() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:486 iwl_mvm_time_event_=
response() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:631 iwl_mvm_protect_ses=
sion() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:775 iwl_mvm_remove_time=
_event() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:1133 iwl_mvm_session_pr=
ot_notif() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:1195 iwl_mvm_schedule_s=
ession_protection() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/coex.c:400 iwl_mvm_bt_notif_iterator=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/coex.c:482 iwl_mvm_bt_coex_notif_han=
dle() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/coex.c:546 iwl_mvm_bt_rssi_event() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/tt.c:21 iwl_mvm_enter_ctkill() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/tt.c:43 iwl_mvm_exit_ctkill() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/tt.c:71 iwl_mvm_temp_notif_parse() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/tt.c:126 iwl_mvm_temp_notif() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/tt.c:374 iwl_mvm_tt_tx_backoff() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/led.c:60 iwl_mvm_leds_init() error: =
call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/ftm-responder.c:158 iwl_mvm_ftm_resp=
onder_cmd() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/ftm-responder.c:329 iwl_mvm_ftm_resp=
oder_add_pasn_sta() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/ftm-responder.c:398 iwl_mvm_ftm_star=
t_responder() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:933 iwl_mvm_ftm_abor=
t() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:1004 iwl_mvm_ftm_ran=
ge_resp_valid() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/rs.c:2104 rs_rate_scale_perform() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:816 iwl_mvm_d3_reprogram() erro=
r: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:877 iwl_mvm_set_last_nonqos_seq=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:1851 iwl_mvm_parse_wowlan_statu=
s_common_v6() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:1851 iwl_mvm_parse_wowlan_statu=
s_common_v6() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:1852 iwl_mvm_parse_wowlan_statu=
s_common_v7() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:1852 iwl_mvm_parse_wowlan_statu=
s_common_v7() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:1853 iwl_mvm_parse_wowlan_statu=
s_common_v9() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:1853 iwl_mvm_parse_wowlan_statu=
s_common_v9() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2090 iwl_mvm_netdetect_query_re=
sults() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:2196 iwl_mvm_query_netdetect_re=
asons() error: call of '__iwl_err' with no format argument

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
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1486 iwl_pci_probe() error: u=
ninitialized symbol 'ret'.
drivers/net/wireless/intel/iwlwifi/fw/dump.c:228 iwl_fwrt_dump_lmac_error_l=
og() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dump.c:335 iwl_fwrt_dump_tcm_error_lo=
g() error: call of '__iwl_err' with no format argument
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
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1115 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/queue/tx.c:1120 iwl_txq_dyn_alloc_dma() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/paging.c:147 iwl_fill_paging_mem() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/paging.c:289 iwl_init_paging() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:69 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:75 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:82 iwl_trans_pcie_dump_regs=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1570 iwl_trans_pcie_d3_resu=
me() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2086 __iwl_trans_pcie_grab_=
nic_access() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2435 iwl_pcie_dump_csr() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:1915 iwl_pcie_irq_handler() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/pcie/rx.c:2295 iwl_pcie_irq_msix_handler=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/fw/dbg.c:2704 iwl_fw_dbg_collect_sync() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:288 iwl_bg_beacon_update() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:692 iwl_rf_kill_ct_config() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1183 iwl_eeprom_init_hw_param=
s() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/main.c:1466 iwl_op_mode_dvm_start() =
error: snprintf() chops off the last chars of 'fw->fw_version': 64 vs 32
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:1042 rs_tx_status() warn: varia=
ble dereferenced before check 'sta' (see line 879)
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:2289 rs_rate_scale_perform() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:2331 rs_rate_scale_perform() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:2422 rs_rate_scale_perform() er=
ror: testing array offset 'low' after use.
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:2462 rs_rate_scale_perform() er=
ror: testing array offset 'low' after use.
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:2496 rs_rate_scale_perform() er=
ror: testing array offset 'low' after use.
drivers/net/wireless/intel/iwlwifi/dvm/rs.c:2709 rs_get_rate() error: we pr=
eviously assumed 'lq_sta' could be null (see line 2704)
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:345 iwl_mvm_load_ucode_wait_ali=
ve() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:632 iwl_run_init_mvm_ucode() er=
ror: we previously assumed 'mvm->nvm_data' could be null (see line 617)
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1499 iwl_mvm_up() warn: missing=
 error code 'ret'
drivers/net/wireless/intel/iwlwifi/mvm/nvm.c:241 iwl_parse_nvm_sections() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/nvm.c:248 iwl_parse_nvm_sections() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/nvm.c:256 iwl_parse_nvm_sections() e=
rror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/lib.c:304 iwlagn_send_advance_bt_con=
fig() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/ops.c:1103 iwl_op_mode_mvm_start() e=
rror: snprintf() chops off the last chars of 'fw->fw_version': 64 vs 32
drivers/net/wireless/intel/iwlwifi/mvm/ops.c:1615 iwl_mvm_nic_restart() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/ops.c:1629 iwl_mvm_nic_restart() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tx.c:377 iwlagn_tx_skb() warn: poten=
tial spectre issue 'priv->tid_data[sta_id]' [r] (local cap)
drivers/net/wireless/intel/iwlwifi/dvm/tx.c:591 iwlagn_tx_agg_start() error=
: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1164 iwlagn_rx_reply_tx() error=
: testing array offset 'tid' after use.
drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1224 iwlagn_rx_reply_tx() error=
: testing array offset 'tid' after use.
drivers/net/wireless/intel/iwlwifi/dvm/tx.c:1293 iwlagn_rx_reply_compressed=
_ba() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/scan.c:484 iwl_get_channel_for_reset=
_scan() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/scan.c:656 iwlagn_request_scan() war=
n: is 'priv->scan_cmd' large enough for 'struct iwl_scan_cmd'? 0
drivers/net/wireless/intel/iwlwifi/dvm/scan.c:671 iwlagn_request_scan() err=
or: we previously assumed 'vif' could be null (see line 642)
drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:275 iwl_mvm_mac_ctxt_init=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/sta.c:60 iwl_process_add_sta_resp() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/sta.c:64 iwl_process_add_sta_resp() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/dvm/sta.c:1284 iwlagn_alloc_bcast_statio=
n() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c:1964 iwl_mvm_rx_mpdu_mq() war=
n: inconsistent indenting
drivers/net/wireless/intel/iwlwifi/mvm/sf.c:189 iwl_mvm_sf_config() error: =
call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:432 iwl_mvm_mac_setup_reg=
ister() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:2359 iwl_mvm_bss_info_cha=
nged_station() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:2368 iwl_mvm_bss_info_cha=
nged_station() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:2386 iwl_mvm_bss_info_cha=
nged_station() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:2426 iwl_mvm_bss_info_cha=
nged_station() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:2436 iwl_mvm_bss_info_cha=
nged_station() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:3945 iwl_mvm_roc() error:=
 call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:4333 iwl_mvm_switch_vif_c=
hanctx_swap() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:4349 iwl_mvm_switch_vif_c=
hanctx_swap() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:4355 iwl_mvm_switch_vif_c=
hanctx_swap() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:4393 iwl_mvm_switch_vif_c=
hanctx_reassign() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/tx.c:197 iwl_mvm_set_tx_cmd() warn: =
potential spectre issue 'tid_to_mac80211_ac' [r] (local cap)
drivers/net/wireless/intel/iwlwifi/mvm/tx.c:201 iwl_mvm_set_tx_cmd() warn: =
possible spectre second half.  'ac'
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:2631 iwl_mvm_sta_rx_agg() warn=
: possible memory leak of 'baid_data'
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:3125 iwl_mvm_sta_tx_agg_flush(=
) error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/sta.c:3546 iwl_mvm_set_sta_key() err=
or: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:467 iwl_mvm_te_notif() =
error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:635 iwl_mvm_protect_ses=
sion() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:1140 iwl_mvm_session_pr=
ot_notif() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:1213 iwl_mvm_schedule_s=
ession_protection() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/time-event.c:1218 iwl_mvm_schedule_s=
ession_protection() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/coex.c:403 iwl_mvm_bt_notif_iterator=
() error: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/rs.c:2117 rs_rate_scale_perform() er=
ror: call of '__iwl_err' with no format argument
drivers/net/wireless/intel/iwlwifi/mvm/rs.c:2233 rs_rate_scale_perform() er=
ror: testing array offset 'low' after use.
drivers/net/wireless/intel/iwlwifi/mvm/rs.c:2244 rs_rate_scale_perform() er=
ror: testing array offset 'high' after use.

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

--===============8708700304447674778==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICBgJmmEAAy5jb25maWcAnDxdc+O2ru/9FZrtSztzuo2dZD/unTzQFGWxlkQtSTlOXjRuot16
msR7HKcf//4C1BcpUU7mds5pEwIEQRAAARDKjz/8GJCX4/5xe9zdbR8e/g2+VU/VYXus7oOvu4fq
f4NQBJnQAQu5fg/Iye7p5Z9fH3ffn4PL97PL92e/HO4uglV1eKoeArp/+rr79gLTd/unH378gYos
4suS0nLNpOIiKzXb6Kt3OP2XB6T0y7e7u+CnJaU/B7PZ+/n7s3fWJK5KgFz92w4te0JXs9nZ/Oys
Q05Ituxg3TBRhkZW9DRgqEWbn3/sKSQhoi6isEeFIT+qBTiz2I2BNlFpuRRa9FQGgFIUOi+0F86z
hGdsBMpEmUsR8YSVUVYSrWWPwuWX8lrIVT+yKHgSap6yUpMFTFFC4mpwGj8GS3O2D8FzdXz53p/P
QooVy0o4HpXmFu2M65Jl65JI2DRPub46n3e8iTRHjjRTSP7HoBm/ZlIKGeyeg6f9ERfqpCYoSVqx
vXvnsFsqkmhrMGQRKRJtOPAMx0LpjKTs6t1PT/un6ucOQd2oNc8tjcmF4psy/VKwgjlcEk3j0gzb
rHZwKoVSZcpSIW9Q4oTGni0ViiV8YdMlBZiJjWnEDocUPL/8/vzv87F67MW+ZBmTnJozhANeWCdv
g1Qsrv0QFkWMar5mJYmiMiVq5cejMc9dlQlFSnjmjime+pDKmDNJJI1vxsRTxRFzEjBaJyZZCErT
UHamInokJGVhqWPJSMizpS1ae0MhWxTLSLlHVz3dB/uvA2EPGTOGsQY9AWVMxnxT0NIVW7NMKw8w
Faos8pBo1hqU3j1Wh2ff4WpOV2BRDE7PMnYw5fgWbScVmb05GMxhDRFy6tGzehYHydlzzKgHO+bL
uJRMmb1KZaY0shmx21lhHtmHBBpFYaj8jXeuA351ttmxgXiNPL2m1NDxnpVLtDNayViaa9hg5my4
HV+LpMg0kTfe9RqskRHSvPhVb5//DI4ghGALDDwft8fnYHt3t395Ou6evg0ODyaUhFIBaw1Ucc2l
HoBRSTxngcpqVM4h1EpGhWj3lIGrAbiehpTr8x6owc6VJraG4hAYRUJuBoQMYOMZ48LLUq6480vn
ckOu8DYJbW16g0S72wKExZVIiOZG8c2JSFoEymc52U0JMFvi8GvJNmAi2iNkVSPb01U7v2HVXaqn
y1f1D15N4qsY3BCYkGfN1icoGoPDMm6j3Za6+6O6f3moDsHXant8OVTPZrjhxAO1rp2lFEWuvNzg
hadyAjrhYQe4oKtc8Eyj5WshHcOpmSSFFoa+lzyYcKTguMF8KDi40LOIRAWz6S4S1Lq1uaZl6Ld+
IcBURjLuAxyRg33wW4a+H30g/CclGXX4H6Ip+MHn+NBvQTARwqnBmiHcM0STkmHokrWa1xE9ieiL
X8JSyBwuMAgepHWloe/TCWgnZbk2Ia4k1LrKa7Xtf0/BnDhEDlYQp5ZM4+1d9vfS4Fw8DraBR/WV
Ogx5LN/f+UXQjpWHAlylFrdJBBKRFr0FUSD1wuUqKiCQ99BiuRiwz5cZSSK/chgmI5+qmSvYjsVV
DMGYFcVzYa8C3qyA7flUjIRrDhtoBGj5TKC3IFJy+yBWiHKTOnJrx0q//DuwkROaCAZkPUk8aeNC
7d2sqImze/em2BefFNIFC0NmTTQqjlZSDoMUMwiLlesUOBJ2DExnZxetc2oStbw6fN0fHrdPd1XA
/qqewGsT8E8U/TZECL0zdtfqGDYB2GhN7x3/xhXbBddpvVxpLqeBDmPSQTTkKz49VglxYnGVFAu/
q0vEYmI+aIVcsvbWc6kBNILYIuEKnCwYnUgnqNuIMZEhXBV+/VdxEUUQDucE1jQSJNqbO4H2apbW
XgpSKB5xOvJndYroNwLjksz14ISDbjrYGQbPVasu6fbuj91TBRgP1V2T1HcrImJ3Ea6YzJg/AjR4
JIFLKPWHbER+9FmujueXTnKl44+f/beMzYofg6YXHzebKdiH8wmYIUzFAvJTPxwyQ1AXigHZ4N5w
cX4jt7fTUDg2lmE4MTSi9vIhEKh9mZ6fCJEtlcjO56/jzFn0OtKHi2lxgLFrMk0i5/QUG2t5MZsS
NsIz0FIG1jXBgSSg46vp6ZA5JpqtSqn9yqiWkJnmcz+DDfDjKeCnE8Dzs1PAiTX54kZDviVjnvmL
ES0GkemEhfU0xGkaryIoCG4m/FqNkHCtE6YKeZIKOHCh/DrSoCz4cpJIxssJJswR683551MapDcX
k3C+kkJzUI/F5cR5ULLmRVoKqhkWxCYMMkvScpNIiG/JRORbY+RjjHaXgoLjuzyfza0ox4zNz2eX
9vXN+7HOdY8d8zAzia8ZX8ZW4NmVMcCCFhJi/DpjtFY3aYJIuYb7C7KN0twYdnxE2RruvgurzEQh
03JHao+JCZGnzoJ1pFIVeS6kxloKVr2sICZMCWb9VMRMggo5QbYphTIik5smlLWYgOxygfFSFnLi
hub9Yj4Ew2syA5HA1uE65pG+uuzKBc6tZy2Fs87npZyN+RuC7VzZc1Y9ursZHLPJawJRiYYMmoB/
W1/NvBs8ny/g5Op72CX3CgrGKGD2rK6KdmGCHS8e//1e9UIwZJzYAwMYzMrKi5U/5uoxZh9Wvuir
R/gANHrmTEkQ7HpT3oLrEhBNyavZzN4dyh2y1ogB8+6+W40PizQvdbIYHHyUt5Jxp4E6A6wYD9Zq
4hBCUMZYaKr0KiVSG9KQpKacStHEUgNu1U1GB7wQxcNGAc/GABC3uvrkPVKs9rmpEZpYBGkIjILC
Y9XGqTRe2zG996zi23Luv3wBcuG//wAyO/PffgiauDVxpcvJWfPLDyfWOvMokYHMLyY8AJGo/fGt
pfm3V4jvOsBYYvnPSQHZhvnqslQSFRvtstx1fKMgOk9KiAhBsc7++dr88+nizPwzCKYEuIoo/3DR
sulZpvaoaYiPQ+CZRWqqKonA2pTNpoOH7yqaZyXbYDR1KjMztm290qxC5jEM2A5dmTxiDMuX9VNT
AkoFKfa8qRi/PAf77+jvnoOf4Bb7T5DTlHLyn4CBI/tPYP6l6c9WsglXXSg5PhIBrSWh1uWUpsVA
x9OU5KXMauuAzWe9hfjgZHM1u/QjtGnlK3QctJpcX8l+62atlCxsqiOds833f1eHAHLk7bfqEVLk
lmIvIcNQzBfgwU2+gdUeCKjs+k9zxaocjt0DbiCjAZOy3jpVqQagVjwfuKw8hTSXMaeGAWNYYTTj
/isghQtmxVDDfCXMPB1QMzUGL2Lv2M07klMiuP4Cm75mEh/HOOVYSWiy+TeR6vZl+dqGs+akJw+p
CxtqjLTDAEAH4/cPlRtNcKd6146US7GGrC8MnfDLBqYsKyZAELl2CTz4hG7hIDzs/qrLO30g6Uew
45aaZ3tktENDMdodHv/eHuxlzDhmFMpU3rFB4HjYP5jHgn56wLEG9HV7VwX5YX/c3+0f7DoDzAfX
nHIscWhBReL1Zv+vVYaL5P5F2liEy9QESnC1glNwSuF1faHM1hA5+94LhFji+31DoXs/rL4dtsHX
VnD3RnD28UwgtOCRyLsyGpe6gED/tq0TOREv+DKSlZhIl+tQdcrS1oO2B0gujhCrvhyqX+6r77CY
1xuthvH7bxhoJWRhR5emMoL1IbyKWRI1DQO2t8ISYntfLSADtexvJZkermKKoFxIho4Zj2sAGrFV
j05RylLrzau+4bj8AhHUUo2vOjPDMG0wYyFWAyDmMPC75stCFJ5XZAUiMpZav3IPRIHhIYS8mkc3
kA0Wkg49OyLgEgrygSIzEemQRh3liygqR4yrtExF2HRhDAUhGeyYoMfHux7fB837Y86HeIp9GQyZ
kBLn+8axBN7QdGOlXpg+xTGAawIOnOcU8gOJheamf8RDQjGKF/QJEFhf4qSzoylTiIaU2QGqG6Na
SEfB3zAOv0phP7UmWrQv3PYqqDoQsxn1WjlvswYMigGznBgWhydepIc2c+o12mCAcjQiyxnFMrPl
OURYJEwZY8VXIummkA15tkHVy+qGEhSAR33NbFNAh3TPd15O5DZAMAt4Tced9WmsRu1bthZ5KK6z
ekJCboTTjpUIjJ6Bc/DToZ281dFfbVwoRc/OMPgH8migvn01PVOyjO2rw5RKrDcPX3BUK2BtA01R
pcykz1amnilt6eMDX7OfzvVTsf7l9+1zdR/8WacF3w/7r7uHui2ib8IBNE+pf7iGQWt71toHzfbR
4cRKznax2y9PiiW3HZU7aPHVDsOBahQl/F+K3P/eYGGjHoJlFtTfoPLGG7HlDowwxZdR+44x74IK
H8iszN7YEob/pXnv1iMzc/K6GruuhGDa5y9t1lhFdgqj9fy+LLPhSdK2V9Op3PUs+8Zq5ryQwXu2
BVExmZ1gpMaYm3R+YvpUhcDFOv808ZjhYF3O5qeZAcWOr949/7EFlt4N4GhMEm/LYc/SEL685f7s
aIi4mXgtGqDdKu0rLjdo+KZ4DTEfJIGZ1UFS8tRURJzzMrERXLMaNvnr8++7p18f9/dgmr9X74ZX
gIZUEV+KVoUbA6Mn87kFlVm1zCKr21zBnYH9obqOLgm8YkxvZmiQTMY4jSKvfQh142xWCtDmhOQ5
CgDSKSM0IwSrxNhlvsbVsX+qu5fj9ndIh7ADOjDP1sdnp+eNZ1Gq0ZVOecEewwTAjk40MEUlz/2v
ig0GHJy37ATuuwmkOkc1xXSdBFaP+8O/dio0CuWbguHg1oqI0uWyyAeyXUGKbPon3LNr2mXtPq82
FMoTuDRzba46CFPU1cVg0gJV1Z7SDNTXFHXJ+cZM/Vgy1GsnrEn5UpLhdIzOy0GbhAmh4O5e2EF7
mhagRRB0uW0iyhJUG1WYaCIFlUYtu7o4+/yhxcD6MEbCJkBbOWUOmjBSB/G+czZRRI8LUf9UTaSD
RWo4xTQQTUyBTJSoq4/9hNtcDNPrFqLGPR626E1Kg0lTLxkzZIDjYBbEYcrYTR9jfzUXuWkpPxVd
5PjCiPEpSVqbDbfHbUDu7qrn5yDdP+2O+8MgcglJOnyeb0xnam5XIZm0nv6Auzgqq45/7w9/AgHL
xqxXELpivr2BU9xcPdq/YcXDMruoHhTCaXExYyEnE/2LGfO7FxjHbwYw3UmJt5cGMEDMOX5XAXdH
5HT9tbMh2DVxMJxhmvv7TgB1mEp1Q9iZhY1+YXeGjD5Vx/9BEYILO1aH0eckVvsRRQ6zqATjXhTJ
sG2mP9tXaHby1SmI3+o0SbHlwmeUSlvecEmkewNKHi59s9ZArfx0Np9ZiXM/Vi7XLh0LlALIQ7CW
gM1zIxMJ2Qzzfn+RWM4Ofpm7GyaJTw82c+slGq7RRa+kObYS6P53zhhDli+t55d+rMyS5gfTDwlq
k2mSeDEVtuA7W0sJrWFT2ly/3HihIfW9NoaZwkZZgR+k9FtYwLkTdOBr51C70TKbaC7qMaYctIWC
ztDxhet6x44fbMdG1j2EwyWZL5w8Gy8yLnqqjxOA/jOEXpCmJIhLOjFsnvguEGOBykllY+Xv6Pgi
tU8ljb5u8Ma9KZvG0VZcX5KBRw2O1fOx9emNdY9AA4Dthfu4JpUk5F3NM9/e/VkdA7m93+0xEzV1
YfvFZTNoQoPf8TIh2Oi39vfSwL7kRHegFMqZUxfIN+/nl8FTs5v76q/dXVvqdcPO/AvTMfPLeEFu
4EBLrLVFoa8310KIw41tXw0kJ75DaoAsz+0pNyT1OtyTW+lCD5L1WomVaEmu3YEFdfwxDi2vJ9p1
svK32edzf2MgQiEe1flI5gAJwpq9/rnCmrUeMbnejIZCth6ySUlCsQKF7eqZ/15GNKI/zyaBUcJw
LV/Qhrsl2W3J4adzl5nVmuDZ5pSzKByypYrsgvuf5bAwNbkYHR+WGSpzuHSxduGFUT4SC/340fdi
bw4o4vjfMdPpCcZyRlYTe5WU+E2kBdarTRBWvxHsLnD3xVLl21X0afbhzFfDcM/DpdVyPiTW7cib
8xmRb8bUGnaxN8gP8B+UEpHJkx57a4BUO9i1T2QDa4j5+Wy2GZ0PzeeXM3+nnQUfdv+3D4njNV3b
whZzsDBOmdO17LFcy5VNtOlS7YuirrlkCVNWwteOYN+ENYoVefezCDOUS7628spoiWHKzBZTHfbM
TE6TinDia9NmIu6WJQJTRSzewvl4E7cWmzJ8J2pawUuR2YlrhyTZlwL2ZFoNsFjClqGTQnSIWFGp
K7s1knmxO7U8CECSHjfkEj/VHRMGDGA1SSBMh5uH+wvcDjZ+RbHBhiouvay2KXd+kpIvH+5EJ0Ny
ouOmw7t21KCJQ2ee2BQYp5j9Ky29pXEbrf26AKRVfzC2f6yCv3eH6gFT0OayDA7Vf19gLNgG+DV+
cNe+aT98g/z0+If1wVxHG3KxeMxtmbDQrSe3AM9ntB6Sqs3g3bqKQ2TQjdABM9F90z5eHmLvBYRD
45h5jJom6ZvwIBedDME7pFjXOB5+BV10sDF1vlDqdfK5OkECYunXKeDDTHyKSHyd5m8SGyiEad15
w5qIShU5tSyi5B4JjFF1mLxBUnhaWFU37Z3Y+9m/kMhoxe2EoP69VWV3cJlDOG/7XEgrPvur7JRw
/8cPWeRP7XJF4Mh8KT2uwiNmL5xc6yLzP40hNnh3zK+swjPhiXAyUAjvtRBJm4p1pZGJQLV+Y6fW
A339SOQMDX/xdU1h2IG+EFIxX4EPoETlqUPGjPi+lOpgpg9LTSVJLho64zch91+ITiKWufa14ODW
UzWQxdQfKmhhdTctSRLMsZULx4t1ODZwLDiEX6Qkgja9uKZJzkVQuli4I/hJ/WjQ+eIbB7hYD+SO
AcmUWCC9U9xfIzFCg6MvQX0ZNo5M6IDBmThxA1MkOnEsiPGm86sRmZzjv3yv4ZDQJcVAs63BktaQ
vi5hwVScO6ZeVwEob29Y/DTbk3sbxjb4gR1EJtf+GjmS12wp/R++GAom/cC/X/IKylQPZc/Fa3AQ
gr8EgVziEy+EjcmJQ8DPqE7tJGUhJ/il1ZJl5yOBhtXz7tvTNbamoWzpHn5QL9+/7w/HkVTDa5Ok
vCKWFmtaMhCR3mTC39Nu7CXd+J+LDX0F+ZecTX0HiPMxINbYHXKK0R7r1BESMAGIQD/5P2RrUHTO
6IdXpNJinVpsxfBT55tXKLVYpyjFXKG7mvjEA10mUxMfQZr5xjhmny9eYaVDO8XLmiuKD3mv0IqK
jxeDLwzat4ETKlo/m+5/Bzewe0BwdVqFE3IDFkVJztAcLrzrnSBX09veV/h1tAH3zgj/XEu/aJsD
v4rbtSv7PVvn9djT/ff9zjQp25aUheY7oOH90o43f9Jh+Cd4bEy4w4YPeSOEbKhKFtMdYx2rz3/v
jnd/+P20fZ1ew/+4prFm1K4bnCZhxYibpBzEQRbj1P81nyQ5D00Y6g7gH06p/+oQdpmdW19/tAhN
WCA3pd6Upi3DXzhu6aUEpiy593GqQxrG8P1iRYodSdwf7bZoNE6J34xbDNNAUlIIaUeuX26/7+65
CFQta89d2hLRil9+9PvbjhPINza+arZN48Onsdxp/UH4fAyRGwM5N5F7+/dh/Dz3XdG7uyb6DsTo
m4wCL1yCTQyFE1QXdVNfzJJ8omYP4tNp7s3AITfKQpI4DaK5rCl2fejmj6e1SULXC/7wf5Q9Sa/b
ONJ/5R1nDo3WYtnyYQ60JNvM0/ZE2ZbfRUh3gkmAJN3ISwOZf/+xSC0sqijnayDpuKq4iCySxdr4
l9wdvhu+Hbd+ChayQco+n8qKjPxPWrEzuarP+dfmUsqlV38YVamBnoRnim50Y0I45Q5hLlz7wyYV
nHbqvJoOMeOcKMcnGueCKnWjij5aQLNrg8JUFRR2t6GAlPGL6oq0HArL9N1b0ygHK2Kmp7hccN+V
lwMrFVyTnQrTI17/7nmQLGDCdNUeYDffWAEaVBS8WtZn5mIb60sSw+CrvM7PkiMUuxzRMEnUMZMy
/ZT8BntQLlfPFCGmTURoe4BQDAg8Bsedqulz6jJ3aJJCCiL9iYsDBPYhg23r96ymhRSF6+hLEkg3
OZc/+rym90foVd7zrt50XZ/RLbwoa9mBO1IgnPnycDFiyMbhmDSRVVmOfuXzKdTAddIdwHkqBY0o
WvoCWJE3Ptao2AdDwTGA5AjG8W6/dReCiM8p50x5LTIkOY1WWhOuJa7Pb3+SHJFGQdT1UvagtLVy
IRd3zMDgAN1WhsKi5cfC0uAr0K7rDN9Enoh9GIiN5yOTb1vIWRekL55k+rwSF1CwZ81sqpiW9jnp
5XZGc9NZrrq8cjNRIiUtUJy7KcA/r3HwKqtTsY+9gJHGey7yYO95hglRQwLPnG+RlaJqhDxk8yBy
BOqONIezT5v4RgLVob3XGVf2ItmGkRH7ngp/Gxu/wTZZn01FiLwBtnKU+yypw0EINdwMG4a86+SV
sVM5c0BGd2iEJolWxSVNozHcoUV6zFCothTmpIRmfEMS1EaC1SyrwfI/S+wjmyi45KRgY47vDI7I
sR3wOhaW4j6NL1i3jXeRoUbU8H2YdFtzQCZ4123oq/BAwdO2j/fnOhNkli9NlGW+523Mzd76/GmM
Djvfs1afhlnqMgMoz04hD+h2iFMaouV+vn974t/efnz/56tKIfX2ScoFH55+fH//7Q2afPoCSTE+
yG3k89/wTxxK9/8uveTynIuwV1bLlaWgiOQBTa9LpVcB+a6mV3aWnOlN4ZAU/ZXy0lJsyfKksqzN
E7v2tj6MHVjJekZ/xgUiv+jrz7VmpX13GK+35t6t7VqJ4KMLyGJFABIcyk32oQrMjR8vwsqwpJPr
Zln25If7zdO/pKD48Sb//BtdmcfivMnAukuM34jqy0rczQ6t1m2o9mcr9TTyaLxB+w/sTzNEk5Sk
Uyh4IQ7h8IZkC0A48Ah/RTyfBi4rDa4YAMtL4ohQWuDDpaG9cCURjBcYOlmBa33VbpQWxF7kAJJM
BPkRMPEAVJZocSm53TcTLzeondwrIkcPFTqIAtzACKV6NOGa5IojXxDW1TdWyFu1YCmZvg0IzlXD
X6vSnrUB7LSVqcaZ9RmEkU5Ni+SwwPMcXAaNuVGiyitKTlD+Ztq/eWTt1Lw9AGdfIV1X04eJKXBd
5amYGT7N7b0+VzhjnVFWe/M7Ep8aZCmr28yRkckgO2XkOjdJcpY0XNZlGMwFCP9CuLqYQ0Ioaor0
ht6KzFWyYK8OrSiicuSRkiQd3BHXsf2VCl8y63+5QBI5FFLAXhzJTs1yTUJONwPOqNDOlAfolyVE
5z41JwBPDP7OO9uUO7R3aCqWJhV1GcRUCUtxuE1JWzGMUlDEZZFSe7fsVpYyOdIFIxN0m1VB+jBy
xJJzlgtz8QyAvkUjNUN7n4z1GPEbstTmSl3mRvQQe5U097qll3HCmwbrsRIR73/OjmS00FKDUAnb
xYPhAa29oWqSe7pjvhMVyUNPXSJbShh5Fyz2yHlP/x7M4oKDLV8FLth5atOVWImxRynpmWcSYPN+
mgfPc0/kqZGqxMbm/WqAKZXMet1Zcckz495xyALkfq9/9+cbcukeoPJ/BCxcwHLoDFI1DAjxfD+z
mytSZOziK35owEAdWSP3bhRGcmzlWnLljDq2pyWWqLbJMgiGRuv96DggjiLvjy69NiDrF3W40SoV
zsqjw60UysoduHU3q7D9lXY9mQl41tA6pZnE2UFjVHSukfWRO1/YLVvIqANSqbnWy6vsZuBEalbx
rqC30Gcp5OCVvKww563J3mZTrLlmKBT5WqTY46e4SnpHStJrXdOquLpj/ja2t6x5bT6fHJkyn+8P
jtpCdpeVlfE5Rd5F4wV47hoAj/WJGhmJEzeqxADVC91ZEF8DFQgUxhao4CUvWI7Ax5vV4OEomZ8M
arLYwcwH8SzieGNI3/A78u3fsnpU5lUWGl2cKb5UTAd7zK/wZmamdTlmLC9dkkXJWqB+tKzkP+GJ
joeCnIr+KCvHWjAJHzd55Smn+TqvE7UlrA9F9YzWOOjTTge6Y3IdkNGdRm06fHEwP6LEHJB31Rju
ewb2lyN3ift1VgpIALLe3EtencwMJC85kzIGmsWXPLH0EXM1XVb2WrwYic1MOS8QXN5YLlQS+HDW
pBidQ+TUet+b1DTPbL2N52C+IV/xg9rkTAuGhDJxdu5cDbtSMW9mfRAB1jgmR7BCyiWOcM6JKFM5
gMjyVc6ao/zzcCgFz8n4DkRi8Jn8IaU5NApc+PsHQoIoRILKFMnepx8v4CByIAENaB0RDlDvOnIT
0NINGqxEbilZ91D4FK3a1h586gW/KsTq+l5IBqO7KCc5o9g4gZhfU2NU8otrru9lVYv7w4t7m50v
7cPt7hcoKnHmhweixJUb2Xfkj16l1jandQK6BG8ggFCMhLd27PPYyo2//sKdYemrN55IaYq25jQ7
OlzPxPOROvDkLUY/PjaS3eoz6msOL2k1/HQC2/OZMh8ceQeZCVSxIVsgfwLSRQjiUIAVI/ksIYDH
V3/qcrsNw3jHS0cHRp3EUOkI1dbFg93UqAFwtnRIimjjb7w1Asj07+iNxO46jUXRkUkRb+LYX6s1
3q3VqsPp9XyZIVQ8ASdAuthw/bXHIGVXTgzBgOVJnV8EHs28a+1KtBm7u7G785tyweX54nu+nzhp
BsHc0ZcR63unBc8MqDjuAvnfSgMdaCuYvNI4SWYvVFc/lGiKx2QSJIe5XoBbnygAQuLiU6q2akAc
cH6ETtTK3Ouj7Oo+2UR9+47J08TFRkBlUGA9cuyFrnIvRq9H+WB4IsGqZhAyHPWAyGCMGDronJ8m
2sz3Omr3ApWpXBU8sbg1reMw1iyBkhtIcJvE/mIRmsU28WK1AHi7c/ZP4/eOSq/ySipEZlc6mIZP
crMMGvibZkzNdvKis99HBXnF0556YDnC2nWcguZ4K+GFKqx2H8s2VqYwALtDfRV6oUtGLfP2wFRY
KILKLewCV8XE6oEdeaOAkiEgFI47XnBQJFXHGkekJuD14wsLU59SfhT/fPnx+e8vH38aGWbrRKyE
zUts3wEJam/yCl0UNUrm5F2zrnHm47qGF/vAmY0mhsMd0tIhV5p6TDPpKFPUdWZk2wAIvByGVYwS
XFm5SwBEJi7Jz8l4zp//evvx29vnDx+fLuIwGjRVmY8fP8DLv399V5gxwQL78P5vSJ6ysOLecvM5
Bfg1m2oKuccgC0BaxIFPR72jkqQOGVMUGTbQZYYSQ8fKIJBZeJQikGSxCYkmJXTIQv51AdKtQL7r
LM/Q040mhdLUrFPhiLYZfr416K3ICWHZLg0ETheFECqta61WXkoxByYGIrqqtSqapJAyvjHqykcP
Ng0EOZIQnXZZ7h0n7YpqCH0DgUhJSX2uIOHmq3USbAStourSA3W5NXnEslKYKCU7IWGqvgUuNTbg
Ahfulm/2W9rvR+LC/YYybkvMjR+Nu9kAsPhIQtNrgagK67cqVdWFOlwgsR9rUHmFPySQAU7vU3ok
h+ieP/75738hvcrCG3osabHpDIbzDs3MFI5h10lvD+pJGsEp/bRJNmuNZ5kW8ua3jDJzj6i+lbdC
8HxGYZ020h3ZCt9oWr0HgGLeJVSxrHl83vKY0gSh7xoEXuMkbndbrSn+ikCYIxTI6oYE/fSCXl9L
cG1lKZfUAvHTG5MGWWD8GQAKSBlDYrzQ6qgfkZX6kUUnpcIbFkEkcBv28qBSH0bWsg0FAux1tWZf
94FPa6o0jmIXNCHjpYHeL/R7ZYbw3QYd1jFJyMbzIDqFkLrbIFI4XGDrO8ljgnwAyn+Frvg2RBT9
AlH0SzUFpHJOk2D2mmHaP/0rHrB1BDJ3zHCS1kjBv0TadnEDZWdRGFCurQDxgL5wmdXmsR9bXJDD
C28pxW5Ne4vNEBf4aa14DbPGAUCxvE0dKGBCUi6qVKQZ7qmC74LQoSyfCvoOlwpN4E4jYODJ2BjA
73FH98R47JfjsZfdigK2+J69bk2KH84O7Vc6hCbbDDGXP/o9TpzTCL72aRBgaVk3zdpJnzyToEVa
xVvuBxGVoAgQnXFQyd8x/j2Mp1GVkmYdYpjZhdd7ygS9Gyp9XyYPF8MQ05ZYJBwA4+k4bsZT9o6b
4Oh4Volb4USlumVeT2Q/1OlpGK5SMyki/MKpyEYImFosOi0iGt1Q0CPtIaBw8mK2uNFCtrTfIa+i
eQn78PkNEvl+QGGNUowUd+Nwk1/WGXegOgk9r61Qj46sgfgjWjOTw5s3IthGAWXMhi4p1z+zPiNH
4+CWuvie25jFRnbPvILfbrbfxSD1oQKTritridwYXKToIRP4+RX9lB9U26Dcr3g9prn6CqCnT++/
fzBeUzGEV13kfEysI3SCqyu4Q98DJOxaHBvevlKyjyIQdZalR9bZ3QTBssywf6jG3LbbPZmZXJer
zaUzwITyrNXe0d/+/ueH0wmbl/UFBfgogDrqqLuHQh6PkLNZZc36ijH6fYJniFazMAVrG94NGNWv
y9vH71/gfR4q49hQqLqITGfYI+GQm+Vi+FhYWJE0WVb2HXrhjaa5/2e3jTHJu+pONJ1drYx/I9g6
yYyhd6Vu0SWfs7t6H9TwghggPUuNiTWgdRQFngtjigkWZk9h2udDSsBfWt+LqEYAsaMRgb+lEOmQ
UrTZxhGBzp91D6YRnTDao5Bgw4nC1j4ihPLwc+SEnQjbhG03PhXHZpLEGz8m29FsvVY6L+IwCMnC
gAoptZNRfbcLI2reikRQ0LrxA59sjBer3SyzW2venCZEVWclHPuCHucqT48cPBEWsYg2qWirG7ux
O1mPUAtBJA7fvJnuUkpueUBz1nWtzmkR9G11Sc4SQnx051gVRfvc14XpUWJsJ8bJBD/l5oQSLE/A
nuW1IzhzIjnc6TcdRjz4xcj/1zXRKJjkWQ2GlVVkLworWn0mSu4qKPtBJ1VOdxU6t9rXDJ4uR272
S9xaZ+Ap6UwKK496o6aTr/flWCVwEaM7M/YBIUTWcOQgp6DJndXMBsLHWE52CD5EbFt9n7CqeWfv
r6LrOsaWHAVbnbPUPNu6X9axJc84AU+dOo969aon8vDUkGFYpAyaVMXGXRzmRB+xqI4ZLI8msYsd
oYiYbhfv6GfZF2R0JmBMRm0PiEKF/Bad4WBNovs23Dm/7SIPId4lnLLwmISHS+B7fkg3pZDB3pw9
E53c46QtmG/nuHGSnnyfUslgwrYVtXWhJggspiIorEBJJ+HmYWMbvLQoAsh+QBKkbO+ZoWAIB0uk
qWjkmRW1OHN8DzYJssxxG0BEJwbpTPWaeUzdwU3u0RQdL+94Ky6ufp2qKiUFE/R1PIWnTh1VnO8S
KP/ebB16PpOY51xy6S/RWb6ONBkkOHjQe7EV993WpyfudClfHeyUPbfHwA92DmzOSudkO2L1TRq1
I/a32PNoO+eS1goTJuikGOj7sef4VCkKRijiBSEL4fsbBy7LjwzeO643ri8uxCnYhvGj/qkfrjog
6dol71tBn+CItMw68jRDrT3vfMdalrJqAQ/oOaY2lXfXNuq8raurDRP1IWuae837I51tHvWEn8ho
T5NG/bvhp7OjU+rfN146sLxnRRhGHQwfTXJJDnLvd0y/Pn1cn3tLW+W25gpUR7TyskL6zGKi/Q67
Z9tYjzZ32mQ+HbCxIAsfz1Hih7v4MZ36N5d32F8gFYnayx8xqqQLPK9bOdk0hWN5amS0hnTsYQOy
58phiPyGOmGkU5a5GIrefDsEbb08h9c3HTjhPqlF6wehY/GKtji2wsU8C58mkqY5siQL3YKA6OJt
5BrvWmwjb9fR2Nes3QaBQ0R71Y8fkrimOheDDBc6t8gX4bK4oWZ4yVvyVB+uoVwktjZMCsT+xvgm
E0pfCgacK8XFQNRwcKm8NYdL2zoiYibK16qENM/qIrJGqWRqyZjqm51feZDCrqmaGjRwYef1ujPL
TwI9ym67D4dOuAeQdfE+iPqqRHoBA7nfDXUQjeidhh4UTFmweBN5yyqU2uogZTJHtjiDKs2SKiVd
xwyiKz80bNnMc9e+2ztLNtlJv6fl/NImay+/8JmXUbmMoHVyjLxtKMepuBC4ONptFuBbMYwKhXF8
pBqApmohLR+osNLVMU3ZLog9ikktMrhI0PwBuG044awG9PnZry4Ve1NeLMwuDzf0NqEp5D4SbPd0
uNhEsQ22lDOqxicFC5EwicD0hpE212Arz7nHK1xRbqPHw6zoxqUmlk2qNLQqbbgc7JUG5UEIAo5i
EcrWWnD74qlA6PxSEH2izCZcBSvoWF2FPHqUZlehgnTIE2RYiVURH2UBGGCU5UejQs+uINwsKwid
H340H2obINHkIDqayPjv1RPYjAzLhRJ+5gFSPyHvm6XIH+AJaCqJPmh0zg+WolTDG3Zzlhnybehy
uDERgIHOBrMmsdWxGlFBECWrBb3sNI2SPPq1b9DWBlz/xSUhnliRDQnDLEhfiigyzDcTPN8QwKy4
+N4zUvZPuGMR29fPwdpKTeuU64iyFGob7qf339//Cf6/RGq+tqVc5wcFIdjYQKs6++Y2yn1vBuSg
Z5KrITfTnNbY9FYXXO4FZZqbKScVVCUEhwxv2CETMJCnStslqH0GSAZXRNUhEBytFgVfVApPYdLb
DWBvrE3OaeV4i1N1CrYsK73+RMGUabh/Bm0tEB8KR56bWoUpPSYcKjy0JNncr8PKSJxv6oV0M7HP
BFJZjSWXw7PBph/EhD+wTUj5nswUOpMmVbd+q5DCyItCGFAIFYlGItpnCqyzxVMYGGIURzlhOl6f
XVnxWV1DAiE67EEOcUEGW0oE3g/aRP6pHe23NVWHKsKFfdUcoPg6NAP7pIlQMO2IA3ME4OgbiUGk
RPaV/iirRzk5NhDY8nKtWnPWADk676M2ry28/tFUHX3gT9/VhuFrHWzcWg2bkNZRdzzP7/AOhXoB
d+78CF9CLH+lccKai5CXlqpqpxTMcxL3xb6q/QZkz5eeGma6Xxg5ZZKUg4vu+Grm4HFsOrZGoc+y
HM7abWAL5VChg23mOBvVpeTT57+pvHqKEZqDPgZl7XmelWS6iKH+hdl+hsu/V8rlbbIJva39vYCS
ovM+2tAqV0zzc52Gl0nbUCw9UsjrEdX3Iu+SOqffuVsdSFzVkDIbIkYcfdBWyq8zp7DxPbA3xCxS
SjpVB97aowVgec9yjoLGM/JDrOamLkxSBSQwnjlkiMx6kl2W8E9/vf1YTd2vW+d+FEaY0xVwa2aq
HYFdaFEW6S7aWoRFGvtYtFYjzbvonFJCndq0kLpdQYRpNQZIzXm3sastlSrIVa1O5yEZ/WKXE1wK
f3sy4ENjt6a4P8D22w7DrpzZzClBNc4aMO8x/3v78fHr0x//zG/O/eurnKUv/3v6+PWPjx8gEOz3
geq3v7799qfk238vVr4SMtzs5HrmVCG7zpHcRG1wSbE0BC0onisysZBC6xThi/0R9mrbbI4oIMa6
JP3rFTaDpxRV+n2c0dZCqueBndjlq5w2Ac7YqrD8JOWL3H7q3KDIToHn3vpXP/rMT+dcnlkuPYki
Ea5B4cViW+SF3LJr1zGsKKqa9vAC5LvXzS62eP45K+Qmu9h/261LfarRu22wcjRct1IEXSneOVQa
sJ61KO74gmrhOKWghUvLA0jHw1Jqv0nYego+ReR4F0rhOvdi0/nGE4fOVxI0nLsnUoRJsPEdYW6A
P/eFPIwcr03p3axw5fVUaDdTq+vAkX4ZfsbTriMKfym38mYW3NzfLu7ly0Vei9wrQ71V0B/qwj21
l1JeHfhKHSNB7z6c11/tAopbQV53JUZHrdtbSpe7O9Tl9X5lYdivLOv85z+lOPvt/Rc4YH7XB//7
IXaYCMxWXKkfDFjUVP34pOWloRrjmLKrIIUvdAbCXdIp0pDiCzpq4Sk+tE8Te7sCDZnR7TWvcZBg
Xk6ym5V13nNnnuiZBIS0BySuNybMy8XU/dDQdyZpKQDSF0wgTU16w+BZT3ZNDAzZr4LL6ybQ/B9j
X9bcuLGk+1cU83DDJ+aeOdgBToQfQAAkYWETAFJovzA0Mm0rrJY6JPUc9/31t7IKSy2ZoB7sFjM/
1L5kVeVyQLdVJW4JnEw141EgjfnKfpyAqp6phdtxdqArH95hzCWLvGkoYMPn4ipRzWi8XtRd73FW
u6Fu4Dm7PxDKZ+JjHvLNDVHlHo4Ycv6v8K+mZ86kHSdy8Qd0iR8f6QKO7m+u8c+HjvRwL1DnO/zU
zNmjCwm9+McebpcK9LYQLiOEC15lYAG5aLrQRlUPxECZBCY9PzZcU9TtxshUTMNG2mhfqKez7XHx
gfeVoaWusMFxJ6vBSmsCgu0u6RqGv3fcHqsmq/DbxRnU7dhyt1YgcCOzK7KB7r/xeC5RmHDH/t3l
etPgSuXAKcrQOhdFo39RNFHk2eeWcJU6tcdqYwiHU+wvImIvx9AioWCTIqFg354rQsrmbcjEvvNq
p4Jec36nh4xRIDVEhasItznAZ3Ki461Uos+NWWgkcLYtC1e34wjSmyVwmzxxcT2cmXvu7qhRxIRN
xb4QaJMLIX2qzq6FupUubdfqencknnAYjwmngYcK6Zyb2BE7XVuOPlQ7wissZ7EVkpw/Xb7LT8Zy
1DUtLqBMTHCTRgNAiF3hwkjDRWDOJx0Cjdxghbsq+/LZMhAnAz5IQTB2bIsvceso26ZrIJKx2AAp
4pWOmWFgc0Sj6iYp8t0OvKESfTiAKwFVLDDlZ04t6IE39ODllP2ju/hVUL+yBl7bToFfNuf9nRCS
VJFCDRmwSD/SjSNyY8t7TRUT5k+bt9eP18fX51GC0uQl9p9mAMdXu7puIMIfHe+TN3uRBc5AxJCC
tAsq+HfXlFjrHDppB2c/lCtx8YrdybFPZ29RnPz8BCGApFDqLAG4G5feKhs53vYU935KmxGmRLA2
BjwbZRCt8Za/kyEVkDBYrLWFq1/czAX4A4LrPXy8vpn3rn3Divf6+Jf5lMBYZ9sHDwJFLYdlVOnn
uhF+60hA2mck747tLXdTU2UvYM58Ixwg3oDRZ5X193XLPdDxV8Suj8smZ8LNxyur4OWGnf3YufG3
J/ADww6TvCLv/6W0r5qfNpUpWJ72kdO4uJKniU20i5bJZZjRtnMriPcDqVnyqpRtVAHA/pJe/8fg
jwZDHOOwBIEAU19eDSYy10Ii3J2PkDJpHLezolVQN9g+oc8/QWCH969DiPiuc2k6Ikj5yC+auOvg
HtEY/y0b++8P7zffnl4eP96eUcdvYyKjZ8P1sjLJOSuz03rjAaqN4jDcbPCTmAnEdzUkQXxpNIDE
EdNM8JPpbYiHXgSIi8xmCdfH1pIgMQ8N3CfzpbxpIcDPVjn4bNafHTbRZ3MOPwuMPwkkLMR0nBt/
csB6ny2h98le8T7Zht4nh4332Yokn61I9snR4MWfBW6vA7tD6FjXqwyw4HqNOez6CsJgIeG83IBd
7zaAuZ8qW+jjN/U6LLo+pjgMtyzVYO4nphCv6ad6IXQ+U9NBS2uKQ05sakIj4/Lb00N/+Wtty8sg
lGnZ36Kpkwno0kUJqiqShfNETzovLGzfFEc4Y2NRDElfC2RZxW/5SOCxbJu4P5yLvMz7n33b0RF5
e6dfHwgpiTCC5hop3Zdu16m58bD1COl8sjXqKJ1J+pfcASb4ZbCGSQujvHx9fftx8/Xh27fLbze8
LEjH8C/pG2JRCPqyU2j938fNVivMLEAuD8pqovqrrcrNa8wQSFRzGwWdbBAjqFn1qzCfVBMqmySi
3lEFYMCvCUYmEcma69YSD5dCxz8hojKNFgDiaokcHXmtnOmF3cQQ+fj6wtki3F6HhdgQnVym551q
ECmaOu1dx3MHYmqSg2hW2ODUy9/f2AlKOZmLXEf3Lz8w6hgcW2tzPoyxx4iF7ZitM9IhSepTrmrl
mp+OdP1TBIQGkh7ZYCRipt03eeJExCO0QHTeRvfFKr2Kaa0rpvYuNVtdm9LCIQ85GIT9k9Yt25RV
0S7vT9rkGi3VVfAvcfXrue8LDTsrQ6idMy7c+iTxe58wgxTzoHAi/Q1VbV2wjosCI2XOiIKVed/f
lUOEudjhXMN+lVOFuYyRGZD108o0f8yeGvXP8qs9KDTEqBJu+2hAZkHBlk7s+nAcpAetE8EfZg5O
Su3A5GSC5Xgaq00T17EHWWcUqc98d3elnmziujYe+UZaD2x9RCWuG8mKOKLQeVd3rUYcWvBD4crF
RYrFy3V6evv4/vB8Zbfc79tsD7ZoZJHZ8n5szAWcfvBHM57SvFfsKe5tME0w7h3sf/77aVQWMO5I
2SfinZq7hqplf4ozJ+0cL3K0jKavBkxHX/7Wvi+xRNVHu4Xe7cWr3Vh7pOxynbrnh/+9qNUZVRcO
mSpZzJxOe4E3EVBfNE6ziojQ5AULHKimcMN8LRXbpVPBliAFIZv3yoyIW2Hjqbr4fqNiUP+bCoIu
tuuekxYXnFQc5qVBRvjWQGUSRtj2pSL0mbG0Tmbh5x0VZIfodFQH3nx4ADsZ1umd6nxIInPlTkL3
U4dpOqAyu06you7FD/zQJoG5wu+6DY8ML/vApU6MEgwiqVOxMGTctANfBYL3s74mwkUrOa/o5Mk4
YUVJNnR3bJrii9nCgr7i5VeBUeEsGwiQBEBpWxpPPHGanLcxaJXIIXxGG27xzeKDVtjfwhpyVLQS
RgaH48OYyxwmYGTDk9ec2fwRPCRB2C0QDi3iDnEsOoQ+jzaejx9xJlBy71g2tohOAJikgWJTLnPQ
Ca4ApG1foTtytSZOt8WMd6dKM67i5yyu4pG8UojtHQyyAavAyCI85eioQ3qHtgKXrFdKzQC2jzcg
56x2D7joCS1vrZVHiByHWeY4tiQsTGWajOWxocUHOmplPCGKJgqdcMlvoquywpIe7yYTXvRu4CvL
/8JJPDtwMHMZqZS254chlp9wyoBywNOCWRLWxZ7tI+3EGfLtk8xw/BArPLBCQp1Owvg28cYlYyLi
rUXGUDf/MoZytTXPrHLrevgF6QQR2wTqdX8ab/v4uM+g85yNZ2MDfnLruZJG2/uWKrVMBWh7tpit
NytsKC6+KO6OWTEW0Nx2zDZLN5uNjzkg1MKg85/sWJDqpFHlVtwqclG4evhghwLsTCKs9jvwkOLa
WKYSwJO9bil06YZmoZe25dgUw6cYymlcZRFqqDKG6AEZY6suF03ExvEsrJ59ONgWVuyeNR3B8Gw1
sqvCwkRoBRE4eDm80MJbCViEMu2EOfSoq8SZ37khVpcuAe1CtC5Dft7FFRwr2ekQWzeXRMCsCkm8
Hxobq9AWIhaeMOX/CZF2gYMUlx0pA8c2G2/0dRKnCVaT3L89x4QDjAkD7sCH9SbehTY7Xe1WSg2I
yNntzQLuQt8N/c6s0eSJJ5ZDME/MfeHbUVeiDMfqSjOfPZOrYqwNGAN3CiHYh/wQ2C7S4vm2jDOk
BIzeZAPa2nCNrwvIJqqP1qbrL4ksfExUJrq2toMNDB55c59hg03sHetdKzAhaYet4wgNOBm1QRcI
wVrrCS6n+MgYB4Zj+wTDcYjsPAcNzaUgAqxFOQNZ57mHRxtdMoDl4Fu+DAksQvdBAdnr2wLHBNhF
gozYhGZ78avFEG8wwXPXVlIGCQIHXdc4y71a7iAgtAcUjH+1EJuQrgIqVC2LTuOie3ifCJdzRqJM
UnPciDgczslm1c6xt2XyiflftqHvoCeCZddLZG8b87gsAxed5iX6DCOxXXSGlOHq9ChDZAQxKiIZ
FWWEzSN2JEepiKTEqCFGJdaSklDkkQD4lY4E8B1C10HBeGsijUAgC1OTRKEboCINsDxnbQeo+kTc
5OZdX7dY/aukZwvA2hACRBgiDc0YYWQhUthoJItlVyfJuYmIg/1Sr13kb5TFodF9pZuNcV+CpLWK
kd29Xp9d2AuZCdr2xGP7gmhRZeaZz4ROpHUZGV8fGcPFfVpICMLrhYRI1pch2j3BLC6WGVvkQ6yI
GRPIPEKDScI49uraxRABXIJh4whiUHtheaUOI2hVVBCgrYttcl3fd6FPFKAMgrXmYSuv7URphB//
ujByIuz8whghfpJgrRFRJkyTPFjFjrW+cwKEMjFaIK7jrC1WfRIih93+UCY+snj3ZWNjywSnuwQ9
QjfQsvGs1YIxAH4QYxyfcPU7QU55HESoq8QZ0duOjUiVpz5yXIR+H7lh6CInGWBEdooVFFgbG3uW
VxBOiqe6QRqU030yMx/WTcIJjgQswsiX/QOrrKDCqxk44WFHcTLOMktFuZ6WAerNLd/kCF/7mJe2
KcFuy85DXZdvZW90jCqVGGKNchPvH8pXSX6o+UMA8vXEVYlbz+VKAds2T/faBxBjT09vaRcJQFRi
jFqipCkits1BqfGSqiCUV+ayWQzPjRtloeBs6PMdyuGX0MtVeFLGSJGALL1LAEg0S5KjTaMg8Av7
GdGhEQY4f2kFrYRoE4iya23AidVEVLOfWgBiHCYlLnUoQFy7UUBkkyRu9vX795dHMJvRg9ovMe52
qWHcDjTh6HLf4MFRAAEXXrZ0xIFYSHNAsh8KMu6dKLTQfMAl0PnYUW+eAGFV8zcW+ubI2ZL2lJr0
0DgW9VAEAFM9aqFe/Ux1pMebcVaHVdLjZOJpYeZHmLgwczdagy5qtGqFuzwhnpihb+AOz0Vfbieu
byQ53vvh1zESINeiGU0cqlrCMkmtlfCZrLbp+A6nJQ0al7dMLCP0LTiEu3MUBkNUPya2O8gnYImo
OqGQGUhNy8YJiDt2zh5YOVptImkIxz/3HT7XmDh+bnjXyvkClRUFV9IDR7a5rHQGBMVlGeTKY9ez
zu/1+nC/0NR04/qHSVmrscMZw3THBNQoatipne4nwadnB+cHFlUa6UVRm8TwnkjYLCwA4iF3AaCq
igt74xpjAeiRh51dRna0kUM1zET5YWcmqhdQCxk3qeL8PnAD7J5mYspPqZw23SktZcp+5f4RG2Ml
I32SA7fqh4xaMsFJvFpn7DF79gaPT4SZrT5ZjzqjZz1CMc+l1LXQ5UJJ+pQyufci4jVMsOGtk0pS
aNYam2mW0I58OCD3wmC4gqGVcjm79GVtzZmkyVacfvslYrPGWOxHB+mwHaCliLeDPzY0XUrhQKtN
MM+0HPClS+THWKApkW20NybgF427Iey8BDsKI+yieky7KI96ik1clDG2McCLuW350q4g3tDld8o5
OIhaiUUp2qBujC2s5+5PQnQ/nr+LAmN0cvqGUGyXAA751KKA6I2dQdi67SoH5v6+8Cx3ZQQwQGB5
V4YIBBsPXQMjd2jp+q4xi/q83GZtGhfUZ0K3XG1/br2hiaO6Er5ExLb3iUW3FZfHHE//8L70bQu/
QZ7YKx3JDrJs/V9nU4OeMUGN/odGc83VbtR4o6XdEWDIQ+M5G6FhbchLi9+D80Whv/ciG796EvzS
ddiEMXwnICiOIcKVCtCOzug+SUmnXuK4kvDwFmuT6/YQpxBKLTnSySSgDgiLKeHmsOXa1M36RBIC
XGlbptN32dkwdQacem6O8SJ32hL4xVDZNBC7fMjYTKuLPpbvLhYAaOAf44L79j+WslrZgoEYCV3D
GmYVxcTBfSQ7ul1YoDkZBYpytsRMfZeQmiRQxf7BBRwJJA6zqw0yrRhFWktbsslnGy0ovBJF5ufr
K6WZD7+r5THPdioP1VxQII6qjqPxsGtXaXjEle/6vo8nwLkRqpK6gFQZZqHnXcEOgUTKjBk4oY2r
0i4wttkE6DYsQZj8EdpYATjHwTlR6KADFThUaxR94voRFo9JxQRhgCVtKliqPCZR4Pmunpd0GPpw
roCiwNuQGUUB4XBBRUXE26qKYoepz6Ac7CJCw/hoPyLnML090EOiDtq4+DQXB0ZCTNBhDq7wL8FW
IhyqqIh425ZQTRT5+LWGCiLs/SQQO3deXcpMCwkUIgfF0TgbirMJ8bZvtjnhB0bCJPHGuzLi+WEZ
z2E8s17L5MRWQPTYrmEiYhnmTELvWELd49ZZC4J7fm6bEvefpOF0T1wU7thtzyfqjX7Byi/wanht
3TWi+el47kb7AA70RABeGRTYV5clBnIIRTcZdOfYhM6HjCpPV5dbllQQ+tfmaeeUTXy1goDqrk7C
zi+jMLi2pJoq2yZkuWMwecWeHYwsC+8uIcVv65r0H6xjT2222x5xGywd29xfT5OfRc6nkoikJEFZ
Ha3gmoDBUJFDnCk0VIgZPS0Ydib37UCOmarwxMUF2qjAddyrA1zcVlxZhaXYqGQSV7ZE6VYE59ku
Ia5y7vXWXDVEV2D8kuMKzHx0JkDEfbIC8ojbcG3RLOJtviViCpq3iSMnGS8al3YFSlX3+S5XbdLK
DGKPABdOIJrLdQUz8s2PRwY7/hU9ag03wbZpe+JRbLqsyJJ+fqAE/zPTofTjxzfZ1ngsXlzyl7a5
BAqXHdeKen/uTxQAImT07NhJI9o45UH9UGaXthRrcq9C8bkdoNxwsssdtcpSUzy+vl1MB42nPM0g
xOtJz4T9ALsBJQ5eetouz6xKpkrio9X9b5dXr3h6+f73zes3uCF413M9eYW0gi80NQCVRIfOzlhn
q95JBSBOT+RlgkCIi4Qyr7g0UO0z6WGdJ8+f0M8FA2mBuAT3vqrTTPsk7r5UidwcWLWVTpidxBuN
orc7NDfW0kYKPP306Y+nj4fnm/5kpgz9Vpb8yUWmxANrtbhh06v72Q5kVvqliuHZljdWp36WZhCE
qmNTLa+rc1GDy8RaccEOqGORYea4Y1WQwsqT1rSHGidGkmMLinSvlXIvKaJO1EBgm7mjrWMLHRmT
nF5mZS1rYkhflHFR1MqdJEtkmcRCswIXTwHIUnbYfxhOak89Ob29kwh6pNkRXm3ZYrNWINH4ZfIv
UPa5YelNkTRUo7Sy49pAEDSXrA5fnNbqDKWlQepSZngku3l4eXx6fn54+4Eom4h1u+9j/hbNP4q/
//b0ypbEx1fwB/J/b769vT5e3t/BiS34hv369LeShFgo+lN8TOUroZGcxqEni0czeRN5irg5M2x2
tscuf0ZAFgee7SfmYsY5hAAvEGXXuB7qUEnwk851rUgva9L5rqzqvVAL14mNmhUn17HiPHHcrd4Y
R1Y513PMojMZJER18he2uzEb69Q4YVc2dGN1dfXlvO13ZwaSV8XP9bDw4pp2M1Ae12MGccyEuggd
jsqXy/Ymp6ZvRmBtpjeoILt6WwI5sDx0TwMGCFIrQwFQEWGSIhDbPiLMcWa+j4nUMzcI9Krcdpbt
hGaRyyIKWKEDzDZgbufQVi98ZcbKdIHLSzYDkekycvSG0mZ149vegMxTYKB3MDM/tCxz3t87keUh
yd1vNoQGugTAr9oWAPF0N02WwXXU5UEalDDsH5RZoQ9P3tLyC/O4DgyODyuZLs6gQ//ysjKRQhs1
DpH4kY8Pd5vw9Coj6NUF+K6HTjB3gwwcYPjEtcWE2LjRBj8pjYjbKFobtYcuciykUecGlBr16Stb
vv738vXy8nEDIRCNnjs2aeCxI2VsjjvB0m9nlSzN5JdN8l8C8vjKMGz9hBc9tASwTIa+c+hkX0/r
KQinYWl78/H9hYmtU7KKdMKEUcfWjaQnx17ap0IceHp/vDBJ4OXyChE/L8/fpKT1HghdyxgUpe+E
G2OJ1l6Xxzr3PKpUqt+jT8IKXRRRzYevl7cH9s0L25awuOYil0Pu+2vLQl4ODuFKfQEQgS0kwNpG
AAD/WhbhtSyIm+IZ4F4rg4tqdgp2fbKcGNs+6pMTEH6nFwDx4rAACM8ZEgC/oZ0BlO/rCeAHhFcN
CbDWA/VJty1FUlhdRDlgvRZ+QLicnwChQzhonwGhg19pzYBrnRVeqwXpZnwCRNHqfAIAakg1sTeB
Z6wPQPURYZ/RKbfTE8B2o9W5deqCgPDnPK5Y/aa0iKt4CeFi7+0LXzP+nhkNdVM5I/qrmfe2vSaH
MsTJWt1uOYIIP7Qg7NU0utZyrSYh1LcFpqrryrKvoUq/rAvi5M4BbRon5eo5TSDWitv+4nvVan38
2yDGnwEkAHarPrO9LNkPyL7m3/rbGHOJIfhZH2W3xiGy85PQLRXXm/gOx7e4gtGwG51JvPKj1faL
b0N3ReBL7zeh7elbO1CDCKFGVng+JaUsuijl4wXcPT+8/0lv03Ha2IG/JuCDgiHxGDIDAk9bmsbi
qJnP7lY1+UZLb9/ZgR6JRXKKakok4i4FePFyzzMmmQypE0WWCEjYnswbSOUz7Wb6WPH7YlHE7+8f
r1+f/t8Frvm4/GZc1nA8BORtVOMqmQvXKJGDns80WOQopiw6U1GpNTKQNXA07iaS7foVZhb7YUB9
yZnEl2WXW4pGtczrHWsgCgu8wKLainNR9XEV5AQBmbztEsW6621FUVnmDYljORHF8y2L/M4jeeVQ
sA/9jmgkzg17gpt4XhfJQr/ChcNG4K8NB5uozC5h3UZ0OOc5KzwXL+yYo0P1agZtdKVTdwkT3Olx
EUVtF7BU6Ie4sSjHeGOphu/qTHVsHzvZy6C839iucs8ic9vIuVoK1reuZbc7vCnvSju1WXN6DjFO
gb9llfWULQpZjeRl6v3C7713b68vH+yTOYAbV3J9/3h4+e3h7bebn94fPthR7+nj8o+b3yXoWAy4
2+76rRVtlCvOkRzYaDcK7snaWH8vFZqJ8owbiYFtI9DAtm09U5gkhM09Z0dR2rmaLwSs1o88qNp/
3rAlnx3tP96eHp7J+qftcKuXY1piEyfFLEx4DXJ1SvLyVVHkhY5RK042C814/+w+00XJ4HhwBfnV
IDquVoLelWc0kH4tWDe6gfqxIJqd7h9s6h5/6mEHNS6ZhoyyOs6fbDZY91vI8LGUNWHsi8hC/a5M
PWVZUaBmyvfPwBhep6yzhw2Z1LgapLZRCcES3eBiWQ1qVdiyBJNHe4nmnwcYMcS61jJ6hw25ldnR
d2xPo/uOzRx8WebjZhsFsa0NEtG2XNCYx2t/89NnJlXXMBlkMKrqhJY5ihnR0TudD0TiXDVOWtzb
DDCLwAsj/ISyVMvDrkCBXQ29OYrZvPIdcwq5vjYa0nwLrVxucXJikEMgqwmP1Ebvfkbf0D041irS
WzLebSzCnQews8QmNHCmKekSCnCi95js7ViYusvM9mxV1wYYbV84EXGUXfjYvcC89EZab6Q224Lh
sb9O9RHGzwc/f10GcTLuEOTwhYUicvRFgLew6jRFolPLilgAwyn/uO9Y9tXr28efNzE7hT49Prz8
6/b17fLwctMvM+tfCd/C0v5EFpINVMeytJWnbn3ueeWHTrRdY1/aJuzgRzzc8Hm0T3vXRa2NJbav
FmCkBrGeW7F3bFSpd57vlrZLxMfId7TdTNDOrF1Q+skrtE0FEraNPmOCRqCqfItIQl36+SVuI7sG
HSdoZOkLHF9ZHaub+p9noe76/+d6vuqAS8CAhZodXNrw3DkE16S7IqV98/ry/GMUKv/VFIVaMUbA
dj9WO7YZGJuSxNyYL3xdlkwaQNMlwc3vr29C9DHkMHczfPlF76qi2h4c/HZ3ZuO35CO7Ia6zZja9
zYDRDB6gY+bqg0AQXb2Z4LBPr8LFvov2xUolgb+y9cf9lsnGKwsqW6OCwP+bqsjg+JZ/MuRWOIU5
1sr+AJsLav4NzEPdHjs31uZ0l9S9k6nEQ1ZkVTYN2OT169fXl5ucDf633x8eLzc/ZZVvOY79D1mZ
zFCnmdZ6a7PRJNDGQQ5WxvmJ592/vj6/Q6RlNlgvz6/fbl4u/6YnYnosyy9nXYdJuXwy9X94Ivu3
h29/Pj2+IwqO+/gct7L+iiBw9bd9c+Sqb3Mp8nI4583xRBoQp63kjon94A+D53SraCQCPW3YGjpw
9+FphqtLcRh3Cl7ilhMLoMuKnR7xXALdlh10eqMoa84fs6KUXQ+x6Oui3n85t9mu04tb1HF6Zofo
9LzL2/I+JgxDx5rhehbA7HutfU5tXE5l+6oh0TLvs/LMPSchPKgnxYPvugNo0mHcLjlwH9dzgLvx
+f2GLZ7U5Sp8x6CsD5n8iOnHTIAuL+zA05sUONXQ8BvETYTu+jrKV/QE1oopZJ+2VO6pp9d4iSxn
1cZpJjtHWGjcPrbptTaLy5RNEGUVm6lnwvekhEjy22uQMVtjm4uT5uYnodmVvDaTRtc/2I+X35/+
+P72ADqj0lIlUjyzzxTVsE+lMm7q79+eH37cZC9/PL1cjHz0sp8JdzsL22ifWfN1JSM1oao+nrIY
N/MWkwFEpK4p4i8k5rTPMFcZnMUmkzoj465XCeU+3juKAMaId0OhEkQEtLMYKhK9iausmM+6Y72b
h5fLszHLOPR8n6cZhEfozvcQRMtebcAxITlD3b3dkvLMUcqy7Ijbt6ff/pAtBHhzcAuAfGB/DGEk
X8gr3FQZc3Ta8sdZX8Wn/KSvGCMZ8ykoV7NODlrPJXnLZIPzXVYa01U8rrC/0DECtm+AOgyR64fY
3dyEyIt848huhGSG66mePCSWhxrrTIgyt9jB9K43k22zJm7Uk+7E6vrQX02VAULX11azItvHyReV
1qe7QW3J1pafMcZJoLfpKcd8dfKc45PwY28MwbrNs6qPudL83TFvb7tpOO7eHr5ebv7n+++/s9U9
nZfzMYUdk8LKFBzky02xwzXSyrLhSwL+tIjlw0uwfXj86/npjz8/2NGpSNLJhMSQpRhPmEaAwUie
SFMNOIW3Y8d2z+ll16qcUXask/c7+WjL6f3J9a27k0oVA20wia6j3GUCuU9rx8MWOGCe9nvHc53Y
U4uJBS8Gelx2brDZ7dGdfqyGb9m3O716Yu7oydVgEOj42ECByGBFvj/0emPOCSyI2z51iMfmBSQ8
2qzm1MixHBey6bth4SGm7QiKm5PdsxVmNXvTPczCo6PaKpgoUt89NSbqNEOq/+IRzPxeON3AE+cO
HCwqYpqCwk/NEqiJfB+TAxeIadgqFVO4xER6UXVZJmV4Yu0aFg3G26aBbYVoPm0yJFUlK0lcWSCm
NA5pmcuboXEqm4BdfaxkN8LaD+FlRyU1SakS0jLOqj1bF01WG9+XeZqrxF9YBZfqTpRzXjXHfjSA
m/sMuHXXse0Ud+w7FuhseAyS+IcWqQVlWAU8OJAm7LTY/ew6alaTLWRdpGD8RhbplLXbumMN0uZV
jwUw5UUY3bjqpOlrlZX0xfkUF3nKdy69jcYW/GU0BqPs73jZRJRYPYUuuztmVUK2YtkcmSR4PsZt
r7ZknGxCdkhnEqPWwqZ9FCfD1QLZcEyUI1zz8DL0TYyf4AW3C9AIXbx24Bz5fLQD37fUcoqKaWOc
dXIZV87gIXUdQ1jGJ62HNCbrhF18LPqfLX24KuOG7/uH9J/8eCQfHmeaMpYhMmabcUM3JlH+mv0c
eFo/rgxL8GFMNVCtdR8jiBptj9r0AM4UjlOd+/qQgiRSNPDBxB3PimbOjJH8Cl4YA89nEzI5aB3R
l0yUE4VWB9DEEFs6Ebmh4u6GmSzkc2juEIElxtIkX/YVFXtCJBW43GcsOzAd8q4vCI8GAM6aDWA1
T9TiTvk1Ga2o4CZ593a5vD8+PLOzaXOctSDGO8QFOpptIp/89yIvThXZdQXbvVqkq4HTxbnenBOr
vFsZOCLZI9tzBiLhLicYTZrvcFa2Vpo82eX0hjAnAVW9ihqSE91bUu2cQ486pB9RcGEJbXAc9FID
R+vuRStwrcvlLGBsHfLAscHvXqdnccuOMfd1nZr5GKWktgXO5Z7mOnFFWWSnrDBn/uiNTph2mulz
LtwmnXdwzkqLL+eirvZntttma0Oo7G/P2z45dalet2aAcBVXawbi7yqgrZNbuNRYmXajdMT7or28
XN4f3oGr2shMyf16pUPJxPSqd/Vupb2BC07pkakALLZ60uv9BKpxpykyREgeTVtvs/W1UIBZUesm
a1eNwOUvxLiYarkOb1p61eaA3txAu758enx7vTxfHj/eXl9A1OWOYG5g2DzI/YH1pfAZwxejdsC7
9fPpi3vT5+d/P72ApZQxIIwCcBf8XICiq32sohEz3netQX3r81iWtbH7Tbe2K3WQbLrlcd5f/maj
PH95/3j7DsZt8/QRb1AGN41z+fv/xjonjU95leQQHXN1WEy4U5KvD/e6jBsI3ZaWxjAya/Q/rw9v
v73f/Pvp40+6dngWcAjDG/az7WYmfKzy5pCTQjpAhrzIq2HcJXAet6o/w90Lj+xL4ojteeh3zT7G
c4BXlFiIofOzJx/aWGzdSdgrCjFe1zYI6pghhMz4eD72eWFsjBPXdkPaVbIBJMJSyrBQPzIsnIHk
BCscbvBIlR741ws1GkejSYS2HZ0P91frz3FEbLYJduvZlofUhNHtCC3ArecRFlcSxPeJCHoLJKDi
N0kQKibkDPHdCLdGkyC+j+mCLgM28QPHNZtgmzoRzujPXVJjbZN0rl+gGmEqAklUMDw6VTQ4mYII
sFQ9p/DQgcRZvn11Igncep0AEZCZhOv9DBiXPOuPgMDHKxdaBB2ZnYI+zk2cJ1Y6tIjDcG0uMZQL
8YKxxF0PL5DrbfAMwXkIGrtzQgyOFTrG+URsnqFjYxfXM4CduczSZF1ou8hSwOgOVvqsi1wbGXNA
V4LhKXS8+Uce0fz7vgwII8l5q+JtuTr18qqqz+2tK9TMjRTKeNhEFqo2rkBcP4zJ731rbSBzSBCS
X2/w4J9K7iGydkwcatsRfMKAXC3cFUxXRhs7AJfriDi6Ah7duplFb5LSDiJkdAEjjDYkAx9HnLlB
bi5GxupX1PADdhTQDuR13Nqt3YhzrcD6THocty4sAIo1ITomJ96VhWuG0Q0AURHQUIoyxPkbbVtg
UENzYl9rMzZv2QKxUoC2CNSYjRO99wNslQK6a2NF4veUa0uvuMikPiWcIczH030PJnZr6Xf5vozT
DrlJnTj4MJ65bbYvY/Rz0Fo4x+z/wrkkdg8hMOVx7X5sOkuYX3el4xKhoWSMb6/1JSACJcSoylDj
uOlMvG260vPxpbfrYxcNnSUDVO8E0u3FuSPcUU+YPu4cn3AIrGB0W2MEEwbrUjXH4CG/F4Qa8EZm
hDaycnKGg1afsZiEvrbjce9uNrKK97t4E4Wo7MNZm7UOkVyoISkvTHwoyABiwZshLmXKZCKv7w8y
9tp6N2LTZLBX16K+c2PHCTOkmp2QWgmOjx41uAM6Kvj5iOHxVlaPI/dl5NvoiAEOaoOiABAhFOgR
IlqD5zsbWfaB7qDnV+4rb12Y5JA1UQwAmEgMdP1Jcqa7VGlWJywHoAIrcKI1gZcBIuxsL+jUjjxy
14UOiA1kURXarArBAAjwNtoEyJoP9BAdrJyzfhMBEMK30AT5tXB1P/6obBz6WIiPGQHBDJARMYc/
MNPsAyqoxgSp4iM7Yq0XHzD+6hIBiMhGWpwzHKTJBQNt876JA3bGjXG/GOrtoPa1ECxAF4NWteBK
r0hd5sfr8RrykKfYFTyQ9WtgWJV1uKQKLrME/uXj8nyTdwfyKxwwP/XLCY7lgmgK9SHJz0Xe96wR
sirNY0XvAxArXr1lm0z2g7t6ndpCeJgVTmYPr+8foP482Z+khjtX9rGmqwKkLj0kcmjciXQGz79J
knWdoliz8Bv9szZP6oNZ4BFd9DtFRXBh1btzBn+hY0OBdU3cDkT00RmXVJ07EHv3gkrrExGqa4b0
2b7F9dQWTOdeK/Y2Kc+3dUUnVNYDGU95yYcGiEcKNGxuye846xZvd3ZKJxPt8115JtQu+EASrzR0
qQkhh/Outhn5dsiLVqrrhP49GvaPsZJtqHhbYaQT9xtfytFUeeXuVVh6Pw9flbotjhk7TRWpwREB
jfV2Z4xD7oabKDk5VJRdAbsl4meOpVlreT4Fc8wJFbB/+dULZS9sQDtCqwVtXWjNAwpKfXY7BlNX
czlWA9nQdwfzg0N3R8D7ujvk2xjLZVTuIT4UY2XIqrrSG7q+x5T9y6xkx7bkVqr9SNFisV++vr79
6D6eHv/CfaePHx2rLt5lrJkgAJ6x+8ipXF+cpzT5xCvVkTPxfinzpK2rs4saP82w1t846PdSfyLf
V9k9+OqX1nr4NbruR2jCvb+ckcQrjwXLsi5q7ImT47YtKMdWbH85H+7BrK/aLwZloP6MtDz/MG5z
QvWAs7nuNiYULVxHq84YwFSvCfcqhp/MOd8MgaXy2TrneMRGJJqq3rIOOd8dt/hWJIPaGJs/HAEx
r3zVel6mc21m6tsxVJ9WcQjgiwnyM1dVcR/JvoUGb17KIsfplalawMCZFbj6B1N40z7uj51RBDOm
i8wdVfO/asTEdrzOinw9//vSSH+O+UKO6dSJLLMjit71CeNqMaJJhX0xzkSUOK3kVWf2QZ/EEOuH
SqgvEn9jD3qjTjHzkPHvqybZKr/uqU1MJDuFKjdWxmV2C92M56eXv36y/3HDJOGbdr+9GY0fvr+A
oWb37fIILgFAuB6XhJuf2I9zf8irffkPyZqGd0GRV7el1lZlMbC+04ig3WbUWcSfZpOuLGssupMA
LVGn1a/zxjVdDAgPhOBEvH99e/xTW9uUcdCxBcePtXLCMmTZg1HUto984oQolp996Wo3SHPr929P
f/xhFqBna/JeU/aWGaR+vgKq2aJ+qHsykUPG5N1tFuMirQKdjSiuQ5PmeK1gcdLnp7z/ojXwxEbX
wok5aoGf1VHBG/Tp2wf4Qnm/+RCtuozd6vLx+9PzBxgZc7vUm5+g8T8e3v64fPzD2NjmRm7jqgPj
tk9Umodcuo5r4irHnoEUUJX1StwiLQVQMarMCTO1Legiocd3OELm27yAhh+3dzanH/76/g1a5f31
+XLz/u1yefxTPmkTiCnVtk/YgXor9xaQuOyBFCItY2ETJofemWmz8DenJfFOhg2GMHktY9O0kBHP
Qo1eyeY8B1RmQk6VFVIhQB5rYybv7RlObtt4yOFTwiqapQlyPOFbG9hdbNvDCvtYBYS9+f163qPe
O9QfYx/yLteZIysvmSiacluDpQGEQmnOaIFy6TTS64ZtjkRWty5ZijLZnTOSWTbnZo3Zk8zTeahx
JfNy6MjSVNtmN7Ypym+SA80r6LYW6q5Xudp73gJgh2z6ayG70uOAX4441jlutmQiAmNbdB+y/YT+
fADrFLqP+1t2qFzjJncUl9tYxilm6MpZBxiQ53Jf9vKYXFjYEnPP20rEwfqqUeVUJiB+CIOrAzFB
5A+ABB8Qwah2xnie1kTWgF3cqVOu46MtY3trp9jIjnQ0izaJW3osTNnATSYN+tXgzYNgqrO0QtVK
eLWez54zO/123TZWjN7ESlFoDTAv0snzEyjiLos0jzB37oeznuV4sWqs5ezolc8HU0aG2KVGRDie
6C4vZFuy+/MczG4kHcfPiWWZsc5lfcpECEgshu4I0q5xR+rk06bTtjLgMZmrwR+rp4+/dLuOH6xw
LXKt4nNrHofRZcZSHHDRUyTSndgh9WCzGqVqg74QYIuIuyTPweJbs013sI29iVtuyNlw1xhfFzJ4
CBiZP1saua15R/kqWdxAsFNL18Wy0wvB3dZ1P/P+4z+Wko2VZeeOc73De1aGYGcKiS+uVKSK89zR
VI+ouHXaKXHW2C+QPu52ijkOJ1d1zroDk5k5G0IDqmvZTFYjH85kNhEHk2zkO7kLQCvFEaXm32ka
HO3deful4bdLccX6QTm9gYy1EvJPPC9JxRM+Vhr+MLM16OzsesTActfISXBXGGS2bKktiloe+SOd
20ob1LJUzyESeXJdMbo4oGsqpDw2sDI2ro67ndZYaYNtF6dD3fVM6OoLuUWAqP3U24fT2PFBqgon
nbqa24gvGXMyX8bHlzCk7cZwRI9vr++vv3/cHH58u7z983Tzx/fL+wf2KncNOpVp32Zftuq1EVuR
spRQx+hjtvrjRjdggCvFfzT7Ykbu6yLdwYMhvjC0LP85ITyFMiuKuKqH9YlTF03ChFMj4tNST7by
svMRZsR+uO+avCq0rlqofC/Gpf0FQ9rtSRjyWUfGcHOsayDy+HLosvJ8jHzLvPdInl8f/7rpXr+/
PV6wy+XJkti445AR/ClvBTJZL60g8r24GF/D3HO5mgbs+r5sLSZZ05B8aECApwFsN6urYAVQ3xcr
3DZdawdhkkbz+dFghX/qoQ9XAFWTlOFq/eKu3DjBWhpsOnQtO5BuB8iraZMSdw6WFE0HkRTXGnPo
1grLRm6brXVWxRsEwonHzfUSN3kHQVmJd9ARxGRm18E9xo0IcUQs8Lk9Ysqmw6djzLMoqai0cVue
whLESnh6wiHcxr/J8Xuu0QMAzpwqEJdsoO3hsh6fJh0TqXrErcgyxoeKHVzaZq334Cy5MtLhGL3C
Pggm27kJ89oJUPZHvKWn4xXbOgnT6CmJnhjA2dgEus2t3p4gPMU9E45XB99AXP1ELszYssX1sma2
jVttjfwGr4EoPjfB/9Kdk351enTgGgg/hcZ9wgacvbq08FdWMDGHsRl4mmewSd8J203mp9g4L7a1
8j4ARS8ZDe/h0aadRkwXhRS/qYu43cEiI5TWeP4rdx9NAq8VeBvBNtekCZ2ZWDfY54QeB9y9lOnd
SgKwf8OtJwmASUV+zqugZz+1Mxxqxoj2CmlUsZoO8vvLC/g2vxGHoObhjwu/xL/pTNUy8T2I+vs+
3oIWPaxt+DH5WrJ6qvwkv8Pk+Ikvnh3+P2VPstw4ruR9vkJRpzcR3fO4aTv0gSIpiW2SoglKluui
UNvqsqJtyWPL8dr99ZMJgBQAJuiaS5WVmQRBLLkAuXB1vq7SSLtW6dJk4Xc6K49OilZUDdrnekFr
ptynqGMfdternUTGr/cQ+FNnF0V3X5H0dgSXWs/zuIo6aFG6+vByvhywtnX3Lq5K8lWdlJVeg/4K
3UW2BMRgLyRFCny0XINMqSypLrDTLKJzChL9Ev19fXn/QXS1hE2kWnYcwE8UqONAjiyUcG8B4ftp
gRendgwCTKw0qpW8Zno3xV0PjMK/2Of75fAyWJ0G0dPx9b/xOufh+Cfsk7irh6PaWYJVBWswLVhn
5sKX5/MPeBKTGZDOOQwNnbDYWIIzJEF2A3+FbG3JyyyoFjxfSVrMLQ5nnCi3EDVZAoj+ig9hZZLE
tu8QWJRjKO3oIyCFhhW2hFuSqPTCLxvq/Yxub1WpOnVFoCVt37V4Nu/mJp69nfePD+cX20jgczI1
E73LEQ+6O6tpSU22z19QbMt/X3P13J7f0ttOJ2QjX5GKi+D/ybd9XwE6wCQn+9h5Uvgjgwn399+2
FqWBd5sveg3AoqTTvxON89aTExdY2fFyEF2afRyf8TK73bOUY1ZaJ3wb7ABQV6uskzpLvvXnW7/W
VawPf1l3u1Q1rHwWOHVoUXO47CjmVRjNLac8QFBicsG7ynL+ITk5qKRfoC0MTaPM8047aqZ+cxT4
MNx+7J9haVv3juDfIJN2jOZzgoDNaLOAY7PMoudxLEgCWoXgWJYntMkisTE+bye4iwrG7GxLqrL0
SiOHRt+P0rDqV3EWFX2q3xJ8MbWc7Qk71YpvLlM3q6wOFwlsonVpTT7X0Pu99Cq1dmy95ocdXWbN
l832+Hw8dTmOHFIK2zps/JSYVwwWfm46rxLKrTHZ1hFPjik40t+Xh/NJult0XWcF8S4Ei4WnJH0x
EHMWTgP1lknCTXcfCc7DrRsMx5QT3ZXC94fDToMAH49HU59CmA52ElPWxdC1VB+XJGKnAB8Cu5RR
Fo+kq+rJdKxWM5Fwlg+HakCtBONdrUxza74RULBo4F+f9EmELb2q7rXkvkL67uLSLDXSENTuLvMw
96nFuN8luSXbEx7h4D1UkdS7yE6Sznt0bTN/k8TF4QQ9HOLK1q/m4KUqrbmouCU8zyNvl1h4aHNG
lZPWqppnOMWbInFX89mF7aKZ5iBzRdi8HHQScZlN96EhQ0fsVYHe7JXerZt5OudUOlg6f6l3TApW
/Dln5DP6JzZvBUHJHeAEiad/C7uTVy2WjwB886Sll8kmKdrgqfDh4fB8eDu/HPR6zWGcMnfkOVqG
gAZIBQKG8TbzA4UfSIAZZtmA6fhKjtVrc0pQ/wN6pPMsDz09YhsgAZlzYJZHwHq4g16mNnCFmk0r
GCN6epanzmQicMSr4tBTGXAc+kZp1TysYroiDMeoddcQoEcYz7cZwwDScG6Nw1ZIbJFJfAXV8vP8
cJvS4vxmy2JqEdxso99vXL0kceR7vhZqE44DVW5IgD7MDdAYYQSPyPJ0gJkEqmM7AKbDoWtc30uo
0SaALJFGvJI0GXqzjUae+hksCn1RVu7K9ADkW5zDWX0z8V0yehkws1DmW2jsTn2Xip172oNNzatg
ydpxoB+AUmDuY5EWA5gGaEn6vho7U7eiPg5Qrh7+ipCp5QokHnsjatUiYmrwD4BQ38wRE4M0GFta
HTkjlc3gbxB9YZSgs0sIVldmQRurCXBjW8/Ho8nO1ZrRfHTw99TAT32j8cmE0p8AMVXzNuDvYKr/
nmqO7uLgIMzDYeyhhmc9r075wZxB0bKbKTKuRQloxfkonQS+lspluR27dHaAtOC5a20daI79rPh8
O46t2KwEPtHTelZHXjCmO8Zxlih3jpvSly0CRxYeB/XX8ZR6vwhwXbVokYBoaxZBXuBa2vNHvvb0
dKSz/zwqQdW0ROwCLiBrSSJmajSEVcsxwi2vR6DCo3eabVTzpNh9d1FmWQiKcA3rnt74ePlsfZD7
Si7uq5WdojEdGWxaG833hZdZW2CRN+5ZMqxMoA9WrPAMnrM471TlI4nobQVaOyCciaspOQ2UzMfW
IAPmqGUpBdj1XH/Sbcp1Jsx17K253oSJuC7zwZHLRh5d1gjw0Kg77DzFxlOLOSYf8t3EoS84kSAH
w7AzLVd8nUXBMHCNt9Ywm05AdVTmb90KxnWViX3yT5WQvHjkIDEqQ6KmUyUgos17Xr155WF58P76
DMa8IWMn/khLUbLMo8CscdOehLcNiO7sX/cP0P0TWPU2Wa6JYXNmmqvYL9sRDT0dXo4PgGCH0/vZ
aL3OwM4rlzuWFMzi4i9oku+rPqJZnowsYRlRxCYuxSLT8FZX1cqcjR0jx0oU+07PboUepRWWDGGL
0lJmVaMJLDQl83uy03GsqMFBfMfm+0RK72ZizBEXCTyOjxIwgJUoKyFoFTNIAnEiDr9ZBPa8OofN
gbaJE9dPrGwaa9+kavyslNPJpJOcYa5eCZbrmfpx3Yb1asbnwV7sI1o3HTqjQNV8hv7I0X/rStdQ
FPJV9sMwIHkGR2hK1XA49Srh7m9CjRaHU586RESMo/d25AWVnosNgZOR+btLMx117eLheEgr44CY
aI9ruZf578BsakSrPIgak5XgEWNotL6jqamTiZomOmZBoNsIoE65tHGGitbIV42zkefrsdqgEA1d
uoQ9qDjB2CONMMBMPT27r5DYthALQDgTj0c6v+jg4XDsmrCx73ZhI9dTd0DvUm+36+PHy0tTXNjc
rhpO1u47/O/H4fTwOWCfp8vT4f34Dwb8xjGTdcAVV07ua7G/nN/+HR+xbvgfH3oV0zCeDmWha81p
x/Icb7l82r8ffs2A7PA4yM7n18G/4L1Y67zp17vSL/Vd88AfajsWAGNXffv/t+1rncHeMdHYzo/P
t/P7w/n1ALPfcMi2R3iE5ehsBUFa4uIGNDJB3sjRd9q2Yp4lsSxHBmQo/ixfuCqnE7/NkyYOM2zW
+TZkHhgiZD7TvFz7jjr+EmDyGnnKw9Vz+yFPWi/8Tmy7seq7Iy2k22H/fHlS5FMDfbsMqv3lMMjP
p+NFn5h5EgS6uBcgKgUDXj44pjmGEG1rku9TkGoXRQc/Xo6Px8snsWxyz9cV5XhZk3rMEpV1R7Pf
AeRB3yjimnmqDSB+6+tAwox1sKzXHvV6loLSpB5LwW9PO0vqfKTM+gUsCzMMvBz27x9vByzcMPiA
QevsncAxtgAHWjK5SeyYFmwcN9H2QWrsi5TYFym5L1ZsAp/ec/gpCWxHnzf5dmQ7+Njs0igPYPPb
29eI6LNqJIEdOeI7UrvzUBHqt6oI44PlHs5YPooZfWpwJZnGjN7HPdOu6n84VTxE6IWCXu9rRGoF
XtKR4Ly/xztmnHmH8RpPWiyLJ/PpbQMITA6qNVTGbOqTR/wcNTUYNxv7nuWca7Z0xzTXBoS6WiNQ
NVw1dzcCdLUGID6Z7xMQo5F+EL0ovbB0SCNfoOCTHUdLO5zegnHvwniQxUakRp+yDESUq2ak1zB6
mlAOcy0FWn9noeuRp9ZVWTlDlZU172jTCrW6YDXUb5WyDcxyEFl8QsItyABbmjCBpG4iilUIEl1h
hKuyhuWhdLCET/EcHcZS19VzICEksGSgrG98n1yfsOnWm5R5Kh9uQEZO3hasmQh1xPzADQzA2OsO
bw3TNVRPFjlgon0DB03pxY648Zg8WGJZMFQziq/Z0J14egxlVGTm7Ggo/Wx5k+TZyLFY5gI5tiCz
kTuhXvMd5tVrriklU9MZkHCh2v84HS7i/oRgTTeT6Vi9urxxplOtKK649cvDhZb7QwFbMsyrFNoM
AwRYocaT8jzyh57lTELyct5QR2Uz1sQyj4aTwO8uFokwlqCB1HOLS2SV+5q6pcPpBiXOkFv3YR4u
Q/iPDc2F0Dh6UXMlZvHj+XJ8fT78bToBYmComeChaU19Rqo6D8/HU2ctKDKRwIuaXzJh0ODXwftl
f3oEc+900I9SZH1e5Q5e6yWGOFXVuqwbgp7JFmFJWnNfUP8cbY2phLA0LUWptsmD4dUPkQNED4OU
/SdQunmep/3px8cz/P16fj+iaakNtSq/gl25ol3+fqY1zfB7PV9AgTlevRnUgw/XtemoQ4/kgDED
nqNxUjylCCyRmRw3obmswNmPNxyyHABiXJUDI2Dom7dGgUtrSXWZmRaRZZzIMYSpvejurXk5dTui
2NKyeFqcJrwd3lG3JPjurHRGTr5QGW3p6QYB/jYNAA4z+EqcLUF80J7XccloQb0s9flNoxIHk3Qw
KDPXVd0W+G/TspZQWv8HpK+3wYYjVcyI3502BdSaTBbQPr20pNAoq4RMCFUPA/WEb1l6zkgZ5+9l
CNrsqAPQZ6MBNtPRHPOYk341DU7H0w9iLTB/KrUFVYxrxHI5nf8+vqABi3zh8fgu7jw6DXJFdqhq
d1hvvOJe2ruNehg5cw2tvTRC3hsddx6Px4FRlq6a09net1Nfyzm+hb445pP0HRqqTr5Duh1usqGf
Odt2ibSj3TsmMtjn/fyM2Qa/9Bjx2NQw8T3m2k6CvmhWyM3DyyseNupMQJcCTggyMclpF3M8QJ5O
LD46oA3lu3qZVPlKuABTWy/bTp2RqlELiHooXedgfWnXeBxCby1AuZbz6hoEp6VaF0d5MdXBcOu7
E1lErpGzxLBd2yrMSI9mieQJZoon3iGyeV5/CAmvJVq5y3edVG8alkhGrOOTKksLO5oKUVHwTZC5
lSC+o49fECeyslnRy3S2oaOPEZvmW3rOJNKjJ5tjRfKlBe3DzynECrfiszJy0Q2XRfYOSg+ZHjxj
1pzYV4K+/BlIxeNFUkt5Wk4g3UusBDxprcUdh+MtodOIq0JWwhKq7ssUtEL6mpfTRSGt4HKk9Fi2
hVFzGqKAtkbQF63A8Zk3icqMVjg4gS3PB0daE3y0WFtKAiSwJ+Xn2DSJLLE6Er2sbMkCkGCTMvhl
CZLnBDWZWyStbgcPT8dXqjJFmO3mKXlnEcYY0w3PKoeL1a3ILhOVaz36VEwsbLgIiUoLp2npqtv+
XG3V99C1UzVTzN9n4efBBM3fio69alzi6mhtpWm6spww+3twQJpqybswjROaTTR5dkCBsfrgYVus
Tmz2IRIUtS1bokjoz7sTrfJZWliawTxPCwwLxayOts5oRDmzabd1d+gaQ91cb8p3lGF0YxGDoA1j
GMWqCdHTVxjiwno5pqvYSfyWuRZPPUHAIzUtx4aSwi4nJUGPpNQopBdTD+GSxTS3Fmh0zOxBZyGw
Atva5QRCePVQ5NGy7CtbIqkwkPgrvCz3HVZ9I4OeiT3o/sQxgkZE1a2YJS7uSlPaXBc5iSLP+qi4
m+OazcrlvT3QT9By554eNK8y1EewirDgeR+FpaqFwGLFv3uUD91t8/2+oNeJTLwlV2Pq2+o+GXQj
z+sKGRiiAfv4450H2V2tFsySWgGrBbSm0MKAttONI0zLNBz2sBA5p6ME0+dZ6WQQNra1JAapzY4F
eI/qTcE8exJTJBDf3dtXMYRfkoy/IkHugXwcx7SHKhWlg/GLKKsCh3gb7rxJATo2S7WzCw1pNtCh
6uttnpf+1wT4fjtFPcbbMquODCRVyNM89L1HeDYnBe8NbZJyssa9Oea/LGmoNcreZSFFL6hFKSho
cUIzL6RsYu16hxvEKvePdn3XwUZ7VsCVNPiaNF0Gzrh3/Lju6k6DXelZ1HMgElGJtmZ4YhYpwHe2
/gCjKtMysc+QMNtukiSfhTC+eW5fOTpp39e1tmB/g9KnGTmmeeTRHOlofK7dbKu7BBagknk0jbME
3vp7oifFieuSSuycR0pSS/hh1C8DAEjz32RsYHl4+/P89sKPkl6EAw2p2mP2xzwCA3dXmjlomo/p
aUmRIpYodBhv7YhNOnc/vp2Pj1pHirhamck3WnduQa6MUEjVaSk2eaKckvCf3XMSAebKckprGleK
VbSqaWNM0DS2f4Jpdfoaawj7m8McfPZXonWfzNeWPAiihQLXcBGvrC/ies/t3NrdlqHZ39SS9H8M
StOvxk8Yy5hDlO5Nazd99d2b+Qh4Yc/YNYluvmqIFRusBLQwczI0ZqUIW7G3wjM2ffWSyva9cuTA
OIA/qzDv7Jzl3eDytn/gB+vd3WxLrycYW70kdxfR5PVJq7oJViixA1m6UjIo4y+045ow/dY0T3NR
DlMBiIWJ+rPqQVUDw1wVhcEfVThuU+s3t0S88RWDfUiLFI2YOD1qddw1Emq3Tu2lcFRY0iMq17v9
NM2FsY0KswzcJvQCF1Nsw+YrMw1lc/Wnp6QQHsxHLFfCZZdytbAJ8QqmTnZzhqGaTA2AR9CKpdtd
GGVXaLLFdHVz1oXsZiIrb6kxZsxpvkOELWnxHFMuR2CP1anF2AQK0P/TmspkPWciKb2Sdd4EpAIg
Citdvy406RqIrA2DIf95ymC5F8rH3q5XtVYGgQMwyTRXU/nCwchWWs+oAC+fuAurwjYkgqJz7K9h
6ypJ1CV7O8/r3YZyQBUY5VqFNxDVyqSG63o1Z8FOnVYB00DIAHdq4oRozbROyCTfc1prWMEsZqCt
zbvZ06L9w5NasgbGE9P+t7kR29mOwG5MOgClVE4bfMUbFFrT++Hj8Tz4E3bAdQMok7KKdmSqQ5FU
b5lmcZUU13feJFWhjkqjizT7OS911YQDrluJeJGg2IZ1rSxQkBnzeBdVCWxPpYgB/6+Zl6s61/3E
tp2UiRIQmPM2yZWeriosLSDauuZh4VtRgK6njA1Q1hqwLdwIpBs9lKzGULJP/Xeb9/EG0/bN7uuE
/eY6XuB0yTJkUsDv+c25Zs8Kkuz7qkVb3w9UgdpIB7mM+t4xCTzyHSbdd1bHP9GZ9k2fnRbMD24G
6ue+rKEmGta/8etmO01+e/4n+NYhKtgqS4jXYTpGe+OwWK6TADv+blXdGCv1qkNlFkukSLHENykG
NZEnou4ODx9veCnfKZRyk9xr78Pfuyq5XSdYGAB5DD3jScVS6CywdXgC2PuCdOuo1kATi5dcd5qQ
eg1c4S9gbS9BjiZVWEvpc9UpkmiNohDsu4TxYz6efZXS2iSlwqgkRGNeTXty/AlMGdbLK3gZbhL4
p4qTAnqOMjValSAzM5DxmChcy9VvktHiHVg8il22WlcWwYn1X9KIN5PDbC+TrLSlIWt6Xa/y1T19
JNPShCXoPDlZN7OlQe9IYlCwwi5L6jQmJwf1nXh1V6Cnf38XMjCRkZrogki+LmZQ0wgXogfpoghr
I1FoQ6XVMsOaUSKn6K6Mql0ab4HLKk0CHv08kOPQbe2KRUuhJ48OsRtfPd1w+baJb8eX/a+nH9/0
lhqyZciWWCOEjEkm6LzhyOyUSTJ06XO3Du1dOSSd6U3C3769P+3hxd9UgrsKHZnKVZZG9/rwgxCP
SQSswCpMWWdUGzgv8IM5VKijI3ViQ3af5wnyAoObIBFwsXWyS8IquxcVg0xuxz8vZTyL9JInkyZe
l2y00rPwc4caC2gF67UlwSqniWOh2pAVEOWYXtlaGCmVHlkOAuf88Nfj+T+nXz73L/tfns/7x9fj
6Zf3/Z8HaOf4+MvxdDn8QKb+TfD4m8Pb6fA8eNq/PR64r9qV1//Xtf714Hg6YpjN8Z+9Hp2ZFmmN
/AYsmWJVaBOziKJdma1B+8Gc12vQoJPwhjMl8uNp8tl9ldBJ23rokb2SHCLFyp+C+SqlQHWGIWjm
YC9YqoU2yluES3v3PalAlYIm8ctiLC6sLRUCTQpfyzA3aPsstYHspqxu+4lSc9XENkVvn6+X8+Dh
/HYYnN8GT4fnVx7QqxHDCC203Osa2OvCYb+SwC4pu4nScqlalgai+8hSFNPqArukVbGgYCShovYZ
Hbf2JLR1/qYsu9QA7LaAGmKXtKmEZYF3H9CNc526ZU1NFTmdajF3vUm+zjqIYp3RwO7r+X9Kabjm
69b1MimiDrmsySesy48/no8Pv/51+Bw88LX4423/+vTZWYIVCzvtxN11kETd1yVRrFVfu4IZVS+r
RVeA12Lf5MrMaWnYjMW62iTecOhqDhfiiP/j8oTO5A/7y+FxkJz4B6Pv/3+Ol6dB+P5+fjhyVLy/
7DsjEEV5Z4QXUU58WbQEjTv0HBCZ9xg0Zv/IMFmkDOa/u/2S23RDjOQyBI64aSZvxiPvX86P6uFD
04lZdyai+azzCVFdUZ9QU/Ku7cas03RW3RHNrOYzezOl6KL5zLbv1SD6MW90d18sm8Hu7nEsiFav
qYnCGsqbzjJZYmVxy6CKsqMG78vD/6vsOJbj2I13fwVLJ7vKlsUgis9VPGDC7o52Eidwl7xMUdSK
jyUxFIPr+e/d3QBmEBpD6iJq0Y0wCJ0b8Kd6ix/nYp5LTJ0esXt+8Xto4sMDbloIMLfxt1skwnMY
US7W6QHva7RQZhYAhtHtf0qyhU/IWMZgLIvblwZRaN7coIqEi4gfgf6SFxkclDTHvwwBaYpkn71W
RJ89EN79A6klda8YRG6u+NAvLA69HdGiITSqlh6ARPlRSrh9/NOKqR/Jh89PoAzvpvZ4QdlHWesX
N/GR10SUVxsM+/OwNWB6c9TbpQJf1st4/8yI03aBB/UmBO4SHs12Uv87FvTX5/krcSl8xqgJNLMp
W3yPIbw10qaWl926S3vklXWpYNrvNpX7cqFc4oe7R0xxsaT58YPJnub1kF9W3hefHPm7Mb/0R0em
NK8UbX+auTRX998f7vbK17tvuyd9vQs3PFG22RDXKOy57SVNtHSetTQhLOWUEI6WECTufEkLAV7h
16zr0ibFoI76woOixDZwQrUG6CG4CzjCtYQc3i0jqpyaYEso/cbiPPBinIOMcvw7ukxLkjmrCG2b
lgleEx7BCKNkRcDXShz95Nftt6cr0IeeHl5fbu8Zxoi3NnDUiMoljXG/iC56eIvdIJI8rToiL9CS
RJqbQcJihUMfjyMxWD6yrKbNLtPTgzmU+fFysmH4u94jSyJ2gEsRiCFRK05mS9JzVMk3WRmKxjYQ
2/zw8/4srT4fVtmiHL788XnLnAELjgfhrQ5V2No7MNvPsweKPpNeQxSBV2Y9xC55L2a7mtFsJrTs
gCF/I1TqUrOdHHw6mt3ziHwWsEpbKPjmyNtTmhXLLiU7y6yciagyEu09cxuv0rwNPbo5oUnn7JuL
LhbpNg487m3tuRZfb+ED6syZLvJqmcXDcvtmk6046N9E0iF/VdySpAan8neqrGLuaXHbejp0F7VB
7w1g3Ue5wmn7KIjW1YWFM1KN7edPfwxxiv6OLEYH3xhzMXmU1nF7gpEC5wjHViQO51ZS3ahGJn8m
NPFFvwrvhXVIKFowsLJ9s8oSnTV1KoM2MOaChunEZUi2hrcU/SBDwPPeDwwevL25l4mR13/urn/e
3t9MLK6okh4aRFcBdvnhGio//xtrANrwc/e/j4+7uw88Ni2GMp4YkS8+SsgaIp2Jpg8O3XSW+96B
t6cfDNeEgqfbrhHm2vFOo6pMRHPB9Oa2B4w7XudZOzoOWSvqe6ZZ9x5lJXZNQSaL0/Hqp5Dcge+1
i2agGABD7MA0HWt+ogw0LHyB1dzrTbwiYzFoX2VcXwyLpiocG56Fk6elA9bpAfiASt9leeuDFlmZ
wD8NzBEMwoyBaBInqL3JinQo+yJKWTeDdKQKwxpYVlOCQozvQWKgyVCYhhEbzoKcYlDthzgGqdkq
2j+2MXztHxrq+sGudXjg/ITdlS/I8GixNIIAUUqjC+7GCgvhiKkqmo2zmR2MKOO8ywA7tsSh2P5l
3NQOstNok5kQDIudtLtMv2FLJlVhf7ECmSEYdmmS+uWXKLaBMJ5bITSXUj51Ss0AEruUa5kPJPEi
SAxso5XppgYzUMQp5vC3l1hsTBz9HrYnx14ZhaXXPm4mjq1doIpFIP94AncrOF1zOJhNxqWTKnAU
f/UGY6+tPlRmKIHeEfIZyLwqqpIvxWiKkwAIugqBoJZ5PN1qJoxC+85FLiPvDLaPz1MCfTnHB3gb
YSjKSPyyyopel0U+rcHyxHTalzgSfDkXEytQ1eSobzI6nVXuJ0d9L8qYEBdVo94pCrQEmw1zOFak
8k84CCqrUgPwdZbahsaFxZyprbQBakwgT3RIdj+uXn+94J0UL7c3rw+vz3t30ll49bS72sNrZP9j
qMcUY3CZDoWKDzv2INBZDCMDYceKaxjhLRoyqTZP5ky8qS2O6FktZpaf1YaxmQyIInIQsgqc4BNz
CtHgoGMYueKhXbpTjBsjgv27KkTDhY+0y1weJaPJM4MDLvMqsn8x9LbM7aDE8Yx2VZHFx6blM78c
OhGZo8SkZNC6Oc91UWd4eeVYu8rIlQziUGMdIDhUusvzpK38gSzTDsOrq0Vinjzy3ydpXXVOmbTP
gPyAz3gZewXjgAQffVxFX8WSl8484codHRlv2lWeZIf+0BWwCQLzOWBc1InpuTZhvQsUbbmPtK5K
SE+w4yS0sE6lj0+39y8/5aU1d7vnGz9SLpbRfgOodTnIhfnodv4SxDjrs7Q7PRoXX2kmXgtHppRc
RBgvM6RNU4qCD/ALDnY0CN/+2v3r5fZOScvPhHoty5/8T1s00BNFZlMYqhl/1mSgireYeFSEEpBF
Il9hD4R8rVK8VwGvFICdyB4KddLTGIVVjNstRBcbcpELoZEOVZlbEWKyFaD2MehxfSmrENkZjo9C
F9SAMtBvkaQEhyUb3GBICr6Fp++B0HrKe+f6b+Yj92oLJrtvrzc3GASS3T+/PL3ilbfGqhQC7Qeg
NjVn01wYhWNUi7TYnn76a9/QFA284AsR6gsN+U6XEAXd4L/MFLcUmEAIBeaQsHPrtIQxRcwIiNIR
N14vE4uI4m/OYqE5dx+1ogQxvsw65D7OSAka6m8dY1UUMzN96YJaznctkD1XGBWf5u4MYvC5VkVV
RNDY2LTCNVIDULDxJRA7ekm2gnBiZXwMLtauNiVrIyFgXWVtVTp6+NT04ERkWQhA/uHYtX5NBRiZ
5szqa1SMwXoHGuUL8VTGRsSA3bcGPjRxT7THXRoNR4mn7scsqACW8oZoSr3v0KxcRA7bVrsCpF8M
Y/OnT0PCdJD4dY+cwiCB8QoldAKlZYKmz3jtjvm88EsocsDOHRlBTeQPD4rrJaiIbDz3JDZL3Kzp
esFQCAWYWUn5aC0F6YVOqTEbmECzACri92SBw7F9a4EnfvKr2FDcTnBIgEZN5CRJxhQFO7BvOsbe
WFbO9TBK6gf8verh8fmfe/jWxOuj5BCrq/ubZ5MU4PU8wLEqmUfGFWPWWp9Oe1ACSQzsu9MxeQTD
qvsaBtXBDja1ybZadD5w/Iox5NZEpD6YiQ0jq1F+mrYbdjWs8CKATrTWrlWBxRo0fsu+KaNOXU2I
bw/LwXVHtTkDKQJkiaSyiCOZh+XXsJLX/GrKXAsQA76/Iu9nKL48x8pPOoV8MlXc3YVTs05T90JI
aezEYK6JWf39+fH2HgO8YJB3ry+7v3bwn93L9cePH/9h2EExaZHaxrQmI+fMsC7CyZrNYaQ2UEsP
UjNU+Psu3aaekNHCp2B9j3WO6M4MbDYSBlS32mByRrjTTeuk0chyGm6YoUokqeJBJ2kalgrVpEh3
vmKEVofUFRwwTFQYXDap9+D4QYyFs40XwfqTIvYbC+9+JxCrEJ0nqto1IrbCwEnqpgDoEmNdMAia
DJbBSVpLJqrlIHl2fkrR6vvVy9UeylTXaNQ3CKGa38yeDSW0YHGYcS7drUR5rRnIFIZVH3l7OSSi
E2hPx1xnLXpZRzwwTHdEcQMTUXaZ8+6BDIOJe4sETCoTSCb03B+zsAZKePUNJAyS59syW1JLaRSl
Z62fPGqP2Dt/Z0oZakgNYvoq6SZv6KtxhKJRH5uHLhtRr3ic5AK0YfSNON8iG6DCoSBZDqYEHSUO
Ct4UhXuXMEEuLs0YFsKIVUXZygSUw0HTljuPstfYJmLo0vKejaeHzgnfcjHBHzj+3dBuMlRr3Q/3
8LWtI4DI5A17hxgZJLISXYfdWM5ysThSFp1BwNv9qsWCQbF4obfam1x0U+lkjmrLChODZnok/WGq
zXSpNoraDK23yG0p6nZVWaTHAWkrACwaazWQPURAGvHCwaZa4P06loxhwdKQZqzBogQqJtCnKuvZ
nHHEgq2t4ezcqE5nZm8NbUWp3KqBnNM3MdqLslvNIcjZkcdBXhUURqNTOmvqNc7ahOetHXQncjIb
41TxG17ti04Aya1nKK7R4W8hj/dN0NmjF9ADqdSgKhfAk8i8g5cGBJtvBd6v57Odu1uQSRnRU6bB
kZfcIFdxkaBDHOlC7pVa8QAaE7WtJkvYOAAl0jkOLvOuAjt93xmraZ/tds8vKNOgdB0//Hf3dHWz
M5nouud1R83z0YBaNWqTZXbIcV3waFxzaYehNCz65KCUeszU10SARZbbRgIskdYX7aSYdqHdCps9
HED1LXnUT1HEOpnbhNh1J2kPD0jHxjKs48pMKpF6M2jLUKwOWW19CuJzBxY4KzEfGBCeDhXgO0nN
6yRw6Q8pZkVWokmHj84jjCQ7P+bjoiR5a6XF0D9WmkyOU4EyubOPmwhdoG6h6Tp1hXjLdxo+ysoU
FYRrrxNrczM/f5Vuk76oLT2iIzr0Vk2FJjPMTcaogG1shkLLKCoo7swbkqhUheHcOQsDNKDkjI0E
jLIOnat3ViEm1zptb6Wj2W2bs//YGA26v0L5vXLmBGUt2NWAZIfw83XhocNnVDV7DwJCzwt54N1a
FHgdvCRANlzzmbMSiAFVq4qMlNyZo2giGJrBIe2JXmRNAbpd6kx2T/zHwVUXEqgLHZzTmRYxCF+s
UKTqotKcdVxN1xJoI1ASLxLNoFUSb+iBZtwDqIpY5XmO0ThaL92HhJmmVdwXQeFGKshRJpkEnx7s
eB//D7nUeMkzLAIA
--===============8708700304447674778==--

