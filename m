Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD5CF9E8
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 08:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774168442; cv=none; b=YbgAAOyCWo3lPsOKQXDYnEX/lCEH45ZBF9no4AlMu2txAIcrqcFyQbnsoOdldsoVi0Nkh7EDJL/wTtPxyzqWlsSfbKqPFGp8SWzFsz+Dx6DD/1C4vRM0d9UZH+Ojy2mWKPHPuAcvoC9Ufbx2PpkjwvJh9NcrAwWzpdBDg6XsKwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774168442; c=relaxed/simple;
	bh=u11DuD6tvPYSkgE2AuIL6Hx2E16EfaSCwiRNq5kYH9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DhbgLVIGBfSabbjJb0EwNEpj8xELK9hOQ2E98v6xU9v2aDgKTC968BEGkwwtbPEThz/KiqnbPUk9Y+2slZ5KC6qg2Bd8V2tK6e4EGFl62NwFqEc1YjuvlPqriYzXhgp/ypXeGmSQW6T9JjEaZN3Bs5g5bWc/pUgkqTC4U2eGZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckQAYiEn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckQAYiEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774168440; x=1805704440;
  h=date:from:to:cc:subject:message-id;
  bh=u11DuD6tvPYSkgE2AuIL6Hx2E16EfaSCwiRNq5kYH9I=;
  b=ckQAYiEnxO4dWhd8xwELfP9OH6B9I/W62N5k01z6xfaigDlEnCJh3WFg
   FonRXNqZgWWpmV8CMie0li0wxqQ2YND54VeK4B/zOeNg+5Hcb0oW6HfIt
   r1mB13yjRsCwC+k/fgTZj0sVkxCckveDbcDq1CrSirlCc3OFRIgUj/pYj
   igqoIrFPns07mpu9mfcBrIqvpYffiCinHMJesP+cuFFCx9VA4D8F6xoCw
   5VLDcOX06W3oVbSh+Yss1puekx18xkoQK3zDJkrRpqijxlg64Sa303isY
   QrsBIqO20nJxzvqJTQEOXQQk9AqQ6p6OAO+Jwterb7xnRi7dGJT7aTv88
   g==;
X-CSE-ConnectionGUID: dT/XBvPRQiC6U4ifnqdDiQ==
X-CSE-MsgGUID: RwqeRWEVSvuIQQOG+bkk8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="85825106"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="85825106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 01:33:59 -0700
X-CSE-ConnectionGUID: fn/W4JwPQWm8TkbUHe7W6w==
X-CSE-MsgGUID: 5rZd5lgmSymcp1p2iNkZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="223940552"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Mar 2026 01:33:58 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4EFv-000000001s5-0gSp;
	Sun, 22 Mar 2026 08:33:55 +0000
Date: Sun, 22 Mar 2026 16:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android15-6.6 0/1]
 net/mac80211/iface.c:221:2-8: preceding lock on line 217
Message-ID: <202603221605.SMCQFTqf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   adaba3e91947a078e89f9990010e3adc2aafce7b
commit: ad4a84daf6f812ec8b390b7c95310ef6eb419f08 [0/1] wifi: mac80211: reject address change while connecting
:::::: branch date: 26 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-104-20260322 (https://download.01.org/0day-ci/archive/20260322/202603221605.SMCQFTqf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603221605.SMCQFTqf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/iface.c:221:2-8: preceding lock on line 217
   net/mac80211/iface.c:251:3-9: preceding lock on line 217

vim +221 net/mac80211/iface.c

478622e81c735e Helmut Schaa    2012-11-27  202  
3c06e91b40db6d James Prestwood 2022-08-26  203  static int ieee80211_can_powered_addr_change(struct ieee80211_sub_if_data *sdata)
3c06e91b40db6d James Prestwood 2022-08-26  204  {
3c06e91b40db6d James Prestwood 2022-08-26  205  	struct ieee80211_roc_work *roc;
3c06e91b40db6d James Prestwood 2022-08-26  206  	struct ieee80211_local *local = sdata->local;
3c06e91b40db6d James Prestwood 2022-08-26  207  	struct ieee80211_sub_if_data *scan_sdata;
3c06e91b40db6d James Prestwood 2022-08-26  208  	int ret = 0;
3c06e91b40db6d James Prestwood 2022-08-26  209  
3c06e91b40db6d James Prestwood 2022-08-26  210  	/* To be the most flexible here we want to only limit changing the
3c06e91b40db6d James Prestwood 2022-08-26  211  	 * address if the specific interface is doing offchannel work or
3c06e91b40db6d James Prestwood 2022-08-26  212  	 * scanning.
3c06e91b40db6d James Prestwood 2022-08-26  213  	 */
3c06e91b40db6d James Prestwood 2022-08-26  214  	if (netif_carrier_ok(sdata->dev))
3c06e91b40db6d James Prestwood 2022-08-26  215  		return -EBUSY;
3c06e91b40db6d James Prestwood 2022-08-26  216  
3c06e91b40db6d James Prestwood 2022-08-26 @217  	mutex_lock(&local->mtx);
3c06e91b40db6d James Prestwood 2022-08-26  218  
ad4a84daf6f812 Johannes Berg   2025-11-05  219  	/* if any stations are set known (so they know this vif too), reject */
ad4a84daf6f812 Johannes Berg   2025-11-05  220  	if (sta_info_get_by_idx(sdata, 0))
ad4a84daf6f812 Johannes Berg   2025-11-05 @221  		return -EBUSY;
ad4a84daf6f812 Johannes Berg   2025-11-05  222  
3c06e91b40db6d James Prestwood 2022-08-26  223  	/* First check no ROC work is happening on this iface */
3c06e91b40db6d James Prestwood 2022-08-26  224  	list_for_each_entry(roc, &local->roc_list, list) {
3c06e91b40db6d James Prestwood 2022-08-26  225  		if (roc->sdata != sdata)
3c06e91b40db6d James Prestwood 2022-08-26  226  			continue;
3c06e91b40db6d James Prestwood 2022-08-26  227  
3c06e91b40db6d James Prestwood 2022-08-26  228  		if (roc->started) {
3c06e91b40db6d James Prestwood 2022-08-26  229  			ret = -EBUSY;
3c06e91b40db6d James Prestwood 2022-08-26  230  			goto unlock;
3c06e91b40db6d James Prestwood 2022-08-26  231  		}
3c06e91b40db6d James Prestwood 2022-08-26  232  	}
3c06e91b40db6d James Prestwood 2022-08-26  233  
3c06e91b40db6d James Prestwood 2022-08-26  234  	/* And if this iface is scanning */
3c06e91b40db6d James Prestwood 2022-08-26  235  	if (local->scanning) {
3c06e91b40db6d James Prestwood 2022-08-26  236  		scan_sdata = rcu_dereference_protected(local->scan_sdata,
3c06e91b40db6d James Prestwood 2022-08-26  237  						       lockdep_is_held(&local->mtx));
3c06e91b40db6d James Prestwood 2022-08-26  238  		if (sdata == scan_sdata)
3c06e91b40db6d James Prestwood 2022-08-26  239  			ret = -EBUSY;
3c06e91b40db6d James Prestwood 2022-08-26  240  	}
3c06e91b40db6d James Prestwood 2022-08-26  241  
ad4a84daf6f812 Johannes Berg   2025-11-05  242  	/*
ad4a84daf6f812 Johannes Berg   2025-11-05  243  	 * More interface types could be added here but changing the
ad4a84daf6f812 Johannes Berg   2025-11-05  244  	 * address while powered makes the most sense in client modes.
ad4a84daf6f812 Johannes Berg   2025-11-05  245  	 */
3c06e91b40db6d James Prestwood 2022-08-26  246  	switch (sdata->vif.type) {
3c06e91b40db6d James Prestwood 2022-08-26  247  	case NL80211_IFTYPE_STATION:
3c06e91b40db6d James Prestwood 2022-08-26  248  	case NL80211_IFTYPE_P2P_CLIENT:
ad4a84daf6f812 Johannes Berg   2025-11-05  249  		/* refuse while connecting */
ad4a84daf6f812 Johannes Berg   2025-11-05  250  		if (sdata->u.mgd.auth_data || sdata->u.mgd.assoc_data)
ad4a84daf6f812 Johannes Berg   2025-11-05  251  			return -EBUSY;
3c06e91b40db6d James Prestwood 2022-08-26  252  		break;
3c06e91b40db6d James Prestwood 2022-08-26  253  	default:
ceb3d688f92231 Dan Carpenter   2022-09-12  254  		ret = -EOPNOTSUPP;
3c06e91b40db6d James Prestwood 2022-08-26  255  	}
3c06e91b40db6d James Prestwood 2022-08-26  256  
3c06e91b40db6d James Prestwood 2022-08-26  257  unlock:
3c06e91b40db6d James Prestwood 2022-08-26  258  	mutex_unlock(&local->mtx);
3c06e91b40db6d James Prestwood 2022-08-26  259  	return ret;
3c06e91b40db6d James Prestwood 2022-08-26  260  }
3c06e91b40db6d James Prestwood 2022-08-26  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
