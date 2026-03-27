Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC13B3D669C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604785; cv=none; b=iL3ejI0tKDQO2wP9Awzld9BzxVjZkGiAXTNANvTdVbgdcEzc+jNLUPZzIAK0uS9sfWCX0DKnlclUQ7wdByy28U/7sshg5imixtEuW9GsQ0tBywkIeUvZ7odHo92p3WyEkpKz1jYsGZL35tWp7P23wd+1Yxnu82HEYUxTc3ptnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604785; c=relaxed/simple;
	bh=+1iaz7/4WTDk9hvmrxiKQD2alrae1+L0YG6nWO1z2D0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TVkt7L4ebteysg+7gIL3/yFUlvM1OyMJxu2oFK3nk/srDFQfqYetpFTugxOXw9do7cP9mycgVLxvJa0enHgrPfnSolaihohgPHvhv/RZgIyDQq8J28pbskg1ZvtuQTYjsPHgZMNvVqo3r/WrZHga/V+mZJF34KBU+scqSPGsYhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ea5omjUW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ea5omjUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774604783; x=1806140783;
  h=date:from:to:cc:subject:message-id;
  bh=+1iaz7/4WTDk9hvmrxiKQD2alrae1+L0YG6nWO1z2D0=;
  b=ea5omjUWCT+5P6gWAbsIiKQOyt6hDIg6N8AlKSgR99BOFZujAsK4h1HH
   lxrMwJvN3ezxghGOqQWhsuW5aRoknoAA2AFIpB/B5U2bQ4XMIhHQs/Wdw
   lFQ1oSwLShZZ5OkQdWuB8zj3mQLEZsP6DnhzMW6pBkYaB1GdHpow8QmUw
   gnvXpng/ukJAZ26wSmtHltURGBR7irnTt78Vjkn+R4YEOJvjDmHCmbhx3
   6Pn14U1Sa91DFTKWvsFWpUM3yoHrpJ8O8oH1Xc5jRW2jBryzbxr83hkSS
   V03cWMsvf521B2m8GQUTp/5Sv7aH2wdXqa1IG/ZHl+6zbKGQQWxH/pB+x
   g==;
X-CSE-ConnectionGUID: YfQt1FEkQFqOGZ0Ozm2c/A==
X-CSE-MsgGUID: EIw2+tEdRMWGUIEl5noCKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75790826"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75790826"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:46:22 -0700
X-CSE-ConnectionGUID: fIpU7vZ4Tdi3NVM6jN5iLg==
X-CSE-MsgGUID: Pg7jkrrxRzGoJVjARh98bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="255768517"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2026 02:46:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w63li-00000000A81-091n;
	Fri, 27 Mar 2026 09:46:18 +0000
Date: Fri, 27 Mar 2026 17:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 204/525]
 drivers/misc/bcm-vk/bcm_vk_msg.c:1054 bcm_vk_read() error: we previously
 assumed 'entry' could be null (see line 1045)
Message-ID: <202603271746.xX5EENwP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   520344cda122ca1903fafb19768f56509e3db8b1
commit: 0629d32f614c429b7dc371a2ac04475bb82b909f [204/525] misc: bcm_vk: convert to iterators
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: loongarch-randconfig-r072-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271746.xX5EENwP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603271746.xX5EENwP-lkp@intel.com/

smatch warnings:
drivers/misc/bcm-vk/bcm_vk_msg.c:1054 bcm_vk_read() error: we previously assumed 'entry' could be null (see line 1045)

vim +/entry +1054 drivers/misc/bcm-vk/bcm_vk_msg.c

22c30607d1e0c60 Scott Branden 2021-01-20  1001  
0629d32f614c429 Jens Axboe    2024-04-05  1002  ssize_t bcm_vk_read(struct kiocb *iocb, struct iov_iter *to)
111d746bb4767ad Scott Branden 2021-01-20  1003  {
111d746bb4767ad Scott Branden 2021-01-20  1004  	ssize_t rc = -ENOMSG;
0629d32f614c429 Jens Axboe    2024-04-05  1005  	struct bcm_vk_ctx *ctx = iocb->ki_filp->private_data;
111d746bb4767ad Scott Branden 2021-01-20  1006  	struct bcm_vk *vk = container_of(ctx->miscdev, struct bcm_vk,
111d746bb4767ad Scott Branden 2021-01-20  1007  					 miscdev);
111d746bb4767ad Scott Branden 2021-01-20  1008  	struct device *dev = &vk->pdev->dev;
111d746bb4767ad Scott Branden 2021-01-20  1009  	struct bcm_vk_msg_chan *chan = &vk->to_h_msg_chan;
88517757a829e9c Jakob Koschel 2022-03-27  1010  	struct bcm_vk_wkent *entry = NULL, *iter;
0629d32f614c429 Jens Axboe    2024-04-05  1011  	size_t count = iov_iter_count(to);
111d746bb4767ad Scott Branden 2021-01-20  1012  	u32 q_num;
111d746bb4767ad Scott Branden 2021-01-20  1013  	u32 rsp_length;
111d746bb4767ad Scott Branden 2021-01-20  1014  
111d746bb4767ad Scott Branden 2021-01-20  1015  	if (!bcm_vk_drv_access_ok(vk))
111d746bb4767ad Scott Branden 2021-01-20  1016  		return -EPERM;
111d746bb4767ad Scott Branden 2021-01-20  1017  
111d746bb4767ad Scott Branden 2021-01-20  1018  	dev_dbg(dev, "Buf count %zu\n", count);
111d746bb4767ad Scott Branden 2021-01-20  1019  
111d746bb4767ad Scott Branden 2021-01-20  1020  	/*
111d746bb4767ad Scott Branden 2021-01-20  1021  	 * search through the pendq on the to_h chan, and return only those
111d746bb4767ad Scott Branden 2021-01-20  1022  	 * that belongs to the same context.  Search is always from the high to
111d746bb4767ad Scott Branden 2021-01-20  1023  	 * the low priority queues
111d746bb4767ad Scott Branden 2021-01-20  1024  	 */
111d746bb4767ad Scott Branden 2021-01-20  1025  	spin_lock(&chan->pendq_lock);
111d746bb4767ad Scott Branden 2021-01-20  1026  	for (q_num = 0; q_num < chan->q_nr; q_num++) {
88517757a829e9c Jakob Koschel 2022-03-27  1027  		list_for_each_entry(iter, &chan->pendq[q_num], node) {
88517757a829e9c Jakob Koschel 2022-03-27  1028  			if (iter->ctx->idx == ctx->idx) {
111d746bb4767ad Scott Branden 2021-01-20  1029  				if (count >=
88517757a829e9c Jakob Koschel 2022-03-27  1030  				    (iter->to_h_blks * VK_MSGQ_BLK_SIZE)) {
88517757a829e9c Jakob Koschel 2022-03-27  1031  					list_del(&iter->node);
111d746bb4767ad Scott Branden 2021-01-20  1032  					atomic_dec(&ctx->pend_cnt);
88517757a829e9c Jakob Koschel 2022-03-27  1033  					entry = iter;
111d746bb4767ad Scott Branden 2021-01-20  1034  				} else {
111d746bb4767ad Scott Branden 2021-01-20  1035  					/* buffer not big enough */
111d746bb4767ad Scott Branden 2021-01-20  1036  					rc = -EMSGSIZE;
111d746bb4767ad Scott Branden 2021-01-20  1037  				}
111d746bb4767ad Scott Branden 2021-01-20  1038  				goto read_loop_exit;
111d746bb4767ad Scott Branden 2021-01-20  1039  			}
111d746bb4767ad Scott Branden 2021-01-20  1040  		}
111d746bb4767ad Scott Branden 2021-01-20  1041  	}
111d746bb4767ad Scott Branden 2021-01-20  1042  read_loop_exit:
111d746bb4767ad Scott Branden 2021-01-20  1043  	spin_unlock(&chan->pendq_lock);
111d746bb4767ad Scott Branden 2021-01-20  1044  
88517757a829e9c Jakob Koschel 2022-03-27 @1045  	if (entry) {
111d746bb4767ad Scott Branden 2021-01-20  1046  		/* retrieve the passed down msg_id */
111d746bb4767ad Scott Branden 2021-01-20  1047  		set_msg_id(&entry->to_h_msg[0], entry->usr_msg_id);
111d746bb4767ad Scott Branden 2021-01-20  1048  		rsp_length = entry->to_h_blks * VK_MSGQ_BLK_SIZE;
0629d32f614c429 Jens Axboe    2024-04-05  1049  		if (!copy_to_iter_full(entry->to_h_msg, rsp_length, to))
111d746bb4767ad Scott Branden 2021-01-20  1050  			rc = rsp_length;
111d746bb4767ad Scott Branden 2021-01-20  1051  
111d746bb4767ad Scott Branden 2021-01-20  1052  		bcm_vk_free_wkent(dev, entry);
111d746bb4767ad Scott Branden 2021-01-20  1053  	} else if (rc == -EMSGSIZE) {
0629d32f614c429 Jens Axboe    2024-04-05 @1054  		struct vk_msg_blk tmp_msg = entry->to_h_msg[0];
0629d32f614c429 Jens Axboe    2024-04-05  1055  
111d746bb4767ad Scott Branden 2021-01-20  1056  		/*
111d746bb4767ad Scott Branden 2021-01-20  1057  		 * in this case, return just the first block, so
111d746bb4767ad Scott Branden 2021-01-20  1058  		 * that app knows what size it is looking for.
111d746bb4767ad Scott Branden 2021-01-20  1059  		 */
0629d32f614c429 Jens Axboe    2024-04-05  1060  		set_msg_id(&tmp_msg, entry->usr_msg_id);
0629d32f614c429 Jens Axboe    2024-04-05  1061  		tmp_msg.size = entry->to_h_blks - 1;
0629d32f614c429 Jens Axboe    2024-04-05  1062  		if (!copy_to_iter_full(&tmp_msg, VK_MSGQ_BLK_SIZE, to)) {
111d746bb4767ad Scott Branden 2021-01-20  1063  			dev_err(dev, "Error return 1st block in -EMSGSIZE\n");
111d746bb4767ad Scott Branden 2021-01-20  1064  			rc = -EFAULT;
111d746bb4767ad Scott Branden 2021-01-20  1065  		}
111d746bb4767ad Scott Branden 2021-01-20  1066  	}
111d746bb4767ad Scott Branden 2021-01-20  1067  	return rc;
111d746bb4767ad Scott Branden 2021-01-20  1068  }
111d746bb4767ad Scott Branden 2021-01-20  1069  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
