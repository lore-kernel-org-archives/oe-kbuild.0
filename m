Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF9D3B1A4
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 19:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731872894; cv=none; b=e4z2GcsUqx75HL9Tx1FR1Snv541Iy+oZyo2CTV8Uf27AKu0B2SuWaT7guuiwxR+g5S2jTaBCE0RR2Lm/L4kGe3h7asxsrozF4F4aZuYEC+SLj7Ll1AO2hYn5a+Ipcpq2h66Lz9eIrUM9CpRNaeH8cT+K5AtSoe1fzomwyWyBSxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731872894; c=relaxed/simple;
	bh=V/dGbFoXL2uULue+aRTcPRf0OaWmzSiR/tiO2DZfhBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCWSvLPWO/pGMZnYVJY/2L+SgZoFbgvaBrP+kZ8x47SpIxkocDIt0/MVWy3eWZImKWCFQjf7Krvkamds5u2taCyd4D9ovvOuAvGYukJts/17jdn0ORql1PES//d4UF21+w+fNHyu8PlQdJNWS21ikIFmyUlELKlt1RVdGHriA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWsLMVfk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWsLMVfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731872892; x=1763408892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V/dGbFoXL2uULue+aRTcPRf0OaWmzSiR/tiO2DZfhBY=;
  b=iWsLMVfkbGi0cuk8wFjBC79f4qlwxe53Z4PlTRwPck4IvsCzYFuyx/p6
   PUefyxI6G8kwL/iXVslT2gD9cnQBfVjDq9esz1Qe8DPb4+rOlFqHQ00oF
   HfkbMlxUvTN79ebTjzLM8Po09ZNFOhierOb4Ax44NoCH2ood7TEghJs0u
   hHO/raojL98caOptxVpGIetHiuqr8OWsivARMcFviJU/JgU5jVfcFkO+c
   2KHlSOVzqi/WvNvW4M8x2ga/J8G8Q4CWfsYwNJKhWiNsBgrLi5aYwk742
   tfijcWCdzYEqTqT6nRssU7+kSbrHfnL5a0Ob+Ig+ZLG50Xa1dGdGVE6uE
   g==;
X-CSE-ConnectionGUID: gOP6SZbFQxSzq+nKiPejZw==
X-CSE-MsgGUID: Hbhey48wTJGybh1NmtYNhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31970822"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31970822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 11:48:12 -0800
X-CSE-ConnectionGUID: ceDm9ZTfQdatz1up1hPYgQ==
X-CSE-MsgGUID: AxTG2GgvRWGXpoVxGXTccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89446326"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2024 11:48:10 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tClFg-000219-0A;
	Sun, 17 Nov 2024 19:48:08 +0000
Date: Mon, 18 Nov 2024 03:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:612
 iwl_mvm_mld_start_ap_ibss() warn: missing error code 'ret'
Message-ID: <202411180342.73j3R47z-lkp@intel.com>
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
TO: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66d6acccbc08b4146f4c2cf9445241f70f5517d
commit: 3f3126515fbee0e364f8218f6171c091d8e2555e wifi: iwlwifi: mvm: add mvm-specific guard
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20241115 (https://download.01.org/0day-ci/archive/20241118/202411180342.73j3R47z-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411180342.73j3R47z-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:612 iwl_mvm_mld_start_ap_ibss() warn: missing error code 'ret'

vim +/ret +612 drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c

bde2f9b420f692 Mukesh Sisodiya  2024-04-16  573  
f947b62c03b15d Miri Korenblit   2023-03-20  574  static int iwl_mvm_mld_start_ap_ibss(struct ieee80211_hw *hw,
cbce62a315f67e Miri Korenblit   2023-03-28  575  				     struct ieee80211_vif *vif,
cbce62a315f67e Miri Korenblit   2023-03-28  576  				     struct ieee80211_bss_conf *link_conf)
f947b62c03b15d Miri Korenblit   2023-03-20  577  {
f947b62c03b15d Miri Korenblit   2023-03-20  578  	struct iwl_mvm *mvm = IWL_MAC80211_GET_MVM(hw);
f947b62c03b15d Miri Korenblit   2023-03-20  579  	struct iwl_mvm_vif *mvmvif = iwl_mvm_vif_from_mac80211(vif);
f947b62c03b15d Miri Korenblit   2023-03-20  580  	int ret;
f947b62c03b15d Miri Korenblit   2023-03-20  581  
3f3126515fbee0 Johannes Berg    2024-05-12  582  	guard(mvm)(mvm);
bde2f9b420f692 Mukesh Sisodiya  2024-04-16  583  
bde2f9b420f692 Mukesh Sisodiya  2024-04-16  584  	if (vif->type == NL80211_IFTYPE_AP)
bde2f9b420f692 Mukesh Sisodiya  2024-04-16  585  		iwl_mvm_send_ap_tx_power_constraint_cmd(mvm, vif, link_conf);
bde2f9b420f692 Mukesh Sisodiya  2024-04-16  586  
36cf537798cb6c Gregory Greenman 2023-03-28  587  	/* Send the beacon template */
36cf537798cb6c Gregory Greenman 2023-03-28  588  	ret = iwl_mvm_mac_ctxt_beacon_changed(mvm, vif, link_conf);
36cf537798cb6c Gregory Greenman 2023-03-28  589  	if (ret)
3f3126515fbee0 Johannes Berg    2024-05-12  590  		return ret;
36cf537798cb6c Gregory Greenman 2023-03-28  591  
bf976c814c864e Johannes Berg    2023-03-28  592  	/* the link should be already activated when assigning chan context */
bf976c814c864e Johannes Berg    2023-03-28  593  	ret = iwl_mvm_link_changed(mvm, vif, link_conf,
bf976c814c864e Johannes Berg    2023-03-28  594  				   LINK_CONTEXT_MODIFY_ALL &
bf976c814c864e Johannes Berg    2023-03-28  595  				   ~LINK_CONTEXT_MODIFY_ACTIVE,
f947b62c03b15d Miri Korenblit   2023-03-20  596  				   true);
f947b62c03b15d Miri Korenblit   2023-03-20  597  	if (ret)
3f3126515fbee0 Johannes Berg    2024-05-12  598  		return ret;
f947b62c03b15d Miri Korenblit   2023-03-20  599  
62e0ccb2170e7a Gregory Greenman 2023-03-28  600  	ret = iwl_mvm_mld_add_mcast_sta(mvm, vif, link_conf);
f947b62c03b15d Miri Korenblit   2023-03-20  601  	if (ret)
3f3126515fbee0 Johannes Berg    2024-05-12  602  		return ret;
f947b62c03b15d Miri Korenblit   2023-03-20  603  
f947b62c03b15d Miri Korenblit   2023-03-20  604  	/* Send the bcast station. At this stage the TBTT and DTIM time
f947b62c03b15d Miri Korenblit   2023-03-20  605  	 * events are added and applied to the scheduler
f947b62c03b15d Miri Korenblit   2023-03-20  606  	 */
62e0ccb2170e7a Gregory Greenman 2023-03-28  607  	ret = iwl_mvm_mld_add_bcast_sta(mvm, vif, link_conf);
f947b62c03b15d Miri Korenblit   2023-03-20  608  	if (ret)
f947b62c03b15d Miri Korenblit   2023-03-20  609  		goto out_rm_mcast;
f947b62c03b15d Miri Korenblit   2023-03-20  610  
f947b62c03b15d Miri Korenblit   2023-03-20  611  	if (iwl_mvm_start_ap_ibss_common(hw, vif, &ret))
f947b62c03b15d Miri Korenblit   2023-03-20 @612  		goto out_failed;
f947b62c03b15d Miri Korenblit   2023-03-20  613  
f947b62c03b15d Miri Korenblit   2023-03-20  614  	/* Need to update the P2P Device MAC (only GO, IBSS is single vif) */
f947b62c03b15d Miri Korenblit   2023-03-20  615  	if (vif->p2p && mvm->p2p_device_vif)
f947b62c03b15d Miri Korenblit   2023-03-20  616  		iwl_mvm_mld_mac_ctxt_changed(mvm, mvm->p2p_device_vif, false);
f947b62c03b15d Miri Korenblit   2023-03-20  617  
f947b62c03b15d Miri Korenblit   2023-03-20  618  	iwl_mvm_bt_coex_vif_change(mvm);
f947b62c03b15d Miri Korenblit   2023-03-20  619  
f947b62c03b15d Miri Korenblit   2023-03-20  620  	/* we don't support TDLS during DCM */
f947b62c03b15d Miri Korenblit   2023-03-20  621  	if (iwl_mvm_phy_ctx_count(mvm) > 1)
f947b62c03b15d Miri Korenblit   2023-03-20  622  		iwl_mvm_teardown_tdls_peers(mvm);
f947b62c03b15d Miri Korenblit   2023-03-20  623  
fd940de72d493c Avraham Stern    2023-06-12  624  	iwl_mvm_ftm_restart_responder(mvm, vif, link_conf);
f947b62c03b15d Miri Korenblit   2023-03-20  625  
3f3126515fbee0 Johannes Berg    2024-05-12  626  	return 0;
f947b62c03b15d Miri Korenblit   2023-03-20  627  
f947b62c03b15d Miri Korenblit   2023-03-20  628  out_failed:
f947b62c03b15d Miri Korenblit   2023-03-20  629  	iwl_mvm_power_update_mac(mvm);
f947b62c03b15d Miri Korenblit   2023-03-20  630  	mvmvif->ap_ibss_active = false;
62e0ccb2170e7a Gregory Greenman 2023-03-28  631  	iwl_mvm_mld_rm_bcast_sta(mvm, vif, link_conf);
f947b62c03b15d Miri Korenblit   2023-03-20  632  out_rm_mcast:
62e0ccb2170e7a Gregory Greenman 2023-03-28  633  	iwl_mvm_mld_rm_mcast_sta(mvm, vif, link_conf);
f947b62c03b15d Miri Korenblit   2023-03-20  634  	return ret;
f947b62c03b15d Miri Korenblit   2023-03-20  635  }
f947b62c03b15d Miri Korenblit   2023-03-20  636  

:::::: The code at line 612 was first introduced by commit
:::::: f947b62c03b15d14349668384bb365aabe898650 wifi: iwlwifi: mvm: add start_ap() and join_ibss() callbacks for MLD mode

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
