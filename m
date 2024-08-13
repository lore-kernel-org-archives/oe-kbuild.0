Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA78185606
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Aug 2024 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723542741; cv=none; b=N6EckLDY55lPnOV0o8E5Ejr/8aUBVbZahNBG8XBhKXCHjMi0e/mgauXe1mYm8QHEBQYNU4hLage3QKacJyxjCWTkzwYL9CMm6XQ2O/bg5o7VyQ+TeMLSKdHFFXzeWj3eVVumqN5OAZOk4NuM5PHJGgZzpiNzDKOfzwV/eXdJpOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723542741; c=relaxed/simple;
	bh=LOp6p6Yjzyy2U1inu0d+S3CeWuIKp7vc5nmR8jDHaxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjK6claEpDuqWS/987FO/AZTDZ4TkbWogmyVSmadPBV7uHWi4HSjcaCKlcMtLC9dgb6YQcdFocmYJlnv5mNt4upAmrMT/JG7QmhWZTUZ52j25yMCuwnUeMEakE7YpcBSQIQQCW7C9q8RWkFRBEt/5yKm/wTvwRw8gNUW5S0RBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmpo+4Qt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmpo+4Qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723542739; x=1755078739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOp6p6Yjzyy2U1inu0d+S3CeWuIKp7vc5nmR8jDHaxM=;
  b=nmpo+4QtkDH/hMnPlRPR0Td0m09G46RLtxMmW29LBxHw8mG1JuxT1CMe
   n/nslj47e+EnzoDLK/aGCC48lZ7WpMDv2IqGCZ77QP9p5tCalCikwXF+8
   yvmQ85AuJKRO4wnfQu38PdEa0lPZ38vKZkLVrR3ud34ip7U3HrWn2rB1q
   oh5JEyWmJZ4w3Ioz8MFYWYGW1qUUXvUPj1DsUlP1c24xIo1iG4bKLnJQt
   nfXlI3YI31DpL5ffS9qw8Z3x9FThe2tOlBrKbN3SBAFHttIRyNjAIy/IV
   c4xmQ678OBljwlUJjTSmQ1W6fTZi5oP6OQZHwHVfb9NLhoDNXI00LJ25W
   w==;
X-CSE-ConnectionGUID: 18f4G4uAT5qyHIDrM2HXkA==
X-CSE-MsgGUID: FI3rHFkeRvSndn6Ob3UCBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21563213"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21563213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 02:52:18 -0700
X-CSE-ConnectionGUID: 8Z7fULWISM2xnXPTMLsBDw==
X-CSE-MsgGUID: POWXYMQFRmGaDXe+dTg83g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58298546"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Aug 2024 02:52:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdoCN-0000KE-0Z;
	Tue, 13 Aug 2024 09:52:15 +0000
Date: Tue, 13 Aug 2024 17:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/memory_hotplug.o: warning: objtool:
 mhp_init_memmap_on_memory+0x1bc: unreachable instruction
Message-ID: <202408131715.s4goZUuA-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d74da846046aeec9333e802f5918bd3261fb5509
commit: 503b158fc30f203a1854c87183ca3467c6466001 mm/memory_hotplug: initialize memmap of !ZONE_DEVICE with PageOffline() instead of PageReserved()
date:   6 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-002-20240813 (https://download.01.org/0day-ci/archive/20240813/202408131715.s4goZUuA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408131715.s4goZUuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408131715.s4goZUuA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory_hotplug.o: warning: objtool: do_migrate_range+0x394: unreachable instruction
>> mm/memory_hotplug.o: warning: objtool: mhp_init_memmap_on_memory+0x1bc: unreachable instruction


objdump-func vmlinux.o mhp_init_memmap_on_memory:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
