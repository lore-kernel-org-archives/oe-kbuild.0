Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570269;
	b=rB7VSKDIcAs86xXeYqmepAFuBAT52HaD0N3aVT4TWGHvWuCH01ABfsXhKiMNp6TFKI93
	 +PtzWamIXZLX5mL0+3FCPXjwXCl21aDgIyZttn/yNYNg9zNaBQqxlj8jpcnbL4Po1XHyt
	 vYJ1C+hqJt0grMZplsgp+28/1z0ZACPxmicDa9lBIg2AJ5lOMpEKawVn8yQvh7lM0u9gL
	 l3aZ4tkSzvWeNIB+NjnkBvi3WwXu74yZINIWbMHIHvacsPB8TcpdtE9CYLMSMo38+etrn
	 yqR+Jrvr3uhqxHzpw5EesVM8Bh97SYJkguJKIhMDkSGosP6WdUPl+4NCE7yrsMG5jxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570269;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=V1RxomO2IB91aKqe1VXzV/2LINfHIE252LLX6VrqTME=;
	b=aNTDfrKXgMfuCMM4jzV5fnK9zUnLi7IrkQpzUxZkpIFjwV0EGYmOcyJSmJHSI4QWgDkU
	 MvkBefkVPXV3DH9FeWeWA+sgD8EntEZePizwQ1YDHITYLYqOj0bh0kAHOJWuEugjKSVEw
	 b25BItFveJebrEWsL1rMX8KxhXztoM8HolGWvnsISmdbIEbpMK9cnZFeEXNvfQEYUnJZb
	 47tDZd1/IkWc7J5+CLZG/oLoHLuSfb+4LL+tn/ijbdvZn5GaE784VHuBtVCfsLwBB6BGD
	 W8uqQGh2OBqlcEuqrCrDQtQCrR6QNKjw2Er6I6Nho6JcZTzIvJXPXLbo7snEYHEYalQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Im08SamT;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658AE606A31E
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 01:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Im08SamT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795570269; x=1827106269;
  h=date:from:to:cc:subject:message-id;
  bh=hwvKdK501bIkqZ5rkG9gALa8O7PU71yTjcAEVwxAyJU=;
  b=Im08SamT1S93Gd2hRp2HoE1WaHP1AucqHFfCW8WO1X07WgvA7iguzMHb
   s9nn2b8oeTijYqOcy0U+YLS01DY+NM1HuLuhqGCm1vVmLm+Cf0hiIvra/
   KcmwM1rTV40A/MBXuLMqnvGlzXCmefLfvNtd6CARDsNhfzXTzGkG1sgJQ
   f8H7yY5QYsFO7osciC8qdciECC2BolJzLMR0yaAa1nR1HuEOw89CZWqSE
   JOvxoaNxLPXkCGn6Z8qveVhlNsYGHsBP8OaY/csj0QJ4ycAOHjo5kbvEX
   yYWgVvtN3Zi6updZWOxN/5C7F2bDsZx/kEsH3vRolYJ0V2rV6ebHAjk3c
   Q==;
X-CSE-ConnectionGUID: TeDM7FyOTfWoWdDvF7jPEg==
X-CSE-MsgGUID: xOFyNC0xTXazc/hGDiruGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4408829"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4408829"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 17:31:08 -0800
X-CSE-ConnectionGUID: F0E8k0h7Q0qAkx1Q21LRSw==
X-CSE-MsgGUID: paEkyAAaQbqlepFgroIpww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="13515749"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 24 Nov 2026 17:31:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW1qi-000000005U4-3wJP;
	Wed, 25 Nov 2026 01:31:04 +0000
Date: Wed, 25 Nov 2026 02:31:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/raid56.o: warning: objtool: rbio_paddr_index+0x194:
 unreachable instruction
Message-ID: <20261125015905.a3lsiN6M-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "same reports for this branch"
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
commit: 826325b6d091fdf93cc04fb5e8e462409635a469 btrfs: raid56: prepare generate_pq_vertical() for bs > ps cases
date:   1 year ago
:::::: branch date: 24 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r2304-20261122 (https://download.01.org/0day-ci/archive/20261125/20261125015905.a3lsiN6M-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125015905.a3lsiN6M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 826325b6d091 ("btrfs: raid56: prepare generate_pq_vertical() for bs > ps cases")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261125015905.a3lsiN6M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/raid56.o: warning: objtool: set_rbio_raid6_extra_error+0xbc: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: set_rbio_range_error+0x240: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: assert_rbio+0x180: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rbio_sector_index+0x1cc: unreachable instruction
>> fs/btrfs/raid56.o: warning: objtool: rbio_paddr_index+0x194: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: sector_paddr_in_rbio+0x240: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: steal_rbio+0x1c4: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rbio_add_io_paddr+0x244: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: alloc_rbio+0x13c: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rmw_assemble_write_bios.constprop.0+0x118: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: set_bio_pages_uptodate+0x170: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: memcpy_from_bio_to_stripe+0x1ec: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: step_paddr_in_rbio.constprop.0+0x240: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: finish_parity_scrub+0xa78: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: raid56_parity_alloc_scrub_rbio+0x204: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: raid56_parity_cache_data_folios+0x12c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
