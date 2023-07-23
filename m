Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6123D7F
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jul 2023 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690114269; x=1721650269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1c6J9kvgv5Fp4+N4uJwz4NQNX34aqzt8cLSBI2iVVB4=;
  b=gYJWZTT6A29bwQV4bfb9MBLv8WWNBSjQgQ+xDq2czd2agVejtEubIm5t
   o5K2SerG9p7U6V4A3hBffrWsZfEKzw43Wah/a24bSjFpjblDlNaKkf6qF
   Gv+8DlDHsfeFMZdR2gL1s4mKCdqxSlbq0bCZDmYUnmFCVWZAp8Tg4XOq/
   Z9kZIWD9wb2UY0YFXk3/Rf6kznBk7Zu+Kb6YsFOW8RJx9kmdcJZbWqlpa
   KIq2iipUFSjEc3AQ0JyrS3NYKBGVAdG5sJduTYaHaJh4dPkpzsduDKCHa
   UlE1lyT+3kbrEXvBnK9nyEcb+fsLCRGUZbvgqDsmCofON6M1TJkSh9GJa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="433509472"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="433509472"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 05:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="760485737"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="760485737"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Jul 2023 05:11:07 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNXvV-0008zX-0M;
	Sun, 23 Jul 2023 12:11:05 +0000
Date: Sun, 23 Jul 2023 20:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 01/13] scsi: Define basic framework for driver LUN/target
 based error handle
Message-ID: <202307232002.D4RBVjvC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230723234422.1629194-2-haowenchao2@huawei.com>
References: <20230723234422.1629194-2-haowenchao2@huawei.com>
TO: Wenchao Hao <haowenchao2@huawei.com>
TO: "James E . J . Bottomley" <jejb@linux.ibm.com>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
TO: Hannes Reinecke <hare@suse.de>
TO: linux-scsi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Dan Carpenter <error27@gmail.com>
CC: louhongxiang@huawei.com
CC: Wenchao Hao <haowenchao2@huawei.com>

Hi Wenchao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.5-rc2 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenchao-Hao/scsi-Define-basic-framework-for-driver-LUN-target-based-error-handle/20230723-182631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230723234422.1629194-2-haowenchao2%40huawei.com
patch subject: [PATCH 01/13] scsi: Define basic framework for driver LUN/target based error handle
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: openrisc-randconfig-r021-20230723 (https://download.01.org/0day-ci/archive/20230723/202307232002.D4RBVjvC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307232002.D4RBVjvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307232002.D4RBVjvC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_error.c:335: warning: expecting prototype for scsi_eh_scmd_add(). Prototype was for __scsi_eh_scmd_add() instead


vim +335 drivers/scsi/scsi_error.c

d5ff716feb4ff36 Wenchao Hao      2023-07-24  329  
^1da177e4c3f415 Linus Torvalds   2005-04-16  330  /**
^1da177e4c3f415 Linus Torvalds   2005-04-16  331   * scsi_eh_scmd_add - add scsi cmd to error handling.
^1da177e4c3f415 Linus Torvalds   2005-04-16  332   * @scmd:	scmd to run eh on.
dc8875e10789615 Randy Dunlap     2007-11-15  333   */
d5ff716feb4ff36 Wenchao Hao      2023-07-24  334  static void __scsi_eh_scmd_add(struct scsi_cmnd *scmd)
^1da177e4c3f415 Linus Torvalds   2005-04-16 @335  {
^1da177e4c3f415 Linus Torvalds   2005-04-16  336  	struct Scsi_Host *shost = scmd->device->host;
^1da177e4c3f415 Linus Torvalds   2005-04-16  337  	unsigned long flags;
2171b6d08bf8c2b Hannes Reinecke  2017-04-06  338  	int ret;
^1da177e4c3f415 Linus Torvalds   2005-04-16  339  
2171b6d08bf8c2b Hannes Reinecke  2017-04-06  340  	WARN_ON_ONCE(!shost->ehandler);
^1da177e4c3f415 Linus Torvalds   2005-04-16  341  
^1da177e4c3f415 Linus Torvalds   2005-04-16  342  	spin_lock_irqsave(shost->host_lock, flags);
2171b6d08bf8c2b Hannes Reinecke  2017-04-06  343  	if (scsi_host_set_state(shost, SHOST_RECOVERY)) {
2171b6d08bf8c2b Hannes Reinecke  2017-04-06  344  		ret = scsi_host_set_state(shost, SHOST_CANCEL_RECOVERY);
2171b6d08bf8c2b Hannes Reinecke  2017-04-06  345  		WARN_ON_ONCE(ret);
2171b6d08bf8c2b Hannes Reinecke  2017-04-06  346  	}
bb3b621a33d60fc Ren Mingxin      2013-11-11  347  	if (shost->eh_deadline != -1 && !shost->last_reset)
b45620229dd67ff Hannes Reinecke  2013-10-23  348  		shost->last_reset = jiffies;
b45620229dd67ff Hannes Reinecke  2013-10-23  349  
7a38dc0bfb4cc39 Hannes Reinecke  2017-04-06  350  	scsi_eh_reset(scmd);
^1da177e4c3f415 Linus Torvalds   2005-04-16  351  	list_add_tail(&scmd->eh_entry, &shost->eh_cmd_q);
^1da177e4c3f415 Linus Torvalds   2005-04-16  352  	spin_unlock_irqrestore(shost->host_lock, flags);
3bd6f43f5cb3714 Bart Van Assche  2017-12-04  353  	/*
3bd6f43f5cb3714 Bart Van Assche  2017-12-04  354  	 * Ensure that all tasks observe the host state change before the
3bd6f43f5cb3714 Bart Van Assche  2017-12-04  355  	 * host_failed change.
3bd6f43f5cb3714 Bart Van Assche  2017-12-04  356  	 */
54d87b0a0c19bc3 Uladzislau Rezki 2022-10-16  357  	call_rcu_hurry(&scmd->rcu, scsi_eh_inc_host_failed);
^1da177e4c3f415 Linus Torvalds   2005-04-16  358  }
^1da177e4c3f415 Linus Torvalds   2005-04-16  359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
