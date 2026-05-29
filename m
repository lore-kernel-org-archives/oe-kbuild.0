Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A83D3CE9
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054478; cv=none; b=aDUIC701MfShIFU0O0j9GETtgb5+J3YSqB65k8p1SyLIZy/f6lyKeuxS5O8eexcZFxHe9l64IfB6I7Oln5V7E0d5Wl4Y+6mR497icw2SixhTykUrg1man8fAfLelKrhbwDLffpDIxjIwuo33oqe0L5OZ8Tmw/wKbjcOpIqrYZ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054478; c=relaxed/simple;
	bh=p61CrIILboHUTaWyPHKIKNQPwEVy1EfX3Ywg+eCk1dE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bpL+WS1sE7c0yifM664BLtvy630XHTKVC75HvwLPTAHZz/8fa85LSZDS6cay/NyqbURTtggWncX0yMQCSLAcjWiwHGB3jG53DZVNyyseZwtd7OwWpoJfKTX/E2RCTL5I64s7lDNEN/9BOReuW9VlOw9/oX96Tc7rLTOzhYlWOy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTjxxLZm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTjxxLZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780054477; x=1811590477;
  h=date:from:to:cc:subject:message-id;
  bh=p61CrIILboHUTaWyPHKIKNQPwEVy1EfX3Ywg+eCk1dE=;
  b=WTjxxLZm8D5sRIef+/KjRK69sQ18tBU0UV1xLuIy48U0nrV3vTBPUa8M
   cqD3y93vx0fIJwEjuuonNUjzksBs+fa1edXacMe1L2MlB2zHKnpTtnDYE
   +vjWsbRfDvl1k1f7L31zdippYpBWnsSRUqjMrZiiVaOV/PUMhBwkE5C4L
   aBf+dvxYvqgD70HoKcJGDR5YjGxEuPFkAmWsUXx+vU5LMSszuGsXD9+8H
   01RFXeGBB9/0JZ8oqy8zDHRqi8DejwO5sD9ziqY7qh3P/VTqyvpTh8QEU
   XQVMl+XyR2BJ2INbBEg4khwm91O0m2A6ep9R3zW6cpztEVNz2fF5KPzZh
   A==;
X-CSE-ConnectionGUID: 6Szcnv6TQ0WXLjpT5B+f2Q==
X-CSE-MsgGUID: k8Lg3ZP4Tvurx3Z3qdHCGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98477522"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="98477522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 04:34:36 -0700
X-CSE-ConnectionGUID: ZJIF/N/8QJmtwTEMaioWoQ==
X-CSE-MsgGUID: /d9G+nXzQzO8ymoHH3cEPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="280948718"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 29 May 2026 04:34:36 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSvU1-000000000s9-13Jq;
	Fri, 29 May 2026 11:34:33 +0000
Date: Fri, 29 May 2026 13:34:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxsecuritymodule:dev-staging 18/25] Makefile:45:
 Skipping hornet selftests: bpftool not found at tools/bpf/bpftool/bpftool
 (build it under tools/bpf/bpftool first)
Message-ID: <202605291321.BIKQrfpG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
CC: Paul Moore <paul@paul-moore.com>

tree:   https://github.com/LinuxSecurityModule/kernel dev-staging
head:   502a77d5b69d2309ebda5584411615d1b9ab9105
commit: 8692a70ff91694c2af3b02106964043c02a7aadb [18/25] selftests: hornet: handle cross compilation and test skipping
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260529/202605291321.BIKQrfpG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291321.BIKQrfpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605291321.BIKQrfpG-lkp@intel.com/

Note: the linuxsecuritymodule/dev-staging HEAD 502a77d5b69d2309ebda5584411615d1b9ab9105 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   make[1]: *** [Makefile:124: tools/testing/selftests/hid/tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
>> Makefile:45: Skipping hornet selftests: bpftool not found at tools/bpf/bpftool/bpftool (build it under tools/bpf/bpftool first)
   make[1]: *** No targets specified and no makefile found.  Stop.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'


vim +45 Makefile

5fa94ceb793e93 Masahiro Yamada 2023-06-27  44  
221cc2d27ddc49 Masahiro Yamada 2019-03-26 @45  ifneq ($(sub_make_done),1)
3812b8c5c5d527 Masahiro Yamada 2019-02-22  46  

:::::: The code at line 45 was first introduced by commit
:::::: 221cc2d27ddc49b3e06d4637db02bf78e70c573c kbuild: skip parsing pre sub-make code for recursion

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Masahiro Yamada <yamada.masahiro@socionext.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
