Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D971BC2F
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Jun 2024 01:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719280362; cv=none; b=UgCqcMFuKnrmlht13LJPJRJDwYkrVZYtmrIXrDY104FCR+SN7OR60Zqatm7SwWEA8ukx9KjswcG7pEdw+sm7pPSt7zlnk3CwLPvVWEqADrWUh0grDBFYG/v7PDoDvWKmvQNGSt0bj+kffTA47Z77kQYxh7DPDc3ZxGowQoQOJtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719280362; c=relaxed/simple;
	bh=ZjfnnT+1pMqfPmQTubsp/A4QDNyFSoXPGF496Q+iXNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reozaF3xGh4cy+88IORhLMDRRIS9u2og+bwt4NVnNrjIMQ2tSQ+lVaXZzhC03X2yDSt0JVbsTY2NyyiiieYUWMbetfc0mytlGCafC9zrFP0ckMYLg4AKJ7htp1i2fu7O/218XJZV1rwy0+ivSQUzGooyS0B6AR/eY8L18BfwbiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOkrq1r+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOkrq1r+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719280360; x=1750816360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZjfnnT+1pMqfPmQTubsp/A4QDNyFSoXPGF496Q+iXNs=;
  b=DOkrq1r+3paGxo34r0ZXIao0VlN7TldID0pnMz/vgUH2lPabk0bc+IyF
   +QOsc2zxYivClBpCyxU0vrPFmNccb8vHv3e7T/VKDdADlBt1aaYNPzTzo
   8G4Hp/hfYAMrGmDEBCa8WC99Vwp+0nn+hpNZQ8ZqjOTiBITKVCesGClDp
   2qQwdg0z+wmSntUIfXs1OvZojJlhmIm9bAeJvlNJrwbqFNDvBX3zCTiBm
   19VyiQTq9yl2PRXL2mWjwu+P4PegbIozTgY7pyJqtgN2Hl1bZCPK+NRpT
   VpdMzERQN+vc+5uviF2Ly0Xxz0hZrzJZr/vcPp0nKGzXbhP0PtSwnrD9a
   A==;
X-CSE-ConnectionGUID: zeV8JWjqS9eXTvkE8m9ykg==
X-CSE-MsgGUID: 0Qjfaf86SMGwkGccCZj+XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="38789411"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="38789411"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 18:52:39 -0700
X-CSE-ConnectionGUID: 9k8Vvb7rRjmQGSbhTTo2lg==
X-CSE-MsgGUID: lgW9QXRLS0SRrHvkyxarvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="43296757"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2024 18:52:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLvMK-000Duo-0l;
	Tue, 25 Jun 2024 01:52:36 +0000
Date: Tue, 25 Jun 2024 09:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/pci/vfio_pci_intrs.c:509 vfio_msi_disable() warn:
 iterator 'i' not incremented
Message-ID: <202406250948.nM3WdZ72-lkp@intel.com>
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
TO: Reinette Chatre <reinette.chatre@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   55027e689933ba2e64f3d245fb1ff185b3e7fc81
commit: b156e48fffa9f1caea490e4812a1451adb5c0ef4 vfio/pci: Use xarray for interrupt context storage
date:   1 year, 1 month ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 1 month ago
config: alpha-randconfig-r081-20240624 (https://download.01.org/0day-ci/archive/20240625/202406250948.nM3WdZ72-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406250948.nM3WdZ72-lkp@intel.com/

smatch warnings:
drivers/vfio/pci/vfio_pci_intrs.c:509 vfio_msi_disable() warn: iterator 'i' not incremented

vim +/i +509 drivers/vfio/pci/vfio_pci_intrs.c

89e1f7d4c66d85 Alex Williamson   2012-07-31  501  
536475109c8284 Max Gurtovoy      2021-08-26  502  static void vfio_msi_disable(struct vfio_pci_core_device *vdev, bool msix)
89e1f7d4c66d85 Alex Williamson   2012-07-31  503  {
89e1f7d4c66d85 Alex Williamson   2012-07-31  504  	struct pci_dev *pdev = vdev->pdev;
d977e0f7663961 Reinette Chatre   2023-05-11  505  	struct vfio_pci_irq_ctx *ctx;
b156e48fffa9f1 Reinette Chatre   2023-05-11  506  	unsigned long i;
abafbc551fdded Alex Williamson   2020-04-22  507  	u16 cmd;
89e1f7d4c66d85 Alex Williamson   2012-07-31  508  
b156e48fffa9f1 Reinette Chatre   2023-05-11 @509  	xa_for_each(&vdev->ctx, i, ctx) {
d977e0f7663961 Reinette Chatre   2023-05-11  510  		vfio_virqfd_disable(&ctx->unmask);
d977e0f7663961 Reinette Chatre   2023-05-11  511  		vfio_virqfd_disable(&ctx->mask);
a65f35cfd504e5 Reinette Chatre   2023-05-11  512  		vfio_msi_set_vector_signal(vdev, i, -1, msix);
89e1f7d4c66d85 Alex Williamson   2012-07-31  513  	}
89e1f7d4c66d85 Alex Williamson   2012-07-31  514  
abafbc551fdded Alex Williamson   2020-04-22  515  	cmd = vfio_pci_memory_lock_and_enable(vdev);
61771468e0a567 Christoph Hellwig 2016-09-11  516  	pci_free_irq_vectors(pdev);
abafbc551fdded Alex Williamson   2020-04-22  517  	vfio_pci_memory_unlock_and_restore(vdev, cmd);
89e1f7d4c66d85 Alex Williamson   2012-07-31  518  
c93a97ee0583cd Alex Williamson   2016-09-26  519  	/*
c93a97ee0583cd Alex Williamson   2016-09-26  520  	 * Both disable paths above use pci_intx_for_msi() to clear DisINTx
c93a97ee0583cd Alex Williamson   2016-09-26  521  	 * via their shutdown paths.  Restore for NoINTx devices.
c93a97ee0583cd Alex Williamson   2016-09-26  522  	 */
c93a97ee0583cd Alex Williamson   2016-09-26  523  	if (vdev->nointx)
c93a97ee0583cd Alex Williamson   2016-09-26  524  		pci_intx(pdev, 0);
c93a97ee0583cd Alex Williamson   2016-09-26  525  
89e1f7d4c66d85 Alex Williamson   2012-07-31  526  	vdev->irq_type = VFIO_PCI_NUM_IRQS;
89e1f7d4c66d85 Alex Williamson   2012-07-31  527  	vdev->num_ctx = 0;
89e1f7d4c66d85 Alex Williamson   2012-07-31  528  }
89e1f7d4c66d85 Alex Williamson   2012-07-31  529  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
