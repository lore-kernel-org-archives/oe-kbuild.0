Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243705103F
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Apr 2025 22:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546373; cv=none; b=jBGUvklS7JlaShXklTmjoFXWIcIPHvK771LMQuNdBREspvKnTUpbx6HOW8yRgXQStOmxQaAt7gJ5jL6DsrnvOBVfu2GyroWcxrXrxZY1VTFpi6sdZ1zGbckUfygnhgEEMVmRZVIwmmDW4Ivqn0Q7vwwy7dvZlNvJ55J9XQvM4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546373; c=relaxed/simple;
	bh=IVmuChtYbC45eP7ZUjvzJernSrLxUHYoFBIC/dR0oSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PlFwNXmURgGagSFp5Olu5j2LlbGbWuguTGoKoVw6Vzbze585ONd7WfBs1fe+ittT4v0pyfiCXy58E1Jeq1uBKvF3++HWRgq5no7aANUKI3q4u8l6GCnjLGpl2k8exLmEixyRvDYDMyZVp6a5OxK4hb3aAe6yoPQckroCrQwWTw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRFWDldu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRFWDldu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743546373; x=1775082373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVmuChtYbC45eP7ZUjvzJernSrLxUHYoFBIC/dR0oSU=;
  b=LRFWDlduHu8DSEhvMH8R9PW0LQuxQr1HlTZp93SuyHm4Vyaem4roPKO2
   SKjvlzYR9mrlrlp4/SH3vj7SRmzdYlVBWXka74FzGjv4SlGCAr7fwx1gG
   k+iKoyXgK4L419086O6PHPtMCAG/KqThBtpuU1s4Iy2j1NLPv/P0AY+mp
   gujZNQc2vbDUH/6gMlTD38CZXjScJ71APrBMzoR08Jw1Zfyir6qhgBR3p
   RSTo0MMtsVhvREe6ZqASXHbK3k+s8IIWCXMiEm1MZ/SJQazHreYtdKvUd
   4joFy9SBu/Po0fYtVWvht21InU2xWjZLYnX4cMYXTzn77lLp3V9kQINDJ
   w==;
X-CSE-ConnectionGUID: AARIM4PFTB+SlsCEE+Mfhg==
X-CSE-MsgGUID: C0rEfsJTT1mFwLYggoIsoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44800048"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="44800048"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 15:26:12 -0700
X-CSE-ConnectionGUID: aL7COR7jRGq6dwAlxwGCzA==
X-CSE-MsgGUID: fmMrK+xwRyW4hc19D8Kt4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="127422667"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Apr 2025 15:26:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzk3c-000ACA-0y;
	Tue, 01 Apr 2025 22:26:08 +0000
Date: Wed, 2 Apr 2025 06:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paulmckrcu:dev.2025.03.25a 45/45] lib/ratelimit.c:45 ___ratelimit()
 warn: 'burst' unsigned <= 0
Message-ID: <202504020656.TgN4JCta-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev.2025.03.25a
head:   cedfad9ced72fc8c873e11a4c6a089a415489166
commit: cedfad9ced72fc8c873e11a4c6a089a415489166 [45/45] ratelimit: Reduce ratelimit's false-positive misses
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020656.TgN4JCta-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504020656.TgN4JCta-lkp@intel.com/

New smatch warnings:
lib/ratelimit.c:45 ___ratelimit() warn: 'burst' unsigned <= 0
lib/ratelimit.c:45 ___ratelimit() warn: 'interval' unsigned <= 0

Old smatch warnings:
lib/ratelimit.c:123 ___ratelimit() warn: 'interval' unsigned <= 0
lib/ratelimit.c:153 ___ratelimit() warn: 'interval' unsigned <= 0

vim +/burst +45 lib/ratelimit.c

5f97a5a8799b8d Dave Young            2008-04-29  14  
5f97a5a8799b8d Dave Young            2008-04-29  15  /*
5f97a5a8799b8d Dave Young            2008-04-29  16   * __ratelimit - rate limiting
717115e1a5856b Dave Young            2008-07-25  17   * @rs: ratelimit_state data
2a7268abc48c80 Yong Zhang            2010-04-06  18   * @func: name of calling function
5f97a5a8799b8d Dave Young            2008-04-29  19   *
2a7268abc48c80 Yong Zhang            2010-04-06  20   * This enforces a rate limit: not more than @rs->burst callbacks
2a7268abc48c80 Yong Zhang            2010-04-06  21   * in every @rs->interval
2a7268abc48c80 Yong Zhang            2010-04-06  22   *
2a7268abc48c80 Yong Zhang            2010-04-06  23   * RETURNS:
2a7268abc48c80 Yong Zhang            2010-04-06  24   * 0 means callbacks will be suppressed.
2a7268abc48c80 Yong Zhang            2010-04-06  25   * 1 means go ahead and do it.
5f97a5a8799b8d Dave Young            2008-04-29  26   */
5c828713358cb9 Christian Borntraeger 2009-10-23  27  int ___ratelimit(struct ratelimit_state *rs, const char *func)
5f97a5a8799b8d Dave Young            2008-04-29  28  {
cedfad9ced72fc Paul E. McKenney      2025-03-31  29  	unsigned long begin;
cedfad9ced72fc Paul E. McKenney      2025-03-31  30  	unsigned long burst = READ_ONCE(rs->burst);
cedfad9ced72fc Paul E. McKenney      2025-03-31  31  	int delta = 0;
4d9c377c81d377 Alexey Dobriyan       2008-07-28  32  	unsigned long flags;
cedfad9ced72fc Paul E. McKenney      2025-03-31  33  	bool gotlock = false;
cedfad9ced72fc Paul E. McKenney      2025-03-31  34  	bool initialized;
cedfad9ced72fc Paul E. McKenney      2025-03-31  35  	unsigned long interval = READ_ONCE(rs->interval);
cedfad9ced72fc Paul E. McKenney      2025-03-31  36  	unsigned long j;
cedfad9ced72fc Paul E. McKenney      2025-03-31  37  	int n_left;
5f97a5a8799b8d Dave Young            2008-04-29  38  
edaac8e3167501 Ingo Molnar           2009-09-22  39  	/*
cedfad9ced72fc Paul E. McKenney      2025-03-31  40  	 * If the burst or interval settings mark this ratelimit_state
cedfad9ced72fc Paul E. McKenney      2025-03-31  41  	 * structure as disabled, then clear the RATELIMIT_INITIALIZED bit
cedfad9ced72fc Paul E. McKenney      2025-03-31  42  	 * in ->flags to force resetting of the ratelimiting interval when
cedfad9ced72fc Paul E. McKenney      2025-03-31  43  	 * this ratelimit_state structure is next re-enabled.
edaac8e3167501 Ingo Molnar           2009-09-22  44  	 */
cedfad9ced72fc Paul E. McKenney      2025-03-31 @45  	if (burst <= 0 || interval <= 0) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
