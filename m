Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A752B136985
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Feb 2024 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708029469; cv=none; b=lJ5aSG5w45po5tPK6kn0ZbvknkSOpYBzVgXLacfNgAGiMoyu14iJVMJUjMWQkmrRGOyEeLwSrUm7VJIfLrbRGJouh9vN4miDMktmhsBC2kpBBCy7b5m/HaTaJJW/lVp0qzaPJM0As6cW1saygkSsHmi58192G5/ZSvWM8L8Oq8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708029469; c=relaxed/simple;
	bh=klwBNZSPu93A6XGdrVx8UgEHkCIo6QTP5IZJME9maoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/5Oy9EpCfOpsu3OVz3cJxxAM/5PyqCUvzEa5kU0Olkd3czQ2g2dqfEgMBbPL13KDyquzzz5OysBprOI5xpl18PQgIE6icl/xmNf9FM0aNmkhKXXPmVpmN/YvYiJ/ZRBfAkv+LnsDhatAyi+gsVkyj9Qq3AX0qgUE3/RXHEVb7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AijiXXfU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AijiXXfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708029468; x=1739565468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=klwBNZSPu93A6XGdrVx8UgEHkCIo6QTP5IZJME9maoc=;
  b=AijiXXfU3e27OKPY/INCZ2CZ4ha1HX83deEYVXGaWsyx1XsO9i8aRwKL
   A1w6TTHVVNZp9l1+K/JkM+SQkJrYvy7RGZzpPXlkoaaD5nOFVvtREZk2+
   Td3S6Ua0mRnGC9Vg2WBABvv3PuBb0DEagurhylRFvPu6NPa54mc7Il1RA
   h0q7ONmewuCkTo1rgAo/AKjqVI3Idsai/2/8NQQDK63TppLlVkl7ee5uK
   W29IWMdDHSMNASDv0yb/mgub1ES4sSgiP9m7Z/ap/wICcLG2CYXQQtL/2
   6vpRJTCGZruTQD0TKFIyJbeVEv6ynYZA2m/1n0VvZssK2t3R2GiQWovH5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12861700"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="12861700"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 12:37:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3608746"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Feb 2024 12:37:43 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raiUG-0000ku-3A;
	Thu, 15 Feb 2024 20:37:40 +0000
Date: Fri, 16 Feb 2024 04:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cel:simple-offset-maple 5/7] lib/test_maple_tree.c:3612
 alloc_cyclic_testing() warn: sleeping in atomic context
Message-ID: <202402160419.2pdB2GFG-lkp@intel.com>
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
TO: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux simple-offset-maple
head:   380438ec8aea040862920a4abd295062125939fe
commit: c9d26c93c59232dcd560b8275e9c2a7f058c9a39 [5/7] test_maple_tree: testing the cyclic allocation
:::::: branch date: 4 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240214 (https://download.01.org/0day-ci/archive/20240216/202402160419.2pdB2GFG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402160419.2pdB2GFG-lkp@intel.com/

smatch warnings:
lib/test_maple_tree.c:3612 alloc_cyclic_testing() warn: sleeping in atomic context

vim +3612 lib/test_maple_tree.c

eb2e817f38cafb Liam R. Howlett 2023-05-18  3601  
c9d26c93c59232 Liam R. Howlett 2024-02-13  3602  static noinline void __init alloc_cyclic_testing(struct maple_tree *mt)
c9d26c93c59232 Liam R. Howlett 2024-02-13  3603  {
c9d26c93c59232 Liam R. Howlett 2024-02-13  3604  	unsigned long location;
c9d26c93c59232 Liam R. Howlett 2024-02-13  3605  	unsigned long next;
c9d26c93c59232 Liam R. Howlett 2024-02-13  3606  	int ret = 0;
c9d26c93c59232 Liam R. Howlett 2024-02-13  3607  	MA_STATE(mas, mt, 0, 0);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3608  
c9d26c93c59232 Liam R. Howlett 2024-02-13  3609  	next = 0;
c9d26c93c59232 Liam R. Howlett 2024-02-13  3610  	mtree_lock(mt);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3611  	for (int i = 0; i < 100; i++) {
c9d26c93c59232 Liam R. Howlett 2024-02-13 @3612  		mas_alloc_cyclic(&mas, &location, mt, 2, ULONG_MAX, &next, GFP_KERNEL);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3613  		MAS_BUG_ON(&mas, i != location - 2);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3614  		MAS_BUG_ON(&mas, mas.index != location);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3615  		MAS_BUG_ON(&mas, mas.last != location);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3616  		MAS_BUG_ON(&mas, i != next - 3);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3617  	}
c9d26c93c59232 Liam R. Howlett 2024-02-13  3618  
c9d26c93c59232 Liam R. Howlett 2024-02-13  3619  	mtree_unlock(mt);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3620  	mtree_destroy(mt);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3621  	next = 0;
c9d26c93c59232 Liam R. Howlett 2024-02-13  3622  	mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3623  	for (int i = 0; i < 100; i++) {
c9d26c93c59232 Liam R. Howlett 2024-02-13  3624  		mtree_alloc_cyclic(mt, &location, mt, 2, ULONG_MAX, &next, GFP_KERNEL);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3625  		MT_BUG_ON(mt, i != location - 2);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3626  		MT_BUG_ON(mt, i != next - 3);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3627  		MT_BUG_ON(mt, mtree_load(mt, location) != mt);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3628  	}
c9d26c93c59232 Liam R. Howlett 2024-02-13  3629  
c9d26c93c59232 Liam R. Howlett 2024-02-13  3630  	mtree_destroy(mt);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3631  	/* Overflow test */
c9d26c93c59232 Liam R. Howlett 2024-02-13  3632  	next = ULONG_MAX - 1;
c9d26c93c59232 Liam R. Howlett 2024-02-13  3633  	ret = mtree_alloc_cyclic(mt, &location, mt, 2, ULONG_MAX, &next, GFP_KERNEL);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3634  	MT_BUG_ON(mt, ret != 0);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3635  	ret = mtree_alloc_cyclic(mt, &location, mt, 2, ULONG_MAX, &next, GFP_KERNEL);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3636  	MT_BUG_ON(mt, ret != 0);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3637  	ret = mtree_alloc_cyclic(mt, &location, mt, 2, ULONG_MAX, &next, GFP_KERNEL);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3638  	MT_BUG_ON(mt, ret != 1);
c9d26c93c59232 Liam R. Howlett 2024-02-13  3639  }
c9d26c93c59232 Liam R. Howlett 2024-02-13  3640  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
