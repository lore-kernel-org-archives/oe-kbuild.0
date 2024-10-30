Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A500C1E4AE
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 12:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730291953; cv=none; b=DjntEHui/rTExW973b+n7WVxjFWtRYrmA3qng4MJurX9JrtEjsE67z4yUwAjM0hH0cQvJUgyof92hL/bZCRthEEsAfbzG3ssqI0aCZ7XVRT+xnkC/V3Gb0iV2fFe5tJCbnyApcS7bwr2oACM7P8pG4z/pLrw+pCQSi/IqyaJUwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730291953; c=relaxed/simple;
	bh=tQuzl/fm0LrWwN7H1gWXacWDLVwuFB++XctJkbNg/AU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJiwlT9GLW5AZKjNsQnCIXL6LtAxUSYJWeXpMPE76pxvIf1RiEXUfsBoSz5lOC+zQy+tRU82AjPrEwNp8PhYJc2KBNPg8RZi5CkB6P50lBf5ywM+o3BKNCwj4SD40wNWIqTvYOGOPmm0rDLIlTTCMSUkqDoBrAp8bwnBzKCHepM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XATViEJv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XATViEJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730291951; x=1761827951;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tQuzl/fm0LrWwN7H1gWXacWDLVwuFB++XctJkbNg/AU=;
  b=XATViEJvZcMKRxEpC4TYr1IcYRevLAIsLwN9OAehHMCZ4Pm/4BiOGRMM
   P27J9r7jfTw5h8NxqI3NBkiBVZJj7ixR39FKRefjF62guPhAlIXJtPsgw
   SiVKR4HVVivM99UPeIRKnNpcOKYeQei+JqmTi4hAOBmSeICh1kKa+RRJo
   AQMHttLw3gZU2ihf6xG+jKht4CXt86QUOyOt+neHWj18wntqZRqgtjSEC
   ZV4N1s2iJkCkkgMwFl8jrZBWJnobjHvX4POXaU3MF6CLEqIrp3ss0t8wW
   xfyB5arGrQa0tPBIwfuvSVsFOP0d14KlkNt638rYFAZZ1Owilbd1yAGIK
   A==;
X-CSE-ConnectionGUID: XGjpe7ClSSaML/Io2OsNrw==
X-CSE-MsgGUID: /Iupb2dUS8aacOtNgYhY7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="33788106"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="33788106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 05:39:10 -0700
X-CSE-ConnectionGUID: 8HPie8bQSWmZgih3NPmRaQ==
X-CSE-MsgGUID: gvV5gs3LTjuH70xYDyp3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="119765421"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2024 05:39:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t67yc-000eqA-2a;
	Wed, 30 Oct 2024 12:39:06 +0000
Date: Wed, 30 Oct 2024 20:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/traps.c:62 dump_instr() error: uninitialized
 symbol 'val'.
Message-ID: <202410302031.iWYd3SJk-lkp@intel.com>
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
head:   c1e939a21eb111a6d6067b38e8e04b8809b64c4e
commit: b8a03a634129b61a7ec69ece4460297ffbd790dc riscv: add userland instruction dump to RISC-V splats
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-r071-20241030 (https://download.01.org/0day-ci/archive/20241030/202410302031.iWYd3SJk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410302031.iWYd3SJk-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/traps.c:62 dump_instr() error: uninitialized symbol 'val'.

Old smatch warnings:
arch/riscv/include/asm/syscall.h:88 syscall_handler() warn: inconsistent indenting
arch/riscv/kernel/traps.c:375 is_valid_bugaddr() warn: unsigned 'pc' is never less than zero.

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
