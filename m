Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6194A32
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Dec 2023 05:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBOWBKQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702013960; x=1733549960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W0jcGvDh9GONldLajkA88elFS0H85S4nQEz6ERFR2Q0=;
  b=DBOWBKQUe1K2AsVMiey/Ncxgg/D+G1X3z98CDWs08XIBEwYuH2MlPybQ
   LGWCGo0WoI0JiyEgPu1q3JDX8VARFQXWYvb+PBgC/z5qYYMF08lzu3lcY
   YKGzLFUrBip7BpZjyRu/7xywx5rxHaHqJl/RZkkj/WFHUgfocVvjyqhBv
   i893bwLGbNH9n6ZDIZZNvWrNPFpQ5SZHUVaxarBjJ3sLeh6yLjX6+SfUQ
   1pZkpYzXVrvSUvTf7bdGqBK2dFc8qKqnWZ3MeYTA8PVdjxxcxnWb+yo2a
   x/5HQbvRYntUAg9Y1ZmkWZkIXISZYPb414lrPkan60uQcd3TOxr3MyAT5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="13059341"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="13059341"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 21:39:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765372679"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="765372679"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 07 Dec 2023 21:39:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBTZz-000DKR-2O;
	Fri, 08 Dec 2023 05:39:15 +0000
Date: Fri, 8 Dec 2023 13:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 105/205] fs/xfs/xfs_buf.c:2066:11-12:
 WARNING kmalloc is used to allocate this memory at line 2029
Message-ID: <202312081359.DPZHhJ05-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

Hi Darrick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   ae5732f1c245c24e63c885992c35f723f36f79ff
commit: 20739d9063f5efc04853e453a68816a0e1cad461 [105/205] xfs: make GFP_ usage consistent when allocating buftargs
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-102-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081359.DPZHhJ05-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312081359.DPZHhJ05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312081359.DPZHhJ05-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_buf.c:2066:11-12: WARNING kmalloc is used to allocate this memory at line 2029

vim +2066 fs/xfs/xfs_buf.c

^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds  2005-04-16  2021  
3e4ce1b43d1268 fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-06  2022  static struct xfs_buftarg *
3e4ce1b43d1268 fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-06  2023  xfs_alloc_buftarg_common(
ebad861b5702c3 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner    2010-09-22  2024  	struct xfs_mount	*mp,
3e4ce1b43d1268 fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-06  2025  	const char		*descr)
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds  2005-04-16  2026  {
3e4ce1b43d1268 fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-06  2027  	struct xfs_buftarg	*btp;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds  2005-04-16  2028  
20739d9063f5ef fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-10 @2029  	btp = kzalloc(sizeof(*btp), GFP_NOFS);
3e4ce1b43d1268 fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-06  2030  	if (!btp)
3e4ce1b43d1268 fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-06  2031  		return NULL;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds  2005-04-16  2032  
ebad861b5702c3 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner    2010-09-22  2033  	btp->bt_mount = mp;
0e6e847ffe3743 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner    2011-03-26  2034  
f9bccfcc3b59b9 fs/xfs/xfs_buf.c           Brian Foster    2020-05-06  2035  	/*
f9bccfcc3b59b9 fs/xfs/xfs_buf.c           Brian Foster    2020-05-06  2036  	 * Buffer IO error rate limiting. Limit it to no more than 10 messages
f9bccfcc3b59b9 fs/xfs/xfs_buf.c           Brian Foster    2020-05-06  2037  	 * per 30 seconds so as to not spam logs too much on repeated errors.
f9bccfcc3b59b9 fs/xfs/xfs_buf.c           Brian Foster    2020-05-06  2038  	 */
f9bccfcc3b59b9 fs/xfs/xfs_buf.c           Brian Foster    2020-05-06  2039  	ratelimit_state_init(&btp->bt_ioerror_rl, 30 * HZ,
f9bccfcc3b59b9 fs/xfs/xfs_buf.c           Brian Foster    2020-05-06  2040  			     DEFAULT_RATELIMIT_BURST);
f9bccfcc3b59b9 fs/xfs/xfs_buf.c           Brian Foster    2020-05-06  2041  
5ca302c8e502ca fs/xfs/xfs_buf.c           Glauber Costa   2013-08-28  2042  	if (list_lru_init(&btp->bt_lru))
d210a9874b8f61 fs/xfs/xfs_buf.c           Michal Hocko    2017-11-23  2043  		goto error_free;
5ca302c8e502ca fs/xfs/xfs_buf.c           Glauber Costa   2013-08-28  2044  
20739d9063f5ef fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-10  2045  	if (percpu_counter_init(&btp->bt_io_count, 0, GFP_NOFS))
d210a9874b8f61 fs/xfs/xfs_buf.c           Michal Hocko    2017-11-23  2046  		goto error_lru;
9c7504aa72b6e2 fs/xfs/xfs_buf.c           Brian Foster    2016-07-20  2047  
3e4ce1b43d1268 fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-06  2048  	btp->bt_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "xfs-%s:%s",
3e4ce1b43d1268 fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-06  2049  			descr, mp->m_super->s_id);
17e7a00e60c8ff fs/xfs/xfs_buf.c           Qi Zheng        2023-09-11  2050  	if (!btp->bt_shrinker)
d210a9874b8f61 fs/xfs/xfs_buf.c           Michal Hocko    2017-11-23  2051  		goto error_pcpu;
17e7a00e60c8ff fs/xfs/xfs_buf.c           Qi Zheng        2023-09-11  2052  
17e7a00e60c8ff fs/xfs/xfs_buf.c           Qi Zheng        2023-09-11  2053  	btp->bt_shrinker->count_objects = xfs_buftarg_shrink_count;
17e7a00e60c8ff fs/xfs/xfs_buf.c           Qi Zheng        2023-09-11  2054  	btp->bt_shrinker->scan_objects = xfs_buftarg_shrink_scan;
17e7a00e60c8ff fs/xfs/xfs_buf.c           Qi Zheng        2023-09-11  2055  	btp->bt_shrinker->private_data = btp;
17e7a00e60c8ff fs/xfs/xfs_buf.c           Qi Zheng        2023-09-11  2056  
17e7a00e60c8ff fs/xfs/xfs_buf.c           Qi Zheng        2023-09-11  2057  	shrinker_register(btp->bt_shrinker);
17e7a00e60c8ff fs/xfs/xfs_buf.c           Qi Zheng        2023-09-11  2058  
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds  2005-04-16  2059  	return btp;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds  2005-04-16  2060  
d210a9874b8f61 fs/xfs/xfs_buf.c           Michal Hocko    2017-11-23  2061  error_pcpu:
d210a9874b8f61 fs/xfs/xfs_buf.c           Michal Hocko    2017-11-23  2062  	percpu_counter_destroy(&btp->bt_io_count);
d210a9874b8f61 fs/xfs/xfs_buf.c           Michal Hocko    2017-11-23  2063  error_lru:
d210a9874b8f61 fs/xfs/xfs_buf.c           Michal Hocko    2017-11-23  2064  	list_lru_destroy(&btp->bt_lru);
d210a9874b8f61 fs/xfs/xfs_buf.c           Michal Hocko    2017-11-23  2065  error_free:
20739d9063f5ef fs/xfs/xfs_buf.c           Darrick J. Wong 2023-03-10 @2066  	kvfree(btp);
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds  2005-04-16  2067  	return NULL;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds  2005-04-16  2068  }
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds  2005-04-16  2069  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
