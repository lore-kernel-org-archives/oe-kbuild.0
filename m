Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7300D6AA7
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Jul 2025 04:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753072895; cv=none; b=HV8ZMxL/lHg61R1IR2frBPRsvnvHObfRKLc062K0Z3aL+Urn1wvsfSO//YTV0Qsi9gZa0bZUdNi1BlRym4Xa6HR0yiXA4ZD0qe9VkTE68Pv/ni1sUoC8NftOsuuy9dasHDUSM8Zy9lLEkiT6FLOwK1WqwLvBqG7+g9MA5kxkpbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753072895; c=relaxed/simple;
	bh=+OEsq6nLbjECGxWKvLbshviTZJbHKXZCBzA7/zlbtrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSPbJjFbBW/+xTM25u1pITBvgiVYHPADycpgTboAlMC4otRAk1SpsgykBYINSNsp/6gSPcGzPb95baHA0ZZzNZV1R/46DdwhG/qZZb9ezhMWwMHj2Eh0AWNAsNiuP8FLfDi5H2LucuC5ZgNRlSh98zVsx+MCyVcCTTOUFJa2EHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UlpXN5Qj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UlpXN5Qj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753072894; x=1784608894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+OEsq6nLbjECGxWKvLbshviTZJbHKXZCBzA7/zlbtrU=;
  b=UlpXN5QjEi/GWw/p+mFkgg2JpKg/WujIAkm84Mrnnnj6gMUTXSC9mcM5
   DC954qX2C2RvaUfX4unZE+PSOvzfaVNTn72rkF76dFZD1ruvU5B1wdlJ5
   lGZBGAlBuJS8m1xotOuV4X8ZiabuuHaDceI+HbpqFz3hhlQ3rCWVZtVjZ
   9k9/+L4r29XypTWt1MfaDy+EI/snRXjs0lNLPYLlnQIpGKZNbYO7ZGgYf
   p6aCQqulYrbnTZuMNbo5si3lyd/YQpKqx0EMaewZkj8YXIwyrPuBjO7EK
   Y7GUoTaXvzEd3/R3ogANX9ZZrxuoGEs1MpKWQ+2Knm6BmA7VGH9ezcySl
   g==;
X-CSE-ConnectionGUID: AoEnICcZTyapA+cAhX8UyQ==
X-CSE-MsgGUID: RPWsdNgXTLKtlZyNWIQAMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55158906"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="55158906"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 21:41:33 -0700
X-CSE-ConnectionGUID: QqS/snZNQBG7znxqg7Vduw==
X-CSE-MsgGUID: YMKr8o/CSraoEEK6izEJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="189708041"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jul 2025 21:41:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udiLB-000GTh-1Z;
	Mon, 21 Jul 2025 04:41:29 +0000
Date: Mon, 21 Jul 2025 12:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pkshih-rtw:rtw-next 6/23] net/mac80211/mlme.c:8558
 ieee80211_latest_active_link_conn_timeout() error: uninitialized symbol
 'latest_timeout'.
Message-ID: <202507211228.LTTltR0s-lkp@intel.com>
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
TO: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://github.com/pkshih/rtw rtw-next
head:   754fe848b3b297fc85ec24cd959bad22b6df8cb8
commit: 1bc892d76a6f8778945eaa44af4e7f95faf5fbd4 [6/23] wifi: mac80211: extend connection monitoring for MLO
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250720 (https://download.01.org/0day-ci/archive/20250721/202507211228.LTTltR0s-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507211228.LTTltR0s-lkp@intel.com/

New smatch warnings:
net/mac80211/mlme.c:8558 ieee80211_latest_active_link_conn_timeout() error: uninitialized symbol 'latest_timeout'.

Old smatch warnings:
net/mac80211/mlme.c:8562 ieee80211_latest_active_link_conn_timeout() error: uninitialized symbol 'latest_timeout'.

vim +/latest_timeout +8558 net/mac80211/mlme.c

75e296e9b22aef Johannes Berg         2020-01-31  8520  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8521  static unsigned long
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8522  ieee80211_latest_active_link_conn_timeout(struct ieee80211_sub_if_data *sdata)
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8523  {
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8524  	unsigned long latest_timeout;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8525  	unsigned int link_id;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8526  	struct sta_info *sta;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8527  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8528  	guard(rcu)();
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8529  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8530  	sta = sta_info_get(sdata, sdata->vif.cfg.ap_addr);
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8531  	if (!sta)
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8532  		return 0;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8533  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8534  	for (link_id = 0; link_id < ARRAY_SIZE(sta->link);
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8535  	     link_id++) {
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8536  		struct link_sta_info *link_sta;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8537  		unsigned long timeout;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8538  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8539  		link_sta = rcu_dereference(sta->link[link_id]);
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8540  		if (!link_sta)
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8541  			continue;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8542  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8543  		timeout = link_sta->status_stats.last_ack;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8544  		if (time_before(timeout, link_sta->rx_stats.last_rx))
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8545  			timeout = link_sta->rx_stats.last_rx;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8546  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8547  		timeout += IEEE80211_CONNECTION_IDLE_TIME;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8548  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8549  		/*
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8550  		 * latest_timeout holds the timeout of the link
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8551  		 * that will expire last among all links in an
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8552  		 * non-AP MLD STA. This ensures that the connection
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8553  		 * monitor timer is only reset if at least one link
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8554  		 * is still active, and it is scheduled to fire at
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8555  		 * the latest possible timeout.
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8556  		 */
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8557  		if (time_is_after_jiffies(timeout) &&
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18 @8558  		    time_after(timeout, latest_timeout))
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8559  			latest_timeout = timeout;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8560  	}
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8561  
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8562  	return latest_timeout;
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8563  }
1bc892d76a6f87 Maharaja Kennadyrajan 2025-07-18  8564  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
