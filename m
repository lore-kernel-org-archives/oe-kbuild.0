Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329500;
	b=wi7ktB2jPHth7A/KiHGDHjf8CL2ksk+MLRZKPltd3/Ky1e7eVqls6Ni+PJ//C4xPCmIX
	 RyaPeZWjehnqXiMoHqqHjxFNR07b/8rNuQ7ONr9jGi+fToIXf+kT+A3ZB8giKKaxqVU/s
	 PC6ULHCaV0lX2XOaZNo1z9X7Z1we8pudCZNmFYYMATGpJ2o5FA73aI0RNCxUzl67u2s+R
	 2xEozfAGpBwwkinQy+/Xdh71TcAq0BgE1m0k7pwfy7dGUzMRyCCb08F2EzR0CbdlZyGeB
	 N00NXGug6/A3zEOaUlUcIYASoQ7QOQyQ5n6iUJH96t5DRhA+2X+FadxgIzieGS3Darw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329500;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=v4TPpXEkwL0vMpQpecB8Kemrj/QrpLZ2AGgX7H1pnXY=;
	b=cAEBQAYwHF0L/NKnroaKyphyQLmfDGPdLl+4rsAQNccYiBKaRRb4I1cUaEJu3DTo/g6K
	 o5XFZByBMBBEpqJb0KrpKXcO30cfgzD5KTIYC4LUs00DjKxcOH9RTiugJ2SzQpPmUUCyV
	 TamCa8dkwbIAiJ/orJ5CSs6sD9sBklC3A/9xDTpCIAtNDuesvv2B5MpiAOIMqBiheQdI6
	 NvFparrE93jLcPgjoMF+3tK64i5pijqOdvcpCNz/AufZEuwMaW6jOiHylxtD6N1IZNbIb
	 MTX0Q8u29NqlBxe/dtJV5YB21jB96OZq9Lc5CmAUdJWAhy35wY9J4kUsmfi/iozUTzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQRty9Lb;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E01606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 06:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E01606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQRty9Lb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795329498; x=1826865498;
  h=date:from:to:cc:subject:message-id;
  bh=103Bxpf1mdhzGMTEjG6q81vWJlSmw+SC5cZEImXLmlI=;
  b=WQRty9Lbw2AFgFS51PT4a8dH4WjIL1NafG9A2fRjQDaYlym85582drKS
   NYTNTccrOseyQVT5YOvpYTzgksrLawObU3i62qV64wNJxXPTprFl0n+RX
   JjEJvHjZzMIuVPC768V3HCdXvjnWxCN51q+urhIHSgL/PTdQ1EyLb5OCX
   3B4RxoZV9EPbbivsi9yUBf8njB3qxwyjZ5JigFuJ9d7kb/lPVPPAFus5+
   dgOFDgyTkvn9+bFqhybqWqcCGh90cONxHFLUT906UCUaaaXtgUxfklt3o
   hoYHdtKH5bSWxf7pEN/scZ6SmZh68tNjnToV6gPV3YlHv2YfpOw1NOq5q
   w==;
X-CSE-ConnectionGUID: LXN+2ab1Rn2csIJdn4Ji2w==
X-CSE-MsgGUID: Eo5e2popR8qoASDpM1oDVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4005208"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4005208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 22:38:17 -0800
X-CSE-ConnectionGUID: FvnfCUdCRH+rzPrktPcg5Q==
X-CSE-MsgGUID: 9CugaqycRMaUr93O6BxAeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="10968635"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Nov 2026 22:38:16 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV1DK-000000004Vt-1wWm;
	Sun, 22 Nov 2026 06:38:14 +0000
Date: Sun, 22 Nov 2026 07:37:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/fs-writeback.o: warning: objtool:
 inode_cgwb_move_to_attached+0x50: unreachable instruction
Message-ID: <20261122073524.Xwj8ruDd-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Finn Thain <fthain@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
commit: 80047d84eed25e9c92cfb9169980a0dfec110246 atomic: add alignment check to instrumented atomic operations
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r2301-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122073524.Xwj8ruDd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122073524.Xwj8ruDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80047d84eed2 ("atomic: add alignment check to instrumented atomic operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122073524.Xwj8ruDd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Assembler messages:
   {standard input}:1112: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1123: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1124: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1126: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1185: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1197: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1198: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1200: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1285: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1296: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1297: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1299: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1369: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1382: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1383: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1385: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1501: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1514: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1515: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1517: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1627: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1640: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1641: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1643: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1753: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1765: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1766: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1768: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1893: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1904: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1905: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1907: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2009: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2020: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2021: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2023: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2123: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2135: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2136: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2138: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2261: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2275: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2276: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2278: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2398: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2412: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2413: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2415: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2538: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2553: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2554: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2556: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2728: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2740: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2741: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2743: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2856: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2870: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2871: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2873: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:7399: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:7810: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:7812: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:7813: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:8309: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:8823: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:8825: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:8826: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:8866: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:8868: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:8880: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:9494: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:9496: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:9497: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:9557: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:9559: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:9561: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
>> fs/fs-writeback.o: warning: objtool: inode_cgwb_move_to_attached+0x50: unreachable instruction
>> fs/fs-writeback.o: warning: objtool: inode_io_list_move_locked+0x58: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
