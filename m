Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A38935959
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 01:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769477781; cv=none; b=eHnhlQDGFi6KIeicJq6gOZb8EqDcEJRfQwycDyE3FtXvIcLp4sPYIV1hesA5ZTMuIeo690H781krG65MtHBlK3/0o5kNe8OJURbu56mzUCMbQquvThMLCKdQyZw9I7ClX5xmp9wDSaVWvsJp04FVc8AR38rY8ymT9XjZQue07D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769477781; c=relaxed/simple;
	bh=PwNwT2RL/Rco8843xyAgB7/GI/m9/v2kXuKSCn2dBvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lj8skPRJ1uZALKecsu4EhpPaH+AV2yDdmGHOthVU/yAMlSguDZditnTV6PTWi8YP5sB/WXOtmk8bgkfN40H7nQ50ZYbjUedI1zsHghui5ZkqCVT72uI31J4puq1ipGmV/4ekW23AyNYfw9khPxFDcoO8/nGihxJwc12ULI0KeT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLEG9UUq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLEG9UUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769477780; x=1801013780;
  h=date:from:to:cc:subject:message-id;
  bh=PwNwT2RL/Rco8843xyAgB7/GI/m9/v2kXuKSCn2dBvo=;
  b=NLEG9UUqu3PXHjZ4Cy5KFUmq4bgy+jMs25LFAe4TsloBZsz4uI80eal/
   13wOjO26Tir3C1l79dYlo+S2e+7TJ0wGv1j1SO4ha5IDzpV/8KVAd77h2
   jSWVJFK5VVmraT/+tAlSH+PvBpwpi4TuLiuS5FdNhKEX07dNURVTiNiNy
   UkDeOM1elGhTuSCj82PNVqYgDDX5t4ebLlyvAlCUKWk4iq6Wo3+/wraQ3
   wVJryHvKnECujoQc5xlGdr/W7giXnBR02VuYdsmxUTBBx6ajbBQVFwVPK
   MoJo/aHBS+LE+Iq2RQSe4Q97orYnvE5VJbb2F4nqUln84F0xQvVualgRE
   A==;
X-CSE-ConnectionGUID: H3AkKck3QvWHSOhZwYl/IQ==
X-CSE-MsgGUID: 4+28N6+8Q5SQVQUhmRpu7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88240515"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88240515"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 17:36:19 -0800
X-CSE-ConnectionGUID: kE7UlWUDR4yONo2HxzRu3g==
X-CSE-MsgGUID: dXl7SgobQr65nq9389jlSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207893628"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jan 2026 17:36:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkY07-00000000Xqq-3vbc;
	Tue, 27 Jan 2026 01:36:15 +0000
Date: Tue, 27 Jan 2026 09:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 481/799]
 fs/bcachefs/init/chardev.c:578 bch2_ioctl_query_accounting() warn: potential
 user controlled sizeof overflow 'arg.accounting_u64s * 8' '0-u32max * 8'
Message-ID: <202601270943.24L6Etqo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 29e05f82d6bdd4efef504f6f68922db28e2e4917 [481/799] bcachefs: bit more reorg
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: parisc-randconfig-r071-20260127 (https://download.01.org/0day-ci/archive/20260127/202601270943.24L6Etqo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601270943.24L6Etqo-lkp@intel.com/

smatch warnings:
fs/bcachefs/init/chardev.c:578 bch2_ioctl_query_accounting() warn: potential user controlled sizeof overflow 'arg.accounting_u64s * 8' '0-u32max * 8'

vim +578 fs/bcachefs/init/chardev.c

1c6fdbd8f2465dd fs/bcachefs/chardev.c Kent Overstreet 2017-03-16  566  
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  567  static long bch2_ioctl_query_accounting(struct bch_fs *c,
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  568  			struct bch_ioctl_query_accounting __user *user_arg)
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  569  {
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  570  	struct bch_ioctl_query_accounting arg;
635c5791582a65e fs/bcachefs/chardev.c Kent Overstreet 2025-07-14  571  	CLASS(darray_char, accounting)();
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  572  
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  573  	if (!test_bit(BCH_FS_started, &c->flags))
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  574  		return -EINVAL;
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  575  
635c5791582a65e fs/bcachefs/chardev.c Kent Overstreet 2025-07-14  576  	int ret = copy_from_user_errcode(&arg, user_arg, sizeof(arg)) ?:
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  577  		bch2_fs_accounting_read(c, &accounting, arg.accounting_types_mask) ?:
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01 @578  		(arg.accounting_u64s * sizeof(u64) < accounting.nr ? -ERANGE : 0) ?:
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  579  		copy_to_user_errcode(&user_arg->accounting, accounting.data, accounting.nr);
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  580  	if (ret)
635c5791582a65e fs/bcachefs/chardev.c Kent Overstreet 2025-07-14  581  		return ret;
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  582  
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  583  	arg.capacity		= c->capacity;
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  584  	arg.used		= bch2_fs_usage_read_short(c).used;
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  585  	arg.online_reserved	= percpu_u64_get(c->online_reserved);
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  586  	arg.accounting_u64s	= accounting.nr / sizeof(u64);
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  587  
635c5791582a65e fs/bcachefs/chardev.c Kent Overstreet 2025-07-14  588  	return copy_to_user_errcode(user_arg, &arg, sizeof(arg));
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  589  }
8863d1e092005d5 fs/bcachefs/chardev.c Kent Overstreet 2024-03-01  590  

:::::: The code at line 578 was first introduced by commit
:::::: 8863d1e092005d5b31f7e712827a5605f8a7ba22 bcachefs: BCH_IOCTL_QUERY_ACCOUNTING

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
