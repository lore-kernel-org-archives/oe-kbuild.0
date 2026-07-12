Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259692F39B5
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849780; cv=none; b=CJuzsaRbb1/ZmcvtTh+C9rVGSuxz4HuqieqVPTiuRXh40o3GdBmSpWKfMdxwBexKjx9Pwew/QS46T0LB2VhfZXPtHX/CrO6QBU81xM/Pdwjzk/s9GsjB0W8Pp9wSXgAVWGQj7Ml8FWnTrDJmZ9eZofEXk5XCgC8gwWNIm0VvGgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849780; c=relaxed/simple;
	bh=0lCe548oZ2udUQPj/+eiCMVDkpJ1gPMGJrDwEu0wYCg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OL7OgmDZbiHDpWJ80b6P8zydlb5ADZtklv+l6LEsOARjAUEuSa5B4JctXIg2oN8OqeVVRKpigreOxJpg3u/c0JGlwi9wrE/B7HPB0jdc8hdaLxRFpcMentSbqjw9XVAe/YU4MKvv1T1q6VBE3mtfCcKrCsMQLECrLtz5ETIJz28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ux2Mb4BF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ux2Mb4BF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783849779; x=1815385779;
  h=date:from:to:cc:subject:message-id;
  bh=0lCe548oZ2udUQPj/+eiCMVDkpJ1gPMGJrDwEu0wYCg=;
  b=Ux2Mb4BFYVaL/5RvFi7SW2/j1QenSDkSbHnrX5W0gP3T5vhAllVqVuMs
   JOnmwgqIM3wUZzKcXy8NrQYQkd8jwkeHYW4gq6TsYvvwZfoEeuV39i6pZ
   HD7KPd04OdOnf+r9w+PTjpG1REp17PmOHHPnFfWDokquTpBRGCmBQllLc
   KiawHAv3m9+bMCD1eKz2ftW4JUUwGW7p7QPHGSRH1ncb+9zdBrwkzOG/t
   PmY3pciCOLfscx1sm7qXrmUIzlIFIvGY/XQXROn6bSjqPjNliiDzD3Qah
   5Oss0KNd5UopbIieOEwNdL+aZqoRCciQRJBm7wcGNkxUm3TLq7DIa9xZl
   w==;
X-CSE-ConnectionGUID: y32Gf8XkQjuhLiI2ZQ4NuA==
X-CSE-MsgGUID: kYuhMUK6S+OOn6uSDf+ukg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83607578"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83607578"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 02:49:39 -0700
X-CSE-ConnectionGUID: 9HQKYOtDQeG1Ha79yq3VIA==
X-CSE-MsgGUID: l8BfF1x/S8qg9dB+ZaXo9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258866168"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2026 02:49:38 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiqoZ-000000003WH-3xh8;
	Sun, 12 Jul 2026 09:49:35 +0000
Date: Sun, 12 Jul 2026 11:49:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:timers/cleanup 3/59] arch/s390/mm/init.c:301:38:
 error: implicit declaration of function 'get_random_u32_inclusive'
Message-ID: <202607121139.l8pW3DHz-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 7685fb5c8fe1aebd1a2202b2267a79d5b6775fd2 [3/59] nodemask: Include find.h instead of random.h
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260712/202607121139.l8pW3DHz-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607121139.l8pW3DHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607121139.l8pW3DHz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/mm/init.c: In function 'execmem_arch_setup':
>> arch/s390/mm/init.c:301:38: error: implicit declaration of function 'get_random_u32_inclusive' [-Wimplicit-function-declaration]
     301 |                 module_load_offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/get_random_u32_inclusive +301 arch/s390/mm/init.c

0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  294) 
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  295) struct execmem_info __init *execmem_arch_setup(void)
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  296) {
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  297) 	unsigned long module_load_offset = 0;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  298) 	unsigned long start;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  299) 
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  300) 	if (kaslr_enabled())
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05 @301) 		module_load_offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;

:::::: The code at line 301 was first introduced by commit
:::::: 0cc2dc4902f425e346d46deeea2352d9fba75375 arch: make execmem setup available regardless of CONFIG_MODULES

:::::: TO: Mike Rapoport (IBM) <rppt@kernel.org>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
