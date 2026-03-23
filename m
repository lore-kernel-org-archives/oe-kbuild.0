Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2BF1A239A
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 00:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774227302; cv=none; b=s1OQe2vjULh0BQHqb9hk4beHxKOuqA7PgF7RlNlestrFrejAz9l7OZ3/xJcf4UyeSlijA4TGNQgeV2d9sUzuwWQhe9rSd5eutq4MmWFLakV5du0fAJshLOQhjSfE2opCvYvc+hl0VJsJF0KnOTnwK9f1TI4V8nqcBPiwtIRt1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774227302; c=relaxed/simple;
	bh=Ra5AMSixIEFaV6UqXN2j8/8wHpDflvO3Kw+mPDjXHMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mnD3VKbLXMgiJBuVHtQmMk5aAhQ4lqDZh5RxH6nO1tg8/xdlpkuVdSyH02gm9X7kWtjnCDuXWzBZXD6CKEFUPiG+PUbDwR7276JwzEqJqi/1DhoX8H/EcTmFOyUB6EMoV962kEBwqTGSz2VsWIcNVfUKBLEAE+bFVjOtuVnYMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrYkl01K; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrYkl01K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774227300; x=1805763300;
  h=date:from:to:cc:subject:message-id;
  bh=Ra5AMSixIEFaV6UqXN2j8/8wHpDflvO3Kw+mPDjXHMc=;
  b=nrYkl01K8DswO0AdKgfgSFfaZ1l6MZ2KGCCBcNKeWbQw70anUDPtCl0q
   f5wAiXJEJe9Rw5gdBXOK66TPNDAmwQQ7v3ZITz9fhKvfcZyeTvKIqQzfg
   4DiS9F7HLMfGgzjf0VnIaBt43ghGM5MguD3oC++6ATeboykIFDNcCYpJV
   sch8JXqWeoaI2TSUNTq4GnZ/zBmP4dS4tejOWeCyEwwk0fdrqQ05ILuX8
   HdlD/lJQMyOVlwRUznXJz74Mqu/pbk6hPhn9PtRQ1cKJ/zePLOob1xFvN
   C2JODzYJHRblz70BPTLNLS874G8aoS2NZb1xOdO9azlmyWU0yMPwpyJIY
   g==;
X-CSE-ConnectionGUID: vMHoFJviT2aJg6002kGCyA==
X-CSE-MsgGUID: Uj/G3nvzSi2nbRCRVdqyTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79132745"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="79132745"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 17:54:59 -0700
X-CSE-ConnectionGUID: x+yw/w+RTj+pzVBN1Rl14Q==
X-CSE-MsgGUID: ji1WA1iFSoy0PbUFtwdiig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="261778488"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Mar 2026 17:54:58 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4TZH-000000006Uv-3JAO;
	Mon, 23 Mar 2026 00:54:55 +0000
Date: Mon, 23 Mar 2026 01:54:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dsahern:perf-trace-ioctl-wip 5/7] builtin-trace.c:undefined
 reference to `syscall_arg__ioctl_cmd_lookup'
Message-ID: <202603230149.iEOWFl85-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Ahern <dsahern@kernel.org>

tree:   https://github.com/dsahern/linux perf-trace-ioctl-wip
head:   3e523442f5974b9f0f74d6f2ce26701950696817
commit: 647ca7f9d1a391f033597ff7e34d230019c33421 [5/7] perf-trace: add support to read ioctl mapping files
:::::: branch date: 49 minutes ago
:::::: commit date: 49 minutes ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260323/202603230149.iEOWFl85-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230149.iEOWFl85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603230149.iEOWFl85-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.0.rc4.g647ca7f9d1a3
   /usr/lib/gcc-cross/riscv64-linux-gnu/14/../../../../riscv64-linux-gnu/bin/ld: perf-in.o: in function `attr__fprintf':
>> builtin-trace.c:(.text+0x6f740): undefined reference to `syscall_arg__ioctl_cmd_lookup'
   /usr/lib/gcc-cross/riscv64-linux-gnu/14/../../../../riscv64-linux-gnu/bin/ld: perf-in.o: in function `trace__parse_events_option':
>> builtin-trace.c:(.text+0x72d08): undefined reference to `syscall_arg__ioctl_cmd_decode_fini'
   /usr/lib/gcc-cross/riscv64-linux-gnu/14/../../../../riscv64-linux-gnu/bin/ld: perf-in.o: in function `syscall_arg__scnprintf_mmap_prot':
>> builtin-trace.c:(.text+0x72e8c): undefined reference to `syscall_arg__ioctl_cmd_decode_init'
   collect2: error: ld returned 1 exit status
   make[2]: *** [Makefile.perf:803: perf] Error 1
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
