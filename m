Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991C1853
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 00:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733012273; cv=none; b=QBvehs3FuETFXGz7t1MDDHlS2qfGc9SSPj2ysY9UzlYx12udC/IwXuu6kJ4RG2cs5dhDlf1DOJLA+53+C0bvF+ZfRBUZaqpxmbkU25EMlj6hZBpE1huT6gjCbr/BFt0iP3tC1xVubQCJ04bQrp5igjqE6tLkjwjsitc7wa70gR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733012273; c=relaxed/simple;
	bh=nxte8hMCCFDkuA+uLnN3XmaURoktsk/nDP7zTBabOS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OJRJ2okn0cPDXpZeE90+gJPmPpqywqZiBLt+qXUpupRHdgtKptw/Tv6c1naj5FQtQ190uUZHtpamhAp3LVjsl2nOMAL+yqO9ePXhDUBbp4LfQTNbnDg7CX/vrys8QtCEZ+UweOFPd/L+EY6eCSE2NoDmflt8ZmmRCOFhA366e4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCY/SmlA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCY/SmlA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733012272; x=1764548272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nxte8hMCCFDkuA+uLnN3XmaURoktsk/nDP7zTBabOS4=;
  b=cCY/SmlAPdDF1lLHyEc5MjTrJhgJACzJGH3HKpI7UxL5dpiUUhjintjV
   z2dGycGIFPuVhGiPMyJHNgjlzoZ8cGz27FFLcGe3e2takf3KcM+YVK5I4
   WUd7vWzNZIjuO1n/EE37X1ReO4l3axLaZb+EAaQmrU0gGwjBtrsaE0WLc
   L1nMHtHWdtHAnG879FpDbHKQeNqp4Vn4u/h+LEg+T1BpJTsJkC3nrqWAS
   sPZ1E9p9n40jr5tGKMTL1SRb8AVf8Z/k099DCOwqs0dBeDTzK3B4y15qz
   6g8JiQ1JsTqrhPWEETcTftuiJLhgTlSNwn5EUnPvx5aFGrEjhkkVAVP6u
   w==;
X-CSE-ConnectionGUID: p91NqcAPReyOQk0eaf2Nzg==
X-CSE-MsgGUID: RiRn4dsJQ8663FBBQkidbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="55690487"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="55690487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 16:17:51 -0800
X-CSE-ConnectionGUID: 8anIjic4QG+tAiFcxhW4gw==
X-CSE-MsgGUID: JMz3cfPRS4SFeleV1EdsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="93592775"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Nov 2024 16:17:50 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHXeO-00014D-2Q;
	Sun, 01 Dec 2024 00:17:33 +0000
Date: Sun, 1 Dec 2024 08:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/mm/init.c:1110 create_linear_mapping_page_table() warn:
 iterator 'i' not incremented
Message-ID: <202412010817.w64vhDHe-lkp@intel.com>
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
TO: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d8b78066f4c9c8ec898bd4246fc4db31d476dd88
commit: 8589e346bbb679cf7a4b564f75295d94250058f0 riscv: Move the linear mapping creation in its own function
date:   1 year, 7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 7 months ago
config: riscv-randconfig-r073-20241111 (https://download.01.org/0day-ci/archive/20241201/202412010817.w64vhDHe-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412010817.w64vhDHe-lkp@intel.com/

smatch warnings:
arch/riscv/mm/init.c:1110 create_linear_mapping_page_table() warn: iterator 'i' not incremented

vim +/i +1110 arch/riscv/mm/init.c

8589e346bbb679 Alexandre Ghiti 2023-03-24  1103  
8589e346bbb679 Alexandre Ghiti 2023-03-24  1104  static void __init create_linear_mapping_page_table(void)
8589e346bbb679 Alexandre Ghiti 2023-03-24  1105  {
8589e346bbb679 Alexandre Ghiti 2023-03-24  1106  	phys_addr_t start, end;
8589e346bbb679 Alexandre Ghiti 2023-03-24  1107  	u64 i;
671f9a3e2e24cd Anup Patel      2019-06-28  1108  
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  1109  	/* Map all memory banks in the linear mapping */
b10d6bca87204c Mike Rapoport   2020-10-13 @1110  	for_each_mem_range(i, &start, &end) {
671f9a3e2e24cd Anup Patel      2019-06-28  1111  		if (start >= end)
671f9a3e2e24cd Anup Patel      2019-06-28  1112  			break;
671f9a3e2e24cd Anup Patel      2019-06-28  1113  		if (start <= __pa(PAGE_OFFSET) &&
671f9a3e2e24cd Anup Patel      2019-06-28  1114  		    __pa(PAGE_OFFSET) < end)
671f9a3e2e24cd Anup Patel      2019-06-28  1115  			start = __pa(PAGE_OFFSET);
c99127c452484a Alexandre Ghiti 2021-06-29  1116  		if (end >= __pa(PAGE_OFFSET) + memory_limit)
c99127c452484a Alexandre Ghiti 2021-06-29  1117  			end = __pa(PAGE_OFFSET) + memory_limit;
671f9a3e2e24cd Anup Patel      2019-06-28  1118  
8589e346bbb679 Alexandre Ghiti 2023-03-24  1119  		create_linear_mapping_range(start, end);
671f9a3e2e24cd Anup Patel      2019-06-28  1120  	}
6f1e9e946f0bc3 Anup Patel      2019-02-13  1121  }
f2c17aabc917e1 Anup Patel      2019-01-07  1122  

:::::: The code at line 1110 was first introduced by commit
:::::: b10d6bca87204cdafd0cd7aaa837ad30b4eb8c20 arch, drivers: replace for_each_membock() with for_each_mem_range()

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
