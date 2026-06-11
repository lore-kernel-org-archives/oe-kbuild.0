Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C1C48B37F
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 18:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203317; cv=none; b=uMqrfjnvkXYdCMkLHPrc/1LaV6WwC5n+3IZlzjBhHS5PnLQyqCk+wQ+TAGVrga+aclc3jAH5iJvnxFhmxZPnA0V7Nt2VILj9aBLnMG8c3so9HROdyDDG7yFJoaTQHLMz16CjEL/NtYrosWaUm7zFOxKjCOtzbQGesd7DYH7YKik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203317; c=relaxed/simple;
	bh=fsKjuS1uruc7eNQF4s3i/kZPRYCIi6PC82q28LjWYV4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OstGIOf7wEluKuH8kp1xdvN151EBIuoLNq3F0peOjeOF535cYpJntDTgGaW5QeBC6JLKi0D52Sho6pFHJh0gcxSIths2gxT8NW1bg4hQ+VTr6YN1zWVVxTAM9YTAQyOnuzxUWGiT3JdAhumzsHr6DHympJ4ysENhShbl4D9EMYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DT3ApeN3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DT3ApeN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781203316; x=1812739316;
  h=date:from:to:cc:subject:message-id;
  bh=fsKjuS1uruc7eNQF4s3i/kZPRYCIi6PC82q28LjWYV4=;
  b=DT3ApeN3250HEGSBpNKzqwGc8GaRIYcCSIoSNHnLLyK6h58alVlUEfZG
   bQGf7WZQHaivSIWd0m7ftyZghLYy8/y7Y0wjfIdOflf7m4WHStcLDm8Rx
   TYEo3y2RUVZBIjZgE1Kwr2lU6wcVIRW2L70sM0QMLW6jpvSka/c1unk3v
   4Z7WAFMYeRXEmUmeRoP0W08EsSlbYQyMCTV7Xo5+8oP/+srYexjzKexvd
   1Gm3biTTeq0Lz6R5FO/95DAY/I8jmg6YGxx5zGsDx+LD3S/JcFyyJXPcV
   N7MvITdSXwbK9JRouxk4Usn/xvoIbr/IClbLi5V5pDFvqJEgd1G2mKrMn
   g==;
X-CSE-ConnectionGUID: GqdBpQQkTjmejmHgjP0UIw==
X-CSE-MsgGUID: 6fWsTVGFS4+oWdyD//wTMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85927042"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="85927042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:41:56 -0700
X-CSE-ConnectionGUID: gt1Br/rAQbKd5nnrymdmNA==
X-CSE-MsgGUID: DnC/ndNhR9G87UpulHSH5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="248458328"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2026 11:41:54 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXkLg-0000000044H-1JYK;
	Thu, 11 Jun 2026 18:41:52 +0000
Date: Thu, 11 Jun 2026 20:41:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../../../mm/vma.c:237:39: error: passing argument 2 of
 'vma_interval_tree_insert' makes pointer from integer without a cast
Message-ID: <202606112006.j27mTCQl-lkp@intel.com>
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
TO: Huang Shijie <huangsj@hygon.cn>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Huang-Shijie/mm-use-mapping_mapped-to-simplify-the-code/20260611-142755
head:   ee7e1033fa7e44f962fe205a7d73aa57c32212c7
commit: 03841aac8b72f5d6c35b17d268eb5466cf2559e7 mm: use get_i_mmap_root to access the file's i_mmap
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260611/202606112006.j27mTCQl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112006.j27mTCQl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606112006.j27mTCQl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from main.c:10:
   ../../../mm/vma.c: In function '__vma_link_file':
   ../../../mm/vma.c:237:39: error: implicit declaration of function 'get_i_mmap_root' [-Wimplicit-function-declaration]
     237 |         vma_interval_tree_insert(vma, get_i_mmap_root(mapping));
         |                                       ^~~~~~~~~~~~~~~
>> ../../../mm/vma.c:237:39: error: passing argument 2 of 'vma_interval_tree_insert' makes pointer from integer without a cast [-Wint-conversion]
     237 |         vma_interval_tree_insert(vma, get_i_mmap_root(mapping));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   In file included from vma_internal.h:60,
                    from shared.h:11,
                    from main.c:3:
   include/stubs.h:261:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     261 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
   ../../../mm/vma.c: In function '__remove_shared_vm_struct':
>> ../../../mm/vma.c:251:39: error: passing argument 2 of 'vma_interval_tree_remove' makes pointer from integer without a cast [-Wint-conversion]
     251 |         vma_interval_tree_remove(vma, get_i_mmap_root(mapping));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   include/stubs.h:266:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     266 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
   ../../../mm/vma.c: In function 'vma_prepare':
   ../../../mm/vma.c:323:41: error: passing argument 2 of 'vma_interval_tree_remove' makes pointer from integer without a cast [-Wint-conversion]
     323 |                                         get_i_mmap_root(vp->mapping));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/stubs.h:266:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     266 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
   ../../../mm/vma.c:326:41: error: passing argument 2 of 'vma_interval_tree_remove' makes pointer from integer without a cast [-Wint-conversion]
     326 |                                         get_i_mmap_root(vp->mapping));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/stubs.h:266:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     266 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
   ../../../mm/vma.c: In function 'vma_complete':
   ../../../mm/vma.c:345:41: error: passing argument 2 of 'vma_interval_tree_insert' makes pointer from integer without a cast [-Wint-conversion]
     345 |                                         get_i_mmap_root(vp->mapping));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/stubs.h:261:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     261 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
   ../../../mm/vma.c:347:41: error: passing argument 2 of 'vma_interval_tree_insert' makes pointer from integer without a cast [-Wint-conversion]
     347 |                                         get_i_mmap_root(vp->mapping));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/stubs.h:261:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     261 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
