Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFB110B
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jun 2023 01:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687137599; x=1718673599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QiPJzF4l5CR+MXOsRw/z8PxSYBx3LSvFunn5stXyP/s=;
  b=DLqlywN2f9tFVn7C92el+oENONVoe3vTpFimCMqZeYOkXmCMt6yGH4v3
   VLayfcoJAWCQqGg73WfkU/tg6vg81xy58Un3n/CMCasPfHCWJskDFr6No
   5rK4ECE2aE2H1ZW2End2QjmEYiyyaKjo03L+Hz+jKz0VwSoW/wZI/LD7f
   8X3Y0/GHPMs9fHdhftI86jImIaIeeG2p898lTBXo1iwtS++QNzfLCMlPN
   v6L4f0AEp0LbNo53qGoAeaLbIL6epZ96elhH01iXKaGWTxtvvbL2QFc5N
   sX+Ubo19CaNZb7ZfJYTcnDoAn5C7eoLxlEsaZ3ek9HjgFy6K+zEUGuYZb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="445903347"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="445903347"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 18:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="1043715625"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="1043715625"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2023 18:19:57 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB3Yi-0004Bo-0N;
	Mon, 19 Jun 2023 01:19:56 +0000
Date: Mon, 19 Jun 2023 09:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stable:linux-5.15.y 8065/9999] arch/um/drivers/virt-pci.c:644:9:
 error: implicit declaration of function 'virtio_reset_device'; did you mean
 'virtio_break_device'?
Message-ID: <202306190915.1xcsSzA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Benjamin Berg <benjamin.berg@intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Richard Weinberger <richard@nod.at>
CC: Sasha Levin <sashal@kernel.org>

Hi Benjamin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   471e639e59d128f4bf58000a118b2ceca3893f98
commit: a27e95a6ff3fd633422ca44c6d571ef84392f5b8 [8065/9999] um: virt-pci: properly remove PCI device from bus
:::::: branch date: 5 days ago
:::::: commit date: 3 months ago
config: um-randconfig-r002-20230619 (https://download.01.org/0day-ci/archive/20230619/202306190915.1xcsSzA4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190915.1xcsSzA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306190915.1xcsSzA4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/um/drivers/virt-pci.c: In function 'um_pci_virtio_remove':
>> arch/um/drivers/virt-pci.c:644:9: error: implicit declaration of function 'virtio_reset_device'; did you mean 'virtio_break_device'? [-Werror=implicit-function-declaration]
     644 |         virtio_reset_device(vdev);
         |         ^~~~~~~~~~~~~~~~~~~
         |         virtio_break_device
   cc1: some warnings being treated as errors


vim +644 arch/um/drivers/virt-pci.c

68f5d3f3b654326 Johannes Berg 2021-03-05  615  
68f5d3f3b654326 Johannes Berg 2021-03-05  616  static void um_pci_virtio_remove(struct virtio_device *vdev)
68f5d3f3b654326 Johannes Berg 2021-03-05  617  {
68f5d3f3b654326 Johannes Berg 2021-03-05  618  	struct um_pci_device *dev = vdev->priv;
68f5d3f3b654326 Johannes Berg 2021-03-05  619  	int i;
68f5d3f3b654326 Johannes Berg 2021-03-05  620  
68f5d3f3b654326 Johannes Berg 2021-03-05  621  	device_set_wakeup_enable(&vdev->dev, false);
68f5d3f3b654326 Johannes Berg 2021-03-05  622  
68f5d3f3b654326 Johannes Berg 2021-03-05  623  	mutex_lock(&um_pci_mtx);
68f5d3f3b654326 Johannes Berg 2021-03-05  624  	for (i = 0; i < MAX_DEVICES; i++) {
68f5d3f3b654326 Johannes Berg 2021-03-05  625  		if (um_pci_devices[i].dev != dev)
68f5d3f3b654326 Johannes Berg 2021-03-05  626  			continue;
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  627  
68f5d3f3b654326 Johannes Berg 2021-03-05  628  		um_pci_devices[i].dev = NULL;
68f5d3f3b654326 Johannes Berg 2021-03-05  629  		irq_free_desc(dev->irq);
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  630  
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  631  		break;
68f5d3f3b654326 Johannes Berg 2021-03-05  632  	}
68f5d3f3b654326 Johannes Berg 2021-03-05  633  	mutex_unlock(&um_pci_mtx);
68f5d3f3b654326 Johannes Berg 2021-03-05  634  
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  635  	if (i < MAX_DEVICES) {
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  636  		struct pci_dev *pci_dev;
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  637  
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  638  		pci_dev = pci_get_slot(bridge->bus, i);
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  639  		if (pci_dev)
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  640  			pci_stop_and_remove_bus_device_locked(pci_dev);
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  641  	}
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  642  
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  643  	/* Stop all virtqueues */
a27e95a6ff3fd63 Benjamin Berg 2023-02-09 @644  	virtio_reset_device(vdev);
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  645  	dev->cmd_vq = NULL;
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  646  	dev->irq_vq = NULL;
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  647  	vdev->config->del_vqs(vdev);
68f5d3f3b654326 Johannes Berg 2021-03-05  648  
68f5d3f3b654326 Johannes Berg 2021-03-05  649  	kfree(dev);
68f5d3f3b654326 Johannes Berg 2021-03-05  650  }
68f5d3f3b654326 Johannes Berg 2021-03-05  651  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
