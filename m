Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C8C3D3B8
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Apr 2025 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745747495; cv=none; b=bIU/zkmOGPtvYRPAQOLSKbvHXueGgpdVYQC4PmkAVOj9AwzJ/M/43FX/BKkIVWg5MP4oxh+aK+PXIyhtSRj5Bq9+L6iw1OC6qUMzCs7DbaNJvJHUk8Y7qNAnSiPHNwRKQxWQWXQCU6xYcaySt/uQCJuhbjng6wgH4tr8FGzGzV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745747495; c=relaxed/simple;
	bh=A31zppjWtquxx7x56X93OE9F0ZCu68nxIKEBAGyXUsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ejydnb0VyxDgRgmEse25WwnQSQuZmOEDjV/OLZxjbdRHopwnlDpPRf7kaHyhZYoBFMHnU8w3kH2D+5igh0T7i1W5vAgJjHElQQV7a4JfksxWoSPB0yIAV18GAiGKRMcZJHXcTuHgll0VwUrVuSiXXxBx2xsGUf+ZEhterzgz9W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STqExlXk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STqExlXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745747493; x=1777283493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A31zppjWtquxx7x56X93OE9F0ZCu68nxIKEBAGyXUsE=;
  b=STqExlXkugzS2vN2j8mjA7RFAp/MoUM/028LIcJP8JJTmgn660Xb5D8n
   eK50fvtjJ4/AMudZVfXNQgwuw/jGoA7YLBajHeEBs4oB7/87MUY7qFJBq
   I5KIThh/nIbqpsrJcTcihHcE7VQcZlNVhakA67W6AaNsGX4hp2ls8i35Y
   xk2evb6Rc6LR1PNavafMtnj+KRZQzaoU8gpNF8QU4KLsdq1oEsGKKj01I
   NGJVmFFRJTG7yefuGB3Ctz77FUVAEGwTI3Fou1PNY3mc7h8B5CNmg/9iS
   6C5diyA51I+Jp4Gt4ZRcHUDcaUXQdIuswJVTLbxyg4b1BX/NhUksvpv02
   g==;
X-CSE-ConnectionGUID: cO9iYdv0QVKWnbANLSO90w==
X-CSE-MsgGUID: DSd1RcDQRdOPRW26jOd4FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="51155419"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="51155419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 02:51:32 -0700
X-CSE-ConnectionGUID: yjFmGi2tQnOcnc7wdG+CKw==
X-CSE-MsgGUID: ILZoX7DRT5iNbcCfqhHEBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="138247353"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Apr 2025 02:51:31 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8yfY-0006Dx-2K;
	Sun, 27 Apr 2025 09:51:28 +0000
Date: Sun, 27 Apr 2025 17:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/memory.o: warning: objtool: follow_pfnmap_start+0x114:
 unreachable instruction
Message-ID: <202504271703.67kLsi9J-lkp@intel.com>
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
TO: Peter Xu <peterx@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 6da8e9634bb7e3fdad9ae0e4db873a05036c4343 mm: new follow_pfnmap API
date:   7 months ago
:::::: branch date: 3 days ago
:::::: commit date: 7 months ago
config: loongarch-randconfig-r111-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271703.67kLsi9J-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250427/202504271703.67kLsi9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504271703.67kLsi9J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.o: warning: objtool: follow_pfnmap_start+0x114: unreachable instruction
   mm/memory.o: warning: objtool: vm_insert_page+0x70: unreachable instruction
   mm/memory.o: warning: objtool: vmf_insert_pfn_prot+0x50: unreachable instruction
   mm/memory.o: warning: objtool: vm_insert_pages+0x98: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
