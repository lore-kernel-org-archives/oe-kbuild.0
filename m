Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1C61B85D1
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Nov 2024 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732456827; cv=none; b=XcKqdh5udVL8kGJj7dO/0L3c/j9nFUofpCfGlqYKO13Q0ex3fjA44OgYE7V9wy4fn/X+YBNTyudq0XyzBaFDYAODI8LsAF1SXkbwqOeb9kbt8PPUPmbASk+oPl2A4NVslv5VEMt14r8ggEBuvXvUVj1SSQO5Kk8etJ4i+2nzMrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732456827; c=relaxed/simple;
	bh=PcflfUBMzw16fYFxGwa6jRygev+YxWa55ac9rTtV4Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p3kG5Of/810pg1N3xttS/HFgD+Ms+h4N+AN93WHVaBEH69jMdrtaQn1RUxdkRAc7gOfnKHeSRHEUUw1rWhybgOFeMoJ9j7RHpAE+SfZnsYwvhiIN79mB4VypxrqquQ+lxrmLyRW1dbZ8ek9FjTmFuQGtOZZUDROPg3/8QJwOHWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAXUNLbG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAXUNLbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732456825; x=1763992825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcflfUBMzw16fYFxGwa6jRygev+YxWa55ac9rTtV4Fs=;
  b=XAXUNLbGjzOdU8/aoA+Fl/8g4yInm0o0FTu1d3Mbn/OAD6dRTz7xeL+w
   xvb/P4pnPgmejOsGtzppCZtvyYCk3tjhCp2WU34VaBW3cOuYrreXUCA/j
   LedW28WbGKs7USZyhwjfC/BQTE8NrhHaHPpMpZP5azZfjh7uL2+5VPPdH
   Mesy6l0JSrj8eALSRIHNq4evMe3CCipVr1+yhU9FZY3Y/dVz4U18xEX6o
   cym1sCPYNb0PE4tm0CpWD82OF1PW0OvpzdpFbDfqJrWcCnWoQjk8ZS3r9
   FoQW0vc59MovDZCqscl1V2V7rMDWEc45WUR/fWDmK9J8GpYce7mtua2mu
   g==;
X-CSE-ConnectionGUID: gMcxoU67SnGzVSZ0pPvuCQ==
X-CSE-MsgGUID: r2XqQPq7TaaZRObIZuqRuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="43063936"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="43063936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 06:00:25 -0800
X-CSE-ConnectionGUID: AQAPX0ecQlami0YCJEzOFg==
X-CSE-MsgGUID: O/L/8eyiQ8uCPyGfSyKJpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="96089119"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2024 06:00:24 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFD9x-00051B-1O;
	Sun, 24 Nov 2024 14:00:21 +0000
Date: Sun, 24 Nov 2024 22:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/time/timekeeping.c:807:19-20: WARNING opportunity for min()
Message-ID: <202411242103.s1QBLXod-lkp@intel.com>
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
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: fcf190c369149c3b04539797cedf28741eb14164 timekeeping: Make delta calculation overflow safe
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-102-20241124 (https://download.01.org/0day-ci/archive/20241124/202411242103.s1QBLXod-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411242103.s1QBLXod-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/time/timekeeping.c:807:19-20: WARNING opportunity for min()

vim +807 kernel/time/timekeeping.c

cc06268c6a87db Thomas Gleixner    2011-11-13  787  
8524070b7982d7 John Stultz        2007-05-08  788  /**
155ec60226ae0a Martin Schwidefsky 2009-08-14  789   * timekeeping_forward_now - update clock to the current time
6e5a91901c2dff Alex Shi           2020-11-13  790   * @tk:		Pointer to the timekeeper to update
8524070b7982d7 John Stultz        2007-05-08  791   *
9a055117d3d9cb Roman Zippel       2008-08-20  792   * Forward the current clock to update its state since the last call to
9a055117d3d9cb Roman Zippel       2008-08-20  793   * update_wall_time(). This is useful before significant clock changes,
9a055117d3d9cb Roman Zippel       2008-08-20  794   * as it avoids having to deal with this time offset explicitly.
8524070b7982d7 John Stultz        2007-05-08  795   */
f726a697d06102 John Stultz        2012-07-13  796  static void timekeeping_forward_now(struct timekeeper *tk)
8524070b7982d7 John Stultz        2007-05-08  797  {
a5a1d1c2914b53 Thomas Gleixner    2016-12-21  798  	u64 cycle_now, delta;
8524070b7982d7 John Stultz        2007-05-08  799  
ceea5e3771ed23 John Stultz        2017-06-08  800  	cycle_now = tk_clock_read(&tk->tkr_mono);
876e78818def29 Peter Zijlstra     2015-03-19  801  	delta = clocksource_delta(cycle_now, tk->tkr_mono.cycle_last, tk->tkr_mono.mask);
876e78818def29 Peter Zijlstra     2015-03-19  802  	tk->tkr_mono.cycle_last = cycle_now;
4a4ad80d32cea6 Peter Zijlstra     2015-03-19  803  	tk->tkr_raw.cycle_last  = cycle_now;
8524070b7982d7 John Stultz        2007-05-08  804  
fcf190c369149c Adrian Hunter      2024-03-25  805  	while (delta > 0) {
fcf190c369149c Adrian Hunter      2024-03-25  806  		u64 max = tk->tkr_mono.clock->max_cycles;
fcf190c369149c Adrian Hunter      2024-03-25 @807  		u64 incr = delta < max ? delta : max;
fc6eead7c1e2e5 John Stultz        2017-05-22  808  
fcf190c369149c Adrian Hunter      2024-03-25  809  		tk->tkr_mono.xtime_nsec += incr * tk->tkr_mono.mult;
fcf190c369149c Adrian Hunter      2024-03-25  810  		tk->tkr_raw.xtime_nsec += incr * tk->tkr_raw.mult;
fc6eead7c1e2e5 John Stultz        2017-05-22  811  		tk_normalize_xtime(tk);
fcf190c369149c Adrian Hunter      2024-03-25  812  		delta -= incr;
fcf190c369149c Adrian Hunter      2024-03-25  813  	}
8524070b7982d7 John Stultz        2007-05-08  814  }
8524070b7982d7 John Stultz        2007-05-08  815  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
