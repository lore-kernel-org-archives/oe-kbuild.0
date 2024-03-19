Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55A2651BB
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Mar 2024 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864584; cv=none; b=dlgd6yyrT5pITwyepxdV8zEzhS86apwCuJALuWvnIC8snKBNItpBO8Pppi4+pq3ueulAQUJh3WJyd3XGZEm5Zndra5gsgS6dZqnRbsRp30z6yCFbMoSLVCIledbCWEZBX1i+2l1tXlpL0Vwb08dloOrAAhAKi1580nlInD4AcK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864584; c=relaxed/simple;
	bh=Z7QI5djmW0BDvWmu+d18O2b+JYG+dbVl8abjL/u/6S8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fbCzhrWkjTFPjC7imw39i+SS01NC0aetljeXjJPvw0UhLM/JebxxafyHpy66bR5921zuvEbR2RT/BLqzqxOu0cVdo92BnxkMxYDeh/8f3uK/6xhFUo4GKFFLpWo95m+nBb3kkLR41ywwVJNwmtbYBVmEu/TY5jlwrjbRovOY7Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOSESdSe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOSESdSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710864581; x=1742400581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z7QI5djmW0BDvWmu+d18O2b+JYG+dbVl8abjL/u/6S8=;
  b=aOSESdSelN8eQzoz1K8L//FdVpkGBbKrjM2FiUn3wDegRlm+Yq20jMS3
   tbt7qMJ+enBvCkGURPEknLJlZCSFzw0psayATVJj8BzKyIfpxmDXwyXOw
   +YpBIygBc5+wui8HvjxEqZ+MPlwk3P8Spe4WFiUtJlTueFXfPAT3JpMsT
   rvoSVJPX8RE/a+w4l9VcZrwIy3hKjk/Ig3vvA6Ps+4Yv3HDhhze6FVWY/
   jB1kkUyKtYH5H/H5ME7Mr0rtPit/xh2ihG7rrZSmRaZy/quleercgBulv
   8psjAm6USyfMCJ4zD5ShXB1Rr4kgnJRxhNXsKjri1Vf2Yhnm0XPyYp9gV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9514003"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="9514003"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 09:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="14301451"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2024 09:08:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmc10-000HuJ-0v;
	Tue, 19 Mar 2024 16:08:38 +0000
Date: Wed, 20 Mar 2024 00:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/ice/ice_common.c:1006 ice_init_hw()
 error: uninitialized symbol 'mac_buf'.
Message-ID: <202403192312.npvjVo8t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Przemek Kitszel <przemyslaw.kitszel@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b3603fcb79b1036acae10602bffc4855a4b9af80
commit: 90f821d72e112d5e4e4214a3704935283cc53375 ice: avoid unnecessary devm_ usage
date:   2 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 2 weeks ago
config: loongarch-randconfig-r071-20240319 (https://download.01.org/0day-ci/archive/20240319/202403192312.npvjVo8t-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403192312.npvjVo8t-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_common.c:1006 ice_init_hw() error: uninitialized symbol 'mac_buf'.
drivers/net/ethernet/intel/ice/ice_common.c:1005 ice_init_hw() error: uninitialized symbol 'pcaps'.
drivers/net/ethernet/intel/ice/ice_common.c:1006 ice_init_hw() error: uninitialized symbol 'mac_buf'.
drivers/net/ethernet/intel/ice/ice_common.c:1005 ice_init_hw() error: uninitialized symbol 'pcaps'.
drivers/net/ethernet/intel/ice/ice_common.c:1006 ice_init_hw() error: uninitialized symbol 'mac_buf'.
drivers/net/ethernet/intel/ice/ice_common.c:1005 ice_init_hw() error: uninitialized symbol 'pcaps'.
drivers/net/ethernet/intel/ice/ice_common.c:3423 ice_set_fc() error: uninitialized symbol 'pcaps'.
drivers/net/ethernet/intel/ice/ice_common.c:3564 ice_cfg_phy_fec() error: uninitialized symbol 'pcaps'.
drivers/net/ethernet/intel/ice/ice_ethtool.c:948 ice_loopback_test() error: uninitialized symbol 'tx_frame'.
drivers/net/ethernet/intel/ice/ice_ethtool.c:948 ice_loopback_test() error: uninitialized symbol 'tx_frame'.

vim +/mac_buf +1006 drivers/net/ethernet/intel/ice/ice_common.c

9e4ab4c29a62d2 Brett Creeley          2018-09-19   998  
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20   999  /**
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1000   * ice_init_hw - main hardware initialization routine
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1001   * @hw: pointer to the hardware structure
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1002   */
5e24d5984c805c Tony Nguyen            2021-10-07  1003  int ice_init_hw(struct ice_hw *hw)
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1004  {
90f821d72e112d Maciej Fijalkowski     2024-02-23 @1005  	struct ice_aqc_get_phy_caps_data *pcaps __free(kfree);
90f821d72e112d Maciej Fijalkowski     2024-02-23 @1006  	void *mac_buf __free(kfree);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1007  	u16 mac_buf_len;
5518ac2a64423f Tony Nguyen            2021-10-07  1008  	int status;
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1009  
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1010  	/* Set MAC type based on DeviceID */
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1011  	status = ice_set_mac_type(hw);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1012  	if (status)
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1013  		return status;
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1014  
5a259f8e0bafaa Jesse Brandeburg       2023-12-05  1015  	hw->pf_id = FIELD_GET(PF_FUNC_RID_FUNC_NUM_M, rd32(hw, PF_FUNC_RID));
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1016  
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1017  	status = ice_reset(hw, ICE_RESET_PFR);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1018  	if (status)
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1019  		return status;
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1020  
fe7219fa7c7972 Bruce Allan            2019-02-28  1021  	ice_get_itr_intrl_gran(hw);
940b61af02f497 Anirudh Venkataramanan 2018-03-20  1022  
5c91ecfda5a8bf Jacob Keller           2019-06-26  1023  	status = ice_create_all_ctrlq(hw);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1024  	if (status)
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1025  		goto err_unroll_cqinit;
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1026  
96a9a9341cdaea Paul M Stillwell Jr    2023-12-12  1027  	status = ice_fwlog_init(hw);
96a9a9341cdaea Paul M Stillwell Jr    2023-12-12  1028  	if (status)
96a9a9341cdaea Paul M Stillwell Jr    2023-12-12  1029  		ice_debug(hw, ICE_DBG_FW_LOG, "Error initializing FW logging: %d\n",
96a9a9341cdaea Paul M Stillwell Jr    2023-12-12  1030  			  status);
96a9a9341cdaea Paul M Stillwell Jr    2023-12-12  1031  
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1032  	status = ice_clear_pf_cfg(hw);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1033  	if (status)
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1034  		goto err_unroll_cqinit;
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1035  
148beb61203125 Henry Tieman           2020-05-11  1036  	/* Set bit to enable Flow Director filters */
148beb61203125 Henry Tieman           2020-05-11  1037  	wr32(hw, PFQF_FD_ENA, PFQF_FD_ENA_FD_ENA_M);
148beb61203125 Henry Tieman           2020-05-11  1038  	INIT_LIST_HEAD(&hw->fdir_list_head);
148beb61203125 Henry Tieman           2020-05-11  1039  
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1040  	ice_clear_pxe_mode(hw);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1041  
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1042  	status = ice_init_nvm(hw);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1043  	if (status)
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1044  		goto err_unroll_cqinit;
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1045  
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1046  	status = ice_get_caps(hw);
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1047  	if (status)
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1048  		goto err_unroll_cqinit;
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1049  
5b246e533d0177 Michal Swiatkowski     2022-12-21  1050  	if (!hw->port_info)
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1051  		hw->port_info = devm_kzalloc(ice_hw_to_dev(hw),
5b246e533d0177 Michal Swiatkowski     2022-12-21  1052  					     sizeof(*hw->port_info),
5b246e533d0177 Michal Swiatkowski     2022-12-21  1053  					     GFP_KERNEL);
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1054  	if (!hw->port_info) {
d54699e27d506f Tony Nguyen            2021-10-07  1055  		status = -ENOMEM;
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1056  		goto err_unroll_cqinit;
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1057  	}
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1058  
f9867df6d96593 Anirudh Venkataramanan 2019-02-19  1059  	/* set the back pointer to HW */
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1060  	hw->port_info->hw = hw;
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1061  
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1062  	/* Initialize port_info struct with switch configuration data */
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1063  	status = ice_get_initial_sw_cfg(hw);
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1064  	if (status)
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1065  		goto err_unroll_alloc;
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1066  
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1067  	hw->evb_veb = true;
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1068  
16dfa49406bc5e Michal Wilczynski      2022-11-15  1069  	/* init xarray for identifying scheduling nodes uniquely */
16dfa49406bc5e Michal Wilczynski      2022-11-15  1070  	xa_init_flags(&hw->port_info->sched_node_ids, XA_FLAGS_ALLOC);
16dfa49406bc5e Michal Wilczynski      2022-11-15  1071  
d337f2afb7aceb Anirudh Venkataramanan 2018-10-26  1072  	/* Query the allocated resources for Tx scheduler */
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1073  	status = ice_sched_query_res_alloc(hw);
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1074  	if (status) {
9228d8b2613b3e Jacob Keller           2020-09-17  1075  		ice_debug(hw, ICE_DBG_SCHED, "Failed to get scheduler allocated resources\n");
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1076  		goto err_unroll_alloc;
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1077  	}
4f8a14976aa4b3 Ben Shelton            2020-11-20  1078  	ice_sched_get_psm_clk_freq(hw);
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1079  
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1080  	/* Initialize port_info struct with scheduler data */
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1081  	status = ice_sched_init_port(hw->port_info);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1082  	if (status)
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1083  		goto err_unroll_sched;
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1084  
90f821d72e112d Maciej Fijalkowski     2024-02-23  1085  	pcaps = kzalloc(sizeof(*pcaps), GFP_KERNEL);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1086  	if (!pcaps) {
d54699e27d506f Tony Nguyen            2021-10-07  1087  		status = -ENOMEM;
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1088  		goto err_unroll_sched;
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1089  	}
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1090  
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1091  	/* Initialize port_info struct with PHY capabilities */
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1092  	status = ice_aq_get_phy_caps(hw->port_info, false,
d6730a871e68f1 Anirudh Venkataramanan 2021-03-25  1093  				     ICE_AQC_REPORT_TOPO_CAP_MEDIA, pcaps,
d6730a871e68f1 Anirudh Venkataramanan 2021-03-25  1094  				     NULL);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1095  	if (status)
f2651a91b97d14 Paul M Stillwell Jr    2020-09-17  1096  		dev_warn(ice_hw_to_dev(hw), "Get PHY capabilities failed status = %d, continuing anyway\n",
f2651a91b97d14 Paul M Stillwell Jr    2020-09-17  1097  			 status);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1098  
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1099  	/* Initialize port_info struct with link information */
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1100  	status = ice_aq_get_link_info(hw->port_info, false, NULL, NULL);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1101  	if (status)
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1102  		goto err_unroll_sched;
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1103  
b36c598c999c62 Anirudh Venkataramanan 2018-08-09  1104  	/* need a valid SW entry point to build a Tx tree */
b36c598c999c62 Anirudh Venkataramanan 2018-08-09  1105  	if (!hw->sw_entry_point_layer) {
b36c598c999c62 Anirudh Venkataramanan 2018-08-09  1106  		ice_debug(hw, ICE_DBG_SCHED, "invalid sw entry point\n");
d54699e27d506f Tony Nguyen            2021-10-07  1107  		status = -EIO;
b36c598c999c62 Anirudh Venkataramanan 2018-08-09  1108  		goto err_unroll_sched;
b36c598c999c62 Anirudh Venkataramanan 2018-08-09  1109  	}
9be1d6f8c33731 Anirudh Venkataramanan 2018-12-19  1110  	INIT_LIST_HEAD(&hw->agg_list);
1ddef455f4a8ba Usha Ketineni          2019-11-06  1111  	/* Initialize max burst size */
1ddef455f4a8ba Usha Ketineni          2019-11-06  1112  	if (!hw->max_burst_size)
1ddef455f4a8ba Usha Ketineni          2019-11-06  1113  		ice_cfg_rl_burst_size(hw, ICE_SCHED_DFLT_BURST_SIZE);
b36c598c999c62 Anirudh Venkataramanan 2018-08-09  1114  
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1115  	status = ice_init_fltr_mgmt_struct(hw);
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1116  	if (status)
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1117  		goto err_unroll_sched;
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1118  
d6fef10c750e64 Md Fahad Iqbal Polash  2018-04-16  1119  	/* Get MAC information */
d6fef10c750e64 Md Fahad Iqbal Polash  2018-04-16  1120  	/* A single port can report up to two (LAN and WoL) addresses */
90f821d72e112d Maciej Fijalkowski     2024-02-23  1121  	mac_buf = kcalloc(2, sizeof(struct ice_aqc_manage_mac_read_resp),
d6fef10c750e64 Md Fahad Iqbal Polash  2018-04-16  1122  			  GFP_KERNEL);
63bb4e1ebd9876 Wei Yongjun            2018-03-28  1123  	if (!mac_buf) {
d54699e27d506f Tony Nguyen            2021-10-07  1124  		status = -ENOMEM;
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1125  		goto err_unroll_fltr_mgmt_struct;
63bb4e1ebd9876 Wei Yongjun            2018-03-28  1126  	}
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1127  
90f821d72e112d Maciej Fijalkowski     2024-02-23  1128  	mac_buf_len = 2 * sizeof(struct ice_aqc_manage_mac_read_resp);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1129  	status = ice_aq_manage_mac_read(hw, mac_buf, mac_buf_len, NULL);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1130  
4244910568ed2f Anirudh Venkataramanan 2020-05-15  1131  	if (status)
4244910568ed2f Anirudh Venkataramanan 2020-05-15  1132  		goto err_unroll_fltr_mgmt_struct;
4244910568ed2f Anirudh Venkataramanan 2020-05-15  1133  	/* enable jumbo frame support at MAC level */
4244910568ed2f Anirudh Venkataramanan 2020-05-15  1134  	status = ice_aq_set_mac_cfg(hw, ICE_AQ_SET_MAC_FRAME_SIZE_MAX, NULL);
148beb61203125 Henry Tieman           2020-05-11  1135  	if (status)
148beb61203125 Henry Tieman           2020-05-11  1136  		goto err_unroll_fltr_mgmt_struct;
148beb61203125 Henry Tieman           2020-05-11  1137  	/* Obtain counter base index which would be used by flow director */
148beb61203125 Henry Tieman           2020-05-11  1138  	status = ice_alloc_fd_res_cntr(hw, &hw->fd_ctr_base);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1139  	if (status)
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1140  		goto err_unroll_fltr_mgmt_struct;
32d63fa1e9f33b Tony Nguyen            2019-09-09  1141  	status = ice_init_hw_tbls(hw);
32d63fa1e9f33b Tony Nguyen            2019-09-09  1142  	if (status)
32d63fa1e9f33b Tony Nguyen            2019-09-09  1143  		goto err_unroll_fltr_mgmt_struct;
a4e82a81f57387 Tony Nguyen            2020-05-06  1144  	mutex_init(&hw->tnl_lock);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1145  	return 0;
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1146  
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1147  err_unroll_fltr_mgmt_struct:
9daf8208dd4dee Anirudh Venkataramanan 2018-03-20  1148  	ice_cleanup_fltr_mgmt_struct(hw);
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1149  err_unroll_sched:
dc49c77236769c Anirudh Venkataramanan 2018-03-20  1150  	ice_sched_cleanup_all(hw);
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1151  err_unroll_alloc:
9c20346b6309e2 Anirudh Venkataramanan 2018-03-20  1152  	devm_kfree(ice_hw_to_dev(hw), hw->port_info);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1153  err_unroll_cqinit:
5c91ecfda5a8bf Jacob Keller           2019-06-26  1154  	ice_destroy_all_ctrlq(hw);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1155  	return status;
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1156  }
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  1157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
