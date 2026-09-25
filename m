Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0C53446CE
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329002; cv=none; b=iZjsVNflamb1Qybi+lJ5YBM8PTQGDQyAxdpSoaMBK5B9oZA1F3Df9fZY5LLSVdZdZRy68rCjj5j3zv3z9TFKR5icJjcemb1x6z7nSiUsMAIfLatbZpNnyrroxQsSn0zJMJw3T1JQ3PQbfDMOjzjVLIp9sRLFYp0uUaxJ5v8YceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329002; c=relaxed/simple;
	bh=9J2CsHyHBli4MZVgWEPfRRx+UW30jYVjAiWyb6CdKEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OdP4WhG/d4H76PrTMyYdMiWIXIsDtwQ7op9U9yQZQvvViR3hIXdOVGMSDXlQl+V2pvqSM5ZCUm7NCsdjf75DMn31pjpEDY+3bijB97/psLm+nvBDOn/P2ms+IONacuYXx4d1qby2Ko8fxHbziSMbigh6qyCBmRsuW4VNenR+do0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gi+b5BnB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gi+b5BnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790329000; x=1821865000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9J2CsHyHBli4MZVgWEPfRRx+UW30jYVjAiWyb6CdKEI=;
  b=gi+b5BnBLtdL6PnbdAq6wdaZYxEgyLJT7kLyexfMJRflVgahGm4gufLY
   wl/rlnwWpF7Ht1kvO12EkmLOw+RaG8w5ZNGrFbpe1zxtnLbF25poPbYco
   xF6nf+Ni2AptVN1S7sFzEsWQd8qn20Ckc117smiAxJ4/bmSMXOR4T757Y
   qgeF6sbzJgFB2fsgg1aBC8lwTBYkisgEAId3kjhDPxOVln1xR2v0i0o3m
   XfWYojgCkKkfg2kMPfbkuLfpTMuIh1FEOMMVcuELxjUhGGfUjGp6yWzYP
   H2GOikZmjrtRXFMCGm3WSBZb55qpFcVszXnYAgpJN0SGtl/7N+Mdjsu8A
   g==;
X-CSE-ConnectionGUID: hRhc2wGiTbCVt58O6jb7Ug==
X-CSE-MsgGUID: fzS7sBsbTSuGkjRspob1MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="102475005"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="102475005"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:36:39 -0700
X-CSE-ConnectionGUID: BOBcvc25QCedw7XVQXlzLA==
X-CSE-MsgGUID: yDjvBQmSRBWLH7bAVq6scQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="277669760"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Sep 2026 02:36:38 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA2M8-000000000fm-2dMQ;
	Fri, 25 Sep 2026 09:36:36 +0000
Date: Fri, 25 Sep 2026 11:36:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH] panic, printk, sys_info: Introduce
 crash_kexec_in_memory_sys_info
Message-ID: <202609251128.QVrNghM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260916201546.661384-1-atomlin@atomlin.com>
References: <20260916201546.661384-1-atomlin@atomlin.com>
TO: Aaron Tomlin <atomlin@atomlin.com>

Hi Aaron,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v7.3-rc4 next-20260924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/panic-printk-sys_info-Introduce-crash_kexec_in_memory_sys_info/20260916-161546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260916201546.661384-1-atomlin%40atomlin.com
patch subject: [RFC PATCH] panic, printk, sys_info: Introduce crash_kexec_in_memory_sys_info
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: sh-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251128.QVrNghM4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251128.QVrNghM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609251128.QVrNghM4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/printk/printk.c:473:6: error: redefinition of 'printk_suppress_console_flush'
     473 | void printk_suppress_console_flush(bool suppress)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:16,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from kernel/printk/printk.c:22:
   include/linux/printk.h:314:20: note: previous definition of 'printk_suppress_console_flush' with type 'void(bool)' {aka 'void(_Bool)'}
     314 | static inline void printk_suppress_console_flush(bool suppress)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/printk_suppress_console_flush +473 kernel/printk/printk.c

e7e070e833ee17 Aaron Tomlin 2026-09-16  472  
e7e070e833ee17 Aaron Tomlin 2026-09-16 @473  void printk_suppress_console_flush(bool suppress)
e7e070e833ee17 Aaron Tomlin 2026-09-16  474  {
e7e070e833ee17 Aaron Tomlin 2026-09-16  475  	WRITE_ONCE(console_flush_suppressed, suppress);
e7e070e833ee17 Aaron Tomlin 2026-09-16  476  }
e7e070e833ee17 Aaron Tomlin 2026-09-16  477  EXPORT_SYMBOL_GPL(printk_suppress_console_flush);
e7e070e833ee17 Aaron Tomlin 2026-09-16  478  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
