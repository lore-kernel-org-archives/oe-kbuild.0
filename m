Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708C145A1C
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 19:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729626124; cv=none; b=n6bnkKDO2BSREiVZGJL97NwrJKUEi2YUMsuY0+n5dxJmLArXHFnnIl0WbUK268WmMfqB7Z4LZlqoBN59arCT0KS/sJQ5b+BpDnOXBfkNaOoIpJ7ifZU0f+8psIIavD/zIOFmIpZwdJvjSeok5fsAc4koLJLppsAmySK8hJFjs98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729626124; c=relaxed/simple;
	bh=vsNtd7RC+6OUZD6218hq+wIbFTNXj+rXRoJAgwBtCsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjgLqfEklH9jd5vEM9qT5XZYp+wESKt9OTH8Klxj+j3j5SH0OJ2NkSumezF6yZRBxuL7k/C/CqXfD8oIq35StHrbVrLtwsDsgfBCDfoWLtx0pgy0mrimK4PXf+Om5r3VgiwcEv3njKcAn0LeRlvFdYaKopKKGeMEwD29KVDufbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6QIRTEY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6QIRTEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729626122; x=1761162122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsNtd7RC+6OUZD6218hq+wIbFTNXj+rXRoJAgwBtCsE=;
  b=F6QIRTEY/cWhXQyeMu62Mma3iUd2gK3/uuQ00waG+jFvzMrJzkAHOKFv
   cghzQ8rXoylD180eWj4mGIkCTzEQPVdYy5U+p9RzhAj2QhSgwmJJNuzwc
   0vU58DF2k3sl2v0aB5qKO5R8TAVYpIAnriIGiwJ/dE8SOQT+WNFKytqgG
   XGDg70xxbQ2x6snCycAjRjjsVxAQP8D38VWQlEItSx99b/f/blbporjjY
   q5J5PNMxcifrlo+ePf47+5X8D6VRONJe0q2K+sSLnDcWXf+e1XUYYi6Qe
   pheNKLfywlNJJAWq/ZOirvAdjfW24CxLc0GXy05Pr+hmn6/pSqnlznezH
   A==;
X-CSE-ConnectionGUID: ApPsWDXZS96/pXqEoTGIkg==
X-CSE-MsgGUID: xiK9MDOpSiOHDdPVvCXbIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28964344"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28964344"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 12:42:02 -0700
X-CSE-ConnectionGUID: ebyl/Dt3SPSUdGLMVhLXnQ==
X-CSE-MsgGUID: jzpkr6bwS6W5tUiz48LI5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84567466"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2024 12:42:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3KlS-000U1e-1D;
	Tue, 22 Oct 2024 19:41:58 +0000
Date: Wed, 23 Oct 2024 03:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 619/2444]
 drivers/dma/idxd/init.c:105:6-26: WARNING: Threaded IRQ with no primary
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202410230302.1wJ8cyZ2-lkp@intel.com>
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
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: deshengwu@tencent.com
TO: flyingpeng@tencent.com
TO: jingqunli@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: fe56f8e8af268c27273e9d34c576b7dafea8614a [619/2444] dmaengine: idxd: remove MSIX masking for interrupt handlers
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-102-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230302.1wJ8cyZ2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410230302.1wJ8cyZ2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/idxd/init.c:105:6-26: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
   drivers/dma/idxd/init.c:122:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +105 drivers/dma/idxd/init.c

40a641c467c2d0 Dave Jiang 2020-01-21   64  
40a641c467c2d0 Dave Jiang 2020-01-21   65  static int idxd_setup_interrupts(struct idxd_device *idxd)
40a641c467c2d0 Dave Jiang 2020-01-21   66  {
40a641c467c2d0 Dave Jiang 2020-01-21   67  	struct pci_dev *pdev = idxd->pdev;
40a641c467c2d0 Dave Jiang 2020-01-21   68  	struct device *dev = &pdev->dev;
40a641c467c2d0 Dave Jiang 2020-01-21   69  	struct idxd_irq_entry *irq_entry;
40a641c467c2d0 Dave Jiang 2020-01-21   70  	int i, msixcnt;
40a641c467c2d0 Dave Jiang 2020-01-21   71  	int rc = 0;
40a641c467c2d0 Dave Jiang 2020-01-21   72  
40a641c467c2d0 Dave Jiang 2020-01-21   73  	msixcnt = pci_msix_vec_count(pdev);
40a641c467c2d0 Dave Jiang 2020-01-21   74  	if (msixcnt < 0) {
40a641c467c2d0 Dave Jiang 2020-01-21   75  		dev_err(dev, "Not MSI-X interrupt capable.\n");
969f28c718d7ff Dave Jiang 2021-04-15   76  		return -ENOSPC;
40a641c467c2d0 Dave Jiang 2020-01-21   77  	}
40a641c467c2d0 Dave Jiang 2020-01-21   78  
969f28c718d7ff Dave Jiang 2021-04-15   79  	rc = pci_alloc_irq_vectors(pdev, msixcnt, msixcnt, PCI_IRQ_MSIX);
969f28c718d7ff Dave Jiang 2021-04-15   80  	if (rc != msixcnt) {
969f28c718d7ff Dave Jiang 2021-04-15   81  		dev_err(dev, "Failed enabling %d MSIX entries: %d\n", msixcnt, rc);
969f28c718d7ff Dave Jiang 2021-04-15   82  		return -ENOSPC;
40a641c467c2d0 Dave Jiang 2020-01-21   83  	}
40a641c467c2d0 Dave Jiang 2020-01-21   84  	dev_dbg(dev, "Enabled %d msix vectors\n", msixcnt);
40a641c467c2d0 Dave Jiang 2020-01-21   85  
40a641c467c2d0 Dave Jiang 2020-01-21   86  	/*
40a641c467c2d0 Dave Jiang 2020-01-21   87  	 * We implement 1 completion list per MSI-X entry except for
40a641c467c2d0 Dave Jiang 2020-01-21   88  	 * entry 0, which is for errors and others.
40a641c467c2d0 Dave Jiang 2020-01-21   89  	 */
f50a1283d55312 Dave Jiang 2021-04-15   90  	idxd->irq_entries = kcalloc_node(msixcnt, sizeof(struct idxd_irq_entry),
f50a1283d55312 Dave Jiang 2021-04-15   91  					 GFP_KERNEL, dev_to_node(dev));
40a641c467c2d0 Dave Jiang 2020-01-21   92  	if (!idxd->irq_entries) {
40a641c467c2d0 Dave Jiang 2020-01-21   93  		rc = -ENOMEM;
969f28c718d7ff Dave Jiang 2021-04-15   94  		goto err_irq_entries;
40a641c467c2d0 Dave Jiang 2020-01-21   95  	}
40a641c467c2d0 Dave Jiang 2020-01-21   96  
40a641c467c2d0 Dave Jiang 2020-01-21   97  	for (i = 0; i < msixcnt; i++) {
40a641c467c2d0 Dave Jiang 2020-01-21   98  		idxd->irq_entries[i].id = i;
40a641c467c2d0 Dave Jiang 2020-01-21   99  		idxd->irq_entries[i].idxd = idxd;
969f28c718d7ff Dave Jiang 2021-04-15  100  		idxd->irq_entries[i].vector = pci_irq_vector(pdev, i);
721caf50d4ff92 Dave Jiang 2020-10-27  101  		spin_lock_init(&idxd->irq_entries[i].list_lock);
40a641c467c2d0 Dave Jiang 2020-01-21  102  	}
40a641c467c2d0 Dave Jiang 2020-01-21  103  
40a641c467c2d0 Dave Jiang 2020-01-21  104  	irq_entry = &idxd->irq_entries[0];
fe56f8e8af268c Dave Jiang 2021-04-20 @105  	rc = request_threaded_irq(irq_entry->vector, NULL, idxd_misc_thread,
969f28c718d7ff Dave Jiang 2021-04-15  106  				  0, "idxd-misc", irq_entry);
40a641c467c2d0 Dave Jiang 2020-01-21  107  	if (rc < 0) {
40a641c467c2d0 Dave Jiang 2020-01-21  108  		dev_err(dev, "Failed to allocate misc interrupt.\n");
969f28c718d7ff Dave Jiang 2021-04-15  109  		goto err_misc_irq;
40a641c467c2d0 Dave Jiang 2020-01-21  110  	}
40a641c467c2d0 Dave Jiang 2020-01-21  111  
969f28c718d7ff Dave Jiang 2021-04-15  112  	dev_dbg(dev, "Allocated idxd-misc handler on msix vector %d\n", irq_entry->vector);
40a641c467c2d0 Dave Jiang 2020-01-21  113  
40a641c467c2d0 Dave Jiang 2020-01-21  114  	/* first MSI-X entry is not for wq interrupts */
40a641c467c2d0 Dave Jiang 2020-01-21  115  	idxd->num_wq_irqs = msixcnt - 1;
40a641c467c2d0 Dave Jiang 2020-01-21  116  
40a641c467c2d0 Dave Jiang 2020-01-21  117  	for (i = 1; i < msixcnt; i++) {
40a641c467c2d0 Dave Jiang 2020-01-21  118  		irq_entry = &idxd->irq_entries[i];
40a641c467c2d0 Dave Jiang 2020-01-21  119  
40a641c467c2d0 Dave Jiang 2020-01-21  120  		init_llist_head(&idxd->irq_entries[i].pending_llist);
40a641c467c2d0 Dave Jiang 2020-01-21  121  		INIT_LIST_HEAD(&idxd->irq_entries[i].work_list);
fe56f8e8af268c Dave Jiang 2021-04-20  122  		rc = request_threaded_irq(irq_entry->vector, NULL,
969f28c718d7ff Dave Jiang 2021-04-15  123  					  idxd_wq_thread, 0, "idxd-portal", irq_entry);
40a641c467c2d0 Dave Jiang 2020-01-21  124  		if (rc < 0) {
969f28c718d7ff Dave Jiang 2021-04-15  125  			dev_err(dev, "Failed to allocate irq %d.\n", irq_entry->vector);
969f28c718d7ff Dave Jiang 2021-04-15  126  			goto err_wq_irqs;
40a641c467c2d0 Dave Jiang 2020-01-21  127  		}
4d7e5d0f31d800 Dave Jiang 2021-04-20  128  
969f28c718d7ff Dave Jiang 2021-04-15  129  		dev_dbg(dev, "Allocated idxd-msix %d for vector %d\n", i, irq_entry->vector);
4d7e5d0f31d800 Dave Jiang 2021-04-20  130  		if (idxd->hw.cmd_cap & BIT(IDXD_CMD_REQUEST_INT_HANDLE)) {
4d7e5d0f31d800 Dave Jiang 2021-04-20  131  			/*
4d7e5d0f31d800 Dave Jiang 2021-04-20  132  			 * The MSIX vector enumeration starts at 1 with vector 0 being the
4d7e5d0f31d800 Dave Jiang 2021-04-20  133  			 * misc interrupt that handles non I/O completion events. The
4d7e5d0f31d800 Dave Jiang 2021-04-20  134  			 * interrupt handles are for IMS enumeration on guest. The misc
4d7e5d0f31d800 Dave Jiang 2021-04-20  135  			 * interrupt vector does not require a handle and therefore we start
4d7e5d0f31d800 Dave Jiang 2021-04-20  136  			 * the int_handles at index 0. Since 'i' starts at 1, the first
4d7e5d0f31d800 Dave Jiang 2021-04-20  137  			 * int_handles index will be 0.
4d7e5d0f31d800 Dave Jiang 2021-04-20  138  			 */
4d7e5d0f31d800 Dave Jiang 2021-04-20  139  			rc = idxd_device_request_int_handle(idxd, i, &idxd->int_handles[i - 1],
4d7e5d0f31d800 Dave Jiang 2021-04-20  140  							    IDXD_IRQ_MSIX);
4d7e5d0f31d800 Dave Jiang 2021-04-20  141  			if (rc < 0) {
4d7e5d0f31d800 Dave Jiang 2021-04-20  142  				free_irq(irq_entry->vector, irq_entry);
4d7e5d0f31d800 Dave Jiang 2021-04-20  143  				goto err_wq_irqs;
4d7e5d0f31d800 Dave Jiang 2021-04-20  144  			}
4d7e5d0f31d800 Dave Jiang 2021-04-20  145  			dev_dbg(dev, "int handle requested: %u\n", idxd->int_handles[i - 1]);
4d7e5d0f31d800 Dave Jiang 2021-04-20  146  		}
40a641c467c2d0 Dave Jiang 2020-01-21  147  	}
40a641c467c2d0 Dave Jiang 2020-01-21  148  
40a641c467c2d0 Dave Jiang 2020-01-21  149  	idxd_unmask_error_interrupts(idxd);
686b0315d3d67b Dave Jiang 2021-04-12  150  	idxd_msix_perm_setup(idxd);
40a641c467c2d0 Dave Jiang 2020-01-21  151  	return 0;
40a641c467c2d0 Dave Jiang 2020-01-21  152  
969f28c718d7ff Dave Jiang 2021-04-15  153   err_wq_irqs:
969f28c718d7ff Dave Jiang 2021-04-15  154  	while (--i >= 0) {
969f28c718d7ff Dave Jiang 2021-04-15  155  		irq_entry = &idxd->irq_entries[i];
969f28c718d7ff Dave Jiang 2021-04-15  156  		free_irq(irq_entry->vector, irq_entry);
4d7e5d0f31d800 Dave Jiang 2021-04-20  157  		if (i != 0)
4d7e5d0f31d800 Dave Jiang 2021-04-20  158  			idxd_device_release_int_handle(idxd,
4d7e5d0f31d800 Dave Jiang 2021-04-20  159  						       idxd->int_handles[i], IDXD_IRQ_MSIX);
969f28c718d7ff Dave Jiang 2021-04-15  160  	}
969f28c718d7ff Dave Jiang 2021-04-15  161   err_misc_irq:
40a641c467c2d0 Dave Jiang 2020-01-21  162  	/* Disable error interrupt generation */
40a641c467c2d0 Dave Jiang 2020-01-21  163  	idxd_mask_error_interrupts(idxd);
969f28c718d7ff Dave Jiang 2021-04-15  164   err_irq_entries:
969f28c718d7ff Dave Jiang 2021-04-15  165  	pci_free_irq_vectors(pdev);
40a641c467c2d0 Dave Jiang 2020-01-21  166  	dev_err(dev, "No usable interrupts\n");
40a641c467c2d0 Dave Jiang 2020-01-21  167  	return rc;
40a641c467c2d0 Dave Jiang 2020-01-21  168  }
40a641c467c2d0 Dave Jiang 2020-01-21  169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
