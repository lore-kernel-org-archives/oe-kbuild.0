Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6D816429
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 23:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGrljtP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701041540; x=1732577540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AA/HModBSKhOJbBgexc4Pf1ugCVEa5SHMxKxqN9p8hs=;
  b=AGrljtP+LWwtReWkN32dtZt8RSOURf88tKKd7zvuuUXEIrvc/oKg61pO
   I5wYgxVI/x6KMMj7FDCFkXnj5AQlkaffDl1P+SD+VfK1Hss8c65XTfcfF
   DntCDC+0Ft5HZ1KhcfAf5Y2uBTN6v8gAKpT8SnAKLzIAp8/dHLKu7NmUF
   d4JXtGBglU5RL1a4yMmjW5wL2DpRWU812msb/aNZ2V3noF6RInJi8Xxk2
   cQcZcEEeW6QOu65iXFcMXqaH3CVtSu3YGeh2tE1qJIGButWWP6TQuGxOl
   dSUriiQ6HLaPb3fiIpwWzu9xcEAZBzIJxPGohorPCl40P6IwctgCB1r5E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372768305"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="372768305"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 15:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="858862277"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="858862277"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2023 15:32:17 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Obn-0005d2-04;
	Sun, 26 Nov 2023 23:32:15 +0000
Date: Mon, 27 Nov 2023 07:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c:711
 iwl_mvm_mld_add_sta() warn: missing error code 'ret'
Message-ID: <202311270524.6QM9aKuf-lkp@intel.com>
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
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2da77f431ac49b5763b88751a75f70daa46296c
commit: 3aa80d31869bc2ba86f709843f7dbe1514ea10bb wifi: iwlwifi: mvm: check for iwl_mvm_mld_update_sta() errors
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: powerpc-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270524.6QM9aKuf-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270524.6QM9aKuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311270524.6QM9aKuf-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c:711 iwl_mvm_mld_add_sta() warn: missing error code 'ret'

vim +/ret +711 drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c

87f7e2435cb7dd Miri Korenblit   2023-03-28  669  
57974a55d99546 Gregory Greenman 2023-03-28  670  int iwl_mvm_mld_add_sta(struct iwl_mvm *mvm, struct ieee80211_vif *vif,
57974a55d99546 Gregory Greenman 2023-03-28  671  			struct ieee80211_sta *sta)
57974a55d99546 Gregory Greenman 2023-03-28  672  {
57974a55d99546 Gregory Greenman 2023-03-28  673  	struct iwl_mvm_vif *mvm_vif = iwl_mvm_vif_from_mac80211(vif);
57974a55d99546 Gregory Greenman 2023-03-28  674  	struct iwl_mvm_sta *mvm_sta = iwl_mvm_sta_from_mac80211(sta);
57974a55d99546 Gregory Greenman 2023-03-28  675  	unsigned long link_sta_added_to_fw = 0;
57974a55d99546 Gregory Greenman 2023-03-28  676  	struct ieee80211_link_sta *link_sta;
57974a55d99546 Gregory Greenman 2023-03-28  677  	int ret = 0;
57974a55d99546 Gregory Greenman 2023-03-28  678  	unsigned int link_id;
57974a55d99546 Gregory Greenman 2023-03-28  679  
57974a55d99546 Gregory Greenman 2023-03-28  680  	lockdep_assert_held(&mvm->mutex);
57974a55d99546 Gregory Greenman 2023-03-28  681  
57974a55d99546 Gregory Greenman 2023-03-28  682  	if (!test_bit(IWL_MVM_STATUS_IN_HW_RESTART, &mvm->status)) {
57974a55d99546 Gregory Greenman 2023-03-28  683  		ret = iwl_mvm_mld_alloc_sta_links(mvm, vif, sta);
87f7e2435cb7dd Miri Korenblit   2023-03-28  684  		if (ret)
87f7e2435cb7dd Miri Korenblit   2023-03-28  685  			return ret;
87f7e2435cb7dd Miri Korenblit   2023-03-28  686  
57974a55d99546 Gregory Greenman 2023-03-28  687  		spin_lock_init(&mvm_sta->lock);
57974a55d99546 Gregory Greenman 2023-03-28  688  
57974a55d99546 Gregory Greenman 2023-03-28  689  		ret = iwl_mvm_sta_init(mvm, vif, sta, IWL_MVM_INVALID_STA,
57974a55d99546 Gregory Greenman 2023-03-28  690  				       STATION_TYPE_PEER);
9e949dfdc5d169 Johannes Berg    2023-05-14  691  	} else {
9e949dfdc5d169 Johannes Berg    2023-05-14  692  		ret = iwl_mvm_alloc_sta_after_restart(mvm, vif, sta);
9e949dfdc5d169 Johannes Berg    2023-05-14  693  	}
9e949dfdc5d169 Johannes Berg    2023-05-14  694  
57974a55d99546 Gregory Greenman 2023-03-28  695  	if (ret)
57974a55d99546 Gregory Greenman 2023-03-28  696  		goto err;
57974a55d99546 Gregory Greenman 2023-03-28  697  
57974a55d99546 Gregory Greenman 2023-03-28  698  	/* at this stage sta link pointers are already allocated */
57974a55d99546 Gregory Greenman 2023-03-28  699  	ret = iwl_mvm_mld_update_sta(mvm, vif, sta);
3aa80d31869bc2 Johannes Berg    2023-09-21  700  	if (ret)
3aa80d31869bc2 Johannes Berg    2023-09-21  701  		goto err;
57974a55d99546 Gregory Greenman 2023-03-28  702  
57974a55d99546 Gregory Greenman 2023-03-28  703  	for_each_sta_active_link(vif, sta, link_sta, link_id) {
57974a55d99546 Gregory Greenman 2023-03-28  704  		struct ieee80211_bss_conf *link_conf =
0d504ca1f19b1a Johannes Berg    2023-03-29  705  			link_conf_dereference_protected(vif, link_id);
57974a55d99546 Gregory Greenman 2023-03-28  706  		struct iwl_mvm_link_sta *mvm_link_sta =
57974a55d99546 Gregory Greenman 2023-03-28  707  			rcu_dereference_protected(mvm_sta->link[link_id],
57974a55d99546 Gregory Greenman 2023-03-28  708  						  lockdep_is_held(&mvm->mutex));
57974a55d99546 Gregory Greenman 2023-03-28  709  
57974a55d99546 Gregory Greenman 2023-03-28  710  		if (WARN_ON(!link_conf || !mvm_link_sta))
57974a55d99546 Gregory Greenman 2023-03-28 @711  			goto err;
57974a55d99546 Gregory Greenman 2023-03-28  712  
57974a55d99546 Gregory Greenman 2023-03-28  713  		ret = iwl_mvm_mld_cfg_sta(mvm, sta, vif, link_sta, link_conf,
57974a55d99546 Gregory Greenman 2023-03-28  714  					  mvm_link_sta);
57974a55d99546 Gregory Greenman 2023-03-28  715  		if (ret)
57974a55d99546 Gregory Greenman 2023-03-28  716  			goto err;
57974a55d99546 Gregory Greenman 2023-03-28  717  
57974a55d99546 Gregory Greenman 2023-03-28  718  		link_sta_added_to_fw |= BIT(link_id);
57974a55d99546 Gregory Greenman 2023-03-28  719  
57974a55d99546 Gregory Greenman 2023-03-28  720  		if (vif->type == NL80211_IFTYPE_STATION)
57974a55d99546 Gregory Greenman 2023-03-28  721  			iwl_mvm_mld_set_ap_sta_id(sta, mvm_vif->link[link_id],
57974a55d99546 Gregory Greenman 2023-03-28  722  						  mvm_link_sta);
57974a55d99546 Gregory Greenman 2023-03-28  723  	}
87f7e2435cb7dd Miri Korenblit   2023-03-28  724  
87f7e2435cb7dd Miri Korenblit   2023-03-28  725  	return 0;
57974a55d99546 Gregory Greenman 2023-03-28  726  
57974a55d99546 Gregory Greenman 2023-03-28  727  err:
57974a55d99546 Gregory Greenman 2023-03-28  728  	/* remove all already allocated stations in FW */
57974a55d99546 Gregory Greenman 2023-03-28  729  	for_each_set_bit(link_id, &link_sta_added_to_fw,
57974a55d99546 Gregory Greenman 2023-03-28  730  			 IEEE80211_MLD_MAX_NUM_LINKS) {
57974a55d99546 Gregory Greenman 2023-03-28  731  		struct iwl_mvm_link_sta *mvm_link_sta =
57974a55d99546 Gregory Greenman 2023-03-28  732  			rcu_dereference_protected(mvm_sta->link[link_id],
57974a55d99546 Gregory Greenman 2023-03-28  733  						  lockdep_is_held(&mvm->mutex));
57974a55d99546 Gregory Greenman 2023-03-28  734  
57974a55d99546 Gregory Greenman 2023-03-28  735  		iwl_mvm_mld_rm_sta_from_fw(mvm, mvm_link_sta->sta_id);
57974a55d99546 Gregory Greenman 2023-03-28  736  	}
57974a55d99546 Gregory Greenman 2023-03-28  737  
57974a55d99546 Gregory Greenman 2023-03-28  738  	/* free all sta resources in the driver */
57974a55d99546 Gregory Greenman 2023-03-28  739  	iwl_mvm_mld_sta_rm_all_sta_links(mvm, mvm_sta);
57974a55d99546 Gregory Greenman 2023-03-28  740  	return ret;
87f7e2435cb7dd Miri Korenblit   2023-03-28  741  }
87f7e2435cb7dd Miri Korenblit   2023-03-28  742  

:::::: The code at line 711 was first introduced by commit
:::::: 57974a55d995468a9a476e24693eb741c649b25f wifi: iwlwifi: mvm: refactor iwl_mvm_mac_sta_state_common()

:::::: TO: Gregory Greenman <gregory.greenman@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
