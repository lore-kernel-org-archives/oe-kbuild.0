Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9069522D7B6
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770733904; cv=none; b=Bnxo8cYCy9VaAD/MNDVYRgldLYCUInGNN75otqWRUn5+Ki1F8abPsb6zWr9ypP0VG3czugZf7NFReQLlRO+EYZoI81xN+6TvJc8XBOY0mTCIOVtRq3L9q3vIG1mDFhpNPrNjkU5N+B+Koc0wy3AoNV7uSciRTaK9StpIXWEtJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770733904; c=relaxed/simple;
	bh=X8ogPGuOgeEogFFEG7DADUNVIuwfx4KivBCQBV9TssM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=udRqjW4/a2RWZdH0r4VTJ0gIqlAVR8zZ+Af8ZZNhrRILwjm2U8kdrMXMNpYrahWawfydgFLhJw2WsL9uehaDRA/NGqB1K6hZVyyCkGnuYcQGIsAM6tirJkQ/NPHwjkgyLZoPsRkontKdu+UP6t6eoUiZ7EAiS8skQUFzKYITwM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfRFp9gU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfRFp9gU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770733904; x=1802269904;
  h=date:from:to:cc:subject:message-id;
  bh=X8ogPGuOgeEogFFEG7DADUNVIuwfx4KivBCQBV9TssM=;
  b=GfRFp9gUfylJMgUYvVafbjuGF7L8CCPmCiTCb2fktdzZbpA5Dz2T8RV2
   UJ06TPue7LclMkaFjXI9lJ7C037ygrXXQ2UiTyoc9ATaNtO87MDTl5xmH
   2WMptWis0oE4F8OW52qLGXmMHK5mrTBKp7luYk1ugNFi42S7YdTnZi+yr
   o1XppMi5e43CcnUD5YDqXnoTEhnEL9n9nbwheWI+9F/kys71lvocp6kkb
   u597ExAMWllIXRQueQ4AeX1oIBtEk6CRLmrezg+N+xAJS86RA/99/iAhs
   Ri4299+Cc2heWl8n9T7/JZs0kkiv2YOnlsG3m/gsDmbBSJLtYjnsqBnYG
   Q==;
X-CSE-ConnectionGUID: /cW8XZoQTuSlulRu4zVbuQ==
X-CSE-MsgGUID: iYNnY1LRRtWghaaPqZnbhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82966702"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82966702"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:31:43 -0800
X-CSE-ConnectionGUID: oJye/N/ZRG++Jvs9XFRqQQ==
X-CSE-MsgGUID: A9jQXXZ2QWOep3iRzFl8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216270710"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Feb 2026 06:31:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpomB-00000000p4k-49Vb;
	Tue, 10 Feb 2026 14:31:39 +0000
Date: Tue, 10 Feb 2026 22:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/damon/stat.c:60:21-22: WARNING opportunity for
 secs_to_jiffies()
Message-ID: <202602102243.KIkZ3hoV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72c395024dac5e215136cbff793455f065603b06
commit: fabdd1e911da43cddbf17acf930171ba4b944477 mm/damon/stat: calculate and expose estimated memory bandwidth
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-051-20260210 (https://download.01.org/0day-ci/archive/20260210/202602102243.KIkZ3hoV-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602102243.KIkZ3hoV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/damon/stat.c:60:21-22: WARNING opportunity for secs_to_jiffies()

vim +60 mm/damon/stat.c

fabdd1e911da43 SeongJae Park 2025-06-04  53  
fabdd1e911da43 SeongJae Park 2025-06-04  54  static int damon_stat_after_aggregation(struct damon_ctx *c)
fabdd1e911da43 SeongJae Park 2025-06-04  55  {
fabdd1e911da43 SeongJae Park 2025-06-04  56  	static unsigned long last_refresh_jiffies;
fabdd1e911da43 SeongJae Park 2025-06-04  57  
fabdd1e911da43 SeongJae Park 2025-06-04  58  	/* avoid unnecessarily frequent stat update */
fabdd1e911da43 SeongJae Park 2025-06-04  59  	if (time_before_eq(jiffies, last_refresh_jiffies +
fabdd1e911da43 SeongJae Park 2025-06-04 @60  				msecs_to_jiffies(5 * MSEC_PER_SEC)))
fabdd1e911da43 SeongJae Park 2025-06-04  61  		return 0;
fabdd1e911da43 SeongJae Park 2025-06-04  62  	last_refresh_jiffies = jiffies;
fabdd1e911da43 SeongJae Park 2025-06-04  63  
fabdd1e911da43 SeongJae Park 2025-06-04  64  	damon_stat_set_estimated_memory_bandwidth(c);
fabdd1e911da43 SeongJae Park 2025-06-04  65  	return 0;
fabdd1e911da43 SeongJae Park 2025-06-04  66  }
fabdd1e911da43 SeongJae Park 2025-06-04  67  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
