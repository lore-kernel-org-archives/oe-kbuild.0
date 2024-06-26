Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0435916B
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 03:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719374104; cv=none; b=hqWUYR/4oqDiXJfKN7+6tO6jeG/lvZT0/SfcGwdRBZ8qVrl67YN88gKcj4vKJYfD/ulGrnj2JGIWW1QLNXBG3UaG97avadVRdIiOKEvWAzb1eV5hDQYesPJMoNSLVJlEM/RKDh2Q1EzTwdck4F3Geqd8N3p7gr6Wh6OI/PLFKLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719374104; c=relaxed/simple;
	bh=RAMP5J43IRpB/p1OUQJ5mCgLEGCcX1Rt1+Z2+Z9jf3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JCmoRQUDMKmQ3TBJaF16Bim5M1mm5a+CvOQfvJrLdZIQ79XdVD8AohMbA15EyzadPtDyIhC1diiVPoh2i5FuXyubP/EmYq0FkVKvk4pEXhdgCpaEKLOyxYSBMFDcYRx2OgtbmQKnlLO2fWmV5HQkCl3qJMmyRygCQIiaVB5VOVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYikPV9N; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYikPV9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719374103; x=1750910103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RAMP5J43IRpB/p1OUQJ5mCgLEGCcX1Rt1+Z2+Z9jf3k=;
  b=VYikPV9Nt1KgesU/n+tscbm5zPjccKMfBi67WIqIhJdFD/+tv9W+Ocnm
   jEiMNKvD38aKepCofNscxxnKD2MK8k5bE2pbXTwufWm3384OVNVov4miU
   Y02A/NIa97bX0F40lGYWgSM6enfCAzizCE1pUNFBmci2NUI5rX3rNTGZi
   oZpwd4JA/jdO9xPIfBHjSq6ujMyaWxyPwX46FMjNLwXI+pvN8GlWVkWws
   /5YuQlMrR83NF1+hSdpeuxxolsq0dHvka9h/a8b/yT/AB4ciJP1Zr70bt
   KXJC0NN8qMA6PFxsXopVhTGUTmo1x+SAZL3s1k7UxPsrdLkegz+kOLKFB
   g==;
X-CSE-ConnectionGUID: DnW4pa+mRli6ivkFL+VBPA==
X-CSE-MsgGUID: HMg+x0LAS8eHttB/9mO+EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27113511"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="27113511"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 20:55:02 -0700
X-CSE-ConnectionGUID: 9x6POzJ0QGGyXCSbsKaSbw==
X-CSE-MsgGUID: qkbr9BnjTxCXwEr90Co0JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="48784020"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jun 2024 20:55:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMJkI-000Exm-0U;
	Wed, 26 Jun 2024 03:54:58 +0000
Date: Wed, 26 Jun 2024 11:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/pci/vfio_pci_intrs.c:509 vfio_msi_disable() warn:
 iterator 'i' not incremented
Message-ID: <202406261143.zakQoSwr-lkp@intel.com>
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
:::::: branch date: 33 hours ago
:::::: commit date: 1 year, 1 month ago
config: alpha-randconfig-r081-20240624 (https://download.01.org/0day-ci/archive/20240626/202406261143.zakQoSwr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406261143.zakQoSwr-lkp@intel.com/

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
