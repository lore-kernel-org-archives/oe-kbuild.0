Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61701D61AF
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905225; cv=none; b=b3beTcZGgGrcQZ9+4xJr2dRwVNrFYUBHZr99Td/9ucRswmG2Gl2zj+kPKWBkNxB5cZDLjdqNPIrSEiQdcW7egXCLiP+6RkdgqgbVyMzJrhBsGnCEDB7qbavkdHctHsq9E6+8AEjdFfsBunjXSQNKTG8FCOmtp5LaYM+9N1WIuCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905225; c=relaxed/simple;
	bh=cSBoc4PfltcggdxB9G53GDYRk+0kCa7K76OYppAKcAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPj3ED5WdulxNqAgbeE6DbquR92OQrglPbJU7lfco/SWo3e2v7fz/x0fVvUK8jT/mayZee+IMgGKWOgEpGscnFhyxZRaCcOYCgStNfVAENHLT3J5nigEicgsGN7duO/fMxN97wl4D0xZTSckqvw5SAalEP1aTCeqDtugbYarCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7HgDKkm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7HgDKkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733905224; x=1765441224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSBoc4PfltcggdxB9G53GDYRk+0kCa7K76OYppAKcAI=;
  b=H7HgDKkm6wgmD/NQcBY7fO3G9frCePQ/9XuRU0nSGWP7v7l4sfWQjdcB
   vBvgXMiFkIHDf7SqvqPg9MSuEq7k2Uf2itfBH1+WjL7zFbFdidUCy+US/
   mUgeYoMWM55DdqfXq4+n1azT79/Q7IMqjrybisIHTmgBXo8x8ndoPItDd
   p5cltMFufHWZOy4OXOnZoToDDp1yI+6t6wHOMcGVAv1PXAOBaLBJ7spZb
   7R8/6GEd3I+8kzy9Cfv681SIwhYkYmnPeVUNoYolcGiDxnM7Zja0x1YXp
   N6zA5SQQ/ET0QqafW34iWMz/oOnFPG8Qm9dzXPNWXMWmV6YYjUwp78gyo
   Q==;
X-CSE-ConnectionGUID: Vmu1uUY7ThOoYwXcEbtFTw==
X-CSE-MsgGUID: Anw8giuFThqRNxJGAn3otg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="59667354"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="59667354"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 00:20:23 -0800
X-CSE-ConnectionGUID: 9lUnTl6ZTJGqYIYjgnFe+Q==
X-CSE-MsgGUID: LDxrtkDhQPqsyK1Qwst6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95532843"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2024 00:20:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLHxD-0006Qz-1A;
	Wed, 11 Dec 2024 08:20:19 +0000
Date: Wed, 11 Dec 2024 16:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCHv2] block: Fix potential deadlock while freezing queue and
 acquiring sysfs_lock
Message-ID: <202412111553.XzRIWedS-lkp@intel.com>
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
In-Reply-To: <20241210144222.1066229-1-nilay@linux.ibm.com>
References: <20241210144222.1066229-1-nilay@linux.ibm.com>
TO: Nilay Shroff <nilay@linux.ibm.com>
TO: linux-block@vger.kernel.org
CC: Nilay Shroff <nilay@linux.ibm.com>
CC: kjain@linux.ibm.com
CC: hch@lst.de
CC: axboe@kernel.dk
CC: ritesh.list@gmail.com
CC: ming.lei@redhat.com
CC: gjoyce@linux.ibm.com

Hi Nilay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc2 next-20241211]
[cannot apply to axboe-block/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nilay-Shroff/block-Fix-potential-deadlock-while-freezing-queue-and-acquiring-sysfs_lock/20241210-224435
base:   linus/master
patch link:    https://lore.kernel.org/r/20241210144222.1066229-1-nilay%40linux.ibm.com
patch subject: [PATCHv2] block: Fix potential deadlock while freezing queue and acquiring sysfs_lock
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-101-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111553.XzRIWedS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412111553.XzRIWedS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> block/blk-mq.c:4997:2-12: second lock on line 4997
   block/blk-mq.c:4998:2-12: second lock on line 4998
--
>> block/blk-mq.c:5065:0-1: preceding lock on line 4997
   block/blk-mq.c:5065:0-1: preceding lock on line 4998

vim +4997 block/blk-mq.c

d48ece209f82c9c Jianchao Wang     2018-08-21  4978  
e4dc2b32df5573b Keith Busch       2017-05-30  4979  static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
e4dc2b32df5573b Keith Busch       2017-05-30  4980  							int nr_hw_queues)
868f2f0b72068a0 Keith Busch       2015-12-17  4981  {
868f2f0b72068a0 Keith Busch       2015-12-17  4982  	struct request_queue *q;
d48ece209f82c9c Jianchao Wang     2018-08-21  4983  	LIST_HEAD(head);
6be6d1124197133 Chengming Zhou    2023-09-08  4984  	int prev_nr_hw_queues = set->nr_hw_queues;
6be6d1124197133 Chengming Zhou    2023-09-08  4985  	int i;
868f2f0b72068a0 Keith Busch       2015-12-17  4986  
705cda97ee3abb6 Bart Van Assche   2017-04-07  4987  	lockdep_assert_held(&set->tag_list_lock);
705cda97ee3abb6 Bart Van Assche   2017-04-07  4988  
392546aed220090 Jens Axboe        2018-10-29  4989  	if (set->nr_maps == 1 && nr_hw_queues > nr_cpu_ids)
868f2f0b72068a0 Keith Busch       2015-12-17  4990  		nr_hw_queues = nr_cpu_ids;
fe35ec58f0d3392 Weiping Zhang     2020-06-17  4991  	if (nr_hw_queues < 1)
fe35ec58f0d3392 Weiping Zhang     2020-06-17  4992  		return;
fe35ec58f0d3392 Weiping Zhang     2020-06-17  4993  	if (set->nr_maps == 1 && nr_hw_queues == set->nr_hw_queues)
868f2f0b72068a0 Keith Busch       2015-12-17  4994  		return;
868f2f0b72068a0 Keith Busch       2015-12-17  4995  
38bfa3ab3c72c15 Nilay Shroff      2024-12-10  4996  	list_for_each_entry(q, &set->tag_list, tag_set_list) {
38bfa3ab3c72c15 Nilay Shroff      2024-12-10 @4997  		mutex_lock(&q->sysfs_dir_lock);
38bfa3ab3c72c15 Nilay Shroff      2024-12-10  4998  		mutex_lock(&q->sysfs_lock);
868f2f0b72068a0 Keith Busch       2015-12-17  4999  		blk_mq_freeze_queue(q);
38bfa3ab3c72c15 Nilay Shroff      2024-12-10  5000  	}
d48ece209f82c9c Jianchao Wang     2018-08-21  5001  	/*
d48ece209f82c9c Jianchao Wang     2018-08-21  5002  	 * Switch IO scheduler to 'none', cleaning up the data associated
d48ece209f82c9c Jianchao Wang     2018-08-21  5003  	 * with the previous scheduler. We will switch back once we are done
d48ece209f82c9c Jianchao Wang     2018-08-21  5004  	 * updating the new sw to hw queue mappings.
d48ece209f82c9c Jianchao Wang     2018-08-21  5005  	 */
d48ece209f82c9c Jianchao Wang     2018-08-21  5006  	list_for_each_entry(q, &set->tag_list, tag_set_list)
d48ece209f82c9c Jianchao Wang     2018-08-21  5007  		if (!blk_mq_elv_switch_none(&head, q))
d48ece209f82c9c Jianchao Wang     2018-08-21  5008  			goto switch_back;
868f2f0b72068a0 Keith Busch       2015-12-17  5009  
477e19dedc9d3e1 Jianchao Wang     2018-10-12  5010  	list_for_each_entry(q, &set->tag_list, tag_set_list) {
477e19dedc9d3e1 Jianchao Wang     2018-10-12  5011  		blk_mq_debugfs_unregister_hctxs(q);
eaa870f97544668 Christoph Hellwig 2022-06-28  5012  		blk_mq_sysfs_unregister_hctxs(q);
477e19dedc9d3e1 Jianchao Wang     2018-10-12  5013  	}
477e19dedc9d3e1 Jianchao Wang     2018-10-12  5014  
ee9d55210c2fe40 Christoph Hellwig 2022-11-09  5015  	if (blk_mq_realloc_tag_set_tags(set, nr_hw_queues) < 0)
f7e76dbc24df695 Bart Van Assche   2019-10-25  5016  		goto reregister;
f7e76dbc24df695 Bart Van Assche   2019-10-25  5017  
e01ad46d53b5972 Jianchao Wang     2018-10-12  5018  fallback:
aa880ad690ab6d4 Weiping Zhang     2020-05-13  5019  	blk_mq_update_queue_map(set);
868f2f0b72068a0 Keith Busch       2015-12-17  5020  	list_for_each_entry(q, &set->tag_list, tag_set_list) {
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5021  		struct queue_limits lim;
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5022  
868f2f0b72068a0 Keith Busch       2015-12-17  5023  		blk_mq_realloc_hw_ctxs(set, q);
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5024  
e01ad46d53b5972 Jianchao Wang     2018-10-12  5025  		if (q->nr_hw_queues != set->nr_hw_queues) {
a846a8e6c9a5949 Ye Bin            2021-11-08  5026  			int i = prev_nr_hw_queues;
a846a8e6c9a5949 Ye Bin            2021-11-08  5027  
e01ad46d53b5972 Jianchao Wang     2018-10-12  5028  			pr_warn("Increasing nr_hw_queues to %d fails, fallback to %d\n",
e01ad46d53b5972 Jianchao Wang     2018-10-12  5029  					nr_hw_queues, prev_nr_hw_queues);
a846a8e6c9a5949 Ye Bin            2021-11-08  5030  			for (; i < set->nr_hw_queues; i++)
a846a8e6c9a5949 Ye Bin            2021-11-08  5031  				__blk_mq_free_map_and_rqs(set, i);
a846a8e6c9a5949 Ye Bin            2021-11-08  5032  
e01ad46d53b5972 Jianchao Wang     2018-10-12  5033  			set->nr_hw_queues = prev_nr_hw_queues;
e01ad46d53b5972 Jianchao Wang     2018-10-12  5034  			goto fallback;
e01ad46d53b5972 Jianchao Wang     2018-10-12  5035  		}
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5036  		lim = queue_limits_start_update(q);
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5037  		if (blk_mq_can_poll(set))
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5038  			lim.features |= BLK_FEAT_POLL;
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5039  		else
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5040  			lim.features &= ~BLK_FEAT_POLL;
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5041  		if (queue_limits_commit_update(q, &lim) < 0)
8023e144f9d6e35 Christoph Hellwig 2024-06-17  5042  			pr_warn("updating the poll flag failed\n");
477e19dedc9d3e1 Jianchao Wang     2018-10-12  5043  		blk_mq_map_swqueue(q);
477e19dedc9d3e1 Jianchao Wang     2018-10-12  5044  	}
477e19dedc9d3e1 Jianchao Wang     2018-10-12  5045  
f7e76dbc24df695 Bart Van Assche   2019-10-25  5046  reregister:
477e19dedc9d3e1 Jianchao Wang     2018-10-12  5047  	list_for_each_entry(q, &set->tag_list, tag_set_list) {
eaa870f97544668 Christoph Hellwig 2022-06-28  5048  		blk_mq_sysfs_register_hctxs(q);
477e19dedc9d3e1 Jianchao Wang     2018-10-12  5049  		blk_mq_debugfs_register_hctxs(q);
868f2f0b72068a0 Keith Busch       2015-12-17  5050  	}
868f2f0b72068a0 Keith Busch       2015-12-17  5051  
d48ece209f82c9c Jianchao Wang     2018-08-21  5052  switch_back:
d48ece209f82c9c Jianchao Wang     2018-08-21  5053  	list_for_each_entry(q, &set->tag_list, tag_set_list)
d48ece209f82c9c Jianchao Wang     2018-08-21  5054  		blk_mq_elv_switch_back(&head, q);
d48ece209f82c9c Jianchao Wang     2018-08-21  5055  
38bfa3ab3c72c15 Nilay Shroff      2024-12-10  5056  	list_for_each_entry(q, &set->tag_list, tag_set_list) {
868f2f0b72068a0 Keith Busch       2015-12-17  5057  		blk_mq_unfreeze_queue(q);
38bfa3ab3c72c15 Nilay Shroff      2024-12-10  5058  		mutex_unlock(&q->sysfs_lock);
38bfa3ab3c72c15 Nilay Shroff      2024-12-10  5059  		mutex_unlock(&q->sysfs_dir_lock);
38bfa3ab3c72c15 Nilay Shroff      2024-12-10  5060  	}
6be6d1124197133 Chengming Zhou    2023-09-08  5061  
6be6d1124197133 Chengming Zhou    2023-09-08  5062  	/* Free the excess tags when nr_hw_queues shrink. */
6be6d1124197133 Chengming Zhou    2023-09-08  5063  	for (i = set->nr_hw_queues; i < prev_nr_hw_queues; i++)
6be6d1124197133 Chengming Zhou    2023-09-08  5064  		__blk_mq_free_map_and_rqs(set, i);
868f2f0b72068a0 Keith Busch       2015-12-17 @5065  }
e4dc2b32df5573b Keith Busch       2017-05-30  5066  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
