Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C8E36935B
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757610922; cv=none; b=Sfuda4zoDMl2jAHmJv2xSryORwppOOC6rjEcOxksdBhko3r4kgC5Tfnsdnqxuzr+VtFiVzu8RWX62/WT3DwpfJDpooI6IPCejqYAFlD7jyCvfchZaEZg098SYcM1SPj+CCw9WTmY847SX5IVrCN8gRl/S7pLwXmux4mKuSX4Bng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757610922; c=relaxed/simple;
	bh=eRGV2FUQ8ZG8R6LSL2TmeWiN99gGbsP1xPJ/IbVjk+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLyzkopzyOCI5xMR1kPJkr0zf128lXS+TSThhvneHIlXIhxAvDMsjOoPuU1bjjTiKAYEeF/pbneHKFJaPPL3PKqLLKFNfugkv7Ef5vd8ZwL1NYjDxmVl0wbW0IOeQ/OiHz134CPgXcKDDHRfkrlgA5shbH0c5LgvvwlEVF1J9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGf8hEo+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGf8hEo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757610921; x=1789146921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eRGV2FUQ8ZG8R6LSL2TmeWiN99gGbsP1xPJ/IbVjk+c=;
  b=DGf8hEo+KtmjkeZt/YRCqonYMvlYxT8ScHskwF5TKn8nMGSr4rbnYPLT
   YiAuhrMwoaraVE46cpaXqexIg4LWRy/WVpiiWSiejNQaR+fWKNx14fpQL
   hCE/Z93YKnhyH/K6rAJIEwqfm+Fc/aQkiJz5b3hw8NbXpW0Q6Zha2T4N6
   ccAoER6Ov6wEy3z7E6HWLR8Zf0QeKX2jsHB4Me/eMBRGPaeltnOSicNE+
   9vf0vBKqV0fY3RRrNb6XM8MN0yzy3McsTFd985sI5m6dG1hRSYB2/9t0D
   JQIDcsvCoEwEYAIJiHWm9gi+Fyyy/jqlbcTCqKGZGcN/PH2y9ZqBjFtrk
   A==;
X-CSE-ConnectionGUID: zufFedlzRJqpdreqHQRAIA==
X-CSE-MsgGUID: NQAe3vYNRNa0uE1rJddH8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60012270"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60012270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 10:15:17 -0700
X-CSE-ConnectionGUID: +yrJTRpuRwqrOHQgaGdG7Q==
X-CSE-MsgGUID: /ppIQIGkRA641d9E/EvkVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="173811123"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Sep 2025 10:15:10 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwkt1-0000WN-0I;
	Thu, 11 Sep 2025 17:15:07 +0000
Date: Fri, 12 Sep 2025 01:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8010/8263] io_uring/query.c:98 io_query() error:
 uninitialized symbol 'ret'.
Message-ID: <202509120150.hzd9vw51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: d9b7dbb7f34aa7a8485fd39ffe4bba65e20692cf [8010/8263] io_uring/query: check for loops in in_query()
:::::: branch date: 11 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120150.hzd9vw51-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509120150.hzd9vw51-lkp@intel.com/

smatch warnings:
io_uring/query.c:98 io_query() error: uninitialized symbol 'ret'.

vim +/ret +98 io_uring/query.c

c265ae75f900ce Pavel Begunkov 2025-09-08  72  
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  73  /*
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  74   * Returns number of items processed, or < 0 in case of error.
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  75   */
c265ae75f900ce Pavel Begunkov 2025-09-08  76  int io_query(struct io_ring_ctx *ctx, void __user *arg, unsigned nr_args)
c265ae75f900ce Pavel Begunkov 2025-09-08  77  {
c265ae75f900ce Pavel Begunkov 2025-09-08  78  	char entry_buffer[IO_MAX_QUERY_SIZE];
c265ae75f900ce Pavel Begunkov 2025-09-08  79  	void __user *uhdr = arg;
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  80  	int ret, nr = 0;
c265ae75f900ce Pavel Begunkov 2025-09-08  81  
c265ae75f900ce Pavel Begunkov 2025-09-08  82  	memset(entry_buffer, 0, sizeof(entry_buffer));
c265ae75f900ce Pavel Begunkov 2025-09-08  83  
c265ae75f900ce Pavel Begunkov 2025-09-08  84  	if (nr_args)
c265ae75f900ce Pavel Begunkov 2025-09-08  85  		return -EINVAL;
c265ae75f900ce Pavel Begunkov 2025-09-08  86  
c265ae75f900ce Pavel Begunkov 2025-09-08  87  	while (uhdr) {
c265ae75f900ce Pavel Begunkov 2025-09-08  88  		u64 next_hdr;
c265ae75f900ce Pavel Begunkov 2025-09-08  89  
c265ae75f900ce Pavel Begunkov 2025-09-08  90  		ret = io_handle_query_entry(ctx, entry_buffer, uhdr, &next_hdr);
c265ae75f900ce Pavel Begunkov 2025-09-08  91  		if (ret)
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  92  			break;
c265ae75f900ce Pavel Begunkov 2025-09-08  93  		uhdr = u64_to_user_ptr(next_hdr);
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  94  		/* Have some limit to avoid a potential loop */
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  95  		if (++nr >= 1024)
d9b7dbb7f34aa7 Jens Axboe     2025-09-10  96  			break;
c265ae75f900ce Pavel Begunkov 2025-09-08  97  	}
d9b7dbb7f34aa7 Jens Axboe     2025-09-10 @98  	return nr ?: ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
