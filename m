Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFF31922FA
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 01:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747272882; cv=none; b=ugUkP/U97YONJakeJNGQrtvgRiSJ0uTqGte2Fgab+jROcAknEZyRoXLJDEN2nnx1KdlpYpBVqPD6QhqxOd0oMFUSDkcQhh/E1Sg17oOmSX9LEFIVtUS5BiKW+LoTwo2l4bDiC2qB22agoJkaym3QA/nw7nvI+5jk5RGoIB9NdSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747272882; c=relaxed/simple;
	bh=agjbfnIHl77QI5Thz0IpwcADR+OZV+SLkdw8zzehB/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAu/6gaSoSbY5WDPRdBnNG7i1MGC7Lb1eU9vTv5ydaOpM0NegQJ0xRFqvQXQV2ah3pR+i/8YlgIoGIbdY1GPQc/c9OPbP4ag73iuObmo9LETXoL6M+ypmHoueOIsf/8pBf0O/5T4LpuwqclAeiq3lvsqFuhYsMcFXIvFCuahZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RX5tnpNy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RX5tnpNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747272881; x=1778808881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agjbfnIHl77QI5Thz0IpwcADR+OZV+SLkdw8zzehB/A=;
  b=RX5tnpNyh3RZincVyts+gP5wgEIIEKhOAUdfpWtxo6XugbLhSki9rFUz
   f5Sl5DnF43zjeLeGbRs7k+6wxMPngXP4Ss5s4IHsxzpN+/8xbRuaS2CGR
   QOXZWajVRtxWsY4dfIhf44ZytO2XxX3HIB+Hyfta9MCMZhghHx/CUEbeQ
   V4Vqq2FCCkTQ5ibgME8UB7DExiGg8nmVSd2SdWPJNAXfHz/dT1SqauPhC
   vzZmfwxE0ge4lClffFVYBTHsXTZ291EGhq7+YDL4SzRRCgVw6WN+UTQLk
   v6A95QZOlSYVIC6U882oxZftEHDQp4Cg0b2CBsbFgHuMWOO/Hxtz9N8yx
   A==;
X-CSE-ConnectionGUID: G4ZlWyYTQ8+w73AslC91DQ==
X-CSE-MsgGUID: amEUnu4xRsCkXFcY9Nnoaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49091702"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="49091702"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 18:34:40 -0700
X-CSE-ConnectionGUID: qAHzzSCNSLuuHfgml5NM/Q==
X-CSE-MsgGUID: 5i0apZMkQ4a7JkPOlSnkFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138084337"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 May 2025 18:34:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFNUZ-000HlT-2f;
	Thu, 15 May 2025 01:34:35 +0000
Date: Thu, 15 May 2025 09:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 316/331] mm/zblock.h:24:2: sparse: sparse: This
 PAGE_SIZE is not quite supported yet
Message-ID: <202505150903.S2xO4CSx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/zblock.h:24:2: sparse: sparse: This PAGE_SIZE is not quite supported yet"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Igor Belousov <igor.b@beldev.am>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   4cce057ec568285d32565e0a74661eb834bd1032
commit: dd9d5caf3458e30d119165917f17359cb9f12099 [316/331] mm-zblock-avoid-failing-the-build-fix
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: mips-randconfig-r112-20250515 (https://download.01.org/0day-ci/archive/20250515/202505150903.S2xO4CSx-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250515/202505150903.S2xO4CSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505150903.S2xO4CSx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/zblock.c: note: in included file:
>> mm/zblock.h:24:2: sparse: sparse: This PAGE_SIZE is not quite supported yet

vim +24 mm/zblock.h

15c4e007248772 Vitaly Wool   2025-04-12  16  
15c4e007248772 Vitaly Wool   2025-04-12  17  #if PAGE_SIZE == 0x1000
15c4e007248772 Vitaly Wool   2025-04-12  18  /* max 128 slots per block, max table size 32 */
15c4e007248772 Vitaly Wool   2025-04-12  19  #define SLOT_BITS 7
15c4e007248772 Vitaly Wool   2025-04-12  20  #elif PAGE_SIZE == 0x4000
15c4e007248772 Vitaly Wool   2025-04-12  21  /* max 256 slots per block, max table size 64 */
15c4e007248772 Vitaly Wool   2025-04-12  22  #define SLOT_BITS 8
15c4e007248772 Vitaly Wool   2025-04-12  23  #else
dd9d5caf3458e3 Andrew Morton 2025-04-28 @24  #warning This PAGE_SIZE is not quite supported yet
fec91b2ff37dca Igor Belousov 2025-04-28  25  #define SLOT_BITS 8
15c4e007248772 Vitaly Wool   2025-04-12  26  #endif
15c4e007248772 Vitaly Wool   2025-04-12  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
