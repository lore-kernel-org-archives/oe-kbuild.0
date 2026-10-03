Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B937D24E016
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 00:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988111; cv=none; b=IDGtJcIWSHb0vQ0QsGoP+h+NN7cu7AF1KHF1L9/i3DUcUb4fPLV4isal6IX8irOcWgGEh7XgYEszw+HrLC4x4mMsjOaiFb71t1ksPy2uEDqJZE1LSWcFYstGr1kUn+4kGlalqgReUDpN4EhOeTGd2/5x9P8o/UMvfAZ4ojoqri4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988111; c=relaxed/simple;
	bh=KucVhov7Txf3g/qvGNvI/qlFDoonU+A1f2jOBcpXVjQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U0U9fNaxwcC5Ft5Xa0dD/Ygjo+zckIKVDSBhYT8W8v7Q1FkFPB61whtQvNyz7l/W9nCWo40PkPfr5M8x87kRc0ZzYvjwfzhKGKLzpvHE33SPAyrWpOlU0RruXF9ItrDcG1K316bt0rgZuu0rXSSaPLqwTh7o7uv7QDmgotb8fTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X71vuFW6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X71vuFW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790988106; x=1822524106;
  h=date:from:to:cc:subject:message-id;
  bh=KucVhov7Txf3g/qvGNvI/qlFDoonU+A1f2jOBcpXVjQ=;
  b=X71vuFW6pMGW0WJuxFTjcFA3pSsg8cNx4rN38q1fGbXLSwF3HNSoIdFH
   vCd8vQX0VjPq3PqXUmlHAqTY8b/1f/tBIVY6ASnKd8n6gUFYrxp/bxLn4
   BbZe1gIaXNdynVY0dxzRhQnVR7VUqSYv76DBT+2O0RH7KPlforZul7j75
   tg3o+l7DC0SpFUaGj96tztdUB+zLv7Ztk6PpHUlYeCmY5qL+z38uBdIxl
   zZ8XtDHK32XS7ocNr6/2fZ/fPAn3tU3uvyNg9I9QcVvtxRItspFFpx62J
   cSKPhE11CaFr6ZU9CjJV4ClHXa68oDaoQJ8YYzOM+i1bxfEBl4x0TB/0+
   w==;
X-CSE-ConnectionGUID: rb6VgLI7S7apv+vJ+gRCiQ==
X-CSE-MsgGUID: B1OwOdYjQBC4c2nmWWonJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="91781077"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="91781077"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 17:41:44 -0700
X-CSE-ConnectionGUID: sWYQ9NgfRJ6Q60dNwlv8IQ==
X-CSE-MsgGUID: j9m40opRRkSQzjX/WrQifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="454837"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 02 Oct 2026 17:41:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCnor-00000000TcX-0ACd;
	Sat, 03 Oct 2026 00:41:41 +0000
Date: Sat, 03 Oct 2026 08:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error:
 vmlinux.a(arch/sparc/kernel/trampoline_64.o):(.data+0x684): unknown
 relocation (801) against symbol prom_entry_lock
Message-ID: <202610030802.2e9fM8jA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Magnus-Lindholm/sparc64-return-from-the-generic-clear_page-implementation/20261002-181423, commit: dabe506a4d60b648422055fd406f41fc50fed87b"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Magnus Lindholm <linmag7@gmail.com>
CC: 0day robot <lkp@intel.com>

Hi Magnus,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Magnus-Lindholm/sparc64-return-from-the-generic-clear_page-implementation/20261002-181423
head:   36c6f9a194a35dc53086ef2afa50bd6e9747a0a8
commit: dabe506a4d60b648422055fd406f41fc50fed87b sparc64: honor queued spinlock layout in secondary startup
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20261003/202610030802.2e9fM8jA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030802.2e9fM8jA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030802.2e9fM8jA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(arch/sparc/kernel/trampoline_64.o):(.data+0x684): unknown relocation (801) against symbol prom_entry_lock
   ld.lld: error: vmlinux.a(arch/sparc/kernel/trampoline_64.o):(.data+0x894): unknown relocation (801) against symbol prom_entry_lock
   ld.lld: error: undefined symbol: sys_call_table32
   >>> referenced by arch/sparc/kernel/head_64.o:(.text+0x20fc) in archive vmlinux.a
   >>> referenced by arch/sparc/kernel/head_64.o:(.text+0x2104) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
