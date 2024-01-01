Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51278DDC9
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jan 2024 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K01W7kuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704140863; x=1735676863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2NwMEq3plsWfLxyxy5qbd/7EAzuoY7Mu0GdAB7x5fhQ=;
  b=K01W7kucv1IEyTgw9BVIBOEoMyxwf1zHox6W4VyF9pXrk3s4KN6LGlJj
   W2TEt5X//6YNObJSZ1iMqYstZ/54PonxcvvdWXBbd62NOoNT+EoEiRqQt
   Z9KgwMLWFiPS9MJjEk+4mm+x0Kdfjv/5WykBO5UK7hz7523+r8+Fs9Kh9
   7tQOYLnkYsJ2fWLSZmxMFrBZUzoksTmHf3lZCVLpDqowiPhSd6AzUvnbO
   Wfmhs+XPzxKkuyBFZC5Xwb85ob03SyO7u34pc32S3G5Kob08qv03UoLdO
   /fLgkEuy0N+pX8er44ir/QtpCNOdOmHhFIf4I0Qt9eqipYski1t9AoqVS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="18357728"
X-IronPort-AV: E=Sophos;i="6.04,323,1695711600"; 
   d="scan'208";a="18357728"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 12:27:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="845387669"
X-IronPort-AV: E=Sophos;i="6.04,323,1695711600"; 
   d="scan'208";a="845387669"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 01 Jan 2024 12:27:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKOss-000KW0-2v;
	Mon, 01 Jan 2024 20:27:38 +0000
Date: Tue, 2 Jan 2024 04:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/nvme/host/pr.c:268:23-26: ERROR: reference preceded by free
 on line 278
Message-ID: <202401020453.zNhOWCxA-lkp@intel.com>
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
TO: Mike Christie <michael.christie@oracle.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Chaitanya Kulkarni <kch@nvidia.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   610a9b8f49fbcf1100716370d3b5f6f884a2835a
commit: 28c97ba38ff9c00bc177887c2d8568b7115a44e0 nvme: Add pr_ops read_reservation support
date:   9 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 months ago
config: hexagon-randconfig-r052-20231228 (https://download.01.org/0day-ci/archive/20240102/202401020453.zNhOWCxA-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401020453.zNhOWCxA-lkp@intel.com/

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
