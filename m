Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECC227EFE1
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 22:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755901398; cv=none; b=S1I5pUD7TvhZJbOFSL40xV7RienudTlF3OtX7ql10o1z0VEyJVjxVYpH3Qq5wSjzr/Ui6Md9KFA0CzPTPC5DH7XLHvIyyTylvSzVdNPsP4w081yrKs6i5BZQA8MdKwKzRwxCqfFl8k9kCgMhIrThQvdejgImbhd+jOCbGsV3itg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755901398; c=relaxed/simple;
	bh=Aj6tJAwrff3G3BKvJzuMhLbErm6f8cJ04+zoBMvmfQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ki/yWYZ53GPC2S6ClW5jcpCGcp5uG1dMlA/UPZucXUlNzrwVuBBxMeXsXhbZnPTA1HsuPuc2Uc2Yk14bTVIPBjJfXpLydEqi3bkhOA1tPQPNzL1HoSAPdpUenAm50hYPasXBOctqws9HgZN8J7nghLbJDuWblchc+d0rvGVzgQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2ji9Ct/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2ji9Ct/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755901397; x=1787437397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aj6tJAwrff3G3BKvJzuMhLbErm6f8cJ04+zoBMvmfQ8=;
  b=O2ji9Ct/DiCy6uNQjsuXbWUGmcpmC+ODPmjmnJwF2sX+yyZ1XGvU420Z
   wF+GM+m9/+l9/nttBDkXM23ICdq8H5lhu9/gNNjsulpC1WXLxdQUu0KA/
   c4AzUHGrNGRFMrDy88tDONxk5pLY+s/DXKxuNzXFOTMoZMQRBLmlsdWpA
   +gBVFMvgjsHuDgjmvyLrk6NEnpJsz8yyZR6vkR5184ilABEroL2P4PkQJ
   EHzpYUvHZmlv9G1mze8sEu8P6yXrUjwVzfrKsOXcyCcTbMQ+IIXI2ttn5
   lKTxfoBG1c5OMwGKRBNZ+kyayxBWqu9IEjhj70FYBOwN5JUPViBvoYt6z
   g==;
X-CSE-ConnectionGUID: HD/JrBuiQ6u9e2ngaC5kFg==
X-CSE-MsgGUID: Du1e6DeCQoaQMiPm1dOoQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58279578"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58279578"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 15:23:16 -0700
X-CSE-ConnectionGUID: eaOl2X09Tyeykqdw6+tkQQ==
X-CSE-MsgGUID: h5rJ18DJQNybCmk0ySt27A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174080636"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Aug 2025 15:23:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upaAC-000LsR-2i;
	Fri, 22 Aug 2025 22:23:12 +0000
Date: Sat, 23 Aug 2025 06:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 220/233] arch/powerpc/include/asm/pgtable.h:221:2:
 error: call to '__compiletime_assert_345' declared with 'error' attribute:
 BUILD_BUG failed
Message-ID: <202508230648.Fjn1AFGm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Rohan McLure <rmclure@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Andrew Donnellan <ajd@linux.ibm.com>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   a8af4c2fd982fd94fffde3c5b6b764fd20af68fe
commit: e1bd32dafdb91b68262596ba5fa3da08a0d0e68f [220/233] powerpc: mm: add pud_pfn() stub
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: powerpc-randconfig-003-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230648.Fjn1AFGm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230648.Fjn1AFGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508230648.Fjn1AFGm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:42:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
>> arch/powerpc/include/asm/pgtable.h:221:2: error: call to '__compiletime_assert_345' declared with 'error' attribute: BUILD_BUG failed
     221 |         BUILD_BUG();
         |         ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:166:1: note: expanded from here
     166 | __compiletime_assert_345
         | ^
   1 error generated.


vim +221 arch/powerpc/include/asm/pgtable.h

368a0590d954a6 Aneesh Kumar K.V 2023-07-25  216  
e1bd32dafdb91b Rohan McLure     2025-08-13  217  #ifndef pud_pfn
e1bd32dafdb91b Rohan McLure     2025-08-13  218  #define pud_pfn pud_pfn
e1bd32dafdb91b Rohan McLure     2025-08-13  219  static inline int pud_pfn(pud_t pud)
e1bd32dafdb91b Rohan McLure     2025-08-13  220  {
e1bd32dafdb91b Rohan McLure     2025-08-13 @221  	BUILD_BUG();
e1bd32dafdb91b Rohan McLure     2025-08-13  222  	return 0;
e1bd32dafdb91b Rohan McLure     2025-08-13  223  }
e1bd32dafdb91b Rohan McLure     2025-08-13  224  #endif
e1bd32dafdb91b Rohan McLure     2025-08-13  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
