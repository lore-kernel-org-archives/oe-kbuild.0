Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF2112B70
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 11:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpujeFKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699702032; x=1731238032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RzlvIZRq/DLYmvHtkEL7NUeO2MfC1uyMqOFeKfd6n/A=;
  b=SpujeFKp8JroHErwmKanMUl4I5IMZrpnDcQrj11M/iphtOIeS9rA0w3E
   acaCXIe1TF0DO/gWToUBrAC3OVrnUBtlhgQ/PTv5lc+kA/MEpBPiHX0/6
   wpdTNQ1GyJ7fqAnurnXyyDYhrf4AMnCE+auKUn8KOVv6utz2wMhGCDWAM
   +NGqr9Qy507rl69b4+CJPRbWEUp07nEqiPBoMlY71eFW1CAyND+DyEhnN
   LAwjjunFmL0JQ51f4l9n5mRVYd641pNu3NtPSrjTlbMRrj2M52ixxLy8u
   WA1YwbyJGBc3Nw8DGuy9rqUFzp/FA2Tm6P0UfZPXSMClqViFiRYHI5YW6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394173713"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="394173713"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 03:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937361385"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="937361385"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Nov 2023 03:27:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1m8p-000AOw-1h;
	Sat, 11 Nov 2023 11:27:07 +0000
Date: Sat, 11 Nov 2023 19:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:sb_write_barrier 22/27] fs/super.c:432
 activate_sb_write_barrier() warn: sleeping in atomic context
Message-ID: <202311111958.Lz6WWFnX-lkp@intel.com>
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
head:   cd86c0c62d0c78b5d3d58e234474d52c3d264ec0
commit: 42ddf79eeaed36d5d2cdcc608e1056b2fc28faf6 [22/27] fs: implement 'vfs write barriers'
:::::: branch date: 3 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311111958.Lz6WWFnX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311111958.Lz6WWFnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311111958.Lz6WWFnX-lkp@intel.com/

smatch warnings:
fs/super.c:432 activate_sb_write_barrier() warn: sleeping in atomic context

vim +432 fs/super.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  411  
42ddf79eeaed36d Amir Goldstein 2022-11-20  412  /**
42ddf79eeaed36d Amir Goldstein 2022-11-20  413   * activate_sb_write_barrier -	activate write barries on superblock
42ddf79eeaed36d Amir Goldstein 2022-11-20  414   * @s: superblock to activate write barriers on
42ddf79eeaed36d Amir Goldstein 2022-11-20  415   *
42ddf79eeaed36d Amir Goldstein 2022-11-20  416   * sb_write_barrier() calls will have no effect before this is called.
42ddf79eeaed36d Amir Goldstein 2022-11-20  417   * After this is called, sb_write_barrier() will wait for all the tasks
42ddf79eeaed36d Amir Goldstein 2022-11-20  418   * that called __sb_start_write_srcu() after write barrier was activated.
42ddf79eeaed36d Amir Goldstein 2022-11-20  419   * For now, there is no deactivate_sb_write_barrier().
42ddf79eeaed36d Amir Goldstein 2022-11-20  420   */
42ddf79eeaed36d Amir Goldstein 2022-11-20  421  int activate_sb_write_barrier(struct super_block *s)
42ddf79eeaed36d Amir Goldstein 2022-11-20  422  {
42ddf79eeaed36d Amir Goldstein 2022-11-20  423  	struct srcu_struct *write_srcu = sb_write_srcu(s);
42ddf79eeaed36d Amir Goldstein 2022-11-20  424  
42ddf79eeaed36d Amir Goldstein 2022-11-20  425  	/* Already activated? */
42ddf79eeaed36d Amir Goldstein 2022-11-20  426  	if (sb_write_srcu(s))
42ddf79eeaed36d Amir Goldstein 2022-11-20  427  		return 0;
42ddf79eeaed36d Amir Goldstein 2022-11-20  428  
42ddf79eeaed36d Amir Goldstein 2022-11-20  429  	spin_lock(&sb_lock);
42ddf79eeaed36d Amir Goldstein 2022-11-20  430  	write_srcu = sb_write_srcu(s);
42ddf79eeaed36d Amir Goldstein 2022-11-20  431  	if (!write_srcu) {
42ddf79eeaed36d Amir Goldstein 2022-11-20 @432  		write_srcu = kzalloc(sizeof(struct srcu_struct),  GFP_USER);
42ddf79eeaed36d Amir Goldstein 2022-11-20  433  		if (write_srcu) {
42ddf79eeaed36d Amir Goldstein 2022-11-20  434  			init_srcu_struct(write_srcu);
42ddf79eeaed36d Amir Goldstein 2022-11-20  435  			/*
42ddf79eeaed36d Amir Goldstein 2022-11-20  436  			 * cmpxchg() provides the barrier so that callers of
42ddf79eeaed36d Amir Goldstein 2022-11-20  437  			 * sb_write_srcu() can see only initialized structure.
42ddf79eeaed36d Amir Goldstein 2022-11-20  438  			 */
42ddf79eeaed36d Amir Goldstein 2022-11-20  439  			if (cmpxchg(&s->s_write_srcu, NULL, write_srcu)) {
42ddf79eeaed36d Amir Goldstein 2022-11-20  440  				WARN_ON_ONCE(1);
42ddf79eeaed36d Amir Goldstein 2022-11-20  441  				cleanup_srcu_struct(write_srcu);
42ddf79eeaed36d Amir Goldstein 2022-11-20  442  				kfree(write_srcu);
42ddf79eeaed36d Amir Goldstein 2022-11-20  443  			}
42ddf79eeaed36d Amir Goldstein 2022-11-20  444  		}
42ddf79eeaed36d Amir Goldstein 2022-11-20  445  	}
42ddf79eeaed36d Amir Goldstein 2022-11-20  446  	spin_unlock(&sb_lock);
42ddf79eeaed36d Amir Goldstein 2022-11-20  447  
42ddf79eeaed36d Amir Goldstein 2022-11-20  448  	return write_srcu ? 0 : -ENOMEM;
42ddf79eeaed36d Amir Goldstein 2022-11-20  449  }
42ddf79eeaed36d Amir Goldstein 2022-11-20  450  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
