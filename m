Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB521C9E4
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jun 2025 04:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750306213; cv=none; b=kp1nXraYN8Qp3AFMYV8s96E7gEeLOu4I8Wis2K6PnRpk4M/I6Ui+GOjqXzngpLM03myv5u7qv6lFXTzDoC7dKtCaPeSLBW/jCjss+JwyYY2/4fFoo0CzD4g2fo2Df9AmrpjH0M/7R5LDSjdChhwa4v82b+9TLtxWT5H2HOGDVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750306213; c=relaxed/simple;
	bh=0SH4AMDW8LAlhVrsdoRJd0uqqHRjqm6u6M1eOlRly70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsIjyAEtwsli19KKlK2mP9eMPh7y5HLMCDp+GbGITPoBWoqLs55h3ZwS3U20kaiUzkeXn75YBATkP8qP7VFuIQ1kmd+RI8siRANZuu6yD4Hupm5dN1qUxrTvouuzpbXU/76m4n9Zv+eG3bnJCMxiuqlEYY46LxISq7XRv9lZ6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCl576qa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCl576qa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750306211; x=1781842211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0SH4AMDW8LAlhVrsdoRJd0uqqHRjqm6u6M1eOlRly70=;
  b=cCl576qaN945t4Amcqc16XKkobK/an6W5HR6XIWrIY+e5t9NlD6cjtPh
   rUryI4uMMceJKmlTIOvEp3zpUufjip9EvuMQUzZ5B0wOHUZbPcJ6EBwxV
   PVMaUE0YKLgvjunNukc4PidYYIDuihyMpcaGS6rk9aq3lDyOcyKm827XL
   mZOGIaQ6SvBdBaqRnfFJdW/hHi5tyQOCwlT54Q9dHI9KeJB/nQuekoxsY
   4direuZ5Y8vWRI4dVy/vCQm4IawoJHINeYw5S/boaVc6XApqRE4orXpgv
   0MESS/fM4ikXyAP/NiL74+Vppqysjh+uZoM0Cxf+B9m4USSB7ULUdTye/
   w==;
X-CSE-ConnectionGUID: 41oKYmakRV27KNobGPMvKg==
X-CSE-MsgGUID: FRul7e+4SdebYwmZjVaXeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="55177039"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="55177039"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 21:10:09 -0700
X-CSE-ConnectionGUID: /2p2zLgVRwatKPnUzPjGGg==
X-CSE-MsgGUID: wdna3v8ZTE+s3wnJotfI4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="154380675"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jun 2025 21:10:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS6bG-000KOW-24;
	Thu, 19 Jun 2025 04:10:06 +0000
Date: Thu, 19 Jun 2025 12:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: uinput_str_to_user+0x153: unknown CFA
 base reg -1
Message-ID: <202506191210.Tb34eKpm-lkp@intel.com>
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
head:   fb4d33ab452ea254e2c319bac5703d1b56d895bf
commit: 0a7fb6f07e3ad497d31ae9a2082d2cacab43d54a objtool: Increase per-function WARN_FUNC() rate limit
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: x86_64-buildonly-randconfig-005-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191210.Tb34eKpm-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191210.Tb34eKpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506191210.Tb34eKpm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch+0xda: call to __msan_memset() with UACCESS enabled
   vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch_v1+0xf4: call to __msan_memset() with UACCESS enabled
   vmlinux.o: warning: objtool: nvmet_ctrl_state_show() falls through to next function nvmet_ctrl_host_traddr_open()
   vmlinux.o: warning: objtool: uinput_str_to_user+0x156: undefined stack state
>> vmlinux.o: warning: objtool: uinput_str_to_user+0x153: unknown CFA base reg -1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
