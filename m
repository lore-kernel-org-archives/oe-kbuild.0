Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3E215BF
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGpNmFlU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585175; x=1733121175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GXOcsT4B+K3qPjWTqhbXOv0LxcydocTRwLoP9md7n2s=;
  b=JGpNmFlUDvGR++q25X10mGRRQ7Ng9hNEJsXn3hc8+8E1p2Kd9rq03I7H
   Pdm1JIZ0mue/N80REMBoFIoIpNlRVU2ItbVtKHR/ttON/SsGiPBpW2CLS
   /VKnLTScMxoCvg5dRgi8ZX32LcncHlEUMVJWeag2k5cI3DjcYqqCskmaV
   pf4ZrR68F3hGH362zzee6Hk3qG0W6UpAx7t/RtIpL5WOPRhpCZKx+YuCF
   ozOS0GtH0dgUCou3AqDpDUds0spDKOVVyPMXUoCK6pvhMmj/ySU7dvul7
   W/qnYcUgI3GnQ/kuMZQVrFt1zlCOLdL7ud5XwYQMmUc7eLH/hDcACF+TS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180410"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180410"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081667"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081667"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006M2-2h;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/char/ipmi/ipmi_msghandler.c:4735 ipmi_timeout_handler()
 error: dereferencing freed memory 'intf'
Message-ID: <202312030420.kz1gXCX4-lkp@intel.com>
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
TO: Corey Minyard <cminyard@mvista.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 252e30c1e7d847c09d9480e4b17ba0485059f576 ipmi: Add a maintenance mode for IPMB messages
date:   6 years ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 years ago
config: x86_64-randconfig-161-20231108 (https://download.01.org/0day-ci/archive/20231203/202312030420.kz1gXCX4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030420.kz1gXCX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312030420.kz1gXCX4-lkp@intel.com/

smatch warnings:
drivers/char/ipmi/ipmi_msghandler.c:4735 ipmi_timeout_handler() error: dereferencing freed memory 'intf'

vim +/intf +4735 drivers/char/ipmi/ipmi_msghandler.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  4710  
392a17b10ec432 Corey Minyard   2017-07-29  4711  static unsigned int ipmi_timeout_handler(ipmi_smi_t intf,
392a17b10ec432 Corey Minyard   2017-07-29  4712  					 unsigned long timeout_period)
393d2cc354d150 Corey Minyard   2005-11-07  4713  {
393d2cc354d150 Corey Minyard   2005-11-07  4714  	struct list_head     timeouts;
393d2cc354d150 Corey Minyard   2005-11-07  4715  	struct ipmi_recv_msg *msg, *msg2;
393d2cc354d150 Corey Minyard   2005-11-07  4716  	unsigned long        flags;
bca0324d09e413 Corey Minyard   2006-12-06  4717  	int                  i;
89986496de1412 Corey Minyard   2014-04-14  4718  	unsigned int         waiting_msgs = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4719  
c0734bd594d43a Corey Minyard   2017-08-31  4720  	if (!intf->bmc_registered) {
c0734bd594d43a Corey Minyard   2017-08-31  4721  		kref_get(&intf->refcount);
c0734bd594d43a Corey Minyard   2017-08-31  4722  		if (!schedule_work(&intf->bmc_reg_work)) {
c0734bd594d43a Corey Minyard   2017-08-31  4723  			kref_put(&intf->refcount, intf_free);
c0734bd594d43a Corey Minyard   2017-08-31  4724  			waiting_msgs++;
c0734bd594d43a Corey Minyard   2017-08-31  4725  		}
c0734bd594d43a Corey Minyard   2017-08-31  4726  	}
c0734bd594d43a Corey Minyard   2017-08-31  4727  
c70d749986f6f1 Corey Minyard   2008-04-29  4728  	/*
c70d749986f6f1 Corey Minyard   2008-04-29  4729  	 * Go through the seq table and find any messages that
c70d749986f6f1 Corey Minyard   2008-04-29  4730  	 * have timed out, putting them in the timeouts
c70d749986f6f1 Corey Minyard   2008-04-29  4731  	 * list.
c70d749986f6f1 Corey Minyard   2008-04-29  4732  	 */
41c57a87183a7c David Barksdale 2007-01-30  4733  	INIT_LIST_HEAD(&timeouts);
393d2cc354d150 Corey Minyard   2005-11-07  4734  	spin_lock_irqsave(&intf->seq_lock, flags);
252e30c1e7d847 Corey Minyard   2018-04-05 @4735  	if (intf->ipmb_maintenance_mode_timeout) {
252e30c1e7d847 Corey Minyard   2018-04-05  4736  		if (intf->ipmb_maintenance_mode_timeout <= timeout_period)
252e30c1e7d847 Corey Minyard   2018-04-05  4737  			intf->ipmb_maintenance_mode_timeout = 0;
252e30c1e7d847 Corey Minyard   2018-04-05  4738  		else
252e30c1e7d847 Corey Minyard   2018-04-05  4739  			intf->ipmb_maintenance_mode_timeout -= timeout_period;
252e30c1e7d847 Corey Minyard   2018-04-05  4740  	}
bca0324d09e413 Corey Minyard   2006-12-06  4741  	for (i = 0; i < IPMI_IPMB_NUM_SEQ; i++)
bca0324d09e413 Corey Minyard   2006-12-06  4742  		check_msg_timeout(intf, &(intf->seq_table[i]),
bca0324d09e413 Corey Minyard   2006-12-06  4743  				  &timeouts, timeout_period, i,
89986496de1412 Corey Minyard   2014-04-14  4744  				  &flags, &waiting_msgs);
393d2cc354d150 Corey Minyard   2005-11-07  4745  	spin_unlock_irqrestore(&intf->seq_lock, flags);
393d2cc354d150 Corey Minyard   2005-11-07  4746  
393d2cc354d150 Corey Minyard   2005-11-07  4747  	list_for_each_entry_safe(msg, msg2, &timeouts, link)
b2c03941b50944 Corey Minyard   2006-12-06  4748  		deliver_err_response(msg, IPMI_TIMEOUT_COMPLETION_CODE);
b9675136e2ad95 Corey Minyard   2006-12-06  4749  
b9675136e2ad95 Corey Minyard   2006-12-06  4750  	/*
b9675136e2ad95 Corey Minyard   2006-12-06  4751  	 * Maintenance mode handling.  Check the timeout
b9675136e2ad95 Corey Minyard   2006-12-06  4752  	 * optimistically before we claim the lock.  It may
b9675136e2ad95 Corey Minyard   2006-12-06  4753  	 * mean a timeout gets missed occasionally, but that
b9675136e2ad95 Corey Minyard   2006-12-06  4754  	 * only means the timeout gets extended by one period
b9675136e2ad95 Corey Minyard   2006-12-06  4755  	 * in that case.  No big deal, and it avoids the lock
b9675136e2ad95 Corey Minyard   2006-12-06  4756  	 * most of the time.
b9675136e2ad95 Corey Minyard   2006-12-06  4757  	 */
b9675136e2ad95 Corey Minyard   2006-12-06  4758  	if (intf->auto_maintenance_timeout > 0) {
b9675136e2ad95 Corey Minyard   2006-12-06  4759  		spin_lock_irqsave(&intf->maintenance_mode_lock, flags);
b9675136e2ad95 Corey Minyard   2006-12-06  4760  		if (intf->auto_maintenance_timeout > 0) {
b9675136e2ad95 Corey Minyard   2006-12-06  4761  			intf->auto_maintenance_timeout
b9675136e2ad95 Corey Minyard   2006-12-06  4762  				-= timeout_period;
b9675136e2ad95 Corey Minyard   2006-12-06  4763  			if (!intf->maintenance_mode
c70d749986f6f1 Corey Minyard   2008-04-29  4764  			    && (intf->auto_maintenance_timeout <= 0)) {
7aefac26fc6715 Corey Minyard   2014-04-14  4765  				intf->maintenance_mode_enable = false;
b9675136e2ad95 Corey Minyard   2006-12-06  4766  				maintenance_mode_update(intf);
b9675136e2ad95 Corey Minyard   2006-12-06  4767  			}
b9675136e2ad95 Corey Minyard   2006-12-06  4768  		}
b9675136e2ad95 Corey Minyard   2006-12-06  4769  		spin_unlock_irqrestore(&intf->maintenance_mode_lock,
b9675136e2ad95 Corey Minyard   2006-12-06  4770  				       flags);
b9675136e2ad95 Corey Minyard   2006-12-06  4771  	}
89986496de1412 Corey Minyard   2014-04-14  4772  
89986496de1412 Corey Minyard   2014-04-14  4773  	tasklet_schedule(&intf->recv_tasklet);
89986496de1412 Corey Minyard   2014-04-14  4774  
89986496de1412 Corey Minyard   2014-04-14  4775  	return waiting_msgs;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4776  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  4777  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
