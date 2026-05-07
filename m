Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257428E0
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 00:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778115130; cv=none; b=t+L/pWdm1BC2ZDLDGsANoxYeX103SqFw6etj79r6UVA2lAMTzwbm3zJn7Z9Ybsvz6E1Yn4WjWJP+TQeFug76VZiUVHyLUp30WfyYD0iNoCSxW2Pr07x1PuLYARMshyzWf53pbRuUjrqLSNoft4eaFobakRQ1iDgw6F0THxx/3ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778115130; c=relaxed/simple;
	bh=zTZS2lMKnyunxZpWUaa38OhwErhcUtzleGcxWXVjC1c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rrU8Nl6OMo4479M7AcMa7TVydygUdT0wW6hvElDdWqJI/LC+tzK/tngi0jMhQa3CYGh5W3eEC5RFlYO/TpVGCmvgMzsbOzRMSBNFhAhNnaim9Zmi3zgfAKv3hh8yyLnjEVWideLv46F10bcJAGVtvHndXdj9elWj4Wtip8A7xXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noHt+B3b; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noHt+B3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778115129; x=1809651129;
  h=date:from:to:cc:subject:message-id;
  bh=zTZS2lMKnyunxZpWUaa38OhwErhcUtzleGcxWXVjC1c=;
  b=noHt+B3bLHwDoXG1oGr1m+YGk1ODq2RlQuG/+4dgV6rQJ49dBk9Ystgx
   kCeZQFAJU2Ph96bJvmapb4IqT7OCWgL3xdCC/085evnG4QssjczyxuSPz
   bAuVR0oM8kijcl6ru9cMoCIpGA0Ljka71WAWs9IDGSci/yDBsdwMdCqgk
   1kRMM4Ru21ZcaQeK4tIwPg31iCmYB2V5GHS9viNI+TQTb2raub6wvjo8i
   20zWH9SgALGofDKqOmchaAIgtxFiJXCOAaKdjiPpPCdMxYF6J+4dAm4Mt
   YoP+hGJ/qK/Fnz3+mgyg6UQa59tZzQeKTjxGL3n5jZfC/NAr3bSsIWsEJ
   w==;
X-CSE-ConnectionGUID: 0xoaKVxQR4y5CSXZCuo3IA==
X-CSE-MsgGUID: H3L1SWZ6RyKm+8Km96+FKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78209675"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="78209675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 17:52:08 -0700
X-CSE-ConnectionGUID: IbAIipCiTuyvntE9WH3HCw==
X-CSE-MsgGUID: hMUAZoRkSWaCqqdemIQ3QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="260002228"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 May 2026 17:52:07 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKmyC-000000001Nv-3XGu;
	Thu, 07 May 2026 00:52:04 +0000
Date: Thu, 07 May 2026 08:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:nvme-raw-queues 5/16] drivers/nvme/host/core.c:3898
 nvme_register_queue() warn: can 'ns' even be NULL?
Message-ID: <202605070857.pdb1hejF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anuj Gupta <anuj20.g@samsung.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Kanchan Joshi <joshi.k@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: e85c56d3378904ba7950d8880e93df4f219b058f [5/16] nvme: wire-up register/unregister queue f_op callback
:::::: branch date: 15 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260507/202605070857.pdb1hejF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605070857.pdb1hejF-lkp@intel.com/

smatch warnings:
drivers/nvme/host/core.c:3898 nvme_register_queue() warn: can 'ns' even be NULL?
drivers/nvme/host/core.c:3910 nvme_unregister_queue() warn: can 'ns' even be NULL?

vim +/ns +3898 drivers/nvme/host/core.c

2637baed78010e Minwoo Im  2021-04-21  3892  
e85c56d3378904 Anuj Gupta 2023-04-29  3893  int nvme_register_queue(struct file *file)
e85c56d3378904 Anuj Gupta 2023-04-29  3894  {
e85c56d3378904 Anuj Gupta 2023-04-29  3895  	struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
e85c56d3378904 Anuj Gupta 2023-04-29  3896  			struct nvme_ns, cdev);
e85c56d3378904 Anuj Gupta 2023-04-29  3897  	struct nvme_ctrl *ctrl = ns->ctrl;
e85c56d3378904 Anuj Gupta 2023-04-29 @3898  	struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
e85c56d3378904 Anuj Gupta 2023-04-29  3899  
e85c56d3378904 Anuj Gupta 2023-04-29  3900  	if (q->mq_ops && q->mq_ops->register_queue)
e85c56d3378904 Anuj Gupta 2023-04-29  3901  		return q->mq_ops->register_queue(ns);
e85c56d3378904 Anuj Gupta 2023-04-29  3902  	return -EINVAL;
e85c56d3378904 Anuj Gupta 2023-04-29  3903  }
e85c56d3378904 Anuj Gupta 2023-04-29  3904  
e85c56d3378904 Anuj Gupta 2023-04-29  3905  int nvme_unregister_queue(struct file *file, int qid)
e85c56d3378904 Anuj Gupta 2023-04-29  3906  {
e85c56d3378904 Anuj Gupta 2023-04-29  3907  	struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
e85c56d3378904 Anuj Gupta 2023-04-29  3908  			struct nvme_ns, cdev);
e85c56d3378904 Anuj Gupta 2023-04-29  3909  	struct nvme_ctrl *ctrl = ns->ctrl;
e85c56d3378904 Anuj Gupta 2023-04-29 @3910  	struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
e85c56d3378904 Anuj Gupta 2023-04-29  3911  
e85c56d3378904 Anuj Gupta 2023-04-29  3912  	if (q->mq_ops && q->mq_ops->unregister_queue)
e85c56d3378904 Anuj Gupta 2023-04-29  3913  		return q->mq_ops->unregister_queue(ns, qid);
e85c56d3378904 Anuj Gupta 2023-04-29  3914  	return -EINVAL;
e85c56d3378904 Anuj Gupta 2023-04-29  3915  }
e85c56d3378904 Anuj Gupta 2023-04-29  3916  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
