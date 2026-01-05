Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACBD1B4223
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 01:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767575542; cv=none; b=YKUj6XAxTA0UfqLX9dKnM/JHEHDtIK2DKkt13L6+fwdSE8bvu9m7tEiP2KxlLUSgjTRp92ah3ecGc4HADyGbEaTJ4kt7Ipk3m3shGhpQq40cuZX4gmWOYChLEaUU2/C13DUhA0NUOfPlsIJHgVfh8Je1l8BvdDrb9ArrPeVoT0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767575542; c=relaxed/simple;
	bh=aoTuSphioIj+JJ3mKT/kxisbttylV+iA4qBPGF8jCyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=duDkMg6jl3NS320v02VxlVk6kS73i9tT9MWiHWcAl+bdLBUJXplDJnSNaOWc88sTP2V9IjPN8KR4XCpri8QzYQwkOsEj8zYHGgqVmw9gaa6QcnCSgZU6uhLFrB/9ryrbadno7Mfl704A1Vv+wq3TmLIgah5vDU5iZoEBg3zWwlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2G304Mm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2G304Mm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767575540; x=1799111540;
  h=date:from:to:cc:subject:message-id;
  bh=aoTuSphioIj+JJ3mKT/kxisbttylV+iA4qBPGF8jCyI=;
  b=k2G304MmstTzNzhhkh9qa9i+UhdzBYdbgLJyBysbXr+jUJJ+VfVziKHC
   wJmc0d2Z6dIOGUt9L8m/iB3MzlVGNAUphpoop2I+wxjyGO2NddfuADHaE
   ks3R/q18GgMJcF2nbvq4hakt1bVS3nkuP+fXddxclsx2yuysS8V6svEy/
   jnMYWsWisPexsqy0wRwEdW1vhgymxAjK1vh1pAZMHIk+aubvEQGoBxtnj
   pb+M7EGBhN18uMZHE9l0DrQORkNsLlnfCtUh9auITnVnYmcszoto52Yxq
   EwB2FvXtBSbP6j7DIBtZFOeDjj0mTrFB36k3vcPiLSCuCT/wNzu0vJpXG
   Q==;
X-CSE-ConnectionGUID: aQkkgu06StSxtgEC2ins3w==
X-CSE-MsgGUID: D3Iwq16cTP2n8yx7NKbavQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="86531224"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="86531224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 17:12:19 -0800
X-CSE-ConnectionGUID: kEGuTI8jTEKZIW/1e6OLJg==
X-CSE-MsgGUID: uZKQ93yCQ/e6ZijY8uN27Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="232971416"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jan 2026 17:12:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcZ8p-000000000s5-34yO;
	Mon, 05 Jan 2026 01:12:15 +0000
Date: Mon, 05 Jan 2026 09:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mld/ptp.c:298
 iwl_mld_ptp_init() warn: passing zero to 'PTR_ERR'
Message-ID: <202601050950.dSSUaYyl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

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
head:   9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
commit: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20260105 (https://download.01.org/0day-ci/archive/20260105/202601050950.dSSUaYyl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601050950.dSSUaYyl-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mld/ptp.c:298 iwl_mld_ptp_init() warn: passing zero to 'PTR_ERR'
drivers/net/wireless/intel/iwlwifi/mld/scan.c:1124 iwl_mld_scan_cmd_set_chan_params() warn: assigning (-128) to unsigned variable 'cfg->v5.psd_20'
drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:2093 iwl_mld_set_key_add() error: we previously assumed 'mld_sta' could be null (see line 2076)

vim +/PTR_ERR +298 drivers/net/wireless/intel/iwlwifi/mld/ptp.c

d1e879ec600f9b Miri Korenblit 2025-02-16  271  
d1e879ec600f9b Miri Korenblit 2025-02-16  272  void iwl_mld_ptp_init(struct iwl_mld *mld)
d1e879ec600f9b Miri Korenblit 2025-02-16  273  {
d1e879ec600f9b Miri Korenblit 2025-02-16  274  	if (WARN_ON(mld->ptp_data.ptp_clock))
d1e879ec600f9b Miri Korenblit 2025-02-16  275  		return;
d1e879ec600f9b Miri Korenblit 2025-02-16  276  
d1e879ec600f9b Miri Korenblit 2025-02-16  277  	spin_lock_init(&mld->ptp_data.lock);
d1e879ec600f9b Miri Korenblit 2025-02-16  278  	INIT_DELAYED_WORK(&mld->ptp_data.dwork, iwl_mld_ptp_work);
d1e879ec600f9b Miri Korenblit 2025-02-16  279  
d1e879ec600f9b Miri Korenblit 2025-02-16  280  	mld->ptp_data.ptp_clock_info.owner = THIS_MODULE;
d1e879ec600f9b Miri Korenblit 2025-02-16  281  	mld->ptp_data.ptp_clock_info.gettime64 = iwl_mld_ptp_gettime;
d1e879ec600f9b Miri Korenblit 2025-02-16  282  	mld->ptp_data.ptp_clock_info.max_adj = 0x7fffffff;
d1e879ec600f9b Miri Korenblit 2025-02-16  283  	mld->ptp_data.ptp_clock_info.adjtime = iwl_mld_ptp_adjtime;
d1e879ec600f9b Miri Korenblit 2025-02-16  284  	mld->ptp_data.ptp_clock_info.adjfine = iwl_mld_ptp_adjfine;
d1e879ec600f9b Miri Korenblit 2025-02-16  285  	mld->ptp_data.scaled_freq = PTP_SCALE_FACTOR;
d1e879ec600f9b Miri Korenblit 2025-02-16  286  	mld->ptp_data.ptp_clock_info.getcrosststamp =
d1e879ec600f9b Miri Korenblit 2025-02-16  287  					iwl_mld_phc_get_crosstimestamp;
d1e879ec600f9b Miri Korenblit 2025-02-16  288  
d1e879ec600f9b Miri Korenblit 2025-02-16  289  	/* Give a short 'friendly name' to identify the PHC clock */
d1e879ec600f9b Miri Korenblit 2025-02-16  290  	snprintf(mld->ptp_data.ptp_clock_info.name,
d1e879ec600f9b Miri Korenblit 2025-02-16  291  		 sizeof(mld->ptp_data.ptp_clock_info.name),
d1e879ec600f9b Miri Korenblit 2025-02-16  292  		 "%s", "iwlwifi-PTP");
d1e879ec600f9b Miri Korenblit 2025-02-16  293  
d1e879ec600f9b Miri Korenblit 2025-02-16  294  	mld->ptp_data.ptp_clock =
d1e879ec600f9b Miri Korenblit 2025-02-16  295  		ptp_clock_register(&mld->ptp_data.ptp_clock_info, mld->dev);
d1e879ec600f9b Miri Korenblit 2025-02-16  296  
d1e879ec600f9b Miri Korenblit 2025-02-16  297  	if (IS_ERR_OR_NULL(mld->ptp_data.ptp_clock)) {
d1e879ec600f9b Miri Korenblit 2025-02-16 @298  		IWL_ERR(mld, "Failed to register PHC clock (%ld)\n",
d1e879ec600f9b Miri Korenblit 2025-02-16  299  			PTR_ERR(mld->ptp_data.ptp_clock));
d1e879ec600f9b Miri Korenblit 2025-02-16  300  		mld->ptp_data.ptp_clock = NULL;
d1e879ec600f9b Miri Korenblit 2025-02-16  301  	} else {
d1e879ec600f9b Miri Korenblit 2025-02-16  302  		IWL_INFO(mld, "Registered PHC clock: %s, with index: %d\n",
d1e879ec600f9b Miri Korenblit 2025-02-16  303  			 mld->ptp_data.ptp_clock_info.name,
d1e879ec600f9b Miri Korenblit 2025-02-16  304  			 ptp_clock_index(mld->ptp_data.ptp_clock));
d1e879ec600f9b Miri Korenblit 2025-02-16  305  	}
d1e879ec600f9b Miri Korenblit 2025-02-16  306  }
d1e879ec600f9b Miri Korenblit 2025-02-16  307  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
