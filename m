Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E9D28A1CB
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Jul 2025 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875043; cv=none; b=HX8EjdXD4w1/P8E8qVIc/tXmDQufoWoi60Gju6hCcSWAzgil1mRFAruV9sdpJYu8aJAHeEu6z062HQoT3nDKX5tpSjVGBrpD+FeRD/fyAaFpMU3VS5xlAGzYvQqL+s3izJLI/L4zLejBzJl3tig2odQxc54pUyUbGYYCk0vm08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875043; c=relaxed/simple;
	bh=mdt7FBdGMpdC1H+iYE6xlkGh6j/z33Qjti/JswfVIRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pr76R3lsus3kLvX9uy22ErOvOpbjZ/ihFs5ITHkWfjVyeOMaVSSN3tE3I2Jkm8niMtHA8gYxE1JE9vRPlSkS2yKd73/QNxvApV3Wy5+BXw1jckVgw32JZ3gNKWVKMZ+J8QsVBa6C5w6v3oFs5xWWXBFk0qRQDBbUIcfAL/viHuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RygILUxU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RygILUxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751875041; x=1783411041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mdt7FBdGMpdC1H+iYE6xlkGh6j/z33Qjti/JswfVIRw=;
  b=RygILUxU2V6GAtmBaRXHYzIuB0WNdky/us8TPjQ3QQ36S0K/IrEybhm8
   pJiurqgON9j7P6oVEwkutOgunY4FpjgXshUrSTavG1BOd6tdg1Hcankkm
   99SdJsGGaUjN2OZuLCK2zuPL0gMWe0P5E3JL9manM0cfQJcX0Yj+c3J3r
   E4CEyiD10XoFDDqNtSZ7POiUooW4vt7EDRQXwIEeuFkhBpZVSEe9QUuI8
   Di0Yvfa9JGGIvOgErEuRottPcNj947WDq9e7eOKpSWjMW//vFK0hRWcGR
   uOKc82C22RyY18cRqW06KCM1ETw14VA6sDyDPMN1vCsddCrou0DFoXlOw
   w==;
X-CSE-ConnectionGUID: tXzh9N9mQwGNjnYaVoiBFQ==
X-CSE-MsgGUID: DVd22lE3S0OwglkJi0oc6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65151076"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="65151076"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 00:57:20 -0700
X-CSE-ConnectionGUID: XueInVxWTkGsuX3qBFxScQ==
X-CSE-MsgGUID: 1nwnppPcQCuyyyHclxZ/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="155625889"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jul 2025 00:57:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYgiz-0000Fh-0z;
	Mon, 07 Jul 2025 07:57:17 +0000
Date: Mon, 7 Jul 2025 15:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 299/305] mm/damon/core.c:2023 damos_trace_esz()
 error: uninitialized symbol 'sidx'.
Message-ID: <202507071516.2lfN4pDL-lkp@intel.com>
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
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   15faa166415229365c95213d236c96d189b0153e
commit: ae4dc5a31d0f5191fe51cd8d4c76c7dd99c15a10 [299/305] mm/damon: add trace event for effective size quota
:::::: branch date: 34 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250706 (https://download.01.org/0day-ci/archive/20250707/202507071516.2lfN4pDL-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507071516.2lfN4pDL-lkp@intel.com/

smatch warnings:
mm/damon/core.c:2023 damos_trace_esz() error: uninitialized symbol 'sidx'.
mm/damon/core.c:2050 damos_adjust_quota() error: uninitialized symbol 'cached_esz'.

vim +/sidx +2023 mm/damon/core.c

1cd2430300594a SeongJae Park 2021-11-05  2013  
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2014  static void damos_trace_esz(struct damon_ctx *c, struct damos *s,
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2015  		struct damos_quota *quota)
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2016  {
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2017  	unsigned int cidx = 0, sidx;
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2018  	struct damos *siter;
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2019  
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2020  	damon_for_each_scheme(siter, c) {
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2021  		if (siter == s)
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2022  			break;
ae4dc5a31d0f51 SeongJae Park 2025-07-04 @2023  		sidx++;
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2024  	}
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2025  	trace_damos_esz(cidx, sidx, quota->esz, true);
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2026  }
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2027  
898810e5ca5469 SeongJae Park 2022-10-26  2028  static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
1f366e421c8f69 SeongJae Park 2021-11-05  2029  {
2b8a248d587334 SeongJae Park 2021-11-05  2030  	struct damos_quota *quota = &s->quota;
898810e5ca5469 SeongJae Park 2022-10-26  2031  	struct damon_target *t;
898810e5ca5469 SeongJae Park 2022-10-26  2032  	struct damon_region *r;
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2033  	unsigned long cumulated_sz, cached_esz;
38683e003153f7 SeongJae Park 2021-11-05  2034  	unsigned int score, max_score = 0;
2b8a248d587334 SeongJae Park 2021-11-05  2035  
89d347a545a704 SeongJae Park 2024-02-19  2036  	if (!quota->ms && !quota->sz && list_empty(&quota->goals))
898810e5ca5469 SeongJae Park 2022-10-26  2037  		return;
2b8a248d587334 SeongJae Park 2021-11-05  2038  
2b8a248d587334 SeongJae Park 2021-11-05  2039  	/* New charge window starts */
2b8a248d587334 SeongJae Park 2021-11-05  2040  	if (time_after_eq(jiffies, quota->charged_from +
898810e5ca5469 SeongJae Park 2022-10-26  2041  				msecs_to_jiffies(quota->reset_interval))) {
6268eac34ca30a SeongJae Park 2022-01-14  2042  		if (quota->esz && quota->charged_sz >= quota->esz)
6268eac34ca30a SeongJae Park 2022-01-14  2043  			s->stat.qt_exceeds++;
1cd2430300594a SeongJae Park 2021-11-05  2044  		quota->total_charged_sz += quota->charged_sz;
2b8a248d587334 SeongJae Park 2021-11-05  2045  		quota->charged_from = jiffies;
2b8a248d587334 SeongJae Park 2021-11-05  2046  		quota->charged_sz = 0;
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2047  		if (trace_damos_esz_enabled())
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2048  			cached_esz = quota->esz;
1cd2430300594a SeongJae Park 2021-11-05  2049  		damos_set_effective_quota(quota);
ae4dc5a31d0f51 SeongJae Park 2025-07-04 @2050  		if (trace_damos_esz_enabled() && quota->esz != cached_esz)
ae4dc5a31d0f51 SeongJae Park 2025-07-04  2051  			damos_trace_esz(c, s, quota);
2b8a248d587334 SeongJae Park 2021-11-05  2052  	}
38683e003153f7 SeongJae Park 2021-11-05  2053  
f7d911c39cbbb8 SeongJae Park 2022-03-22  2054  	if (!c->ops.get_scheme_score)
898810e5ca5469 SeongJae Park 2022-10-26  2055  		return;
38683e003153f7 SeongJae Park 2021-11-05  2056  
38683e003153f7 SeongJae Park 2021-11-05  2057  	/* Fill up the score histogram */
304b95847f2852 SeongJae Park 2024-08-25  2058  	memset(c->regions_score_histogram, 0,
304b95847f2852 SeongJae Park 2024-08-25  2059  			sizeof(*c->regions_score_histogram) *
304b95847f2852 SeongJae Park 2024-08-25  2060  			(DAMOS_MAX_SCORE + 1));
38683e003153f7 SeongJae Park 2021-11-05  2061  	damon_for_each_target(t, c) {
38683e003153f7 SeongJae Park 2021-11-05  2062  		damon_for_each_region(r, t) {
38683e003153f7 SeongJae Park 2021-11-05  2063  			if (!__damos_valid_target(r, s))
38683e003153f7 SeongJae Park 2021-11-05  2064  				continue;
898810e5ca5469 SeongJae Park 2022-10-26  2065  			score = c->ops.get_scheme_score(c, t, r, s);
304b95847f2852 SeongJae Park 2024-08-25  2066  			c->regions_score_histogram[score] +=
304b95847f2852 SeongJae Park 2024-08-25  2067  				damon_sz_region(r);
38683e003153f7 SeongJae Park 2021-11-05  2068  			if (score > max_score)
38683e003153f7 SeongJae Park 2021-11-05  2069  				max_score = score;
38683e003153f7 SeongJae Park 2021-11-05  2070  		}
38683e003153f7 SeongJae Park 2021-11-05  2071  	}
38683e003153f7 SeongJae Park 2021-11-05  2072  
38683e003153f7 SeongJae Park 2021-11-05  2073  	/* Set the min score limit */
38683e003153f7 SeongJae Park 2021-11-05  2074  	for (cumulated_sz = 0, score = max_score; ; score--) {
304b95847f2852 SeongJae Park 2024-08-25  2075  		cumulated_sz += c->regions_score_histogram[score];
38683e003153f7 SeongJae Park 2021-11-05  2076  		if (cumulated_sz >= quota->esz || !score)
38683e003153f7 SeongJae Park 2021-11-05  2077  			break;
38683e003153f7 SeongJae Park 2021-11-05  2078  	}
38683e003153f7 SeongJae Park 2021-11-05  2079  	quota->min_score = score;
2b8a248d587334 SeongJae Park 2021-11-05  2080  }
1f366e421c8f69 SeongJae Park 2021-11-05  2081  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
