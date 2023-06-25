Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B64F1FCB
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jun 2023 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687705666; x=1719241666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qu04SRUxNcJqiFnp25aF/ydrpJPLlGQpBcvYUO+TtW0=;
  b=SF111+VxeQs5Y0dnsroXXvBUmSAl7IPhVDHPg2bjNyFKnSTPS1eGCvOc
   PNTc/tEry836TnRIO1foRzFx3vinZqfxazrNiuFDB/VG5zi2QRpyEgTNx
   mBcz6Dz7qWQ5R66sHNbFFJkrgPzXTst2xOdPXkr7unI2Rf8Cate1hdNoo
   mw+o9JP1GKjqLaw6+0VW6YKiqP2qXwxFpeF3de1D7s9f8ImCZGI8tNw+o
   KA0yaNzwGDQuXfFAw229icWlBgDQpyRGxxl2vCVHTN58AL2KLvQ0wzJMi
   78BKOCpaQKVvt9GJrCjem10QjXLxuZrW1jxrjHg6IbwiPZKpcmgPLceP0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="391253422"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="391253422"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 08:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="1046211365"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="1046211365"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jun 2023 08:07:43 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDRL5-000A5t-0Q;
	Sun, 25 Jun 2023 15:07:43 +0000
Date: Sun, 25 Jun 2023 23:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 9366/12162] fs/gfs2/super.c:762:0-1: preceding
 lock on line 738
Message-ID: <202306252241.Lahe2YsR-lkp@intel.com>
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
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d2be868b42c08290509c60515865f4de24ea704
commit: 4ad135d5be933a17cd07d09a77470ca169baf869 [9366/12162] gfs2: Rework freeze / thaw logic
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: s390-randconfig-r054-20230625 (https://download.01.org/0day-ci/archive/20230625/202306252241.Lahe2YsR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306252241.Lahe2YsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306252241.Lahe2YsR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/gfs2/super.c:762:0-1: preceding lock on line 738

vim +762 fs/gfs2/super.c

4ad135d5be933a Andreas Gruenbacher 2022-11-14  731  
4ad135d5be933a Andreas Gruenbacher 2022-11-14  732  void gfs2_freeze_func(struct work_struct *work)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  733  {
4ad135d5be933a Andreas Gruenbacher 2022-11-14  734  	struct gfs2_sbd *sdp = container_of(work, struct gfs2_sbd, sd_freeze_work);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  735  	struct super_block *sb = sdp->sd_vfs;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  736  	int error;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  737  
4ad135d5be933a Andreas Gruenbacher 2022-11-14 @738  	mutex_lock(&sdp->sd_freeze_mutex);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  739  	error = -EBUSY;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  740  	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  741  		goto out_unlock;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  742  
4ad135d5be933a Andreas Gruenbacher 2022-11-14  743  	error = gfs2_freeze_locally(sdp);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  744  	if (error)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  745  		goto out_unlock;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  746  
4ad135d5be933a Andreas Gruenbacher 2022-11-14  747  	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  748  	atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  749  
4ad135d5be933a Andreas Gruenbacher 2022-11-14  750  	error = gfs2_do_thaw(sdp);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  751  	if (error)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  752  		goto out;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  753  
4ad135d5be933a Andreas Gruenbacher 2022-11-14  754  	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  755  
4ad135d5be933a Andreas Gruenbacher 2022-11-14  756  out_unlock:
4ad135d5be933a Andreas Gruenbacher 2022-11-14  757  	mutex_unlock(&sdp->sd_freeze_mutex);
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  758  	deactivate_super(sb);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  759  out:
4ad135d5be933a Andreas Gruenbacher 2022-11-14  760  	if (error)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  761  		fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n", error);
2e60d7683c8d2e Benjamin Marzinski  2014-11-13 @762  }
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  763  

:::::: The code at line 762 was first introduced by commit
:::::: 2e60d7683c8d2ea21317f6d9f4cd3bf5428ce162 GFS2: update freeze code to use freeze/thaw_super on all nodes

:::::: TO: Benjamin Marzinski <bmarzins@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
