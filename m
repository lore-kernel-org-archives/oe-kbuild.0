Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D532D4C85
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 05:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754805375; cv=none; b=PbA4ykCN1SGClx/duQkcAmyFYaRwBnSbRqZGhRYEepgU0kVuBa10mjf1XE+9leFGpnliFC6OXd9vEyISNvulIAMihd/+CmxA/I80S1i8x0gWXGaRSA662YMgPFiKU8wcH+kYIvlOLhOfu+kXvSOrGTFm72C3oeYhybOgig/As9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754805375; c=relaxed/simple;
	bh=20tRU2vqicliWfE563GjB71Exwx3aQZYcjkeQTn1aNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqGKTXdCZV47umI9u1vP3K5tJh1J75i8XdVQmUNHOpivRjGHhXZim7u7A/ZP/SdSTOC3w1gdXdqi99KjS94nV5q20jTLMIQcZkcZp4ZgSWVyQ53jeOExWpve37Wd74QLMT930wZCReXx2hPwxjFoA/k0e7GAzF/9/j1g8gOJLfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MubKWWUG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MubKWWUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754805374; x=1786341374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20tRU2vqicliWfE563GjB71Exwx3aQZYcjkeQTn1aNk=;
  b=MubKWWUGhnK6YqKX5b3LAwq4i2TWVCBlPIbAUXgAIcbIyx6ualBH1Y9O
   RAPeFFqParmDmYeIWyhxFveRO3u0Sd+e38/SyQiVzp+SdLVDMNJu4var2
   sOxk1wq13Ns5b0C2vmRQNO7tUUrLyKaEujY7Ke18CfQ8XnaXuThhtQXXz
   xNRMJPR635SfqSJE3m1kdcEdKvDYDbj1kLOCaNzQ/fjxVS/Dq9YNSJ3e2
   35F4UUu9/1xra1rJ1YF4Up8xEw/QfBPW+xKcIYaiNEWAF/Jm8Q3JJp4kf
   BVpIYoII1knN33sRA3QotBHqQThqB1qn43zZJCMjeOhpukOW0ne8QyMMz
   Q==;
X-CSE-ConnectionGUID: X9Xms91zQh62dlVVUeEDVA==
X-CSE-MsgGUID: BfgpGYuqQiSpqqqIxpfwTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="68463699"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68463699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 22:56:13 -0700
X-CSE-ConnectionGUID: Bs5dDVA+T0miHwG8vSMzXw==
X-CSE-MsgGUID: dPMAQBjCRJOGgMcqGNLgdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196630441"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Aug 2025 22:56:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukz2P-0005B6-2Q;
	Sun, 10 Aug 2025 05:56:09 +0000
Date: Sun, 10 Aug 2025 13:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/5] mm/damon/sysfs: Implement a command to only commit
 scheme dests
Message-ID: <202508101330.XRQqvfiN-lkp@intel.com>
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
In-Reply-To: <20250805162022.4920-3-bijan311@gmail.com>
References: <20250805162022.4920-3-bijan311@gmail.com>
TO: Bijan Tabatabai <bijan311@gmail.com>
TO: damon@lists.linux.dev
TO: linux-mm@kvack.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: sj@kernel.org
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: corbet@lwn.net
CC: Bijan Tabatabai <bijantabatab@micron.com>

Hi Bijan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Bijan-Tabatabai/mm-damon-core-Add-damos_destroy_dests/20250806-120845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250805162022.4920-3-bijan311%40gmail.com
patch subject: [PATCH 2/5] mm/damon/sysfs: Implement a command to only commit scheme dests
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: microblaze-randconfig-r072-20250810 (https://download.01.org/0day-ci/archive/20250810/202508101330.XRQqvfiN-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508101330.XRQqvfiN-lkp@intel.com/

smatch warnings:
mm/damon/sysfs-schemes.c:2605 damos_sysfs_set_schemes_dests() warn: iterator 'i' not incremented

vim +/i +2605 mm/damon/sysfs-schemes.c

9106d467533db0 SeongJae Park   2025-07-08  2600  
8014d822c9939b Bijan Tabatabai 2025-08-05  2601  int damos_sysfs_set_schemes_dests(struct damon_sysfs_schemes *sysfs_schemes,
8014d822c9939b Bijan Tabatabai 2025-08-05  2602  		struct damon_ctx *ctx)
8014d822c9939b Bijan Tabatabai 2025-08-05  2603  {
8014d822c9939b Bijan Tabatabai 2025-08-05  2604  	struct damos *scheme;
8014d822c9939b Bijan Tabatabai 2025-08-05 @2605  	int i = 0;
8014d822c9939b Bijan Tabatabai 2025-08-05  2606  
8014d822c9939b Bijan Tabatabai 2025-08-05  2607  	damon_for_each_scheme(scheme, ctx) {
8014d822c9939b Bijan Tabatabai 2025-08-05  2608  		struct damos_sysfs_dests *sysfs_dests;
8014d822c9939b Bijan Tabatabai 2025-08-05  2609  		struct damos_migrate_dests dests = {};
8014d822c9939b Bijan Tabatabai 2025-08-05  2610  		int err;
8014d822c9939b Bijan Tabatabai 2025-08-05  2611  
8014d822c9939b Bijan Tabatabai 2025-08-05  2612  		/* user could have removed the scheme sysfs dir */
8014d822c9939b Bijan Tabatabai 2025-08-05  2613  		if (i >= sysfs_schemes->nr)
8014d822c9939b Bijan Tabatabai 2025-08-05  2614  			break;
8014d822c9939b Bijan Tabatabai 2025-08-05  2615  
8014d822c9939b Bijan Tabatabai 2025-08-05  2616  		sysfs_dests = sysfs_schemes->schemes_arr[i]->dests;
8014d822c9939b Bijan Tabatabai 2025-08-05  2617  		err = damos_sysfs_add_migrate_dest(&dests, sysfs_dests);
8014d822c9939b Bijan Tabatabai 2025-08-05  2618  		if (err) {
8014d822c9939b Bijan Tabatabai 2025-08-05  2619  			damos_destroy_dests(&dests);
8014d822c9939b Bijan Tabatabai 2025-08-05  2620  			return err;
8014d822c9939b Bijan Tabatabai 2025-08-05  2621  		}
8014d822c9939b Bijan Tabatabai 2025-08-05  2622  
8014d822c9939b Bijan Tabatabai 2025-08-05  2623  		damos_destroy_dests(&scheme->migrate_dests);
8014d822c9939b Bijan Tabatabai 2025-08-05  2624  		scheme->migrate_dests = dests;
8014d822c9939b Bijan Tabatabai 2025-08-05  2625  	}
8014d822c9939b Bijan Tabatabai 2025-08-05  2626  
8014d822c9939b Bijan Tabatabai 2025-08-05  2627  	return 0;
8014d822c9939b Bijan Tabatabai 2025-08-05  2628  }
8014d822c9939b Bijan Tabatabai 2025-08-05  2629  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
