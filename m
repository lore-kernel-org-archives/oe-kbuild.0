Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA9B182BF
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="df/9C7us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700053325; x=1731589325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/LUtzhZ5UwfIXQRAdKK9SZ0BEod4HaTuPgfAPxbMQeY=;
  b=df/9C7usHG8ZHRvK+mDc4i60PDVPyHk26LUmsZw1kY9G2FqPMjRRyBks
   x0g6W5ZQzIUuxXWuaErh3GOmnPRIlyNSA/6+A18EQUutXIDwFVlnG+NCK
   Xspcd5RujGNbrReH8iQKh8F56GDwO7wSdrKtxxaMd+5oslvNYWc+Ndrmo
   wy5es709ZC20YfGcGJRvBu31Ez5qQfpOB9hh+mlaxSHvhd8Kcn8CqzyHo
   sy7xhZ4QPqNDMDSNdt8CqSIZ11x7Gs25sgd+AmR05CSl5+m+gPXIcrbx0
   m2gr5D2G4l8EEOh5mmAp7y2/xyFgOjQl7j/MQIkd+zptnaftMBBfEoWlU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="375910620"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="375910620"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="882391934"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="882391934"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2023 05:02:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3FWr-0000Ky-07;
	Wed, 15 Nov 2023 13:02:01 +0000
Date: Wed, 15 Nov 2023 21:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/mac80211/ieee80211_i.h:1193:42: sparse: sparse: self-comparison
 always evaluates to false
Message-ID: <202311152057.obCE8EGk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/mac80211/ieee80211_i.h:1193:42: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Aloka Dixit <quic_alokad@quicinc.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: John Crispin <john@phrozen.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: bd54f3c29077f23dad92ef82a78061b40be30c65 wifi: mac80211: generate EMA beacons in AP mode
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-062-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152057.obCE8EGk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152057.obCE8EGk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311152057.obCE8EGk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/mac80211/cfg.c: note: in included file:
>> net/mac80211/ieee80211_i.h:1193:42: sparse: sparse: self-comparison always evaluates to false
   net/mac80211/ieee80211_i.h:1196:17: sparse: sparse: self-comparison always evaluates to false
>> net/mac80211/ieee80211_i.h:1193:42: sparse: sparse: self-comparison always evaluates to false
   net/mac80211/ieee80211_i.h:1196:17: sparse: sparse: self-comparison always evaluates to false
>> net/mac80211/ieee80211_i.h:1193:42: sparse: sparse: self-comparison always evaluates to false
   net/mac80211/ieee80211_i.h:1196:17: sparse: sparse: self-comparison always evaluates to false

vim +1193 net/mac80211/ieee80211_i.h

438b61b77082e7 Simon Wunderlich 2013-07-08  1187  
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1188  static inline int
bd54f3c29077f2 Aloka Dixit      2022-12-05  1189  ieee80211_get_mbssid_beacon_len(struct cfg80211_mbssid_elems *elems, u8 i)
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1190  {
bd54f3c29077f2 Aloka Dixit      2022-12-05  1191  	int len = 0;
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1192  
bd54f3c29077f2 Aloka Dixit      2022-12-05 @1193  	if (!elems || !elems->cnt || i > elems->cnt)
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1194  		return 0;
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1195  
bd54f3c29077f2 Aloka Dixit      2022-12-05  1196  	if (i < elems->cnt)
bd54f3c29077f2 Aloka Dixit      2022-12-05  1197  		return elems->elem[i].len;
bd54f3c29077f2 Aloka Dixit      2022-12-05  1198  
bd54f3c29077f2 Aloka Dixit      2022-12-05  1199  	/* i == elems->cnt, calculate total length of all MBSSID elements */
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1200  	for (i = 0; i < elems->cnt; i++)
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1201  		len += elems->elem[i].len;
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1202  
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1203  	return len;
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1204  }
2b3171c6fe0af2 Lorenzo Bianconi 2022-02-24  1205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
