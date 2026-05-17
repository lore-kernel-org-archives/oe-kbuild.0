Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C01A155757
	for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 02:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778984773; cv=none; b=IFQ+1NwlznKN2LXTLttdbvTlepSk6r2vzDCkhHQnq8HyNtzRu10IAAc8OH5gTfhdDC/j47HoOQMpNVMslFNpRoq7nnQ7uhjNxSrFr1U58SBY0NCKQocbgMfaUSENIJlEWpX8xNZSDfYYwDShBCqgOPM+m6jqLQQO3gIvVBzKqfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778984773; c=relaxed/simple;
	bh=fto1VQHEIoBZbtOKC2eVs4uDs38+zDCAGsUqtQgCUyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cBMqrf0V+tsin9XBguVhHN/m7KU5YwC8B0yAFSIwu9yBi+phupLzMTGYM7RNWc0EmkVO+J+C/ffph/VfFc5K62/OiCrs0jBnshiZG0ucuFQyycdcV1l+bDOFyK5uhhMTFBfCr2ZQlaqpUx9Q8VUdjBsqmUIO7QNnW6rVEasIv2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l04UJwMv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l04UJwMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778984771; x=1810520771;
  h=date:from:to:cc:subject:message-id;
  bh=fto1VQHEIoBZbtOKC2eVs4uDs38+zDCAGsUqtQgCUyo=;
  b=l04UJwMvhWgGPr1qPsOB0QHNWtKc9elYNilqIPJzLQaI4V4Qk4Ze2iTL
   +oDUMOt4OY/eDwXxRnd12pkhBBWCt1OctXpPkTSLJcSH2F3W7T7NQBkc4
   eCezXfgDijVCc0jF7A62eqfdPzslA0ZbQdQgrfZ9tgVPZ5S032WDtuKeF
   HEF/ZbN/ka6eYh7O2C0kABpGrBYLiEtVGu+dFQMWmz+/3Bepv/oB9ATot
   oeIWPEJj0pORxbVJ5yKdKaFwVdzNUvzFj1g1UIrHVYb82lPBYg+jOg6nV
   OpmAraHKAXN7o/f04u4azR2AnGz00Sb3NTKNFv120BTNv3BQ/4mzYo0/O
   g==;
X-CSE-ConnectionGUID: gNKvfbAmRKiH/kOUXgTmLg==
X-CSE-MsgGUID: BJgIWSVjT3aOYdy2DNLxFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="97455261"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="97455261"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 19:26:10 -0700
X-CSE-ConnectionGUID: yznGjG89T72a/tKt6d/beg==
X-CSE-MsgGUID: ZCgDoJ1iSWqdjcflQJuv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244044130"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2026 19:26:09 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wORCg-000000001Hu-3gTL;
	Sun, 17 May 2026 02:26:06 +0000
Date: Sun, 17 May 2026 10:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [iwlwifi-next:next 13/93]
 drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn:
 variable dereferenced before check 'mld_sta' (see line 565)
Message-ID: <202605171045.6jPun4QF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   ce2b645bb3099ef4d96759335271e25875202ce9
commit: d751c944055aedf33a6cab9b1cadaab65d7bc8dd [13/93] wifi: iwlwifi: mld: use host rate for NAN management frames
:::::: branch date: 7 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171045.6jPun4QF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605171045.6jPun4QF-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn: variable dereferenced before check 'mld_sta' (see line 565)

vim +/mld_sta +571 drivers/net/wireless/intel/iwlwifi/mld/tx.c

d1e879ec600f9b3 Miri Korenblit 2025-02-16  537  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  538  static void
d1e879ec600f9b3 Miri Korenblit 2025-02-16  539  iwl_mld_fill_tx_cmd(struct iwl_mld *mld, struct sk_buff *skb,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  540  		    struct iwl_device_tx_cmd *dev_tx_cmd,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  541  		    struct ieee80211_sta *sta)
d1e879ec600f9b3 Miri Korenblit 2025-02-16  542  {
d1e879ec600f9b3 Miri Korenblit 2025-02-16  543  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  544  	struct ieee80211_hdr *hdr = (void *)skb->data;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  545  	struct iwl_mld_sta *mld_sta = sta ? iwl_mld_sta_from_mac80211(sta) :
d1e879ec600f9b3 Miri Korenblit 2025-02-16  546  					    NULL;
1c97c73cdab0afc Miri Korenblit 2025-05-11  547  	struct iwl_tx_cmd *tx_cmd;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  548  	bool amsdu = ieee80211_is_data_qos(hdr->frame_control) &&
d1e879ec600f9b3 Miri Korenblit 2025-02-16  549  		     (*ieee80211_get_qos_ctl(hdr) &
d1e879ec600f9b3 Miri Korenblit 2025-02-16  550  		      IEEE80211_QOS_CTL_A_MSDU_PRESENT);
dabc88cb3b78c0d Johannes Berg  2025-05-05  551  	__le32 rate_n_flags = 0;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  552  	u16 flags = 0;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  553  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  554  	dev_tx_cmd->hdr.cmd = TX_CMD;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  555  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  556  	if (!info->control.hw_key)
d1e879ec600f9b3 Miri Korenblit 2025-02-16  557  		flags |= IWL_TX_FLAGS_ENCRYPT_DIS;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  558  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  559  	/* For data and mgmt packets rate info comes from the fw.
d751c944055aedf Miri Korenblit 2026-05-10  560  	 * Only set rate/antenna for:
d751c944055aedf Miri Korenblit 2026-05-10  561  	 * - injected frames with fixed rate,
d751c944055aedf Miri Korenblit 2026-05-10  562  	 * - when no sta is given.
d751c944055aedf Miri Korenblit 2026-05-10  563  	 * - frames that are sent to an NMI sta, which is only used for management.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  564  	 */
d751c944055aedf Miri Korenblit 2026-05-10 @565  	if (unlikely(!sta || mld_sta->vif->type == NL80211_IFTYPE_NAN ||
d1e879ec600f9b3 Miri Korenblit 2025-02-16  566  		     info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT)) {
d1e879ec600f9b3 Miri Korenblit 2025-02-16  567  		flags |= IWL_TX_FLAGS_CMD_RATE;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  568  		rate_n_flags = iwl_mld_get_tx_rate_n_flags(mld, info, sta,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  569  							   hdr->frame_control);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  570  	} else if (!ieee80211_is_data(hdr->frame_control) ||
d1e879ec600f9b3 Miri Korenblit 2025-02-16 @571  		   (mld_sta &&
d1e879ec600f9b3 Miri Korenblit 2025-02-16  572  		    mld_sta->sta_state < IEEE80211_STA_AUTHORIZED)) {
d1e879ec600f9b3 Miri Korenblit 2025-02-16  573  		/* These are important frames */
d1e879ec600f9b3 Miri Korenblit 2025-02-16  574  		flags |= IWL_TX_FLAGS_HIGH_PRI;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  575  	}
d1e879ec600f9b3 Miri Korenblit 2025-02-16  576  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  577  	tx_cmd = (void *)dev_tx_cmd->payload;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  578  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  579  	iwl_mld_fill_tx_cmd_hdr(tx_cmd, skb, amsdu);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  580  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  581  	tx_cmd->offload_assist = iwl_mld_get_offload_assist(skb, amsdu);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  582  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  583  	/* Total # bytes to be transmitted */
d1e879ec600f9b3 Miri Korenblit 2025-02-16  584  	tx_cmd->len = cpu_to_le16((u16)skb->len);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  585  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  586  	tx_cmd->flags = cpu_to_le16(flags);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  587  
dabc88cb3b78c0d Johannes Berg  2025-05-05  588  	tx_cmd->rate_n_flags = rate_n_flags;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  589  }
d1e879ec600f9b3 Miri Korenblit 2025-02-16  590  

:::::: The code at line 571 was first introduced by commit
:::::: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
