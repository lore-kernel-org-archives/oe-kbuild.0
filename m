Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E53647
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Oct 2024 00:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728000540; cv=none; b=PBZjeyHCAH1j/06joopohKBNKpHpjhkFPGp415YkdT0l9lVMmwYfNNj2TDK0k+69HmyTtLmLukxnZRnL1eFVmABW/NA/rMUTraqbksDmpoiSkFoSeQWk1CITZUkvZ8VUVEVqxSsWyVa0AE2ZOolYw5dEQtDL1SbXMEbyRsPQAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728000540; c=relaxed/simple;
	bh=T8Pp1WSXv4g6ukbaiExm/hHVACnqHSzdWrRpE1eqUDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKepfIYSHo913j8MLuNon5+p6yXn3TJjYHAlZXCORUKrTuMZbxmplFshzT3DLyKu4jKnXG1JIDNXKwgf7Yz1Dvrihq1KnSFv1DfhFt/CyUQPXj+W301LLxt3kIa66uPq+Y0hhOP2otEGr3ZjRnzWMwsDn6AUWzadQ80fZna5Tmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJov1VJd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJov1VJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728000539; x=1759536539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8Pp1WSXv4g6ukbaiExm/hHVACnqHSzdWrRpE1eqUDM=;
  b=LJov1VJdBABigP1N5WzQHoDKX/3jYjojuEmVZbjj6G6tI46W6SICXnrK
   06sLcsiGXfQ3cjhIZkIBumJGUDwrrb6clvaaq+fKEMWPDUnntokfXbcid
   oOiBc8DGUdYydlE4xP7rbpmsdJZCvKyykESzg3hTWp898nzSqKu2SXbjc
   e5wQ5HIjM0mqXAmhEJzG9fdQd93GEg2niCNi1N+x6U6grWR/dyPm1a8dp
   p4kZMRiHUgR4LUpdEtjUcSyEw8MrahD7wEhVp5Bs2aQcFgBGXCv+i67pJ
   Ij3E9lfDpn4Scz2h8xB+Zh1fuiRUDqHttLlMAmzLlu9m6B4p3enFEpwtD
   A==;
X-CSE-ConnectionGUID: MME+l2b2QZOvBjqcyy6iLg==
X-CSE-MsgGUID: T2ZUzUsYSkqWsRAGHljbjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27352821"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27352821"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 17:08:58 -0700
X-CSE-ConnectionGUID: pkHf5IesTAygufvAWJZFSg==
X-CSE-MsgGUID: ZcZHnFqwQeuM4IS+rn3W3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="79088108"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Oct 2024 17:08:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swVsM-00012k-17;
	Fri, 04 Oct 2024 00:08:54 +0000
Date: Fri, 4 Oct 2024 08:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/time/timekeeping.c:807:19-20: WARNING opportunity for min()
Message-ID: <202410040856.IAPgOjON-lkp@intel.com>
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
head:   8c245fe7dde3bf776253550fc914a36293db4ff3
commit: fcf190c369149c3b04539797cedf28741eb14164 timekeeping: Make delta calculation overflow safe
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-r062-20241004 (https://download.01.org/0day-ci/archive/20241004/202410040856.IAPgOjON-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410040856.IAPgOjON-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/time/timekeeping.c:807:19-20: WARNING opportunity for min()

vim +807 kernel/time/timekeeping.c

cc06268c6a87db1 Thomas Gleixner    2011-11-13  787  
8524070b7982d76 John Stultz        2007-05-08  788  /**
155ec60226ae0ae Martin Schwidefsky 2009-08-14  789   * timekeeping_forward_now - update clock to the current time
6e5a91901c2dff3 Alex Shi           2020-11-13  790   * @tk:		Pointer to the timekeeper to update
8524070b7982d76 John Stultz        2007-05-08  791   *
9a055117d3d9cb5 Roman Zippel       2008-08-20  792   * Forward the current clock to update its state since the last call to
9a055117d3d9cb5 Roman Zippel       2008-08-20  793   * update_wall_time(). This is useful before significant clock changes,
9a055117d3d9cb5 Roman Zippel       2008-08-20  794   * as it avoids having to deal with this time offset explicitly.
8524070b7982d76 John Stultz        2007-05-08  795   */
f726a697d06102e John Stultz        2012-07-13  796  static void timekeeping_forward_now(struct timekeeper *tk)
8524070b7982d76 John Stultz        2007-05-08  797  {
a5a1d1c2914b531 Thomas Gleixner    2016-12-21  798  	u64 cycle_now, delta;
8524070b7982d76 John Stultz        2007-05-08  799  
ceea5e3771ed237 John Stultz        2017-06-08  800  	cycle_now = tk_clock_read(&tk->tkr_mono);
876e78818def298 Peter Zijlstra     2015-03-19  801  	delta = clocksource_delta(cycle_now, tk->tkr_mono.cycle_last, tk->tkr_mono.mask);
876e78818def298 Peter Zijlstra     2015-03-19  802  	tk->tkr_mono.cycle_last = cycle_now;
4a4ad80d32cea69 Peter Zijlstra     2015-03-19  803  	tk->tkr_raw.cycle_last  = cycle_now;
8524070b7982d76 John Stultz        2007-05-08  804  
fcf190c369149c3 Adrian Hunter      2024-03-25  805  	while (delta > 0) {
fcf190c369149c3 Adrian Hunter      2024-03-25  806  		u64 max = tk->tkr_mono.clock->max_cycles;
fcf190c369149c3 Adrian Hunter      2024-03-25 @807  		u64 incr = delta < max ? delta : max;
fc6eead7c1e2e53 John Stultz        2017-05-22  808  
fcf190c369149c3 Adrian Hunter      2024-03-25  809  		tk->tkr_mono.xtime_nsec += incr * tk->tkr_mono.mult;
fcf190c369149c3 Adrian Hunter      2024-03-25  810  		tk->tkr_raw.xtime_nsec += incr * tk->tkr_raw.mult;
fc6eead7c1e2e53 John Stultz        2017-05-22  811  		tk_normalize_xtime(tk);
fcf190c369149c3 Adrian Hunter      2024-03-25  812  		delta -= incr;
fcf190c369149c3 Adrian Hunter      2024-03-25  813  	}
8524070b7982d76 John Stultz        2007-05-08  814  }
8524070b7982d76 John Stultz        2007-05-08  815  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
