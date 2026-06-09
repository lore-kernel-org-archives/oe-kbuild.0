Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3433E47B
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jun 2026 00:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780963996; cv=none; b=mqcJUSL6G/y3E05e1IiM+ucQM4WyIvfWceRXYxOTErDiBRXB3QQ3hb9uFdtTJaXQAegWzN57fAIJrZu4l/ufTLA1WZQPMwxNOgf0VPDkse+7mEF6iaZkYC5nABnCsarZ804fZL/BE8BcFT+WRKfhYDKblzN17zH2bjH6pEByn88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780963996; c=relaxed/simple;
	bh=y2WN+zbIVletBNlcYrPWqP7PYmuBiUC6HOGeboQu8hE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gqLYqIQmf1xH/2yy6CGEP1ksjyL6MmT6GTdfRJ02xxEvkM1SpmNqDSQoR1gUM7DVVFy61ToMiuiDCaxCuNtgIhra28jVo6KkndOolJyWM4ItfgYNsB0wT5hKo9v0dpqGZyNqnaz30LY3lsszmLR09NvG6JgiTgPlQ9rGs91BZ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hocbvmyJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hocbvmyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780963995; x=1812499995;
  h=date:from:to:cc:subject:message-id;
  bh=y2WN+zbIVletBNlcYrPWqP7PYmuBiUC6HOGeboQu8hE=;
  b=hocbvmyJoxVd6BdXEbZCy0bo++U6UVimehHsZhnNJ8wTKDIjO0yH93C8
   6lzfdFp6e1Ssyz+v1vsiZ4BTag3rlIe0L8AyDB+XmPSwKpAzvsugRxs5k
   IF1lrmejguaGupYZus+L9oAztZ5h+6dLSAILsnzNu7HdcLIJ4TG+mKEcp
   ZQE/adzwoPYyCwKIEci61l1ywiEiZY7I4EtesGobl0yiaXGjRlt1yNwoU
   Y547vdV47Cj76FQTVwR3OGWwb1QvXjXUNr935ejpshcBJ8L/96NNK4Jp5
   YuQB0raTicHnNauHy3qR8XvGZV4EEEcb01ewOLsfeiDCz9Aj+ES5lLwSS
   g==;
X-CSE-ConnectionGUID: PhjhcaoRTxCXivowy88W2w==
X-CSE-MsgGUID: nJu3Wt0LQlqcVldDFPYMIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81568450"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="81568450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 17:13:14 -0700
X-CSE-ConnectionGUID: mgGfuylIQAKE/nKTRmHJBQ==
X-CSE-MsgGUID: OrykrkuuTAeqZaCVtER3KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="244567578"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 Jun 2026 17:13:12 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWk5e-000000003MT-0u1e;
	Tue, 09 Jun 2026 00:13:10 +0000
Date: Tue, 09 Jun 2026 02:12:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: util/../arch/riscv/include/dwarf-regs-table.h:5:9: error:
 "REG_DWARFNUM_NAME" redefined
Message-ID: <202606090218.tQqZNyXh-lkp@intel.com>
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
TO: Martin Kaiser <martin@kaiser.cx>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Martin-Kaiser/perf-riscv-fix-register-name-strings/20260609-035725
head:   264ab513b9ec0917b46a1e4fb3c5b59d48813031
commit: 264ab513b9ec0917b46a1e4fb3c5b59d48813031 perf riscv: fix register name strings
date:   4 hours ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260609/202606090218.tQqZNyXh-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606090218.tQqZNyXh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606090218.tQqZNyXh-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:563: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:937: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1043: No babeltrace2 found, disables 'perf data' CTF format support, please install libbabeltrace2-dev[el]
   Makefile.config:1133: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc5.g264ab513b9ec
   In file included from util/dwarf-regs.c:23:
>> util/../arch/riscv/include/dwarf-regs-table.h:5:9: error: "REG_DWARFNUM_NAME" redefined [-Werror]
       5 | #define REG_DWARFNUM_NAME(reg, idx)     [idx] = reg
         |         ^~~~~~~~~~~~~~~~~
   In file included from util/dwarf-regs.c:22:
   util/../arch/powerpc/include/dwarf-regs-table.h:10:9: note: this is the location of the previous definition
      10 | #define REG_DWARFNUM_NAME(reg, idx)     [idx] = "%" #reg
         |         ^~~~~~~~~~~~~~~~~
   In file included from util/dwarf-regs.c:24:
>> util/../arch/s390/include/dwarf-regs-table.h:5:9: error: "REG_DWARFNUM_NAME" redefined [-Werror]
       5 | #define REG_DWARFNUM_NAME(reg, idx)     [idx] = "%" #reg
         |         ^~~~~~~~~~~~~~~~~
   util/../arch/riscv/include/dwarf-regs-table.h:5:9: note: this is the location of the previous definition
       5 | #define REG_DWARFNUM_NAME(reg, idx)     [idx] = reg
         |         ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:95: util/dwarf-regs.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: util] Error 2
   make[2]: *** [Makefile.perf:578: perf-util-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:288: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
