Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487989;
	b=Wg+mDk32R+l0hR5pnuc7MKsklvlVsQYaTsTFGeID0Uj7hCuRMKtdwyEK/heyR26Tbgtd
	 VyvzGskoKauUC3qS/sjtDGh5hoFHRzqBZHFGz3yDq/35F1eyhQXvtO3wcIX7SKhnydQc1
	 5XZIvlbaVP8jYqO8tPBh3+u763QsVuPi4beBJYCU1pd/OXcEeZptuOOvPil+HKX7ljClh
	 CltD+rj0k2/FpKx3JhkGF4pLPolCtN4td0WqB8vmOVBGAsOdDVMvzG7r8XS6WFp5dfV/a
	 mmf/ViPvkktWuQpBjuGt8bvbbeZmnbcTF77+Ofbz+EmrG+apEeMibVSQYKtfeoJUKmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487989;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sHngzuxGX51lAvLBOOvB4CtVY071mueWwBSPkh9BKpQ=;
	b=c1TUBwPmNd1HfU3JChJntetwOQk6NN43uFUIiIctsBJ3Xg2QqhQSf2/Fa+CdVb9tygQD
	 CCr8beJzqSdxYyDIpGL1j9HD61dpBeaBLqMCfs5YXuUp9qEEDIF1gWrLh/vZkHNIhcZ9M
	 nugrsTamB3ZAAED7baQRxxOmKLe1+49D5xhN121IDfAV1fE1w2YwKUCTEoyfO4qU2y37A
	 /+jj6qChNhEDZd/g7JOSpo48Sn/OB6g+8f7vH9ph8GczHs7g4euj0v7scbkh28mPu7Zp8
	 Gdt4DW3sF+qNH5BGDHPVdhyIRufwh8LvJI6y2uiXssHNwAQAFCWzyqVo3RZ97YIW1pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FetrjzVS;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7C6606A321
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 02:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE7C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FetrjzVS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795487989; x=1827023989;
  h=date:from:to:cc:subject:message-id;
  bh=kg+WyohqN5p0dHTM4vuTLQLP/hjmULoM4ftfGT8WFQE=;
  b=FetrjzVSvz+zqzEPkm0a4gKTFc+h91u2pG6Ls89eqy0s3KP2tA0qBiby
   hj/6cdkT15hHbxweG1yIUVVz6Hapk7u5YDvsRTQzEPng33KyeLCSxj0/N
   Bru2L1ttHjp7fxN19tNShSZnC/PMqsPkhE5rzbZHVF+HUwQ7OZl6J6kBL
   jH9RfoBfqUw/ztRAckAJnsHiCfYu8L5EjhwXVudBzivzxAUHKq/2Kga9Z
   gYsdNSx/1D5Db2B+wVHRqA9GjdrWx8c4YR9isCb+l/RWRtUQnHJhZaruY
   CPqXNe9P6hlqlsvbyfhen62nCMXW603vkQ2kKXmv46G2mADb1dUQ+oARW
   A==;
X-CSE-ConnectionGUID: ag8EM08LQ7+bM9bsagOj0w==
X-CSE-MsgGUID: hkL5QUiGRbW+P7GMpFeZaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4201766"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4201766"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:39:49 -0800
X-CSE-ConnectionGUID: 6F/8sxnBSby9nv/KHgtLWg==
X-CSE-MsgGUID: e5+azMFlTwmG7yz6MiM8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13443116"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Nov 2026 18:39:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVgRd-0000000056U-35LU;
	Tue, 24 Nov 2026 02:39:45 +0000
Date: Tue, 24 Nov 2026 03:39:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/raid56.o: warning: objtool:
 set_bio_pages_uptodate+0x16c: unreachable instruction
Message-ID: <20261124033045.zeT89dJM-lkp@intel.com>
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
head:   b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
commit: 1810350b04ef38b375c64304e142de96d90404e1 btrfs: raid56: move sector_ptr::uptodate into a dedicated bitmap
date:   12 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2304-20261122 (https://download.01.org/0day-ci/archive/20261124/20261124033045.zeT89dJM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124033045.zeT89dJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1810350b04ef ("btrfs: raid56: move sector_ptr::uptodate into a dedicated bitmap")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261124033045.zeT89dJM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/raid56.o: warning: objtool: set_rbio_raid6_extra_error+0xbc: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: set_rbio_range_error+0x240: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: assert_rbio+0x180: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rbio_stripe_sector_index+0x1c8: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: sector_in_rbio+0x230: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: steal_rbio+0x1c4: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rbio_add_io_sector+0x23c: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: alloc_rbio+0x13c: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: rmw_assemble_write_bios.constprop.0+0x118: unreachable instruction
>> fs/btrfs/raid56.o: warning: objtool: set_bio_pages_uptodate+0x16c: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: finish_parity_scrub+0xa88: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: raid56_parity_alloc_scrub_rbio+0x1fc: unreachable instruction
   fs/btrfs/raid56.o: warning: objtool: raid56_parity_cache_data_folios+0x12c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
