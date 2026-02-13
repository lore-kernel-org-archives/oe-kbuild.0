Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0751261B9B
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770973826; cv=none; b=dTnSrjNRhg+mfqwnui8UUPkuwgeZg3RrBmP/WgprYCQo265wMMrsetksZTteddOgaspufLfdJOAi1WpkTFpifhLCz3nhSebvJFyAOn8/JbRqsdndwuswYobpzLn1V7R8UnU8rjwK/f4cPlc/ls6nMOm3ALLVZQzl8yJXFL1xXQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770973826; c=relaxed/simple;
	bh=loVv02u3TynOdsT665lqQf6LoyEovCq2D4FQAu543kU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/99IF/X5h0Fasp1/i9IJXEBlwJoHp6R7QpqPb6Vun6B3Voo7zVHQD4qDO84GCtwoiLwXDaW9VHxYeDhPvOnun4sIKyyoby9VTxbCVjaqp+e8pAIs1P9nI6R9WdCe1AxFy2XjO43fG6ehy6vo5ic/SweW3lsJCQnITq9ErVRuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7EZNTit; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7EZNTit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770973825; x=1802509825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=loVv02u3TynOdsT665lqQf6LoyEovCq2D4FQAu543kU=;
  b=U7EZNTitcPYvwRxrVa2zOcsXkJydiRjMx8lAjmhB0gVxsiYF/+GXhauv
   zR5kKzahe0kleOAU77a5w/mdVd5cO6PS//ZwHfs9+YAkPTr4CD6HhEopd
   QmjDJ+D/p31jWm8frZoIiO/n7sv22hjHsNTgATGr5mzz0UDlwNNgYmJGm
   w0T5/yEXBoELxckcmMriP9+XT0jEfArEW3iqZ1TNcAjc1QrT+WVWHu/a+
   2fqqgnShBPy/LOPY8Kin0aSptX4NPlW2GNw6HoqfMJvm+6czbKtI4qNK9
   sZOvRzXhssp9ojsftZ2WiWoQJ/x6n5YKi9lYOYiHLB5fJfMvQ7vc1Nr+1
   g==;
X-CSE-ConnectionGUID: +p39rH7+Qhu+tou+004kTw==
X-CSE-MsgGUID: Jr/oxkgxQ+qlwA1iDrffLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="97614658"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="97614658"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:10:24 -0800
X-CSE-ConnectionGUID: ZS2bRAXaTd6UUhQ+AAskJw==
X-CSE-MsgGUID: g2gypbI9RI6x3/2xyxh2TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212117107"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2026 01:10:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqpBs-00000000vFu-1w2a;
	Fri, 13 Feb 2026 09:10:20 +0000
Date: Fri, 13 Feb 2026 17:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 2/4] crash: Exclude crash kernel memory in crash core
Message-ID: <202602131740.rGD89wwq-lkp@intel.com>
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
In-Reply-To: <20260212101001.343158-3-ruanjinjie@huawei.com>
References: <20260212101001.343158-3-ruanjinjie@huawei.com>
TO: Jinjie Ruan <ruanjinjie@huawei.com>
TO: corbet@lwn.net
TO: skhan@linuxfoundation.org
TO: catalin.marinas@arm.com
TO: will@kernel.org
TO: chenhuacai@kernel.org
TO: kernel@xen0n.name
TO: maddy@linux.ibm.com
TO: mpe@ellerman.id.au
TO: npiggin@gmail.com
TO: chleroy@kernel.org
TO: pjw@kernel.org
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: alex@ghiti.fr
TO: tglx@kernel.org
TO: mingo@redhat.com
TO: bp@alien8.de
TO: dave.hansen@linux.intel.com
TO: hpa@zytor.com
TO: akpm@linux-foundation.org
TO: bhe@redhat.com
TO: vgoyal@redhat.com
TO: dyoung@redhat.com
TO: rdunlap@infradead.org
TO: kees@kernel.org
TO: elver@google.com
TO: paulmck@kernel.org
TO: arnd@arndb.de
TO: ruanjinjie@huawei.com
TO: fvdl@google.com

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes arm64/for-next/core tip/x86/core linus/master v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/powerpc-crash-sort-crash-memory-ranges-before-preparing-elfcorehdr/20260212-181247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260212101001.343158-3-ruanjinjie%40huawei.com
patch subject: [PATCH v5 2/4] crash: Exclude crash kernel memory in crash core
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-r071-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131740.rGD89wwq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602131740.rGD89wwq-lkp@intel.com/

smatch warnings:
kernel/crash_core.c:201 crash_exclude_mem_ranges() warn: we never enter this loop

vim +201 kernel/crash_core.c

02aff848053381 Baoquan He  2024-01-24  189  
6d859d47931b2a Jinjie Ruan 2026-02-12  190  	/* Exclude crashkernel region */
6d859d47931b2a Jinjie Ruan 2026-02-12  191  	ret = arch_crash_exclude_mem_range(&cmem, crashk_res.start, crashk_res.end);
6d859d47931b2a Jinjie Ruan 2026-02-12  192  	if (ret)
6d859d47931b2a Jinjie Ruan 2026-02-12  193  		return ret;
02aff848053381 Baoquan He  2024-01-24  194  
6d859d47931b2a Jinjie Ruan 2026-02-12  195  	if (crashk_low_res.end) {
6d859d47931b2a Jinjie Ruan 2026-02-12  196  		ret = arch_crash_exclude_mem_range(&cmem, crashk_low_res.start, crashk_low_res.end);
6d859d47931b2a Jinjie Ruan 2026-02-12  197  		if (ret)
6d859d47931b2a Jinjie Ruan 2026-02-12  198  			return ret;
6d859d47931b2a Jinjie Ruan 2026-02-12  199  	}
02aff848053381 Baoquan He  2024-01-24  200  
6d859d47931b2a Jinjie Ruan 2026-02-12 @201  	for (i = 0; i < crashk_cma_cnt; ++i) {
6d859d47931b2a Jinjie Ruan 2026-02-12  202  		ret = arch_crash_exclude_mem_range(&cmem, crashk_cma_ranges[i].start,
6d859d47931b2a Jinjie Ruan 2026-02-12  203  						   crashk_cma_ranges[i].end);
6d859d47931b2a Jinjie Ruan 2026-02-12  204  		if (ret)
6d859d47931b2a Jinjie Ruan 2026-02-12  205  			return ret;
6d859d47931b2a Jinjie Ruan 2026-02-12  206  	}
6d859d47931b2a Jinjie Ruan 2026-02-12  207  
6d859d47931b2a Jinjie Ruan 2026-02-12  208  	/* Return the computed number of memory ranges, for hotplug usage */
6d859d47931b2a Jinjie Ruan 2026-02-12  209  	if (nr_mem_ranges)
6d859d47931b2a Jinjie Ruan 2026-02-12  210  		*nr_mem_ranges = cmem->nr_ranges;
6d859d47931b2a Jinjie Ruan 2026-02-12  211  
6d859d47931b2a Jinjie Ruan 2026-02-12  212  	return 0;
6d859d47931b2a Jinjie Ruan 2026-02-12  213  }
6d859d47931b2a Jinjie Ruan 2026-02-12  214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
