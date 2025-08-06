Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F48C28DEE1
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754505596; cv=none; b=r7TW9207CMVvSuiGK6KauqQdRoUdz9AB2MQE2coC67cmnEoBi2VFyHX+wRckne8Tt5K2ggNpNAY3YQ6QZUnTk6JSyTf7BKnk+7BskcnLtNKvhgY5EPt3HLwH2cv8QE0r2ou8xM1bagN0v09oIDJyhVCTiu/guyhPnbrIzy5yH1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754505596; c=relaxed/simple;
	bh=zQ0Mq+YykE9cAw3SLuHWJk4jVrJhf1uX3ppEbBEv25A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UbY/WycchCMSpgoCS++oJ5EBP4PkyaML9gsSb9cBmD9wo6TQ8Pu1NVscMIecLnIWDJeMzRoNGW8tZ6jqSa/o5RolEUiPeXH6NMi3MaF8PcNAVWMpWqfRLUsRfDtJ7q38c1E6x5ew9aGXeCu6Eq89GXcaMYcHRluGru8/rOD9woo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amXQQYy1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amXQQYy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754505596; x=1786041596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQ0Mq+YykE9cAw3SLuHWJk4jVrJhf1uX3ppEbBEv25A=;
  b=amXQQYy1DpeEGOHMay4/KpJ7O636jpdy93uZf4kxuea4NLtBq8i3eo6c
   9A6QMBH2LLvDEhwBuywaZ9lgxYlLYDJgZm7DsirlRtotH4/i8b1yOqzy6
   Dy0XHr6kLY7ZvESy/jFtJGe72+gyQhvuEnGAicpWjsQaXXeeA9FfaK6rC
   NpBAMbnpJb0YW3rq40GMfcmAf2PYGrZQ/7wCzvGmuPay+gD+o/u7SgBRr
   kOTn9L+sC/qm5FSuZbILzbkWCIp+9JY7QhResbg94QMen77/lhdicXb6Q
   gV+myBNqUeBqMu1l8UjhS1OOIf5XsAHFnaInZCgI04w3jDjVuQWDasTvb
   A==;
X-CSE-ConnectionGUID: uF1GD3b0SiWSZyYodxp0YA==
X-CSE-MsgGUID: bGcR/X6mRXSfAJLGp9sJ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79382145"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="79382145"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 11:39:54 -0700
X-CSE-ConnectionGUID: QCvIw/5PQs+q9Xj3QdGR0A==
X-CSE-MsgGUID: 1spLQuOgRFm5jmOli3+QCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="195685951"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2025 11:39:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujj3A-0001zG-1v;
	Wed, 06 Aug 2025 18:39:45 +0000
Date: Thu, 7 Aug 2025 02:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: LLVM ERROR: Broken module found, compilation aborted!
Message-ID: <202508070211.Ssgpi4JK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "clang compiler bug"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

CC: linux-kernel@vger.kernel.org
TO: Alexander Potapenko <glider@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cca7a0aae8958c9b1cd14116cb8b2f22ace2205e
commit: b65e4b56e9f406f291656b3e92723952c180fbab kmsan: rework kmsan_in_runtime() handling in kmsan_report()
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: x86_64-buildonly-randconfig-002-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070211.Ssgpi4JK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070211.Ssgpi4JK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508070211.Ssgpi4JK-lkp@intel.com/

All errors (new ones prefixed by >>):

   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %79) #22
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %232) #22
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %3298) #22
>> LLVM ERROR: Broken module found, compilation aborted!
>> PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
   Stack dump:
   0.	Running pass "verify" on module "vmlinux.a(scan.o at 1692798)"
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %593) #19
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %711) #19
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %1419) #19
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %1419) #19
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %2969) #19
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %4058) #19
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %4058) #19
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %2929) #19
   inlinable function call in a function with debug info must have a !dbg location
     call void @__msan_warning(i32 %8) #19
>> LLVM ERROR: Broken module found, compilation aborted!
   /bin/bash: line 1: 2687036 Aborted                 ld.lld -m elf_x86_64 -mllvm -import-instr-limit=5 --compress-debug-sections=zlib --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto -plugin-opt=-split-machine-functions -z noexecstack -r -o vmlinux.o -T .tmp_initcalls.lds --whole-archive vmlinux.a --no-whole-archive --start-group lib/lib.a arch/x86/lib/lib.a --end-group

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
