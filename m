Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA98929CEF
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731048956; cv=none; b=luyH2RxWYB4Wxck0q0dGr7lGLQ3le59SSlTibcxjJgK0enn/c6COh5Z78aUOJrVJzTN807Qm6k2Sf2J1eMFYexFkBFOE06JHLaydLk0kAh/NMhqUvTRzYIc7rczz1UiufXsXPQccCgWHHmZI1NEirLRPOV5DobJTWYZxGTXErLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731048956; c=relaxed/simple;
	bh=jlPcjXfll2clA1qiR+bX3tlWm/THrtMT66bBsYiBx+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bCqpJ4Rh6nUo3FZPg0HLScz9GtV1LIz96CiPKblwVp4JgPmMqz+IVpcPk/5pGtNQ8MR1p2dxj1WpZF67yjUFKhmJMSCIj/P4pAi74fiFRFRCXYge1mPo1OWH3rP3YbphZ1LcUof5I2XgSKtNJEa2khuBFKVVezwuHw7r8xTNnFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKb9Wcbg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKb9Wcbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731048955; x=1762584955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jlPcjXfll2clA1qiR+bX3tlWm/THrtMT66bBsYiBx+Y=;
  b=TKb9Wcbgv3iKhXinF09f8BEEswUasLGM9a1RprPakq+y9UzKpK3C/N8X
   H7rKSZ04HzVdI3UohdvQyiqAAvUudMt0oPHXLItPF4PQ0hq1ssF25B0KH
   BXaD9N/9xXtJgnXMX7BRjg1+fUK5MQ/eVTiHcj/wouIqclFN8rHuOhdYf
   nq0Bw4oERHJwrRf5V9EF7jIE5IAdEPb+YjZiFqlZ9Fd2urfjsXlav929u
   aQOyLwLJcETAN7SZljNv80z6ZalA7VQUJApfd/BQpFw44jV4OyX77pZ8o
   iFED4KcSp3hIYyqBC2FvQAS/riw2GdtzGfbtxpNJS/XqXms0wMFk+YoxU
   g==;
X-CSE-ConnectionGUID: z/fJsKSIR5KkAGYO8Hd97A==
X-CSE-MsgGUID: 5F9f4FZJRDiGq3jTofPgeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31024424"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="31024424"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 22:55:54 -0800
X-CSE-ConnectionGUID: KchQc4iUTGSiLKBauCIwZw==
X-CSE-MsgGUID: AgvH4YgFSpCT+LZW3ib7Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85331209"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Nov 2024 22:55:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9IuM-000r7L-1T;
	Fri, 08 Nov 2024 06:55:50 +0000
Date: Fri, 8 Nov 2024 14:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-nvme:nvme-6.13 7/7] drivers/nvme/target/pr.c:851
 nvmet_execute_pr_report() warn: potential pointer math issue ('ctrl_eds' is
 a 512 bit pointer)
Message-ID: <202411081457.mmSUxHMU-lkp@intel.com>
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
CC: linux-nvme@lists.infradead.org
TO: Guixin Liu <kanie@linux.alibaba.com>
CC: Keith Busch <kbusch@kernel.org>
CC: Dmitry Bogdanov <d.bogdanov@yadro.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Chaitanya Kulkarni <kch@nvidia.com>

tree:   git://git.infradead.org/nvme.git nvme-6.13
head:   4c0ce9416cd06e9ef0e049f7a9226707c3786b1a
commit: 4c0ce9416cd06e9ef0e049f7a9226707c3786b1a [7/7] nvmet: support reservation feature
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-141-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081457.mmSUxHMU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411081457.mmSUxHMU-lkp@intel.com/

smatch warnings:
drivers/nvme/target/pr.c:851 nvmet_execute_pr_report() warn: potential pointer math issue ('ctrl_eds' is a 512 bit pointer)

vim +851 drivers/nvme/target/pr.c

4c0ce9416cd06e Guixin Liu 2024-11-06  802  
4c0ce9416cd06e Guixin Liu 2024-11-06  803  static void nvmet_execute_pr_report(struct nvmet_req *req)
4c0ce9416cd06e Guixin Liu 2024-11-06  804  {
4c0ce9416cd06e Guixin Liu 2024-11-06  805  	u32 cdw11 = le32_to_cpu(req->cmd->common.cdw11);
4c0ce9416cd06e Guixin Liu 2024-11-06  806  	u32 cdw10 = le32_to_cpu(req->cmd->common.cdw10);
4c0ce9416cd06e Guixin Liu 2024-11-06  807  	u32 num_bytes = 4 * (cdw10 + 1); /* cdw10 is number of dwords */
4c0ce9416cd06e Guixin Liu 2024-11-06  808  	u8 eds = cdw11 & 1; /* Extended data structure, bit 00 */
4c0ce9416cd06e Guixin Liu 2024-11-06  809  	struct nvme_registered_ctrl_ext *ctrl_eds;
4c0ce9416cd06e Guixin Liu 2024-11-06  810  	struct nvme_reservation_status_ext *data;
4c0ce9416cd06e Guixin Liu 2024-11-06  811  	struct nvmet_pr *pr = &req->ns->pr;
4c0ce9416cd06e Guixin Liu 2024-11-06  812  	struct nvmet_pr_registrant *holder;
4c0ce9416cd06e Guixin Liu 2024-11-06  813  	struct nvmet_pr_registrant *reg;
4c0ce9416cd06e Guixin Liu 2024-11-06  814  	u16 num_ctrls = 0;
4c0ce9416cd06e Guixin Liu 2024-11-06  815  	u16 status;
4c0ce9416cd06e Guixin Liu 2024-11-06  816  	u8 rtype;
4c0ce9416cd06e Guixin Liu 2024-11-06  817  
4c0ce9416cd06e Guixin Liu 2024-11-06  818  	/* nvmet hostid(uuid_t) is 128 bit. */
4c0ce9416cd06e Guixin Liu 2024-11-06  819  	if (!eds) {
4c0ce9416cd06e Guixin Liu 2024-11-06  820  		req->error_loc = offsetof(struct nvme_common_command, cdw11);
4c0ce9416cd06e Guixin Liu 2024-11-06  821  		status = NVME_SC_HOST_ID_INCONSIST | NVME_STATUS_DNR;
4c0ce9416cd06e Guixin Liu 2024-11-06  822  		goto out;
4c0ce9416cd06e Guixin Liu 2024-11-06  823  	}
4c0ce9416cd06e Guixin Liu 2024-11-06  824  
4c0ce9416cd06e Guixin Liu 2024-11-06  825  	if (num_bytes < sizeof(struct nvme_reservation_status_ext)) {
4c0ce9416cd06e Guixin Liu 2024-11-06  826  		req->error_loc = offsetof(struct nvme_common_command, cdw10);
4c0ce9416cd06e Guixin Liu 2024-11-06  827  		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
4c0ce9416cd06e Guixin Liu 2024-11-06  828  		goto out;
4c0ce9416cd06e Guixin Liu 2024-11-06  829  	}
4c0ce9416cd06e Guixin Liu 2024-11-06  830  
4c0ce9416cd06e Guixin Liu 2024-11-06  831  	data = kmalloc(num_bytes, GFP_KERNEL);
4c0ce9416cd06e Guixin Liu 2024-11-06  832  	if (!data) {
4c0ce9416cd06e Guixin Liu 2024-11-06  833  		status = NVME_SC_INTERNAL;
4c0ce9416cd06e Guixin Liu 2024-11-06  834  		goto out;
4c0ce9416cd06e Guixin Liu 2024-11-06  835  	}
4c0ce9416cd06e Guixin Liu 2024-11-06  836  	memset(data, 0, num_bytes);
4c0ce9416cd06e Guixin Liu 2024-11-06  837  	data->gen = cpu_to_le32(atomic_read(&pr->generation));
4c0ce9416cd06e Guixin Liu 2024-11-06  838  	data->ptpls = 0;
4c0ce9416cd06e Guixin Liu 2024-11-06  839  	ctrl_eds = data->regctl_eds;
4c0ce9416cd06e Guixin Liu 2024-11-06  840  
4c0ce9416cd06e Guixin Liu 2024-11-06  841  	rcu_read_lock();
4c0ce9416cd06e Guixin Liu 2024-11-06  842  	holder = rcu_dereference(pr->holder);
4c0ce9416cd06e Guixin Liu 2024-11-06  843  	rtype = holder ? holder->rtype : 0;
4c0ce9416cd06e Guixin Liu 2024-11-06  844  	data->rtype = rtype;
4c0ce9416cd06e Guixin Liu 2024-11-06  845  
4c0ce9416cd06e Guixin Liu 2024-11-06  846  	list_for_each_entry_rcu(reg, &pr->registrant_list, entry) {
4c0ce9416cd06e Guixin Liu 2024-11-06  847  		num_ctrls++;
4c0ce9416cd06e Guixin Liu 2024-11-06  848  		/*
4c0ce9416cd06e Guixin Liu 2024-11-06  849  		 * continue to get the number of all registrans.
4c0ce9416cd06e Guixin Liu 2024-11-06  850  		 */
4c0ce9416cd06e Guixin Liu 2024-11-06 @851  		if ((void *)(ctrl_eds + sizeof(*ctrl_eds)) >
4c0ce9416cd06e Guixin Liu 2024-11-06  852  			(void *)(data + num_bytes))
4c0ce9416cd06e Guixin Liu 2024-11-06  853  			continue;
4c0ce9416cd06e Guixin Liu 2024-11-06  854  		/*
4c0ce9416cd06e Guixin Liu 2024-11-06  855  		 * Dynamic controller, set cntlid to 0xffff.
4c0ce9416cd06e Guixin Liu 2024-11-06  856  		 */
4c0ce9416cd06e Guixin Liu 2024-11-06  857  		ctrl_eds->cntlid = NVME_CNTLID_DYNAMIC;
4c0ce9416cd06e Guixin Liu 2024-11-06  858  		if (rtype == NVME_PR_WRITE_EXCLUSIVE_ALL_REGS ||
4c0ce9416cd06e Guixin Liu 2024-11-06  859  		    rtype == NVME_PR_EXCLUSIVE_ACCESS_ALL_REGS)
4c0ce9416cd06e Guixin Liu 2024-11-06  860  			ctrl_eds->rcsts = 1;
4c0ce9416cd06e Guixin Liu 2024-11-06  861  		if (reg == holder)
4c0ce9416cd06e Guixin Liu 2024-11-06  862  			ctrl_eds->rcsts = 1;
4c0ce9416cd06e Guixin Liu 2024-11-06  863  		uuid_copy((uuid_t *)&ctrl_eds->hostid, &reg->hostid);
4c0ce9416cd06e Guixin Liu 2024-11-06  864  		ctrl_eds->rkey = cpu_to_le64(reg->rkey);
4c0ce9416cd06e Guixin Liu 2024-11-06  865  		ctrl_eds++;
4c0ce9416cd06e Guixin Liu 2024-11-06  866  	}
4c0ce9416cd06e Guixin Liu 2024-11-06  867  	rcu_read_unlock();
4c0ce9416cd06e Guixin Liu 2024-11-06  868  
4c0ce9416cd06e Guixin Liu 2024-11-06  869  	put_unaligned_le16(num_ctrls, data->regctl);
4c0ce9416cd06e Guixin Liu 2024-11-06  870  	status = nvmet_copy_to_sgl(req, 0, data, num_bytes);
4c0ce9416cd06e Guixin Liu 2024-11-06  871  	kfree(data);
4c0ce9416cd06e Guixin Liu 2024-11-06  872  out:
4c0ce9416cd06e Guixin Liu 2024-11-06  873  	nvmet_req_complete(req, status);
4c0ce9416cd06e Guixin Liu 2024-11-06  874  }
4c0ce9416cd06e Guixin Liu 2024-11-06  875  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
