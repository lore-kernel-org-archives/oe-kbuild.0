Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC431761A2
	for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058686; cv=none; b=WKgUUeuTSpHxuiKVRfTVW+q3bMFx3DnZpTBt6+3Ko2+U9TJXpAaf1BD6ut8qSCyQrBtQsbG8rk90BCp0vVnLQrv5+cPJ/Iss799f8xO+WQUl9reMgj+ey/s6jCARzOlnVynFFSPppdjtzsxP3MNtJ0NYyBtvs4YFxTKg7ehKb4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058686; c=relaxed/simple;
	bh=2X+AEHUqdRhQUTdlPPUL1Hop8pILQrfiguKDgLZLwwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jWAFsqNFhiQqTm/hTdMBQOl0QHW4RmvVpt+wR8BiaOF5Tg6qbvi8HIp7n69pC9jgdt9NUkp9MslbOvCEG6QyEjJ05gB+FKjcIGNMP+kSql+emTROZcWXNXRzDqb5FEnP196mc2idwiSa4V5PAc0ap7N+GDDNasIev5uf132hK4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a92KQLl+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a92KQLl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717058684; x=1748594684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2X+AEHUqdRhQUTdlPPUL1Hop8pILQrfiguKDgLZLwwg=;
  b=a92KQLl+Dv0gmrkYrJM0q2UkB3GeVro5HCTG5H6OsCpb8m21GtHrqkO9
   WpsfaLNazhoGG1eQZ58j3I6BmHMwFvP+mTx7KxpvE24/RD+i+8o16XtXD
   QjS6JHZ8hEc4Ga0SGPPCV6wHI9Nedr1cqp/H3QnNhk2QO7++mkJMKV+9V
   783MPkacgrf54owrL9vnyBjAH7V7G2YmptGzfkjywlToEnk0VyDK9Yn6W
   +bazy1I8AYo9M5X9r3pmoONv710GpN4K3jxfpa6li8ll9xxAkXDzFLvqV
   U1LPtSk8HP5A5CtVIMVnxjEuVgt4NseIJsC+f6gkzxLzlDlG9xtfMdsjZ
   g==;
X-CSE-ConnectionGUID: rXFvYPp7TmCe2osTW7bH1Q==
X-CSE-MsgGUID: kvO4p2z6Q1uMdqvfGcN4fQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13685144"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13685144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 01:44:43 -0700
X-CSE-ConnectionGUID: u/kZKWd+Qy6Kv30p4NOzwA==
X-CSE-MsgGUID: PEhldOmJTlmXhWciOssOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="58918115"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2024 01:44:42 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCbOq-000F1x-0o;
	Thu, 30 May 2024 08:44:40 +0000
Date: Thu, 30 May 2024 16:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:memcontrol_v1.1-stable 14/15] mm/memcontrol.c:1628
 mem_cgroup_oom() error: uninitialized symbol 'locked'.
Message-ID: <202405301608.8i9hgexO-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1-stable
head:   4df98e6b1ec64282ccd12b3bb1d863bf296cf86b
commit: 241d95ae7e072750faca6825aa9b5041e8834ce6 [14/15] mm: memcg: put cgroup v1-related members of task_struct under config option
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301608.8i9hgexO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405301608.8i9hgexO-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:1628 mem_cgroup_oom() error: uninitialized symbol 'locked'.

vim +/locked +1628 mm/memcontrol.c

9cbb78bb314360 David Rientjes    2012-07-31  1609  
becdf89d776c8f Shakeel Butt      2022-03-22  1610  /*
becdf89d776c8f Shakeel Butt      2022-03-22  1611   * Returns true if successfully killed one or more processes. Though in some
becdf89d776c8f Shakeel Butt      2022-03-22  1612   * corner cases it can return true even without killing any process.
becdf89d776c8f Shakeel Butt      2022-03-22  1613   */
becdf89d776c8f Shakeel Butt      2022-03-22  1614  static bool mem_cgroup_oom(struct mem_cgroup *memcg, gfp_t mask, int order)
867578cbccb089 KAMEZAWA Hiroyuki 2010-03-10  1615  {
becdf89d776c8f Shakeel Butt      2022-03-22  1616  	bool locked, ret;
7056d3a37d2c6a Michal Hocko      2018-12-28  1617  
29ef680ae7c211 Michal Hocko      2018-08-17  1618  	if (order > PAGE_ALLOC_COSTLY_ORDER)
becdf89d776c8f Shakeel Butt      2022-03-22  1619  		return false;
29ef680ae7c211 Michal Hocko      2018-08-17  1620  
7a1adfddaf0d11 Roman Gushchin    2018-10-26  1621  	memcg_memory_event(memcg, MEMCG_OOM);
7a1adfddaf0d11 Roman Gushchin    2018-10-26  1622  
a0861053f33ce1 Roman Gushchin    2024-05-08  1623  	if (!memcg1_oom_prepare(memcg, &locked))
becdf89d776c8f Shakeel Butt      2022-03-22  1624  		return false;
29ef680ae7c211 Michal Hocko      2018-08-17  1625  
becdf89d776c8f Shakeel Butt      2022-03-22  1626  	ret = mem_cgroup_out_of_memory(memcg, mask, order);
7056d3a37d2c6a Michal Hocko      2018-12-28  1627  
a0861053f33ce1 Roman Gushchin    2024-05-08 @1628  	memcg1_oom_finish(memcg, locked);
29ef680ae7c211 Michal Hocko      2018-08-17  1629  
7056d3a37d2c6a Michal Hocko      2018-12-28  1630  	return ret;
3812c8c8f39539 Johannes Weiner   2013-09-12  1631  }
3812c8c8f39539 Johannes Weiner   2013-09-12  1632  

:::::: The code at line 1628 was first introduced by commit
:::::: a0861053f33ce10fc6e36c20b13e1c915eae4c9a mm: memcg: move cgroup v1 oom handling code into memcontrol-v1.c

:::::: TO: Roman Gushchin <roman.gushchin@linux.dev>
:::::: CC: Roman Gushchin <roman.gushchin@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
