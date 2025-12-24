Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6CE42A96
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 01:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766540201; cv=none; b=gAefywZ4k4eibZ6hQdghq2X97xm7JcjRgkjgi5IRNyk0QhBx7i1XRC9qoD4NZikR2/kGzcz+fSd6Sn7p+bgo9lYDz5soqIrkSbDydr8PU8MC82rtfNOcjhfKnCE/oatJpOp/L7FBQBfYoskf9MJs19MnwWgmnxX3zSVH1amK3FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766540201; c=relaxed/simple;
	bh=t4V+D1Qwd0MI0Djp4pbsd7G2z4gU20TzssgTWQy3qIw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jl3g+ZrV5Gjy7YkaTpH3HmytygFxRalLwzM6BcDeoUhsaZS++B8Fya+KcwHLPBSLcnOyUmy9tCWcBukPWQ44CNjHbh5sv6hr037jS/rQfgVZ6E8Ikd4OHG7kl2qk5fZE547ht04xFAbvlvkM83C9yOnd1SGlB1pk3zw2gJ1w8l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6o/sOcW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6o/sOcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766540200; x=1798076200;
  h=date:from:to:cc:subject:message-id;
  bh=t4V+D1Qwd0MI0Djp4pbsd7G2z4gU20TzssgTWQy3qIw=;
  b=G6o/sOcWlVPgcwwiR5m4CmhS66Ye1MrqtYP0ARWxgiGd4Y3Yn6RWfglB
   vRLEBUk40PtR9ww29s1zJqOPCgHofdpDz0N1gu0ksE4WF/oaKW9kkSWul
   SMywEKLm5Hm/pXn9Ys16cp1KvfFgI/axSS8JpvmxdWXWCmR0fn6W3pWey
   TuHyCYZ3KKxhAWQJ8/GJEblvJYewAhecAhFXMgF+mozgF16n2mipp8fGF
   tbhwTPlX337kElXe6hkBXPWScrA1hCbpn7Y5B+wgl4akFrilAFZ5f/abV
   NCl9+zExeRZ8tl5N4BR/Cu1VgAuY1Zu2lEBwlZ8DfCzoaRJHANinlAPlj
   w==;
X-CSE-ConnectionGUID: cMqlpD9KSrisynZbZzo/Qg==
X-CSE-MsgGUID: Seo917vxRjuk8YieReg70Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68541038"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68541038"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 17:36:40 -0800
X-CSE-ConnectionGUID: ZVT1ht5QTPq2/yPQD0vFjA==
X-CSE-MsgGUID: 0K3GLTqFSSabrhPZ8m8Rjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="230945351"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Dec 2025 17:36:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYDno-000000002YD-04XA;
	Wed, 24 Dec 2025 01:36:36 +0000
Date: Wed, 24 Dec 2025 09:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/fnic/fdls_disc.c:166
 fdls_reclaim_oxid_handler() error: uninitialized symbol 'cur_jiffies'.
Message-ID: <202512240913.qm8QK072-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Karan Tilak Kumar <kartilak@cisco.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Sesidhar Baddela <sebaddel@cisco.com>
CC: Gian Carlo Boffa <gcboffa@cisco.com>
CC: Arulprabhu Ponnusamy <arulponn@cisco.com>
CC: Arun Easi <aeasi@cisco.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: a63e78eb2b0f654b138abfc323f6bd7573e26145 scsi: fnic: Add support for fabric based solicited requests and responses
date:   12 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-141-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240913.qm8QK072-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512240913.qm8QK072-lkp@intel.com/

New smatch warnings:
drivers/scsi/fnic/fdls_disc.c:166 fdls_reclaim_oxid_handler() error: uninitialized symbol 'cur_jiffies'.

Old smatch warnings:
drivers/scsi/fnic/fdls_disc.c:263 fdls_schedule_oxid_free_retry_work() warn: inconsistent indenting
drivers/scsi/fnic/fdls_disc.c:989 fdls_send_fabric_logo() warn: inconsistent indenting
drivers/scsi/fnic/fdls_disc.c:1953 fnic_fdls_validate_and_get_frame_type() warn: inconsistent indenting

vim +/cur_jiffies +166 drivers/scsi/fnic/fdls_disc.c

a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  119  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  120  /**
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  121   * fdls_reclaim_oxid_handler - Callback handler for delayed_oxid_work
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  122   * @work: Handle to work_struct
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  123   *
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  124   * Scheduled when an oxid is to be freed later
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  125   * After freeing expired oxid(s), the handler schedules
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  126   * another callback with the remaining time
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  127   * of next unexpired entry in the reclaim list.
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  128   */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  129  void fdls_reclaim_oxid_handler(struct work_struct *work)
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  130  {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  131  	struct fnic_oxid_pool_s *oxid_pool = container_of(work,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  132  		struct fnic_oxid_pool_s, oxid_reclaim_work.work);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  133  	struct fnic_iport_s *iport = container_of(oxid_pool,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  134  		struct fnic_iport_s, oxid_pool);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  135  	struct fnic *fnic = iport->fnic;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  136  	struct reclaim_entry_s *reclaim_entry, *next;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  137  	unsigned long delay_j, cur_jiffies;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  138  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  139  	FNIC_FCS_DBG(KERN_INFO, fnic->lport->host, fnic->fnic_num,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  140  		"Reclaim oxid callback\n");
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  141  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  142  	spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  143  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  144  	/* Though the work was scheduled for one entry,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  145  	 * walk through and free the expired entries which might have been scheduled
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  146  	 * at around the same time as the first entry
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  147  	 */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  148  	list_for_each_entry_safe(reclaim_entry, next,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  149  		&(oxid_pool->oxid_reclaim_list), links) {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  150  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  151  		/* The list is always maintained in the order of expiry time */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  152  		cur_jiffies = jiffies;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  153  		if (time_before(cur_jiffies, reclaim_entry->expires))
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  154  			break;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  155  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  156  		list_del(&reclaim_entry->links);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  157  		fdls_free_oxid_idx(iport, reclaim_entry->oxid_idx);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  158  		kfree(reclaim_entry);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  159  	}
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  160  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  161  	/* schedule to free up the next entry */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  162  	if (!list_empty(&oxid_pool->oxid_reclaim_list)) {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  163  		reclaim_entry = list_first_entry(&oxid_pool->oxid_reclaim_list,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  164  			struct reclaim_entry_s, links);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  165  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11 @166  		delay_j = reclaim_entry->expires - cur_jiffies;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  167  		schedule_delayed_work(&oxid_pool->oxid_reclaim_work, delay_j);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  168  		FNIC_FCS_DBG(KERN_INFO, fnic->lport->host, fnic->fnic_num,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  169  			"Scheduling next callback at:%ld jiffies\n", delay_j);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  170  	}
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  171  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  172  	spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  173  }
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  174  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
