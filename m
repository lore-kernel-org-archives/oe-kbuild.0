Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23617985
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZQiIMJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701629769; x=1733165769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mcdWJG2wjFRAc87wnMpzrPyYWfrcqjGZde41Ggplzms=;
  b=eZQiIMJs0H2kwh1oPeI0dInYUo7i6HFZ7IBaXMW4HXn7li5KUUi6TTrF
   VVuPuKozGaJJ7qs7GqLVxO0/L6NryKBXFiS3A8nFofLC07QKbA1wSWBpp
   pLV87ByyJntYqkQmZpXIpjvdkJUoLxOu05W2Ic4Eu5WuPjCa+7fd6loon
   YCUv/BUNhs8Faq3krhSt3Bgveuu6VQaV6h5N+/HxFBeVp5tFhLUlbYRXZ
   hj792zVbHEXoPGizLfMW6LxjKxoui9m+dkX7sAfjo1i3AZJXvF43U2HQO
   ApUV4zDMTxdLqvw2dUuDxfXWSSMWaFW95OSLLJsqIDTa17egeODCB/p5L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="6974214"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="6974214"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 10:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="720096964"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="720096964"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Dec 2023 10:56:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9rdJ-0006yY-1T;
	Sun, 03 Dec 2023 18:56:01 +0000
Date: Mon, 4 Dec 2023 02:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/4] mm: multi-gen LRU: MGLRU unbalance reclaim
Message-ID: <202312040256.guajrRNm-lkp@intel.com>
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
In-Reply-To: <20231108065818.19932-3-link@vivo.com>
References: <20231108065818.19932-3-link@vivo.com>
TO: Huan Yang <link@vivo.com>
TO: Tejun Heo <tj@kernel.org>
TO: Zefan Li <lizefan.x@bytedance.com>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Michal Hocko <mhocko@kernel.org>
TO: Roman Gushchin <roman.gushchin@linux.dev>
TO: Shakeel Butt <shakeelb@google.com>
TO: Muchun Song <muchun.song@linux.dev>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Hildenbrand <david@redhat.com>
TO: Matthew Wilcox <willy@infradead.org>
TO: Huang Ying <ying.huang@intel.com>
TO: Yosry Ahmed <yosryahmed@google.com>
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
TO: Peter Xu <peterx@redhat.com>
TO: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
TO: Liu Shixin <liushixin2@huawei.com>
TO: Yue Zhao <findns94@gmail.com>
TO: Hugh Dickins <hughd@google.com>
TO: cgroups@vger.kernel.org
TO: linux-doc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: opensource.kernel@vivo.com
CC: Huan Yang <link@vivo.com>

Hi Huan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on tj-cgroup/for-next linus/master v6.7-rc4 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/mm-vmscan-LRU-unbalance-cgroup-reclaim/20231108-151757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231108065818.19932-3-link%40vivo.com
patch subject: [PATCH 2/4] mm: multi-gen LRU: MGLRU unbalance reclaim
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20231108 (https://download.01.org/0day-ci/archive/20231204/202312040256.guajrRNm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312040256.guajrRNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312040256.guajrRNm-lkp@intel.com/

smatch warnings:
mm/vmscan.c:4518 isolate_folios() error: uninitialized symbol 'unbalance'.

vim +/unbalance +4518 mm/vmscan.c

ac35a490237446 Yu Zhao   2022-09-18  4480  
ac35a490237446 Yu Zhao   2022-09-18  4481  static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc, int swappiness,
ac35a490237446 Yu Zhao   2022-09-18  4482  			  int *type_scanned, struct list_head *list)
ac35a490237446 Yu Zhao   2022-09-18  4483  {
ac35a490237446 Yu Zhao   2022-09-18  4484  	int i;
ac35a490237446 Yu Zhao   2022-09-18  4485  	int type;
ac35a490237446 Yu Zhao   2022-09-18  4486  	int scanned;
ac35a490237446 Yu Zhao   2022-09-18  4487  	int tier = -1;
9da842af0b17c7 Huan Yang 2023-11-08  4488  	bool unbalance;
ac35a490237446 Yu Zhao   2022-09-18  4489  	DEFINE_MIN_SEQ(lruvec);
ac35a490237446 Yu Zhao   2022-09-18  4490  
ac35a490237446 Yu Zhao   2022-09-18  4491  	/*
ac35a490237446 Yu Zhao   2022-09-18  4492  	 * Try to make the obvious choice first. When anon and file are both
ac35a490237446 Yu Zhao   2022-09-18  4493  	 * available from the same generation, interpret swappiness 1 as file
ac35a490237446 Yu Zhao   2022-09-18  4494  	 * first and 200 as anon first.
ac35a490237446 Yu Zhao   2022-09-18  4495  	 */
9da842af0b17c7 Huan Yang 2023-11-08  4496  	if (unlikely(unbalance_file_reclaim(sc, swappiness))) {
9da842af0b17c7 Huan Yang 2023-11-08  4497  		unbalance = true;
9da842af0b17c7 Huan Yang 2023-11-08  4498  		type = LRU_GEN_FILE;
9da842af0b17c7 Huan Yang 2023-11-08  4499  	} else if (unlikely(unbalance_anon_reclaim(sc, swappiness))) {
9da842af0b17c7 Huan Yang 2023-11-08  4500  		unbalance = true;
9da842af0b17c7 Huan Yang 2023-11-08  4501  		type = LRU_GEN_ANON;
9da842af0b17c7 Huan Yang 2023-11-08  4502  	} else if (!swappiness)
ac35a490237446 Yu Zhao   2022-09-18  4503  		type = LRU_GEN_FILE;
ac35a490237446 Yu Zhao   2022-09-18  4504  	else if (min_seq[LRU_GEN_ANON] < min_seq[LRU_GEN_FILE])
ac35a490237446 Yu Zhao   2022-09-18  4505  		type = LRU_GEN_ANON;
ac35a490237446 Yu Zhao   2022-09-18  4506  	else if (swappiness == 1)
ac35a490237446 Yu Zhao   2022-09-18  4507  		type = LRU_GEN_FILE;
ac35a490237446 Yu Zhao   2022-09-18  4508  	else if (swappiness == 200)
ac35a490237446 Yu Zhao   2022-09-18  4509  		type = LRU_GEN_ANON;
ac35a490237446 Yu Zhao   2022-09-18  4510  	else
ac35a490237446 Yu Zhao   2022-09-18  4511  		type = get_type_to_scan(lruvec, swappiness, &tier);
ac35a490237446 Yu Zhao   2022-09-18  4512  
ac35a490237446 Yu Zhao   2022-09-18  4513  	for (i = !swappiness; i < ANON_AND_FILE; i++) {
ac35a490237446 Yu Zhao   2022-09-18  4514  		if (tier < 0)
ac35a490237446 Yu Zhao   2022-09-18  4515  			tier = get_tier_idx(lruvec, type);
ac35a490237446 Yu Zhao   2022-09-18  4516  
ac35a490237446 Yu Zhao   2022-09-18  4517  		scanned = scan_folios(lruvec, sc, type, tier, list);
9da842af0b17c7 Huan Yang 2023-11-08 @4518  		if (scanned || unbalance)
ac35a490237446 Yu Zhao   2022-09-18  4519  			break;
ac35a490237446 Yu Zhao   2022-09-18  4520  
ac35a490237446 Yu Zhao   2022-09-18  4521  		type = !type;
ac35a490237446 Yu Zhao   2022-09-18  4522  		tier = -1;
ac35a490237446 Yu Zhao   2022-09-18  4523  	}
ac35a490237446 Yu Zhao   2022-09-18  4524  
ac35a490237446 Yu Zhao   2022-09-18  4525  	*type_scanned = type;
ac35a490237446 Yu Zhao   2022-09-18  4526  
ac35a490237446 Yu Zhao   2022-09-18  4527  	return scanned;
ac35a490237446 Yu Zhao   2022-09-18  4528  }
ac35a490237446 Yu Zhao   2022-09-18  4529  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
