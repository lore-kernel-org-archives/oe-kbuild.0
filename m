Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8511343D9E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760628630; cv=none; b=sxY56h7tMIy/+PK3urpm72IbWicwdLZsXSxTxhb5DNeVInVJQizxZy4WTIMV0/zq1pcbgFeQeDMkAPFrJpItk7AupuPnilCodkKJaxRLYcwR3q1XiHW+5qj6/hH2ynwsNLDu+/nqUDh3LTh6X+v3eSEKC8bVBpUbDOdirhVz3JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760628630; c=relaxed/simple;
	bh=qHU3+ibDf8QxAUL5LAS1vYW2MBsTo6h+TEd46oPfwDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eLlJF6rV2vht1PpeJenOetj/nsSSLuZmSRI9HrBq9rvJTjZS7Bj6nOaWJk9DdPe0YJq96fzrUeJLrFqa9PyYfnC8ZN+mJWTV8Dr03UxquMpD2oeEfo3Q0P11qm7IXoq74SsEG1+nxVKcX8CVksNojFcAQSkd4dPLNAJglhKJ6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNRwHAcy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNRwHAcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760628629; x=1792164629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qHU3+ibDf8QxAUL5LAS1vYW2MBsTo6h+TEd46oPfwDY=;
  b=QNRwHAcyV1VMfBzurO+67ZS0n7l1vkdUXVoTnEZH/x6UjXX+t4WDrcKf
   Hd1/N7htikux/tIb3VuqcRnpjp+Yt5Ib5eQ+OwrXmCJO+KhVwbFyrt7rF
   gtHlgxbtjgKr+ELrTx7XBwYaQKc64jG0/bgPW8pmOglMaqKfi9+aF2Y9Q
   Ruhha4Aw9CA7pji29h6xKeBYM0FONGsWFIq9Lfa/yY8HDpL+r4rlK+L2U
   fEErHPGQ9I27xWaC8KYq6/CgpLmdbd9UQ729aDe0l8lKIHxLKiu5fXStG
   YtetHRaGSf0m79hReu/CdpgF0Dvwj5ROZF9tfHBEdK4imYSCcMP92xR1Z
   w==;
X-CSE-ConnectionGUID: yAhfMYZxRFq9xRW+siakng==
X-CSE-MsgGUID: ZMcs4RaMRDa4BGWeLKON2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65441386"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="65441386"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 08:30:28 -0700
X-CSE-ConnectionGUID: cqSNQ9B8SAS/GeCBLlPuLA==
X-CSE-MsgGUID: 4InHXvEVTOSyUiXfLPongg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213444462"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2025 08:30:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9PvM-0004zD-38;
	Thu, 16 Oct 2025 15:30:11 +0000
Date: Thu, 16 Oct 2025 23:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/damon/core.c:2050 damos_adjust_quota() error: uninitialized
 symbol 'cached_esz'.
Message-ID: <202510162333.YNUPa5FO-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ea30958b3054f5e488fa0b33c352723f7ab3a2a
commit: a86d695193bfab3f130f9275c275e4e143dcd2e3 mm/damon: add trace event for effective size quota
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20251016 (https://download.01.org/0day-ci/archive/20251016/202510162333.YNUPa5FO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510162333.YNUPa5FO-lkp@intel.com/

smatch warnings:
mm/damon/core.c:2050 damos_adjust_quota() error: uninitialized symbol 'cached_esz'.

vim +/cached_esz +2050 mm/damon/core.c

a86d695193bfab3 SeongJae Park 2025-07-04  2027  
898810e5ca54691 SeongJae Park 2022-10-26  2028  static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
1f366e421c8f695 SeongJae Park 2021-11-05  2029  {
2b8a248d5873343 SeongJae Park 2021-11-05  2030  	struct damos_quota *quota = &s->quota;
898810e5ca54691 SeongJae Park 2022-10-26  2031  	struct damon_target *t;
898810e5ca54691 SeongJae Park 2022-10-26  2032  	struct damon_region *r;
a86d695193bfab3 SeongJae Park 2025-07-04  2033  	unsigned long cumulated_sz, cached_esz;
38683e003153f7a SeongJae Park 2021-11-05  2034  	unsigned int score, max_score = 0;
2b8a248d5873343 SeongJae Park 2021-11-05  2035  
89d347a545a704e SeongJae Park 2024-02-19  2036  	if (!quota->ms && !quota->sz && list_empty(&quota->goals))
898810e5ca54691 SeongJae Park 2022-10-26  2037  		return;
2b8a248d5873343 SeongJae Park 2021-11-05  2038  
2b8a248d5873343 SeongJae Park 2021-11-05  2039  	/* New charge window starts */
2b8a248d5873343 SeongJae Park 2021-11-05  2040  	if (time_after_eq(jiffies, quota->charged_from +
898810e5ca54691 SeongJae Park 2022-10-26  2041  				msecs_to_jiffies(quota->reset_interval))) {
6268eac34ca30af SeongJae Park 2022-01-14  2042  		if (quota->esz && quota->charged_sz >= quota->esz)
6268eac34ca30af SeongJae Park 2022-01-14  2043  			s->stat.qt_exceeds++;
1cd2430300594a2 SeongJae Park 2021-11-05  2044  		quota->total_charged_sz += quota->charged_sz;
2b8a248d5873343 SeongJae Park 2021-11-05  2045  		quota->charged_from = jiffies;
2b8a248d5873343 SeongJae Park 2021-11-05  2046  		quota->charged_sz = 0;
a86d695193bfab3 SeongJae Park 2025-07-04  2047  		if (trace_damos_esz_enabled())
a86d695193bfab3 SeongJae Park 2025-07-04  2048  			cached_esz = quota->esz;
1cd2430300594a2 SeongJae Park 2021-11-05  2049  		damos_set_effective_quota(quota);
a86d695193bfab3 SeongJae Park 2025-07-04 @2050  		if (trace_damos_esz_enabled() && quota->esz != cached_esz)
a86d695193bfab3 SeongJae Park 2025-07-04  2051  			damos_trace_esz(c, s, quota);
2b8a248d5873343 SeongJae Park 2021-11-05  2052  	}
38683e003153f7a SeongJae Park 2021-11-05  2053  
f7d911c39cbbb88 SeongJae Park 2022-03-22  2054  	if (!c->ops.get_scheme_score)
898810e5ca54691 SeongJae Park 2022-10-26  2055  		return;
38683e003153f7a SeongJae Park 2021-11-05  2056  
38683e003153f7a SeongJae Park 2021-11-05  2057  	/* Fill up the score histogram */
304b95847f28520 SeongJae Park 2024-08-25  2058  	memset(c->regions_score_histogram, 0,
304b95847f28520 SeongJae Park 2024-08-25  2059  			sizeof(*c->regions_score_histogram) *
304b95847f28520 SeongJae Park 2024-08-25  2060  			(DAMOS_MAX_SCORE + 1));
38683e003153f7a SeongJae Park 2021-11-05  2061  	damon_for_each_target(t, c) {
38683e003153f7a SeongJae Park 2021-11-05  2062  		damon_for_each_region(r, t) {
38683e003153f7a SeongJae Park 2021-11-05  2063  			if (!__damos_valid_target(r, s))
38683e003153f7a SeongJae Park 2021-11-05  2064  				continue;
898810e5ca54691 SeongJae Park 2022-10-26  2065  			score = c->ops.get_scheme_score(c, t, r, s);
304b95847f28520 SeongJae Park 2024-08-25  2066  			c->regions_score_histogram[score] +=
304b95847f28520 SeongJae Park 2024-08-25  2067  				damon_sz_region(r);
38683e003153f7a SeongJae Park 2021-11-05  2068  			if (score > max_score)
38683e003153f7a SeongJae Park 2021-11-05  2069  				max_score = score;
38683e003153f7a SeongJae Park 2021-11-05  2070  		}
38683e003153f7a SeongJae Park 2021-11-05  2071  	}
38683e003153f7a SeongJae Park 2021-11-05  2072  
38683e003153f7a SeongJae Park 2021-11-05  2073  	/* Set the min score limit */
38683e003153f7a SeongJae Park 2021-11-05  2074  	for (cumulated_sz = 0, score = max_score; ; score--) {
304b95847f28520 SeongJae Park 2024-08-25  2075  		cumulated_sz += c->regions_score_histogram[score];
38683e003153f7a SeongJae Park 2021-11-05  2076  		if (cumulated_sz >= quota->esz || !score)
38683e003153f7a SeongJae Park 2021-11-05  2077  			break;
38683e003153f7a SeongJae Park 2021-11-05  2078  	}
38683e003153f7a SeongJae Park 2021-11-05  2079  	quota->min_score = score;
2b8a248d5873343 SeongJae Park 2021-11-05  2080  }
1f366e421c8f695 SeongJae Park 2021-11-05  2081  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
