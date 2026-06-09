Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF77A48A2C5
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jun 2026 17:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025864; cv=none; b=r+bUuLTJIrDfAaDO6Y05tYT4qJZHdw8GZDstA0eRtPAdx2a+Xq4U7/JbXq6Yxv8znPh5zEbvCYiELFJjAGeGTar7VfsSb9D8HK91bn75/4Qn6zmyYB0HDKrxUEU/1whDbCcKsXCniWDE9WFFNjzzSG3O+7SPHw9Tc/N7y1fDFho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025864; c=relaxed/simple;
	bh=CV8trbK/TKkUKw8GSJH/6QOAz8pAcopd7bzyFayUvYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rGeMJl3/KD10E3w38eBRWRXw+uUDOIqlZWWVu0ECJWKCmikZl0CO9KzF6vw2FJsIDsZ7Er+yJ0VU/C1F0+oCefuBOtZ3ApNMZA+l5LSlBvDdjB8DYEP12buxuPu/06MA4dueWjXQA+lPMPboF6YhN5QsTTxRj4LZkrg0XmMrhLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwvbFIZP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwvbFIZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781025863; x=1812561863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CV8trbK/TKkUKw8GSJH/6QOAz8pAcopd7bzyFayUvYw=;
  b=LwvbFIZPb3To4AI/zJ5QYcv4G79/Y8hHX9cwPVB/Xt+MEWp3VGDc7goD
   98msVt4N7DtITG7uC5x4wFt7tTbS9KXucVVVsX9E9umua7pYW+xAYx9e4
   LzRHbspfI5NnJvzYajKUCDpmpd1vibBVIu5EwGEEWjdYEI380EcGjihg/
   GZl9S54M/Sc4SlhsBlYde8T9N3SfzAUWXiCzaZ5rHTCQExxEv20ua1gGW
   CTGkPTz9qQOCqt4Amxgv1yhyMw/cybjsMcZgiUJOnDu6HnBzXB3SaNEXt
   dYfC+Pe5MYCg/dm2aKrXXpZufUHad4PSAYhNaIWI3GF58AVpaplS0hWOO
   w==;
X-CSE-ConnectionGUID: G4z1rNP/TamHf1ivr65RJA==
X-CSE-MsgGUID: 943mH9eoQXWGQJ/sz0dlPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92473141"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92473141"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 10:24:22 -0700
X-CSE-ConnectionGUID: cw66k5TLSvmgqcCr8tPbSA==
X-CSE-MsgGUID: u7tQlIcxTU2RCP51YFAHXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="250204927"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2026 10:24:22 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX0BX-000000003U9-0RkC;
	Tue, 09 Jun 2026 17:24:19 +0000
Date: Tue, 9 Jun 2026 19:23:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] lib: interval_tree_test: validate benchmark parameters
Message-ID: <202606091922.G3wiQ6O2-lkp@intel.com>
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
In-Reply-To: <20260609005446.1241288.1525a5964698.interval-tree-test-small-max-endpoint-div0@trailofbits.com>
References: <20260609005446.1241288.1525a5964698.interval-tree-test-small-max-endpoint-div0@trailofbits.com>
TO: Samuel Moelius <sam.moelius@trailofbits.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Samuel Moelius <sam.moelius@trailofbits.com>
CC: linux-kernel@vger.kernel.org

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything next-20260608]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Moelius/lib-interval_tree_test-validate-benchmark-parameters/20260609-090211
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260609005446.1241288.1525a5964698.interval-tree-test-small-max-endpoint-div0%40trailofbits.com
patch subject: [PATCH] lib: interval_tree_test: validate benchmark parameters
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260609/202606091922.G3wiQ6O2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606091922.G3wiQ6O2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606091922.G3wiQ6O2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from interval_tree_test.c:11:
   ../../../lib/interval_tree_test.c: In function 'interval_tree_test_init':
>> ../../../lib/interval_tree_test.c:315:17: error: implicit declaration of function 'pr_warn' [-Wimplicit-function-declaration]
     315 |                 pr_warn("nnodes must be positive\n");
         |                 ^~~~~~~
   ../../../lib/interval_tree_test.c:335:17: error: implicit declaration of function 'kmalloc_objs'; did you mean 'kzalloc_obj'? [-Wimplicit-function-declaration]
     335 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                 ^~~~~~~~~~~~
         |                 kzalloc_obj
   ../../../lib/interval_tree_test.c:335:30: error: expected expression before 'struct'
     335 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                              ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
