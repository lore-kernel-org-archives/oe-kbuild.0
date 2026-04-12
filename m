Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A301125F7A9
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Apr 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775988038; cv=none; b=SRhwkpONQeqgNMTSXPSIKKultorl8ltB8ctEKvfdoGOqfcSHhl+AQi3znSWs7cCMgMqCifMc1LHytn4Wzuz0x2Zd78FH+2tIE3G6ZFwt0/gqsWZ/qCbHn/WFPoi0h3J1a3iE/yfaMh+N+crvQTNJvvevdk8WV4LRbufzun5CXFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775988038; c=relaxed/simple;
	bh=mdm9MrEOE9EuP3V83BjpoitwUyyTktwK9nHyiSTxw80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pf5qBSq12LC/QlgzLRAN6p5iU4tCxJjpUe69/wLKDQTY4Gz68gWHE7A95MDLru+q6GHvoAJkdqIAY6Uv8kqnH/afkH5S2ADjSYfGuddsQL0MBhjWuLMW+dKGXUR/uaPDcErMlfXv+hpdJEmiE22/m8ilEHcd2eXu2pvnAHCReH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cei8R5Q5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cei8R5Q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775988037; x=1807524037;
  h=date:from:to:cc:subject:message-id;
  bh=mdm9MrEOE9EuP3V83BjpoitwUyyTktwK9nHyiSTxw80=;
  b=cei8R5Q5gxeUYENYtkge0ME1DXWED4SbSrzGNuSw5ij5ASw9a8ZkoS8Z
   owMRQvFcxhgxkmvfOLzPLlh1kxIcAhq/qLxHAtVaLjZVeGODnp8ESW9kP
   3ka2rvRcu9sc3YKVueLjdp+GKfW28KAZd+7ZiOaiWDk9csmBRxCjB3vCJ
   8Wkkt1aPA81RpKVS0LWUV1OK39P13nIR77nbyaBf6x8W7J8pQHajg7VFm
   bnSzUvLncAO8XkVREZXsSMpgV80REj+D6fQJDy8SDG1vD3t8tqpPWgA1R
   rbod7U94lHYbrbXJQ4fspU652jQjUiBXu9FtjyWyLixB86qzujdFNOXfU
   A==;
X-CSE-ConnectionGUID: b0pcETGdQGWzjfW4ZNDQWQ==
X-CSE-MsgGUID: 5MvwBP8RTrWXsX4DGZWAPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80808980"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="80808980"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 03:00:37 -0700
X-CSE-ConnectionGUID: 1qs5PMs1S/W6cDyGqdFpdw==
X-CSE-MsgGUID: uYcXWWMdQoWgbqPoTVFRXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="228492370"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Apr 2026 03:00:36 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBrcG-0000000025d-2daZ;
	Sun, 12 Apr 2026 10:00:32 +0000
Date: Sun, 12 Apr 2026 17:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/staging/iio/frequency/ad9832.c:115:60: error:
 expected ',' or ';' before 'i'
Message-ID: <202604121725.ewvBjt5e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Joshua-Crofts/iio-frequency-ad9832-remove-kernel-h-proxy-header/20260412-132456, commit: 1d815eeb63e9efc21b0e38b1ba5ab08cfb23bef1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joshua Crofts <joshua.crofts1@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Joshua-Crofts/iio-frequency-ad9832-remove-kernel-h-proxy-header/20260412-132456
head:   1d815eeb63e9efc21b0e38b1ba5ab08cfb23bef1
commit: 1d815eeb63e9efc21b0e38b1ba5ab08cfb23bef1 iio: frequency: ad9832: simplify bitwise math
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arm-randconfig-004-20260412 (https://download.01.org/0day-ci/archive/20260412/202604121725.ewvBjt5e-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604121725.ewvBjt5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604121725.ewvBjt5e-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/iio/frequency/ad9832.c: In function 'ad9832_calc_freqreg':
>> drivers/staging/iio/frequency/ad9832.c:115:60: error: expected ',' or ';' before 'i'
     115 |         u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS)i;
         |                                                            ^


vim +115 drivers/staging/iio/frequency/ad9832.c

d89aa24585a5e35 drivers/staging/iio/frequency/ad9832.c Narcisa Ana Maria Vasile 2017-02-27  112  
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  113  static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  114  {
1d815eeb63e9efc drivers/staging/iio/frequency/ad9832.c Joshua Crofts            2026-04-11 @115  	u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS)i;
1d815eeb63e9efc drivers/staging/iio/frequency/ad9832.c Joshua Crofts            2026-04-11  116  
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  117  	do_div(freqreg, mclk);
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  118  	return freqreg;
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  119  }
ea707584bac187c drivers/staging/iio/dds/ad9832.c       Michael Hennerich        2011-02-09  120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
