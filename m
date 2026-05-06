Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD373DA5BC
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060359; cv=none; b=Vr1pe4q3Ih43a7hZOVnEssUKWLXddNFQrkFa+t+lz9xHdc5VX6SPEpkHuoMbaY13FThim5/x4uneDugRMl7+f/Z4RSeA6wKO1oFuBn5RQ+C9q177Ad4Bc0gmK5kZ2BC9j0G65B6chWf4rYzTD8zttKKozLJbkpZgB+2K+qf9YHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060359; c=relaxed/simple;
	bh=XqBa3Y+Jec+KN01pafkU1n2NNzvrQDql9VuhhA1ma/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U+LOZQF/cL+gFxseGxB8AFdzLiLPkaYIzJEJKhFnPMH8iiXa2rKKvRQ5KI6c604lYFsvEk1qzkBBm+BvY7kUgb61jyZhjeB0cRAG8LBfRVv/QkwN5Uj57MRdtGwA2y5RSsoxIPrRe+U1bM4jhvzbMPDraYwvw27vwB277/G96ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIUM46Qk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIUM46Qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778060359; x=1809596359;
  h=date:from:to:cc:subject:message-id;
  bh=XqBa3Y+Jec+KN01pafkU1n2NNzvrQDql9VuhhA1ma/A=;
  b=GIUM46QkETm+4yPP6C1kSKJOdpskdOnIELFwa3eeA4MXsdpP+cF2iKx2
   rOsAs0rCqtRAKjPV54Wf7QPH/ELChalbEyNI9iq2ytBkz0H6W49ZHExbp
   XoryKbkc+aBKZ0jMkZHi/w2WJE/6eHgXQ9cebLK7R5SfXIgO0a7aGSENh
   vaiioPWUyH6DMfUl0n2XeF6KhDyoe1oYLBzpuyYZaQBbG66F1GExdcOC4
   lPrPYqa00KhzGRylVdMhqQe2oLP+swpBMYUmF+MR02v5zZfC6N2J6TZwP
   tkTXLCHxhL1YR1SlBmFn5T8tZsr3gm9hRD1RzfUWIMetAavox5fxgt5Hc
   g==;
X-CSE-ConnectionGUID: grc4AqmiTfeP7dBjKG0kDQ==
X-CSE-MsgGUID: E1BMJujiSF2unJAUUxTgsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78875525"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78875525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:39:19 -0700
X-CSE-ConnectionGUID: wWnMCg8FQpGnptgfAX0I7w==
X-CSE-MsgGUID: KI7jaDKiRvyi0ZqB97HT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="235982665"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 06 May 2026 02:39:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKYip-000000006Xf-07J8;
	Wed, 06 May 2026 09:39:15 +0000
Date: Wed, 06 May 2026 11:38:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:timers/cleanup 18/37]
 ../../../lib/rbtree_test.c:7:10: fatal error: linux/timekeeping.h: No such
 file or directory
Message-ID: <202605061153.2ASX2v95-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   53bcd35f2ff331adc7277b797333287028c91655
commit: a352497a8a258a45f82a910b3bb1a50a6c7a9f5a [18/37] lib/tests: Replace get_cycles() with ktime_get()
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260506/202605061153.2ASX2v95-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061153.2ASX2v95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605061153.2ASX2v95-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rbtree_test.c:11:
>> ../../../lib/rbtree_test.c:7:10: fatal error: linux/timekeeping.h: No such file or directory
       7 | #include <linux/timekeeping.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from interval_tree_test.c:11:
>> ../../../lib/interval_tree_test.c:7:10: fatal error: linux/timekeeping.h: No such file or directory
       7 | #include <linux/timekeeping.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
