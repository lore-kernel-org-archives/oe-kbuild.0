Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAC6134D0
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXIoWsmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701038416; x=1732574416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AVA6uGuvaDsOKiQxuPo8prkW5rSFkGdBXWmzWBEK8cU=;
  b=FXIoWsmLKXiPpcEcpTf1Nj2H96354NJGUFk+2B7zjtc+yuwHeTXSL1i1
   j5vDGRcQoWXfMN9UEknCjb6xqnn2GOkRYX1OykmV7rqrAgv7yrI3IzPBn
   BHmHO4WPmFPB0iazY9Wo9kgPhyRF55b1ynC3iC8QvxHM2TTzmsvUBR2YE
   MYWWxju0tT2FscZQvB8aMhstSXu5N5ScPmQDIlDMPLo0jJm2mlmlh8Vpg
   KAxvJHYJHysgofCe798Ec6KWyzT1O1RNdXqNmJwo00hH5oeCQ463Yot1e
   ojLPAI85aooQ7wbGVlLGnk0GZw11rGht5/ge8uYRww+s+0uOE8ym8tkRB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="478802400"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="478802400"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 14:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="16123246"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2023 14:40:15 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7NnQ-0005aS-1q;
	Sun, 26 Nov 2023 22:40:12 +0000
Date: Mon, 27 Nov 2023 06:39:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/scan.c:2330
 iwl_mvm_scan_umac_fill_general_p_v12() error: buffer overflow
 'scan_vif->link' 15 <= 15
Message-ID: <202311270355.uog3BOPo-lkp@intel.com>
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
TO: Ilan Peer <ilan.peer@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2da77f431ac49b5763b88751a75f70daa46296c
commit: e98b23d0d7b85e883216e44b12b2a8fe9a8264ff wifi: iwlwifi: mvm: Add support for SCAN API version 16
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: powerpc-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270355.uog3BOPo-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270355.uog3BOPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311270355.uog3BOPo-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/scan.c:2330 iwl_mvm_scan_umac_fill_general_p_v12() error: buffer overflow 'scan_vif->link' 15 <= 15

vim +2330 drivers/net/wireless/intel/iwlwifi/mvm/scan.c

d24962214dd593 drivers/net/wireless/iwlwifi/mvm/scan.c       David Spinadel     2014-05-20  2293  
687db6ff5b7075 drivers/net/wireless/intel/iwlwifi/mvm/scan.c Shahar S Matityahu 2019-11-15  2294  static void
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2295  iwl_mvm_scan_umac_fill_general_p_v12(struct iwl_mvm *mvm,
19ff9b2c6e3cdf drivers/net/wireless/intel/iwlwifi/mvm/scan.c Tova Mussai        2019-11-15  2296  				     struct iwl_mvm_scan_params *params,
687db6ff5b7075 drivers/net/wireless/intel/iwlwifi/mvm/scan.c Shahar S Matityahu 2019-11-15  2297  				     struct ieee80211_vif *vif,
ba16c04fab0fac drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2021-12-04  2298  				     struct iwl_scan_general_params_v11 *gp,
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2299  				     u16 gen_flags, u8 gen_flags2,
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2300  				     u32 version)
19ff9b2c6e3cdf drivers/net/wireless/intel/iwlwifi/mvm/scan.c Tova Mussai        2019-11-15  2301  {
19ff9b2c6e3cdf drivers/net/wireless/intel/iwlwifi/mvm/scan.c Tova Mussai        2019-11-15  2302  	struct iwl_mvm_vif *scan_vif = iwl_mvm_vif_from_mac80211(vif);
19ff9b2c6e3cdf drivers/net/wireless/intel/iwlwifi/mvm/scan.c Tova Mussai        2019-11-15  2303  
ba16c04fab0fac drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2021-12-04  2304  	iwl_mvm_scan_umac_dwell_v11(mvm, gp, params);
19ff9b2c6e3cdf drivers/net/wireless/intel/iwlwifi/mvm/scan.c Tova Mussai        2019-11-15  2305  
5f10705eea4002 drivers/net/wireless/intel/iwlwifi/mvm/scan.c Colin Ian King     2023-04-14  2306  	IWL_DEBUG_SCAN(mvm, "General: flags=0x%x, flags2=0x%x\n",
c91b90b2e5fa0d drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2022-02-05  2307  		       gen_flags, gen_flags2);
c91b90b2e5fa0d drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2022-02-05  2308  
687db6ff5b7075 drivers/net/wireless/intel/iwlwifi/mvm/scan.c Shahar S Matityahu 2019-11-15  2309  	gp->flags = cpu_to_le16(gen_flags);
c91b90b2e5fa0d drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2022-02-05  2310  	gp->flags2 = gen_flags2;
19ff9b2c6e3cdf drivers/net/wireless/intel/iwlwifi/mvm/scan.c Tova Mussai        2019-11-15  2311  
687db6ff5b7075 drivers/net/wireless/intel/iwlwifi/mvm/scan.c Shahar S Matityahu 2019-11-15  2312  	if (gen_flags & IWL_UMAC_SCAN_GEN_FLAGS_V2_FRAGMENTED_LMAC1)
687db6ff5b7075 drivers/net/wireless/intel/iwlwifi/mvm/scan.c Shahar S Matityahu 2019-11-15  2313  		gp->num_of_fragments[SCAN_LB_LMAC_IDX] = IWL_SCAN_NUM_OF_FRAGS;
687db6ff5b7075 drivers/net/wireless/intel/iwlwifi/mvm/scan.c Shahar S Matityahu 2019-11-15  2314  	if (gen_flags & IWL_UMAC_SCAN_GEN_FLAGS_V2_FRAGMENTED_LMAC2)
687db6ff5b7075 drivers/net/wireless/intel/iwlwifi/mvm/scan.c Shahar S Matityahu 2019-11-15  2315  		gp->num_of_fragments[SCAN_HB_LMAC_IDX] = IWL_SCAN_NUM_OF_FRAGS;
19ff9b2c6e3cdf drivers/net/wireless/intel/iwlwifi/mvm/scan.c Tova Mussai        2019-11-15  2316  
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2317  	if (version < 12) {
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2318  		gp->scan_start_mac_or_link_id = scan_vif->id;
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2319  	} else {
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2320  		struct iwl_mvm_vif_link_info *link_info;
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2321  		u8 link_id = 0;
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2322  
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2323  		/* Use one of the active link (if any). In the future it would
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2324  		 * be possible that the link ID would be part of the scan
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2325  		 * request coming from upper layers so we would need to use it.
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2326  		 */
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2327  		if (vif->active_links)
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2328  			link_id = ffs(vif->active_links) - 1;
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2329  
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15 @2330  		link_info = scan_vif->link[link_id];
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2331  		if (!WARN_ON(!link_info))
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2332  			gp->scan_start_mac_or_link_id = link_info->fw_link_id;
e98b23d0d7b85e drivers/net/wireless/intel/iwlwifi/mvm/scan.c Ilan Peer          2023-06-15  2333  	}
687db6ff5b7075 drivers/net/wireless/intel/iwlwifi/mvm/scan.c Shahar S Matityahu 2019-11-15  2334  }
19ff9b2c6e3cdf drivers/net/wireless/intel/iwlwifi/mvm/scan.c Tova Mussai        2019-11-15  2335  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
