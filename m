Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF2563BA
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXRL97FK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702877625; x=1734413625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXPCoPpSF6KOu/tDeu9zxzNQxKlvBn2vl/ygXrO4jYs=;
  b=VXRL97FK0W8+OwGXDqfcB8RcQ+RPIvmXssozbKDxr7p+ztwflkj+nNze
   CJv8Jr2sW4unqxJdM7Gwy+TJGKwyuKNJZSTnWf1f6l71/jVz6FvbspEqq
   ca9HM3kMOGr26zEB/KEj64Zc2RQmwlMqOFO9t6FaPq1apX8jzEIfSWH3+
   OpG7mKbugQw2Pz8zZ9i7oO6lnP9cWLf5eEj0g4XmJzK2lPBQblYq2s5yk
   lTIp4pivY6IEdrSbqxmkBSw4kOX8B1Yln7D7e8Ifx729O2eMBJ5msn7U+
   yprVWAUBKHfRuISNp1tUePgOTtBdfgk9cmxLg9Qv3y/QbNnkV6/GERcb+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2547358"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="2547358"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 21:33:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="845820516"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="845820516"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2023 21:33:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF6Fr-0003nx-2W;
	Mon, 18 Dec 2023 05:33:37 +0000
Date: Mon, 18 Dec 2023 13:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: htmldocs: ./include/net/cfg80211.h:3952: warning: Excess struct
 member 'peers' description in 'cfg80211_pmsr_request'
Message-ID: <202312181321.GSbUL5QU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "kernel-doc warning due to __counted_by"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Johannes Berg <johannes.berg@intel.com>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ceb6a6f023fd3e8b07761ed900352ef574010bcb
commit: 342bc7c9e877847d602c4a67c3135051df07cc4d wifi: cfg80211: Annotate struct cfg80211_pmsr_request with __counted_by
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
reproduce: (https://download.01.org/0day-ci/archive/20231218/202312181321.GSbUL5QU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312181321.GSbUL5QU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/net/cfg80211.h:3952: warning: Excess struct member 'peers' description in 'cfg80211_pmsr_request'

vim +3952 ./include/net/cfg80211.h

9bb7e0f24e7e7d Johannes Berg 2018-09-10  3921  
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3922  /**
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3923   * struct cfg80211_pmsr_request - peer measurement request
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3924   * @cookie: cookie, set by cfg80211
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3925   * @nl_portid: netlink portid - used by cfg80211
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3926   * @drv_data: driver data for this request, if required for aborting,
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3927   *	not otherwise freed or anything by cfg80211
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3928   * @mac_addr: MAC address used for (randomised) request
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3929   * @mac_addr_mask: MAC address mask used for randomisation, bits that
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3930   *	are 0 in the mask should be randomised, bits that are 1 should
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3931   *	be taken from the @mac_addr
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3932   * @list: used by cfg80211 to hold on to the request
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3933   * @timeout: timeout (in milliseconds) for the whole operation, if
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3934   *	zero it means there's no timeout
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3935   * @n_peers: number of peers to do measurements with
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3936   * @peers: per-peer measurement request data
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3937   */
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3938  struct cfg80211_pmsr_request {
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3939  	u64 cookie;
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3940  	void *drv_data;
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3941  	u32 n_peers;
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3942  	u32 nl_portid;
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3943  
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3944  	u32 timeout;
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3945  
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3946  	u8 mac_addr[ETH_ALEN] __aligned(2);
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3947  	u8 mac_addr_mask[ETH_ALEN] __aligned(2);
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3948  
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3949  	struct list_head list;
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3950  
342bc7c9e87784 Kees Cook     2023-08-17  3951  	struct cfg80211_pmsr_request_peer peers[] __counted_by(n_peers);
9bb7e0f24e7e7d Johannes Berg 2018-09-10 @3952  };
9bb7e0f24e7e7d Johannes Berg 2018-09-10  3953  

:::::: The code at line 3952 was first introduced by commit
:::::: 9bb7e0f24e7e7d00daa1219b14539e2e602649b2 cfg80211: add peer measurement with FTM initiator API

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
