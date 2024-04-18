Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1B1779A4
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Apr 2024 18:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713463913; cv=none; b=sl0PRGYrW56keh2ZaRxyqEk5nc0Pc40DrrplQb/zOp19GlLIQ3OGwnbCt8rSezrFA3Xa6eL7sjFa2w/HP6QRWUcTeCM2JBlcFS/dex6cMtJ88oVpknMXAzl0IT0L/NJ5jFS4+e611VDpvklNjCdp6mH6pDzu7Ye06rkhPSYVceE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713463913; c=relaxed/simple;
	bh=0GXQ6q0Adz2/N9Ig52HvX8H1/11Vw9b1TQSagBJQ01M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQBN/fay88j5oQmP6pPmOc47BlirYBPEGVGW9FzZgUnTSjRJv5ASWrtXH1YnJdTgze2l32VednLzBwNC47p+FAD08I5n2tx9QoinTk7rKA5OPPg/Tq/CjlfO39cXxxEA0IfySr658cCmy2AskERQbJDWRS/CDla3XF+K2kKIaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CADsZ5OT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CADsZ5OT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713463911; x=1744999911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0GXQ6q0Adz2/N9Ig52HvX8H1/11Vw9b1TQSagBJQ01M=;
  b=CADsZ5OTQ/oo38Xfs/oh8T2MOYG/uI3CrQKmKU7wl5MrzOVHSnOWocE9
   l5qY2qtk+qaoL/mqNBlVmbjfloWcGWz4BImusutWLAZRD1IVq/oKy7Jwm
   +bMc2EDpU0Zl78eKZ5ciRbLBRbZ1pm8vhpnjWFL8WVoCGDJLBU0W4PY0T
   C4X2FlWiOtfw1FNeRQl0IgEe5YQ7KXqSJs7J9wXisiKz0HNI+0UBB9E5c
   vgi9A5PWrkWCS2wpDcykbHLhzuHOCj23FI1Fy0OtDIHCx39IdPli9BN76
   ysf5CFhL7ulKxoQjMZ63fAyFINSsdHxJfX9Ur+9Tub6sswqJwqy7kL3dR
   Q==;
X-CSE-ConnectionGUID: u0mdyi6hQI6R89OZgYFpxw==
X-CSE-MsgGUID: YNhRJ5UiRdiT/urOlml8yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9203286"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="9203286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 11:11:50 -0700
X-CSE-ConnectionGUID: KhphbOXDRsqXVxD/ANy1gA==
X-CSE-MsgGUID: Aqkc2LOISz6EvgKHFoVldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="22941390"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Apr 2024 11:11:49 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxWEc-000956-2U;
	Thu, 18 Apr 2024 18:11:46 +0000
Date: Fri, 19 Apr 2024 02:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6378/6705] mseal_test.c:84:59: warning: format
 specifies type 'char *' but the argument has type 'char (*)[5]'
Message-ID: <202404190226.OfJOewV8-lkp@intel.com>
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
head:   7b4f2bc91c15fdcf948bb2d9741a9d7d54303f8d
commit: 87c436bebeeb885b21f47a7dbcfc548e9679c688 [6378/6705] selftest mm/mseal memory sealing
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190226.OfJOewV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404190226.OfJOewV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mseal_test.c:84:59: warning: format specifies type 'char *' but the argument has type 'char (*)[5]' [-Wformat]
      84 |                 if (sscanf(line, "%lx-%lx %4s", &addr_start, &addr_end, &protstr) == 3) {
         |                                           ~~~                           ^~~~~~~~
   1 warning generated.


vim +84 tools/testing/selftests/mm/mseal_test.c

87c436bebeeb88 Jeff Xu 2024-04-15   69  
87c436bebeeb88 Jeff Xu 2024-04-15   70  static unsigned long get_vma_size(void *addr, int *prot)
87c436bebeeb88 Jeff Xu 2024-04-15   71  {
87c436bebeeb88 Jeff Xu 2024-04-15   72  	FILE *maps;
87c436bebeeb88 Jeff Xu 2024-04-15   73  	char line[256];
87c436bebeeb88 Jeff Xu 2024-04-15   74  	int size = 0;
87c436bebeeb88 Jeff Xu 2024-04-15   75  	uintptr_t  addr_start, addr_end;
87c436bebeeb88 Jeff Xu 2024-04-15   76  	char protstr[5];
87c436bebeeb88 Jeff Xu 2024-04-15   77  	*prot = 0;
87c436bebeeb88 Jeff Xu 2024-04-15   78  
87c436bebeeb88 Jeff Xu 2024-04-15   79  	maps = fopen("/proc/self/maps", "r");
87c436bebeeb88 Jeff Xu 2024-04-15   80  	if (!maps)
87c436bebeeb88 Jeff Xu 2024-04-15   81  		return 0;
87c436bebeeb88 Jeff Xu 2024-04-15   82  
87c436bebeeb88 Jeff Xu 2024-04-15   83  	while (fgets(line, sizeof(line), maps)) {
87c436bebeeb88 Jeff Xu 2024-04-15  @84  		if (sscanf(line, "%lx-%lx %4s", &addr_start, &addr_end, &protstr) == 3) {
87c436bebeeb88 Jeff Xu 2024-04-15   85  			if (addr_start == (uintptr_t) addr) {
87c436bebeeb88 Jeff Xu 2024-04-15   86  				size = addr_end - addr_start;
87c436bebeeb88 Jeff Xu 2024-04-15   87  				if (protstr[0] == 'r')
87c436bebeeb88 Jeff Xu 2024-04-15   88  					*prot |= 0x4;
87c436bebeeb88 Jeff Xu 2024-04-15   89  				if (protstr[1] == 'w')
87c436bebeeb88 Jeff Xu 2024-04-15   90  					*prot |= 0x2;
87c436bebeeb88 Jeff Xu 2024-04-15   91  				if (protstr[2] == 'x')
87c436bebeeb88 Jeff Xu 2024-04-15   92  					*prot |= 0x1;
87c436bebeeb88 Jeff Xu 2024-04-15   93  				break;
87c436bebeeb88 Jeff Xu 2024-04-15   94  			}
87c436bebeeb88 Jeff Xu 2024-04-15   95  		}
87c436bebeeb88 Jeff Xu 2024-04-15   96  	}
87c436bebeeb88 Jeff Xu 2024-04-15   97  	fclose(maps);
87c436bebeeb88 Jeff Xu 2024-04-15   98  	return size;
87c436bebeeb88 Jeff Xu 2024-04-15   99  }
87c436bebeeb88 Jeff Xu 2024-04-15  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
