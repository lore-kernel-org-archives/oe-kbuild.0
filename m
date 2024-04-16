Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A87D84D3E
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713253936; cv=none; b=kYSnQh++lB5/aPgrf/282KpzrbXEQ97GTtY9+Khw5coUXhe22bC1RjvaFN4vRQYbiGBDFjxmN+Lu8MHBFUYp3o8S24K9L8tLbUtsp7bEY0nh/56xRNHMh6SIp7ac25avRhmBafkv61XSBO3iawuzgIC24s1j5NLwaGvaMVkGIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713253936; c=relaxed/simple;
	bh=mrFYzMxxSmZiApXJk6t9y3zXjnrI8esNMhv2DYzbLl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N6xH+X7prMXu+YgFT7NZto2tJeAsbaeaVT6B4+jiEYlEy0fao0v1ClFchw3hrtMUHts5BFXoXseYRE1iy74q2M2aHqfybVN6+/FGPIU5W7F1y3VuJiA3DQPgVW9vGqphELKpUkmpBtAiLGxZrzgEYU2OHoo8AxcjxqfSYVIo9JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMup/5hg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMup/5hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713253934; x=1744789934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mrFYzMxxSmZiApXJk6t9y3zXjnrI8esNMhv2DYzbLl4=;
  b=JMup/5hgArpnCsgrQffCw5+E1seHtHg6DTNlZ4dWNI+9ceU0BAB/6gTD
   A47ULr5GBimSbV/cxyWeqC6AAraqs6xgf58OA1u0XZw0g+6yfyhgE21L6
   Ewp8yNGGERrzZNtpMUlOVUwo7ffBXBu0QIQt2doAyt4UngjevdBdJQmTz
   lfDmrWTnyitZqVSjvB9yywGjvDZf4gKrOHHtoNY7q434fyFAEAuTlzN8M
   dtDo6oWapyn3ftFIVxrfZDix95ADlli8V3tGYjlSP5JNKpFcKBgPH3Hy6
   zlnj0Wldwj+m7bbkVR+NgJd9qo8UCE/m/AJe4SbuteiAbwcadz+kcWfXK
   g==;
X-CSE-ConnectionGUID: ZlnvlkVhQWOys443wWcAnQ==
X-CSE-MsgGUID: 1Aif/HziTKyLuMkYjPPa2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20065964"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="20065964"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:52:14 -0700
X-CSE-ConnectionGUID: dIyFtYkVS2qFOtO1TRCmuA==
X-CSE-MsgGUID: aB4wxyUDTqi2NqvED8Hx+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="53358324"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2024 00:52:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwdbu-00053m-26;
	Tue, 16 Apr 2024 07:52:10 +0000
Date: Tue, 16 Apr 2024 15:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 97/438] mm/vmscan.c:5471 lru_gen_seq_write()
 warn: potential spectre issue 'next' [w]
Message-ID: <202404161528.rTGrLAJh-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   fe753ea36f846c5a5638f1db502ba023e76132ae
commit: c978484d1a48a8af3b7f68d2a9577ce99dc2ed7b [97/438] mm: convert to read/write iterators
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-161-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161528.rTGrLAJh-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404161528.rTGrLAJh-lkp@intel.com/

smatch warnings:
mm/vmscan.c:5471 lru_gen_seq_write() warn: potential spectre issue 'next' [w]

vim +/next +5471 mm/vmscan.c

d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5435  
07017acb06012d Yu Zhao    2022-09-18  5436  /* see Documentation/admin-guide/mm/multigen_lru.rst for details */
c978484d1a48a8 Jens Axboe 2024-04-03  5437  static ssize_t lru_gen_seq_write(struct kiocb *iocb, struct iov_iter *from)
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5438  {
c978484d1a48a8 Jens Axboe 2024-04-03  5439  	size_t len = iov_iter_count(from);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5440  	void *buf;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5441  	char *cur, *next;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5442  	unsigned int flags;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5443  	struct blk_plug plug;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5444  	int err = -EINVAL;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5445  	struct scan_control sc = {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5446  		.may_writepage = true,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5447  		.may_unmap = true,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5448  		.may_swap = true,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5449  		.reclaim_idx = MAX_NR_ZONES - 1,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5450  		.gfp_mask = GFP_KERNEL,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5451  	};
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5452  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5453  	buf = kvmalloc(len + 1, GFP_KERNEL);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5454  	if (!buf)
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5455  		return -ENOMEM;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5456  
c978484d1a48a8 Jens Axboe 2024-04-03  5457  	if (!copy_from_iter_full(buf, len, from)) {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5458  		kvfree(buf);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5459  		return -EFAULT;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5460  	}
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5461  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5462  	set_task_reclaim_state(current, &sc.reclaim_state);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5463  	flags = memalloc_noreclaim_save();
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5464  	blk_start_plug(&plug);
e9d4e1ee788097 Yu Zhao    2022-12-21  5465  	if (!set_mm_walk(NULL, true)) {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5466  		err = -ENOMEM;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5467  		goto done;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5468  	}
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5469  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5470  	next = buf;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18 @5471  	next[len] = '\0';
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5472  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5473  	while ((cur = strsep(&next, ",;\n"))) {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5474  		int n;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5475  		int end;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5476  		char cmd;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5477  		unsigned int memcg_id;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5478  		unsigned int nid;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5479  		unsigned long seq;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5480  		unsigned int swappiness = -1;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5481  		unsigned long opt = -1;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5482  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5483  		cur = skip_spaces(cur);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5484  		if (!*cur)
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5485  			continue;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5486  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5487  		n = sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5488  			   &seq, &end, &swappiness, &end, &opt, &end);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5489  		if (n < 4 || cur[end]) {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5490  			err = -EINVAL;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5491  			break;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5492  		}
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5493  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5494  		err = run_cmd(cmd, memcg_id, nid, seq, &sc, swappiness, opt);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5495  		if (err)
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5496  			break;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5497  	}
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5498  done:
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5499  	clear_mm_walk();
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5500  	blk_finish_plug(&plug);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5501  	memalloc_noreclaim_restore(flags);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5502  	set_task_reclaim_state(current, NULL);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5503  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5504  	kvfree(buf);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5505  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5506  	return err ? : len;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5507  }
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5508  

:::::: The code at line 5471 was first introduced by commit
:::::: d6c3af7d8a2ba5602c28841248c551a712ac50f5 mm: multi-gen LRU: debugfs interface

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
