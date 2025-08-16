Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5845913AD26
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755318943; cv=none; b=NxFWh5kJmnhZSlGl2xOldDGXsJOY1dS3CDIsyFihFacrC1vwTNzl7sEk/vv8yiAexqA4dE5yJu8ENbPAiZ1ft3ynBAbTj1zuz4YRexY2qvuS0Z6msbfT3j12vduMa5OyGS/7oTvpFb8fyAHQ61MBP02nnGU5JpnN8VwZL9fcaIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755318943; c=relaxed/simple;
	bh=3Fcss0PS4C+cip6ZNe7js/xpzzrV9+zwVe6cOCpO/Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tp5doYuW2IlxhCipAYIsyrdvQgYyB9iq66juZaz5OZML6yLHZdx+QwChjOmTaGYIX/BYNeApnyTNah//SEf2Eoj9STy6KJC4JG7NMWiOnNgCC6hqb94ZbJEu8D3psCv0QIkLc8KJJ62u7ge2GFcmngrO2fLHLm3DiFZvSnVfH80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+pLg6QZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+pLg6QZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755318941; x=1786854941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Fcss0PS4C+cip6ZNe7js/xpzzrV9+zwVe6cOCpO/Zk=;
  b=K+pLg6QZeB79e65OxGwhHW8t310CN8bYS/iokUo44F7CRNqQzFk/QNS7
   qSNzIn3DFKdobFy7vv4SRfMdcViWGKuudSVc06/DQfWlDqhNfHhvat0Im
   o8s5eQFzbT8r2Xsyl5lg35ttGjUNPfPD8jQevCxElLU4QHXq3OabHWNm2
   PlJWr4TpRnwE+SDtwPKwD9Ouk9RasHlu0KR83vhW/wAuut3IRA3RLXO4M
   AOAyoqNIh5xbS79Lw0OEcJc9Tzr9mER+bAAji4CrjtdKGrCcolWyI9AUw
   HVwXEc8QBZk+VsD2Mj9Nt2r6bT4gJi2b2w8Bfswde3ImrKXkmsdwOPAIx
   A==;
X-CSE-ConnectionGUID: cvDTIJX8SiK6Z7xEdmiopg==
X-CSE-MsgGUID: w1yYyLnDS9qS9h/4VnXw3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57560179"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57560179"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 21:35:40 -0700
X-CSE-ConnectionGUID: YbajKZyER0uJkFxk15vYYA==
X-CSE-MsgGUID: lpsFUXTXS4+AZbdUfxAv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172369085"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2025 21:35:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un8dk-000Cb2-2T;
	Sat, 16 Aug 2025 04:35:36 +0000
Date: Sat, 16 Aug 2025 12:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] blk-mq: fix elevator depth_updated method
Message-ID: <202508161240.3xbOkaXG-lkp@intel.com>
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
In-Reply-To: <20250815074517.367896-1-yukuai1@huaweicloud.com>
References: <20250815074517.367896-1-yukuai1@huaweicloud.com>
TO: Yu Kuai <yukuai1@huaweicloud.com>
TO: nilay@linux.ibm.com
TO: ming.lei@redhat.com
TO: axboe@kernel.dk
TO: bvanassche@acm.org
CC: linux-block@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: yukuai3@huawei.com
CC: yukuai1@huaweicloud.com
CC: yi.zhang@huawei.com
CC: yangerkun@huawei.com
CC: johnny.chenyi@huawei.com

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/blk-mq-fix-elevator-depth_updated-method/20250815-155534
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250815074517.367896-1-yukuai1%40huaweicloud.com
patch subject: [PATCH] blk-mq: fix elevator depth_updated method
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: alpha-randconfig-r071-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161240.3xbOkaXG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508161240.3xbOkaXG-lkp@intel.com/

New smatch warnings:
block/blk-mq-sched.h:101 blk_mq_set_min_shallow_depth() warn: iterator 'i' not incremented
block/blk-mq-sched.h:101 blk_mq_set_min_shallow_depth() warn: iterator 'i' not incremented

Old smatch warnings:
block/bfq-iosched.c:6190 __bfq_insert_request() warn: variable dereferenced before check 'bfqq' (see line 6186)

vim +/i +101 block/blk-mq-sched.h

bd166ef183c263c Jens Axboe 2017-01-17   94  
a3e2e18fb9ef511 Yu Kuai    2025-08-15   95  static inline void blk_mq_set_min_shallow_depth(struct request_queue *q,
a3e2e18fb9ef511 Yu Kuai    2025-08-15   96  						unsigned int depth)
a3e2e18fb9ef511 Yu Kuai    2025-08-15   97  {
a3e2e18fb9ef511 Yu Kuai    2025-08-15   98  	struct blk_mq_hw_ctx *hctx;
a3e2e18fb9ef511 Yu Kuai    2025-08-15   99  	unsigned long i;
a3e2e18fb9ef511 Yu Kuai    2025-08-15  100  
a3e2e18fb9ef511 Yu Kuai    2025-08-15 @101  	queue_for_each_hw_ctx(q, hctx, i)
a3e2e18fb9ef511 Yu Kuai    2025-08-15  102  		sbitmap_queue_min_shallow_depth(&hctx->sched_tags->bitmap_tags,
a3e2e18fb9ef511 Yu Kuai    2025-08-15  103  						depth);
a3e2e18fb9ef511 Yu Kuai    2025-08-15  104  }
a3e2e18fb9ef511 Yu Kuai    2025-08-15  105  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
