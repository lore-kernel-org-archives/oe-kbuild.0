Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C01FB4
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Jan 2023 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674648779; x=1706184779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3TQBR8jVm1kK5OtWlD0Ec0zCex30xHR1qKgmC5R8AjM=;
  b=gr/ahef/g0AUNGAHJzzraCO2TALfwXaxkdGxp/4+8VnsJjOmFVZn5xX6
   YczHfTkKOKw1vNZVhBk2pFeLqtkCIis2Q3GCyEUdp96M8N5CZfXDY6uYJ
   TO3KSwIdmo4AEEMBSRWeK4EuD4yXFwUkegVuXui7nVWebmzI7hlrBbJ4l
   QN/Y+WpR/n303dDm3vOfyGbWqeZd0GWHDGapBurz0oeJlocbLRAG9gZbn
   bEmAa9U4bJp4oW3qTq4ta9NhGF5Eg/VTU5UWxy5OSZ9pVn2mOcqrHgcpZ
   WnUHsV13QldHsTYGPsCgqJWVY8s4hgILEIYEa+vah4e3ljc3M2hNZ7FF/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="314444065"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="314444065"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 04:12:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991246697"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="991246697"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2023 04:12:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKee8-0007HY-39;
	Wed, 25 Jan 2023 12:12:56 +0000
Date: Wed, 25 Jan 2023 20:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 415/450] mm/damon/vaddr-test.h:29 __link_vmas()
 warn: sleeping in atomic context
Message-ID: <202301252036.TH20hzb5-lkp@intel.com>
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
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   fae3ac15a11571e4975f0ad7fd8d1c18dd02de1f
commit: e10f9e4f684eeabb68f1b52a7224a0efbb126cc7 [415/450] mm/damon/vaddr-test.h: stop using vma_mas_store() for maple tree store
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m041-20230123 (https://download.01.org/0day-ci/archive/20230125/202301252036.TH20hzb5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
mm/damon/vaddr-test.h:29 __link_vmas() warn: sleeping in atomic context

vim +29 mm/damon/vaddr-test.h

17ccae8bb5c928 SeongJae Park   2021-09-07  16  
e10f9e4f684eea Liam R. Howlett 2023-01-20  17  static int __link_vmas(struct maple_tree *mt, struct vm_area_struct *vmas,
d0cf3dd47f0d5d Liam R. Howlett 2022-09-06  18  			ssize_t nr_vmas)
17ccae8bb5c928 SeongJae Park   2021-09-07  19  {
e10f9e4f684eea Liam R. Howlett 2023-01-20  20  	int i, ret = -ENOMEM;
d0cf3dd47f0d5d Liam R. Howlett 2022-09-06  21  	MA_STATE(mas, mt, 0, 0);
17ccae8bb5c928 SeongJae Park   2021-09-07  22  
17ccae8bb5c928 SeongJae Park   2021-09-07  23  	if (!nr_vmas)
e10f9e4f684eea Liam R. Howlett 2023-01-20  24  		return 0;
17ccae8bb5c928 SeongJae Park   2021-09-07  25  
d0cf3dd47f0d5d Liam R. Howlett 2022-09-06  26  	mas_lock(&mas);
e10f9e4f684eea Liam R. Howlett 2023-01-20  27  	for (i = 0; i < nr_vmas; i++) {
e10f9e4f684eea Liam R. Howlett 2023-01-20  28  		mas_set_range(&mas, vmas[i].vm_start, vmas[i].vm_end - 1);
e10f9e4f684eea Liam R. Howlett 2023-01-20 @29  		if (mas_store_gfp(&mas, &vmas[i], GFP_KERNEL))
e10f9e4f684eea Liam R. Howlett 2023-01-20  30  			goto failed;
e10f9e4f684eea Liam R. Howlett 2023-01-20  31  	}
e10f9e4f684eea Liam R. Howlett 2023-01-20  32  
e10f9e4f684eea Liam R. Howlett 2023-01-20  33  	ret = 0;
e10f9e4f684eea Liam R. Howlett 2023-01-20  34  failed:
d0cf3dd47f0d5d Liam R. Howlett 2022-09-06  35  	mas_unlock(&mas);
e10f9e4f684eea Liam R. Howlett 2023-01-20  36  	return ret;
17ccae8bb5c928 SeongJae Park   2021-09-07  37  }
17ccae8bb5c928 SeongJae Park   2021-09-07  38  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
