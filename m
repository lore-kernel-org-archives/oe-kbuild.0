Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E13C2778
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725759; cv=none; b=PROOq89SVNNioIBxRKKWqkJ6na0R4Dc9Nn3wDcNm04BAeadfu7D4/8kfzNIUiGomzaq144XeybBvaQ3NS8eQo2IPk2XOsb+inX46ZNYcE3b/qhicEgC/5DwwQPUZ5Gl9I/CWz18GZ3RgQFkVXRV3AXa1T1i1TY7eIs2GtansKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725759; c=relaxed/simple;
	bh=inxLomMQZg9KmP73tlrCm4h8qDkjMVCY6oXiI1CQZKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iw2mm/ap347pOkVyOQ46hWMaqEjG11LFHOaJekJiTdaGq0iZfzqkf9OYEbyIXkfWGPGaD5AmPiEGnZFNDrceLM7MjjHKO9qarRjj5i3PjZw6l78PZGic/5hzOvww3RSjOqEHSxhuoBjWQ7sjUXnqK1eX9WFKHAsB986VphiMTpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arqVL4S7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arqVL4S7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772725758; x=1804261758;
  h=date:from:to:cc:subject:message-id;
  bh=inxLomMQZg9KmP73tlrCm4h8qDkjMVCY6oXiI1CQZKc=;
  b=arqVL4S7FH4vanlzjT5N4bD7kzMtPYmHLHsAnngJ+/QFtuDDPqHOkYqS
   vud0x3NirhM3eh3cEZ91h5Wg12VI9w3CRaoJEmULSIAwfQyUjz1W4Zn4s
   EHluQYeK1abQJGKYFQFeRzcV3tny+32DweuT9Rlp7BFZmZxH0MGAsM6Kq
   aM50ap8U55axcSmCjW60GHFTjIEC47CGQxt719AO6+St4gMKNgZS31D/8
   2qn7r7JFs+vKOxnwZSUG6jLb2LUv1m+hRRB4IHCyZKBHt/qrel+kJaroK
   H1kRBGS9cmZlYC82AuaticEs77k9Iir2YPNvRFGTDGcDMZUBWvE4rKGFQ
   Q==;
X-CSE-ConnectionGUID: ZD8QYssySUu1EJTReWA2Rw==
X-CSE-MsgGUID: KbZ04i30QFOInJk/Xc4qqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61390153"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="61390153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 07:49:18 -0800
X-CSE-ConnectionGUID: 2SCuYAnDQhKDJbMxtC+kgQ==
X-CSE-MsgGUID: O8Za6zdpQyW/pHZ0/QQvKw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 07:49:16 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyAws-000000000rJ-02jy;
	Thu, 05 Mar 2026 15:49:14 +0000
Date: Thu, 05 Mar 2026 23:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: test_maple_tree.c:(.init.text+0x39fb4): dangerous
 relocation: l32r: literal target out of range (try using
 text-section-literals): (.init.literal+0xf00)
Message-ID: <202603052329.2z261r6Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Finn Thain <fthain@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c107785c7e8dbabd1c18301a1c362544b5786282
commit: 80047d84eed25e9c92cfb9169980a0dfec110246 atomic: add alignment check to instrumented atomic operations
date:   5 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 weeks ago
config: xtensa-randconfig-r134-20260304 (https://download.01.org/0day-ci/archive/20260305/202603052329.2z261r6Z-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052329.2z261r6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603052329.2z261r6Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_maple_tree.o: in function `check_state_handling.constprop.0':
>> test_maple_tree.c:(.init.text+0x39fb4): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x39fbd): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x39fc0): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf04)
   test_maple_tree.c:(.init.text+0x39fcc): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x39fe0): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x39fe9): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x39fec): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf10)
   test_maple_tree.c:(.init.text+0x39ff8): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a00c): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf18)
   test_maple_tree.c:(.init.text+0x3a052): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf28)
   test_maple_tree.c:(.init.text+0x3a055): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf2c)
   test_maple_tree.c:(.init.text+0x3a070): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a079): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a085): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a098): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a0a1): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a0ad): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a0c1): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf30)
   test_maple_tree.c:(.init.text+0x3a0e0): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a0ec): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a0f8): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a109): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a112): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a11d): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a130): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf18)
   test_maple_tree.c:(.init.text+0x3a139): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf18)
   test_maple_tree.c:(.init.text+0x3a141): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf34)
   test_maple_tree.c:(.init.text+0x3a17c): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a185): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a191): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a1a4): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a1ad): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a1b9): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a1cc): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf30)
   test_maple_tree.c:(.init.text+0x3a208): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a211): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a214): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf04)
   test_maple_tree.c:(.init.text+0x3a220): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a234): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a23d): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a240): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf10)
   test_maple_tree.c:(.init.text+0x3a24c): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a260): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf18)
   test_maple_tree.c:(.init.text+0x3a2aa): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf28)
   test_maple_tree.c:(.init.text+0x3a2ad): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf2c)
   test_maple_tree.c:(.init.text+0x3a2c8): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a2d1): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a2dd): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a2f0): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a2f9): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a305): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a319): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf30)
   test_maple_tree.c:(.init.text+0x3a338): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a344): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a350): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a361): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a36a): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a375): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a388): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf18)
   test_maple_tree.c:(.init.text+0x3a391): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf18)
   test_maple_tree.c:(.init.text+0x3a399): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf34)
   test_maple_tree.c:(.init.text+0x3a3d4): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a3dd): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a3e9): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a3fc): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a405): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a411): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a424): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf30)
   test_maple_tree.c:(.init.text+0x3a448): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a451): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a454): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf04)
   test_maple_tree.c:(.init.text+0x3a460): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a474): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a47d): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a480): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf10)
   test_maple_tree.c:(.init.text+0x3a48c): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a4a0): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf18)
   test_maple_tree.c:(.init.text+0x3a4ea): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf28)
   test_maple_tree.c:(.init.text+0x3a4ed): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf2c)
   test_maple_tree.c:(.init.text+0x3a508): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a511): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a51d): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a530): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a539): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a545): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a559): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf30)
   test_maple_tree.c:(.init.text+0x3a578): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a584): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a590): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a5a1): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a5aa): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a5b5): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)
   test_maple_tree.c:(.init.text+0x3a5c8): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf18)
   test_maple_tree.c:(.init.text+0x3a5d1): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf18)
   test_maple_tree.c:(.init.text+0x3a5d9): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf34)
   test_maple_tree.c:(.init.text+0x3a614): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a61d): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf00)
   test_maple_tree.c:(.init.text+0x3a629): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf08)
   test_maple_tree.c:(.init.text+0x3a63c): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a645): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf0c)
   test_maple_tree.c:(.init.text+0x3a651): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.init.literal+0xf14)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
