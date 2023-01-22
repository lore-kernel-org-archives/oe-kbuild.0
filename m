Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B9E39C
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 01:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674350643; x=1705886643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cwEIIHro0113VYrcL3R7wl8YFmZP7ipRHmvF/MIc0QM=;
  b=TzJcVNjQ/CX7Pz9RVdQgf29b9NUOjU7Oc4fVQPiL8S0XPczxag/YDBMS
   LlSy+fUIGha82e1iajuiON/c+jULy7Q5dZN52GTD9M1ULUSodvKZ1ecjO
   adgbzmaCB/Sww/yNkOQJolheak5Ren5IbFoVS9cJM0KFgV8f7kvGHg9mY
   f136/6WVMmDT4zFziuC0JjdM4LW30l5qHU9KmBGCVkeKyi7cCZcwn4JUU
   IsZTHcIwWyWcmReIMxnnd8jyRm15213eadCvhzlMTI2RkMQBAS5ReoiD0
   6f3XTjeit9HZJVdltKvOkl+tZjV9xFTXEXxKLkmtVZC1SE9ds+NSYJTlZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="325895121"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="325895121"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 17:24:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="749771667"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="749771667"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2023 17:23:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJP5S-0004do-0C;
	Sun, 22 Jan 2023 01:23:58 +0000
Date: Sun, 22 Jan 2023 09:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [l1k:pciehp_deadlock_v2_attempt_per_dev_rwsem 3/3]
 drivers/pci/doe.c:313 doe_statemachine_work() warn: inconsistent returns
 '&pdev->reset_lock'.
Message-ID: <202301220912.A7Z0o7dG-lkp@intel.com>
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
TO: Lukas Wunner <lukas@wunner.de>

tree:   https://github.com/l1k/linux pciehp_deadlock_v2_attempt_per_dev_rwsem
head:   1fd5c4fbe98942fb0a686f116616b8f3098e2680
commit: 1fd5c4fbe98942fb0a686f116616b8f3098e2680 [3/3] PCI/DOE: Protect DOE exchanges against concurrent reset.
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230122/202301220912.A7Z0o7dG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/pci/doe.c:313 doe_statemachine_work() warn: inconsistent returns '&pdev->reset_lock'.

vim +313 drivers/pci/doe.c

9d24322e887b6a Jonathan Cameron 2022-07-19  249  
9d24322e887b6a Jonathan Cameron 2022-07-19  250  static void doe_statemachine_work(struct work_struct *work)
9d24322e887b6a Jonathan Cameron 2022-07-19  251  {
9d24322e887b6a Jonathan Cameron 2022-07-19  252  	struct pci_doe_task *task = container_of(work, struct pci_doe_task,
9d24322e887b6a Jonathan Cameron 2022-07-19  253  						 work);
9d24322e887b6a Jonathan Cameron 2022-07-19  254  	struct pci_doe_mb *doe_mb = task->doe_mb;
9d24322e887b6a Jonathan Cameron 2022-07-19  255  	struct pci_dev *pdev = doe_mb->pdev;
9d24322e887b6a Jonathan Cameron 2022-07-19  256  	int offset = doe_mb->cap_offset;
9d24322e887b6a Jonathan Cameron 2022-07-19  257  	unsigned long timeout_jiffies;
9d24322e887b6a Jonathan Cameron 2022-07-19  258  	u32 val;
9d24322e887b6a Jonathan Cameron 2022-07-19  259  	int rc;
9d24322e887b6a Jonathan Cameron 2022-07-19  260  
9d24322e887b6a Jonathan Cameron 2022-07-19  261  	if (test_bit(PCI_DOE_FLAG_DEAD, &doe_mb->flags)) {
9d24322e887b6a Jonathan Cameron 2022-07-19  262  		signal_task_complete(task, -EIO);
9d24322e887b6a Jonathan Cameron 2022-07-19  263  		return;
9d24322e887b6a Jonathan Cameron 2022-07-19  264  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  265  
1fd5c4fbe98942 Lukas Wunner     2023-01-21  266  	down_read(&pdev->reset_lock);
1fd5c4fbe98942 Lukas Wunner     2023-01-21  267  
9d24322e887b6a Jonathan Cameron 2022-07-19  268  	/* Send request */
9d24322e887b6a Jonathan Cameron 2022-07-19  269  	rc = pci_doe_send_req(doe_mb, task);
9d24322e887b6a Jonathan Cameron 2022-07-19  270  	if (rc) {
9d24322e887b6a Jonathan Cameron 2022-07-19  271  		/*
9d24322e887b6a Jonathan Cameron 2022-07-19  272  		 * The specification does not provide any guidance on how to
9d24322e887b6a Jonathan Cameron 2022-07-19  273  		 * resolve conflicting requests from other entities.
9d24322e887b6a Jonathan Cameron 2022-07-19  274  		 * Furthermore, it is likely that busy will not be detected
9d24322e887b6a Jonathan Cameron 2022-07-19  275  		 * most of the time.  Flag any detection of status busy with an
9d24322e887b6a Jonathan Cameron 2022-07-19  276  		 * error.
9d24322e887b6a Jonathan Cameron 2022-07-19  277  		 */
9d24322e887b6a Jonathan Cameron 2022-07-19  278  		if (rc == -EBUSY)
9d24322e887b6a Jonathan Cameron 2022-07-19  279  			dev_err_ratelimited(&pdev->dev, "[%x] busy detected; another entity is sending conflicting requests\n",
9d24322e887b6a Jonathan Cameron 2022-07-19  280  					    offset);
9d24322e887b6a Jonathan Cameron 2022-07-19  281  		signal_task_abort(task, rc);
9d24322e887b6a Jonathan Cameron 2022-07-19  282  		return;
9d24322e887b6a Jonathan Cameron 2022-07-19  283  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  284  
9d24322e887b6a Jonathan Cameron 2022-07-19  285  	timeout_jiffies = jiffies + PCI_DOE_TIMEOUT;
9d24322e887b6a Jonathan Cameron 2022-07-19  286  	/* Poll for response */
9d24322e887b6a Jonathan Cameron 2022-07-19  287  retry_resp:
9d24322e887b6a Jonathan Cameron 2022-07-19  288  	pci_read_config_dword(pdev, offset + PCI_DOE_STATUS, &val);
9d24322e887b6a Jonathan Cameron 2022-07-19  289  	if (FIELD_GET(PCI_DOE_STATUS_ERROR, val)) {
9d24322e887b6a Jonathan Cameron 2022-07-19  290  		signal_task_abort(task, -EIO);
9d24322e887b6a Jonathan Cameron 2022-07-19  291  		return;
9d24322e887b6a Jonathan Cameron 2022-07-19  292  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  293  
9d24322e887b6a Jonathan Cameron 2022-07-19  294  	if (!FIELD_GET(PCI_DOE_STATUS_DATA_OBJECT_READY, val)) {
9d24322e887b6a Jonathan Cameron 2022-07-19  295  		if (time_after(jiffies, timeout_jiffies)) {
9d24322e887b6a Jonathan Cameron 2022-07-19  296  			signal_task_abort(task, -EIO);
9d24322e887b6a Jonathan Cameron 2022-07-19  297  			return;
9d24322e887b6a Jonathan Cameron 2022-07-19  298  		}
9d24322e887b6a Jonathan Cameron 2022-07-19  299  		rc = pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL);
9d24322e887b6a Jonathan Cameron 2022-07-19  300  		if (rc) {
9d24322e887b6a Jonathan Cameron 2022-07-19  301  			signal_task_abort(task, rc);
9d24322e887b6a Jonathan Cameron 2022-07-19  302  			return;
9d24322e887b6a Jonathan Cameron 2022-07-19  303  		}
9d24322e887b6a Jonathan Cameron 2022-07-19  304  		goto retry_resp;
9d24322e887b6a Jonathan Cameron 2022-07-19  305  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  306  
9d24322e887b6a Jonathan Cameron 2022-07-19  307  	rc  = pci_doe_recv_resp(doe_mb, task);
9d24322e887b6a Jonathan Cameron 2022-07-19  308  	if (rc < 0) {
9d24322e887b6a Jonathan Cameron 2022-07-19  309  		signal_task_abort(task, rc);
9d24322e887b6a Jonathan Cameron 2022-07-19  310  		return;
9d24322e887b6a Jonathan Cameron 2022-07-19  311  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  312  
9d24322e887b6a Jonathan Cameron 2022-07-19 @313  	signal_task_complete(task, rc);
9d24322e887b6a Jonathan Cameron 2022-07-19  314  }
9d24322e887b6a Jonathan Cameron 2022-07-19  315  

:::::: The code at line 313 was first introduced by commit
:::::: 9d24322e887b6a3d3f9f9c3e76937a646102c8c1 PCI/DOE: Add DOE mailbox support functions

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
