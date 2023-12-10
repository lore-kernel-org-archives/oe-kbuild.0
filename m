Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9512160
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 00:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6z2sEbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702167311; x=1733703311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUz58nQqH7fXjOHw7Peu7gf2GRsv6NpuCrd6zn62FJk=;
  b=T6z2sEbppmVbb/+ze+2ehQIuE7CDX1IcEo3sBuw43aUrnxM30nLKNBYR
   ExSlUOp8g0asFKicxeBAvn+9c6DT1wegxsJNhmMB4SL7xnSRU+8mV6+3E
   GkoBIPvSD0mjPv/uSm3ooMawe5Vbgin52EuvPbUfMKwZO4UQBeNiJcZZX
   hn014rSUYVCVtlY3CumJgznLnNwwwHMZihashMyHxKHPO5sztkUOwVPml
   gqCORF1HRYKNgv+veDIIVHDXJ+b8pWLP4PA3NAxXAGZBILmTsruUKBvBP
   vN67DoMee7G50xYxhsOIbp69Xn2jjos2mDuYxk4Zuwv10XmP/8a2QC/GO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="16082450"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="16082450"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 16:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="801511340"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="801511340"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2023 16:15:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC7TN-000G9l-2K;
	Sun, 10 Dec 2023 00:15:05 +0000
Date: Sun, 10 Dec 2023 08:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/scan.c:2330
 iwl_mvm_scan_umac_fill_general_p_v12() error: buffer overflow
 'scan_vif->link' 15 <= 15
Message-ID: <202312100856.8642oXhC-lkp@intel.com>
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
head:   21b73ffcc62ab772bc06e3e90bd87eff5e9e8ed4
commit: e98b23d0d7b85e883216e44b12b2a8fe9a8264ff wifi: iwlwifi: mvm: Add support for SCAN API version 16
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: powerpc-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231210/202312100856.8642oXhC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312100856.8642oXhC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312100856.8642oXhC-lkp@intel.com/

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
