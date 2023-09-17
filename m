Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3300A3D
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 01:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694914542; x=1726450542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JD77dfXzszwiMJjYmzQxi5GHuCd6GywAMpq8TrC6O8U=;
  b=Z9FOj4XtFTbHLC1KWAm0YC8taRzVp7Z0hNS/hDTnp4Ty9ZawBteCh6Q3
   YefyxYCARe3hZOxlaFzLkkFiWMiS+y78rXSV5xG00i1K34eGdl7U/AgbQ
   hnH1lE5i5XMp7FEWceX3/oY/fAmFSIKA+gFBf5gAORC6f5V199jnouHjp
   9Jrc8uN/J1QggT4dvOo7v9qqa1oPuGS9dzchJ4z4nRY19cRrOZdcyOE4y
   In+hhsWbInSY0zsOelMJ837D5up5ljYmyUD6YJ+I2a6YDs7VsuHXpd21Y
   yDZKzKbTwMT5O7l/u1DgYH3Z2Vq9diw5eIkVFy5s4ZTenfzXAnGJR/zjT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="382198179"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="382198179"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 18:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="835638847"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="835638847"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2023 18:35:40 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhghG-0004q4-1V;
	Sun, 17 Sep 2023 01:35:38 +0000
Date: Sun, 17 Sep 2023 09:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4414/4552] mm/shrinker.c:100
 alloc_shrinker_info() warn: inconsistent returns '&shrinker_mutex'.
Message-ID: <202309170953.GA2Arnp4-lkp@intel.com>
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

Hi Qi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dfa449a58323de195773cf928d99db4130702bf7
commit: 9f8a23c37edc5a7c1e69abe2729e813cff242990 [4414/4552] mm: shrinker: convert shrinker_rwsem to mutex
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20230916 (https://download.01.org/0day-ci/archive/20230917/202309170953.GA2Arnp4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309170953.GA2Arnp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309170953.GA2Arnp4-lkp@intel.com/

smatch warnings:
mm/shrinker.c:100 alloc_shrinker_info() warn: inconsistent returns '&shrinker_mutex'.

vim +100 mm/shrinker.c

208d1e238b7746 Qi Zheng 2023-09-11   76  
208d1e238b7746 Qi Zheng 2023-09-11   77  int alloc_shrinker_info(struct mem_cgroup *memcg)
208d1e238b7746 Qi Zheng 2023-09-11   78  {
208d1e238b7746 Qi Zheng 2023-09-11   79  	struct shrinker_info *info;
4142a29db95101 Qi Zheng 2023-09-11   80  	int nid, ret = 0;
4142a29db95101 Qi Zheng 2023-09-11   81  	int array_size = 0;
208d1e238b7746 Qi Zheng 2023-09-11   82  
9f8a23c37edc5a Qi Zheng 2023-09-11   83  	mutex_lock(&shrinker_mutex);
4142a29db95101 Qi Zheng 2023-09-11   84  	array_size = shrinker_unit_size(shrinker_nr_max);
208d1e238b7746 Qi Zheng 2023-09-11   85  	for_each_node(nid) {
4142a29db95101 Qi Zheng 2023-09-11   86  		info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
4142a29db95101 Qi Zheng 2023-09-11   87  		if (!info)
4142a29db95101 Qi Zheng 2023-09-11   88  			goto err;
208d1e238b7746 Qi Zheng 2023-09-11   89  		info->map_nr_max = shrinker_nr_max;
4142a29db95101 Qi Zheng 2023-09-11   90  		if (shrinker_unit_alloc(info, NULL, nid))
4142a29db95101 Qi Zheng 2023-09-11   91  			goto err;
208d1e238b7746 Qi Zheng 2023-09-11   92  		rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
208d1e238b7746 Qi Zheng 2023-09-11   93  	}
9f8a23c37edc5a Qi Zheng 2023-09-11   94  	mutex_unlock(&shrinker_mutex);
208d1e238b7746 Qi Zheng 2023-09-11   95  
208d1e238b7746 Qi Zheng 2023-09-11   96  	return ret;
4142a29db95101 Qi Zheng 2023-09-11   97  
4142a29db95101 Qi Zheng 2023-09-11   98  err:
4142a29db95101 Qi Zheng 2023-09-11   99  	free_shrinker_info(memcg);
4142a29db95101 Qi Zheng 2023-09-11 @100  	return -ENOMEM;
208d1e238b7746 Qi Zheng 2023-09-11  101  }
208d1e238b7746 Qi Zheng 2023-09-11  102  

:::::: The code at line 100 was first introduced by commit
:::::: 4142a29db95101d66681cc7cdf856f8c8e4f2878 mm: shrinker: add a secondary array for shrinker_info::{map, nr_deferred}

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
