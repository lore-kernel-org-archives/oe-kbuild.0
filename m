Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2152629C
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Apr 2025 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745762932; cv=none; b=oWdXk02Hmn345ZvyDbuYzLYqmnAWRVtWjVas/B3y9AGQ7+IJMBQWBzfJlDPOpf5CnPfrpmg2kdKpo3YVmqBjrEH0awGx3MEu8FNo0WBtc0FKI1GJ7kKcmNjJSgnXx6uvPQdmyC+khIPBiuFNPH652GZzQunCS/3eZs3aBsrBXwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745762932; c=relaxed/simple;
	bh=1fv2B0mTjvLDvnNSdDnm8U5fQ4GyLNHBQS5xTU8Ji6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aTsg/rRqFZOwCGX7z/dx4VJnVG2n5DwzdA1+JZivjyATAH+ppwah/CLPa7Bmp9XcztnjI5rJLZGTyHAPI6eoBes1w1emRSv0qvgpnIOZmHOjxeHavYlTPi6fbViB2PaKdoIF4c0zG4KY1Vo4Cdw9vZPntpxxkHNFH0TjtqSYPtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+7NiWQl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+7NiWQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745762930; x=1777298930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1fv2B0mTjvLDvnNSdDnm8U5fQ4GyLNHBQS5xTU8Ji6k=;
  b=J+7NiWQlKMT8jy3uWEX/2zLDfe/A4XX6abN3L1hNfFg0eviUcyc5SMkH
   75wejYdDndToRy4Ej7NAS4McqcOI3Kg9jVFmojv1eGi6TDoQqiIxZ0t+b
   fv96jM2Rx11DMnTVXZdHRdtx9DPmAFnbi6ntebTFGtm+uXFnIZgpqA7bD
   B5Maa/g3it2r4HS4QAt/9hlP2OXbtmt6I+3B/58hZcN98yaMOZzAUnQnL
   C3cZufJavkRhFHMeRPHYoDgTMkVD8CDmBxNUacUUDdmMCpJZf/8VM0lA7
   BnagtOYAlH2mnWxnwccfhVCQzQMJ48y/7HXYADpfh6KYyinNUK2RKfRYp
   A==;
X-CSE-ConnectionGUID: Hy9WU/vDTLaNynK0TdjxbQ==
X-CSE-MsgGUID: 0PZaBeS/RKSyY0gk3Vuynw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47449828"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="47449828"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 07:08:50 -0700
X-CSE-ConnectionGUID: ZEbckSkfQri6GdSZ//ps+A==
X-CSE-MsgGUID: lFoYCq/sTniY2W3l+ol/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="138118660"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2025 07:08:48 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u92gY-0006Kx-0E;
	Sun, 27 Apr 2025 14:08:46 +0000
Date: Sun, 27 Apr 2025 22:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/gup.o: warning: objtool: gup_fast_pgd_range+0x200: unreachable
 instruction
Message-ID: <202504272110.MRchMcYT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 06e24745985c8dd0da18337503afcf2f2fdbdff1 objtool: Remove annotate_{,un}reachable()
date:   5 months ago
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r111-20250427 (https://download.01.org/0day-ci/archive/20250427/202504272110.MRchMcYT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250427/202504272110.MRchMcYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504272110.MRchMcYT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.o: warning: objtool: gup_fast_pgd_range+0x200: unreachable instruction
   mm/gup.o: warning: objtool: __get_user_pages+0x2e0: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages_remote+0x16c: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages+0x148: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages_unlocked+0x144: unreachable instruction
   mm/gup.o: warning: objtool: __gup_longterm_locked+0x12c: unreachable instruction
   mm/gup.o: warning: objtool: faultin_page_range+0xec: unreachable instruction
--
>> mm/slub.o: warning: objtool: do_kmem_cache_create+0x1a8: unreachable instruction
--
>> arch/loongarch/kernel/alternative.o: warning: objtool: copy_alt_insns.isra.0+0x1b4: unreachable instruction
   arch/loongarch/kernel/alternative.o: warning: objtool: apply_alternatives+0x168: unreachable instruction
--
>> fs/notify/notification.o: warning: objtool: fsnotify_peek_first_event+0x38: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
