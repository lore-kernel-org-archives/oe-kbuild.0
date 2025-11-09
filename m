Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927707082F
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762711226; cv=none; b=DtuuoVxkI2OSSXsOQvVTnwXW2/tzpWCa4N9nbSfzhyWxrProOUzxM5mvNv1QdTqAU5jnJ5awqguzsMavGi49+lD52w8yfo2Yf6dJVHiiUIMP+zkZD6X1wls1++iqFMDcaEQ5fvXzVA4SfixnvqDdI/GjxPac7F+Nlx2KklbQtYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762711226; c=relaxed/simple;
	bh=aZBqimbvlT6ArIe+Txr1ereVlFOLuxdx1u5/h57TKKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWEtD/945S6RJtjpFMUG1LqQA6ZQl3hi+31if9MXTdBumwOKJ6q8C5kI1E1HujwcCZKnL4BQNBJKJMwMtgZdAQ3YXu6M0sU+udQ1bgo3g9EhhIwjeP5mqxsT+MIoTgz/XYJUOvqm01eRd1uGyfTFg8Yhvn/oBHaCcZM4HCk6dTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOhIUPSo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOhIUPSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762711224; x=1794247224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZBqimbvlT6ArIe+Txr1ereVlFOLuxdx1u5/h57TKKU=;
  b=cOhIUPSoAeDtvIf1no1DC1h6iRGnW4bHUJ+DrfP/kB5yBj34NFqXxXRd
   MmbpL8MlDUq0tseMmsjJo0JNFnZa57X0kBl7U6KZ4swKCZrxkWWAyt0lA
   k/tJJZpG/Og/Ybvlw5OlZKJpm+iWV+UgenvoCFNzaBkglTvRNvcD7otqh
   UZXPwqNRzgyqYFgkNFR6DIF+3KyaO5LgpPFateeLUlsPpMYdJnKr68/HS
   Z1C+/XF9aAFGMCGodItiJyUq+qLruoHaKfPrhgw1WwJK6xKC8LVM7CXRp
   iVLUIM9qO1OySrCoIKt3A59vr3oO7oZZplYyfJZQSYZKXhdvxRrPxqy7H
   w==;
X-CSE-ConnectionGUID: zQDPVBm2Q6m3juvIrsQD5A==
X-CSE-MsgGUID: cF3kiNNuTe+lDF3xah+pTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="52337652"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="52337652"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 10:00:24 -0800
X-CSE-ConnectionGUID: igBVSZQqTMOlBKbGzLMJgw==
X-CSE-MsgGUID: Q5/qKsxqSLGuJVlq1QAkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="193510227"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2025 10:00:23 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI9i8-0002IB-1p;
	Sun, 09 Nov 2025 18:00:20 +0000
Date: Mon, 10 Nov 2025 01:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] block: use bio_alloc_bioset for passthru IO by
 default
Message-ID: <202511100143.SSAPEoCI-lkp@intel.com>
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
In-Reply-To: <20251107020557.10097-2-changfengnan@bytedance.com>
References: <20251107020557.10097-2-changfengnan@bytedance.com>
TO: Fengnan Chang <changfengnan@bytedance.com>
TO: axboe@kernel.dk
TO: viro@zeniv.linux.org.uk
TO: brauner@kernel.org
TO: jack@suse.cz
TO: asml.silence@gmail.com
TO: willy@infradead.org
TO: djwong@kernel.org
TO: hch@infradead.org
TO: ritesh.list@gmail.com
TO: linux-fsdevel@vger.kernel.org
TO: io-uring@vger.kernel.org
TO: linux-xfs@vger.kernel.org
TO: linux-ext4@vger.kernel.org
TO: linux-block@vger.kernel.org
TO: ming.lei@redhat.com
TO: linux-nvme@lists.infradead.org
CC: Fengnan Chang <changfengnan@bytedance.com>

Hi Fengnan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4a0c9b3391999818e2c5b93719699b255be1f682]

url:    https://github.com/intel-lab-lkp/linux/commits/Fengnan-Chang/block-use-bio_alloc_bioset-for-passthru-IO-by-default/20251107-100851
base:   4a0c9b3391999818e2c5b93719699b255be1f682
patch link:    https://lore.kernel.org/r/20251107020557.10097-2-changfengnan%40bytedance.com
patch subject: [PATCH v2 1/2] block: use bio_alloc_bioset for passthru IO by default
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r072-20251108 (https://download.01.org/0day-ci/archive/20251110/202511100143.SSAPEoCI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d78e0ded5215824a63ac04fb87effd9eacf875eb)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511100143.SSAPEoCI-lkp@intel.com/

smatch warnings:
drivers/nvme/host/ioctl.c:506 nvme_uring_cmd_io() error: uninitialized symbol 'rq_flags'.

vim +/rq_flags +506 drivers/nvme/host/ioctl.c

c0a7ba77e81b84 Jens Axboe          2022-09-21  437  
456cba386e94f2 Kanchan Joshi       2022-05-11  438  static int nvme_uring_cmd_io(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
f569add47119fa Anuj Gupta          2022-05-11  439  		struct io_uring_cmd *ioucmd, unsigned int issue_flags, bool vec)
456cba386e94f2 Kanchan Joshi       2022-05-11  440  {
456cba386e94f2 Kanchan Joshi       2022-05-11  441  	struct nvme_uring_cmd_pdu *pdu = nvme_uring_cmd_pdu(ioucmd);
fd9b8547bc5c34 Breno Leitao        2023-05-04  442  	const struct nvme_uring_cmd *cmd = io_uring_sqe_cmd(ioucmd->sqe);
456cba386e94f2 Kanchan Joshi       2022-05-11  443  	struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
456cba386e94f2 Kanchan Joshi       2022-05-11  444  	struct nvme_uring_data d;
456cba386e94f2 Kanchan Joshi       2022-05-11  445  	struct nvme_command c;
38808af53c6e72 Caleb Sander Mateos 2025-03-28  446  	struct iov_iter iter;
38808af53c6e72 Caleb Sander Mateos 2025-03-28  447  	struct iov_iter *map_iter = NULL;
456cba386e94f2 Kanchan Joshi       2022-05-11  448  	struct request *req;
070157fe67aee9 Fengnan Chang       2025-11-07  449  	blk_opf_t rq_flags;
456cba386e94f2 Kanchan Joshi       2022-05-11  450  	blk_mq_req_flags_t blk_flags = 0;
470e900c8036ff Kanchan Joshi       2022-09-30  451  	int ret;
456cba386e94f2 Kanchan Joshi       2022-05-11  452  
456cba386e94f2 Kanchan Joshi       2022-05-11  453  	c.common.opcode = READ_ONCE(cmd->opcode);
456cba386e94f2 Kanchan Joshi       2022-05-11  454  	c.common.flags = READ_ONCE(cmd->flags);
456cba386e94f2 Kanchan Joshi       2022-05-11  455  	if (c.common.flags)
456cba386e94f2 Kanchan Joshi       2022-05-11  456  		return -EINVAL;
456cba386e94f2 Kanchan Joshi       2022-05-11  457  
456cba386e94f2 Kanchan Joshi       2022-05-11  458  	c.common.command_id = 0;
456cba386e94f2 Kanchan Joshi       2022-05-11  459  	c.common.nsid = cpu_to_le32(cmd->nsid);
456cba386e94f2 Kanchan Joshi       2022-05-11  460  	if (!nvme_validate_passthru_nsid(ctrl, ns, le32_to_cpu(c.common.nsid)))
456cba386e94f2 Kanchan Joshi       2022-05-11  461  		return -EINVAL;
456cba386e94f2 Kanchan Joshi       2022-05-11  462  
456cba386e94f2 Kanchan Joshi       2022-05-11  463  	c.common.cdw2[0] = cpu_to_le32(READ_ONCE(cmd->cdw2));
456cba386e94f2 Kanchan Joshi       2022-05-11  464  	c.common.cdw2[1] = cpu_to_le32(READ_ONCE(cmd->cdw3));
456cba386e94f2 Kanchan Joshi       2022-05-11  465  	c.common.metadata = 0;
456cba386e94f2 Kanchan Joshi       2022-05-11  466  	c.common.dptr.prp1 = c.common.dptr.prp2 = 0;
456cba386e94f2 Kanchan Joshi       2022-05-11  467  	c.common.cdw10 = cpu_to_le32(READ_ONCE(cmd->cdw10));
456cba386e94f2 Kanchan Joshi       2022-05-11  468  	c.common.cdw11 = cpu_to_le32(READ_ONCE(cmd->cdw11));
456cba386e94f2 Kanchan Joshi       2022-05-11  469  	c.common.cdw12 = cpu_to_le32(READ_ONCE(cmd->cdw12));
456cba386e94f2 Kanchan Joshi       2022-05-11  470  	c.common.cdw13 = cpu_to_le32(READ_ONCE(cmd->cdw13));
456cba386e94f2 Kanchan Joshi       2022-05-11  471  	c.common.cdw14 = cpu_to_le32(READ_ONCE(cmd->cdw14));
456cba386e94f2 Kanchan Joshi       2022-05-11  472  	c.common.cdw15 = cpu_to_le32(READ_ONCE(cmd->cdw15));
456cba386e94f2 Kanchan Joshi       2022-05-11  473  
7d9d7d59d44b7e Christoph Hellwig   2023-06-08  474  	if (!nvme_cmd_allowed(ns, &c, 0, ioucmd->file->f_mode & FMODE_WRITE))
855b7717f44b13 Kanchan Joshi       2022-10-31  475  		return -EACCES;
855b7717f44b13 Kanchan Joshi       2022-10-31  476  
456cba386e94f2 Kanchan Joshi       2022-05-11  477  	d.metadata = READ_ONCE(cmd->metadata);
456cba386e94f2 Kanchan Joshi       2022-05-11  478  	d.addr = READ_ONCE(cmd->addr);
456cba386e94f2 Kanchan Joshi       2022-05-11  479  	d.data_len = READ_ONCE(cmd->data_len);
456cba386e94f2 Kanchan Joshi       2022-05-11  480  	d.metadata_len = READ_ONCE(cmd->metadata_len);
456cba386e94f2 Kanchan Joshi       2022-05-11  481  	d.timeout_ms = READ_ONCE(cmd->timeout_ms);
456cba386e94f2 Kanchan Joshi       2022-05-11  482  
38808af53c6e72 Caleb Sander Mateos 2025-03-28  483  	if (d.data_len && (ioucmd->flags & IORING_URING_CMD_FIXED)) {
3c12a8939e0474 Pavel Begunkov      2025-05-20  484  		int ddir = nvme_is_write(&c) ? WRITE : READ;
38808af53c6e72 Caleb Sander Mateos 2025-03-28  485  
3c12a8939e0474 Pavel Begunkov      2025-05-20  486  		if (vec)
3c12a8939e0474 Pavel Begunkov      2025-05-20  487  			ret = io_uring_cmd_import_fixed_vec(ioucmd,
3c12a8939e0474 Pavel Begunkov      2025-05-20  488  					u64_to_user_ptr(d.addr), d.data_len,
3c12a8939e0474 Pavel Begunkov      2025-05-20  489  					ddir, &iter, issue_flags);
3c12a8939e0474 Pavel Begunkov      2025-05-20  490  		else
38808af53c6e72 Caleb Sander Mateos 2025-03-28  491  			ret = io_uring_cmd_import_fixed(d.addr, d.data_len,
3c12a8939e0474 Pavel Begunkov      2025-05-20  492  					ddir, &iter, ioucmd, issue_flags);
38808af53c6e72 Caleb Sander Mateos 2025-03-28  493  		if (ret < 0)
38808af53c6e72 Caleb Sander Mateos 2025-03-28  494  			return ret;
38808af53c6e72 Caleb Sander Mateos 2025-03-28  495  
38808af53c6e72 Caleb Sander Mateos 2025-03-28  496  		map_iter = &iter;
38808af53c6e72 Caleb Sander Mateos 2025-03-28  497  	}
38808af53c6e72 Caleb Sander Mateos 2025-03-28  498  
456cba386e94f2 Kanchan Joshi       2022-05-11  499  	if (issue_flags & IO_URING_F_NONBLOCK) {
888545cb43d763 Anuj Gupta          2023-01-17  500  		rq_flags |= REQ_NOWAIT;
456cba386e94f2 Kanchan Joshi       2022-05-11  501  		blk_flags = BLK_MQ_REQ_NOWAIT;
456cba386e94f2 Kanchan Joshi       2022-05-11  502  	}
585079b6e42538 Kanchan Joshi       2022-08-23  503  	if (issue_flags & IO_URING_F_IOPOLL)
585079b6e42538 Kanchan Joshi       2022-08-23  504  		rq_flags |= REQ_POLLED;
456cba386e94f2 Kanchan Joshi       2022-05-11  505  
470e900c8036ff Kanchan Joshi       2022-09-30 @506  	req = nvme_alloc_user_request(q, &c, rq_flags, blk_flags);
456cba386e94f2 Kanchan Joshi       2022-05-11  507  	if (IS_ERR(req))
456cba386e94f2 Kanchan Joshi       2022-05-11  508  		return PTR_ERR(req);
470e900c8036ff Kanchan Joshi       2022-09-30  509  	req->timeout = d.timeout_ms ? msecs_to_jiffies(d.timeout_ms) : 0;
470e900c8036ff Kanchan Joshi       2022-09-30  510  
99fde895ff56ac Xinyu Zhang         2025-02-27  511  	if (d.data_len) {
38808af53c6e72 Caleb Sander Mateos 2025-03-28  512  		ret = nvme_map_user_request(req, d.addr, d.data_len,
38808af53c6e72 Caleb Sander Mateos 2025-03-28  513  			nvme_to_user_ptr(d.metadata), d.metadata_len,
c4b680ac286382 Pavel Begunkov      2025-05-20  514  			map_iter, vec ? NVME_IOCTL_VEC : 0);
470e900c8036ff Kanchan Joshi       2022-09-30  515  		if (ret)
cd683de63e1d7c Caleb Sander Mateos 2025-03-28  516  			goto out_free_req;
470e900c8036ff Kanchan Joshi       2022-09-30  517  	}
456cba386e94f2 Kanchan Joshi       2022-05-11  518  
456cba386e94f2 Kanchan Joshi       2022-05-11  519  	/* to free bio on completion, as req->bio will be null at that time */
456cba386e94f2 Kanchan Joshi       2022-05-11  520  	pdu->bio = req->bio;
d6aacee9255e7f Keith Busch         2023-11-30  521  	pdu->req = req;
c0a7ba77e81b84 Jens Axboe          2022-09-21  522  	req->end_io_data = ioucmd;
c0a7ba77e81b84 Jens Axboe          2022-09-21  523  	req->end_io = nvme_uring_cmd_end_io;
e2e530867245d0 Christoph Hellwig   2022-05-24  524  	blk_execute_rq_nowait(req, false);
456cba386e94f2 Kanchan Joshi       2022-05-11  525  	return -EIOCBQUEUED;
cd683de63e1d7c Caleb Sander Mateos 2025-03-28  526  
cd683de63e1d7c Caleb Sander Mateos 2025-03-28  527  out_free_req:
cd683de63e1d7c Caleb Sander Mateos 2025-03-28  528  	blk_mq_free_request(req);
cd683de63e1d7c Caleb Sander Mateos 2025-03-28  529  	return ret;
456cba386e94f2 Kanchan Joshi       2022-05-11  530  }
456cba386e94f2 Kanchan Joshi       2022-05-11  531  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
