Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298A81714D0
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739516254; cv=none; b=Ty7bVx4u1agY37FgaxEE0VrhuP/Bqeayfg3tqswW6wdal5XifpNjvOj0TvXMToHJvVWILmwcKoX9sDUQWg86NAFSMuLjawYGFwVgCFdSeunzT/HDzB6vYfK8d/t4kmMdnmxXXY60YaXovIeVrLi0ljchs44L91D2uwAP8cEftJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739516254; c=relaxed/simple;
	bh=BUv7EEPQlAXl5xErdg8mFJmxZvAAJzcbGaNI9FFbQBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLtIt08oeewAYN58xsPP7rTmeURihBUEyt5BkJwCTmVcN1SqdB8Qa6fQWn5piQT/MEwYflZnOQUDpSLkVNrrW+0wKtNOa3cQl654ASnzy5AffsQABdq9UGo3/abr77COzY6LCWBbbfElCHOI99ZPYODjzU/YE22kd1lA1y5Dv+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmeE24G1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmeE24G1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739516253; x=1771052253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BUv7EEPQlAXl5xErdg8mFJmxZvAAJzcbGaNI9FFbQBQ=;
  b=mmeE24G1BSKrUHe+axPuyg0e530DAXsmlcmGtJ9dDPzYGqxjgMq0qTPf
   Rm+J8MBQ8pNmzBz0yfS5hsq7MkthhmY8w6k9D3DLJu/pjCjT8cNT3VxT3
   ByzNe2QYnUMyWNq1DDPmn5TJNdoUiNHityXuaM+UbP/fjC/G0EABtBL9l
   XPjfUkvD2vmgWSYSR00tJxB8MI6NAR/GLZhTjH8wk/EgBgXXDorYMNXyD
   PoQomo0hBC8nwB1hdtHcDqRf73FOnbi40mGldweYgqxrLsu1Nu8H3YR83
   ZTEPj/gT+KCWISRhh0SJdMX+ebJUGXofbLOl/R1USdldPHmXTWgLjcg/i
   A==;
X-CSE-ConnectionGUID: Tmue0ySeS2eslt4Mj+XXEg==
X-CSE-MsgGUID: IIcFwCNAT92NjX/117jV6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43908608"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="43908608"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 22:57:32 -0800
X-CSE-ConnectionGUID: rxEtKY69ToKhDPE9EJn5gw==
X-CSE-MsgGUID: H1+L8aobTCiyOb0k4yUJ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="113363734"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 22:57:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tipdf-0019BB-2Z;
	Fri, 14 Feb 2025 06:57:27 +0000
Date: Fri, 14 Feb 2025 14:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/fnic/fdls_disc.c:166 fdls_reclaim_oxid_handler() error:
 uninitialized symbol 'cur_jiffies'.
Message-ID: <202502141403.1PcpwyJp-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Karan Tilak Kumar <kartilak@cisco.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Sesidhar Baddela <sebaddel@cisco.com>
CC: Gian Carlo Boffa <gcboffa@cisco.com>
CC: Arulprabhu Ponnusamy <arulponn@cisco.com>
CC: Arun Easi <aeasi@cisco.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   128c8f96eb8638c060cd3532dc394d046ce64fe1
commit: a63e78eb2b0f654b138abfc323f6bd7573e26145 scsi: fnic: Add support for fabric based solicited requests and responses
date:   6 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-141-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141403.1PcpwyJp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502141403.1PcpwyJp-lkp@intel.com/

smatch warnings:
drivers/scsi/fnic/fdls_disc.c:166 fdls_reclaim_oxid_handler() error: uninitialized symbol 'cur_jiffies'.
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
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  175  /**
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  176   * fdls_free_oxid - Helper function to free the oxid
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  177   * @iport: Handle to iport instance
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  178   * @oxid: oxid to free
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  179   * @active_oxid: the oxid which is in use
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  180   *
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  181   * Called with fnic lock held
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  182   */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  183  void fdls_free_oxid(struct fnic_iport_s *iport,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  184  		uint16_t oxid, uint16_t *active_oxid)
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  185  {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  186  	fdls_free_oxid_idx(iport, FNIC_OXID_IDX(oxid));
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  187  	*active_oxid = FNIC_UNASSIGNED_OXID;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  188  }
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  189  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  190  /**
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  191   * fdls_schedule_oxid_free - Schedule oxid to be freed later
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  192   * @iport: Handle to iport instance
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  193   * @active_oxid: the oxid which is in use
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  194   *
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  195   * Gets called in a rare case scenario when both a command
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  196   * (fdls or target discovery) timed out and the following ABTS
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  197   * timed out as well, without a link change.
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  198   *
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  199   * Called with fnic lock held
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  200   */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  201  void fdls_schedule_oxid_free(struct fnic_iport_s *iport, uint16_t *active_oxid)
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  202  {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  203  	struct fnic *fnic = iport->fnic;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  204  	struct fnic_oxid_pool_s *oxid_pool = &iport->oxid_pool;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  205  	struct reclaim_entry_s *reclaim_entry;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  206  	unsigned long delay_j = msecs_to_jiffies(OXID_RECLAIM_TOV(iport));
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  207  	int oxid_idx = FNIC_OXID_IDX(*active_oxid);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  208  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  209  	lockdep_assert_held(&fnic->fnic_lock);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  210  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  211  	FNIC_FCS_DBG(KERN_INFO, fnic->lport->host, fnic->fnic_num,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  212  		"Schedule oxid free. oxid: 0x%x\n", *active_oxid);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  213  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  214  	*active_oxid = FNIC_UNASSIGNED_OXID;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  215  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  216  	reclaim_entry = (struct reclaim_entry_s *)
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  217  		kzalloc(sizeof(struct reclaim_entry_s), GFP_ATOMIC);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  218  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  219  	if (!reclaim_entry) {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  220  		FNIC_FCS_DBG(KERN_WARNING, fnic->lport->host, fnic->fnic_num,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  221  			"Failed to allocate memory for reclaim struct for oxid idx: %d\n",
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  222  			oxid_idx);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  223  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  224  		/* Retry the scheduling  */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  225  		WARN_ON(test_and_set_bit(oxid_idx, oxid_pool->pending_schedule_free));
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  226  		schedule_delayed_work(&oxid_pool->schedule_oxid_free_retry, 0);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  227  		return;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  228  	}
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  229  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  230  	reclaim_entry->oxid_idx = oxid_idx;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  231  	reclaim_entry->expires = round_jiffies(jiffies + delay_j);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  232  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  233  	list_add_tail(&reclaim_entry->links, &oxid_pool->oxid_reclaim_list);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  234  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  235  	schedule_delayed_work(&oxid_pool->oxid_reclaim_work, delay_j);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  236  }
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  237  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  238  /**
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  239   * fdls_schedule_oxid_free_retry_work - Thread to schedule the
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  240   * oxid to be freed later
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  241   *
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  242   * @work: Handle to the work struct
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  243   */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  244  void fdls_schedule_oxid_free_retry_work(struct work_struct *work)
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  245  {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  246  	struct fnic_oxid_pool_s *oxid_pool = container_of(work,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  247  		struct fnic_oxid_pool_s, schedule_oxid_free_retry.work);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  248  	struct fnic_iport_s *iport = container_of(oxid_pool,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  249  		struct fnic_iport_s, oxid_pool);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  250  	struct fnic *fnic = iport->fnic;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  251  	struct reclaim_entry_s *reclaim_entry;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  252  	unsigned long delay_j = msecs_to_jiffies(OXID_RECLAIM_TOV(iport));
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  253  	int idx;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  254  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  255  	spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  256  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  257  	for_each_set_bit(idx, oxid_pool->pending_schedule_free, FNIC_OXID_POOL_SZ) {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  258  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  259  		FNIC_FCS_DBG(KERN_INFO, fnic->lport->host, fnic->fnic_num,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  260  			"Schedule oxid free. oxid idx: %d\n", idx);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  261  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  262  		spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11 @263  	reclaim_entry = (struct reclaim_entry_s *)
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  264  	kzalloc(sizeof(struct reclaim_entry_s), GFP_KERNEL);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  265  		spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  266  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  267  		if (!reclaim_entry) {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  268  			FNIC_FCS_DBG(KERN_WARNING, fnic->lport->host, fnic->fnic_num,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  269  				"Failed to allocate memory for reclaim struct for oxid idx: 0x%x\n",
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  270  				idx);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  271  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  272  			schedule_delayed_work(&oxid_pool->schedule_oxid_free_retry,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  273  				msecs_to_jiffies(SCHEDULE_OXID_FREE_RETRY_TIME));
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  274  			spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  275  			return;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  276  		}
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  277  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  278  		if (test_and_clear_bit(idx, oxid_pool->pending_schedule_free)) {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  279  			reclaim_entry->oxid_idx = idx;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  280  			reclaim_entry->expires = round_jiffies(jiffies + delay_j);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  281  			list_add_tail(&reclaim_entry->links, &oxid_pool->oxid_reclaim_list);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  282  			schedule_delayed_work(&oxid_pool->oxid_reclaim_work, delay_j);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  283  		} else {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  284  			/* unlikely scenario, free the allocated memory and continue */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  285  			kfree(reclaim_entry);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  286  		}
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  287  }
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  288  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
