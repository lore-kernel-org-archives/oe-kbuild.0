Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550957;
	b=tUqH2BAQ6DffDswmwQs5Kku8TEjqyDdKWV8sc60XgKqHwJYL0MxzOBANsUPX4Fhr8ry4
	 EiIj7ZPUXttGaVh82HFyZdb62YQCcEiXg0PTTEhlWDQgtyfYNmJOMkJgcyJF7PfOqasYQ
	 mIQ0M+Drse6rJvvWbF2P2FzF/iiAZThDOwBdJGFjatL5XYxeXeM2CsWbDK0KIPkPw3rLR
	 nJ+9OgpUGTsoIMWHRXjVGBOMKZhXM4JMgmEawHp8AiTSAV6q/fLNBLFdkf9O86xcoAlk4
	 WybKwk0qb77GYA5L520PwBFvsL0nmgeZ3h5RdKzAerr9rboyiQ/j4m2nF1ZLwc46Lkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550957;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kEKt1TdkyvanAE889fZuFyaAKCJVhJZJVkJ6LDerMGw=;
	b=sFUQY6hiUz0vPtaV/urIS9oMtnJlrxPHtRmCESUmz4Ns7ySZ8C809XmVTYMuCVjp7+Cw
	 8aqxQmPVdwnJxngM5nYx8WuzimF3kQ+Am8CoUWgM6z/171A1/TO5zZu3UMWS8xNaNdK2F
	 2vuPOjGT7QrbvoLA1eLB9S9kjB2IP328qRhQA7SNQ+/GLZkkxoRilKN3MiYo43J3U7mEb
	 AXdGQXYcaubCaFttag7GYhWRXyn0veOV35pzrkMb8APREnXTWkGPK6fsJXBr9/e/ll9Od
	 Qr9Lslp3UEyRauUdwm18RYzQOCBsUYQG/rLdKZbU7npZ4TZMO3xd275gw20RptKAaBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BrtP14WI;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8411606A31E
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 20:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8411606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BrtP14WI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795550956; x=1827086956;
  h=date:from:to:cc:subject:message-id;
  bh=md/Rbft43xbKsG3pGlzsElpKLsI5m+CqCAwIpEvjBrw=;
  b=BrtP14WIaTs/U/U15dPaplKyz+C2qdATwuZfW9/03nXCOlxXBvfkOmBx
   flE6+dNEo5FVmpG4hm0+y6HLhAN0OQNS9HJbaFMWjQZU788E6Esw9GfLP
   qwA5JtMVgr6c2niK33c8nJJgdO8McekXEgiJEmFT6R+2TjxUNWnSyi9vc
   urdZxPK2/bv/Fnwu+NV2Amsk8lCsfNkL+WBAM8+1t15Wcb+yRd/LRyJaW
   FfJkQIFXVfndkQMj9AZ5O3Au1XW7NDhLVd7JiUJww7nopPt4IpLn712DY
   2Q4dg0VsudiMIA4yoYE0C/O1P2y7Ctm2jLqytlycE/DiNTCewBRjV7hr4
   w==;
X-CSE-ConnectionGUID: bY9LM4mwR5yZQYbQarFaKA==
X-CSE-MsgGUID: 5/2HwNy4T+aNUNCMWN59Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4331437"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4331437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:09:15 -0800
X-CSE-ConnectionGUID: 4cgjxoYSSmuM50zAQyqXrw==
X-CSE-MsgGUID: dOVUi7OiRL6CdpC0OEdAGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11986459"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2026 12:09:13 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVwpC-000000005GD-0IWl;
	Tue, 24 Nov 2026 20:09:10 +0000
Date: Tue, 24 Nov 2026 21:08:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/raid56.o: warning: objtool:
 rbio_sector_index+0x1cc: unreachable instruction
Message-ID: <20261124205924.3Vqixw8h-lkp@intel.com>
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
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
commit: 91cd1b586578017e20103771615db75dd8df5727 btrfs: raid56: introduce a new parameter to locate a sector
date:   1 year ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r2304-20261122 (https://download.01.org/0day-ci/archive/20261124/20261124205924.3Vqixw8h-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124205924.3Vqixw8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 91cd1b586578 ("btrfs: raid56: introduce a new parameter to locate a sector")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124205924.3Vqixw8h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/raid56.o: warning: objtool: set_rbio_raid6_extra_error+0xbc: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: set_rbio_range_error+0x240: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: assert_rbio+0x180: unreachable instruction
>> fs/btrfs/raid56.o: warning: objtool: rbio_sector_index+0x1cc: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: sector_paddr_in_rbio+0x230: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: steal_rbio+0x1c4: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rbio_stripe_paddr+0x1a4: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rbio_add_io_paddr+0x23c: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: alloc_rbio+0x13c: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rmw_assemble_write_bios.constprop.0+0x118: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: set_bio_pages_uptodate+0x170: unreachable instruction
>> fs/btrfs/raid56.o: warning: objtool: memcpy_from_bio_to_stripe+0x1ec: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: finish_parity_scrub+0xa78: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: raid56_parity_alloc_scrub_rbio+0x1fc: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: raid56_parity_cache_data_folios+0x12c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
