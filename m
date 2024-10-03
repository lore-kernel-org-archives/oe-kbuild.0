Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9993713FEE
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 04:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727930657; cv=none; b=UTm4jBAFTDhbkPP8T6LFvfSJAr+J9vcr1+/m2hFkr2iVNpzNHQ9LF3/7ViOZ7CAMPj+LkGcEYxlo5dKInqE8BCmqOSlnGms1LG9mloL0mfSSxNiPPlbHa+NmMY+VWcP5Hz+jbfVf2J1Fbv46tdmlnj0OuIunrJORGJL6Dgq/uWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727930657; c=relaxed/simple;
	bh=OY4efiqnoMOdPHsPbWJaKsFJGhj+TRQVI0JsLw+TR24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gyrVR+76g2It6iLj1PPbPkAOdDBpbzXUL1JoLuRHXq+DuUNtlfs0p+dob95U5ElPz/3MeGw4oCZAYVaqTnVH4wWEBcWcxJgTaidq7X+q5M6dI72i5B4Ou85RDPQuFo5/h0qnm1WU2NNeeSGs0MWqNKHRl0l7iDtJTnHv7rhr9MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CR3ahQlo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CR3ahQlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727930656; x=1759466656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OY4efiqnoMOdPHsPbWJaKsFJGhj+TRQVI0JsLw+TR24=;
  b=CR3ahQlopzGeGhnxA7ukO5Et/YEGzpV5MkHptmwctAhTncG5tHoDdqqP
   bf9RkSsqA7naA2Ir05/YCVcPWP4R6zcFIh9Wo4xVZ1newKYhTAZOHrON2
   low+e0a6O/kOOe91+v5fkIb6LmhrOfrkC5nGczyYfXbsW/z9kXu+zBDre
   uLo234BGSQgl1h/nmDq5NHpJjbofxyEqmF0BWvCFQl8jbaoMe8Toxiz22
   sZa6VVX9mwtPBJURsbwq4sSEOsMJN/f3zVCVpdZERvWkKTRs1nReHD173
   yD+0LzqLQ3sW3ecMKyZjCIZK7R9zMYw658ceaayepGxUKuZShspqZ0h2B
   Q==;
X-CSE-ConnectionGUID: Lo68rRMDQk2WpGfWdN+VFg==
X-CSE-MsgGUID: a3azfPZYQuCcgR148aPmCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="29988768"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="29988768"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 21:44:15 -0700
X-CSE-ConnectionGUID: VNgaE1oTSlOk6sBFdONIrQ==
X-CSE-MsgGUID: JsvmudAWTNuQwQbjUg1aeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74653937"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2024 21:44:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swDhD-000034-34;
	Thu, 03 Oct 2024 04:44:11 +0000
Date: Thu, 3 Oct 2024 12:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/gup.o: warning: objtool: faultin_page_range+0x70: unreachable
 instruction
Message-ID: <202410031237.pbHqnJBr-lkp@intel.com>
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
TO: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ec462100ef9142344ddbf86f2c3008b97acddbe
commit: 631426ba1d45a8672b177ee85ad4cabe760dd131 mm/madvise: make MADV_POPULATE_(READ|WRITE) handle VM_FAULT_RETRY properly
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241003/202410031237.pbHqnJBr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031237.pbHqnJBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410031237.pbHqnJBr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/gup.o: warning: objtool: sanity_check_pinned_pages+0xc4: unreachable instruction
   mm/gup.o: warning: objtool: faultin_page+0x170: unreachable instruction
   mm/gup.o: warning: objtool: __get_user_pages+0xb8: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages_remote+0x1c8: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages+0x174: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages_unlocked+0x18c: unreachable instruction
   mm/gup.o: warning: objtool: __gup_longterm_locked+0x588: unreachable instruction
   mm/gup.o: warning: objtool: populate_vma_page_range+0x68: unreachable instruction
>> mm/gup.o: warning: objtool: faultin_page_range+0x70: unreachable instruction


objdump-func vmlinux.o faultin_page_range:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
