Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C166F11702
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 09:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOY7k0Fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699004689; x=1730540689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q9Q8rVJ/THImN4jBaEbtup0OL9vVOWn9MwpQYnKlO4Q=;
  b=UOY7k0Fk31Aay8I5pVkF4BQvfEYQ290RovRPSpgV2tZK9dpxxH8xNyJ2
   QT4k+iM98Erknl4qLqgSXdUbIKB7lkOjfL3p3+KY6NIXHZ53lf915eyyb
   incHWcsdIRTjXyfQ5HHIjZMk2lFKpg02DUcFYYr+PZpyeEAfRYUv7YzN6
   aRcqNHpdlmlNcbofSxLXLJEdgvu930GAN15LTwyGsm0Jd+w97RhqrA7g9
   GzthDQaevVx5MGlZN9KmN9leVz/LFbIoKsdc8+ce34wtkZ4hoUlIdZKKN
   rMXnxEXyimt2X1KxhEOJY9pHHIvDim4cpKN6tFHlk2d+C6GzhTSy8rsGB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="369121955"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="369121955"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 02:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008764636"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1008764636"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Nov 2023 02:44:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyqjN-0002QW-18;
	Fri, 03 Nov 2023 09:44:45 +0000
Date: Fri, 3 Nov 2023 17:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwmon/pmbus/mp2975.c:185:20: sparse: sparse: too long token
 expansion
Message-ID: <202311031724.5ju2fl6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/hwmon/pmbus/mp2975.c:185:20: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: d03eba99f5bf7cbc6e2fdde3b6fa36954ad58e09 minmax: allow min()/max()/clamp() if the arguments have the same signedness.
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: xtensa-randconfig-r132-20231103 (https://download.01.org/0day-ci/archive/20231103/202311031724.5ju2fl6f-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311031724.5ju2fl6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311031724.5ju2fl6f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwmon/pmbus/mp2975.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/hwmon/pmbus/mp2975.c:185:20: sparse: sparse: too long token expansion

vim +185 drivers/hwmon/pmbus/mp2975.c

45f154dc966322 Patrick Rudolph 2023-07-14  162  
45f154dc966322 Patrick Rudolph 2023-07-14  163  /* Converts a milli-unit DIRECT value to LINEAR11 format */
45f154dc966322 Patrick Rudolph 2023-07-14  164  static u16 mp2975_data2reg_linear11(s64 val)
45f154dc966322 Patrick Rudolph 2023-07-14  165  {
45f154dc966322 Patrick Rudolph 2023-07-14  166  	s16 exponent = 0, mantissa;
45f154dc966322 Patrick Rudolph 2023-07-14  167  	bool negative = false;
45f154dc966322 Patrick Rudolph 2023-07-14  168  
45f154dc966322 Patrick Rudolph 2023-07-14  169  	/* simple case */
45f154dc966322 Patrick Rudolph 2023-07-14  170  	if (val == 0)
45f154dc966322 Patrick Rudolph 2023-07-14  171  		return 0;
45f154dc966322 Patrick Rudolph 2023-07-14  172  
45f154dc966322 Patrick Rudolph 2023-07-14  173  	/* Reduce large mantissa until it fits into 10 bit */
45f154dc966322 Patrick Rudolph 2023-07-14  174  	while (val >= MAX_LIN_MANTISSA && exponent < 15) {
45f154dc966322 Patrick Rudolph 2023-07-14  175  		exponent++;
45f154dc966322 Patrick Rudolph 2023-07-14  176  		val >>= 1;
45f154dc966322 Patrick Rudolph 2023-07-14  177  	}
45f154dc966322 Patrick Rudolph 2023-07-14  178  	/* Increase small mantissa to improve precision */
45f154dc966322 Patrick Rudolph 2023-07-14  179  	while (val < MIN_LIN_MANTISSA && exponent > -15) {
45f154dc966322 Patrick Rudolph 2023-07-14  180  		exponent--;
45f154dc966322 Patrick Rudolph 2023-07-14  181  		val <<= 1;
45f154dc966322 Patrick Rudolph 2023-07-14  182  	}
45f154dc966322 Patrick Rudolph 2023-07-14  183  
45f154dc966322 Patrick Rudolph 2023-07-14  184  	/* Convert mantissa from milli-units to units */
45f154dc966322 Patrick Rudolph 2023-07-14 @185  	mantissa = clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3ff);
45f154dc966322 Patrick Rudolph 2023-07-14  186  
45f154dc966322 Patrick Rudolph 2023-07-14  187  	/* restore sign */
45f154dc966322 Patrick Rudolph 2023-07-14  188  	if (negative)
45f154dc966322 Patrick Rudolph 2023-07-14  189  		mantissa = -mantissa;
45f154dc966322 Patrick Rudolph 2023-07-14  190  
45f154dc966322 Patrick Rudolph 2023-07-14  191  	/* Convert to 5 bit exponent, 11 bit mantissa */
45f154dc966322 Patrick Rudolph 2023-07-14  192  	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
45f154dc966322 Patrick Rudolph 2023-07-14  193  }
45f154dc966322 Patrick Rudolph 2023-07-14  194  

:::::: The code at line 185 was first introduced by commit
:::::: 45f154dc966322948725af1004f53a5531f03b7f hwmon: (pmbus/mp2975) Add OCP limit

:::::: TO: Patrick Rudolph <patrick.rudolph@9elements.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
