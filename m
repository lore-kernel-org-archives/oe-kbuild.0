Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264532ED20
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765301041; cv=none; b=aqRYsO3m5N4M9ql1LF0aU9lV8stTIE1nxrtImvKvsDMksTCTeFb1UalnEZ/LoM+mKKBafQLNol/VOVbYm7th0zjmjA8S4NQe2gGnx3tozfplF2DrME/5rcKl5SfHQR+zR+BuqDeEc0fe7IVPVfV3S3ibtbYsPpvuSXkt9bTZ4lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765301041; c=relaxed/simple;
	bh=5bVPDRPRwxbCHqupbmPBHK1u61Fw82oO76ki1u4u+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGKghpIhjociGZxYI2L5GU4Wm5Yf47bVfLXEFdZKKgEyPiDsIV/VE90HD5xieGuqC8RXrLUxSTC2w7tFZ/QQ8dLJi6bxgAvpu0lGYBpNwctmPIu3iZN13qfDdc+H55h9KZK1ULiDxFT2zGkc/2M9pOAE11Obzo1ge+N/oGh58ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7NlXWjq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7NlXWjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765301039; x=1796837039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5bVPDRPRwxbCHqupbmPBHK1u61Fw82oO76ki1u4u+p8=;
  b=B7NlXWjqA92/Qh5DxbfsiGUOsl1OVwdSxWK23AH17XgcbezPaXj5yb9e
   BAm1SrVSkxRfHu/aOYt+xTzKStsu8wVy2TGC8wE/nxs2Oy7nvSDMd/o5Z
   nUSCRwd7X89ZSsHBEv88xgsoawy7vbFVWOL11Mi/rnYdfIABr2VMtc2tF
   427cUzdyl01Wxwzr+MouQx3a0taitl+fLLS2fuYaeo7Hamw7pgRdQHgk/
   SIdMILTejJyBD34zwkLGDZYJjvrkPjDx0+MtmTIhym0ncsUo2oo38z3LE
   XpYC3X3IwY1KdoX3Fb/n8aOkrPRxKqa/mczJKdY0MmbzlDZ68Vn9JQKo2
   A==;
X-CSE-ConnectionGUID: 5mZ6a9K4TdaZFmziLd01Hg==
X-CSE-MsgGUID: aApO6xCLQQmjPCDqZ6I3Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77952038"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="77952038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 09:23:59 -0800
X-CSE-ConnectionGUID: TzzX9sYMRPa5Vy7m2gTBGg==
X-CSE-MsgGUID: qcvNf9n2QxCIAPFw60vJzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="195536032"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Dec 2025 09:23:57 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT1RK-0000000025V-3bAt;
	Tue, 09 Dec 2025 17:23:54 +0000
Date: Wed, 10 Dec 2025 01:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/infiniband/hw/bnxt_re/qplib_fp.c:511
 bnxt_qplib_nq_start_irq() warn: 'msix_vector' from request_irq() not
 released on lines: 511.
Message-ID: <202512100117.ElbRVePI-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-r073-20251208 (https://download.01.org/0day-ci/archive/20251210/202512100117.ElbRVePI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512100117.ElbRVePI-lkp@intel.com/

smatch warnings:
drivers/infiniband/hw/bnxt_re/qplib_fp.c:511 bnxt_qplib_nq_start_irq() warn: 'msix_vector' from request_irq() not released on lines: 511.
drivers/infiniband/hw/bnxt_re/qplib_fp.c:699 bnxt_qplib_create_srq() warn: potentially one past the end of array 'srq->swq[srq->last_idx]'
drivers/infiniband/hw/bnxt_re/qplib_fp.c:699 bnxt_qplib_create_srq() warn: potentially one past the end of array 'srq->swq[srq->last_idx]'
drivers/infiniband/hw/bnxt_re/qplib_fp.c:838 bnxt_qplib_alloc_init_swq() warn: potentially one past the end of array 'que->swq[que->swq_last]'
drivers/infiniband/hw/bnxt_re/qplib_fp.c:838 bnxt_qplib_alloc_init_swq() warn: potentially one past the end of array 'que->swq[que->swq_last]'

vim +/msix_vector +511 drivers/infiniband/hw/bnxt_re/qplib_fp.c

1ac5a404797523 Selvin Xavier      2017-02-10  472  
6e04b103568983 Devesh Sharma      2018-05-25  473  int bnxt_qplib_nq_start_irq(struct bnxt_qplib_nq *nq, int nq_indx,
6e04b103568983 Devesh Sharma      2018-05-25  474  			    int msix_vector, bool need_init)
6e04b103568983 Devesh Sharma      2018-05-25  475  {
ff2e4bfd162cf6 Kalesh AP          2023-05-18  476  	struct bnxt_qplib_res *res = nq->res;
6e04b103568983 Devesh Sharma      2018-05-25  477  	int rc;
6e04b103568983 Devesh Sharma      2018-05-25  478  
6e04b103568983 Devesh Sharma      2018-05-25  479  	if (nq->requested)
6e04b103568983 Devesh Sharma      2018-05-25  480  		return -EFAULT;
6e04b103568983 Devesh Sharma      2018-05-25  481  
9555352bacfdfc Devesh Sharma      2020-02-15  482  	nq->msix_vec = msix_vector;
6e04b103568983 Devesh Sharma      2018-05-25  483  	if (need_init)
53c2a706ae7858 Allen Pais         2020-09-03  484  		tasklet_setup(&nq->nq_tasklet, bnxt_qplib_service_nq);
6e04b103568983 Devesh Sharma      2018-05-25  485  	else
9555352bacfdfc Devesh Sharma      2020-02-15  486  		tasklet_enable(&nq->nq_tasklet);
6e04b103568983 Devesh Sharma      2018-05-25  487  
ff2e4bfd162cf6 Kalesh AP          2023-05-18  488  	nq->name = kasprintf(GFP_KERNEL, "bnxt_re-nq-%d@pci:%s",
ff2e4bfd162cf6 Kalesh AP          2023-05-18  489  			     nq_indx, pci_name(res->pdev));
ff2e4bfd162cf6 Kalesh AP          2023-05-18  490  	if (!nq->name)
ff2e4bfd162cf6 Kalesh AP          2023-05-18  491  		return -ENOMEM;
9555352bacfdfc Devesh Sharma      2020-02-15  492  	rc = request_irq(nq->msix_vec, bnxt_qplib_nq_irq, 0, nq->name, nq);
ab112ee7899d61 Selvin Xavier      2023-05-18  493  	if (rc) {
ff2e4bfd162cf6 Kalesh AP          2023-05-18  494  		kfree(nq->name);
ff2e4bfd162cf6 Kalesh AP          2023-05-18  495  		nq->name = NULL;
ab112ee7899d61 Selvin Xavier      2023-05-18  496  		tasklet_disable(&nq->nq_tasklet);
6e04b103568983 Devesh Sharma      2018-05-25  497  		return rc;
ab112ee7899d61 Selvin Xavier      2023-05-18  498  	}
6e04b103568983 Devesh Sharma      2018-05-25  499  
6e04b103568983 Devesh Sharma      2018-05-25  500  	cpumask_clear(&nq->mask);
6e04b103568983 Devesh Sharma      2018-05-25  501  	cpumask_set_cpu(nq_indx, &nq->mask);
9555352bacfdfc Devesh Sharma      2020-02-15  502  	rc = irq_set_affinity_hint(nq->msix_vec, &nq->mask);
6e04b103568983 Devesh Sharma      2018-05-25  503  	if (rc) {
6e04b103568983 Devesh Sharma      2018-05-25  504  		dev_warn(&nq->pdev->dev,
08920b8f5d2d3b Joe Perches        2018-08-10  505  			 "set affinity failed; vector: %d nq_idx: %d\n",
9555352bacfdfc Devesh Sharma      2020-02-15  506  			 nq->msix_vec, nq_indx);
6e04b103568983 Devesh Sharma      2018-05-25  507  	}
6e04b103568983 Devesh Sharma      2018-05-25  508  	nq->requested = true;
ff2e4bfd162cf6 Kalesh AP          2023-05-18  509  	bnxt_qplib_ring_nq_db(&nq->nq_db.dbinfo, res->cctx, true);
6e04b103568983 Devesh Sharma      2018-05-25  510  
6e04b103568983 Devesh Sharma      2018-05-25 @511  	return rc;
6e04b103568983 Devesh Sharma      2018-05-25  512  }
6e04b103568983 Devesh Sharma      2018-05-25  513  
9555352bacfdfc Devesh Sharma      2020-02-15  514  static int bnxt_qplib_map_nq_db(struct bnxt_qplib_nq *nq,  u32 reg_offt)
9555352bacfdfc Devesh Sharma      2020-02-15  515  {
9555352bacfdfc Devesh Sharma      2020-02-15  516  	resource_size_t reg_base;
9555352bacfdfc Devesh Sharma      2020-02-15  517  	struct bnxt_qplib_nq_db *nq_db;
9555352bacfdfc Devesh Sharma      2020-02-15  518  	struct pci_dev *pdev;
9555352bacfdfc Devesh Sharma      2020-02-15  519  
9555352bacfdfc Devesh Sharma      2020-02-15  520  	pdev = nq->pdev;
9555352bacfdfc Devesh Sharma      2020-02-15  521  	nq_db = &nq->nq_db;
9555352bacfdfc Devesh Sharma      2020-02-15  522  
3a4304d8269501 Chandramohan Akula 2023-10-23  523  	nq_db->dbinfo.flags = 0;
9555352bacfdfc Devesh Sharma      2020-02-15  524  	nq_db->reg.bar_id = NQ_CONS_PCI_BAR_REGION;
9555352bacfdfc Devesh Sharma      2020-02-15  525  	nq_db->reg.bar_base = pci_resource_start(pdev, nq_db->reg.bar_id);
9555352bacfdfc Devesh Sharma      2020-02-15  526  	if (!nq_db->reg.bar_base) {
9555352bacfdfc Devesh Sharma      2020-02-15  527  		dev_err(&pdev->dev, "QPLIB: NQ BAR region %d resc start is 0!",
9555352bacfdfc Devesh Sharma      2020-02-15  528  			nq_db->reg.bar_id);
07d5ce14b2aa22 Kalesh AP          2023-05-18  529  		return -ENOMEM;
9555352bacfdfc Devesh Sharma      2020-02-15  530  	}
9555352bacfdfc Devesh Sharma      2020-02-15  531  
9555352bacfdfc Devesh Sharma      2020-02-15  532  	reg_base = nq_db->reg.bar_base + reg_offt;
9555352bacfdfc Devesh Sharma      2020-02-15  533  	/* Unconditionally map 8 bytes to support 57500 series */
9555352bacfdfc Devesh Sharma      2020-02-15  534  	nq_db->reg.len = 8;
9555352bacfdfc Devesh Sharma      2020-02-15  535  	nq_db->reg.bar_reg = ioremap(reg_base, nq_db->reg.len);
9555352bacfdfc Devesh Sharma      2020-02-15  536  	if (!nq_db->reg.bar_reg) {
9555352bacfdfc Devesh Sharma      2020-02-15  537  		dev_err(&pdev->dev, "QPLIB: NQ BAR region %d mapping failed",
9555352bacfdfc Devesh Sharma      2020-02-15  538  			nq_db->reg.bar_id);
07d5ce14b2aa22 Kalesh AP          2023-05-18  539  		return -ENOMEM;
9555352bacfdfc Devesh Sharma      2020-02-15  540  	}
9555352bacfdfc Devesh Sharma      2020-02-15  541  
6f53196bc5e7fd Devesh Sharma      2020-02-15  542  	nq_db->dbinfo.db = nq_db->reg.bar_reg;
6f53196bc5e7fd Devesh Sharma      2020-02-15  543  	nq_db->dbinfo.hwq = &nq->hwq;
6f53196bc5e7fd Devesh Sharma      2020-02-15  544  	nq_db->dbinfo.xid = nq->ring_id;
07d5ce14b2aa22 Kalesh AP          2023-05-18  545  
07d5ce14b2aa22 Kalesh AP          2023-05-18  546  	return 0;
9555352bacfdfc Devesh Sharma      2020-02-15  547  }
9555352bacfdfc Devesh Sharma      2020-02-15  548  
1ac5a404797523 Selvin Xavier      2017-02-10  549  int bnxt_qplib_enable_nq(struct pci_dev *pdev, struct bnxt_qplib_nq *nq,
6a5df91baf2528 Selvin Xavier      2017-08-02  550  			 int nq_idx, int msix_vector, int bar_reg_offset,
9555352bacfdfc Devesh Sharma      2020-02-15  551  			 cqn_handler_t cqn_handler,
9555352bacfdfc Devesh Sharma      2020-02-15  552  			 srqn_handler_t srqn_handler)
1ac5a404797523 Selvin Xavier      2017-02-10  553  {
14611b9b984125 Kalesh AP          2023-08-03  554  	int rc;
1ac5a404797523 Selvin Xavier      2017-02-10  555  
9555352bacfdfc Devesh Sharma      2020-02-15  556  	nq->pdev = pdev;
1ac5a404797523 Selvin Xavier      2017-02-10  557  	nq->cqn_handler = cqn_handler;
1ac5a404797523 Selvin Xavier      2017-02-10  558  	nq->srqn_handler = srqn_handler;
cb97b377a13589 Kalesh AP          2024-11-14  559  	nq->load = 0;
1ac5a404797523 Selvin Xavier      2017-02-10  560  
f218d67ef00431 Selvin Xavier      2017-06-29  561  	/* Have a task to schedule CQ notifiers in post send case */
f218d67ef00431 Selvin Xavier      2017-06-29  562  	nq->cqn_wq  = create_singlethread_workqueue("bnxt_qplib_nq");
f218d67ef00431 Selvin Xavier      2017-06-29  563  	if (!nq->cqn_wq)
6e04b103568983 Devesh Sharma      2018-05-25  564  		return -ENOMEM;
f218d67ef00431 Selvin Xavier      2017-06-29  565  
9555352bacfdfc Devesh Sharma      2020-02-15  566  	rc = bnxt_qplib_map_nq_db(nq, bar_reg_offset);
9555352bacfdfc Devesh Sharma      2020-02-15  567  	if (rc)
1ac5a404797523 Selvin Xavier      2017-02-10  568  		goto fail;
6e04b103568983 Devesh Sharma      2018-05-25  569  
6e04b103568983 Devesh Sharma      2018-05-25  570  	rc = bnxt_qplib_nq_start_irq(nq, nq_idx, msix_vector, true);
6e04b103568983 Devesh Sharma      2018-05-25  571  	if (rc) {
6e04b103568983 Devesh Sharma      2018-05-25  572  		dev_err(&nq->pdev->dev,
08920b8f5d2d3b Joe Perches        2018-08-10  573  			"Failed to request irq for nq-idx %d\n", nq_idx);
6e04b103568983 Devesh Sharma      2018-05-25  574  		goto fail;
6e04b103568983 Devesh Sharma      2018-05-25  575  	}
1ac5a404797523 Selvin Xavier      2017-02-10  576  
1ac5a404797523 Selvin Xavier      2017-02-10  577  	return 0;
1ac5a404797523 Selvin Xavier      2017-02-10  578  fail:
1ac5a404797523 Selvin Xavier      2017-02-10  579  	bnxt_qplib_disable_nq(nq);
1ac5a404797523 Selvin Xavier      2017-02-10  580  	return rc;
1ac5a404797523 Selvin Xavier      2017-02-10  581  }
1ac5a404797523 Selvin Xavier      2017-02-10  582  
1ac5a404797523 Selvin Xavier      2017-02-10  583  void bnxt_qplib_free_nq(struct bnxt_qplib_nq *nq)
1ac5a404797523 Selvin Xavier      2017-02-10  584  {
6a5df91baf2528 Selvin Xavier      2017-08-02  585  	if (nq->hwq.max_elements) {
0c4dcd60281750 Devesh Sharma      2020-02-15  586  		bnxt_qplib_free_hwq(nq->res, &nq->hwq);
6a5df91baf2528 Selvin Xavier      2017-08-02  587  		nq->hwq.max_elements = 0;
6a5df91baf2528 Selvin Xavier      2017-08-02  588  	}
1ac5a404797523 Selvin Xavier      2017-02-10  589  }
1ac5a404797523 Selvin Xavier      2017-02-10  590  
0c4dcd60281750 Devesh Sharma      2020-02-15  591  int bnxt_qplib_alloc_nq(struct bnxt_qplib_res *res, struct bnxt_qplib_nq *nq)
1ac5a404797523 Selvin Xavier      2017-02-10  592  {
0c4dcd60281750 Devesh Sharma      2020-02-15  593  	struct bnxt_qplib_hwq_attr hwq_attr = {};
0c4dcd60281750 Devesh Sharma      2020-02-15  594  	struct bnxt_qplib_sg_info sginfo = {};
b353ce556d5213 Devesh Sharma      2019-02-07  595  
0c4dcd60281750 Devesh Sharma      2020-02-15  596  	nq->pdev = res->pdev;
0c4dcd60281750 Devesh Sharma      2020-02-15  597  	nq->res = res;
1ac5a404797523 Selvin Xavier      2017-02-10  598  	if (!nq->hwq.max_elements ||
1ac5a404797523 Selvin Xavier      2017-02-10  599  	    nq->hwq.max_elements > BNXT_QPLIB_NQE_MAX_CNT)
1ac5a404797523 Selvin Xavier      2017-02-10  600  		nq->hwq.max_elements = BNXT_QPLIB_NQE_MAX_CNT;
1ac5a404797523 Selvin Xavier      2017-02-10  601  
0c4dcd60281750 Devesh Sharma      2020-02-15  602  	sginfo.pgsize = PAGE_SIZE;
0c4dcd60281750 Devesh Sharma      2020-02-15  603  	sginfo.pgshft = PAGE_SHIFT;
0c4dcd60281750 Devesh Sharma      2020-02-15  604  	hwq_attr.res = res;
0c4dcd60281750 Devesh Sharma      2020-02-15  605  	hwq_attr.sginfo = &sginfo;
0c4dcd60281750 Devesh Sharma      2020-02-15  606  	hwq_attr.depth = nq->hwq.max_elements;
0c4dcd60281750 Devesh Sharma      2020-02-15  607  	hwq_attr.stride = sizeof(struct nq_base);
0c4dcd60281750 Devesh Sharma      2020-02-15  608  	hwq_attr.type = bnxt_qplib_get_hwq_type(nq->res);
0c4dcd60281750 Devesh Sharma      2020-02-15  609  	if (bnxt_qplib_alloc_init_hwq(&nq->hwq, &hwq_attr)) {
0c4dcd60281750 Devesh Sharma      2020-02-15  610  		dev_err(&nq->pdev->dev, "FP NQ allocation failed");
0c4dcd60281750 Devesh Sharma      2020-02-15  611  		return -ENOMEM;
0c4dcd60281750 Devesh Sharma      2020-02-15  612  	}
1ac5a404797523 Selvin Xavier      2017-02-10  613  	nq->budget = 8;
1ac5a404797523 Selvin Xavier      2017-02-10  614  	return 0;
1ac5a404797523 Selvin Xavier      2017-02-10  615  }
1ac5a404797523 Selvin Xavier      2017-02-10  616  
37cb11acf1f72a Devesh Sharma      2018-01-11  617  /* SRQ */
68e326dea1dba9 Leon Romanovsky    2019-04-03  618  void bnxt_qplib_destroy_srq(struct bnxt_qplib_res *res,
37cb11acf1f72a Devesh Sharma      2018-01-11  619  			   struct bnxt_qplib_srq *srq)
37cb11acf1f72a Devesh Sharma      2018-01-11  620  {
37cb11acf1f72a Devesh Sharma      2018-01-11  621  	struct bnxt_qplib_rcfw *rcfw = res->rcfw;
ff015bcd213b5d Selvin Xavier      2023-03-30  622  	struct creq_destroy_srq_resp resp = {};
ff015bcd213b5d Selvin Xavier      2023-03-30  623  	struct bnxt_qplib_cmdqmsg msg = {};
ff015bcd213b5d Selvin Xavier      2023-03-30  624  	struct cmdq_destroy_srq req = {};
37cb11acf1f72a Devesh Sharma      2018-01-11  625  	int rc;
37cb11acf1f72a Devesh Sharma      2018-01-11  626  
e576adf583b525 Selvin Xavier      2023-03-30  627  	bnxt_qplib_rcfw_cmd_prep((struct cmdq_base *)&req,
e576adf583b525 Selvin Xavier      2023-03-30  628  				 CMDQ_BASE_OPCODE_DESTROY_SRQ,
e576adf583b525 Selvin Xavier      2023-03-30  629  				 sizeof(req));
37cb11acf1f72a Devesh Sharma      2018-01-11  630  
37cb11acf1f72a Devesh Sharma      2018-01-11  631  	/* Configure the request */
37cb11acf1f72a Devesh Sharma      2018-01-11  632  	req.srq_cid = cpu_to_le32(srq->id);
37cb11acf1f72a Devesh Sharma      2018-01-11  633  
ff015bcd213b5d Selvin Xavier      2023-03-30  634  	bnxt_qplib_fill_cmdqmsg(&msg, &req, &resp, NULL, sizeof(req), sizeof(resp), 0);
ff015bcd213b5d Selvin Xavier      2023-03-30  635  	rc = bnxt_qplib_rcfw_send_message(rcfw, &msg);
68e326dea1dba9 Leon Romanovsky    2019-04-03  636  	kfree(srq->swq);
37cb11acf1f72a Devesh Sharma      2018-01-11  637  	if (rc)
68e326dea1dba9 Leon Romanovsky    2019-04-03  638  		return;
0c4dcd60281750 Devesh Sharma      2020-02-15  639  	bnxt_qplib_free_hwq(res, &srq->hwq);
37cb11acf1f72a Devesh Sharma      2018-01-11  640  }
37cb11acf1f72a Devesh Sharma      2018-01-11  641  
37cb11acf1f72a Devesh Sharma      2018-01-11  642  int bnxt_qplib_create_srq(struct bnxt_qplib_res *res,
37cb11acf1f72a Devesh Sharma      2018-01-11  643  			  struct bnxt_qplib_srq *srq)
37cb11acf1f72a Devesh Sharma      2018-01-11  644  {
37cb11acf1f72a Devesh Sharma      2018-01-11  645  	struct bnxt_qplib_rcfw *rcfw = res->rcfw;
0c4dcd60281750 Devesh Sharma      2020-02-15  646  	struct bnxt_qplib_hwq_attr hwq_attr = {};
ff015bcd213b5d Selvin Xavier      2023-03-30  647  	struct creq_create_srq_resp resp = {};
ff015bcd213b5d Selvin Xavier      2023-03-30  648  	struct bnxt_qplib_cmdqmsg msg = {};
ff015bcd213b5d Selvin Xavier      2023-03-30  649  	struct cmdq_create_srq req = {};
37cb11acf1f72a Devesh Sharma      2018-01-11  650  	struct bnxt_qplib_pbl *pbl;
99bf84e24eb83d Devesh Sharma      2020-04-02  651  	u16 pg_sz_lvl;
37cb11acf1f72a Devesh Sharma      2018-01-11  652  	int rc, idx;
37cb11acf1f72a Devesh Sharma      2018-01-11  653  
0c4dcd60281750 Devesh Sharma      2020-02-15  654  	hwq_attr.res = res;
0c4dcd60281750 Devesh Sharma      2020-02-15  655  	hwq_attr.sginfo = &srq->sg_info;
0c4dcd60281750 Devesh Sharma      2020-02-15  656  	hwq_attr.depth = srq->max_wqe;
fddcbbb02af42a Devesh Sharma      2020-04-02  657  	hwq_attr.stride = srq->wqe_size;
0c4dcd60281750 Devesh Sharma      2020-02-15  658  	hwq_attr.type = HWQ_TYPE_QUEUE;
0c4dcd60281750 Devesh Sharma      2020-02-15  659  	rc = bnxt_qplib_alloc_init_hwq(&srq->hwq, &hwq_attr);
37cb11acf1f72a Devesh Sharma      2018-01-11  660  	if (rc)
07d5ce14b2aa22 Kalesh AP          2023-05-18  661  		return rc;
3a4304d8269501 Chandramohan Akula 2023-10-23  662  	srq->dbinfo.flags = 0;
e576adf583b525 Selvin Xavier      2023-03-30  663  	bnxt_qplib_rcfw_cmd_prep((struct cmdq_base *)&req,
e576adf583b525 Selvin Xavier      2023-03-30  664  				 CMDQ_BASE_OPCODE_CREATE_SRQ,
e576adf583b525 Selvin Xavier      2023-03-30  665  				 sizeof(req));
37cb11acf1f72a Devesh Sharma      2018-01-11  666  
37cb11acf1f72a Devesh Sharma      2018-01-11  667  	/* Configure the request */
37cb11acf1f72a Devesh Sharma      2018-01-11  668  	req.dpi = cpu_to_le32(srq->dpi->dpi);
5388a508479d8b Arnd Bergmann      2018-02-20  669  	req.srq_handle = cpu_to_le64((uintptr_t)srq);
37cb11acf1f72a Devesh Sharma      2018-01-11  670  
37cb11acf1f72a Devesh Sharma      2018-01-11  671  	req.srq_size = cpu_to_le16((u16)srq->hwq.max_elements);
37cb11acf1f72a Devesh Sharma      2018-01-11  672  	pbl = &srq->hwq.pbl[PBL_LVL_0];
99bf84e24eb83d Devesh Sharma      2020-04-02  673  	pg_sz_lvl = ((u16)bnxt_qplib_base_pg_size(&srq->hwq) <<
99bf84e24eb83d Devesh Sharma      2020-04-02  674  		     CMDQ_CREATE_SRQ_PG_SIZE_SFT);
99bf84e24eb83d Devesh Sharma      2020-04-02  675  	pg_sz_lvl |= (srq->hwq.level & CMDQ_CREATE_SRQ_LVL_MASK) <<
99bf84e24eb83d Devesh Sharma      2020-04-02  676  		      CMDQ_CREATE_SRQ_LVL_SFT;
99bf84e24eb83d Devesh Sharma      2020-04-02  677  	req.pg_size_lvl = cpu_to_le16(pg_sz_lvl);
37cb11acf1f72a Devesh Sharma      2018-01-11  678  	req.pbl = cpu_to_le64(pbl->pg_map_arr[0]);
37cb11acf1f72a Devesh Sharma      2018-01-11  679  	req.pd_id = cpu_to_le32(srq->pd->id);
37cb11acf1f72a Devesh Sharma      2018-01-11  680  	req.eventq_id = cpu_to_le16(srq->eventq_hw_ring_id);
37cb11acf1f72a Devesh Sharma      2018-01-11  681  
ff015bcd213b5d Selvin Xavier      2023-03-30  682  	bnxt_qplib_fill_cmdqmsg(&msg, &req, &resp, NULL, sizeof(req), sizeof(resp), 0);
ff015bcd213b5d Selvin Xavier      2023-03-30  683  	rc = bnxt_qplib_rcfw_send_message(rcfw, &msg);
37cb11acf1f72a Devesh Sharma      2018-01-11  684  	if (rc)
37cb11acf1f72a Devesh Sharma      2018-01-11  685  		goto fail;
37cb11acf1f72a Devesh Sharma      2018-01-11  686  
37cb11acf1f72a Devesh Sharma      2018-01-11  687  	spin_lock_init(&srq->lock);
37cb11acf1f72a Devesh Sharma      2018-01-11  688  	srq->start_idx = 0;
37cb11acf1f72a Devesh Sharma      2018-01-11  689  	srq->last_idx = srq->hwq.max_elements - 1;
5effcacc8a8f3e Selvin Xavier      2024-12-04  690  	if (!srq->hwq.is_user) {
5effcacc8a8f3e Selvin Xavier      2024-12-04  691  		srq->swq = kcalloc(srq->hwq.max_elements, sizeof(*srq->swq),
5effcacc8a8f3e Selvin Xavier      2024-12-04  692  				   GFP_KERNEL);
5effcacc8a8f3e Selvin Xavier      2024-12-04  693  		if (!srq->swq) {
5effcacc8a8f3e Selvin Xavier      2024-12-04  694  			rc = -ENOMEM;
5effcacc8a8f3e Selvin Xavier      2024-12-04  695  			goto fail;
5effcacc8a8f3e Selvin Xavier      2024-12-04  696  		}
37cb11acf1f72a Devesh Sharma      2018-01-11  697  		for (idx = 0; idx < srq->hwq.max_elements; idx++)
37cb11acf1f72a Devesh Sharma      2018-01-11  698  			srq->swq[idx].next_idx = idx + 1;
37cb11acf1f72a Devesh Sharma      2018-01-11 @699  		srq->swq[srq->last_idx].next_idx = -1;
5effcacc8a8f3e Selvin Xavier      2024-12-04  700  	}
37cb11acf1f72a Devesh Sharma      2018-01-11  701  
37cb11acf1f72a Devesh Sharma      2018-01-11  702  	srq->id = le32_to_cpu(resp.xid);
6f53196bc5e7fd Devesh Sharma      2020-02-15  703  	srq->dbinfo.hwq = &srq->hwq;
6f53196bc5e7fd Devesh Sharma      2020-02-15  704  	srq->dbinfo.xid = srq->id;
6f53196bc5e7fd Devesh Sharma      2020-02-15  705  	srq->dbinfo.db = srq->dpi->dbr;
2bb3c32c5c5fe9 Devesh Sharma      2020-07-15  706  	srq->dbinfo.max_slot = 1;
0ac20faf5d837b Selvin Xavier      2023-06-13  707  	srq->dbinfo.priv_db = res->dpi_tbl.priv_db;
37cb11acf1f72a Devesh Sharma      2018-01-11  708  	if (srq->threshold)
6f53196bc5e7fd Devesh Sharma      2020-02-15  709  		bnxt_qplib_armen_db(&srq->dbinfo, DBC_DBC_TYPE_SRQ_ARMENA);
37cb11acf1f72a Devesh Sharma      2018-01-11  710  	srq->arm_req = false;
37cb11acf1f72a Devesh Sharma      2018-01-11  711  
37cb11acf1f72a Devesh Sharma      2018-01-11  712  	return 0;
37cb11acf1f72a Devesh Sharma      2018-01-11  713  fail:
0c4dcd60281750 Devesh Sharma      2020-02-15  714  	bnxt_qplib_free_hwq(res, &srq->hwq);
37cb11acf1f72a Devesh Sharma      2018-01-11  715  	kfree(srq->swq);
07d5ce14b2aa22 Kalesh AP          2023-05-18  716  
37cb11acf1f72a Devesh Sharma      2018-01-11  717  	return rc;
37cb11acf1f72a Devesh Sharma      2018-01-11  718  }
37cb11acf1f72a Devesh Sharma      2018-01-11  719  

:::::: The code at line 511 was first introduced by commit
:::::: 6e04b103568983bd699fac96b80a9b96ede68118 RDMA/bnxt_re: Fix broken RoCE driver due to recent L2 driver changes

:::::: TO: Devesh Sharma <devesh.sharma@broadcom.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
