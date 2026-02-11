Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1A191F94
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770817349; cv=none; b=rE6jhjsQs+GIdoJCT7ap8qZukHYgGS+mgxioZ9I8t8NIBTqtF2nXA1dbDGloYHo2OC7uNCHU1NG8MtjNPBJcv8St2DsC0tkpBJpCh7bDjmRjhlibWWRePCPTeaPXwG06PoTmtj4tVS4SN8FG16f6zpZQ7f01tEX3KauD3KU7oB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770817349; c=relaxed/simple;
	bh=g+Wg1RIpxClBOygYMCBQIylScGxFf//XEZRsa1fcK/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JNFs5tPoPAlCNKTwiCnu+PMf6fVnVTVyNjqCTWcrN4eEsKu42tPYvli9CiJUMshwSDh51la5kO/Plf1bcQquI1xVSx0RQBUsvq2aqkthWj493A0AUno975plum1f/MY3Pit9DCYXZewNSFcZqftM9HpgOchXkijcxIoJBxCMQQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKfQnlCs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKfQnlCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770817347; x=1802353347;
  h=date:from:to:cc:subject:message-id;
  bh=g+Wg1RIpxClBOygYMCBQIylScGxFf//XEZRsa1fcK/I=;
  b=IKfQnlCsXBzRdiQXAqn77PuZqRjbLu857WPDotLjDmQUarzVLK6k1IZu
   wHByq7PGDf4CfbTvnLEikO00uDyAllWndXEZmKlQzaZmKAtSC+HDIEBIp
   RFOIc5imwrVxVT115ZnIbs8y2K7Jwo8kUagN3bgmYMJ2qQuNr9zLPyZSV
   FyLDUHl9eRNa80tigdRHqjRQ7a5pgXyv/Pva2jIYp3D8Izs1RP1VqFwwV
   6I10A4Euoe68Lqq+5/EyGrD7ahBkWKKK4VqKKFtyBCAyCaBfp1m7tgd2c
   brFzzmeyM+poiKLVMY1S0dU6DQ8m5yE1cbKz4Mt1yvZqZ24Yqa2/N1UrY
   g==;
X-CSE-ConnectionGUID: AVcS8ZAPQlWSzHsL+SXJng==
X-CSE-MsgGUID: ZbKDsntGTyWqm0SnCXK2uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72007526"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72007526"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 05:42:27 -0800
X-CSE-ConnectionGUID: Cohfa9kgTg+99s06hqLy6g==
X-CSE-MsgGUID: avfT52vQTZyipKcVWJSOBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216757326"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2026 05:42:26 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqAU3-0000000015V-4330;
	Wed, 11 Feb 2026 13:42:23 +0000
Date: Wed, 11 Feb 2026 14:41:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10181/12487] /tmp/tmp.6ZLHPYKNUe.c:1:10:
 fatal error: sys/types.h: No such file or directory
Message-ID: <202602111401.qHzg7kZN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kevin Brodsky <kevin.brodsky@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd9678829d6dd0c10fde080b536abf4b1121c346
commit: 7f532d19c8be76ad2fcd7ab6b0c9eb618f70966b [10181/12487] selftests/mm: pass down full CC and CFLAGS to check_config.sh
:::::: branch date: 15 hours ago
:::::: commit date: 11 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602111401.qHzg7kZN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111401.qHzg7kZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602111401.qHzg7kZN-lkp@intel.com/

Note: the linux-next/master HEAD fd9678829d6dd0c10fde080b536abf4b1121c346 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> /tmp/tmp.6ZLHPYKNUe.c:1:10: fatal error: sys/types.h: No such file or directory
       1 | #include <sys/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
