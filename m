Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472CA288530
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 04:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772856347; cv=none; b=oNyhWSdxRXX1TexECLNC65aWqCFbRE5EfLBnZWgJ2FE5ijrKYBGjsWnpSG4snGtPjA5bF5yQvSNLL27wgJJObqUKFFqdRfaRAN/MOszby+Lx0DE3C+dE7RNC2GPkIeHasoq2o2ZAchG0cRVC0KyaYWn0lOoOmbJXZzuUZfy8lyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772856347; c=relaxed/simple;
	bh=+iHnWZCRPAt27AaxbJ3iX+DHZ9/5hjADFZl7PjyTJew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s2TQsyl0NNLE7Lqo87lKpgvQxIkCNDPt9PbYHmzHyqKo95i8dGE+18S4/1mmfbm1yaUKJhebeli4o4FVFR+87WhSI3kpm068Jh9EsS0u8J8rh8aT1Fo3RRjIeec7w0IcCqsJglxLeOeqivX37BArbxa8nOovSD5Gb4UfUEbfoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FG7gVwRJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FG7gVwRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772856346; x=1804392346;
  h=date:from:to:cc:subject:message-id;
  bh=+iHnWZCRPAt27AaxbJ3iX+DHZ9/5hjADFZl7PjyTJew=;
  b=FG7gVwRJr55vHN+yZogyL+XC2hWPCcR0SGVxu1eRMf5mCibocFbtItQj
   AZ8imTPQaEbasq5ShHpzWqU0qCp6jdSmj5KQbM0y+7iuboPXuISUUAYtl
   gaTv750VJL5G6U1/mRzXhVzlyaEFCdYAkQS15DjCqQlgNjb0iGM34alCg
   DmDUp/uu6l5h0/u1wsxqo1XUJbeebLTwNJ9RdGQdWdO8W5OEllAN1q9XW
   K/LP4eOF1BfFb06IbVYWiJXhYHQdsQEkxvsAlYKWDGrEOpj4dNXsIMM+J
   fH6BM7DjkrEuO6A0Zgq4P6O8AZEoD6JdwM4m0TE2usWQP9XdI6dwzApG+
   g==;
X-CSE-ConnectionGUID: peGgH8oBSvGfOsH+NEnnMw==
X-CSE-MsgGUID: 0B+v1AVGS8aLV1yDT5sdUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77814832"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="77814832"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 20:05:45 -0800
X-CSE-ConnectionGUID: 3eX23f5OTTensKzcKueSiA==
X-CSE-MsgGUID: o0LWm6ViQO+qwJ8IjKnsXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="224151069"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 20:05:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyiv3-000000001fh-0sC3;
	Sat, 07 Mar 2026 04:05:37 +0000
Date: Sat, 07 Mar 2026 12:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 94/471] mm/vmscan.c:5589
 lru_gen_seq_write_iter() warn: potential spectre issue 'next' [w]
Message-ID: <202603071159.4M3DpFDx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 14b5ca45e7095f41192b0acf6b6f643f925a5cae [94/471] mm: convert to read/write iterators
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: m68k-randconfig-r073-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071159.4M3DpFDx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603071159.4M3DpFDx-lkp@intel.com/

smatch warnings:
mm/vmscan.c:5589 lru_gen_seq_write_iter() warn: potential spectre issue 'next' [w]

vim +/next +5589 mm/vmscan.c

d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5552  
07017acb06012d Yu Zhao      2022-09-18  5553  /* see Documentation/admin-guide/mm/multigen_lru.rst for details */
14b5ca45e7095f Jens Axboe   2024-04-03  5554  static ssize_t lru_gen_seq_write_iter(struct kiocb *iocb, struct iov_iter *from)
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5555  {
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5556  	void *buf;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5557  	char *cur, *next;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5558  	unsigned int flags;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5559  	struct blk_plug plug;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5560  	int err = -EINVAL;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5561  	struct scan_control sc = {
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5562  		.may_writepage = true,
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5563  		.may_unmap = true,
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5564  		.may_swap = true,
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5565  		.reclaim_idx = MAX_NR_ZONES - 1,
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5566  		.gfp_mask = GFP_KERNEL,
915a4022b591d5 Hao Jia      2025-07-17  5567  		.proactive = true,
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5568  	};
14b5ca45e7095f Jens Axboe   2024-04-03  5569  	size_t len = iov_iter_count(from);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5570  
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5571  	buf = kvmalloc(len + 1, GFP_KERNEL);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5572  	if (!buf)
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5573  		return -ENOMEM;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5574  
14b5ca45e7095f Jens Axboe   2024-04-03  5575  	if (!copy_from_iter_full(buf, len, from)) {
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5576  		kvfree(buf);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5577  		return -EFAULT;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5578  	}
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5579  
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5580  	set_task_reclaim_state(current, &sc.reclaim_state);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5581  	flags = memalloc_noreclaim_save();
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5582  	blk_start_plug(&plug);
e9d4e1ee788097 Yu Zhao      2022-12-21  5583  	if (!set_mm_walk(NULL, true)) {
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5584  		err = -ENOMEM;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5585  		goto done;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5586  	}
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5587  
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5588  	next = buf;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18 @5589  	next[len] = '\0';
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5590  
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5591  	while ((cur = strsep(&next, ",;\n"))) {
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5592  		int n;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5593  		int end;
b40599930f001b Zhongkun He  2025-04-21  5594  		char cmd, swap_string[5];
20ccbd89afe425 Shakeel Butt 2025-12-25  5595  		u64 memcg_id;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5596  		unsigned int nid;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5597  		unsigned long seq;
b40599930f001b Zhongkun He  2025-04-21  5598  		unsigned int swappiness;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5599  		unsigned long opt = -1;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5600  
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5601  		cur = skip_spaces(cur);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5602  		if (!*cur)
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5603  			continue;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5604  
20ccbd89afe425 Shakeel Butt 2025-12-25  5605  		n = sscanf(cur, "%c %llu %u %lu %n %4s %n %lu %n", &cmd, &memcg_id, &nid,
b40599930f001b Zhongkun He  2025-04-21  5606  			   &seq, &end, swap_string, &end, &opt, &end);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5607  		if (n < 4 || cur[end]) {
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5608  			err = -EINVAL;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5609  			break;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5610  		}
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5611  
b40599930f001b Zhongkun He  2025-04-21  5612  		if (n == 4) {
b40599930f001b Zhongkun He  2025-04-21  5613  			swappiness = -1;
b40599930f001b Zhongkun He  2025-04-21  5614  		} else if (!strcmp("max", swap_string)) {
b40599930f001b Zhongkun He  2025-04-21  5615  			/* set by userspace for anonymous memory only */
b40599930f001b Zhongkun He  2025-04-21  5616  			swappiness = SWAPPINESS_ANON_ONLY;
b40599930f001b Zhongkun He  2025-04-21  5617  		} else {
b40599930f001b Zhongkun He  2025-04-21  5618  			err = kstrtouint(swap_string, 0, &swappiness);
b40599930f001b Zhongkun He  2025-04-21  5619  			if (err)
b40599930f001b Zhongkun He  2025-04-21  5620  				break;
b40599930f001b Zhongkun He  2025-04-21  5621  		}
b40599930f001b Zhongkun He  2025-04-21  5622  
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5623  		err = run_cmd(cmd, memcg_id, nid, seq, &sc, swappiness, opt);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5624  		if (err)
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5625  			break;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5626  	}
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5627  done:
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5628  	clear_mm_walk();
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5629  	blk_finish_plug(&plug);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5630  	memalloc_noreclaim_restore(flags);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5631  	set_task_reclaim_state(current, NULL);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5632  
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5633  	kvfree(buf);
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5634  
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5635  	return err ? : len;
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5636  }
d6c3af7d8a2ba5 Yu Zhao      2022-09-18  5637  

:::::: The code at line 5589 was first introduced by commit
:::::: d6c3af7d8a2ba5602c28841248c551a712ac50f5 mm: multi-gen LRU: debugfs interface

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
