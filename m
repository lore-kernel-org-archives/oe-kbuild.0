Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345821;
	b=XYbkL8YIJ4622e3BOi/bTBRF9RbFV3VNBSr7Pq4mexkuxF5bVQCdmO5Nzpvy/lEiyZ5T
	 6TUdAPE3Jfk662uBBNxNjffF7gJWed4tOHzhsYrTO8cyJX0c6V/odAKPZK57W0cIGQM6Q
	 iE57BcRrQG8Mbg3D+dhCwGkb77GaFqOyPGQnR0Ns/xZ2ecU+HWO5pHABZ/8bsCqg3HENk
	 DKIZZzV8Da82ze88xOvzTbPKWoDGTSWC14F+J85FiBY3t2UW0iXeOLHisEufqHcS8YBvu
	 5Ek2RjA+R5K9Wt7dBoOhFwEMeC/MaEtrhAdIi4wPNSOms8DZaX4JYh2VEYxL2H8F0UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345821;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aXyg5fHjqP1ETLYbPNEIwUPKP7B/2Uo6Xo69OHDRt+A=;
	b=Jqc6AZOff9C5s8j0s1mX4yhQuTKZ9eAS0qoSVYSzMuKUROZSfV4UGlDVQXmJJOK+nLs3
	 PGAzj31baErY2bSwqJpqXI8FqWNS2E4LYloENFo+ZK/5BprXGsK3TxLK4zbqOsfwrHe9P
	 ++49k3uL+ogqX+GAovsWeCatI31KSoU2uEinMpBL5fb11Z+b0SbYuEEhMfQCVWp+Drg4O
	 riqRaOvWM1Bu1BpT6CBszpuwhM/OwVO68XEJQOPXCJcu6ejfIBkneVxetBYGop8sjUTkD
	 Tt6xwtsMW0i88t1sRH8aQZwRZW/eXTQ0cMqDJVO9zUdZACBmx1gsYl8jklazg2Mam3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EhuN8dsS;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC72606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 21:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EhuN8dsS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794345820; x=1825881820;
  h=date:from:to:cc:subject:message-id;
  bh=iY074jiIr3RM+f1zxprDF0oFJDPqLfXlvBmEQdoOMj8=;
  b=EhuN8dsSWFSV4hDvztjiKE0mwWN6Tn1cZmTeGcNcB4evovX6Zw8vrVl5
   lCu0JJIfeqXSByzKTGvFCFmFw3AbOe3chNndMeEyt0JEunCcIZ5/5sQ06
   Lxtp5sGZP6VyX6CCsOq8GI5k7K+VS8jzv17wo5bFvbqQPxDQMpWAR0Ov5
   fK24B6qraK+WK62W4EAMl3sKbpY44UnaKrntoN7LFd9XZv0H40yIbpzLP
   hsrs/sW7+S/x0zldKmiTkaAMFS/bin98sWLmwaAXR5sSuYB6OgM+4somD
   QXyzRbNXekjlgiCW62wH+SfbVwKnxO9S9IpeA3/DxEX76Fmbs9s8cFn+0
   g==;
X-CSE-ConnectionGUID: uVILHn6STBOGk0pn0fCc4A==
X-CSE-MsgGUID: 0CKaEHQ1RCSfVKpyoZQN5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3006959"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3006959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 13:23:39 -0800
X-CSE-ConnectionGUID: PGcaNhPaQAesv1yModXb0g==
X-CSE-MsgGUID: hyPnIpY3Sd2TaYEkzfhGBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8546280"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2026 13:23:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQtJY-000000000Mp-19BO;
	Tue, 10 Nov 2026 21:23:36 +0000
Date: Tue, 10 Nov 2026 22:22:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brgl:pwrseq/for-current 5/5]
 drivers/power/sequencing/pwrseq-pcie-m2.c:312
 pwrseq_pcie_m2_create_serdev_one() warn: missing error code 'ret'
Message-ID: <202611102257.rNVzlvSJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-gpio@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
head:   073f01043e79fd76f4fa648e58061c80329a6eef
commit: 073f01043e79fd76f4fa648e58061c80329a6eef [5/5] power: sequencing: fix serdev controller reference leak
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: sparc-randconfig-2200-20261110 (https://download.01.org/0day-ci/archive/20261110/202611102257.rNVzlvSJ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611102257.rNVzlvSJ-lkp@intel.com/

smatch warnings:
drivers/power/sequencing/pwrseq-pcie-m2.c:312 pwrseq_pcie_m2_create_serdev_one() warn: missing error code 'ret'

vim +/ret +312 drivers/power/sequencing/pwrseq-pcie-m2.c

3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  292  
c4be520907a429 Manivannan Sadhasivam 2026-05-19  293  static int pwrseq_pcie_m2_create_serdev_one(struct pwrseq_pcie_m2_ctx *ctx,
0822425512762d Manivannan Sadhasivam 2026-05-19  294  					struct pci_dev *pdev)
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  295  {
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  296  	struct serdev_controller *serdev_ctrl;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  297  	struct device *dev = ctx->dev;
0822425512762d Manivannan Sadhasivam 2026-05-19  298  	struct pwrseq_pci_dev *pci_dev;
073f01043e79fd Bartosz Golaszewski   2026-11-05  299  	int ret = 0;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  300  
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  301  	struct device_node *serdev_parent __free(device_node) =
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  302  		of_graph_get_remote_node(dev_of_node(ctx->dev), 3, 0);
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  303  	if (!serdev_parent)
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  304  		return 0;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  305  
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  306  	serdev_ctrl = of_find_serdev_controller_by_node(serdev_parent);
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  307  	if (!serdev_ctrl)
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  308  		return 0;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  309  
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  310  	/* Bail out if the device was already attached to this controller */
073f01043e79fd Bartosz Golaszewski   2026-11-05  311  	if (serdev_ctrl->serdev)
073f01043e79fd Bartosz Golaszewski   2026-11-05 @312  		goto err_put_ctrl;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  313  
c4be520907a429 Manivannan Sadhasivam 2026-05-19  314  	/* Bail out if the serdev device was already created for the PCI dev */
c4be520907a429 Manivannan Sadhasivam 2026-05-19  315  	scoped_guard(mutex, &ctx->list_lock) {
c4be520907a429 Manivannan Sadhasivam 2026-05-19  316  		list_for_each_entry(pci_dev, &ctx->pci_devices, list) {
c4be520907a429 Manivannan Sadhasivam 2026-05-19  317  			if (pci_dev->pdev == pdev)
073f01043e79fd Bartosz Golaszewski   2026-11-05  318  				goto err_put_ctrl;
c4be520907a429 Manivannan Sadhasivam 2026-05-19  319  		}
c4be520907a429 Manivannan Sadhasivam 2026-05-19  320  	}
c4be520907a429 Manivannan Sadhasivam 2026-05-19  321  
3a2c4d55e32ad6 Kees Cook             2026-09-02  322  	pci_dev = kzalloc_obj(*pci_dev);
0822425512762d Manivannan Sadhasivam 2026-05-19  323  	if (!pci_dev) {
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  324  		ret = -ENOMEM;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  325  		goto err_put_ctrl;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  326  	}
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  327  
0822425512762d Manivannan Sadhasivam 2026-05-19  328  	pci_dev->serdev = serdev_device_alloc(serdev_ctrl);
0822425512762d Manivannan Sadhasivam 2026-05-19  329  	if (!pci_dev->serdev) {
0822425512762d Manivannan Sadhasivam 2026-05-19  330  		ret = -ENOMEM;
0822425512762d Manivannan Sadhasivam 2026-05-19  331  		goto err_free_pci_dev;
0822425512762d Manivannan Sadhasivam 2026-05-19  332  	}
0822425512762d Manivannan Sadhasivam 2026-05-19  333  
f2aeaa6d47d3e9 Manivannan Sadhasivam 2026-05-19  334  	ret = pwrseq_pcie_m2_create_bt_node(ctx, pci_dev, serdev_parent, pdev);
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  335  	if (ret)
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  336  		goto err_free_serdev;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  337  
0822425512762d Manivannan Sadhasivam 2026-05-19  338  	ret = serdev_device_add(pci_dev->serdev);
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  339  	if (ret) {
f2aeaa6d47d3e9 Manivannan Sadhasivam 2026-05-19  340  		dev_err(dev, "Failed to add serdev for PCI device (%s): %d\n",
f2aeaa6d47d3e9 Manivannan Sadhasivam 2026-05-19  341  			pci_name(pdev), ret);
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  342  		goto err_free_dt_node;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  343  	}
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  344  
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  345  	serdev_controller_put(serdev_ctrl);
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  346  
0822425512762d Manivannan Sadhasivam 2026-05-19  347  	pci_dev->pdev = pci_dev_get(pdev);
0822425512762d Manivannan Sadhasivam 2026-05-19  348  
0822425512762d Manivannan Sadhasivam 2026-05-19  349  	mutex_lock(&ctx->list_lock);
0822425512762d Manivannan Sadhasivam 2026-05-19  350  	list_add_tail(&pci_dev->list, &ctx->pci_devices);
0822425512762d Manivannan Sadhasivam 2026-05-19  351  	mutex_unlock(&ctx->list_lock);
0822425512762d Manivannan Sadhasivam 2026-05-19  352  
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  353  	return 0;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  354  
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  355  err_free_dt_node:
0822425512762d Manivannan Sadhasivam 2026-05-19  356  	device_remove_of_node(&pci_dev->serdev->dev);
0822425512762d Manivannan Sadhasivam 2026-05-19  357  	of_changeset_revert(pci_dev->ocs);
0822425512762d Manivannan Sadhasivam 2026-05-19  358  	of_changeset_destroy(pci_dev->ocs);
0822425512762d Manivannan Sadhasivam 2026-05-19  359  	kfree(pci_dev->ocs);
0822425512762d Manivannan Sadhasivam 2026-05-19  360  	pci_dev->ocs = NULL;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  361  err_free_serdev:
0822425512762d Manivannan Sadhasivam 2026-05-19  362  	serdev_device_put(pci_dev->serdev);
0822425512762d Manivannan Sadhasivam 2026-05-19  363  	pci_dev->serdev = NULL;
0822425512762d Manivannan Sadhasivam 2026-05-19  364  err_free_pci_dev:
0822425512762d Manivannan Sadhasivam 2026-05-19  365  	kfree(pci_dev);
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  366  err_put_ctrl:
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  367  	serdev_controller_put(serdev_ctrl);
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  368  
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  369  	return ret;
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  370  }
3f736aecbdc8e4 Manivannan Sadhasivam 2026-03-26  371  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
