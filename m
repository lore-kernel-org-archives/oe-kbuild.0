Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844B13FE2
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlGPZFYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701038417; x=1732574417;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=usAV6Whf9FH2YBidQzrG74Tij6/jTrejgX8UFCe2f7M=;
  b=DlGPZFYr6AL8qmcKfMf0VWbuCciP9x/+r/5A/U18uDUhKSLllVa/OKTr
   O7hwpwOJn1umel7Y0k/wwVou8wZrMzVzOoxVeH+IRgLNE2uFfGMrJ2weQ
   FB0ESP6nBMQK6Wu7VW+jP/pS9qxVBWL5/OvctaJ6uCs24y/r7qJb4gE4g
   YThEsbIxJ+yz7xrhKhzETxct826Pch1a21815oJJBFxWAtubTU8WXrJ2C
   uoYseXxGq9V1anu6B8DIvD3RMfrW2t1Q9bERQqtXquCgHkiaQeLhEmVRI
   3hrMCstazIaGqQk+OHizWtyJin68rFqqioAwDgPzaTWJIygyVyHeObSIl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="383006570"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="383006570"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 14:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="885824014"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="885824014"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2023 14:40:15 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7NnR-0005aV-1c;
	Sun, 26 Nov 2023 22:40:13 +0000
Date: Mon, 27 Nov 2023 06:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/traps.c:62 dump_instr() error: uninitialized
 symbol 'val'.
Message-ID: <202311270307.vlK7NGyN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yunhui Cui <cuiyunhui@bytedance.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: "Björn Töpel" <bjorn@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2da77f431ac49b5763b88751a75f70daa46296c
commit: b8a03a634129b61a7ec69ece4460297ffbd790dc riscv: add userland instruction dump to RISC-V splats
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270307.vlK7NGyN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270307.vlK7NGyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311270307.vlK7NGyN-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/traps.c:62 dump_instr() error: uninitialized symbol 'val'.

Old smatch warnings:
arch/riscv/include/asm/syscall.h:88 syscall_handler() warn: inconsistent indenting

vim +/val +62 arch/riscv/kernel/traps.c

b8a03a634129b6 Yunhui Cui  2023-09-12  50  
b8a03a634129b6 Yunhui Cui  2023-09-12  51  static void dump_instr(const char *loglvl, struct pt_regs *regs)
eb165bfa8eafc3 Björn Töpel 2023-01-19  52  {
eb165bfa8eafc3 Björn Töpel 2023-01-19  53  	char str[sizeof("0000 ") * 12 + 2 + 1], *p = str;
eb165bfa8eafc3 Björn Töpel 2023-01-19  54  	const u16 *insns = (u16 *)instruction_pointer(regs);
eb165bfa8eafc3 Björn Töpel 2023-01-19  55  	long bad;
eb165bfa8eafc3 Björn Töpel 2023-01-19  56  	u16 val;
eb165bfa8eafc3 Björn Töpel 2023-01-19  57  	int i;
eb165bfa8eafc3 Björn Töpel 2023-01-19  58  
eb165bfa8eafc3 Björn Töpel 2023-01-19  59  	for (i = -10; i < 2; i++) {
b8a03a634129b6 Yunhui Cui  2023-09-12  60  		bad = copy_code(regs, &val, &insns[i]);
eb165bfa8eafc3 Björn Töpel 2023-01-19  61  		if (!bad) {
eb165bfa8eafc3 Björn Töpel 2023-01-19 @62  			p += sprintf(p, i == 0 ? "(%04hx) " : "%04hx ", val);
eb165bfa8eafc3 Björn Töpel 2023-01-19  63  		} else {
eb165bfa8eafc3 Björn Töpel 2023-01-19  64  			printk("%sCode: Unable to access instruction at 0x%px.\n",
eb165bfa8eafc3 Björn Töpel 2023-01-19  65  			       loglvl, &insns[i]);
eb165bfa8eafc3 Björn Töpel 2023-01-19  66  			return;
eb165bfa8eafc3 Björn Töpel 2023-01-19  67  		}
eb165bfa8eafc3 Björn Töpel 2023-01-19  68  	}
eb165bfa8eafc3 Björn Töpel 2023-01-19  69  	printk("%sCode: %s\n", loglvl, str);
eb165bfa8eafc3 Björn Töpel 2023-01-19  70  }
eb165bfa8eafc3 Björn Töpel 2023-01-19  71  

:::::: The code at line 62 was first introduced by commit
:::::: eb165bfa8eafc3d306e34b238e53aafb35dce102 riscv: Add instruction dump to RISC-V splats

:::::: TO: Björn Töpel <bjorn@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
