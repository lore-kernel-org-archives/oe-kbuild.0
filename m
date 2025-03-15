Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3EF197A8B
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742072728; cv=none; b=X32DdkVdyM7bwarLCyLq1sba35Y9FEf1U0Yp8NRN2Dlf8lt89KntSKnqrtnTf2zbpEFi7p2QhwGZeI5iM4zxybmaejBYfHhkIdYWhC4AZugo0mXduwkZPFAoLpFwhLNk4qgaZZARgCmh8AnboDNYW9FTjtnYb8QcqKTHQUSSBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742072728; c=relaxed/simple;
	bh=FMVkYCbpuSbEhmTdcQ4qMeQF7JbCS3scifYqSxFS35s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J1HLMcSsDdv23LbybbsLKshAG5+OhmF6GMG82/zHauWoa3C9ltywQPe1qAASU53j9U3LJ37dbsBUgexocsRAgtfP+5CXZaMTa0FKiM+8Fw8EQCu7uMBDCxDL9MyXh5bqzMH26B8MFKlRlFG8uRt45NHV3/pXvOYaAwEtU94aoFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeflQRZM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeflQRZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742072726; x=1773608726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FMVkYCbpuSbEhmTdcQ4qMeQF7JbCS3scifYqSxFS35s=;
  b=eeflQRZMFOdEsMp9Mq5SCRtza9vbyWvUDsA23jsAA95HVcQV3TrRx/FC
   weXdj0+M0swyuIeDY3EiCnDiKoeckI+MXECZUh20mJ5v3MuKLSBQ7PF8E
   Guhjj12td3lXVY0HykWo/cqYRsiOPp1I11UmACIFYHbke5mOtNKdeXwyN
   /mSDIwOpWKLLbJIDhZilFCAvbAOECQrLONO938mIY9up5jWAP21frIOE8
   /q2MKiOV5E+OXibA8kpcbEaWyTJkKh2bR7AlXNqOHmGwu8P/uN/Bk66ux
   FiBFEYjSXP1MRajLXJnjo14mAl+egBPHgM0hjLGC8icqmMeccRNUSIveP
   A==;
X-CSE-ConnectionGUID: DsGysoUIRaORrwWK2h0x0Q==
X-CSE-MsgGUID: lCdA+WprQGG2aaqqlwyWnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="47100382"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="47100382"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 14:05:25 -0700
X-CSE-ConnectionGUID: uVcQIQv7TH2u6soWV+A00Q==
X-CSE-MsgGUID: dWf/pRZpQu6rHhs4GXA7ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121776228"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Mar 2025 14:05:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttYh8-000BeF-1Y;
	Sat, 15 Mar 2025 21:05:22 +0000
Date: Sun, 16 Mar 2025 05:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:objtool/core 13/13] arch/x86/mm/fault.o: error:
 objtool: do_user_addr_fault+0x8ec: __stack_chk_fail() missing __noreturn in
 .c/.h or NORETURN() in noreturns.h
Message-ID: <202503160527.0I8PQxpK-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   3ea93b53ecb339bb78a5eedbb51714a899640584
commit: 3ea93b53ecb339bb78a5eedbb51714a899640584 [13/13] objtool: Add CONFIG_OBJTOOL_WERROR
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-076-20250315 (https://download.01.org/0day-ci/archive/20250316/202503160527.0I8PQxpK-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160527.0I8PQxpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503160527.0I8PQxpK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/fault.o: error: objtool: do_user_addr_fault+0x8ec: __stack_chk_fail() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   arch/x86/mm/fault.o: error: objtool: do_user_addr_fault+0x8f1: unreachable instruction
>> arch/x86/mm/fault.o: error: objtool: 2 warning(s) upgraded to errors
   ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --orc --static-call --uaccess --Werror --backtrace arch/x86/mm/fault.o.orig -o arch/x86/mm/fault.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
