Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6D03D75AF
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665214; cv=none; b=fRYAqWVS6pK5xRDgQecyHlt5AMty7AATXJncZEP4dVJVtJbfY862OAF34JP2UNxZf12I5DJkwnq22fWdVwjTAXk8SmBqMD35/+hl26ynOo630aCHZ4CShXVpJzB11bSVCSQnxFR2kPn0RigJKKQfLiccCgFaZv7VfYDF87lGT4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665214; c=relaxed/simple;
	bh=G12UOasabGibteSOwVGpHmGeH7aWwMMgtwrBAFJKc18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZtOy2deLZa7J3OIhfFLIloLoPHaNZy5tX3Qan11pUROoQqUXBu7dmvJ3Tpz6p2ekRgMR81hU4LrYjTzLHUG81+pm5uqyoPf+pvEbHXBxxKSJaYHwaY1PKdEmDb/NSlFXiwXlWXbYBkWx1t+s3nmxrJwpbm3XsYKJPFG5LASI6Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDyJB/cH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDyJB/cH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778665212; x=1810201212;
  h=date:from:to:cc:subject:message-id;
  bh=G12UOasabGibteSOwVGpHmGeH7aWwMMgtwrBAFJKc18=;
  b=LDyJB/cHL9LT12Uyxx16Y93V191QJroM4doJpaeDIU7ENfA55pSjm7jB
   /WVDdaS55g7sEPZrV8rqv5IHA+CDqzeVOC39Z0UOzXVqAv8q078XsRrjM
   8au5CyHDcI3zt5objeguzyAK74p0VUC58XjSbm3Jx1yhJvAOgDpAF5Yio
   yicRsYP3ljm7okzbGFeUUvRE3uqMJAB9cp43mDadQY78mXeuAgAC6lx6A
   u6CIusqSs536CKmynshgfBbDr0W7M5KuPRiKvuuwAjkpechVW2WLxu1oG
   qkdTIFuQeUq/Zu1ktjYSG+zvSumXfSJR2xfK9Hl8RorE4gaT1O+UOLgPz
   w==;
X-CSE-ConnectionGUID: u/KvwpzSRgCgep81+NQkCg==
X-CSE-MsgGUID: LMt73u8tT+mkFSQMabZHnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97155792"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97155792"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 02:40:11 -0700
X-CSE-ConnectionGUID: siQj3Y67TpGIsyOR0ss23Q==
X-CSE-MsgGUID: KQzmxYfRT4O83CkpTP7tNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="242991163"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 May 2026 02:40:10 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN64V-000000003ql-2HKc;
	Wed, 13 May 2026 09:40:07 +0000
Date: Wed, 13 May 2026 17:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 197/332]
 fs/bcachefs/alloc/foreground.c:477 bucket_alloc_to_text() warn: passing zero
 to 'PTR_ERR'
Message-ID: <202605131707.fmUu5PXw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 25066f580a60bef92762651f16808c669d417e97 [197/332] bcachefs: Rework allocator control flow
:::::: branch date: 3 months ago
:::::: commit date: 4 months ago
config: parisc-randconfig-r072-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131707.fmUu5PXw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605131707.fmUu5PXw-lkp@intel.com/

New smatch warnings:
fs/bcachefs/alloc/foreground.c:477 bucket_alloc_to_text() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
arch/parisc/include/asm/hash.h:44 __hash_32() warn: inconsistent indenting

vim +/PTR_ERR +477 fs/bcachefs/alloc/foreground.c

f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  445  
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  446  static noinline void bucket_alloc_to_text(struct printbuf *out,
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  447  					  struct bch_fs *c,
4d00e88d21d636 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  448  					  struct alloc_request *req,
40574946b8a517 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-04  449  					  struct open_bucket *ob)
40574946b8a517 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-04  450  {
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  451  	printbuf_tabstop_push(out, 32);
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  452  
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  453  	if (req->ca) {
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  454  		prt_printf(out, "dev\t%s (%u)\n",	req->ca->name, req->ca->dev_idx);
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  455  		prt_printf(out, "avail\t%llu\n",	__dev_buckets_free(req->ca, req->usage, req->watermark));
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  456  	}
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  457  
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  458  	prt_printf(out, "watermark\t%s\n",	bch2_watermarks[req->watermark]);
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  459  	prt_printf(out, "data type\t%s\n",	__bch2_data_types[req->data_type]);
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  460  	prt_printf(out, "will_retry_target_devices\t%u\n",	req->will_retry_target_devices);
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  461  	prt_printf(out, "will_retry_all_devices\t%u\n",	req->will_retry_all_devices);
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  462  	prt_printf(out, "blocking\t%u\n", !(req->flags & BCH_WRITE_alloc_nowait));
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  463  	prt_printf(out, "free\t%llu\n",	req->usage.buckets[BCH_DATA_free]);
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  464  	prt_printf(out, "copygc_wait\t%llu/%lli\n",
40574946b8a517 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-04  465  		   bch2_copygc_wait_amount(c),
cb70f3a81f829a fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-29  466  		   c->copygc.wait - atomic64_read(&c->io_clock[WRITE].now));
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  467  	prt_printf(out, "seen\t%llu\n",	req->counters.buckets_seen);
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  468  	prt_printf(out, "open\t%llu\n",	req->counters.skipped_open);
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  469  	prt_printf(out, "need journal commit\t%llu\n", req->counters.skipped_need_journal_commit);
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  470  	prt_printf(out, "nocow\t%llu\n",	req->counters.skipped_nocow);
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  471  	prt_printf(out, "nouse\t%llu\n",	req->counters.skipped_nouse);
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  472  	prt_printf(out, "mi_btree_bitmap\t%llu\n", req->counters.skipped_mi_btree_bitmap);
40574946b8a517 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-04  473  
25066f580a60be fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-05-27  474  	if (!IS_ERR_OR_NULL(ob))
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  475  		prt_printf(out, "allocated\t%llu\n", ob->bucket);
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25  476  	else
abb687e3851cbb fs/bcachefs/alloc/foreground.c Kent Overstreet 2025-11-25 @477  		prt_printf(out, "err\t%s\n", bch2_err_str(PTR_ERR(ob)));
40574946b8a517 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-04  478  }
40574946b8a517 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-04  479  

:::::: The code at line 477 was first introduced by commit
:::::: abb687e3851cbbaa59d19cf6794dec08d30c4d9a bcachefs: tracepoint/counter rework

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
