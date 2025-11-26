Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E72DD60E
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157491; cv=none; b=lDkvHNN0mRXxm4xhMUUXiZPKE8km5XLcFDrcwk6qQ8qqg8xa77h0MvCf++HKpWjPoFwwcctWaYazBDLX6ahpFfhjslF9x6qKjyIXqnFuxrYIzPxUzdnNPmhHRRv4l7UUG8BtXDom3NrcUB6W73ZBiI0QONsCzlE5CeAL/JgVWu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157491; c=relaxed/simple;
	bh=G2GDlqO6ezja3OtsvIMkriUgKKDKh+iFgvqj/gu9uSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJvlRrYtu+dcJ3lowu9aQVsbiPBWPCz4nJaoXQh8B5RT+H8t+Jtra56loLmGomVV7quH0X0HbGo9KKp1vMTY3bvaAQpwVZgH5hXtZVwdxBpB4enelgZCdWaS+GSTTA095NOPq2nUZZJezuKw1qtRsK4MjzNQZEzj+jcj0jNMLS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEM78zy9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEM78zy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764157490; x=1795693490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2GDlqO6ezja3OtsvIMkriUgKKDKh+iFgvqj/gu9uSU=;
  b=XEM78zy9dlqweWpk/PUrPkQ9w9tApRk5CSvqIbXc7IOoEiW45GGOtt1/
   N3jidOlObrlgFf1UOsJWQ6xZ2PuZ0zVVOzXkljhTmNNVEJOSgF4dKAFUC
   DmdAAQGAoyFxm8pWa3uoPWfLwYfxBGyQtlPT6iSPiq7sHkQd/50tw1f7u
   w7MkOwZUnPpNuBiArb9SBqOE6YERtO0GCTzCYWneEqdqcB01fcYSN7nbd
   oZcTwSjlZ2QnObq4DjXurCg0xx6mNw8ksed0Czfv0jPELJuP8JVR45apT
   9KxpKubxvhfY2D3OssV2cbsxb0/y+FkJbNk6T/Pp7hj6KMKsCcwAdmKyI
   A==;
X-CSE-ConnectionGUID: E6YprscqQQGvALB5BNx/Zw==
X-CSE-MsgGUID: MzSC0rpRSKOvmpe75lRBlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="70055381"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="70055381"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 03:44:49 -0800
X-CSE-ConnectionGUID: bEi/S42oSiuoWR5S+Pw3Ng==
X-CSE-MsgGUID: IYjBzm1RTryCjpoD4ay9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="223638541"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2025 03:44:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vODwz-000000002mr-385S;
	Wed, 26 Nov 2025 11:44:45 +0000
Date: Wed, 26 Nov 2025 19:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/cma.c:316 list_insert_sorted() error: uninitialized symbol 'mlp'.
Message-ID: <202511261934.hxXdI3xi-lkp@intel.com>
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
TO: Frank van der Linden <fvdl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   30f09200cc4aefbd8385b01e41bde2e4565a6f0e
commit: c009da4258f9885c5a3749fc004870db9c0e7a99 mm, cma: support multiple contiguous ranges, if requested
date:   8 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r071-20251126 (https://download.01.org/0day-ci/archive/20251126/202511261934.hxXdI3xi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511261934.hxXdI3xi-lkp@intel.com/

smatch warnings:
mm/cma.c:316 list_insert_sorted() error: uninitialized symbol 'mlp'.

vim +/mlp +316 mm/cma.c

c009da4258f9885 Frank van der Linden 2025-02-28  296  
c009da4258f9885 Frank van der Linden 2025-02-28  297  /*
c009da4258f9885 Frank van der Linden 2025-02-28  298   * Helper function to create sorted lists.
c009da4258f9885 Frank van der Linden 2025-02-28  299   */
c009da4258f9885 Frank van der Linden 2025-02-28  300  static void __init list_insert_sorted(
c009da4258f9885 Frank van der Linden 2025-02-28  301  	struct list_head *ranges,
c009da4258f9885 Frank van der Linden 2025-02-28  302  	struct cma_init_memrange *mrp,
c009da4258f9885 Frank van der Linden 2025-02-28  303  	bool (*cmp)(struct cma_init_memrange *lh, struct cma_init_memrange *rh))
c009da4258f9885 Frank van der Linden 2025-02-28  304  {
c009da4258f9885 Frank van der Linden 2025-02-28  305  	struct list_head *mp;
c009da4258f9885 Frank van der Linden 2025-02-28  306  	struct cma_init_memrange *mlp;
c009da4258f9885 Frank van der Linden 2025-02-28  307  
c009da4258f9885 Frank van der Linden 2025-02-28  308  	if (list_empty(ranges))
c009da4258f9885 Frank van der Linden 2025-02-28  309  		list_add(&mrp->list, ranges);
c009da4258f9885 Frank van der Linden 2025-02-28  310  	else {
c009da4258f9885 Frank van der Linden 2025-02-28  311  		list_for_each(mp, ranges) {
c009da4258f9885 Frank van der Linden 2025-02-28  312  			mlp = list_entry(mp, struct cma_init_memrange, list);
c009da4258f9885 Frank van der Linden 2025-02-28  313  			if (cmp(mlp, mrp))
c009da4258f9885 Frank van der Linden 2025-02-28  314  				break;
c009da4258f9885 Frank van der Linden 2025-02-28  315  		}
c009da4258f9885 Frank van der Linden 2025-02-28 @316  		__list_add(&mrp->list, mlp->list.prev, &mlp->list);
c009da4258f9885 Frank van der Linden 2025-02-28  317  	}
c009da4258f9885 Frank van der Linden 2025-02-28  318  }
c009da4258f9885 Frank van der Linden 2025-02-28  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
