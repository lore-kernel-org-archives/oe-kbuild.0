Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A12F34
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 23:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674082941; x=1705618941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s0+tP52CUgKEWIJC8aFL3L5y7neg8ou1QbAOU7ME+nM=;
  b=kTIaAGfFGspCJzzjvV9SLalCuuxAK+uySoJCs8SW8LKa0DmtaDIARfHA
   RGXrP1MNUXF3+0dzcewAjYxJhivFtZSk28ZDwMbZc33Jj4ldLaS8MKOWJ
   bUdrtnCY+JVyqxUCj9F7SJKJYU1jxB0g3Ssl351LlyoQ8opxLF6MwIBx9
   TEbqQgE6btP8eWs4WtOJVvNOJYfqveRnIHmU+5zSPyn8DdXLg8S9vhwP1
   P8OJFx0MLq8IuD9DLZ+D1KNR/kE0Sygo0RlW5HeqD4DkqCxOivjT7btgN
   GQs2nqkeo0Xn4cA2W7xpuS0ufq79msDjOSr0RXl7zcNuaIQ9p3mpbSV58
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308687521"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308687521"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 15:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661913072"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661913072"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 15:02:18 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIHRi-0000nT-0v;
	Wed, 18 Jan 2023 23:02:18 +0000
Date: Thu, 19 Jan 2023 07:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 6/6] erofs: enable page cache sharing in fscache mode
Message-ID: <202301190654.hZ4dPPlb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230106125330.55529-7-jefflexu@linux.alibaba.com>
References: <20230106125330.55529-7-jefflexu@linux.alibaba.com>
TO: Jingbo Xu <jefflexu@linux.alibaba.com>

Hi Jingbo,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.2-rc4 next-20230118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingbo-Xu/erofs-remove-unused-device-mapping-in-the-meta-routine/20230106-205600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20230106125330.55529-7-jefflexu%40linux.alibaba.com
patch subject: [RFC PATCH 6/6] erofs: enable page cache sharing in fscache mode
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: i386-randconfig-a004-20220328 (https://download.01.org/0day-ci/archive/20230119/202301190654.hZ4dPPlb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5c565bd6afacc699309e9fc20119d91501a5d3ae
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jingbo-Xu/erofs-remove-unused-device-mapping-in-the-meta-routine/20230106-205600
        git checkout 5c565bd6afacc699309e9fc20119d91501a5d3ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ lib//

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/erofs/inode.c:244:13: warning: 'erofs_can_share_page_cache' defined but not used [-Wunused-function]
     244 | static bool erofs_can_share_page_cache(struct inode *inode)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/erofs_can_share_page_cache +244 fs/erofs/inode.c

431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  243  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06 @244  static bool erofs_can_share_page_cache(struct inode *inode)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  245  {
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  246  	struct erofs_inode *vi = EROFS_I(inode);
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  247  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  248  	/* enable page cache sharing only in share domain mode */
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  249  	if (!erofs_is_fscache_mode(inode->i_sb) ||
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  250  	    !EROFS_SB(inode->i_sb)->domain_id)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  251  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  252  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  253  	if (vi->datalayout != EROFS_INODE_CHUNK_BASED)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  254  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  255  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  256  	/* avoid crossing multi devicces/blobs */
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  257  	if (inode->i_size > 1UL << vi->chunkbits)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  258  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  259  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  260  	/* avoid data leakage in mmap routine */
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  261  	if (EROFS_BLKSIZ % PAGE_SIZE)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  262  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  263  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  264  	return true;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  265  }
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  266  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
