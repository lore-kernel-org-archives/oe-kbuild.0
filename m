Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C914156C6F
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726560734; cv=none; b=cNE76pljCjFHiD22k0ZSVLzncubxff6NIQQkcfsB8XbPs6sDZTnoi8qqKfIJljZdufz9YbpYmwdTMNIHU6wtVdoAr2Z1+L23HudXJAM5gXAWMez1PKOaRVOUxb49uaTrYxovYyRoZ9kRMNk2VbNHzFtsUI3IXvMYI5Mw3uyrRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726560734; c=relaxed/simple;
	bh=jMTQdum00wdnl0ZP+VTg58TiUadYkN6MzLuDHzjgr7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vD3nCIIrbcrZ2imXdBwD2DFeIVFTIESS7aZqmvs9sIJw6dkhfMCs157SAY0Z5BBoK2XlEIzQ4VPKkSYqLg5wqy4neM0iakNxuuESniqaUuHTlmWFs2lGKsUbPcU3+YRY6Bin5GZ8VbQK0U1z189L6Sv+sNHKceGHH54N44Zw21o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VixOB4iu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VixOB4iu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726560732; x=1758096732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMTQdum00wdnl0ZP+VTg58TiUadYkN6MzLuDHzjgr7M=;
  b=VixOB4iu4/8IDEaH9roCxnTy5Ea1AGimb3wGx2UV7W614aM/q16xmB8O
   d4CTcBwvZbAuq4qJbXEkuKrBPsC7uN2NVxt9dOXDvxBrdJ8TxKGPwjUZR
   BC0tXDHTc40gAevHhsgBqQRcB/7EH6IRBkg3voKIU+N7S2xT6c4i6lRlb
   6m+XNALpRBLRikJDvP9O7MtJV4dfk4hME7oOla2NsitteV5OedvAzwG4X
   V3vEWUMM2R85prF3C67FCTqECTDLOyVgov29Ok4ctKdfkuswr4L9Us+k9
   T49ya1NZ+tEF8QBrAk0XsvzqYkuFkw7WcXr3L23PSwXLiHCxcsvxsRZma
   g==;
X-CSE-ConnectionGUID: SK8cVecNQZWBrIVoRxwtrg==
X-CSE-MsgGUID: e17vhg87SVudSGDBqTJyyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25563526"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25563526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 01:11:59 -0700
X-CSE-ConnectionGUID: Mx+SSGEYSXaKAmC7Vnbr2w==
X-CSE-MsgGUID: mULXsyVSQNOsDC6d6wa3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="106577948"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Sep 2024 01:11:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqTJT-000AxS-1Q;
	Tue, 17 Sep 2024 08:11:55 +0000
Date: Tue, 17 Sep 2024 16:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 96/447] mm/vmscan.c:5470 lru_gen_seq_write()
 warn: potential spectre issue 'next' [w]
Message-ID: <202409171604.OzahNU3y-lkp@intel.com>
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
head:   097956626f11860fdba8b8919604f57b4a69957d
commit: c4e6d63e8437aa553ebb48e854ca05a3bc8f3a60 [96/447] mm: convert to read/write iterators
:::::: branch date: 80 minutes ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240917 (https://download.01.org/0day-ci/archive/20240917/202409171604.OzahNU3y-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409171604.OzahNU3y-lkp@intel.com/

smatch warnings:
mm/vmscan.c:5470 lru_gen_seq_write() warn: potential spectre issue 'next' [w]

vim +/next +5470 mm/vmscan.c

d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5434  
07017acb06012d Yu Zhao    2022-09-18  5435  /* see Documentation/admin-guide/mm/multigen_lru.rst for details */
c4e6d63e8437aa Jens Axboe 2024-04-03  5436  static ssize_t lru_gen_seq_write(struct kiocb *iocb, struct iov_iter *from)
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5437  {
c4e6d63e8437aa Jens Axboe 2024-04-03  5438  	size_t len = iov_iter_count(from);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5439  	void *buf;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5440  	char *cur, *next;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5441  	unsigned int flags;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5442  	struct blk_plug plug;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5443  	int err = -EINVAL;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5444  	struct scan_control sc = {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5445  		.may_writepage = true,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5446  		.may_unmap = true,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5447  		.may_swap = true,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5448  		.reclaim_idx = MAX_NR_ZONES - 1,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5449  		.gfp_mask = GFP_KERNEL,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5450  	};
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5451  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5452  	buf = kvmalloc(len + 1, GFP_KERNEL);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5453  	if (!buf)
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5454  		return -ENOMEM;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5455  
c4e6d63e8437aa Jens Axboe 2024-04-03  5456  	if (!copy_from_iter_full(buf, len, from)) {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5457  		kvfree(buf);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5458  		return -EFAULT;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5459  	}
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5460  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5461  	set_task_reclaim_state(current, &sc.reclaim_state);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5462  	flags = memalloc_noreclaim_save();
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5463  	blk_start_plug(&plug);
e9d4e1ee788097 Yu Zhao    2022-12-21  5464  	if (!set_mm_walk(NULL, true)) {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5465  		err = -ENOMEM;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5466  		goto done;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5467  	}
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5468  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5469  	next = buf;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18 @5470  	next[len] = '\0';
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5471  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5472  	while ((cur = strsep(&next, ",;\n"))) {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5473  		int n;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5474  		int end;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5475  		char cmd;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5476  		unsigned int memcg_id;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5477  		unsigned int nid;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5478  		unsigned long seq;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5479  		unsigned int swappiness = -1;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5480  		unsigned long opt = -1;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5481  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5482  		cur = skip_spaces(cur);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5483  		if (!*cur)
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5484  			continue;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5485  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5486  		n = sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5487  			   &seq, &end, &swappiness, &end, &opt, &end);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5488  		if (n < 4 || cur[end]) {
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5489  			err = -EINVAL;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5490  			break;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5491  		}
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5492  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5493  		err = run_cmd(cmd, memcg_id, nid, seq, &sc, swappiness, opt);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5494  		if (err)
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5495  			break;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5496  	}
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5497  done:
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5498  	clear_mm_walk();
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5499  	blk_finish_plug(&plug);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5500  	memalloc_noreclaim_restore(flags);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5501  	set_task_reclaim_state(current, NULL);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5502  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5503  	kvfree(buf);
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5504  
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5505  	return err ? : len;
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5506  }
d6c3af7d8a2ba5 Yu Zhao    2022-09-18  5507  

:::::: The code at line 5470 was first introduced by commit
:::::: d6c3af7d8a2ba5602c28841248c551a712ac50f5 mm: multi-gen LRU: debugfs interface

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
