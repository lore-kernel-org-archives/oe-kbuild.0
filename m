Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC344A21
	for <oe-kbuild@lists.linux.dev>; Sat, 17 May 2025 02:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747448043; cv=none; b=J2oXPhPvw1hLSVbOLiOSU2SyUufXJ6rLiAruG+YJPVk84B+baAJsWoqfnhE/CgSE08LHdty9ZHOh84PTm8fKZLTYb7zCLHk9vfYomOm/AiJluEGM1RjfkNLmP2DPrznnBs6Xq1PgrxhUNS2ot4ZP9VST2mIfNIxhd/2bw7wGVEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747448043; c=relaxed/simple;
	bh=q8hO47w6iW+vDYTBVSzEd+bpvTGZBnzk/5cVZNeakn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7+/Lgt13ZIHcFgyIsBfRocvG3vEXYE7W+KF4z85DF6yUD89jzySfNSBxqvhLCxzKQG8uYK32VXdf9XUl3+BBK/1+dcMZ6WTMZM41gRY7WCWXVMNNFMfYN+ybMAN+9vI5rkWR9jdvoR6psJwiFw+DsgKDSbyhr0ik8FUoVnBNBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/dsZZzk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/dsZZzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747448041; x=1778984041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8hO47w6iW+vDYTBVSzEd+bpvTGZBnzk/5cVZNeakn4=;
  b=f/dsZZzkyFo4flG2nbgNPUwAxfF1ON3CvZ9UPhGLflm/psWz6aGC21Sf
   yni+Aa4vG4ixqchYRe7K4Gq/yxsQuYz/OXsWmHVos3DD0BHF2h2DhyBf6
   znY6RDGApdj5dECqVkq0/89btUMCvTiiQ4v+D8ySCj39rEvY5usEwWVtx
   Gn8pfqH49aKAj3Cn0GfehWuJ34/15OK49Ak9LSGV5PseCb/fbM+C54ba5
   WEIjxmpIK5n460yomzo7tGa0aawj90fu/aMI5mx3mnBZKHDAcVQoXOyN4
   v4ZKzA90zcQjsNU+OFXDGX38d3Fi+JEAz05DppVKX1wSBeaOD1fwcIaT8
   A==;
X-CSE-ConnectionGUID: 6WTb2sd5Rki9nWn7OfNpTA==
X-CSE-MsgGUID: 60g7ul5xSMSbNsajffhV7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53230248"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="53230248"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 19:14:00 -0700
X-CSE-ConnectionGUID: OwXLl4nKTz2lolAlAgDCpQ==
X-CSE-MsgGUID: WU+by+QNSzCbJrKnDLSb+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="138693764"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2025 19:13:59 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG73k-0000U7-2n;
	Sat, 17 May 2025 02:13:56 +0000
Date: Sat, 17 May 2025 10:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 828/4329] arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb:
 watchdog@14400000 (renesas,r9a09g047-wdt): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202505171047.bkloo0X4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   9d5f0863e401cb64a69c27af17034edd01e989b3
commit: e2e8c1a9f88d52b3a288f9ee499a2633c3a83008 [828/4329] arm64: dts: renesas: r9a09g047: Add WDT1-WDT3 nodes
:::::: branch date: 13 days ago
:::::: commit date: 3 months ago
config: arm64-randconfig-2052-20250516 (https://download.01.org/0day-ci/archive/20250517/202505171047.bkloo0X4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171047.bkloo0X4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505171047.bkloo0X4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: watchdog@14400000 (renesas,r9a09g047-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g047-wdt', 'renesas,r9a09g057-wdt'] is too long
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r7s72100-wdt', 'renesas,r7s9210-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r9a06g032-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r9a07g043-wdt', 'renesas,r9a07g044-wdt', 'renesas,r9a07g054-wdt', 'renesas,r9a08g045-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r9a09g011-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r8a7742-wdt', 'renesas,r8a7743-wdt', 'renesas,r8a7744-wdt', 'renesas,r8a7745-wdt', 'renesas,r8a77470-wdt', 'renesas,r8a7790-wdt', 'renesas,r8a7791-wdt', 'renesas,r8a7792-wdt', 'renesas,r8a7793-wdt', 'renesas,r8a7794-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r8a774a1-wdt', 'renesas,r8a774b1-wdt', 'renesas,r8a774c0-wdt', 'renesas,r8a774e1-wdt', 'renesas,r8a7795-wdt', 'renesas,r8a7796-wdt', 'renesas,r8a77961-wdt', 'renesas,r8a77965-wdt', 'renesas,r8a77970-wdt', 'renesas,r8a77980-wdt', 'renesas,r8a77990-wdt', 'renesas,r8a77995-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r8a779a0-wdt', 'renesas,r8a779f0-wdt', 'renesas,r8a779g0-wdt', 'renesas,r8a779h0-wdt']
   	'renesas,r9a09g057-wdt' was expected
   	'renesas,rza-wdt' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
