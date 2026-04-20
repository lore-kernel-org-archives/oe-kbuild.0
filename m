Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7FE17DE36
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Apr 2026 03:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776656673; cv=none; b=V4dvp4iby3e79BzNXoTntPUwTRIHQ3A9FW+jyX2qzV5UOdc8+4Sbd38x2Yb9Equ/xWd1IDDz89gZUi1d5v3HiBZy+taQTKzfuVmleMV73gNEwwrCaz+Auh381ZKf2z1+bzjV6fGtb4ZiTxqpwY/bTha+j9Zt7HjkKCi9wMszwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776656673; c=relaxed/simple;
	bh=XW6a2wlC7etdeBl0TlDmy7KOlu6qjl9UuJDrWunL6og=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wz0zPN0cX76CWJEL/ozzWqHxGvksoLAkYyLfwHMJV7PbcCbGy+5+Gj1FVVfdtuW9Y7eV2Gt/qIVlB+3TImpDTtkQawrAFRFgvy3ZLxGIv5aDdqwsSIAZX7XoH3+Ab7E3LPnJfXfpQNFscWdyJMUKqA36+YDifcRw8VCT+7lONyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQonUq7R; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQonUq7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776656671; x=1808192671;
  h=date:from:to:cc:subject:message-id;
  bh=XW6a2wlC7etdeBl0TlDmy7KOlu6qjl9UuJDrWunL6og=;
  b=VQonUq7R64t4WoMthlsEqqCN8pM0SMNU450sYuQ8JEyphBmjdJQXttux
   zWw5Fy726VAoVODRe2xH3pnP8qbG2ObYEm0ijpRGdFmRcJff4S1ko5dhh
   rwEMRv5XOVM0GPPTSNo5h8agdc3BGv2gSP8CCL5svGzHO0cC+ic56rGcl
   RbIln2qIOhxLEZUrWJXTSy72lAZ1NvAO77Hg2ZzsBreJLz+BJ/uQkL357
   alFdxO/Q2DDK+bx31Ca+72WqP4iz1G1jaB0BmVbHOwMPB3R04tu3yvIQd
   G73v+T9kf1q78o+yHzkTmuCp01dP+uuFuhIntZcGEO/p/FwPXnDMc0DlY
   Q==;
X-CSE-ConnectionGUID: iVE9aB3kT8eNcDd0riEa7g==
X-CSE-MsgGUID: N+8Ozaf7SduSeJXz63rNlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81437159"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="81437159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 20:44:30 -0700
X-CSE-ConnectionGUID: 3hvsM0Y0S/qL5czLd23aUg==
X-CSE-MsgGUID: Xm+Zqzd6Rw20EPrOY2T47g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="269634777"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2026 20:44:29 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEfYg-0000000028a-0cfq;
	Mon, 20 Apr 2026 03:44:26 +0000
Date: Mon, 20 Apr 2026 11:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [koverstreet-bcachefs:master 74/93]
 fs/bcachefs/journal/journal.c:633:2-8: preceding lock on line 630
Message-ID: <202604201145.W0Mx9JKI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   9921311178817ed16cae0482ce5bfdd27135981a
commit: 2886cbbed99692c196ebb056fe270842e5f784a5 [74/93] bcachefs: journal: add journal_ringbuf, journal_res_data()
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: sh-randconfig-r063-20260420 (https://download.01.org/0day-ci/archive/20260420/202604201145.W0Mx9JKI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604201145.W0Mx9JKI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/journal/journal.c:633:2-8: preceding lock on line 630

vim +633 fs/bcachefs/journal/journal.c

1c6fdbd8f2465d fs/bcachefs/journal.c         Kent Overstreet 2017-03-16  619  
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  620  static void journal_buf_prealloc(struct journal *j)
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  621  {
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  622  	if (j->free_buf &&
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  623  	    j->free_buf_size >= j->buf_size_want)
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  624  		return;
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  625  
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  626  	unsigned buf_size = j->buf_size_want;
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  627  
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  628  	spin_unlock(&j->lock);
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  629  	void *buf = kvmalloc(buf_size, GFP_NOFS);
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05 @630  	spin_lock(&j->lock);
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  631  
2886cbbed99692 fs/bcachefs/journal/journal.c Kent Overstreet 2026-04-17  632  	if (!buf)
2886cbbed99692 fs/bcachefs/journal/journal.c Kent Overstreet 2026-04-17 @633  		return;
2886cbbed99692 fs/bcachefs/journal/journal.c Kent Overstreet 2026-04-17  634  
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  635  	swap(buf,	j->free_buf);
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  636  	swap(buf_size,	j->free_buf_size);
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  637  
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  638  	if (unlikely(buf)) {
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  639  		spin_unlock(&j->lock);
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  640  		/* kvfree can sleep */
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  641  		kvfree(buf);
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  642  		spin_lock(&j->lock);
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  643  	}
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  644  }
35282ce9e82f6e fs/bcachefs/journal.c         Kent Overstreet 2025-02-05  645  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
