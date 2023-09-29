Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8941A5BB
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Sep 2023 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695994333; x=1727530333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L8LcNaQkB1PCWJPavKxVXMsCvEnXrOpNq+R02dmOghc=;
  b=G8iEoZTHRjFvFYAfLnZyhG+v8Tp/FqS1cMIOFeDa5hFVfKZ46lOvx5qJ
   Hcv0XYKetMSXECOwm1TPYOjbZQAeG5IqoOSR/gHxn7PFMgX0ozfg0RKCy
   zVCjqOQAr10+Se7QuubXYFIaUnrHpahHnzt8EWFxPP21Qlz2mU2+YGqZS
   47UY4hOjDzgZcqdGNDXYzLuNYYD9KJf2C/lc/mI126l+3IVvzF/rq9tgt
   woJZvwjx1xFQRaXL9wRUWHn1+vuZdRN2rSgfhxAVIOAF3eJTqtN21GN+3
   SuO/92Ae3iy3ediofAHB8LB6R1INDeehVzMM8dr8h9c/lz8mFwsbcJ4U0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="382204069"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="382204069"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 06:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="749954588"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="749954588"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Sep 2023 06:32:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmDbC-0002tX-0W;
	Fri, 29 Sep 2023 13:32:06 +0000
Date: Fri, 29 Sep 2023 21:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8008/8345] mm/shrinker.c:100:1-7: preceding lock
 on line 83
Message-ID: <202309292114.VMjkyBBq-lkp@intel.com>
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
TO: Qi Zheng <zhengqi.arch@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Muchun Song <songmuchun@bytedance.com>

Hi Qi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df964ce9ef9fea10cf131bf6bad8658fde7956f6
commit: 3b0ec351e30dfbe71675deb22da8a9fe1894c87f [8008/8345] mm: shrinker: convert shrinker_rwsem to mutex
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-103-20230927 (https://download.01.org/0day-ci/archive/20230929/202309292114.VMjkyBBq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309292114.VMjkyBBq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309292114.VMjkyBBq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/shrinker.c:100:1-7: preceding lock on line 83

vim +100 mm/shrinker.c

2babd0d6e9cfca Qi Zheng 2023-09-11   76  
2babd0d6e9cfca Qi Zheng 2023-09-11   77  int alloc_shrinker_info(struct mem_cgroup *memcg)
2babd0d6e9cfca Qi Zheng 2023-09-11   78  {
2babd0d6e9cfca Qi Zheng 2023-09-11   79  	struct shrinker_info *info;
b6884b5f15cf5a Qi Zheng 2023-09-11   80  	int nid, ret = 0;
b6884b5f15cf5a Qi Zheng 2023-09-11   81  	int array_size = 0;
2babd0d6e9cfca Qi Zheng 2023-09-11   82  
3b0ec351e30dfb Qi Zheng 2023-09-11  @83  	mutex_lock(&shrinker_mutex);
b6884b5f15cf5a Qi Zheng 2023-09-11   84  	array_size = shrinker_unit_size(shrinker_nr_max);
2babd0d6e9cfca Qi Zheng 2023-09-11   85  	for_each_node(nid) {
b6884b5f15cf5a Qi Zheng 2023-09-11   86  		info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
b6884b5f15cf5a Qi Zheng 2023-09-11   87  		if (!info)
b6884b5f15cf5a Qi Zheng 2023-09-11   88  			goto err;
2babd0d6e9cfca Qi Zheng 2023-09-11   89  		info->map_nr_max = shrinker_nr_max;
b6884b5f15cf5a Qi Zheng 2023-09-11   90  		if (shrinker_unit_alloc(info, NULL, nid))
b6884b5f15cf5a Qi Zheng 2023-09-11   91  			goto err;
2babd0d6e9cfca Qi Zheng 2023-09-11   92  		rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
2babd0d6e9cfca Qi Zheng 2023-09-11   93  	}
3b0ec351e30dfb Qi Zheng 2023-09-11   94  	mutex_unlock(&shrinker_mutex);
2babd0d6e9cfca Qi Zheng 2023-09-11   95  
2babd0d6e9cfca Qi Zheng 2023-09-11   96  	return ret;
b6884b5f15cf5a Qi Zheng 2023-09-11   97  
b6884b5f15cf5a Qi Zheng 2023-09-11   98  err:
b6884b5f15cf5a Qi Zheng 2023-09-11   99  	free_shrinker_info(memcg);
b6884b5f15cf5a Qi Zheng 2023-09-11 @100  	return -ENOMEM;
2babd0d6e9cfca Qi Zheng 2023-09-11  101  }
2babd0d6e9cfca Qi Zheng 2023-09-11  102  

:::::: The code at line 100 was first introduced by commit
:::::: b6884b5f15cf5acf6886ec0704d799035477ad7e mm: shrinker: add a secondary array for shrinker_info::{map, nr_deferred}

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
