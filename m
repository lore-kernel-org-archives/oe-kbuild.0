Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0196130AAB3
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 21:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600227; cv=none; b=HPNsbhUa/fcMkzoeZGFmcMpKHekE6MyXGGSAEEzkrhQMEszcBG2tzU4MxRn37hRG4jQJ9V99x9xaQFpThLeL/E4J2ZG+Giju+KobTa9ucH78jYQX/GkBxUA2avhS1pSO5A2d3erW3phrwjr+obH6oMeUy41ZSd5leQqdEXeH+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600227; c=relaxed/simple;
	bh=Aw7e9RvT/imWG1fcHLPDmMhMkvfHygFZIlyWSeVjqXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NESMUXNSfKpYX68Sq7kqMH1GFqsOuRAzZDEDtaDCaepRdsrnmSfQ6YZFHZmJcYfHQ58GwXP+BoixrHWm62CRrHWjc8ckfVq6ysTfHl2njq/Va2KKLDa0OvoOwzk9euWsPlmD2jx2Fcj5aTv4EYElUnIuiwWz3v9rPd80ODrDsBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJorFd6G; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJorFd6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768600226; x=1800136226;
  h=date:from:to:cc:subject:message-id;
  bh=Aw7e9RvT/imWG1fcHLPDmMhMkvfHygFZIlyWSeVjqXg=;
  b=QJorFd6Gx+o2FeN+rbMx73WPEO2dvFxxR+2b0ZkzlVvQaJZ2+qeJmsoc
   LBLEdtFWER2xvHr0q1nzRcXA0uxdxCaw3t3UU+TgsBw+a1B8m/suGyn5F
   deJPxtJ1xGQ3bzPxmr6gNwXvoLwqpH2bb+2k5LjF5ccb/x5unoFuUvV/U
   tJs2w2Ib/RJ05qcvLt3AErGlhTjc5tC+TPsYZryFQ+xZOVpmx8m1rTKLo
   9us5v+kSYiIObFMCGYMCGg86AxusMEI/xfJL5ej0atTzPUe9K5hNAhriF
   ntNvveRkCkxBaKjuM7gkEkRuXvLbNdUU3N1dNnGb6mzQjl+FCCzMQLl7P
   A==;
X-CSE-ConnectionGUID: /yPxQk/rQ1aj7f7VtwPDtw==
X-CSE-MsgGUID: N++QOqlDQnOxksGW3h2uHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81364048"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="81364048"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:50:24 -0800
X-CSE-ConnectionGUID: a/+wxiF+TA+4gUO6Fyf2ZQ==
X-CSE-MsgGUID: x/c55aXJTwqc74cbnthppQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="210357914"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2026 13:50:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgrhz-00000000LHa-3sya;
	Fri, 16 Jan 2026 21:50:19 +0000
Date: Sat, 17 Jan 2026 05:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6803/6849] drivers/misc/lkdtm/bugs.c:564
 lkdtm_PTR_BOUNDS() warn: potentially one past the end of array
 'inst->extra[inst->nr_extra]'
Message-ID: <202601170509.iS1meoZp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: c6efc55bed87549bf19f69337f3b94dce39e4d9e [6803/6849] lkdtm/bugs: Add __counted_by_ptr() test PTR_BOUNDS
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170509.iS1meoZp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601170509.iS1meoZp-lkp@intel.com/

New smatch warnings:
drivers/misc/lkdtm/bugs.c:564 lkdtm_PTR_BOUNDS() warn: potentially one past the end of array 'inst->extra[inst->nr_extra]'
drivers/misc/lkdtm/bugs.c:564 lkdtm_PTR_BOUNDS() warn: potentially one past the end of array 'inst->extra[inst->nr_extra]'

Old smatch warnings:
drivers/misc/lkdtm/bugs.c:457 lkdtm_ARRAY_BOUNDS() error: buffer overflow 'checked->data' 8 <= 8

vim +564 drivers/misc/lkdtm/bugs.c

c6efc55bed8754 Kees Cook 2025-10-20  531  
c6efc55bed8754 Kees Cook 2025-10-20  532  static void lkdtm_PTR_BOUNDS(void)
c6efc55bed8754 Kees Cook 2025-10-20  533  {
c6efc55bed8754 Kees Cook 2025-10-20  534  	struct lkdtm_cb_ptr *inst;
c6efc55bed8754 Kees Cook 2025-10-20  535  
c6efc55bed8754 Kees Cook 2025-10-20  536  	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
c6efc55bed8754 Kees Cook 2025-10-20  537  	if (!inst) {
c6efc55bed8754 Kees Cook 2025-10-20  538  		pr_err("FAIL: could not allocate struct lkdtm_cb_ptr!\n");
c6efc55bed8754 Kees Cook 2025-10-20  539  		return;
c6efc55bed8754 Kees Cook 2025-10-20  540  	}
c6efc55bed8754 Kees Cook 2025-10-20  541  
c6efc55bed8754 Kees Cook 2025-10-20  542  	inst->buf = kzalloc(element_count, GFP_KERNEL);
c6efc55bed8754 Kees Cook 2025-10-20  543  	if (!inst->buf) {
c6efc55bed8754 Kees Cook 2025-10-20  544  		pr_err("FAIL: could not allocate inst->buf!\n");
c6efc55bed8754 Kees Cook 2025-10-20  545  		return;
c6efc55bed8754 Kees Cook 2025-10-20  546  	}
c6efc55bed8754 Kees Cook 2025-10-20  547  	inst->len = element_count;
c6efc55bed8754 Kees Cook 2025-10-20  548  
c6efc55bed8754 Kees Cook 2025-10-20  549  	/* Double element_count */
c6efc55bed8754 Kees Cook 2025-10-20  550  	inst->extra = kcalloc(element_count * 2, sizeof(*inst->extra), GFP_KERNEL);
c6efc55bed8754 Kees Cook 2025-10-20  551  	inst->nr_extra = element_count * 2;
c6efc55bed8754 Kees Cook 2025-10-20  552  
c6efc55bed8754 Kees Cook 2025-10-20  553  	pr_info("Pointer access within bounds ...\n");
c6efc55bed8754 Kees Cook 2025-10-20  554  	check_ptr_len(inst, 4);
c6efc55bed8754 Kees Cook 2025-10-20  555  	/* All 4 bytes */
c6efc55bed8754 Kees Cook 2025-10-20  556  	inst->buf[0] = 'A';
c6efc55bed8754 Kees Cook 2025-10-20  557  	inst->buf[1] = 'B';
c6efc55bed8754 Kees Cook 2025-10-20  558  	inst->buf[2] = 'C';
c6efc55bed8754 Kees Cook 2025-10-20  559  	inst->buf[3] = 'D';
c6efc55bed8754 Kees Cook 2025-10-20  560  	/* Halfway into the array */
c6efc55bed8754 Kees Cook 2025-10-20  561  	inst->extra[element_count].biggest = 0x1000;
c6efc55bed8754 Kees Cook 2025-10-20  562  
c6efc55bed8754 Kees Cook 2025-10-20  563  	pr_info("Pointer access beyond bounds ...\n");
c6efc55bed8754 Kees Cook 2025-10-20 @564  	ignored = inst->extra[inst->nr_extra].b;
c6efc55bed8754 Kees Cook 2025-10-20  565  
c6efc55bed8754 Kees Cook 2025-10-20  566  	kfree(inst->extra);
c6efc55bed8754 Kees Cook 2025-10-20  567  	kfree(inst->buf);
c6efc55bed8754 Kees Cook 2025-10-20  568  	kfree(inst);
c6efc55bed8754 Kees Cook 2025-10-20  569  
c6efc55bed8754 Kees Cook 2025-10-20  570  	pr_err("FAIL: survived access of invalid pointer member offset!\n");
c6efc55bed8754 Kees Cook 2025-10-20  571  
c6efc55bed8754 Kees Cook 2025-10-20  572  	if (!IS_ENABLED(CONFIG_CC_HAS_COUNTED_BY_PTR))
c6efc55bed8754 Kees Cook 2025-10-20  573  		pr_warn("This is expected since this %s was built with a compiler that does not support __counted_by_ptr\n",
c6efc55bed8754 Kees Cook 2025-10-20  574  			lkdtm_kernel_info);
c6efc55bed8754 Kees Cook 2025-10-20  575  	else if (IS_ENABLED(CONFIG_UBSAN_BOUNDS))
c6efc55bed8754 Kees Cook 2025-10-20  576  		pr_expected_config(CONFIG_UBSAN_TRAP);
c6efc55bed8754 Kees Cook 2025-10-20  577  	else
c6efc55bed8754 Kees Cook 2025-10-20  578  		pr_expected_config(CONFIG_UBSAN_BOUNDS);
c6efc55bed8754 Kees Cook 2025-10-20  579  }
c6efc55bed8754 Kees Cook 2025-10-20  580  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
