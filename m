Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C7B33C8
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Apr 2024 19:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714332948; cv=none; b=jH1sT5xlRbfqJAe19/zBJNCPjMjAUJrlFfIT3ewc+rP7HJaZjpPx71eFR0YKp4lcALWnGcujW2M9VnQLnHkxoSMq7AXmXjc5Pv4fo8W+8Sdx8F1+KlhtMojWZaQ3YU87qH9bpZwe1EOMYtcDItlk+fcwk6AqKQsZ7ptN8arNb0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714332948; c=relaxed/simple;
	bh=AEFB81WAQ4SM5Or2HvJceHbBYXg83Ki20j0KRjjL3Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hshnq4z7yzdIS4cLbQa6qV6aHi5hk22soIYE8nYUVu6dAswOMpFI3DEtbv1gyWldT3W/3usCILjK8eRxDxnciSJ9xhpM1SbwFIjsRkgcfne8cTX5DO/PqAIxEA/BwO/xojIk29sv75aSoewHEEB/XF5T6sQZPATfyIkshLBFCIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jmv7+HBG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jmv7+HBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714332946; x=1745868946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AEFB81WAQ4SM5Or2HvJceHbBYXg83Ki20j0KRjjL3Ak=;
  b=Jmv7+HBGr9mLWxbUNnW0GLT/izrAJYf3vlf/4o1hH5vrS5ldLyMVaO5f
   hnV4fjv60fedVG9GRFZLtViW24N3EOYj1/qh1nXl2u9bxeoBamdvTFBUD
   +DfcNsAkJagLZn2/zfY4WoDCSL27RXJmjUKkhKd9flDF0hFUq5slSm6Ve
   WEIMVL4iPKibE2qmkV02XfTFNZvtg0rNIz92wLRmoqJYg45y7C0iPfxAo
   W2pB3rYrfN83IgoAwPlQv7zzidiCS7I3KNu0NIqzI8vtPY/rHSNbFRIRy
   QCMlXcLz0Rk7Mxp4NwE2TSXHCjv528OZgcNl3G3FljneCIULLts4KqfUv
   A==;
X-CSE-ConnectionGUID: GCHyWRRPQ1SpvwzNFQA5yQ==
X-CSE-MsgGUID: pE5jvFxGTmmrjziALpMVBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="12931205"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="12931205"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 12:35:46 -0700
X-CSE-ConnectionGUID: QPqLvXOaQc+pd5lDCkbDKw==
X-CSE-MsgGUID: Cpf9dsV8TBGlF3sH0ddKMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="25991089"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2024 12:35:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1AJK-0006hS-0a;
	Sun, 28 Apr 2024 19:35:42 +0000
Date: Mon, 29 Apr 2024 03:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 7535/7622] mm/readahead.c:706
 page_cache_sync_ra() warn: bitwise AND condition is false here
Message-ID: <202404290335.KeORqbmX-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: ZhaoLong Wang <wangzhaolong1@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f120c2ab14341c60bcc055c700c0a29dce5837ac
commit: 1119ec49ac4ac643e6d7c9a5a834040aef87612e [7535/7622] mm, fs: Add BPF_READAHEAD build option for bpf readhead
:::::: branch date: 7 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240428 (https://download.01.org/0day-ci/archive/20240429/202404290335.KeORqbmX-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404290335.KeORqbmX-lkp@intel.com/

smatch warnings:
mm/readahead.c:706 page_cache_sync_ra() warn: bitwise AND condition is false here

vim +706 mm/readahead.c

070f866a12fc62 Yufen Yu                2024-01-09  700  
fefa7c478fdafe Matthew Wilcox (Oracle  2020-10-15  701) void page_cache_sync_ra(struct readahead_control *ractl,
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  702) 		unsigned long req_count)
cf914a7d656e62 Rusty Russell           2007-07-19  703  {
070f866a12fc62 Yufen Yu                2024-01-09  704  	bool do_forced_ra = ractl->file &&
070f866a12fc62 Yufen Yu                2024-01-09  705  			    ((ractl->file->f_mode & FMODE_RANDOM) ||
070f866a12fc62 Yufen Yu                2024-01-09 @706  			     (ractl->file->f_ctl_mode & FMODE_CTL_RANDOM));
cf914a7d656e62 Rusty Russell           2007-07-19  707  
324bcf54c449c7 Jens Axboe              2020-10-17  708  	/*
1e4702806faca1 Matthew Wilcox (Oracle  2022-03-31  709) 	 * Even if readahead is disabled, issue this request as readahead
324bcf54c449c7 Jens Axboe              2020-10-17  710  	 * as we'll need it to satisfy the requested range. The forced
1e4702806faca1 Matthew Wilcox (Oracle  2022-03-31  711) 	 * readahead will do the right thing and limit the read to just the
324bcf54c449c7 Jens Axboe              2020-10-17  712  	 * requested range, which we'll set to 1 page for this case.
324bcf54c449c7 Jens Axboe              2020-10-17  713  	 */
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  714) 	if (!ractl->ra->ra_pages || blk_cgroup_congested()) {
324bcf54c449c7 Jens Axboe              2020-10-17  715  		if (!ractl->file)
ca47e8c72ae141 Josef Bacik             2018-07-03  716  			return;
324bcf54c449c7 Jens Axboe              2020-10-17  717  		req_count = 1;
324bcf54c449c7 Jens Axboe              2020-10-17  718  		do_forced_ra = true;
324bcf54c449c7 Jens Axboe              2020-10-17  719  	}
ca47e8c72ae141 Josef Bacik             2018-07-03  720  
070f866a12fc62 Yufen Yu                2024-01-09  721  	/* try to read first READAHEAD_FIRST_SIZE into pagecache */
070f866a12fc62 Yufen Yu                2024-01-09  722  	if (ractl->file && (ractl->file->f_ctl_mode & FMODE_CTL_WILLNEED) &&
070f866a12fc62 Yufen Yu                2024-01-09  723  		page_cache_readahead_from_head(ractl->mapping, ractl->file,
070f866a12fc62 Yufen Yu                2024-01-09  724  			readahead_index(ractl), req_count, READAHEAD_FIRST_SIZE))
070f866a12fc62 Yufen Yu                2024-01-09  725  		return;
070f866a12fc62 Yufen Yu                2024-01-09  726  
0141450f66c3c1 Wu Fengguang            2010-03-05  727  	/* be dumb */
324bcf54c449c7 Jens Axboe              2020-10-17  728  	if (do_forced_ra) {
fcd9ae4f7f3b5f Matthew Wilcox (Oracle  2021-04-07  729) 		force_page_cache_ra(ractl, req_count);
0141450f66c3c1 Wu Fengguang            2010-03-05  730  		return;
0141450f66c3c1 Wu Fengguang            2010-03-05  731  	}
0141450f66c3c1 Wu Fengguang            2010-03-05  732  
793917d997df2e Matthew Wilcox (Oracle  2020-02-05  733) 	ondemand_readahead(ractl, NULL, req_count);
cf914a7d656e62 Rusty Russell           2007-07-19  734  }
fefa7c478fdafe Matthew Wilcox (Oracle  2020-10-15  735) EXPORT_SYMBOL_GPL(page_cache_sync_ra);
cf914a7d656e62 Rusty Russell           2007-07-19  736  

:::::: The code at line 706 was first introduced by commit
:::::: 070f866a12fc623f5f365ccdc7239c82a99fc717 readahead: introduce FMODE_CTL_WILLNEED to read first 2MB of file

:::::: TO: Yufen Yu <yuyufen@huawei.com>
:::::: CC: ZhaoLong Wang <wangzhaolong1@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
