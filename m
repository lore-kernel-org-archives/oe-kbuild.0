Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1994B5589A
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jul 2024 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721889536; cv=none; b=qQkiJ/12LaEwmFBj3BV22WS+/V76tc77O/P/s45nH8jVQuIGiQkkcg8o0HIfu/C4mVm6Nl6gUYi1JIbgwK3DR8EBaUsUTtLuf/GEMU29WCbBRvYrc3Vb6ql9qg4ZXlFrU9fFgmgeD6ICE/Ue7Y0L78lfS02ojrkxZX9mIxlWQyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721889536; c=relaxed/simple;
	bh=muntBnLLW2MDUklicgm1R/FKJGftmB89RPr4RkiKDZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RHwWWeB5yWodFCrsl84oXtSP2p7Rq0p8G0nFj8aeJpLzkFntOMzyNHyRakNy9IbKkpa83PwIvyIaLjdyx+os68c1OQcDce3Sn00yKCT2ZHStI6JcoMZqzxJ3BnjqpPhrHEUmPxzR5sKaRYQtopxXlj9FGgeiVegL9c8GhZEeJ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQ/Hore7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQ/Hore7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721889534; x=1753425534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=muntBnLLW2MDUklicgm1R/FKJGftmB89RPr4RkiKDZ0=;
  b=LQ/Hore7B/MLlJz6zjwKQuu3sQfdQPkQMhhGUg6Kd52AMKAPYnTacqXN
   LN/fRaogUUYYQZi8FAkhq2WAWaqV1cZ/nO4Uq65DTaw34Zbn+06QhKX+j
   uHHAPYT3cgUYSH/oOxQ6XQoKvAEngGxiaTYjD6M2vD3K/oR/tjx+2OqkS
   UX1S21HFTmGI9JQmG0YdB1bjnceBd9JqoDWZIMR8acwbBp4xH1VpowfsC
   t5xOtNqQcgMlgzVreDraUIYwbtDkNGImX9Mq4fvi8FKK8xSew87a8duYj
   bLVnEXAVy/ogBiUZBJJkJZY42SIGODz3THPXOktAwVjocNXJ+Z94pQgQz
   A==;
X-CSE-ConnectionGUID: 5OjCN4+3STWUpQ9PpVK8ig==
X-CSE-MsgGUID: VzC0cUjrSlSWEbbO6dLInQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19730219"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19730219"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 23:38:53 -0700
X-CSE-ConnectionGUID: MJIx6urzR/WuOcAOLXN7Gg==
X-CSE-MsgGUID: wdPssjgrQLOklOgOs8jK6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="57124794"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2024 23:38:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWs7m-000nqO-0j;
	Thu, 25 Jul 2024 06:38:50 +0000
Date: Thu, 25 Jul 2024 14:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC 5/5] non-mm: discourage the usage of __GFP_NOFAIL and
 encourage GFP_NOFAIL
Message-ID: <202407251449.TnONiYn5-lkp@intel.com>
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
In-Reply-To: <20240724085544.299090-6-21cnbao@gmail.com>
References: <20240724085544.299090-6-21cnbao@gmail.com>
TO: Barry Song <21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/vpda-try-to-fix-the-potential-crash-due-to-misusing-__GFP_NOFAIL/20240724-170305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240724085544.299090-6-21cnbao%40gmail.com
patch subject: [PATCH RFC 5/5] non-mm: discourage the usage of __GFP_NOFAIL and encourage GFP_NOFAIL
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-141-20240725 (https://download.01.org/0day-ci/archive/20240725/202407251449.TnONiYn5-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407251449.TnONiYn5-lkp@intel.com/

New smatch warnings:
lib/rhashtable.c:192 bucket_table_alloc() warn: masked condition '(gfp & ~(((((((1))) << (10)) | ((((1))) << (11)))) | (((((1))) << (15))))) != (((((((1))) << (10)) | ((((1))) << (11)))) | (((((1))) << (6))) | (((((1))) << (7))))' is always true.

Old smatch warnings:
lib/rhashtable.c:557 rhashtable_insert_one() warn: passing zero to 'ERR_CAST'
lib/rhashtable.c:624 rhashtable_try_insert() warn: passing zero to 'ERR_CAST'

vim +192 lib/rhashtable.c

da20420f83ea0f Herbert Xu         2017-02-11  176  
97defe1ecf868b Thomas Graf        2015-01-02  177  static struct bucket_table *bucket_table_alloc(struct rhashtable *ht,
b9ecfdaa1090b5 Herbert Xu         2015-03-24  178  					       size_t nbuckets,
b9ecfdaa1090b5 Herbert Xu         2015-03-24  179  					       gfp_t gfp)
7e1e77636e3607 Thomas Graf        2014-08-02  180  {
eb6d1abf1bd8bf Daniel Borkmann    2015-02-20  181  	struct bucket_table *tbl = NULL;
8f0db018006a42 NeilBrown          2019-04-02  182  	size_t size;
f89bd6f87a53ce Thomas Graf        2015-01-02  183  	int i;
149212f07856b2 NeilBrown          2019-04-02  184  	static struct lock_class_key __key;
7e1e77636e3607 Thomas Graf        2014-08-02  185  
9e54dd8b64dccd Kent Overstreet    2024-03-21  186  	tbl = alloc_hooks_tag(ht->alloc_tag,
9e54dd8b64dccd Kent Overstreet    2024-03-21  187  			kvmalloc_node_noprof(struct_size(tbl, buckets, nbuckets),
9e54dd8b64dccd Kent Overstreet    2024-03-21  188  					     gfp|__GFP_ZERO, NUMA_NO_NODE));
da20420f83ea0f Herbert Xu         2017-02-11  189  
da20420f83ea0f Herbert Xu         2017-02-11  190  	size = nbuckets;
da20420f83ea0f Herbert Xu         2017-02-11  191  
c61791509b08d1 Barry Song         2024-07-24 @192  	if (tbl == NULL && (gfp & ~GFP_NOFAIL) != GFP_KERNEL) {
da20420f83ea0f Herbert Xu         2017-02-11  193  		tbl = nested_bucket_table_alloc(ht, nbuckets, gfp);
da20420f83ea0f Herbert Xu         2017-02-11  194  		nbuckets = 0;
da20420f83ea0f Herbert Xu         2017-02-11  195  	}
2d22ecf6db1c39 Davidlohr Bueso    2018-08-21  196  
7e1e77636e3607 Thomas Graf        2014-08-02  197  	if (tbl == NULL)
7e1e77636e3607 Thomas Graf        2014-08-02  198  		return NULL;
7e1e77636e3607 Thomas Graf        2014-08-02  199  
149212f07856b2 NeilBrown          2019-04-02  200  	lockdep_init_map(&tbl->dep_map, "rhashtable_bucket", &__key, 0);
149212f07856b2 NeilBrown          2019-04-02  201  
da20420f83ea0f Herbert Xu         2017-02-11  202  	tbl->size = size;
7e1e77636e3607 Thomas Graf        2014-08-02  203  
4feb7c7a4fbb8f NeilBrown          2019-03-21  204  	rcu_head_init(&tbl->rcu);
eddee5ba34eb6c Herbert Xu         2015-03-14  205  	INIT_LIST_HEAD(&tbl->walkers);
eddee5ba34eb6c Herbert Xu         2015-03-14  206  
d48ad080ec0101 Jason A. Donenfeld 2017-06-07  207  	tbl->hash_rnd = get_random_u32();
5269b53da4d432 Herbert Xu         2015-03-14  208  
f89bd6f87a53ce Thomas Graf        2015-01-02  209  	for (i = 0; i < nbuckets; i++)
9b4f64a227b6f4 NeilBrown          2018-06-18  210  		INIT_RHT_NULLS_HEAD(tbl->buckets[i]);
f89bd6f87a53ce Thomas Graf        2015-01-02  211  
97defe1ecf868b Thomas Graf        2015-01-02  212  	return tbl;
7e1e77636e3607 Thomas Graf        2014-08-02  213  }
7e1e77636e3607 Thomas Graf        2014-08-02  214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
