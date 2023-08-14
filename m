Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BE4AD29
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Aug 2023 13:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692020256; x=1723556256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fkzWzgMfJpja5vmlL6EN7xfyES5X7yLSZ0I1hsLJm30=;
  b=FC1iKJIxzLYHGUhWvh1lQX83WmwQG37zS+intLLXqmuPs1NoL3Spu4Fg
   nx7zVPOYvAYHqSOcfyvIXMJTnCjMQ9hbm3z832OQ0+vFMfY/TAe3+3Vk5
   kIASLtjWt1HoQj+/t0gCSjWxk3Ga+wijBXVbmejKDnLD8watbUxBC49HM
   XoVC9H8hIMJkrUhFo25LdP2LdIbEGFpYbDFfO6GLt9a3oE4WEZSVz+/bS
   m3zxrqowNrLX5vQWegftGqbz9DmHd7XboT4+lqD9zhXo5tpvRptOHE1ES
   9uqDtZrrmZdp0wGRF/UVtf2et8JE8VbeA/tlV2qwRzVrK7uhy5zFOgONH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="370938117"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="370938117"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="736523390"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="736523390"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Aug 2023 06:37:34 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVXlF-0000AT-1m;
	Mon, 14 Aug 2023 13:37:33 +0000
Date: Mon, 14 Aug 2023 21:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:sb_write_barrier 37/42] fs/super.c:305
 activate_sb_write_barrier() warn: sleeping in atomic context
Message-ID: <202308142157.y3kYa99c-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux sb_write_barrier
head:   b5bfe55aabaea044bd55493315ec5393c11f6752
commit: 05ffbe6c7c25e28d44db0d6e90131d44a9a6c852 [37/42] fs: implement 'vfs write barriers'
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20230814/202308142157.y3kYa99c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142157.y3kYa99c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308142157.y3kYa99c-lkp@intel.com/

smatch warnings:
fs/super.c:305 activate_sb_write_barrier() warn: sleeping in atomic context

vim +305 fs/super.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  284  
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  285  /**
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  286   * activate_sb_write_barrier -	activate write barries on superblock
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  287   * @s: superblock to activate write barriers on
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  288   *
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  289   * sb_write_barrier() calls will have no effect before this is called.
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  290   * After this is called, sb_write_barrier() will wait for all the tasks
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  291   * that called __sb_start_write_srcu() after write barrier was activated.
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  292   * For now, there is no deactivate_sb_write_barrier().
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  293   */
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  294  int activate_sb_write_barrier(struct super_block *s)
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  295  {
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  296  	struct srcu_struct *write_srcu = sb_write_srcu(s);
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  297  
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  298  	/* Already activated? */
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  299  	if (sb_write_srcu(s))
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  300  		return 0;
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  301  
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  302  	spin_lock(&sb_lock);
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  303  	write_srcu = sb_write_srcu(s);
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  304  	if (!write_srcu) {
05ffbe6c7c25e2 Amir Goldstein 2022-11-20 @305  		write_srcu = kzalloc(sizeof(struct srcu_struct),  GFP_USER);
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  306  		if (write_srcu) {
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  307  			init_srcu_struct(write_srcu);
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  308  			/*
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  309  			 * cmpxchg() provides the barrier so that callers of
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  310  			 * sb_write_srcu() can see only initialized structure.
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  311  			 */
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  312  			if (cmpxchg(&s->s_write_srcu, NULL, write_srcu)) {
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  313  				WARN_ON_ONCE(1);
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  314  				cleanup_srcu_struct(write_srcu);
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  315  				kfree(write_srcu);
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  316  			}
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  317  		}
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  318  	}
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  319  	spin_unlock(&sb_lock);
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  320  
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  321  	return write_srcu ? 0 : -ENOMEM;
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  322  }
05ffbe6c7c25e2 Amir Goldstein 2022-11-20  323  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
