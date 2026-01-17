Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B22832AAA6
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 06:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768630966; cv=none; b=XlDKFDtoLOaQ8pwVYmsijwyflG1dG7ggb4CSiwnvCHMIfVKcUVddnqmYvYdlJ/cdMdA9PJ6ZvK+RrpuzGZzHKvXzDlaaAFu7D7sYypY7brqyAp2RiAv8bg3lek6bX5noBTL1myyp3GTV7yh1UEE/RmdzBh7rqa4qyCzt97ylKMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768630966; c=relaxed/simple;
	bh=1MZCINB49tuhYjEUcCXuWc7yGuwPiIZN/opT8Vc9yNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hlNh+qc7sosaMeKyVjDef2c6sdhxk3+IBCDRRdWbCoqx0E4OBNqffT6yX1LENSbJiJ3uDzr/e8VnEpIv/CZDJXA6UzGDKME4YbAbFBwikXvfIBdU6kAvF9Et510l9zAgMW9GHnsXD7zu7lQ3YG2lJl5AKaONzJWC0cLEfD/kSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fThYc7cf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fThYc7cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768630965; x=1800166965;
  h=date:from:to:cc:subject:message-id;
  bh=1MZCINB49tuhYjEUcCXuWc7yGuwPiIZN/opT8Vc9yNw=;
  b=fThYc7cfsuflkBWqfV2n7EPokRbKiLjQR1V3pkAhNa2hEbHzkdo4oIcQ
   wBf8aN0R1H+fKJ8+JM5ZWODxwGOMCfRgK7Xx/Z3J3oQu8hp4EsjZx0ggJ
   5bm5A/tJfXD2sSwdA9WawuA6Zw4WkxkY4NtFaYx8kZ32HmuhcUm5J0NXc
   LVxhKA6KhUpGYq7calCdRjJoW6yGkgk2evtsgbuZTCKLIcC/XsO22hjjO
   WQolLmFR5Bi6TuvKjAYqXdOZp5+vHYPjU/eW2SwLdRsHLIYmQPn9DgAba
   jf4nykqew52GSTQ1g91meqKhmKaz1amL1lbcUwDz0gEeniyllZ5xb70Or
   g==;
X-CSE-ConnectionGUID: Hqf1MiAwRj6oNfsLxCTVMg==
X-CSE-MsgGUID: +MCm+ajkRhC6srgCGH1yBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69987902"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69987902"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 22:22:44 -0800
X-CSE-ConnectionGUID: PfqoDYZxTLqehKf5KOVQ5A==
X-CSE-MsgGUID: k7RtAzNTQnq81NZMHHASBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205319087"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jan 2026 22:22:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgzho-00000000LcM-0Fot;
	Sat, 17 Jan 2026 06:22:40 +0000
Date: Sat, 17 Jan 2026 14:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:io_uring-bpf-restrictions 14/18]
 io_uring/bpf_filter.c:256 io_register_bpf_filter() warn: potential spectre
 issue 'filters->filters' [r]
Message-ID: <202601171431.NW4PzMil-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   d3474bae5b568f9ee17d7000470d138b54d89c79
commit: b8e73b4b241d2c9e1301dcea696109d30914bedf [14/18] io_uring: add support for BPF filtering for opcode restrictions
:::::: branch date: 7 hours ago
:::::: commit date: 8 hours ago
config: alpha-randconfig-r072-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171431.NW4PzMil-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601171431.NW4PzMil-lkp@intel.com/

smatch warnings:
io_uring/bpf_filter.c:256 io_register_bpf_filter() warn: potential spectre issue 'filters->filters' [r]

vim +256 io_uring/bpf_filter.c

b8e73b4b241d2c Jens Axboe 2026-01-15  201  
b8e73b4b241d2c Jens Axboe 2026-01-15  202  int io_register_bpf_filter(struct io_restriction *res,
b8e73b4b241d2c Jens Axboe 2026-01-15  203  			   struct io_uring_bpf __user *arg)
b8e73b4b241d2c Jens Axboe 2026-01-15  204  {
b8e73b4b241d2c Jens Axboe 2026-01-15  205  	struct io_bpf_filter *filter, *old_filter;
b8e73b4b241d2c Jens Axboe 2026-01-15  206  	struct io_bpf_filters *filters;
b8e73b4b241d2c Jens Axboe 2026-01-15  207  	struct io_uring_bpf reg;
b8e73b4b241d2c Jens Axboe 2026-01-15  208  	struct bpf_prog *prog;
b8e73b4b241d2c Jens Axboe 2026-01-15  209  	int ret;
b8e73b4b241d2c Jens Axboe 2026-01-15  210  
b8e73b4b241d2c Jens Axboe 2026-01-15  211  	if (copy_from_user(&reg, arg, sizeof(reg)))
b8e73b4b241d2c Jens Axboe 2026-01-15  212  		return -EFAULT;
b8e73b4b241d2c Jens Axboe 2026-01-15  213  	if (reg.cmd_type != IO_URING_BPF_CMD_FILTER)
b8e73b4b241d2c Jens Axboe 2026-01-15  214  		return -EINVAL;
b8e73b4b241d2c Jens Axboe 2026-01-15  215  	if (reg.cmd_flags || reg.resv)
b8e73b4b241d2c Jens Axboe 2026-01-15  216  		return -EINVAL;
b8e73b4b241d2c Jens Axboe 2026-01-15  217  
b8e73b4b241d2c Jens Axboe 2026-01-15  218  	if (reg.filter.opcode >= IORING_OP_LAST)
b8e73b4b241d2c Jens Axboe 2026-01-15  219  		return -EINVAL;
b8e73b4b241d2c Jens Axboe 2026-01-15  220  	if ((reg.filter.flags & ~IO_URING_BPF_FILTER_DENY_REST) ||
b8e73b4b241d2c Jens Axboe 2026-01-15  221  	    !mem_is_zero(reg.filter.reserved, sizeof(reg.filter.reserved)))
b8e73b4b241d2c Jens Axboe 2026-01-15  222  		return -EINVAL;
b8e73b4b241d2c Jens Axboe 2026-01-15  223  	if (reg.filter.prog_fd < 0)
b8e73b4b241d2c Jens Axboe 2026-01-15  224  		return -EBADF;
b8e73b4b241d2c Jens Axboe 2026-01-15  225  
b8e73b4b241d2c Jens Axboe 2026-01-15  226  	/*
b8e73b4b241d2c Jens Axboe 2026-01-15  227  	 * No existing filters, allocate set.
b8e73b4b241d2c Jens Axboe 2026-01-15  228  	 */
b8e73b4b241d2c Jens Axboe 2026-01-15  229  	filters = res->bpf_filters;
b8e73b4b241d2c Jens Axboe 2026-01-15  230  	if (!filters) {
b8e73b4b241d2c Jens Axboe 2026-01-15  231  		filters = io_new_bpf_filters();
b8e73b4b241d2c Jens Axboe 2026-01-15  232  		if (IS_ERR(filters))
b8e73b4b241d2c Jens Axboe 2026-01-15  233  			return PTR_ERR(filters);
b8e73b4b241d2c Jens Axboe 2026-01-15  234  	}
b8e73b4b241d2c Jens Axboe 2026-01-15  235  
b8e73b4b241d2c Jens Axboe 2026-01-15  236  	prog = bpf_prog_get_type(reg.filter.prog_fd, BPF_PROG_TYPE_IO_URING);
b8e73b4b241d2c Jens Axboe 2026-01-15  237  	if (IS_ERR(prog)) {
b8e73b4b241d2c Jens Axboe 2026-01-15  238  		ret = PTR_ERR(prog);
b8e73b4b241d2c Jens Axboe 2026-01-15  239  		goto err;
b8e73b4b241d2c Jens Axboe 2026-01-15  240  	}
b8e73b4b241d2c Jens Axboe 2026-01-15  241  
b8e73b4b241d2c Jens Axboe 2026-01-15  242  	filter = kzalloc(sizeof(*filter), GFP_KERNEL_ACCOUNT);
b8e73b4b241d2c Jens Axboe 2026-01-15  243  	if (!filter) {
b8e73b4b241d2c Jens Axboe 2026-01-15  244  		ret = -ENOMEM;
b8e73b4b241d2c Jens Axboe 2026-01-15  245  		goto err;
b8e73b4b241d2c Jens Axboe 2026-01-15  246  	}
b8e73b4b241d2c Jens Axboe 2026-01-15  247  	filter->prog = prog;
b8e73b4b241d2c Jens Axboe 2026-01-15  248  	res->bpf_filters = filters;
b8e73b4b241d2c Jens Axboe 2026-01-15  249  
b8e73b4b241d2c Jens Axboe 2026-01-15  250  	/*
b8e73b4b241d2c Jens Axboe 2026-01-15  251  	 * Insert filter - if the current opcode already has a filter
b8e73b4b241d2c Jens Axboe 2026-01-15  252  	 * attached, add to the set.
b8e73b4b241d2c Jens Axboe 2026-01-15  253  	 */
b8e73b4b241d2c Jens Axboe 2026-01-15  254  	rcu_read_lock();
b8e73b4b241d2c Jens Axboe 2026-01-15  255  	spin_lock_bh(&filters->lock);
b8e73b4b241d2c Jens Axboe 2026-01-15 @256  	old_filter = rcu_dereference(filters->filters[reg.filter.opcode]);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
