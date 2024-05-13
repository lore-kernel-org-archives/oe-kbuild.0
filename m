Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527943AAB
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715600910; cv=none; b=Y9gvfX7uVaUP13chIgP79L4gfvE7STN6wEBnUOMUuxFDwm3fFBkwlGhpTCFWc0Rm6eMeF9xkRmnAzWAGRgcWUgwr+NkeDbPzIb1xNKxRaYGQZeLRes/9QFouyf+8x4wBUylbGAjIPSAN+QdKjw2Jl7AaX1Vh+N5pxkVStMZWkR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715600910; c=relaxed/simple;
	bh=M/GAoJJKqpSsNdhl+GJA9EZBmfU92Kl+VJd2DglrWtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LHTxosu7IBoVF5XTgdtPHZQ8t+Umtb63DAYKW8wDnsAALqOhdkJfsx1gO0OVzJmSqINBY5Gd1hbmm+EjJdhX5Wh80daiQtyn1e8CCngN5UX/p0mttGJ62i5+3TvHpDZHorYEMXe+AEOmivjIkP2h9MaEzw1GRPmTNol6SyMj0SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwvohQds; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwvohQds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715600908; x=1747136908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M/GAoJJKqpSsNdhl+GJA9EZBmfU92Kl+VJd2DglrWtE=;
  b=DwvohQdsQ5sem3UioRNO0CUyLaFKGAu6N03p6E5cYL6w1FZfcDGC2pfb
   K1WtdTYXm5ZNVyKfVojZ6gUljsvBCyKr890bUjBpKCoQDSvyv5D7b/HSK
   YFPiMFPxG2j1zqpasviCC8CG4vsiiGkmKsYBgQWQhfA5Z95NElvjRQx8M
   2mJGj6dsOADkBRn/0K1GQg0ABoH+80BVWUvIavoXVjxodEdVqvozN04Ux
   96gWW0Upoy2WF7NoS9uEH2Qbt6/5OTH6Q/ZtlPe/lRa8BtEmnxz6FwQNA
   KSNFx/sUIGfaP83JQo7Vw9/jw6yV2EGxNIv3IUP8TEge8dbBA2bIFAZbf
   w==;
X-CSE-ConnectionGUID: A8Z8KOLAQZ6O5UufxUkO/w==
X-CSE-MsgGUID: LG36L0+KTCmwTv0mR01gmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22935439"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="22935439"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 04:48:28 -0700
X-CSE-ConnectionGUID: ipD8kuA5RFqP498+p/BZqw==
X-CSE-MsgGUID: CyEbwCbnSyqAagwYwjav7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="67813311"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2024 04:48:27 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6UAK-000A67-1z;
	Mon, 13 May 2024 11:48:24 +0000
Date: Mon, 13 May 2024 19:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:b-4.4-st52-rt49 231/395] kernel/rcu/tree.c: linux/delay.h is
 included more than once.
Message-ID: <202405131926.EpWnrMxy-lkp@intel.com>
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
TO: Ben Hutchings <bwh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st52-rt49
head:   4c5fde95daea7696fb9556a4dc7fd77e7b407a1f
commit: 3c902f7f74c6a9cf8e92589883bab325b42814aa [231/395] rcu: Eliminate softirq processing from rcutree
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405131926.EpWnrMxy-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/rcu/tree.c: linux/delay.h is included more than once.

vim +54 kernel/rcu/tree.c

  > 54	#include <linux/delay.h>
    55	#include <linux/stop_machine.h>
    56	#include <linux/random.h>
    57	#include <linux/trace_events.h>
    58	#include <linux/suspend.h>
  > 59	#include <linux/delay.h>
    60	#include <linux/gfp.h>
    61	#include <linux/oom.h>
    62	#include <linux/smpboot.h>
    63	#include "../time/tick-internal.h"
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
