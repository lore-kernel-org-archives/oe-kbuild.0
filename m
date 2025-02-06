Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDED222591
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Feb 2025 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878080; cv=none; b=gcrhBW8F26KQZXy7t9UysurfEpYBRZs4tBkyeadfHPrt7mTq5D8YxdhJB39KXhg+99zx3j097mvwaKI7VBAATI5wlu645rY6CKtoii1fmr31uoQeWorUfjkgciIFUhNoUnFSgZLBTJ5Y1i9UrquivWf8SH5qMdmAFqiC7/qtboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878080; c=relaxed/simple;
	bh=3YdX1JRe4MuEOTz+kmVOxe8amL5COyA6X444x2yz9No=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGRsmvltA+9tHfGg2cL3GLOzE/5LxHZ9C8enGcgKys9Lr8ugGz92CGOgmRMa1lrdi0R9HjMUkZr8J3uKaRLW0bdl0k+P78DKbis0XZr8J8xBoezpaIDb4Yieh+rByk+OMrBNaxTaxH+I8ZYUwoHn4P8UED5iGWfk4QKYhkdqhXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idVuxHgb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idVuxHgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738878078; x=1770414078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3YdX1JRe4MuEOTz+kmVOxe8amL5COyA6X444x2yz9No=;
  b=idVuxHgbaOKBcVZFl4ati3YvbY37681M2FVW1Ko0HxZB8Zo3nYWSbPB1
   oOPtKC86XFu8ortgxu9yFtqooyXn8M7VYK3KyIwkgg9nXkImXUp7d5y+b
   w6EXgLhqmMbKcODb+jKsj8/sKniFXxC5NBsPrhLDUipbDMUUmNw9zW7N4
   YirxnF/OrtThI2bx2Q6hz3qq90RTbLcQLZaysDWW9QuyjDVLJmADZdBhO
   TpTW/Zb+sYs+/3l05m0c56MozDkvViHGhJcHcWQE7/6voqmblS6w7ntC+
   8M8TlpXwAaXljj9INcN/TjtiLgZ/bqgV4yt50TCoRYL0erMBSosGqBbG8
   A==;
X-CSE-ConnectionGUID: wgPHVK6dQVi6x8ugCQgF+A==
X-CSE-MsgGUID: nSoTGGcYSdigH1zuZvQ4ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42345010"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="42345010"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 13:41:18 -0800
X-CSE-ConnectionGUID: cdzS0PBVQBibW70FZ9JXmg==
X-CSE-MsgGUID: rqzgocPFSKmiCwFAxSwYCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116528534"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 13:41:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg9cY-000xMS-0e;
	Thu, 06 Feb 2025 21:41:14 +0000
Date: Fri, 7 Feb 2025 05:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:x86/ibt 7/9] arch/x86/include/asm/ftrace.h: asm/ibt.h
 is included more than once.
Message-ID: <202502070504.4DtpgX6x-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   57750f0464beab3927ad570e0c1b5e78c91dd1b6
commit: c5a15175c3560f7ec5cacfca9fd72655b7f55742 [7/9] x86/ibt: Clean up is_endbr()
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502070504.4DtpgX6x-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/include/asm/ftrace.h: asm/ibt.h is included more than once.

vim +5 arch/x86/include/asm/ftrace.h

     4	
   > 5	#include "asm/ibt.h"
     6	#include <asm/ptrace.h>
     7	
     8	#ifdef CONFIG_FUNCTION_TRACER
     9	#ifndef CC_USING_FENTRY
    10	# error Compiler does not support fentry?
    11	#endif
    12	# define MCOUNT_ADDR		((unsigned long)(__fentry__))
    13	#define MCOUNT_INSN_SIZE	5 /* sizeof mcount call */
    14	
    15	/* Ignore unused weak functions which will have non zero offsets */
    16	#ifdef CONFIG_HAVE_FENTRY
  > 17	# include <asm/ibt.h>
    18	/* Add offset for endbr64 if IBT enabled */
    19	# define FTRACE_MCOUNT_MAX_OFFSET	ENDBR_INSN_SIZE
    20	#endif
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
