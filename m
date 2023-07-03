Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F74396
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jul 2023 03:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688353614; x=1719889614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UrhcWqbk0yIrBf94e3KYCZkQZPZZ3LekEVkie/auO4E=;
  b=DkjXRdmTY235GXgmiTM2Xp3/PGm2njwdiMkI3HXLA3tnPvJbDXodEynk
   vTe/TvbTXoRYY5ob+aZlUKbA36OysXW6VuXShLv9H/DUz3dnxG1QXwq5M
   fIxxBg+VAyTp23Rlno3dWwWuRiR8RC6kUdZ5D97h04FBH2YU7kZt5HYrA
   w/Zq/we0ZRwIrH9qhSCULZdUFjic+3PdifQC8VvgD9L/4o+Elc/qP1vtV
   wjtZj5yGVSZLxHYCdMMfTKQsrMVV3rYLnKvXgpdJQpB2sLIWzdYbkNNt+
   HL6YdPM9Djz2VYmU65MFbW5nYisvlSi9wh1iObz/8Feh5P67n5N/gYiuS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="365349013"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="365349013"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 20:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="695651929"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="695651929"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Jul 2023 20:06:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG9tr-000H51-31;
	Mon, 03 Jul 2023 03:06:51 +0000
Date: Mon, 3 Jul 2023 11:06:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:1087
 iwl_mvm_mld_change_vif_links() error: uninitialized symbol 'err'.
Message-ID: <202307031137.wEgTHhPz-lkp@intel.com>
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
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a901a3568fd26ca9c4a82d8bc5ed5b3ed844d451
commit: 12bacfc2c065319d87a0580cd65375cea8204aba wifi: iwlwifi: handle eSR transitions
date:   2 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001-20230702 (https://download.01.org/0day-ci/archive/20230703/202307031137.wEgTHhPz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307031137.wEgTHhPz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307031137.wEgTHhPz-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c:1087 iwl_mvm_mld_change_vif_links() error: uninitialized symbol 'err'.

vim +/err +1087 drivers/net/wireless/intel/iwlwifi/mvm/mld-mac80211.c

bf976c814c864e Johannes Berg  2023-03-28  1009  
bf976c814c864e Johannes Berg  2023-03-28  1010  static int
bf976c814c864e Johannes Berg  2023-03-28  1011  iwl_mvm_mld_change_vif_links(struct ieee80211_hw *hw,
bf976c814c864e Johannes Berg  2023-03-28  1012  			     struct ieee80211_vif *vif,
bf976c814c864e Johannes Berg  2023-03-28  1013  			     u16 old_links, u16 new_links,
bf976c814c864e Johannes Berg  2023-03-28  1014  			     struct ieee80211_bss_conf *old[IEEE80211_MLD_MAX_NUM_LINKS])
bf976c814c864e Johannes Berg  2023-03-28  1015  {
bf976c814c864e Johannes Berg  2023-03-28  1016  	struct iwl_mvm_vif_link_info *new_link[IEEE80211_MLD_MAX_NUM_LINKS] = {};
12bacfc2c06531 Miri Korenblit 2023-06-15  1017  	unsigned int n_active = iwl_mvm_mld_count_active_links(vif);
bf976c814c864e Johannes Berg  2023-03-28  1018  	struct iwl_mvm_vif *mvmvif = iwl_mvm_vif_from_mac80211(vif);
bf976c814c864e Johannes Berg  2023-03-28  1019  	struct iwl_mvm *mvm = IWL_MAC80211_GET_MVM(hw);
bf976c814c864e Johannes Berg  2023-03-28  1020  	u16 removed = old_links & ~new_links;
bf976c814c864e Johannes Berg  2023-03-28  1021  	u16 added = new_links & ~old_links;
bf976c814c864e Johannes Berg  2023-03-28  1022  	int err, i;
bf976c814c864e Johannes Berg  2023-03-28  1023  
12bacfc2c06531 Miri Korenblit 2023-06-15  1024  	if (hweight16(new_links) > 1 &&
12bacfc2c06531 Miri Korenblit 2023-06-15  1025  	    n_active > iwl_mvm_max_active_links(mvm, vif))
d9bfd5a06448c1 Johannes Berg  2023-04-16  1026  		return -EOPNOTSUPP;
bf976c814c864e Johannes Berg  2023-03-28  1027  
bf976c814c864e Johannes Berg  2023-03-28  1028  	for (i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
bf976c814c864e Johannes Berg  2023-03-28  1029  		int r;
bf976c814c864e Johannes Berg  2023-03-28  1030  
bf976c814c864e Johannes Berg  2023-03-28  1031  		if (test_bit(IWL_MVM_STATUS_IN_HW_RESTART, &mvm->status))
bf976c814c864e Johannes Berg  2023-03-28  1032  			break;
bf976c814c864e Johannes Berg  2023-03-28  1033  
bf976c814c864e Johannes Berg  2023-03-28  1034  		if (!(added & BIT(i)))
bf976c814c864e Johannes Berg  2023-03-28  1035  			continue;
bf976c814c864e Johannes Berg  2023-03-28  1036  		new_link[i] = kzalloc(sizeof(*new_link[i]), GFP_KERNEL);
bf976c814c864e Johannes Berg  2023-03-28  1037  		if (!new_link[i]) {
bf976c814c864e Johannes Berg  2023-03-28  1038  			err = -ENOMEM;
bf976c814c864e Johannes Berg  2023-03-28  1039  			goto free;
bf976c814c864e Johannes Berg  2023-03-28  1040  		}
bf976c814c864e Johannes Berg  2023-03-28  1041  
bf976c814c864e Johannes Berg  2023-03-28  1042  		new_link[i]->bcast_sta.sta_id = IWL_MVM_INVALID_STA;
bf976c814c864e Johannes Berg  2023-03-28  1043  		new_link[i]->mcast_sta.sta_id = IWL_MVM_INVALID_STA;
bf976c814c864e Johannes Berg  2023-03-28  1044  		new_link[i]->ap_sta_id = IWL_MVM_INVALID_STA;
bf976c814c864e Johannes Berg  2023-03-28  1045  		new_link[i]->fw_link_id = IWL_MVM_FW_LINK_ID_INVALID;
bf976c814c864e Johannes Berg  2023-03-28  1046  
bf976c814c864e Johannes Berg  2023-03-28  1047  		for (r = 0; r < NUM_IWL_MVM_SMPS_REQ; r++)
bf976c814c864e Johannes Berg  2023-03-28  1048  			new_link[i]->smps_requests[r] =
bf976c814c864e Johannes Berg  2023-03-28  1049  				IEEE80211_SMPS_AUTOMATIC;
bf976c814c864e Johannes Berg  2023-03-28  1050  	}
bf976c814c864e Johannes Berg  2023-03-28  1051  
bf976c814c864e Johannes Berg  2023-03-28  1052  	mutex_lock(&mvm->mutex);
bf976c814c864e Johannes Berg  2023-03-28  1053  
bf976c814c864e Johannes Berg  2023-03-28  1054  	if (old_links == 0) {
bf976c814c864e Johannes Berg  2023-03-28  1055  		err = iwl_mvm_disable_link(mvm, vif, &vif->bss_conf);
bf976c814c864e Johannes Berg  2023-03-28  1056  		if (err)
bf976c814c864e Johannes Berg  2023-03-28  1057  			goto out_err;
bf976c814c864e Johannes Berg  2023-03-28  1058  		mvmvif->link[0] = NULL;
bf976c814c864e Johannes Berg  2023-03-28  1059  	}
bf976c814c864e Johannes Berg  2023-03-28  1060  
bf976c814c864e Johannes Berg  2023-03-28  1061  	for (i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
bf976c814c864e Johannes Berg  2023-03-28  1062  		if (removed & BIT(i)) {
bf976c814c864e Johannes Berg  2023-03-28  1063  			struct ieee80211_bss_conf *link_conf = old[i];
bf976c814c864e Johannes Berg  2023-03-28  1064  
bf976c814c864e Johannes Berg  2023-03-28  1065  			err = iwl_mvm_disable_link(mvm, vif, link_conf);
bf976c814c864e Johannes Berg  2023-03-28  1066  			if (err)
bf976c814c864e Johannes Berg  2023-03-28  1067  				goto out_err;
bf976c814c864e Johannes Berg  2023-03-28  1068  			kfree(mvmvif->link[i]);
bf976c814c864e Johannes Berg  2023-03-28  1069  			mvmvif->link[i] = NULL;
12bacfc2c06531 Miri Korenblit 2023-06-15  1070  		} else if (added & BIT(i)) {
bf976c814c864e Johannes Berg  2023-03-28  1071  			struct ieee80211_bss_conf *link_conf;
bf976c814c864e Johannes Berg  2023-03-28  1072  
0d504ca1f19b1a Johannes Berg  2023-03-29  1073  			link_conf = link_conf_dereference_protected(vif, i);
bf976c814c864e Johannes Berg  2023-03-28  1074  			if (WARN_ON(!link_conf))
bf976c814c864e Johannes Berg  2023-03-28  1075  				continue;
bf976c814c864e Johannes Berg  2023-03-28  1076  
bf976c814c864e Johannes Berg  2023-03-28  1077  			if (!test_bit(IWL_MVM_STATUS_IN_HW_RESTART,
bf976c814c864e Johannes Berg  2023-03-28  1078  				      &mvm->status))
bf976c814c864e Johannes Berg  2023-03-28  1079  				mvmvif->link[i] = new_link[i];
bf976c814c864e Johannes Berg  2023-03-28  1080  			new_link[i] = NULL;
bf976c814c864e Johannes Berg  2023-03-28  1081  			err = iwl_mvm_add_link(mvm, vif, link_conf);
bf976c814c864e Johannes Berg  2023-03-28  1082  			if (err)
bf976c814c864e Johannes Berg  2023-03-28  1083  				goto out_err;
bf976c814c864e Johannes Berg  2023-03-28  1084  		}
bf976c814c864e Johannes Berg  2023-03-28  1085  	}
bf976c814c864e Johannes Berg  2023-03-28  1086  
12bacfc2c06531 Miri Korenblit 2023-06-15 @1087  	if (err)
12bacfc2c06531 Miri Korenblit 2023-06-15  1088  		goto out_err;
12bacfc2c06531 Miri Korenblit 2023-06-15  1089  
bf976c814c864e Johannes Berg  2023-03-28  1090  	err = 0;
bf976c814c864e Johannes Berg  2023-03-28  1091  	if (new_links == 0) {
bf976c814c864e Johannes Berg  2023-03-28  1092  		mvmvif->link[0] = &mvmvif->deflink;
bf976c814c864e Johannes Berg  2023-03-28  1093  		err = iwl_mvm_add_link(mvm, vif, &vif->bss_conf);
bf976c814c864e Johannes Berg  2023-03-28  1094  	}
bf976c814c864e Johannes Berg  2023-03-28  1095  
bf976c814c864e Johannes Berg  2023-03-28  1096  out_err:
bf976c814c864e Johannes Berg  2023-03-28  1097  	/* we really don't have a good way to roll back here ... */
bf976c814c864e Johannes Berg  2023-03-28  1098  	mutex_unlock(&mvm->mutex);
bf976c814c864e Johannes Berg  2023-03-28  1099  
bf976c814c864e Johannes Berg  2023-03-28  1100  free:
bf976c814c864e Johannes Berg  2023-03-28  1101  	for (i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++)
bf976c814c864e Johannes Berg  2023-03-28  1102  		kfree(new_link[i]);
bf976c814c864e Johannes Berg  2023-03-28  1103  	return err;
bf976c814c864e Johannes Berg  2023-03-28  1104  }
bf976c814c864e Johannes Berg  2023-03-28  1105  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
