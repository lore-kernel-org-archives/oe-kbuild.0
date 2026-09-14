Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2560B282F14
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400726; cv=none; b=XdsrgZT4M6xRQOLlilfinBumyxCV93knMtMmUYmAwDqvsm+wrDFGPBN3+SwQmpVeQysnPegnDx8DSGm2jxzAFMRAra7Cmy9grEi7v+dC0uYZ9YXm2SN4VZeF4dCIYY074vBhidmYf6Ez8e4dLN0onPQM2aHf6quwvJWwqjzHiX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400726; c=relaxed/simple;
	bh=yrOtuhFnLNnZ6rzmjRer49Q1Y5FuUwWmtFoyyoIAlkc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ojOVl/7O1pVpu57gUzUxD84Dea0h7ya5KfAQ1OGmTEpC/2WH+Kmv0GF3vTlUrhgsqvDW/CNyIhozCHctQGU+wzuypqHrPlm4AngDWy9pH7oJYss7Yme4AXa5GN3iL33pPOKoZWj/MMXIrB82lNnQr8JibNVYb5vVxhzqMIAiXkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2OlXVcJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2OlXVcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789400725; x=1820936725;
  h=date:from:to:cc:subject:message-id;
  bh=yrOtuhFnLNnZ6rzmjRer49Q1Y5FuUwWmtFoyyoIAlkc=;
  b=a2OlXVcJwWEsg2of+c7rBh4LWCmyYfBSBp/LS14lyeebdMvrWwUIM79o
   OHlfm2gEyq3ODUKNdLNJrJwTidkG2dvlK8htpz3fvvExdwDxalk39wzAa
   NdXYu50F5J/5OTBQzPocIZJcgzV7Hm78Ose/Dq9TDXaEHVYjRrSheg26E
   TqkA0bfpIo+tpNhrYXvn23flDwKDxIZ0bri569IymeOL8NKgIsRIWYrY1
   e4Byuys2NVmScdu2sK/CoXVNChpNtsHOVbi9Z8MPc1+65HH38NCz3M2em
   21QMJlfiPmNpgDgfXPBgM2j9ncF8lj+yIoFuGgJD8pHT/oRNVmGQ6kOLq
   w==;
X-CSE-ConnectionGUID: 9aQ8bXxHSf+Z8DlxxxAbeQ==
X-CSE-MsgGUID: Q62CQ7CsRy6jA5RV5whIrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100417336"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100417336"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 08:45:25 -0700
X-CSE-ConnectionGUID: 1Q5vqSiaTNqnG8+EgPBwBg==
X-CSE-MsgGUID: GH+emdG+QleEwZrFY1au3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273194858"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 Sep 2026 08:45:23 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x68rx-000000000D9-1yU0;
	Mon, 14 Sep 2026 15:45:21 +0000
Date: Mon, 14 Sep 2026 17:44:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/realtek/rtw89/debug.c:4344
 rtw89_debug_priv_beacon_info_get() error: buffer overflow 'drift' 32 <= 254
Message-ID: <202609141725.U9aVqhyr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Kuan-Chung Chen" <damon.chen@realtek.com>
CC: "Ping-Ke Shih" <pkshih@realtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: 194b7ce982471468569299991b110049c4617163 wifi: rtw89: debug: add beacon_info debugfs
date:   1 year, 1 month ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 1 month ago
config: microblaze-randconfig-r073-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141725.U9aVqhyr-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 194b7ce98247 ("wifi: rtw89: debug: add beacon_info debugfs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609141725.U9aVqhyr-lkp@intel.com/

smatch warnings:
drivers/net/wireless/realtek/rtw89/debug.c:4344 rtw89_debug_priv_beacon_info_get() error: buffer overflow 'drift' 32 <= 254

vim +/drift +4344 drivers/net/wireless/realtek/rtw89/debug.c

d371c3aa35fd2d Ping-Ke Shih    2023-11-22  4301  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4302  static ssize_t
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4303  rtw89_debug_priv_beacon_info_get(struct rtw89_dev *rtwdev,
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4304  				 struct rtw89_debugfs_priv *debugfs_priv,
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4305  				 char *buf, size_t bufsz)
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4306  {
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4307  	struct rtw89_pkt_stat *pkt_stat = &rtwdev->phystat.last_pkt_stat;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4308  	struct rtw89_beacon_track_info *bcn_track = &rtwdev->bcn_track;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4309  	struct rtw89_beacon_stat *bcn_stat = &rtwdev->phystat.bcn_stat;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4310  	struct rtw89_beacon_dist *bcn_dist = &bcn_stat->bcn_dist;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4311  	u16 upper, lower = bcn_stat->tbtt_tu_min;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4312  	char *p = buf, *end = buf + bufsz;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4313  	u16 *drift = bcn_stat->drift;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4314  	u8 bcn_num = bcn_stat->num;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4315  	u8 count;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4316  	u8 i;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4317  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4318  	p += scnprintf(p, end - p, "[Beacon info]\n");
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4319  	p += scnprintf(p, end - p, "count: %u\n", pkt_stat->beacon_nr);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4320  	p += scnprintf(p, end - p, "interval: %u\n", bcn_track->beacon_int);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4321  	p += scnprintf(p, end - p, "dtim: %u\n", bcn_track->dtim);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4322  	p += scnprintf(p, end - p, "raw rssi: %lu\n",
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4323  		       ewma_rssi_read(&rtwdev->phystat.bcn_rssi));
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4324  	p += scnprintf(p, end - p, "hw rate: %u\n", pkt_stat->beacon_rate);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4325  	p += scnprintf(p, end - p, "length: %u\n", pkt_stat->beacon_len);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4326  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4327  	p += scnprintf(p, end - p, "\n[Distribution]\n");
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4328  	p += scnprintf(p, end - p, "tbtt\n");
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4329  	for (i = 0; i < RTW89_BCN_TRACK_MAX_BIN_NUM; i++) {
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4330  		upper = lower + RTW89_BCN_TRACK_BIN_WIDTH - 1;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4331  		if (i == RTW89_BCN_TRACK_MAX_BIN_NUM - 1)
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4332  			upper = max(upper, bcn_stat->tbtt_tu_max);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4333  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4334  		p += scnprintf(p, end - p, "%02u - %02u: %u\n",
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4335  			       lower, upper, bcn_dist->bins[i]);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4336  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4337  		lower = upper + 1;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4338  	}
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4339  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4340  	p += scnprintf(p, end - p, "\ndrift\n");
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4341  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4342  	for (i = 0; i < bcn_num; i += count) {
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4343  		count = 1;
194b7ce9824714 Kuan-Chung Chen 2025-08-11 @4344  		while (i + count < bcn_num && drift[i] == drift[i + count])
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4345  			count++;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4346  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4347  		p += scnprintf(p, end - p, "%u: %u\n", drift[i], count);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4348  	}
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4349  	p += scnprintf(p, end - p, "\nlower bound: %u\n", bcn_dist->lower_bound);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4350  	p += scnprintf(p, end - p, "upper bound: %u\n", bcn_dist->upper_bound);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4351  	p += scnprintf(p, end - p, "outlier count: %u\n", bcn_dist->outlier_count);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4352  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4353  	p += scnprintf(p, end - p, "\n[Tracking]\n");
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4354  	p += scnprintf(p, end - p, "tbtt offset: %u\n", bcn_track->tbtt_offset);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4355  	p += scnprintf(p, end - p, "bcn timeout: %u\n", bcn_track->bcn_timeout);
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4356  
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4357  	return p - buf;
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4358  }
194b7ce9824714 Kuan-Chung Chen 2025-08-11  4359  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
