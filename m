Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1409E1F2361
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 05:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596691; cv=none; b=eFOmDSqPbxXiprVgUJk8/lFLJCiSUFKF3iKQXTXlQp5kHjTMZpEJvhjWqSJ1tpD+svziP71w3W+q5AS3Ulc4FQkuNJjIt8YgPsgakG+shq9M34F4zTjMGtw6y0ZZWarEEmxUEn/66zPfOXKhN9NQTEUXt7woI0CU9nKhqxj7kVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596691; c=relaxed/simple;
	bh=IyrvqzBByNRWYr7iB6mQjIw0EVZdCuwqSkD8gBxrIJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ace7EpbE4aoix3bImTFQr+4qydGLhCsD93c3oQp9SlOowH++zuUl/DQCbmJ8x2JQGjS3sQAIHF3M7gIdmPRouxY0U8t8kF0LaNKANkXIBULvtVDFAH7XYuMeANws0FFV7yCEyqSVZsDnDMntMlRO//yyiSME1OUjS/FOZVX2DTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7SyaadI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7SyaadI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596690; x=1778132690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyrvqzBByNRWYr7iB6mQjIw0EVZdCuwqSkD8gBxrIJA=;
  b=V7SyaadISaMtUUo3/Gx21wjWbipYR2mOsrfgoaAkV9h5vqeaCZ67phPG
   09AdRh8TgwB5mM8uMZ8AelKz8jLckobMAhoL29q1EmFoX3M8n2lYBFI1g
   YK+OOlyKHKgwb77otrl6yxecwyitLMjhkH6ts6Cai4pclryQYoC4gGe7J
   Qa2UnMvtqlGmM8V6WGVYVwIL8HoPXpFw9SpUBSBs1Y8WvFJMP5z8r4Px0
   zdIpuBtYp/oydTmU7BQI0NnsjQuxQnZz5ZAdYxCSgcj+voRND8eqsPpyJ
   09gq97ZrN/cOSR8ctcqixDwWSt5jflEp476cGaFJQES6dwORrLdbCGdY+
   Q==;
X-CSE-ConnectionGUID: wSpqv5hqRy+I6PLwn5en6Q==
X-CSE-MsgGUID: eLfYb7acRNqZwypNRWrcbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48202518"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48202518"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:44:47 -0700
X-CSE-ConnectionGUID: iSYV1cdxQ8GiX94ea4I0Pw==
X-CSE-MsgGUID: BS2bylw7TnyCziVbhbJUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135844097"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2025 22:44:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXaG-00076U-04;
	Wed, 07 May 2025 05:44:44 +0000
Date: Wed, 7 May 2025 13:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2050/8679] Warning:
 drivers/gpu/drm/imagination/pvr_mmu.c:233 Excess struct member 'pvr_dev'
 description in 'pvr_mmu_backing_page'
Message-ID: <202505071357.k14EEQl9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: fc862949a35aa4d5e92a10c64c620cde350bd511 [2050/8679] scripts/kernel-doc: switch to use kernel-doc.py
:::::: branch date: 20 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250507/202505071357.k14EEQl9-lkp@intel.com/config)
compiler: clang version 19.1.1 (https://github.com/llvm/llvm-project d401987fe349a87c53fe25829215b080b70c0c1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071357.k14EEQl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071357.k14EEQl9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:233 Excess struct member 'pvr_dev' description in 'pvr_mmu_backing_page'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'sgt' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'sgt_offset' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'l1_prealloc_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'l0_prealloc_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'l1_free_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'l0_free_tables' description in 'pvr_mmu_op_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
