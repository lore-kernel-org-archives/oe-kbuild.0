Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0B820C023
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723454; cv=none; b=Yus6rzWPXhk4LtwoVvvpM6FQt85Q67fwy+Qg2RCN1GGJg48s58TV7dLxp32LeoHOKH+t32wUj9+/HF8UANHhfwojnNhpUWTVjYG5uPlbVvG5Ama4ZFmImqCm389kJx7XduPPDJbCxp4F+cRoarg2vNyJNK/FGOyV1J1QWC0EkjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723454; c=relaxed/simple;
	bh=wkJYJG1nje7YBwQHbitKBLJoVoo7zfETrZC7V/vCwSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iANVwMZS//xWjzvmsjNI0Vg83HqRpsTae6+Mw2Y3rM+PbUpfTqY7ptmm+PU0LPqSKAn64EWpP9WE8aQ8Rr3wyIp9ZOt8nsmvzrSAqbbFv/WJVTBtRdLDoluZL7MtJBcIF5Ebn8qgv02dY6/xXSFWr/rotv1xsqx/e+zoq/rTK7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKUw/zUx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKUw/zUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768723453; x=1800259453;
  h=date:from:to:cc:subject:message-id;
  bh=wkJYJG1nje7YBwQHbitKBLJoVoo7zfETrZC7V/vCwSo=;
  b=LKUw/zUxHpEWzR7gVN33/LtOeZ7PJZKHYYmVPCI8m83vZOdBYioG59U6
   0vPkfLHZo1Kpr/mhMb/JMjP1BMa945e6J60/8lRPtPF6oLyUWJCSj7sQh
   HjWTF7PrL/uMqGxIyjZsOODNWmRSCxkrXgcQ+7HsQlZyjC/6FKjRTKZTT
   qQZfCRzcF+BVC6MaJPBtSuHnaccv92BAtfWBu7lpQn81CHlQ4BZPmlxmp
   8BbA35WK4ez+L2vRt2FHRw14Rh7eZxsMB7wskjO3ecmaCLfHyYII/JxA/
   cSZA00Q+aPC3z5p7zV/m+p4QJaIhItr0cIvJcx6Rk1tZQGoftylLorSwk
   w==;
X-CSE-ConnectionGUID: SeRta8ZGTgOVp4t2qeQs8g==
X-CSE-MsgGUID: Vx8I4Tm0S/KeZzTMcB+0yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69882665"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="69882665"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 00:04:13 -0800
X-CSE-ConnectionGUID: 0vCyvvLpT4KJNIUxXjWx0w==
X-CSE-MsgGUID: eMWKa6RARhOumXK8GZh8EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="209733853"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Jan 2026 00:04:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhNlY-00000000Mn0-2g7P;
	Sun, 18 Jan 2026 08:04:08 +0000
Date: Sun, 18 Jan 2026 16:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:io_uring-cbpf-restrictions 18/18]
 io_uring/bpf_filter.c:353 io_register_bpf_filter() warn: missing unwind goto?
Message-ID: <202601181534.iTkdllAn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-cbpf-restrictions
head:   0f8a03cfaae90d44799d4cd29cc308ffdd81d93e
commit: 0f8a03cfaae90d44799d4cd29cc308ffdd81d93e [18/18] io_uring: allow registration of per-task restrictions
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: m68k-randconfig-r071-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181534.iTkdllAn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601181534.iTkdllAn-lkp@intel.com/

New smatch warnings:
io_uring/bpf_filter.c:353 io_register_bpf_filter() warn: missing unwind goto?

Old smatch warnings:
io_uring/bpf_filter.c:373 io_register_bpf_filter() warn: potential spectre issue 'filters->filters' [r]

vim +353 io_uring/bpf_filter.c

0f8a03cfaae90d Jens Axboe 2026-01-08  311  
54ec4b557138b0 Jens Axboe 2026-01-15  312  int io_register_bpf_filter(struct io_restriction *res,
54ec4b557138b0 Jens Axboe 2026-01-15  313  			   struct io_uring_bpf_filter __user *arg)
54ec4b557138b0 Jens Axboe 2026-01-15  314  {
54ec4b557138b0 Jens Axboe 2026-01-15  315  	struct io_bpf_filter *filter, *old_filter;
54ec4b557138b0 Jens Axboe 2026-01-15  316  	struct io_bpf_filters *filters;
54ec4b557138b0 Jens Axboe 2026-01-15  317  	struct io_uring_bpf_filter reg;
54ec4b557138b0 Jens Axboe 2026-01-15  318  	struct sock_fprog fprog;
54ec4b557138b0 Jens Axboe 2026-01-15  319  	struct bpf_prog *prog;
54ec4b557138b0 Jens Axboe 2026-01-15  320  	int ret;
54ec4b557138b0 Jens Axboe 2026-01-15  321  
54ec4b557138b0 Jens Axboe 2026-01-15  322  	if (copy_from_user(&reg, arg, sizeof(reg)))
54ec4b557138b0 Jens Axboe 2026-01-15  323  		return -EFAULT;
54ec4b557138b0 Jens Axboe 2026-01-15  324  	if (reg.opcode >= IORING_OP_LAST)
54ec4b557138b0 Jens Axboe 2026-01-15  325  		return -EINVAL;
54ec4b557138b0 Jens Axboe 2026-01-15  326  	if (reg.flags & ~IO_URING_BPF_FILTER_DENY_REST)
54ec4b557138b0 Jens Axboe 2026-01-15  327  		return -EINVAL;
54ec4b557138b0 Jens Axboe 2026-01-15  328  	if (reg.resv || !mem_is_zero(reg.resv2, sizeof(reg.resv2)))
54ec4b557138b0 Jens Axboe 2026-01-15  329  		return -EINVAL;
54ec4b557138b0 Jens Axboe 2026-01-15  330  	if (!reg.filter_len || reg.filter_len > BPF_MAXINSNS)
54ec4b557138b0 Jens Axboe 2026-01-15  331  		return -EINVAL;
54ec4b557138b0 Jens Axboe 2026-01-15  332  
54ec4b557138b0 Jens Axboe 2026-01-15  333  	fprog.len = reg.filter_len;
54ec4b557138b0 Jens Axboe 2026-01-15  334  	fprog.filter = u64_to_user_ptr(reg.filter_ptr);
54ec4b557138b0 Jens Axboe 2026-01-15  335  
54ec4b557138b0 Jens Axboe 2026-01-15  336  	ret = bpf_prog_create_from_user(&prog, &fprog, io_uring_check_bpf_filter, false);
54ec4b557138b0 Jens Axboe 2026-01-15  337  	if (ret)
54ec4b557138b0 Jens Axboe 2026-01-15  338  		return ret;
54ec4b557138b0 Jens Axboe 2026-01-15  339  
54ec4b557138b0 Jens Axboe 2026-01-15  340  	/*
54ec4b557138b0 Jens Axboe 2026-01-15  341  	 * No existing filters, allocate set.
54ec4b557138b0 Jens Axboe 2026-01-15  342  	 */
54ec4b557138b0 Jens Axboe 2026-01-15  343  	filters = res->bpf_filters;
54ec4b557138b0 Jens Axboe 2026-01-15  344  	if (!filters) {
54ec4b557138b0 Jens Axboe 2026-01-15  345  		filters = io_new_bpf_filters();
54ec4b557138b0 Jens Axboe 2026-01-15  346  		if (IS_ERR(filters)) {
54ec4b557138b0 Jens Axboe 2026-01-15  347  			ret = PTR_ERR(filters);
54ec4b557138b0 Jens Axboe 2026-01-15  348  			goto err_filter;
54ec4b557138b0 Jens Axboe 2026-01-15  349  		}
0f8a03cfaae90d Jens Axboe 2026-01-08  350  	} else if (res->bpf_filters_cow) {
0f8a03cfaae90d Jens Axboe 2026-01-08  351  		filters = io_bpf_filter_cow(res);
0f8a03cfaae90d Jens Axboe 2026-01-08  352  		if (IS_ERR(filters))
0f8a03cfaae90d Jens Axboe 2026-01-08 @353  			return PTR_ERR(filters);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
