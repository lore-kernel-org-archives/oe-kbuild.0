Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF821632CA
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733984326; cv=none; b=PcGTsWyJqztTlYxYxNFaYJa0OzwCOkTT5EDe24cFy6dledA1mTZotuofqt+o8iRCEqP8m9kO+z4y7mJAQsql2FDR3R2LBmLwfjJ4QDaU36K2OMsp7AQb51UJURbshfbc9r6tBlcwwiGsBpnYMSy0dnTMQyHEH14w/LYOOadS5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733984326; c=relaxed/simple;
	bh=zZtnLSn56nzwU17MTVsy+z2/GGG6JQnTLXmizFzHx84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIFec3LJNGKptMJfnkR9Esv4Txd7FmNsoNdEflJPxMzfmANwle/rKQbCx9FujRfTJBwq8gRauuVlExcoEM1UJkWcPlg6s5t3yAx7p+q8eWPUikUW50MB7wmF3OONt7QJ6ilWBxvM6OjMhSl6RoYeyuSEpDPnioaEY7v+PovSMd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCW1tB7S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCW1tB7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733984324; x=1765520324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zZtnLSn56nzwU17MTVsy+z2/GGG6JQnTLXmizFzHx84=;
  b=FCW1tB7SogdbKbrpJzY3kxn759qUYIoD+6bQB8J0F0CV/Vk7p7VgDu+Q
   Tul4IGZSFspbwnOg+BS/PWqDGMqNyU4l7QxEu5ITAXrkA9hl8XMbyP93i
   fWh/fTni1hT4gXwxNLsIR5qOnMQLkH2ha3Kw1RP96S06sHYPFS7UGimsp
   92WFiyo4DbZko1zxdq/4FAWRL1kGEnA+KsPrIFvwX/vY+ccxssSUEAcWW
   RsG2CnPFkPxQANIem8kZqX3xKr/0KJAMOowpW6PymLUcEGpOMtLooXg0r
   B5M6N3Ksz/r03MfjgyRYRvahKzy9qGcikJAFikFj//RtADvTNxBWIfgwS
   w==;
X-CSE-ConnectionGUID: +JgHa6wxRzyd46J0I+SzMg==
X-CSE-MsgGUID: NIjXDpW8TVWtIVX/OZ2Jvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="21976374"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="21976374"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 22:18:41 -0800
X-CSE-ConnectionGUID: vG4maxUlQ0Wn89NWNHNO4w==
X-CSE-MsgGUID: uP505H4IQiSewx3tQad7ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101219365"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2024 22:18:38 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLcWy-0007Uk-01;
	Thu, 12 Dec 2024 06:18:36 +0000
Date: Thu, 12 Dec 2024 14:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/mac80211/mlme.c:5107:19-20: WARNING opportunity for max()
Message-ID: <202412121423.mY5Woh8k-lkp@intel.com>
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
CC: Ilan Peer <ilan.peer@intel.com>
CC: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: 310c8387c63830bc375827242e0f9fa689f82e21 wifi: mac80211: clean up connection process
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-053-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121423.mY5Woh8k-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412121423.mY5Woh8k-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/mlme.c:5107:19-20: WARNING opportunity for max()

vim +5107 net/mac80211/mlme.c

bee7f58699a406 net/mac80211/mlme.c          Johannes Berg 2013-02-07  5098  
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5099  static void
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5100  ieee80211_determine_our_sta_mode_auth(struct ieee80211_sub_if_data *sdata,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5101  				      struct ieee80211_supported_band *sband,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5102  				      struct cfg80211_auth_request *req,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5103  				      bool wmm_used,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5104  				      struct ieee80211_conn_settings *conn)
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5105  {
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5106  	ieee80211_determine_our_sta_mode(sdata, sband, NULL, wmm_used,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29 @5107  					 req->link_id > 0 ? req->link_id : 0,
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5108  					 conn);
310c8387c63830 net/mac80211/mlme.c          Johannes Berg 2024-01-29  5109  }
f0706e828e96d0 net/mac80211/ieee80211_sta.c Jiri Benc     2007-05-05  5110  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
