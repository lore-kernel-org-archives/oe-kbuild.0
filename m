Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689922E03F0
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757627027; cv=none; b=GPPT8N+LO49katY/zFwUYrsWtSn/NvoP5maoX62qzCmyDtV00ANVknaGYEBCnQ6FUOy1ZdlddtFEznt2tPtBf65zMlQHpCgqBsdP/idUmJXsoK8QB0ZNSXsMmTvtALEiVqGb2PjY6uo6ymp9WFkifBTF7i4jTYfRkamHj+oaqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757627027; c=relaxed/simple;
	bh=C7ORmYTrrZR8fQ7PGOznIOWKVXSfHehLyvtMV5SZTOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UBJbuPJzDpbk3cJvtql12C/JJNTTE70AHeKd/xLNvIxXqUP1LMdHUEmGqZiS60He/7JsgumIdMbIrBnScognfL0ciG4cSht5smCcalsej/ls/NT2LZDv0uMS+3OFykAHXNYdsJV/Uxz2ED12D44mMIl/IifvOaCC6oGfZDUpkS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPlAKTE5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPlAKTE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757627026; x=1789163026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C7ORmYTrrZR8fQ7PGOznIOWKVXSfHehLyvtMV5SZTOg=;
  b=MPlAKTE5BWfvSzjRqO7F5F3qIU8cqqy5kkRRA8hhMB1M6dB5cKfNSXAk
   k5UIuOA9KrlYByUoMWoy3tczTRyZxvnqPx2MnVnFOEUiiPSPsHLVC5L0u
   EfQWt48yRTQBBNRHFornxK+I0+lTW1MdK7q3jRIZ0jINuGFhjKlCTPuiW
   SZVNYlnfMmXEENsTI/EYcX6Sw8d+gD7q8uqMFGt9J4Z/meCoMyCESvoqI
   clZ18o0rwWInLLVzUrPib/s/DcboLvvdqXXpC8ieeERFd2CkvaG19ytG+
   1eEpW6UYaoa99QmeZBNCHbih90XCWhFUsTF/pAPSQf3S/U0HZM4cLJX37
   g==;
X-CSE-ConnectionGUID: i3VAHRPwRyq5cNRYKOilAA==
X-CSE-MsgGUID: fqNGbK0yQZa1+8m0BLaKsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59668808"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="59668808"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 14:43:45 -0700
X-CSE-ConnectionGUID: TkVzINVDSpi4K89co5TFlQ==
X-CSE-MsgGUID: 4uNBWr+RTZWyNQoeD7XUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="173630026"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Sep 2025 14:43:44 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwp4v-0000ea-1t;
	Thu, 11 Sep 2025 21:43:41 +0000
Date: Fri, 12 Sep 2025 05:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vmscan.o: error: objtool: shrink_node+0xc4f: sibling call from
 callable instruction with modified stack frame
Message-ID: <202509120559.RAfQCIRu-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e59a039119c3ec241228adf12dca0dd4398104d0
commit: 36799069b48198e5ce92d99310060c4aecb4b3e3 objtool: Add CONFIG_OBJTOOL_WERROR
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-073-20250912 (https://download.01.org/0day-ci/archive/20250912/202509120559.RAfQCIRu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120559.RAfQCIRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509120559.RAfQCIRu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.o: error: objtool: shrink_node+0xc4f: sibling call from callable instruction with modified stack frame
   mm/vmscan.o: error: objtool:   shrink_node+0xd4a: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xc2a: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xd1e: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xc08: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xad7: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xd02: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xab6: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x894: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x872: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x83b: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x2392: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x81b: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x7d7: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x2373: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x77d: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x6f4: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x253f: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x6d7: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x6b7: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x685: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x649: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x5d8: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x5bd: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x54c: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x511: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x4d6: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x2358: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x4aa: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x492: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x24c0: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x481: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x43a: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x2349: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x412: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x231f: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x3eb: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x3b3: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x2302: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x384: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x259: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x1d6: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x22e3: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x1b7: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x181: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x152: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x131: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x10a: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xc9: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x0: <=== (sym)
   mm/vmscan.o: error: objtool: 1 warning(s) upgraded to errors
   ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --orc --static-call --uaccess --Werror --backtrace mm/vmscan.o.orig -o mm/vmscan.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
