Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418CF12B93
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Jun 2024 03:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719284882; cv=none; b=fBHL7sY8oagAA47tqtwZD29jOECk6DdcM3q6R0XBtdRf08aVhCcvNZgsFAV0I3Zz3mEqMT/sxlkaIFDIKzco/iIakVRHRzwkFBLQD9EQz/L7oBms8Xp5xkoLN/pcjgmDPe6u8FH+9AJ8CteBa47dWi6ox0mf+G2Y5mpeZv2hsDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719284882; c=relaxed/simple;
	bh=9nwqfFizAX/fhv5thptnRkBqxmg3yKUTF01yRfmHVTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLBkXIrpop7Q8kJYDOK4ymVRPye/VmHBC4p+WRSUgR0GC6V5bep0rUAwRfOFi4hxUqlgoPVlbnAh/yndh0frJEJk3fkADlEg+99pHI5IXEAmQ+NSTHieHSBr2+krhX9DvIKAXnY1Ldn+mK2RFcdY3dK8tJ0lsmb9xbzljI5BvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCg5feO7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCg5feO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719284880; x=1750820880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nwqfFizAX/fhv5thptnRkBqxmg3yKUTF01yRfmHVTc=;
  b=TCg5feO7mGhIlCKYkoTBafOA+q+FW6Hnsg64CH1nHm4la1y3Qi73OCGx
   tSswck7RIwsRkpCW4nSjvrM8JoFBq9rHmsPoDQYJC+bhubyd9ulRIQXXx
   62fCbB7YkTWEaZ8MvA+3RcQvZwp+Gv5unVg+fHv2YxGioD6Avw9QoAKwh
   RWVu4B8amJVk/pChqBmBkEzKf3UwDXxdB8R/k/eZMMkPK9qyON6Ll+e1W
   I5DR4H6BrsxZ0pKBsQp59WjpevBZrZQWrmn49e/aegNsOydSuZZK46JSF
   cNAwLDmlKWmWbFxCsjI/dgOBw/55KEjx9MSMo7C01Jn6cxdRpkTwCDrQN
   Q==;
X-CSE-ConnectionGUID: KZSkWd9GQ3iuOGH4hd6qKw==
X-CSE-MsgGUID: vvHhsIUTS++2AFhhdGWRtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20161848"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="20161848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 20:07:59 -0700
X-CSE-ConnectionGUID: 0IKtFuNxTPCXiLe4u+gzlA==
X-CSE-MsgGUID: +yNR9rVIQuKirr2agTj7eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="43570924"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jun 2024 20:07:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLwXE-000Dxu-0z;
	Tue, 25 Jun 2024 03:07:56 +0000
Date: Tue, 25 Jun 2024 11:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6602/7397] mm/damon/paddr.c:360
 __damon_pa_migrate_folio_list() error: uninitialized symbol 'nr_succeeded'.
Message-ID: <202406251102.GE07hqfQ-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Honggyu Kim <honggyu.kim@sk.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Hyeongtak Ji <hyeongtak.ji@sk.com>
CC: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62c97045b8f720c2eac807a5f38e26c9ed512371
commit: 5311c0a2eee34fd8f4e17382a5f653b95a940ca5 [6602/7397] mm/damon/paddr: introduce DAMOS_MIGRATE_COLD action for demotion
:::::: branch date: 8 hours ago
:::::: commit date: 6 days ago
config: um-randconfig-r071-20240623 (https://download.01.org/0day-ci/archive/20240625/202406251102.GE07hqfQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406251102.GE07hqfQ-lkp@intel.com/

smatch warnings:
mm/damon/paddr.c:360 __damon_pa_migrate_folio_list() error: uninitialized symbol 'nr_succeeded'.

vim +/nr_succeeded +360 mm/damon/paddr.c

99cdc2cd180a7a SeongJae Park 2022-06-13  330  
5311c0a2eee34f Honggyu Kim   2024-06-14  331  static unsigned int __damon_pa_migrate_folio_list(
5311c0a2eee34f Honggyu Kim   2024-06-14  332  		struct list_head *migrate_folios, struct pglist_data *pgdat,
5311c0a2eee34f Honggyu Kim   2024-06-14  333  		int target_nid)
5311c0a2eee34f Honggyu Kim   2024-06-14  334  {
5311c0a2eee34f Honggyu Kim   2024-06-14  335  	unsigned int nr_succeeded;
5311c0a2eee34f Honggyu Kim   2024-06-14  336  	nodemask_t allowed_mask = NODE_MASK_NONE;
5311c0a2eee34f Honggyu Kim   2024-06-14  337  	struct migration_target_control mtc = {
5311c0a2eee34f Honggyu Kim   2024-06-14  338  		/*
5311c0a2eee34f Honggyu Kim   2024-06-14  339  		 * Allocate from 'node', or fail quickly and quietly.
5311c0a2eee34f Honggyu Kim   2024-06-14  340  		 * When this happens, 'page' will likely just be discarded
5311c0a2eee34f Honggyu Kim   2024-06-14  341  		 * instead of migrated.
5311c0a2eee34f Honggyu Kim   2024-06-14  342  		 */
5311c0a2eee34f Honggyu Kim   2024-06-14  343  		.gfp_mask = (GFP_HIGHUSER_MOVABLE & ~__GFP_RECLAIM) |
5311c0a2eee34f Honggyu Kim   2024-06-14  344  			__GFP_NOWARN | __GFP_NOMEMALLOC | GFP_NOWAIT,
5311c0a2eee34f Honggyu Kim   2024-06-14  345  		.nid = target_nid,
5311c0a2eee34f Honggyu Kim   2024-06-14  346  		.nmask = &allowed_mask
5311c0a2eee34f Honggyu Kim   2024-06-14  347  	};
5311c0a2eee34f Honggyu Kim   2024-06-14  348  
5311c0a2eee34f Honggyu Kim   2024-06-14  349  	if (pgdat->node_id == target_nid || target_nid == NUMA_NO_NODE)
5311c0a2eee34f Honggyu Kim   2024-06-14  350  		return 0;
5311c0a2eee34f Honggyu Kim   2024-06-14  351  
5311c0a2eee34f Honggyu Kim   2024-06-14  352  	if (list_empty(migrate_folios))
5311c0a2eee34f Honggyu Kim   2024-06-14  353  		return 0;
5311c0a2eee34f Honggyu Kim   2024-06-14  354  
5311c0a2eee34f Honggyu Kim   2024-06-14  355  	/* Migration ignores all cpuset and mempolicy settings */
5311c0a2eee34f Honggyu Kim   2024-06-14  356  	migrate_pages(migrate_folios, alloc_migrate_folio, NULL,
5311c0a2eee34f Honggyu Kim   2024-06-14  357  		      (unsigned long)&mtc, MIGRATE_ASYNC, MR_DAMON,
5311c0a2eee34f Honggyu Kim   2024-06-14  358  		      &nr_succeeded);
5311c0a2eee34f Honggyu Kim   2024-06-14  359  
5311c0a2eee34f Honggyu Kim   2024-06-14 @360  	return nr_succeeded;
5311c0a2eee34f Honggyu Kim   2024-06-14  361  }
5311c0a2eee34f Honggyu Kim   2024-06-14  362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
