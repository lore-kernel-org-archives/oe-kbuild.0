Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F5FEAD2
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 17:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828580; cv=none; b=W6B+WnYSuaAhm7SAaj+otCLN4P4jTQEeoqA309TyzV5ItmvpadUEpkYLYhe+n1d0VioMnkAgVcB9mAqH/Ps3s7aHqsMqZnW0AuinztgUu/ZcW+ua1rOGXurXST9WfMYArWGJUGqJvmqcMxgKBEkJpwF+lpyrvfkpYIE8tXyw8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828580; c=relaxed/simple;
	bh=9DjdCQd61aIlalefELfGSSCuUMbd0rNOSg4wu98muRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pZMXg2KtZ2gOocCqJT/a6DjeugyzLMC5JHlUCIHAO/ciNNFx+BEBmiaciOFPwP7Ep36vJwDjXdLzE2GMkkTW57LWdgvGqNCIEKWlk0ioCTb3F/+SsxlKiYp5TUt9hLMMTOqx2qFYj4Y3Kh5DYqJo/MCHKmZACcbIshv84EdoGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nX0i5Mmw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nX0i5Mmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730828578; x=1762364578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9DjdCQd61aIlalefELfGSSCuUMbd0rNOSg4wu98muRU=;
  b=nX0i5MmwbocfRH7vbZ0JZCSqCTGYO3kE9peBE/uIOuxlbMhbjm2EDTF/
   RkLeZyFrOSp4MHyuZUMG21Mt5F4U0lU/u35B1n/plgTxy9OXWBFOgwvpg
   r4Lf1TVn+W6kGmYVColT7usBI8eCxrr3DTsnqx45DhA9wJuANEBgk5Lg0
   scYgwPSPStNQGDaubnksNd8j9DK9u9hQfMLK/xWKjyLcXDGKWkJwdoUJU
   9RSqzpG67Q2bXJ4kyg3DSsBRNH93ngn+Cwbn2ooHdNgPNo3xDNMbMAaTc
   DMIBglqNGX/sNFeCnvm88dBqfLoRkHxoctlQqsG5XuENlxIO4xw5gY5+B
   w==;
X-CSE-ConnectionGUID: ures3jPWRJejqZHUDmsoAw==
X-CSE-MsgGUID: fax9Mlh4Qy+Uo7ggVMw4eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30700343"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30700343"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 09:42:42 -0800
X-CSE-ConnectionGUID: +cfKz84KTQSKFtW78qQ16g==
X-CSE-MsgGUID: aRucE715QY6KkcZfX4Nb1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="121588914"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2024 09:42:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8NZd-000mId-2t;
	Tue, 05 Nov 2024 17:42:37 +0000
Date: Wed, 6 Nov 2024 01:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1351/1351] mm/readahead.c:706
 page_cache_sync_ra() warn: bitwise AND condition is false here
Message-ID: <202411060347.XjHVgFZ4-lkp@intel.com>
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
head:   028b5faf5e8bd8e7064aa48c4b39cc913dcdaef7
commit: 1119ec49ac4ac643e6d7c9a5a834040aef87612e [1351/1351] mm, fs: Add BPF_READAHEAD build option for bpf readhead
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20241103 (https://download.01.org/0day-ci/archive/20241106/202411060347.XjHVgFZ4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411060347.XjHVgFZ4-lkp@intel.com/

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
