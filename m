Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02618303A3D
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761739047; cv=none; b=J6Ly9WAhUSCrIyVTSo3tKfRZ7iQH3DjU2i5KJ1GXb8x413e6ggV/oE8X4pF3SvLoq662FSjeo7zrW9dOoN26cUSk2grkp1RghJeBQhSC6MbJWfUa5nVBNIXYg9uVZalde8VERT/O7B96rWlqFUyclSra2IAox2ZeZqfL/B9Mhz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761739047; c=relaxed/simple;
	bh=bILq5cmkpOSv/KQdw+x1EvvMX5uvU/rSaIqse5gNdAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GYc5gwSF6EPf4VySkYd2zmRooRnVAWBck8owBSwuL0u0MwFDQPlKnmpuxJe4n7tRlNV/21ebTHjZWFhj8Xc5DKeth+5Un31l3vbbVWHxYAT+KxUFF2zJfJ7gxW3TGEVBh7tq6/7t3Ea9dzsN+El9srxacdwyaqR2qiAR1YhjuKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYH1iZlk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYH1iZlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761739046; x=1793275046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bILq5cmkpOSv/KQdw+x1EvvMX5uvU/rSaIqse5gNdAs=;
  b=cYH1iZlkVbD5c+xlEWlqeGDIKEfKJfkupG9Bblpq/lGLODAzOluyEejO
   SSflw9bohLNQbRX869xuGjfbkvkzxHD85FNQ/CC8ygB+qiaF/kegZigIU
   D3xvW/PzxoC4438gZYemQNfFpPADsiQIb0lPmboAzyr8l0l3bKRZzpPH1
   Pnc14YtMvUYxtt4AINnC74Ojfjev2HkSNlZ3NPNVTk7tebdg7vSjzm285
   FyvIHWvfuZWybrYB8gZEhPbtc6Z5vr8dkmcKJNZxGbc77tvxuBW5yko52
   oBq42I963UcZXig0h+kMsZXlDytBIiQqhpV7KClos8z8QVvNSPnl6c8Wd
   w==;
X-CSE-ConnectionGUID: jnp2qFVoRnmbQDSNOfxRsQ==
X-CSE-MsgGUID: qTrO61TjSrWI244FvxFiMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63740836"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63740836"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:57:25 -0700
X-CSE-ConnectionGUID: bVS+XzXCQ/2nhXdjWJAgGg==
X-CSE-MsgGUID: Hf/XKDVNR8iZlAEHcPVxOg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2025 04:57:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE4nq-000KZL-0W;
	Wed, 29 Oct 2025 11:57:22 +0000
Date: Wed, 29 Oct 2025 19:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mld/d3.c:1594
 iwl_mld_suspend_send_security_cmds() warn: calling memset(x, y,
 ARRAY_SIZE());
Message-ID: <202510291930.G0f43knD-lkp@intel.com>
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
CC: Avraham Stern <avraham.stern@intel.com>
CC: Daniel Gabay <daniel.gabay@intel.com>
CC: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
CC: Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
CC: Yedidya Benshimol <yedidya.ben.shimol@intel.com>
CC: Benjamin Berg <benjamin.berg@intel.com>
CC: Shaul Triebitz <shaul.triebitz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver
date:   8 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r071-20251028 (https://download.01.org/0day-ci/archive/20251029/202510291930.G0f43knD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510291930.G0f43knD-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/mld/d3.c:1594 iwl_mld_suspend_send_security_cmds() warn: calling memset(x, y, ARRAY_SIZE());

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/mld/d3.c:1978 iwl_mld_wowlan_resume() error: uninitialized symbol 'keep_connection'.

vim +1594 drivers/net/wireless/intel/iwlwifi/mld/d3.c

d1e879ec600f9b Miri Korenblit 2025-02-16  1580  
d1e879ec600f9b Miri Korenblit 2025-02-16  1581  static int
d1e879ec600f9b Miri Korenblit 2025-02-16  1582  iwl_mld_suspend_send_security_cmds(struct iwl_mld *mld,
d1e879ec600f9b Miri Korenblit 2025-02-16  1583  				   struct ieee80211_vif *vif,
d1e879ec600f9b Miri Korenblit 2025-02-16  1584  				   struct iwl_mld_vif *mld_vif,
d1e879ec600f9b Miri Korenblit 2025-02-16  1585  				   int ap_sta_id)
d1e879ec600f9b Miri Korenblit 2025-02-16  1586  {
d1e879ec600f9b Miri Korenblit 2025-02-16  1587  	struct iwl_mld_suspend_key_iter_data data = {};
d1e879ec600f9b Miri Korenblit 2025-02-16  1588  	int ret;
d1e879ec600f9b Miri Korenblit 2025-02-16  1589  
d1e879ec600f9b Miri Korenblit 2025-02-16  1590  	data.rsc = kzalloc(sizeof(*data.rsc), GFP_KERNEL);
d1e879ec600f9b Miri Korenblit 2025-02-16  1591  	if (!data.rsc)
d1e879ec600f9b Miri Korenblit 2025-02-16  1592  		return -ENOMEM;
d1e879ec600f9b Miri Korenblit 2025-02-16  1593  
d1e879ec600f9b Miri Korenblit 2025-02-16 @1594  	memset(data.rsc->mcast_key_id_map, IWL_MCAST_KEY_MAP_INVALID,
d1e879ec600f9b Miri Korenblit 2025-02-16  1595  	       ARRAY_SIZE(data.rsc->mcast_key_id_map));
d1e879ec600f9b Miri Korenblit 2025-02-16  1596  
d1e879ec600f9b Miri Korenblit 2025-02-16  1597  	data.rsc->sta_id = cpu_to_le32(ap_sta_id);
d1e879ec600f9b Miri Korenblit 2025-02-16  1598  	ieee80211_iter_keys(mld->hw, vif,
d1e879ec600f9b Miri Korenblit 2025-02-16  1599  			    iwl_mld_suspend_key_data_iter,
d1e879ec600f9b Miri Korenblit 2025-02-16  1600  			    &data);
d1e879ec600f9b Miri Korenblit 2025-02-16  1601  
d1e879ec600f9b Miri Korenblit 2025-02-16  1602  	if (data.have_rsc)
d1e879ec600f9b Miri Korenblit 2025-02-16  1603  		ret = iwl_mld_send_cmd_pdu(mld, WOWLAN_TSC_RSC_PARAM,
d1e879ec600f9b Miri Korenblit 2025-02-16  1604  					   data.rsc);
d1e879ec600f9b Miri Korenblit 2025-02-16  1605  	else
d1e879ec600f9b Miri Korenblit 2025-02-16  1606  		ret = 0;
d1e879ec600f9b Miri Korenblit 2025-02-16  1607  
d1e879ec600f9b Miri Korenblit 2025-02-16  1608  	if (!ret && mld_vif->wowlan_data.rekey_data.valid)
d1e879ec600f9b Miri Korenblit 2025-02-16  1609  		ret = iwl_mld_send_kek_kck_cmd(mld, mld_vif, data, ap_sta_id);
d1e879ec600f9b Miri Korenblit 2025-02-16  1610  
d1e879ec600f9b Miri Korenblit 2025-02-16  1611  	kfree(data.rsc);
d1e879ec600f9b Miri Korenblit 2025-02-16  1612  
d1e879ec600f9b Miri Korenblit 2025-02-16  1613  	return ret;
d1e879ec600f9b Miri Korenblit 2025-02-16  1614  }
d1e879ec600f9b Miri Korenblit 2025-02-16  1615  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
