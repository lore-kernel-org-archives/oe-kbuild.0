Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE8B38DDE
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex0v++8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701348975; x=1732884975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzyuLLw4F/id+4yMZ01Pvn5YuiFK5ufjWmaI+z8Xr6A=;
  b=Ex0v++8rLu5Ea5uXxSzDa+RpNtt//MZtEw+hOF77/Uf17b6fCPPX/BIr
   d6cUCCMjppSErh8HtLTBfLPpKOJD8rVqYZAA2vN6IGLu34nKodbXLlc13
   RPyWqcUzPbYaS19vbGSNRBWJy7IjtfIeq7CoORIr2CKfLWqLYogGSIvO6
   FRuFUJciaU6RGRR9xjqO636B2H9LZMDCpxchj0Kn+/bDjk0xJDqS3zWcQ
   gYUV5SN1sIMQGPpalwP0sCMj/IGBGEAZHANwrHXZqxyvSgQoQEsh85rIG
   yJNRuEr3y8E9KwuRPNjc9UvlB01vCPIRxX5m0tBjehOG6/r9yFgqnyZ+G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219219"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="219219"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:56:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892799807"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="892799807"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2023 04:56:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8gaP-0001xL-2g;
	Thu, 30 Nov 2023 12:56:09 +0000
Date: Thu, 30 Nov 2023 20:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/atomic/atomic-arch-fallback.h:2397:16: sparse: sparse:
 Trying to use reserved word '__typeof__' as identifier
Message-ID: <202311302059.DvORXXAu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/atomic/atomic-arch-fallback.h:2397:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: d12157efc8e083c77d054675fcdd594f54cc7e2b locking/atomic: make atomic*_{cmp,}xchg optional
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: sparc64-randconfig-r112-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302059.DvORXXAu-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311302059.DvORXXAu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311302059.DvORXXAu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1570:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1571:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1571:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1573:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1574:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1574:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1752:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1752:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1768:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1768:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1777:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1777:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1786:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1786:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1795:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1795:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1849:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1849:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1858:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1858:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1867:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1867:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1876:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1876:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1923:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1923:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1939:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1939:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1948:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1948:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1957:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1957:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:1966:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:1966:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2020:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2020:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2029:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2029:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2038:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2038:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2047:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2047:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2136:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2136:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2152:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2152:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2161:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2170:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2170:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2179:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2179:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2316:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2316:16: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2317:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2317:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2325:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2325:16: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2326:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2326:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2334:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2334:16: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2335:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2335:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2343:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2343:16: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2344:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2344:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2397:16: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2397:16: sparse: sparse: got *
>> include/linux/atomic/atomic-arch-fallback.h:2397:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2397:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2397:16: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2398:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2398:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2406:16: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2406:16: sparse: sparse: got *
   include/linux/atomic/atomic-arch-fallback.h:2406:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2406:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2406:16: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2407:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2407:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2415:16: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2415:16: sparse: sparse: got *
   include/linux/atomic/atomic-arch-fallback.h:2415:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2415:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2415:16: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2416:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2416:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2424:16: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2424:16: sparse: sparse: got *
   include/linux/atomic/atomic-arch-fallback.h:2424:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2424:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2424:16: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2425:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2425:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2480:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2480:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2480:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2482:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2482:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2482:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2483:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2483:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2493:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2493:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2493:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2495:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2495:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2495:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2496:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2496:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2506:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2506:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2506:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2508:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2508:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2508:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2509:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2509:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2519:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2519:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2519:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2521:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2521:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2521:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2522:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2522:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2569:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2569:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2578:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2578:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2587:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2587:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2603:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2603:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2612:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2612:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2621:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2621:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: Expected ) in nested declarator
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: got volatile
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2676:17: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2678:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2678:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2678:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2681:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2681:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2683:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2683:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2683:16: sparse: sparse: got c
   include/linux/atomic/atomic-arch-fallback.h:2684:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2684:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2693:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2693:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2702:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2702:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2710:17: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2710:17: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2710:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2710:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2710:17: sparse: sparse: got }

vim +/__typeof__ +2397 include/linux/atomic/atomic-arch-fallback.h

d12157efc8e083 Mark Rutland 2023-06-05  2392  
d12157efc8e083 Mark Rutland 2023-06-05  2393  #ifndef arch_atomic64_cmpxchg
d12157efc8e083 Mark Rutland 2023-06-05  2394  static __always_inline s64
d12157efc8e083 Mark Rutland 2023-06-05  2395  arch_atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
d12157efc8e083 Mark Rutland 2023-06-05  2396  {
d12157efc8e083 Mark Rutland 2023-06-05 @2397  	return arch_cmpxchg(&v->counter, old, new);
d12157efc8e083 Mark Rutland 2023-06-05  2398  }
d12157efc8e083 Mark Rutland 2023-06-05  2399  #define arch_atomic64_cmpxchg arch_atomic64_cmpxchg
d12157efc8e083 Mark Rutland 2023-06-05  2400  #endif
d12157efc8e083 Mark Rutland 2023-06-05  2401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
