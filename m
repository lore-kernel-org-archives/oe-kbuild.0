Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123F13D64
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jun 2023 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686134100; x=1717670100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77BRGUMGZMg52Hu/aOMBYYGp2WxX+0d1eUQywh8BIok=;
  b=T4tjo8q/B35IaGk1SeG/n0tL2fgbNoQ019Vw+dwGbiCfpYRcyaOM8trU
   CjpTHTKu3iK3FO4NOb4swKKQLgwvzh+cLwd0n8jF8gQHPbM2bRrkYRZv/
   f7Wiv1g1YV1h9nRkozmg4JgX1/z3yLGL+VikuCmvHMxP6grP12dBv1lor
   rifT3j8eXzvaP5up6vMofZ0n75Qal0QjMH3lgmz56YBLDB403W5Gf1wrE
   GALbYBzave6Wkcsg4y7xy56VfCtyy4WI5xY/JI8AEUVZw+ZkQ6qJtuCf2
   +EjOE6nYgO499F3qRKkeHNaTMHjG0U8pp53gRvdYLaCyRqi+IBIPuYeQJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="422792881"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="422792881"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 03:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="742588978"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="742588978"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Jun 2023 03:34:57 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6qVE-0006Tn-2d;
	Wed, 07 Jun 2023 10:34:56 +0000
Date: Wed, 7 Jun 2023 18:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 208/7747] drivers/nvme/host/pr.c:268:23-26:
 ERROR: reference preceded by free on line 278
Message-ID: <202306071816.fwqK8nOH-lkp@intel.com>
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
TO: Mike Christie <michael.christie@oracle.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Chaitanya Kulkarni <kch@nvidia.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abbd8bb42915d9ed06df11b430bf4ecb3d8ac5ad
commit: 28c97ba38ff9c00bc177887c2d8568b7115a44e0 [208/7747] nvme: Add pr_ops read_reservation support
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: microblaze-randconfig-c041-20230607 (https://download.01.org/0day-ci/archive/20230607/202306071816.fwqK8nOH-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306071816.fwqK8nOH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/host/pr.c:268:23-26: ERROR: reference preceded by free on line 278

vim +268 drivers/nvme/host/pr.c

5fd96a4e15de84 Mike Christie 2023-04-07  244  
28c97ba38ff9c0 Mike Christie 2023-04-07  245  static int nvme_pr_read_reservation(struct block_device *bdev,
28c97ba38ff9c0 Mike Christie 2023-04-07  246  		struct pr_held_reservation *resv)
28c97ba38ff9c0 Mike Christie 2023-04-07  247  {
28c97ba38ff9c0 Mike Christie 2023-04-07  248  	struct nvme_reservation_status_ext tmp_rse, *rse;
28c97ba38ff9c0 Mike Christie 2023-04-07  249  	int ret, i, num_regs;
28c97ba38ff9c0 Mike Christie 2023-04-07  250  	u32 rse_len;
28c97ba38ff9c0 Mike Christie 2023-04-07  251  	bool eds;
28c97ba38ff9c0 Mike Christie 2023-04-07  252  
28c97ba38ff9c0 Mike Christie 2023-04-07  253  get_num_regs:
28c97ba38ff9c0 Mike Christie 2023-04-07  254  	/*
28c97ba38ff9c0 Mike Christie 2023-04-07  255  	 * Get the number of registrations so we know how big to allocate
28c97ba38ff9c0 Mike Christie 2023-04-07  256  	 * the response buffer.
28c97ba38ff9c0 Mike Christie 2023-04-07  257  	 */
28c97ba38ff9c0 Mike Christie 2023-04-07  258  	ret = nvme_pr_resv_report(bdev, &tmp_rse, sizeof(tmp_rse), &eds);
28c97ba38ff9c0 Mike Christie 2023-04-07  259  	if (ret)
28c97ba38ff9c0 Mike Christie 2023-04-07  260  		return ret;
28c97ba38ff9c0 Mike Christie 2023-04-07  261  
28c97ba38ff9c0 Mike Christie 2023-04-07  262  	num_regs = get_unaligned_le16(&tmp_rse.regctl);
28c97ba38ff9c0 Mike Christie 2023-04-07  263  	if (!num_regs) {
28c97ba38ff9c0 Mike Christie 2023-04-07  264  		resv->generation = le32_to_cpu(tmp_rse.gen);
28c97ba38ff9c0 Mike Christie 2023-04-07  265  		return 0;
28c97ba38ff9c0 Mike Christie 2023-04-07  266  	}
28c97ba38ff9c0 Mike Christie 2023-04-07  267  
28c97ba38ff9c0 Mike Christie 2023-04-07 @268  	rse_len = struct_size(rse, regctl_eds, num_regs);
28c97ba38ff9c0 Mike Christie 2023-04-07  269  	rse = kzalloc(rse_len, GFP_KERNEL);
28c97ba38ff9c0 Mike Christie 2023-04-07  270  	if (!rse)
28c97ba38ff9c0 Mike Christie 2023-04-07  271  		return -ENOMEM;
28c97ba38ff9c0 Mike Christie 2023-04-07  272  
28c97ba38ff9c0 Mike Christie 2023-04-07  273  	ret = nvme_pr_resv_report(bdev, rse, rse_len, &eds);
28c97ba38ff9c0 Mike Christie 2023-04-07  274  	if (ret)
28c97ba38ff9c0 Mike Christie 2023-04-07  275  		goto free_rse;
28c97ba38ff9c0 Mike Christie 2023-04-07  276  
28c97ba38ff9c0 Mike Christie 2023-04-07  277  	if (num_regs != get_unaligned_le16(&rse->regctl)) {
28c97ba38ff9c0 Mike Christie 2023-04-07 @278  		kfree(rse);
28c97ba38ff9c0 Mike Christie 2023-04-07  279  		goto get_num_regs;
28c97ba38ff9c0 Mike Christie 2023-04-07  280  	}
28c97ba38ff9c0 Mike Christie 2023-04-07  281  
28c97ba38ff9c0 Mike Christie 2023-04-07  282  	resv->generation = le32_to_cpu(rse->gen);
28c97ba38ff9c0 Mike Christie 2023-04-07  283  	resv->type = block_pr_type_from_nvme(rse->rtype);
28c97ba38ff9c0 Mike Christie 2023-04-07  284  
28c97ba38ff9c0 Mike Christie 2023-04-07  285  	for (i = 0; i < num_regs; i++) {
28c97ba38ff9c0 Mike Christie 2023-04-07  286  		if (eds) {
28c97ba38ff9c0 Mike Christie 2023-04-07  287  			if (rse->regctl_eds[i].rcsts) {
28c97ba38ff9c0 Mike Christie 2023-04-07  288  				resv->key = le64_to_cpu(rse->regctl_eds[i].rkey);
28c97ba38ff9c0 Mike Christie 2023-04-07  289  				break;
28c97ba38ff9c0 Mike Christie 2023-04-07  290  			}
28c97ba38ff9c0 Mike Christie 2023-04-07  291  		} else {
28c97ba38ff9c0 Mike Christie 2023-04-07  292  			struct nvme_reservation_status *rs;
28c97ba38ff9c0 Mike Christie 2023-04-07  293  
28c97ba38ff9c0 Mike Christie 2023-04-07  294  			rs = (struct nvme_reservation_status *)rse;
28c97ba38ff9c0 Mike Christie 2023-04-07  295  			if (rs->regctl_ds[i].rcsts) {
28c97ba38ff9c0 Mike Christie 2023-04-07  296  				resv->key = le64_to_cpu(rs->regctl_ds[i].rkey);
28c97ba38ff9c0 Mike Christie 2023-04-07  297  				break;
28c97ba38ff9c0 Mike Christie 2023-04-07  298  			}
28c97ba38ff9c0 Mike Christie 2023-04-07  299  		}
28c97ba38ff9c0 Mike Christie 2023-04-07  300  	}
28c97ba38ff9c0 Mike Christie 2023-04-07  301  
28c97ba38ff9c0 Mike Christie 2023-04-07  302  free_rse:
28c97ba38ff9c0 Mike Christie 2023-04-07  303  	kfree(rse);
28c97ba38ff9c0 Mike Christie 2023-04-07  304  	return ret;
28c97ba38ff9c0 Mike Christie 2023-04-07  305  }
28c97ba38ff9c0 Mike Christie 2023-04-07  306  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
