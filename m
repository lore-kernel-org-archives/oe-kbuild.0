Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DFF200CB
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Apr 2024 05:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713849308; cv=none; b=CxZ+gfwhtFTd1VkVEICzz80frFoKfHAONTjPMMj50EYnWsXwkp7DAPPDjo5kl9fDPnro7hD0Wq5KZ/T14eXwq/ypQkUiFumqbOFp6Xj5y6jk/9+jimgvJHved6zqhVN4ZFVNsVP+BxY4UQgIWvxzxkiE0EKTcdg9UktHwWHBYOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713849308; c=relaxed/simple;
	bh=X3dmjXdC5CI3C9eCOBXcQe2kWaIgkt80Z4d57TIjUf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JcsHNfQknZcWsVsy+4OhXY5QYA30S9i7FS7soGF0i54KbDSvUtihOj2O5z47bvKR2/Ds8IEq6rv+M8eid2w88ac5O2kbix0xdsYXvuFb7snPfpQ9y6l+oMyPYXFklkYCmRQ9MjRgqmsrwiVnBqoQsui2OGa382XxZeGiSLA1he0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9OsGxq3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9OsGxq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713849307; x=1745385307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X3dmjXdC5CI3C9eCOBXcQe2kWaIgkt80Z4d57TIjUf4=;
  b=b9OsGxq3oJgnPtZQzc9ybkUO5DEQcLRamCaWbekBLUiFfISk6XjVKm5Y
   opy991jDEmKeHAJk//tGFB/q7ZOgzb7HU/FjxN8jfTRh79YTp/4Hi6MWu
   MAS7OvWmEv0UVWOqJxQ0q8O8uQrFnrSwOQtlMcrfC6OAa2lTcgg/ax88Q
   Qqt9EutSoXV3ZCBcWkFXycDuOMYhdglML+T6cFoWSChfiDYLr+eg4Omzh
   VvUmKlDrL+ObWk7RSGDjB5E/Cw7cMZmbvTCite94RJpkYkCY39fjShgKc
   LxcMiuqvQhpnxS2MVIXCBZ3C+3X83Q/ygq5piV8nbPEZp1I1BJnn0ezds
   w==;
X-CSE-ConnectionGUID: jkBchz3xRKGB8VlV4hTxuA==
X-CSE-MsgGUID: w1USQ8LtSP2tQE/QitgCQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9333807"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9333807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 22:15:06 -0700
X-CSE-ConnectionGUID: 9/0+CjhgT52RV6eFrQHgCg==
X-CSE-MsgGUID: olwfKjJjSOGIskx7n3d3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="61702288"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2024 22:15:05 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz8Ug-0000Ue-1u;
	Tue, 23 Apr 2024 05:15:02 +0000
Date: Tue, 23 Apr 2024 13:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6621/6937] mseal_test.c:84:45: warning: format
 '%s' expects argument of type 'char *', but argument 5 has type 'char
 (*)[5]'
Message-ID: <202404231353.L1774EEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jeff Xu <jeffxu@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f529a6d274b3b8c75899e949649d231298f30a32
commit: 99e05a968cf1c4b88aad1c6e1bbedd2442e9a50a [6621/6937] selftest mm/mseal memory sealing
:::::: branch date: 23 hours ago
:::::: commit date: 5 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231353.L1774EEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404231353.L1774EEo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mseal_test.c: In function 'get_vma_size':
>> mseal_test.c:84:45: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'char (*)[5]' [-Wformat=]
      84 |                 if (sscanf(line, "%lx-%lx %4s", &addr_start, &addr_end, &protstr) == 3) {
         |                                           ~~^                           ~~~~~~~~
         |                                             |                           |
         |                                             char *                      char (*)[5]


vim +84 tools/testing/selftests/mm/mseal_test.c

99e05a968cf1c4 Jeff Xu 2024-04-15   69  
99e05a968cf1c4 Jeff Xu 2024-04-15   70  static unsigned long get_vma_size(void *addr, int *prot)
99e05a968cf1c4 Jeff Xu 2024-04-15   71  {
99e05a968cf1c4 Jeff Xu 2024-04-15   72  	FILE *maps;
99e05a968cf1c4 Jeff Xu 2024-04-15   73  	char line[256];
99e05a968cf1c4 Jeff Xu 2024-04-15   74  	int size = 0;
99e05a968cf1c4 Jeff Xu 2024-04-15   75  	uintptr_t  addr_start, addr_end;
99e05a968cf1c4 Jeff Xu 2024-04-15   76  	char protstr[5];
99e05a968cf1c4 Jeff Xu 2024-04-15   77  	*prot = 0;
99e05a968cf1c4 Jeff Xu 2024-04-15   78  
99e05a968cf1c4 Jeff Xu 2024-04-15   79  	maps = fopen("/proc/self/maps", "r");
99e05a968cf1c4 Jeff Xu 2024-04-15   80  	if (!maps)
99e05a968cf1c4 Jeff Xu 2024-04-15   81  		return 0;
99e05a968cf1c4 Jeff Xu 2024-04-15   82  
99e05a968cf1c4 Jeff Xu 2024-04-15   83  	while (fgets(line, sizeof(line), maps)) {
99e05a968cf1c4 Jeff Xu 2024-04-15  @84  		if (sscanf(line, "%lx-%lx %4s", &addr_start, &addr_end, &protstr) == 3) {
99e05a968cf1c4 Jeff Xu 2024-04-15   85  			if (addr_start == (uintptr_t) addr) {
99e05a968cf1c4 Jeff Xu 2024-04-15   86  				size = addr_end - addr_start;
99e05a968cf1c4 Jeff Xu 2024-04-15   87  				if (protstr[0] == 'r')
99e05a968cf1c4 Jeff Xu 2024-04-15   88  					*prot |= 0x4;
99e05a968cf1c4 Jeff Xu 2024-04-15   89  				if (protstr[1] == 'w')
99e05a968cf1c4 Jeff Xu 2024-04-15   90  					*prot |= 0x2;
99e05a968cf1c4 Jeff Xu 2024-04-15   91  				if (protstr[2] == 'x')
99e05a968cf1c4 Jeff Xu 2024-04-15   92  					*prot |= 0x1;
99e05a968cf1c4 Jeff Xu 2024-04-15   93  				break;
99e05a968cf1c4 Jeff Xu 2024-04-15   94  			}
99e05a968cf1c4 Jeff Xu 2024-04-15   95  		}
99e05a968cf1c4 Jeff Xu 2024-04-15   96  	}
99e05a968cf1c4 Jeff Xu 2024-04-15   97  	fclose(maps);
99e05a968cf1c4 Jeff Xu 2024-04-15   98  	return size;
99e05a968cf1c4 Jeff Xu 2024-04-15   99  }
99e05a968cf1c4 Jeff Xu 2024-04-15  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
