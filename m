Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E891DF74F
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770840710; cv=none; b=nFuZNgQllKa8tuTnVs8lwyTxK7+3KuSJsmmzX6Fy5GBiWYKeU/+3u9JF3VErY6fzlOJt/rI3sK4zSpBvtvrWZc+lFaOSzS9xEtL4fa3iC6WtA+1TIlcX7anBzeAc9tArO/fNvNQnABg6ckgPFJ/+e0WUjpXEpl1n5j8vn+Y2tLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770840710; c=relaxed/simple;
	bh=WoMaj9eyA+Vf7S8wdDqpGzaUAgfyF3am4exkkHdv2hI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f4GZVGnl03Gx+woJItgu5uSBaTj0HZJJiDaPUkE8EWcD1q/bmznymgWqdouY27p2ENVPKaBKge0bIGZ+jyr5KhGE9HPJwGZcCbc0jGpNJAL60cdCWcXf8Hu0kIdhNTkC1KhIPgFXNJhlr4QutqyO9n4NZmcu/CuZ0283Y27BTts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBHVi5M+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBHVi5M+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770840710; x=1802376710;
  h=date:from:to:cc:subject:message-id;
  bh=WoMaj9eyA+Vf7S8wdDqpGzaUAgfyF3am4exkkHdv2hI=;
  b=GBHVi5M+BYFD0UslSV3UllLwF29Bmcj7SL9KsaG4SYQKpYbjMncJ0WUG
   06hzlEZXWlPTJS31h2BpqjhmVq1eRGmEiNgYaBES33MEtDTsor67MZUoe
   GZ5caHTT5J4V+OtuYoAic65tF/7Ax0GQKjylVcWATM92ZPFXTtV4PoPy7
   QXL4X1j5IVxGDyDEgvAUAXCiv3aba8BNe0ozcxhoR1fZmNF8XnaYQ+P3e
   71yWGiH5Vio7s5GD1pCIIbnxNT5OGROA3B6wLmdL6prkjx8JS1wibeM6M
   t01hYGLVHhX/6Z1auzMPj/tswV3dgUYsUjpIb1cwDu6buunYg2JRAtJgw
   g==;
X-CSE-ConnectionGUID: WigjpD8mSd6JNUF9jrC+3Q==
X-CSE-MsgGUID: IprKSr5aRryTOti8qI2Sjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71714347"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71714347"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 12:11:50 -0800
X-CSE-ConnectionGUID: jVZtmTzERmms5Mi6NfjK0Q==
X-CSE-MsgGUID: xWpuJlGgRDKxtbk4AxgjgA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2026 12:11:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqGYs-00000000qL4-0D8s;
	Wed, 11 Feb 2026 20:11:46 +0000
Date: Thu, 12 Feb 2026 04:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:io_uring-bpf-update 2/2] io_uring/bpf_filter.c:339
 io_bpf_filter_import() warn: potential spectre issue 'io_issue_defs' [r]
Message-ID: <202602120432.QXRJtyKw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-update
head:   285f747e2b91b6dd2426efd4e197137fd26f14bd
commit: 285f747e2b91b6dd2426efd4e197137fd26f14bd [2/2] io_uring/bpf_filter: pass in expected filter payload size
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-141-20260212 (https://download.01.org/0day-ci/archive/20260212/202602120432.QXRJtyKw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602120432.QXRJtyKw-lkp@intel.com/

smatch warnings:
io_uring/bpf_filter.c:339 io_bpf_filter_import() warn: potential spectre issue 'io_issue_defs' [r]

vim +/io_issue_defs +339 io_uring/bpf_filter.c

ed82f35b926b2e Jens Axboe 2026-01-08  310  
285f747e2b91b6 Jens Axboe 2026-02-10  311  #define IO_URING_BPF_FILTER_FLAGS	(IO_URING_BPF_FILTER_DENY_REST | \
285f747e2b91b6 Jens Axboe 2026-02-10  312  					 IO_URING_BPF_FILTER_SZ_STRICT)
d42eb05e60fea3 Jens Axboe 2026-01-15  313  
285f747e2b91b6 Jens Axboe 2026-02-10  314  static int io_bpf_filter_import(struct io_uring_bpf *reg,
d42eb05e60fea3 Jens Axboe 2026-01-15  315  				struct io_uring_bpf __user *arg)
d42eb05e60fea3 Jens Axboe 2026-01-15  316  {
285f747e2b91b6 Jens Axboe 2026-02-10  317  	const struct io_issue_def *def;
d42eb05e60fea3 Jens Axboe 2026-01-15  318  	int ret;
d42eb05e60fea3 Jens Axboe 2026-01-15  319  
285f747e2b91b6 Jens Axboe 2026-02-10  320  	if (copy_from_user(reg, arg, sizeof(*reg)))
d42eb05e60fea3 Jens Axboe 2026-01-15  321  		return -EFAULT;
285f747e2b91b6 Jens Axboe 2026-02-10  322  	if (reg->cmd_type != IO_URING_BPF_CMD_FILTER)
d42eb05e60fea3 Jens Axboe 2026-01-15  323  		return -EINVAL;
285f747e2b91b6 Jens Axboe 2026-02-10  324  	if (reg->cmd_flags || reg->resv)
d42eb05e60fea3 Jens Axboe 2026-01-15  325  		return -EINVAL;
d42eb05e60fea3 Jens Axboe 2026-01-15  326  
285f747e2b91b6 Jens Axboe 2026-02-10  327  	if (reg->filter.opcode >= IORING_OP_LAST)
d42eb05e60fea3 Jens Axboe 2026-01-15  328  		return -EINVAL;
285f747e2b91b6 Jens Axboe 2026-02-10  329  	if (reg->filter.flags & ~IO_URING_BPF_FILTER_FLAGS)
d42eb05e60fea3 Jens Axboe 2026-01-15  330  		return -EINVAL;
285f747e2b91b6 Jens Axboe 2026-02-10  331  	if (!mem_is_zero(reg->filter.resv, sizeof(reg->filter.resv)))
d42eb05e60fea3 Jens Axboe 2026-01-15  332  		return -EINVAL;
285f747e2b91b6 Jens Axboe 2026-02-10  333  	if (!mem_is_zero(reg->filter.resv2, sizeof(reg->filter.resv2)))
d42eb05e60fea3 Jens Axboe 2026-01-15  334  		return -EINVAL;
285f747e2b91b6 Jens Axboe 2026-02-10  335  	if (!reg->filter.filter_len || reg->filter.filter_len > BPF_MAXINSNS)
d42eb05e60fea3 Jens Axboe 2026-01-15  336  		return -EINVAL;
d42eb05e60fea3 Jens Axboe 2026-01-15  337  
285f747e2b91b6 Jens Axboe 2026-02-10  338  	/* Verify filter size */
285f747e2b91b6 Jens Axboe 2026-02-10 @339  	def = &io_issue_defs[reg->filter.opcode];
285f747e2b91b6 Jens Axboe 2026-02-10  340  
285f747e2b91b6 Jens Axboe 2026-02-10  341  	/* same size, always ok */
285f747e2b91b6 Jens Axboe 2026-02-10  342  	ret = 0;
285f747e2b91b6 Jens Axboe 2026-02-10  343  	if (reg->filter.pdu_size == def->filter_pdu_size)
285f747e2b91b6 Jens Axboe 2026-02-10  344  		;
285f747e2b91b6 Jens Axboe 2026-02-10  345  	/* size differs, fail in strict mode */
285f747e2b91b6 Jens Axboe 2026-02-10  346  	else if (reg->filter.flags & IO_URING_BPF_FILTER_SZ_STRICT)
285f747e2b91b6 Jens Axboe 2026-02-10  347  		ret = -EMSGSIZE;
285f747e2b91b6 Jens Axboe 2026-02-10  348  	/* userspace filter is bigger, always disallow */
285f747e2b91b6 Jens Axboe 2026-02-10  349  	else if (reg->filter.pdu_size > def->filter_pdu_size)
285f747e2b91b6 Jens Axboe 2026-02-10  350  		ret = -EMSGSIZE;
285f747e2b91b6 Jens Axboe 2026-02-10  351  
285f747e2b91b6 Jens Axboe 2026-02-10  352  	/* copy back kernel filter size */
285f747e2b91b6 Jens Axboe 2026-02-10  353  	reg->filter.pdu_size = def->filter_pdu_size;
285f747e2b91b6 Jens Axboe 2026-02-10  354  	if (copy_to_user(&arg->filter, &reg->filter, sizeof(reg->filter)))
285f747e2b91b6 Jens Axboe 2026-02-10  355  		return -EFAULT;
285f747e2b91b6 Jens Axboe 2026-02-10  356  
285f747e2b91b6 Jens Axboe 2026-02-10  357  	return ret;
285f747e2b91b6 Jens Axboe 2026-02-10  358  }
285f747e2b91b6 Jens Axboe 2026-02-10  359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
