Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604C43715B
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 20:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRDsYOT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700510573; x=1732046573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4V06uGT5i1PrijOnFT2yafh14HnvvR5h7kth25/VqE0=;
  b=YRDsYOT9AT4WV4bahPNDNO4GrAojN4mElymgbYD/iY/3+XzQJczOqH6Y
   ObOzttSQ1hc44daBDMBlyWaOzzAO5BUCKlG+fF+H6cJOeM0Ie5UB3zteM
   cmypasIj+sgzM3MHe9E382hniMv8cuEvbzHKSCqzEJwirkFHpujFNVJT1
   5S4kTEXyeY2kVmD+3+LXirhkL65ZfKsgpTv1R2TbTh6gneDpXHDhGgnVd
   2F0Caz0qkaE9HIokgHJOtOsZt0V0PnAKHIqXpbIMNsjMPhyafHw/ICNgN
   6uqYFb2tE79GhJj1cqsjxWDvHCZSplwUgyH5sMjzLsblnLNGA8vuuRglq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4886090"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="4886090"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 12:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013685157"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="1013685157"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 20 Nov 2023 12:02:46 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5ATk-0006pK-2q;
	Mon, 20 Nov 2023 20:02:44 +0000
Date: Tue, 21 Nov 2023 04:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sj:damon/next 32/42] mm/damon/core.c:1150
 damos_set_effective_quota() error: uninitialized symbol 'esz'.
Message-ID: <202311210420.URG3QSAS-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   54ffd8ae08121d8cbce1874fe46970cce643a2c7
commit: 28cef0e565adbb4175f12ffffce9d0680979de60 [32/42] mm/damon/core: implement goal-oriented feedback-driven quota auto-tuning
:::::: branch date: 24 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-161-20231121 (https://download.01.org/0day-ci/archive/20231121/202311210420.URG3QSAS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311210420.URG3QSAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311210420.URG3QSAS-lkp@intel.com/

smatch warnings:
mm/damon/core.c:1150 damos_set_effective_quota() error: uninitialized symbol 'esz'.

vim +/esz +1150 mm/damon/core.c

28cef0e565adbb SeongJae Park 2023-10-27  1125  
28cef0e565adbb SeongJae Park 2023-10-27  1126  /* Shouldn't be called if quota->ms, quota->sz, and quota->get_score unset */
1cd2430300594a SeongJae Park 2021-11-05  1127  static void damos_set_effective_quota(struct damos_quota *quota)
1cd2430300594a SeongJae Park 2021-11-05  1128  {
1cd2430300594a SeongJae Park 2021-11-05  1129  	unsigned long throughput;
1cd2430300594a SeongJae Park 2021-11-05  1130  	unsigned long esz;
1cd2430300594a SeongJae Park 2021-11-05  1131  
28cef0e565adbb SeongJae Park 2023-10-27  1132  	if (!quota->ms && !quota->get_score) {
1cd2430300594a SeongJae Park 2021-11-05  1133  		quota->esz = quota->sz;
1cd2430300594a SeongJae Park 2021-11-05  1134  		return;
1cd2430300594a SeongJae Park 2021-11-05  1135  	}
1cd2430300594a SeongJae Park 2021-11-05  1136  
28cef0e565adbb SeongJae Park 2023-10-27  1137  	if (quota->get_score) {
28cef0e565adbb SeongJae Park 2023-10-27  1138  		quota->esz_bp = damon_feed_loop_next_input(
28cef0e565adbb SeongJae Park 2023-10-27  1139  				max(quota->esz_bp, 10000UL),
28cef0e565adbb SeongJae Park 2023-10-27  1140  				quota->get_score(quota->get_score_arg));
28cef0e565adbb SeongJae Park 2023-10-27  1141  		esz = quota->esz_bp / 10000;
28cef0e565adbb SeongJae Park 2023-10-27  1142  	}
28cef0e565adbb SeongJae Park 2023-10-27  1143  
28cef0e565adbb SeongJae Park 2023-10-27  1144  	if (quota->ms) {
1cd2430300594a SeongJae Park 2021-11-05  1145  		if (quota->total_charged_ns)
1cd2430300594a SeongJae Park 2021-11-05  1146  			throughput = quota->total_charged_sz * 1000000 /
1cd2430300594a SeongJae Park 2021-11-05  1147  				quota->total_charged_ns;
1cd2430300594a SeongJae Park 2021-11-05  1148  		else
1cd2430300594a SeongJae Park 2021-11-05  1149  			throughput = PAGE_SIZE * 1024;
28cef0e565adbb SeongJae Park 2023-10-27 @1150  		esz = min(throughput * quota->ms, esz);
28cef0e565adbb SeongJae Park 2023-10-27  1151  	}
1cd2430300594a SeongJae Park 2021-11-05  1152  
1cd2430300594a SeongJae Park 2021-11-05  1153  	if (quota->sz && quota->sz < esz)
1cd2430300594a SeongJae Park 2021-11-05  1154  		esz = quota->sz;
28cef0e565adbb SeongJae Park 2023-10-27  1155  
1cd2430300594a SeongJae Park 2021-11-05  1156  	quota->esz = esz;
1cd2430300594a SeongJae Park 2021-11-05  1157  }
1cd2430300594a SeongJae Park 2021-11-05  1158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
