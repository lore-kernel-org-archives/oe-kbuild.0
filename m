Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7736C13D521
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768466698; cv=none; b=J1q7yX7niGCzfeqSvmt+DqyhCnVE6s/Sofnn14B1BcB3ceP+JfnVTJVdVxAVQtVqeV8/9dMYgb2aYeVTfZOWGppI7ltZW3XjMkERwXwgke9AOjZ4Q3umknDvQx4fFEK4k9ra93Y9PfuLW5n5YFKMDKsO8AMMingxdoRYl3663Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768466698; c=relaxed/simple;
	bh=45N1Yk+3F5NLOEHNAt4KWMOw4Lco+Uzsk4ea3frYLFE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iyADcsVnoIUSFdqkRSm5gmxRwJGQXYmZd0jYtA2vobJUYfe+0B40fCMNWaBlbptOxvCX9Acx/caBhvkIvJoHPLJ5NcUlpaIIXtOCRO2/K02o+X5b1DxBRPZoMB+Mk+TLFyB4qPdNrONCUTerg9O5qBPadatpOlfTYxxGy5lkpVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afcghPqK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afcghPqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768466696; x=1800002696;
  h=date:from:to:cc:subject:message-id;
  bh=45N1Yk+3F5NLOEHNAt4KWMOw4Lco+Uzsk4ea3frYLFE=;
  b=afcghPqK1QuTk2eISmpD3bOLfkwsVBkGQJ7HxXdEwrjJkFkZjj7mW90P
   1hpGOiYTXQxKnIhNbr754Y/vbYnw8rliGELgEHkC7ZXib7gDW+I/iKnOs
   rPVq5/k3ccgi3ydt2lT56yR+CZuFaxYye7j6nGDQuV6Zh/2wP5Z8w+7kI
   x3EfdPSwOrIoxPiSnaLzVeikDI7g4KgJT6YI1Hz/757GMpyqGCjtOAZcV
   huft/rYAfdnz94wpqkiWCwMekEG6efEl8HQgcWkTWJSKGhhO1J9hmHzsq
   Hd1QDemEPEt0FLRWkC4nThkY0+VPnx6tlaNDioDCy5NVa52iw+swSdNl2
   g==;
X-CSE-ConnectionGUID: VAZmoMmsSaybtlX0u/M6IA==
X-CSE-MsgGUID: 2fcB8tENQ5eMALXxBp4E2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57324582"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="57324582"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 00:44:56 -0800
X-CSE-ConnectionGUID: 8rhukdaJRZ+I1BQK3ox7eQ==
X-CSE-MsgGUID: 2gOqS0dnQS2JLBzxJjQMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209959495"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jan 2026 00:44:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgIyJ-00000000Hl2-2z22;
	Thu, 15 Jan 2026 08:44:51 +0000
Date: Thu, 15 Jan 2026 16:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:io_uring-bpf-restrictions 14/15]
 io_uring/bpf_filter.c:170 io_register_bpf_filter() warn: potential spectre
 issue 'filters' [r]
Message-ID: <202601151624.LTxUqumZ-lkp@intel.com>
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
head:   29ac83fe2b009e9bc007cc44ea21832a904be4fe
commit: 11d1f358bfae44ea49a9c7781e19d9d91eb8551d [14/15] io_uring: add support for BPF filtering for opcode restrictions
:::::: branch date: 3 hours ago
:::::: commit date: 9 hours ago
config: alpha-randconfig-r072-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151624.LTxUqumZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601151624.LTxUqumZ-lkp@intel.com/

smatch warnings:
io_uring/bpf_filter.c:170 io_register_bpf_filter() warn: potential spectre issue 'filters' [r]

vim +/filters +170 io_uring/bpf_filter.c

11d1f358bfae44 Jens Axboe 2026-01-14  118  
11d1f358bfae44 Jens Axboe 2026-01-14  119  int io_register_bpf_filter(struct io_restriction *res,
11d1f358bfae44 Jens Axboe 2026-01-14  120  			   struct io_uring_bpf_filter __user *arg)
11d1f358bfae44 Jens Axboe 2026-01-14  121  {
11d1f358bfae44 Jens Axboe 2026-01-14  122  	struct io_bpf_filter *filter, *old_filter;
11d1f358bfae44 Jens Axboe 2026-01-14  123  	struct io_uring_bpf_filter reg;
11d1f358bfae44 Jens Axboe 2026-01-14  124  	struct io_bpf_filter **filters;
11d1f358bfae44 Jens Axboe 2026-01-14  125  
11d1f358bfae44 Jens Axboe 2026-01-14  126  	if (copy_from_user(&reg, arg, sizeof(reg)))
11d1f358bfae44 Jens Axboe 2026-01-14  127  		return -EFAULT;
11d1f358bfae44 Jens Axboe 2026-01-14  128  	if (reg.opcode >= IORING_OP_LAST)
11d1f358bfae44 Jens Axboe 2026-01-14  129  		return -EINVAL;
11d1f358bfae44 Jens Axboe 2026-01-14  130  	if (reg.flags || !mem_is_zero(reg.reserved, sizeof(reg.reserved)))
11d1f358bfae44 Jens Axboe 2026-01-14  131  		return -EINVAL;
11d1f358bfae44 Jens Axboe 2026-01-14  132  
11d1f358bfae44 Jens Axboe 2026-01-14  133  	/*
11d1f358bfae44 Jens Axboe 2026-01-14  134  	 * No existing filters, allocate set.
11d1f358bfae44 Jens Axboe 2026-01-14  135  	 */
11d1f358bfae44 Jens Axboe 2026-01-14  136  	filters = res->filters.bpf_filters;
11d1f358bfae44 Jens Axboe 2026-01-14  137  	if (!filters) {
11d1f358bfae44 Jens Axboe 2026-01-14  138  		filters = kzalloc(IORING_OP_LAST * sizeof(struct io_bpf_filter *), GFP_KERNEL);
11d1f358bfae44 Jens Axboe 2026-01-14  139  		if (!filters)
11d1f358bfae44 Jens Axboe 2026-01-14  140  			return -ENOMEM;
11d1f358bfae44 Jens Axboe 2026-01-14  141  	}
11d1f358bfae44 Jens Axboe 2026-01-14  142  
11d1f358bfae44 Jens Axboe 2026-01-14  143  	filter = NULL;
11d1f358bfae44 Jens Axboe 2026-01-14  144  	if (reg.prog_fd >= 0) {
11d1f358bfae44 Jens Axboe 2026-01-14  145  		struct bpf_prog *prog;
11d1f358bfae44 Jens Axboe 2026-01-14  146  
11d1f358bfae44 Jens Axboe 2026-01-14  147  		prog = bpf_prog_get_type(reg.prog_fd, BPF_PROG_TYPE_IO_URING_FILTER);
11d1f358bfae44 Jens Axboe 2026-01-14  148  		if (IS_ERR(prog)) {
11d1f358bfae44 Jens Axboe 2026-01-14  149  			if (filters != res->filters.bpf_filters)
11d1f358bfae44 Jens Axboe 2026-01-14  150  				kfree(filters);
11d1f358bfae44 Jens Axboe 2026-01-14  151  			return PTR_ERR(prog);
11d1f358bfae44 Jens Axboe 2026-01-14  152  		}
11d1f358bfae44 Jens Axboe 2026-01-14  153  
11d1f358bfae44 Jens Axboe 2026-01-14  154  		filter = kzalloc(sizeof(*filter), GFP_KERNEL);
11d1f358bfae44 Jens Axboe 2026-01-14  155  		if (!filter) {
11d1f358bfae44 Jens Axboe 2026-01-14  156  			if (filters != res->filters.bpf_filters)
11d1f358bfae44 Jens Axboe 2026-01-14  157  				kfree(filters);
11d1f358bfae44 Jens Axboe 2026-01-14  158  			bpf_prog_put(prog);
11d1f358bfae44 Jens Axboe 2026-01-14  159  			return -ENOMEM;
11d1f358bfae44 Jens Axboe 2026-01-14  160  		}
11d1f358bfae44 Jens Axboe 2026-01-14  161  		filter->prog = prog;
11d1f358bfae44 Jens Axboe 2026-01-14  162  		res->filters.bpf_filters = filters;
11d1f358bfae44 Jens Axboe 2026-01-14  163  	}
11d1f358bfae44 Jens Axboe 2026-01-14  164  
11d1f358bfae44 Jens Axboe 2026-01-14  165  	/*
11d1f358bfae44 Jens Axboe 2026-01-14  166  	 * Insert filter - if the current opcode already has a filter
11d1f358bfae44 Jens Axboe 2026-01-14  167  	 * attached, add to the set.
11d1f358bfae44 Jens Axboe 2026-01-14  168  	 */
11d1f358bfae44 Jens Axboe 2026-01-14  169  	spin_lock(&res->filters.lock);
11d1f358bfae44 Jens Axboe 2026-01-14 @170  	old_filter = rcu_dereference(filters[reg.opcode]);
11d1f358bfae44 Jens Axboe 2026-01-14  171  	if (old_filter)
11d1f358bfae44 Jens Axboe 2026-01-14  172  		filter->next = old_filter;
11d1f358bfae44 Jens Axboe 2026-01-14  173  	rcu_assign_pointer(filters[reg.opcode], filter);
11d1f358bfae44 Jens Axboe 2026-01-14  174  	spin_unlock(&res->filters.lock);
11d1f358bfae44 Jens Axboe 2026-01-14  175  	res->bpf_registered = 1;
11d1f358bfae44 Jens Axboe 2026-01-14  176  	return 0;
11d1f358bfae44 Jens Axboe 2026-01-14  177  }
11d1f358bfae44 Jens Axboe 2026-01-14  178  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
