Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649928A1E4
	for <oe-kbuild@lists.linux.dev>; Thu, 22 May 2025 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918369; cv=none; b=RKtAdwkmvuKNaA5jG9TLKvxAUXTKJOc8n4v8V2UeQEDOVH/Xx6Yvegd0at/I/t5r4e27qfqzKf3lxCNZzwXD63lWhdJAPzbJjhydYC6Egzn0DOitxed1hq1x5nKP0LKUKO6qriaX3RdghU4MANQt2Nyq5Edyo+WJskEEExcl9oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918369; c=relaxed/simple;
	bh=2yUs87dlBE054Itd8fmW44X1+S40u4Lm2MrE1mP0i+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnhFzSlhDkxQGH8nJpsEbphSUt6OeT42NL47qfSnqJ2XOnvAvjbKmqL4Nanl5hAhnpWBKM794vqwIidoXruN9rg7OC0H9KcatcR1twT2/eOKU6Z81fI/XpGwt7RJeFTUsvnDpHke4ouxCR19f97OY+LGM9LP+cTVrXAYbCRx2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGxpg6d3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGxpg6d3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747918367; x=1779454367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2yUs87dlBE054Itd8fmW44X1+S40u4Lm2MrE1mP0i+s=;
  b=YGxpg6d3YS0zP2ZhSz1o75gRuT1VLHueZg3klapGbU8dmcOeapDnZcgo
   NOheFMqaEErIwHr9Nx4aFS1Z0I4/YO/XaTyu85e5QagDfcKpgO3qWZ9nI
   pDX796iIglUKbu+dMGbI7amoAw7KPRQ0rldNxgNCD5+yDreUKUqCMkC3y
   jmyJKfvvTLClhobP135iaJXeQ+nsj0ULBDh46vBFcnyEtm5u3HuEQItRv
   5RcY1yn3btR72EefAKGIAaPt50pf1NjpSu3SdO21qtI9g7M1tGGDC/btj
   /ReynkcHbQH54rGePxV5IeH/aBJYbiWWi4Vs8mTuifkh2qW8KCObefxCe
   w==;
X-CSE-ConnectionGUID: lyoAtVSzSkqiTWT99omX9Q==
X-CSE-MsgGUID: nEAcqrzGTPeTTQ03zVey6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37562263"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="37562263"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 05:52:46 -0700
X-CSE-ConnectionGUID: K2oQ4DKsTLCuRx50nobgkA==
X-CSE-MsgGUID: NzaStfA6SoqEbaIN+u+7wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140464038"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2025 05:52:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI5Pe-000PLI-2k;
	Thu, 22 May 2025 12:52:42 +0000
Date: Thu, 22 May 2025 20:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/5] block: add support for copy offload
Message-ID: <202505222054.NVHC4kxh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: block/blk-integrity.c:29:38: sparse: sparse: missing braces around initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250521223107.709131-3-kbusch@meta.com>
References: <20250521223107.709131-3-kbusch@meta.com>
TO: Keith Busch <kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20250522]
[cannot apply to linux-nvme/for-next brauner-vfs/vfs.all linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-new-sector-copy-api/20250522-063316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250521223107.709131-3-kbusch%40meta.com
patch subject: [PATCH 2/5] block: add support for copy offload
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: microblaze-randconfig-r133-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222054.NVHC4kxh-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505222054.NVHC4kxh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505222054.NVHC4kxh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-integrity.c:29:38: sparse: sparse: missing braces around initializer
>> block/blk-integrity.c:29:38: sparse: sparse: missing braces around initializer
   block/blk-integrity.c:69:38: sparse: sparse: missing braces around initializer
   block/blk-integrity.c:69:38: sparse: sparse: missing braces around initializer

vim +29 block/blk-integrity.c

7ba1ba12eeef0a Martin K. Petersen 2008-06-30  18  
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  19  /**
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  20   * blk_rq_count_integrity_sg - Count number of integrity scatterlist elements
13f05c8d8e98bb Martin K. Petersen 2010-09-10  21   * @q:		request queue
13f05c8d8e98bb Martin K. Petersen 2010-09-10  22   * @bio:	bio with integrity metadata attached
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  23   *
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  24   * Description: Returns the number of elements required in a
13f05c8d8e98bb Martin K. Petersen 2010-09-10  25   * scatterlist corresponding to the integrity metadata in a bio.
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  26   */
13f05c8d8e98bb Martin K. Petersen 2010-09-10  27  int blk_rq_count_integrity_sg(struct request_queue *q, struct bio *bio)
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  28  {
d57a5f7c6605f1 Kent Overstreet    2013-11-23 @29  	struct bio_vec iv, ivprv = { NULL };
13f05c8d8e98bb Martin K. Petersen 2010-09-10  30  	unsigned int segments = 0;
13f05c8d8e98bb Martin K. Petersen 2010-09-10  31  	unsigned int seg_size = 0;
d57a5f7c6605f1 Kent Overstreet    2013-11-23  32  	struct bvec_iter iter;
d57a5f7c6605f1 Kent Overstreet    2013-11-23  33  	int prev = 0;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  34  
d57a5f7c6605f1 Kent Overstreet    2013-11-23  35  	bio_for_each_integrity_vec(iv, bio, iter) {
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  36  
d57a5f7c6605f1 Kent Overstreet    2013-11-23  37  		if (prev) {
3dccdae54fe836 Christoph Hellwig  2018-09-24  38  			if (!biovec_phys_mergeable(q, &ivprv, &iv))
13f05c8d8e98bb Martin K. Petersen 2010-09-10  39  				goto new_segment;
d57a5f7c6605f1 Kent Overstreet    2013-11-23  40  			if (seg_size + iv.bv_len > queue_max_segment_size(q))
13f05c8d8e98bb Martin K. Petersen 2010-09-10  41  				goto new_segment;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  42  
d57a5f7c6605f1 Kent Overstreet    2013-11-23  43  			seg_size += iv.bv_len;
13f05c8d8e98bb Martin K. Petersen 2010-09-10  44  		} else {
13f05c8d8e98bb Martin K. Petersen 2010-09-10  45  new_segment:
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  46  			segments++;
d57a5f7c6605f1 Kent Overstreet    2013-11-23  47  			seg_size = iv.bv_len;
13f05c8d8e98bb Martin K. Petersen 2010-09-10  48  		}
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  49  
d57a5f7c6605f1 Kent Overstreet    2013-11-23  50  		prev = 1;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  51  		ivprv = iv;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  52  	}
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  53  
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  54  	return segments;
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  55  }
7ba1ba12eeef0a Martin K. Petersen 2008-06-30  56  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
