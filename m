Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1CC3B777C
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745901; cv=none; b=QowvP6UbQIWYzISstCE0fgzFKy2ScqjXCX+UdpIZcuIaLMzrY7MuD8w7xqBqySchFEmyUSZ7cVQfp3Mkue472K5g0jeU11rhV/QhpsjiWWFHMYbSn5xPlrFYfTJW+2DJ0GRx3HBV0WEFFSiQaIqAxJPr2tC4hzw940raFj/6EeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745901; c=relaxed/simple;
	bh=5qEgcYUW7F45O4/CCNm7N/huI4/lAVUJf3AItuA+eDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GrUsnFBKZ6x9XdHgtQwvH2MwBmyyHQLAhkgpA9r6ehvmXzli+rBcRJZxkgoMFBHqdudpSEdgjfpGxWcPrWMMmmMzLWtY9w8r0jheJTFjsLgYRj/XDfY583NKfmeq1GqPg7AvdIywDu7sNlhydBOtScm0ci5IosaPJ458EVu2wKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pvk5nie7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pvk5nie7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778745899; x=1810281899;
  h=date:from:to:cc:subject:message-id;
  bh=5qEgcYUW7F45O4/CCNm7N/huI4/lAVUJf3AItuA+eDY=;
  b=Pvk5nie7Tu+x2iGtLQm0iCd8C4vcJxeGs2xbrUkZIm66GE7u1nq8srbO
   dV+fAYjCxco+3X7G7vA3WFKWXUAtgNFWAp0F+XntECCs9/e3kjJ8eM8P+
   dwkaIg5ucNdNQP/l+GPgYXVnm/Af5U/ELPRuLLrSGticXIwHl91Chz9tg
   lBDd2xQQLwa2hl5zGzmLJUBOw0XLHERjq5nTkYchH8X1RmZ8zhszf/JKs
   8I561STu7e+EGjLFAf5w+LmMN9lf6cJ5xrcyR/i3LH556lRunctuIsrzg
   ePPhCptcWDkBWS1OOkttKKgTpug9sk6zzdfFryOGCccuMYnRuApuK5Bx1
   A==;
X-CSE-ConnectionGUID: fOuVIsTeTlO6Jz03dyeoKg==
X-CSE-MsgGUID: 6zZ238RgSly9fTw3P896QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83297973"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="83297973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 01:04:57 -0700
X-CSE-ConnectionGUID: YA62CvEGQN2YIicupZ1ZEA==
X-CSE-MsgGUID: H94l8MObSn+HMyZ35sYlmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="234039422"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2026 01:04:55 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNR3t-0000000069W-0bM3;
	Thu, 14 May 2026 08:04:53 +0000
Date: Thu, 14 May 2026 16:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 481/799]
 fs/bcachefs/init/chardev.c:578 bch2_ioctl_query_accounting() warn: potential
 user controlled sizeof overflow 'arg.accounting_u64s * 8' '0-u32max * 8'
Message-ID: <202605141559.kX6o5Q6d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 29e05f82d6bdd4efef504f6f68922db28e2e4917 [481/799] bcachefs: bit more reorg
:::::: branch date: 6 months ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141559.kX6o5Q6d-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141559.kX6o5Q6d-lkp@intel.com/

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
