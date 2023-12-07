Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D178C1C3C
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFDfSR/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701919674; x=1733455674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3cPo9Mntpe9lqVBOWOODCjNEj2QolKYyW/0zWWW8d5c=;
  b=NFDfSR/Oxo047IMW1eRYGJeilIJGP8EzmS0k+1F3NlrpvwublcYTOdZN
   1a0VZNRG+2hHHHs1nyrdxZgMht7j6caFLhtgdn5tIw4dLVVf8xvUsLGQ/
   IEXuVCCEwBNKLDOOr2UYRrL4tQMMZcyPqY3QxtVHTXJx/quB01U/yMJcv
   l4R01ym75lZYOiF8aoJMm/cbCamOSwoZvE9/D/xOEv0J3Lmq3OuGrExgZ
   37Mv8LempeQBCSsvLV9KqIkkHfDftBSfdmb3V8pLwTCIRnR1Ins2yRovf
   q/Gxjd05jdUqc+AgINw9Me8FmmE+qZboiqVGkm6X+lFvyadSuTCwWP7vB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="398046576"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="398046576"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 19:27:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915416771"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="915416771"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2023 19:27:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB53F-000Bnq-2g;
	Thu, 07 Dec 2023 03:27:49 +0000
Date: Thu, 7 Dec 2023 11:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/4] nvme: move ns id info to struct nvme_ns_head
Message-ID: <202312071105.jkXzp8v9-lkp@intel.com>
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
In-Reply-To: <20231206081244.32733-4-dwagner@suse.de>
References: <20231206081244.32733-4-dwagner@suse.de>
TO: Daniel Wagner <dwagner@suse.de>
TO: linux-nvme@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Keith Busch <kbusch@kernel.org>
CC: Christoph Hellwig <hch@lst.de>
CC: Sagi Grimberg <sagi@grimberg.me>
CC: Hannes Reinecke <hare@suse.de>
CC: Daniel Wagner <dwagner@suse.de>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7-rc4]
[also build test WARNING on linus/master next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Wagner/nvme-lookup-ctrl-from-request-instead-from-namespace/20231206-161455
base:   v6.7-rc4
patch link:    https://lore.kernel.org/r/20231206081244.32733-4-dwagner%40suse.de
patch subject: [PATCH v3 3/4] nvme: move ns id info to struct nvme_ns_head
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20231207 (https://download.01.org/0day-ci/archive/20231207/202312071105.jkXzp8v9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312071105.jkXzp8v9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312071105.jkXzp8v9-lkp@intel.com/

smatch warnings:
drivers/nvme/target/passthru.c:354 nvmet_passthru_execute_cmd() warn: variable dereferenced before check 'ns' (see line 342)

vim +/ns +354 drivers/nvme/target/passthru.c

c1fef73f793b7f Logan Gunthorpe    2020-07-24  291  
c1fef73f793b7f Logan Gunthorpe    2020-07-24  292  static void nvmet_passthru_execute_cmd(struct nvmet_req *req)
c1fef73f793b7f Logan Gunthorpe    2020-07-24  293  {
ab7a2737ac5acd Christoph Hellwig  2021-08-27  294  	struct nvme_ctrl *ctrl = nvmet_req_subsys(req)->passthru_ctrl;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  295  	struct request_queue *q = ctrl->admin_q;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  296  	struct nvme_ns *ns = NULL;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  297  	struct request *rq = NULL;
47e9730c26a4a5 Chaitanya Kulkarni 2020-11-09  298  	unsigned int timeout;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  299  	u32 effects;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  300  	u16 status;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  301  	int ret;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  302  
c1fef73f793b7f Logan Gunthorpe    2020-07-24  303  	if (likely(req->sq->qid != 0)) {
c1fef73f793b7f Logan Gunthorpe    2020-07-24  304  		u32 nsid = le32_to_cpu(req->cmd->common.nsid);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  305  
c1fef73f793b7f Logan Gunthorpe    2020-07-24  306  		ns = nvme_find_get_ns(ctrl, nsid);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  307  		if (unlikely(!ns)) {
c1fef73f793b7f Logan Gunthorpe    2020-07-24  308  			pr_err("failed to get passthru ns nsid:%u\n", nsid);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  309  			status = NVME_SC_INVALID_NS | NVME_SC_DNR;
4db69a3d7cfe31 Chaitanya Kulkarni 2020-08-06  310  			goto out;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  311  		}
c1fef73f793b7f Logan Gunthorpe    2020-07-24  312  
c1fef73f793b7f Logan Gunthorpe    2020-07-24  313  		q = ns->queue;
20c2c3bb83f26c Chaitanya Kulkarni 2021-02-09  314  		timeout = nvmet_req_subsys(req)->io_timeout;
a2f6a2b8ce43db Chaitanya Kulkarni 2020-11-09  315  	} else {
20c2c3bb83f26c Chaitanya Kulkarni 2021-02-09  316  		timeout = nvmet_req_subsys(req)->admin_timeout;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  317  	}
c1fef73f793b7f Logan Gunthorpe    2020-07-24  318  
e559398f47e090 Christoph Hellwig  2022-03-15  319  	rq = blk_mq_alloc_request(q, nvme_req_op(req->cmd), 0);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  320  	if (IS_ERR(rq)) {
c1fef73f793b7f Logan Gunthorpe    2020-07-24  321  		status = NVME_SC_INTERNAL;
4db69a3d7cfe31 Chaitanya Kulkarni 2020-08-06  322  		goto out_put_ns;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  323  	}
e559398f47e090 Christoph Hellwig  2022-03-15  324  	nvme_init_request(rq, req->cmd);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  325  
a2f6a2b8ce43db Chaitanya Kulkarni 2020-11-09  326  	if (timeout)
a2f6a2b8ce43db Chaitanya Kulkarni 2020-11-09  327  		rq->timeout = timeout;
a2f6a2b8ce43db Chaitanya Kulkarni 2020-11-09  328  
c1fef73f793b7f Logan Gunthorpe    2020-07-24  329  	if (req->sg_cnt) {
c1fef73f793b7f Logan Gunthorpe    2020-07-24  330  		ret = nvmet_passthru_map_sg(req, rq);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  331  		if (unlikely(ret)) {
c1fef73f793b7f Logan Gunthorpe    2020-07-24  332  			status = NVME_SC_INTERNAL;
a2138fd49467d0 Chaitanya Kulkarni 2020-08-06  333  			goto out_put_req;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  334  		}
c1fef73f793b7f Logan Gunthorpe    2020-07-24  335  	}
c1fef73f793b7f Logan Gunthorpe    2020-07-24  336  
c1fef73f793b7f Logan Gunthorpe    2020-07-24  337  	/*
2a459f6933e1c4 Christoph Hellwig  2022-12-21  338  	 * If a command needs post-execution fixups, or there are any
2a459f6933e1c4 Christoph Hellwig  2022-12-21  339  	 * non-trivial effects, make sure to execute the command synchronously
2a459f6933e1c4 Christoph Hellwig  2022-12-21  340  	 * in a workqueue so that nvme_passthru_end gets called.
c1fef73f793b7f Logan Gunthorpe    2020-07-24  341  	 */
a754bb00c0d393 Daniel Wagner      2023-12-06 @342  	effects = nvme_command_effects(ctrl, ns->head, req->cmd->common.opcode);
2a459f6933e1c4 Christoph Hellwig  2022-12-21  343  	if (req->p.use_workqueue ||
2a459f6933e1c4 Christoph Hellwig  2022-12-21  344  	    (effects & ~(NVME_CMD_EFFECTS_CSUPP | NVME_CMD_EFFECTS_LBCC))) {
c1fef73f793b7f Logan Gunthorpe    2020-07-24  345  		INIT_WORK(&req->p.work, nvmet_passthru_execute_cmd_work);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  346  		req->p.rq = rq;
8832cf922151e9 Sagi Grimberg      2022-03-21  347  		queue_work(nvmet_wq, &req->p.work);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  348  	} else {
e2e530867245d0 Christoph Hellwig  2022-05-24  349  		rq->end_io = nvmet_passthru_req_done;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  350  		rq->end_io_data = req;
e2e530867245d0 Christoph Hellwig  2022-05-24  351  		blk_execute_rq_nowait(rq, false);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  352  	}
c1fef73f793b7f Logan Gunthorpe    2020-07-24  353  
c1fef73f793b7f Logan Gunthorpe    2020-07-24 @354  	if (ns)
c1fef73f793b7f Logan Gunthorpe    2020-07-24  355  		nvme_put_ns(ns);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  356  
c1fef73f793b7f Logan Gunthorpe    2020-07-24  357  	return;
c1fef73f793b7f Logan Gunthorpe    2020-07-24  358  
a2138fd49467d0 Chaitanya Kulkarni 2020-08-06  359  out_put_req:
7ee51cf60a90c2 Chaitanya Kulkarni 2020-08-06  360  	blk_mq_free_request(rq);
4db69a3d7cfe31 Chaitanya Kulkarni 2020-08-06  361  out_put_ns:
c1fef73f793b7f Logan Gunthorpe    2020-07-24  362  	if (ns)
c1fef73f793b7f Logan Gunthorpe    2020-07-24  363  		nvme_put_ns(ns);
4db69a3d7cfe31 Chaitanya Kulkarni 2020-08-06  364  out:
c1fef73f793b7f Logan Gunthorpe    2020-07-24  365  	nvmet_req_complete(req, status);
c1fef73f793b7f Logan Gunthorpe    2020-07-24  366  }
c1fef73f793b7f Logan Gunthorpe    2020-07-24  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
