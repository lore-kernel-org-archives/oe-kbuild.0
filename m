Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43971D53B
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Jan 2023 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672936651; x=1704472651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vKiV8ksf0eGamnm9/Hw/H3MFVZOzos8nXdiXJB1ryHc=;
  b=cljczRVJgS4jmexQYnw6pL5UTAi8NH4jHlVTTfBwlYp5QvKJ2H0fR2sm
   FMowOcr/8AU+MsP1ttLg3YbOGNOo9u9ArhXTcDmctM93hViK1JqxPXpgE
   DAbTC7P8r7oQJdDk+zd89wZViR2Nxa03eqljNKcUARwR6enqsAon05ayd
   2hSPwYkyyy+G5jodvKISZHPYGw5aZpVnmWkQkhJZQgQbgtcsc0OJimT5i
   prDc4bbcVEQkw9b+pm6kJAtHRz5jOVYAUz2Ks5zubFkj1k31oPi4CbBjp
   BsQ9TNwmHwjK9aYku9q+v9FUkMluTPY9DtYweA+Lr//7wt3Vco+lFIR+d
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="324270805"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="324270805"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 08:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="657569494"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="657569494"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Jan 2023 08:37:29 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDTF5-00024d-1A;
	Thu, 05 Jan 2023 16:37:23 +0000
Date: Fri, 6 Jan 2023 00:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/infiniband/hw/irdma/cm.c:1480:7: warning: Uninitialized
 variable: listen_port [uninitvar]
Message-ID: <202301060026.vsBDS1NO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/infiniband/hw/irdma/cm.c:1480:7: warning: Uninitialized variable: listen_port [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mustafa Ismail <mustafa.ismail@intel.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Shiraz Saleem <shiraz.saleem@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   41c03ba9beea760bd2d2ac9250b09a2e192da2dc
commit: 82ab2b52654c43ba24a3f6603fec40874cc5a7e5 RDMA/irdma: Fix VLAN connection with wildcard address
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 82ab2b52654c43ba24a3f6603fec40874cc5a7e5
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:91:12: warning: Signed integer overflow for expression '0xffff<<16'. [integerOverflow]
    flags &= ~TX_BD_LEN;
              ^
--
>> drivers/net/ethernet/intel/i40e/i40e_client.c:464:13: warning: Uninitialized variable: ldev->pf [uninitvar]
     if (ldev->pf == pf) {
               ^
   drivers/net/ethernet/intel/i40e/i40e_client.c:511:13: warning: Uninitialized variable: ldev->pf [uninitvar]
     if (ldev->pf == pf) {
               ^
>> drivers/net/ethernet/intel/ice/ice_sriov.c:39:14: warning: Uninitialized variables: vf.rcu, vf.refcnt, vf.pf, vf.cfg_lock, vf.vf_id, vf.lan_vsi_idx, vf.ctrl_vsi_idx, vf.fdir, vf.first_vector_idx, vf.vf_sw_id, vf.vf_ver, vf.driver_caps, vf.dev_lan_addr, vf.hw_lan_addr, vf.legacy_last_added_umac, vf.port_vlan_info, vf.vlan_v2_caps, vf.pf_set_mac, vf.trusted, vf.spoofchk, vf.link_forced, vf.link_up, vf.lan_vsi_num, vf.min_tx_rate, vf.max_tx_rate, vf.vf_caps, vf.num_req_qs, vf.num_mac, vf.num_vf_qs, vf.mdd_rx_events, vf.mdd_tx_events, vf.repr, vf.virtchnl_ops, vf.vf_ops, vf.devlink_port [uninitvar]
     ice_put_vf(vf);
                ^
>> drivers/net/ethernet/intel/ice/ice_sriov.c:654:7: warning: Uninitialized variable: vf->vf_ops [uninitvar]
     vf->vf_ops->clear_reset_trigger(vf);
         ^
>> drivers/net/ethernet/intel/ice/ice_sriov.c:1110:45: warning: Uninitialized variable: vf->vf_id [uninitvar]
     reg_idx = (hw->func_caps.vf_base_id + vf->vf_id) / 32;
                                               ^
   drivers/net/ethernet/intel/ice/ice_sriov.c:1102:61: note: Assuming condition is false
    if (!test_and_clear_bit(ICE_VFLR_EVENT_PENDING, pf->state) ||
                                                               ^
   drivers/net/ethernet/intel/ice/ice_sriov.c:1110:45: note: Uninitialized variable: vf->vf_id
     reg_idx = (hw->func_caps.vf_base_id + vf->vf_id) / 32;
                                               ^
>> drivers/net/ethernet/intel/ice/ice_sriov.c:1143:24: warning: Uninitialized variables: vf.entry, vf.rcu, vf.refcnt, vf.pf, vf.cfg_lock, vf.vf_id, vf.lan_vsi_idx, vf.ctrl_vsi_idx, vf.fdir, vf.first_vector_idx, vf.vf_sw_id, vf.vf_ver, vf.driver_caps, vf.dev_lan_addr, vf.hw_lan_addr, vf.legacy_last_added_umac, vf.port_vlan_info, vf.vlan_v2_caps, vf.pf_set_mac, vf.trusted, vf.spoofchk, vf.link_forced, vf.link_up, vf.lan_vsi_num, vf.min_tx_rate, vf.max_tx_rate, vf.vf_caps, vf.num_req_qs, vf.num_mac, vf.num_vf_qs, vf.mdd_rx_events, vf.mdd_tx_events, vf.repr, vf.virtchnl_ops, vf.vf_ops, vf.devlink_port [uninitvar]
     vsi = ice_get_vf_vsi(vf);
                          ^
   drivers/net/ethernet/intel/ice/ice_sriov.c:1332:33: warning: Uninitialized variable: list_itr->fltr_info [uninitvar]
     u8 *existing_mac = &list_itr->fltr_info.l_data.mac.mac_addr[0];
                                   ^
--
>> drivers/infiniband/hw/irdma/hw.c:2108:14: warning: Uninitialized variable: entry->port [uninitvar]
     if (entry->port == port) {
                ^
--
>> drivers/net/ethernet/intel/ice/ice_ethtool.c:613:38: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     cpu_to_le64(ICE_TX_DESC_DTYPE_DATA |
                                        ^
   drivers/net/ethernet/intel/ice/ice_ethtool.c:614:38: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
          (td_cmd << ICE_TXD_QW1_CMD_S) |
                                        ^
   drivers/net/ethernet/intel/ice/ice_ethtool.c:616:47: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
          ((u64)size << ICE_TXD_QW1_TX_BUF_SZ_S) |
                                                 ^
>> drivers/net/ethernet/intel/ice/ice_ethtool.c:573:40: warning: Parameter 'frame' can be declared as pointer to const [constParameter]
   static bool ice_lbtest_check_frame(u8 *frame)
                                          ^
--
>> drivers/net/ethernet/intel/ice/ice_common.c:3296:48: warning: Parameter 'pi' can be declared as pointer to const [constParameter]
   ice_copy_phy_caps_to_cfg(struct ice_port_info *pi,
                                                  ^
>> drivers/net/ethernet/intel/ice/ice_common.c:885:5: warning: Signed integer overflow for expression '0x3<<30'. [integerOverflow]
       GL_PWR_MODE_CTL_CAR_MAX_BW_M) >>
       ^
--
>> drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:1183:10: warning: Uninitialized variable: f->vlan [uninitvar]
     if (f->vlan >= 0 && f->vlan <= I40E_MAX_VLANID)
            ^
>> drivers/infiniband/hw/irdma/verbs.c:2249:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
     pbl = irdma_next_pbl_addr(pbl, &pinfo, &idx);
     ^
>> drivers/infiniband/hw/irdma/verbs.c:1737:31: warning: Parameter 'lcqe_buf' can be declared as pointer to const [constParameter]
            struct irdma_cq_buf *lcqe_buf)
                                 ^
>> drivers/infiniband/hw/irdma/verbs.c:2260:45: warning: Parameter 'arr' can be declared as pointer to const [constParameter]
   static bool irdma_check_mem_contiguous(u64 *arr, u32 npages, u32 pg_size)
                                               ^
>> drivers/infiniband/hw/irdma/verbs.c:2905:10: warning: Parameter 'iova_start' can be declared as pointer to const [constParameter]
       u64 *iova_start)
            ^
>> drivers/infiniband/hw/irdma/verbs.c:3830:39: warning: Parameter 'mc_grp_ctx' can be declared as pointer to const [constParameter]
            struct irdma_mcast_grp_info *mc_grp_ctx, u8 op)
                                         ^
--
   drivers/infiniband/hw/irdma/cm.c:1901:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
     listener = NULL;
     ^
   drivers/infiniband/hw/irdma/cm.c:1801:33: warning: Parameter 'listener' can be declared as pointer to const [constParameter]
         struct irdma_cm_listener *listener,
                                   ^
>> drivers/infiniband/hw/irdma/cm.c:1480:7: warning: Uninitialized variable: listen_port [uninitvar]
     if (listen_port != dst_port ||
         ^
   drivers/infiniband/hw/irdma/cm.c:1479:28: note: Assignment 'listen_port=listen_node->loc_port', assigned value is <Uninit>
     listen_port = listen_node->loc_port;
                              ^
   drivers/infiniband/hw/irdma/cm.c:1480:7: note: Uninitialized variable: listen_port
     if (listen_port != dst_port ||
         ^
>> drivers/infiniband/hw/irdma/cm.c:1481:39: warning: Uninitialized variable: listen_node->listener_state [uninitvar]
         !(listener_state & listen_node->listener_state))
                                         ^
>> drivers/infiniband/hw/irdma/cm.c:4394:31: warning: Uninitialized variable: listen_node->vlan_id [uninitvar]
     if (vlan_id != listen_node->vlan_id ||
                                 ^
>> drivers/infiniband/hw/irdma/ctrl.c:1612:31: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
               (LAYER_RDMA << 4) | RDMAP_REMOTE_PROT,
                                 ^
   drivers/infiniband/hw/irdma/ctrl.c:1623:31: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
               (LAYER_RDMA << 4) | RDMAP_REMOTE_PROT,
                                 ^
   drivers/infiniband/hw/irdma/ctrl.c:1636:31: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
               (LAYER_RDMA << 4) | RDMAP_REMOTE_PROT,
                                 ^
   drivers/infiniband/hw/irdma/ctrl.c:1641:31: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
               (LAYER_RDMA << 4) | RDMAP_REMOTE_PROT,
                                 ^
   drivers/infiniband/hw/irdma/ctrl.c:1648:30: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
              (LAYER_RDMA << 4) | RDMAP_REMOTE_PROT,
                                ^
   drivers/infiniband/hw/irdma/ctrl.c:1663:31: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
               (LAYER_RDMA << 4) | RDMAP_REMOTE_OP,
                                 ^
   drivers/infiniband/hw/irdma/ctrl.c:1668:31: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
               (LAYER_RDMA << 4) | RDMAP_REMOTE_OP,
                                 ^
   drivers/infiniband/hw/irdma/ctrl.c:1677:30: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
              (LAYER_RDMA << 4) | RDMAP_REMOTE_PROT,
                                ^
   drivers/infiniband/hw/irdma/ctrl.c:1683:30: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
              (LAYER_RDMA << 4) | RDMAP_REMOTE_PROT,
                                ^
   drivers/infiniband/hw/irdma/ctrl.c:1692:29: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
              (LAYER_DDP << 4) | DDP_CATASTROPHIC,
                               ^
   drivers/infiniband/hw/irdma/ctrl.c:1698:29: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
              (LAYER_DDP << 4) | DDP_CATASTROPHIC,
                               ^
   drivers/infiniband/hw/irdma/ctrl.c:1739:30: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
              (LAYER_RDMA << 4) | RDMAP_REMOTE_OP,
                                ^
   drivers/infiniband/hw/irdma/ctrl.c:1744:30: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
              (LAYER_RDMA << 4) | RDMAP_REMOTE_OP,
                                ^
>> drivers/infiniband/hw/irdma/ctrl.c:3003:25: warning: Parameter 'cq' can be declared as pointer to const [constParameter]
       struct irdma_sc_cq *cq)
                           ^
   drivers/infiniband/hw/irdma/ctrl.c:3835:49: warning: Parameter 'cq' can be declared as pointer to const [constParameter]
   void irdma_sc_cleanup_ceqes(struct irdma_sc_cq *cq, struct irdma_sc_ceq *ceq)
                                                   ^

vim +1480 drivers/infiniband/hw/irdma/cm.c

146b9756f14c048 Mustafa Ismail 2021-06-02  1456  
146b9756f14c048 Mustafa Ismail 2021-06-02  1457  /**
146b9756f14c048 Mustafa Ismail 2021-06-02  1458   * irdma_find_listener - find a cm node listening on this addr-port pair
146b9756f14c048 Mustafa Ismail 2021-06-02  1459   * @cm_core: cm's core
146b9756f14c048 Mustafa Ismail 2021-06-02  1460   * @dst_addr: listener ip addr
146b9756f14c048 Mustafa Ismail 2021-06-02  1461   * @dst_port: listener tcp port num
146b9756f14c048 Mustafa Ismail 2021-06-02  1462   * @vlan_id: virtual LAN ID
146b9756f14c048 Mustafa Ismail 2021-06-02  1463   * @listener_state: state to match with listen node's
146b9756f14c048 Mustafa Ismail 2021-06-02  1464   */
146b9756f14c048 Mustafa Ismail 2021-06-02  1465  static struct irdma_cm_listener *
146b9756f14c048 Mustafa Ismail 2021-06-02  1466  irdma_find_listener(struct irdma_cm_core *cm_core, u32 *dst_addr, u16 dst_port,
146b9756f14c048 Mustafa Ismail 2021-06-02  1467  		    u16 vlan_id, enum irdma_cm_listener_state listener_state)
146b9756f14c048 Mustafa Ismail 2021-06-02  1468  {
146b9756f14c048 Mustafa Ismail 2021-06-02  1469  	struct irdma_cm_listener *listen_node;
146b9756f14c048 Mustafa Ismail 2021-06-02  1470  	static const u32 ip_zero[4] = { 0, 0, 0, 0 };
146b9756f14c048 Mustafa Ismail 2021-06-02  1471  	u32 listen_addr[4];
146b9756f14c048 Mustafa Ismail 2021-06-02  1472  	u16 listen_port;
146b9756f14c048 Mustafa Ismail 2021-06-02  1473  	unsigned long flags;
146b9756f14c048 Mustafa Ismail 2021-06-02  1474  
146b9756f14c048 Mustafa Ismail 2021-06-02  1475  	/* walk list and find cm_node associated with this session ID */
146b9756f14c048 Mustafa Ismail 2021-06-02  1476  	spin_lock_irqsave(&cm_core->listen_list_lock, flags);
146b9756f14c048 Mustafa Ismail 2021-06-02  1477  	list_for_each_entry (listen_node, &cm_core->listen_list, list) {
146b9756f14c048 Mustafa Ismail 2021-06-02  1478  		memcpy(listen_addr, listen_node->loc_addr, sizeof(listen_addr));
146b9756f14c048 Mustafa Ismail 2021-06-02  1479  		listen_port = listen_node->loc_port;
82ab2b52654c43b Mustafa Ismail 2022-07-05 @1480  		if (listen_port != dst_port ||
82ab2b52654c43b Mustafa Ismail 2022-07-05 @1481  		    !(listener_state & listen_node->listener_state))
82ab2b52654c43b Mustafa Ismail 2022-07-05  1482  			continue;
146b9756f14c048 Mustafa Ismail 2021-06-02  1483  		/* compare node pair, return node handle if a match */
82ab2b52654c43b Mustafa Ismail 2022-07-05  1484  		if (!memcmp(listen_addr, ip_zero, sizeof(listen_addr)) ||
82ab2b52654c43b Mustafa Ismail 2022-07-05  1485  		    (!memcmp(listen_addr, dst_addr, sizeof(listen_addr)) &&
82ab2b52654c43b Mustafa Ismail 2022-07-05  1486  		     vlan_id == listen_node->vlan_id)) {
146b9756f14c048 Mustafa Ismail 2021-06-02  1487  			refcount_inc(&listen_node->refcnt);
146b9756f14c048 Mustafa Ismail 2021-06-02  1488  			spin_unlock_irqrestore(&cm_core->listen_list_lock,
146b9756f14c048 Mustafa Ismail 2021-06-02  1489  					       flags);
146b9756f14c048 Mustafa Ismail 2021-06-02  1490  			trace_irdma_find_listener(listen_node);
146b9756f14c048 Mustafa Ismail 2021-06-02  1491  			return listen_node;
146b9756f14c048 Mustafa Ismail 2021-06-02  1492  		}
146b9756f14c048 Mustafa Ismail 2021-06-02  1493  	}
146b9756f14c048 Mustafa Ismail 2021-06-02  1494  	spin_unlock_irqrestore(&cm_core->listen_list_lock, flags);
146b9756f14c048 Mustafa Ismail 2021-06-02  1495  
146b9756f14c048 Mustafa Ismail 2021-06-02  1496  	return NULL;
146b9756f14c048 Mustafa Ismail 2021-06-02  1497  }
146b9756f14c048 Mustafa Ismail 2021-06-02  1498  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
