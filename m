Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF80944B
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jun 2023 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687540518; x=1719076518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayZ/1Cw7oftvwjRHZVsfS4V5zTk0AvllMxJ8QQrpZKY=;
  b=jdEhP+mYFdcWa5QQPj12II8kX2HbBSbvxz4lHvc58V4OZrG3F7BwjVs8
   xyhRDutdNHCxSLwhyHs7kFR39U8D2X3DQkYFxfDP59Z40BMM9armGApXW
   QjylnDf6FbI2n7YiQUQr6JdvFQlmm//vvPNpTCyB9qtX8Gb8n59f74IP3
   SAVYvG3hahIgGeT0YcAHxr0r/Zy/DgYpquhcvCod0Zyd+5WSLlUFeczk8
   s2XMDAlqoqF2dgOqpfpE2VHIvC5QpidoqcfR+ctnWsOJIhjM78Y6rk+Ts
   arfsExXSa5/fk1YjKMl1ax1iwB8AMOTB7pKG8VJOWNbZa/lrVguOT/kZU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="364260158"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="364260158"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 10:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="962034617"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="962034617"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jun 2023 10:15:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCkNP-0008SB-1l;
	Fri, 23 Jun 2023 17:15:15 +0000
Date: Sat, 24 Jun 2023 01:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/5] nvme-fc: Make initial connect attempt synchronous
Message-ID: <202306240125.U2jdrjAY-lkp@intel.com>
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
In-Reply-To: <20230620133711.22840-5-dwagner@suse.de>
References: <20230620133711.22840-5-dwagner@suse.de>
TO: Daniel Wagner <dwagner@suse.de>
TO: linux-nvme@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-block@vger.kernel.org
CC: Chaitanya Kulkarni <kch@nvidia.com>
CC: "Shin'ichiro Kawasaki" <shinichiro@fastmail.com>
CC: Sagi Grimberg <sagi@grimberg.me>
CC: Hannes Reinecke <hare@suse.de>
CC: James Smart <jsmart2021@gmail.com>
CC: Daniel Wagner <dwagner@suse.de>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4-rc7 next-20230623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Wagner/nvme-fc-Do-not-wait-in-vain-when-unloading-module/20230620-213849
base:   linus/master
patch link:    https://lore.kernel.org/r/20230620133711.22840-5-dwagner%40suse.de
patch subject: [PATCH v2 4/5] nvme-fc: Make initial connect attempt synchronous
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-m041-20230622 (https://download.01.org/0day-ci/archive/20230624/202306240125.U2jdrjAY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240125.U2jdrjAY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306240125.U2jdrjAY-lkp@intel.com/

smatch warnings:
drivers/nvme/host/fc.c:3590 nvme_fc_init_ctrl() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +3590 drivers/nvme/host/fc.c

56d5f4f108efd4 James Smart       2017-10-20  3440  
e399441de9115c James Smart       2016-12-02  3441  static struct nvme_ctrl *
61bff8ef008845 James Smart       2017-04-23  3442  nvme_fc_init_ctrl(struct device *dev, struct nvmf_ctrl_options *opts,
e399441de9115c James Smart       2016-12-02  3443  	struct nvme_fc_lport *lport, struct nvme_fc_rport *rport)
e399441de9115c James Smart       2016-12-02  3444  {
e399441de9115c James Smart       2016-12-02  3445  	struct nvme_fc_ctrl *ctrl;
e399441de9115c James Smart       2016-12-02  3446  	unsigned long flags;
f673714a124766 James Smart       2020-10-16  3447  	int ret, idx, ctrl_loss_tmo;
e399441de9115c James Smart       2016-12-02  3448  
85e6a6adf8de7f James Smart       2017-05-05  3449  	if (!(rport->remoteport.port_role &
85e6a6adf8de7f James Smart       2017-05-05  3450  	    (FC_PORT_ROLE_NVME_DISCOVERY | FC_PORT_ROLE_NVME_TARGET))) {
85e6a6adf8de7f James Smart       2017-05-05  3451  		ret = -EBADR;
85e6a6adf8de7f James Smart       2017-05-05  3452  		goto out_fail;
85e6a6adf8de7f James Smart       2017-05-05  3453  	}
85e6a6adf8de7f James Smart       2017-05-05  3454  
56d5f4f108efd4 James Smart       2017-10-20  3455  	if (!opts->duplicate_connect &&
56d5f4f108efd4 James Smart       2017-10-20  3456  	    nvme_fc_existing_controller(rport, opts)) {
56d5f4f108efd4 James Smart       2017-10-20  3457  		ret = -EALREADY;
56d5f4f108efd4 James Smart       2017-10-20  3458  		goto out_fail;
56d5f4f108efd4 James Smart       2017-10-20  3459  	}
56d5f4f108efd4 James Smart       2017-10-20  3460  
e399441de9115c James Smart       2016-12-02  3461  	ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL);
e399441de9115c James Smart       2016-12-02  3462  	if (!ctrl) {
e399441de9115c James Smart       2016-12-02  3463  		ret = -ENOMEM;
e399441de9115c James Smart       2016-12-02  3464  		goto out_fail;
e399441de9115c James Smart       2016-12-02  3465  	}
e399441de9115c James Smart       2016-12-02  3466  
3dd83f4013f0e8 Sagi Grimberg     2022-02-14  3467  	idx = ida_alloc(&nvme_fc_ctrl_cnt, GFP_KERNEL);
e399441de9115c James Smart       2016-12-02  3468  	if (idx < 0) {
e399441de9115c James Smart       2016-12-02  3469  		ret = -ENOSPC;
8c5c660529209a James Smart       2020-04-03  3470  		goto out_free_ctrl;
e399441de9115c James Smart       2016-12-02  3471  	}
e399441de9115c James Smart       2016-12-02  3472  
f673714a124766 James Smart       2020-10-16  3473  	/*
f673714a124766 James Smart       2020-10-16  3474  	 * if ctrl_loss_tmo is being enforced and the default reconnect delay
f673714a124766 James Smart       2020-10-16  3475  	 * is being used, change to a shorter reconnect delay for FC.
f673714a124766 James Smart       2020-10-16  3476  	 */
f673714a124766 James Smart       2020-10-16  3477  	if (opts->max_reconnects != -1 &&
f673714a124766 James Smart       2020-10-16  3478  	    opts->reconnect_delay == NVMF_DEF_RECONNECT_DELAY &&
f673714a124766 James Smart       2020-10-16  3479  	    opts->reconnect_delay > NVME_FC_DEFAULT_RECONNECT_TMO) {
f673714a124766 James Smart       2020-10-16  3480  		ctrl_loss_tmo = opts->max_reconnects * opts->reconnect_delay;
f673714a124766 James Smart       2020-10-16  3481  		opts->reconnect_delay = NVME_FC_DEFAULT_RECONNECT_TMO;
f673714a124766 James Smart       2020-10-16  3482  		opts->max_reconnects = DIV_ROUND_UP(ctrl_loss_tmo,
f673714a124766 James Smart       2020-10-16  3483  						opts->reconnect_delay);
f673714a124766 James Smart       2020-10-16  3484  	}
f673714a124766 James Smart       2020-10-16  3485  
e399441de9115c James Smart       2016-12-02  3486  	ctrl->ctrl.opts = opts;
4c984154efa131 James Smart       2018-06-13  3487  	ctrl->ctrl.nr_reconnects = 0;
06f3d71ea071b7 James Smart       2019-03-13  3488  	if (lport->dev)
103e515efa89be Hannes Reinecke   2018-11-16  3489  		ctrl->ctrl.numa_node = dev_to_node(lport->dev);
06f3d71ea071b7 James Smart       2019-03-13  3490  	else
06f3d71ea071b7 James Smart       2019-03-13  3491  		ctrl->ctrl.numa_node = NUMA_NO_NODE;
e399441de9115c James Smart       2016-12-02  3492  	INIT_LIST_HEAD(&ctrl->ctrl_list);
e399441de9115c James Smart       2016-12-02  3493  	ctrl->lport = lport;
e399441de9115c James Smart       2016-12-02  3494  	ctrl->rport = rport;
e399441de9115c James Smart       2016-12-02  3495  	ctrl->dev = lport->dev;
e399441de9115c James Smart       2016-12-02  3496  	ctrl->cnum = idx;
4c984154efa131 James Smart       2018-06-13  3497  	ctrl->ioq_live = false;
8a82dbf19129dd James Smart       2017-10-09  3498  	init_waitqueue_head(&ctrl->ioabort_wait);
e399441de9115c James Smart       2016-12-02  3499  
e399441de9115c James Smart       2016-12-02  3500  	get_device(ctrl->dev);
e399441de9115c James Smart       2016-12-02  3501  	kref_init(&ctrl->ref);
e399441de9115c James Smart       2016-12-02  3502  
d86c4d8ef31b3d Christoph Hellwig 2017-06-15  3503  	INIT_WORK(&ctrl->ctrl.reset_work, nvme_fc_reset_ctrl_work);
61bff8ef008845 James Smart       2017-04-23  3504  	INIT_DELAYED_WORK(&ctrl->connect_work, nvme_fc_connect_ctrl_work);
19fce0470f0503 James Smart       2020-12-01  3505  	INIT_WORK(&ctrl->ioerr_work, nvme_fc_ctrl_ioerr_work);
e399441de9115c James Smart       2016-12-02  3506  	spin_lock_init(&ctrl->lock);
e399441de9115c James Smart       2016-12-02  3507  
e399441de9115c James Smart       2016-12-02  3508  	/* io queue count */
d858e5f04e58a4 Sagi Grimberg     2017-04-24  3509  	ctrl->ctrl.queue_count = min_t(unsigned int,
e399441de9115c James Smart       2016-12-02  3510  				opts->nr_io_queues,
e399441de9115c James Smart       2016-12-02  3511  				lport->ops->max_hw_queues);
d858e5f04e58a4 Sagi Grimberg     2017-04-24  3512  	ctrl->ctrl.queue_count++;	/* +1 for admin queue */
e399441de9115c James Smart       2016-12-02  3513  
e399441de9115c James Smart       2016-12-02  3514  	ctrl->ctrl.sqsize = opts->queue_size - 1;
e399441de9115c James Smart       2016-12-02  3515  	ctrl->ctrl.kato = opts->kato;
4c984154efa131 James Smart       2018-06-13  3516  	ctrl->ctrl.cntlid = 0xffff;
e399441de9115c James Smart       2016-12-02  3517  
e399441de9115c James Smart       2016-12-02  3518  	ret = -ENOMEM;
d858e5f04e58a4 Sagi Grimberg     2017-04-24  3519  	ctrl->queues = kcalloc(ctrl->ctrl.queue_count,
d858e5f04e58a4 Sagi Grimberg     2017-04-24  3520  				sizeof(struct nvme_fc_queue), GFP_KERNEL);
e399441de9115c James Smart       2016-12-02  3521  	if (!ctrl->queues)
61bff8ef008845 James Smart       2017-04-23  3522  		goto out_free_ida;
e399441de9115c James Smart       2016-12-02  3523  
3e493c00cedb45 James Smart       2018-06-13  3524  	nvme_fc_init_queue(ctrl, 0);
3e493c00cedb45 James Smart       2018-06-13  3525  
61bff8ef008845 James Smart       2017-04-23  3526  	/*
61bff8ef008845 James Smart       2017-04-23  3527  	 * Would have been nice to init io queues tag set as well.
61bff8ef008845 James Smart       2017-04-23  3528  	 * However, we require interaction from the controller
61bff8ef008845 James Smart       2017-04-23  3529  	 * for max io queue count before we can do so.
61bff8ef008845 James Smart       2017-04-23  3530  	 * Defer this to the connect path.
61bff8ef008845 James Smart       2017-04-23  3531  	 */
e399441de9115c James Smart       2016-12-02  3532  
61bff8ef008845 James Smart       2017-04-23  3533  	ret = nvme_init_ctrl(&ctrl->ctrl, dev, &nvme_fc_ctrl_ops, 0);
61bff8ef008845 James Smart       2017-04-23  3534  	if (ret)
98e3528012cd57 Ross Lagerwall    2023-01-20  3535  		goto out_free_queues;
e399441de9115c James Smart       2016-12-02  3536  
61bff8ef008845 James Smart       2017-04-23  3537  	/* at this point, teardown path changes to ref counting on nvme ctrl */
e399441de9115c James Smart       2016-12-02  3538  
98e3528012cd57 Ross Lagerwall    2023-01-20  3539  	ret = nvme_alloc_admin_tag_set(&ctrl->ctrl, &ctrl->admin_tag_set,
98e3528012cd57 Ross Lagerwall    2023-01-20  3540  			&nvme_fc_admin_mq_ops,
98e3528012cd57 Ross Lagerwall    2023-01-20  3541  			struct_size((struct nvme_fcp_op_w_sgl *)NULL, priv,
98e3528012cd57 Ross Lagerwall    2023-01-20  3542  				    ctrl->lport->ops->fcprqst_priv_sz));
98e3528012cd57 Ross Lagerwall    2023-01-20  3543  	if (ret)
98e3528012cd57 Ross Lagerwall    2023-01-20  3544  		goto fail_ctrl;
98e3528012cd57 Ross Lagerwall    2023-01-20  3545  
e399441de9115c James Smart       2016-12-02  3546  	spin_lock_irqsave(&rport->lock, flags);
e399441de9115c James Smart       2016-12-02  3547  	list_add_tail(&ctrl->ctrl_list, &rport->ctrl_list);
e399441de9115c James Smart       2016-12-02  3548  	spin_unlock_irqrestore(&rport->lock, flags);
e399441de9115c James Smart       2016-12-02  3549  
ac881fd1288ca6 Daniel Wagner     2023-06-20  3550  	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING)) {
4c984154efa131 James Smart       2018-06-13  3551  		dev_err(ctrl->ctrl.device,
4c984154efa131 James Smart       2018-06-13  3552  			"NVME-FC{%d}: failed to init ctrl state\n", ctrl->cnum);
4c984154efa131 James Smart       2018-06-13  3553  		goto fail_ctrl;
17c4dc6eb7e1b2 James Smart       2017-10-09  3554  	}
17c4dc6eb7e1b2 James Smart       2017-10-09  3555  
ac881fd1288ca6 Daniel Wagner     2023-06-20  3556  	ret = nvme_fc_create_association(ctrl);
ac881fd1288ca6 Daniel Wagner     2023-06-20  3557  	if (ret)
4c984154efa131 James Smart       2018-06-13  3558  		goto fail_ctrl;
4c984154efa131 James Smart       2018-06-13  3559  
4c984154efa131 James Smart       2018-06-13  3560  	dev_info(ctrl->ctrl.device,
4c984154efa131 James Smart       2018-06-13  3561  		"NVME-FC{%d}: new ctrl: NQN \"%s\"\n",
e5ea42faa773c6 Hannes Reinecke   2021-09-22  3562  		ctrl->cnum, nvmf_ctrl_subsysnqn(&ctrl->ctrl));
4c984154efa131 James Smart       2018-06-13  3563  
4c984154efa131 James Smart       2018-06-13  3564  	return &ctrl->ctrl;
4c984154efa131 James Smart       2018-06-13  3565  
4c984154efa131 James Smart       2018-06-13  3566  fail_ctrl:
19fce0470f0503 James Smart       2020-12-01  3567  	cancel_work_sync(&ctrl->ioerr_work);
cf25809bec2c7d James Smart       2018-03-13  3568  	cancel_work_sync(&ctrl->ctrl.reset_work);
cf25809bec2c7d James Smart       2018-03-13  3569  	cancel_delayed_work_sync(&ctrl->connect_work);
cf25809bec2c7d James Smart       2018-03-13  3570  
de41447aac034c Ewan D. Milne     2017-04-24  3571  	ctrl->ctrl.opts = NULL;
17c4dc6eb7e1b2 James Smart       2017-10-09  3572  
61bff8ef008845 James Smart       2017-04-23  3573  	/* initiate nvme ctrl ref counting teardown */
e399441de9115c James Smart       2016-12-02  3574  	nvme_uninit_ctrl(&ctrl->ctrl);
61bff8ef008845 James Smart       2017-04-23  3575  
0b5a7669a457dd James Smart       2017-06-15  3576  	/* Remove core ctrl ref. */
0b5a7669a457dd James Smart       2017-06-15  3577  	nvme_put_ctrl(&ctrl->ctrl);
0b5a7669a457dd James Smart       2017-06-15  3578  
61bff8ef008845 James Smart       2017-04-23  3579  	/* as we're past the point where we transition to the ref
61bff8ef008845 James Smart       2017-04-23  3580  	 * counting teardown path, if we return a bad pointer here,
61bff8ef008845 James Smart       2017-04-23  3581  	 * the calling routine, thinking it's prior to the
61bff8ef008845 James Smart       2017-04-23  3582  	 * transition, will do an rport put. Since the teardown
61bff8ef008845 James Smart       2017-04-23  3583  	 * path also does a rport put, we do an extra get here to
61bff8ef008845 James Smart       2017-04-23  3584  	 * so proper order/teardown happens.
61bff8ef008845 James Smart       2017-04-23  3585  	 */
61bff8ef008845 James Smart       2017-04-23  3586  	nvme_fc_rport_get(rport);
61bff8ef008845 James Smart       2017-04-23  3587  
ac881fd1288ca6 Daniel Wagner     2023-06-20  3588  	if (ret > 0)
ac881fd1288ca6 Daniel Wagner     2023-06-20  3589  		ret = -EIO;
ac881fd1288ca6 Daniel Wagner     2023-06-20 @3590  	return ERR_PTR(ret);
e399441de9115c James Smart       2016-12-02  3591  
61bff8ef008845 James Smart       2017-04-23  3592  out_free_queues:
61bff8ef008845 James Smart       2017-04-23  3593  	kfree(ctrl->queues);
e399441de9115c James Smart       2016-12-02  3594  out_free_ida:
61bff8ef008845 James Smart       2017-04-23  3595  	put_device(ctrl->dev);
3dd83f4013f0e8 Sagi Grimberg     2022-02-14  3596  	ida_free(&nvme_fc_ctrl_cnt, ctrl->cnum);
e399441de9115c James Smart       2016-12-02  3597  out_free_ctrl:
e399441de9115c James Smart       2016-12-02  3598  	kfree(ctrl);
e399441de9115c James Smart       2016-12-02  3599  out_fail:
e399441de9115c James Smart       2016-12-02  3600  	/* exit via here doesn't follow ctlr ref points */
e399441de9115c James Smart       2016-12-02  3601  	return ERR_PTR(ret);
e399441de9115c James Smart       2016-12-02  3602  }
e399441de9115c James Smart       2016-12-02  3603  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
