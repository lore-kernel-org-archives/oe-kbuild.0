Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503AA3128CF
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 16:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332138; cv=none; b=S4zGxCmYbr+DoAYlBkSSAaXc9sxIAdE9BuVngd+pVhuALHeojpjrvtT7exYkSxB/R2oPgnqClFCpHwl9FET3995eTtq1KzRdFJSXqd6GUFqgmiyyntwjkfZ7Ovk3Gint4RSE9Yg+BdC3Gr4qIYpQcdyD1umr3rriSyzJxqlNg2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332138; c=relaxed/simple;
	bh=gyTbEDkwEVnRt2QOOftj0SUyxeqlw4Qg2EBhQSoyPDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUjC8xuQ0yxePHIQKg9UEQblatMVzj5HEpczDiIyFeQ1pYlwui/7rdESAYZZ7RtIu+jYRk4tjeWj7TG3qj2HxFvNkVKOmrmCijETWqSvhcjWbjdPdoCR0K768uvnHgr5JrZuvH+5MqOg6SG315PwQ5MnS3V9cnR/v6vFDRRzf1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHJcVXXy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHJcVXXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780332138; x=1811868138;
  h=date:from:to:cc:subject:message-id;
  bh=gyTbEDkwEVnRt2QOOftj0SUyxeqlw4Qg2EBhQSoyPDo=;
  b=FHJcVXXyGaFS5QNH57HOH2KMaYpazXL9dY7jvas8pSqSqra1FwfrZSRW
   1yPGzw0n7EjiwZHYdI61mLjDpPIofY2zCZ8WoRpiQHrnKCFtXijWpVV5v
   qb7pnozsXSXzbrtxzr2LnNiIe/Hmck1Py+wZRKT4CAbDujUAXmlkDDeNp
   GlwKGlUEY2rjtLtcsB6tcB/m1z2VDcrkbXSqYFfLsZ2T9Os9ZAfW+k5CU
   UscrmPwxXTfoz3f3PITwB6uT6z9KM0IfwkAaQUF2EVPPc4NfBOO8k5Y2P
   UMzW4uRb4k86B+45ZgeeMSj7mwttKoY8QvzGPcigvTCjJ2pSlCcKjpXvu
   g==;
X-CSE-ConnectionGUID: m9XXxpAoSbOm7yrfafLtyA==
X-CSE-MsgGUID: TTBaIBixT+CPywV2cSNJWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80827836"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80827836"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:42:17 -0700
X-CSE-ConnectionGUID: HOfEiBTcSja7QIJ2Jea/HA==
X-CSE-MsgGUID: mmFcdRkWQm2VYr8tewE06A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="248542742"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 01 Jun 2026 09:42:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU5iQ-000000001c5-0jem;
	Mon, 01 Jun 2026 16:42:14 +0000
Date: Mon, 01 Jun 2026 18:41:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: robust_list.c:430:33: warning: unused variable '_metadata'
Message-ID: <202606011804.gDiLqnRk-lkp@intel.com>
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
TO: Wake Liu <wakel@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Wake-Liu/selftests-futex-Migrate-futex_requeue-to-harness/20260601-150833
head:   b572cc113a3cc5d5658eda5743fb1770fad497c9
commit: b572cc113a3cc5d5658eda5743fb1770fad497c9 selftests/futex: Migrate robust_list to harness
date:   10 hours ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260601/202606011804.gDiLqnRk-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011804.gDiLqnRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606011804.gDiLqnRk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   robust_list.c: In function 'child_lock_holder':
>> robust_list.c:430:33: warning: unused variable '_metadata' [-Wunused-variable]
     430 |         struct __test_metadata *_metadata = cargs->_metadata;
         |                                 ^~~~~~~~~
   robust_list.c: In function 'child_circular_list':
   robust_list.c:526:24: warning: storing the address of local variable 'a' in 'head.list.next' [-Wdangling-pointer=]
     526 |         head.list.next = &a.list;
         |         ~~~~~~~~~~~~~~~^~~~~~~~~
   robust_list.c:518:28: note: 'a' declared here
     518 |         struct lock_struct a, b, c;
         |                            ^
   robust_list.c:517:40: note: 'head' declared here
     517 |         static struct robust_list_head head;
         |                                        ^~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
