Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368328726C
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786251; cv=none; b=oovnHPSOGoyyjsfgxC40Iygz93UtaLnMgSbsKmXWCjonksb+xMZDj5iw4fQYtrsi9fvUVN3c+XeCCESmStNaiSYbHR2W7out+XOveH4EgjiDknAqQYBnhWBQuLslE22xUcvGs3n4aTngQRIxim+sIK3HLKAS9uL3SN+Bj+NELlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786251; c=relaxed/simple;
	bh=IlSWlzr5y7S9CPZhvhAJlUGLWrcMR24OPapWePCPE2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lXrGFp70nWXW1LpIxM427caIuunHsjDnlrGh+tyE7hnKE09z/X7VfMU1VqroQAJ/3TG/tDCyVR+qNWKO7M9SHNHVeO9P7/q9rZ2MdIp298YN88a2lZ/hWQ+U+oTRnBRKS6NW8wsVSF3/DvQtBFi+FrRlelORK7fGEIMSdN+PK1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LatBc7Nn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LatBc7Nn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755786249; x=1787322249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IlSWlzr5y7S9CPZhvhAJlUGLWrcMR24OPapWePCPE2s=;
  b=LatBc7NnN64a+bsHG4Le4FUhCJcNRKrWj2WDIWcf7AvGExfBuCl3Ppba
   U+IRr+B/28DVsZTJuyagvHr/x2ggzA6IY6I7khVlvgCA0w1CcGVpObd24
   cl6IWjztci1YmNrNV4RD/QopysZVhztHjjEzQg7XyxS4GEX9jT2C0O4m0
   YWpGiAYk6cBiJNpQc24ZFRzUE0sCmKsyPvSyhUIVREI7r4g9NZkj3kLhk
   Aqgyk7RU8gTXN/tkWVr/zgpMQBZWB7phnYeZ8MV5auUTun8q07+ab8g5e
   +1N+rkRdjebZ3qncXTHIAwxsA/vrCBoiTiVJ38ZBA7o4cXd0/jJbpGvL7
   w==;
X-CSE-ConnectionGUID: UFH+2fZhSHqiOWQGO7UtfQ==
X-CSE-MsgGUID: 4iGnaCRyRRWHQVBv2BtPww==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58175270"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58175270"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 07:24:08 -0700
X-CSE-ConnectionGUID: QbFrE0A4RA2SmnMSuSGBmw==
X-CSE-MsgGUID: yb6bBOn9RpqW/7TsP2KrXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172839665"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2025 07:24:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up6CV-000KM7-0S;
	Thu, 21 Aug 2025 14:23:43 +0000
Date: Thu, 21 Aug 2025 22:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 467/467] mm/vmscan.c:5449
 shrink_many() error: uninitialized symbol 'lruvec'.
Message-ID: <202508212211.cXaJ4xYA-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   8ed1be48608e1472226c28c98c6009a7b4e914eb
commit: 0500235e3f9d430936afc1377ac2efd76487ae9a [467/467] ANDROID: vendor_hook: Add vendor hook to decide scan abort policy
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 11 months ago
config: i386-randconfig-141-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212211.cXaJ4xYA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508212211.cXaJ4xYA-lkp@intel.com/

smatch warnings:
mm/vmscan.c:5449 shrink_many() error: uninitialized symbol 'lruvec'.

vim +/lruvec +5449 mm/vmscan.c

014f97baadc9bc Yu Zhao      2022-12-21  5397  
014f97baadc9bc Yu Zhao      2022-12-21  5398  static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
014f97baadc9bc Yu Zhao      2022-12-21  5399  {
3792ff78b1a131 Yu Zhao      2023-02-13  5400  	int op;
014f97baadc9bc Yu Zhao      2022-12-21  5401  	int gen;
014f97baadc9bc Yu Zhao      2022-12-21  5402  	int bin;
014f97baadc9bc Yu Zhao      2022-12-21  5403  	int first_bin;
014f97baadc9bc Yu Zhao      2022-12-21  5404  	struct lruvec *lruvec;
0500235e3f9d43 Kalesh Singh 2023-07-13  5405  	struct lru_gen_folio *lrugen = NULL;
3792ff78b1a131 Yu Zhao      2023-02-13  5406  	struct mem_cgroup *memcg;
014f97baadc9bc Yu Zhao      2022-12-21  5407  	const struct hlist_nulls_node *pos;
014f97baadc9bc Yu Zhao      2022-12-21  5408  
014f97baadc9bc Yu Zhao      2022-12-21  5409  	bin = first_bin = get_random_u32_below(MEMCG_NR_BINS);
014f97baadc9bc Yu Zhao      2022-12-21  5410  restart:
3792ff78b1a131 Yu Zhao      2023-02-13  5411  	op = 0;
3792ff78b1a131 Yu Zhao      2023-02-13  5412  	memcg = NULL;
014f97baadc9bc Yu Zhao      2022-12-21  5413  	gen = get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq));
014f97baadc9bc Yu Zhao      2022-12-21  5414  
014f97baadc9bc Yu Zhao      2022-12-21  5415  	rcu_read_lock();
014f97baadc9bc Yu Zhao      2022-12-21  5416  
014f97baadc9bc Yu Zhao      2022-12-21  5417  	hlist_nulls_for_each_entry_rcu(lrugen, pos, &pgdat->memcg_lru.fifo[gen][bin], list) {
014f97baadc9bc Yu Zhao      2022-12-21  5418  		if (op)
014f97baadc9bc Yu Zhao      2022-12-21  5419  			lru_gen_rotate_memcg(lruvec, op);
014f97baadc9bc Yu Zhao      2022-12-21  5420  
014f97baadc9bc Yu Zhao      2022-12-21  5421  		mem_cgroup_put(memcg);
014f97baadc9bc Yu Zhao      2022-12-21  5422  
014f97baadc9bc Yu Zhao      2022-12-21  5423  		lruvec = container_of(lrugen, struct lruvec, lrugen);
014f97baadc9bc Yu Zhao      2022-12-21  5424  		memcg = lruvec_memcg(lruvec);
014f97baadc9bc Yu Zhao      2022-12-21  5425  
014f97baadc9bc Yu Zhao      2022-12-21  5426  		if (!mem_cgroup_tryget(memcg)) {
014f97baadc9bc Yu Zhao      2022-12-21  5427  			op = 0;
014f97baadc9bc Yu Zhao      2022-12-21  5428  			memcg = NULL;
014f97baadc9bc Yu Zhao      2022-12-21  5429  			continue;
014f97baadc9bc Yu Zhao      2022-12-21  5430  		}
014f97baadc9bc Yu Zhao      2022-12-21  5431  
014f97baadc9bc Yu Zhao      2022-12-21  5432  		rcu_read_unlock();
014f97baadc9bc Yu Zhao      2022-12-21  5433  
014f97baadc9bc Yu Zhao      2022-12-21  5434  		op = shrink_one(lruvec, sc);
014f97baadc9bc Yu Zhao      2022-12-21  5435  
014f97baadc9bc Yu Zhao      2022-12-21  5436  		rcu_read_lock();
3792ff78b1a131 Yu Zhao      2023-02-13  5437  
0500235e3f9d43 Kalesh Singh 2023-07-13  5438  		if (should_abort_scan(lruvec, sc))
3792ff78b1a131 Yu Zhao      2023-02-13  5439  			break;
014f97baadc9bc Yu Zhao      2022-12-21  5440  	}
014f97baadc9bc Yu Zhao      2022-12-21  5441  
014f97baadc9bc Yu Zhao      2022-12-21  5442  	rcu_read_unlock();
014f97baadc9bc Yu Zhao      2022-12-21  5443  
3792ff78b1a131 Yu Zhao      2023-02-13  5444  	if (op)
3792ff78b1a131 Yu Zhao      2023-02-13  5445  		lru_gen_rotate_memcg(lruvec, op);
3792ff78b1a131 Yu Zhao      2023-02-13  5446  
3792ff78b1a131 Yu Zhao      2023-02-13  5447  	mem_cgroup_put(memcg);
3792ff78b1a131 Yu Zhao      2023-02-13  5448  
0500235e3f9d43 Kalesh Singh 2023-07-13 @5449  	if (lruvec && should_abort_scan(lruvec, sc))
3792ff78b1a131 Yu Zhao      2023-02-13  5450  		return;
3792ff78b1a131 Yu Zhao      2023-02-13  5451  
014f97baadc9bc Yu Zhao      2022-12-21  5452  	/* restart if raced with lru_gen_rotate_memcg() */
014f97baadc9bc Yu Zhao      2022-12-21  5453  	if (gen != get_nulls_value(pos))
014f97baadc9bc Yu Zhao      2022-12-21  5454  		goto restart;
014f97baadc9bc Yu Zhao      2022-12-21  5455  
014f97baadc9bc Yu Zhao      2022-12-21  5456  	/* try the rest of the bins of the current generation */
014f97baadc9bc Yu Zhao      2022-12-21  5457  	bin = get_memcg_bin(bin + 1);
014f97baadc9bc Yu Zhao      2022-12-21  5458  	if (bin != first_bin)
014f97baadc9bc Yu Zhao      2022-12-21  5459  		goto restart;
014f97baadc9bc Yu Zhao      2022-12-21  5460  }
014f97baadc9bc Yu Zhao      2022-12-21  5461  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
