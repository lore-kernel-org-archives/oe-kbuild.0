Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD31CCCC4
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jun 2024 17:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719596212; cv=none; b=p+bL3BExUcV5HnLgsfy8ziyacwoAUwl0hWxKfaXpqm6rFa5g3sviMyCVyuHI3qzb26e6qcpi6Gb/aueHKVFJcSSjr7F9MZPbP2kyuRvQP+fuYvp5gfCDWSvVoBsRmtr7klolAAV75qbpuXWQnByUaAOijerCOZ06RumNJ3iV3EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719596212; c=relaxed/simple;
	bh=UxAb1C0JF03S41BL9+3dHblj9pByn08ABLPKpj4jVoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5yd3DBRSC9cawIX0O+qewYc9et0wixK/K5QtVM/QKmQ1a6RDdIFddMaYrw3dOvupcnr1ILU5q46qacDWE7JA5vm3XFUo1AoP0Tfm7rIZSU4h0ijWXa+D8ATH2TeCKaDblacz/1xwXX8eadgTa3A7C0d0c4jV4659lKo3UVdPI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YliNw/ss; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YliNw/ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719596211; x=1751132211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UxAb1C0JF03S41BL9+3dHblj9pByn08ABLPKpj4jVoQ=;
  b=YliNw/ssjJaWAa3PG72Vur3SvP3SvcMrojwFdqAZ7hCmNN+XQOiXRzJP
   mhUND1w4dsdZuSYqIwHWZd3oBLiEKs8ixY0OkitI8A0E92dGNmpRPbcjg
   AhEK4eTE9NaxA5pCbzHjOEMO9F3KVZnPq2T+V+llJqz6rdoAnRLnna7yH
   I9mWo3MQGvcWmTJ0vEhwe1+Gm+cOatqNgLxhEJxr0dIGEVolS0vyUadRk
   hUgLA6ErCtivVKc+vjBdN4neQ4r1OsYuMaf8+5/O1+Mr/sdv7zu9Kpgkt
   RQ23PfH/NxaLoEMUMqmaKB8N0qptAnFJmXi0NSy408T0JSBKV9LYiubhF
   g==;
X-CSE-ConnectionGUID: 11XPL0sNT1iNaPLeTL++EA==
X-CSE-MsgGUID: zpycUtJ4RsCaBnNYUg7ggQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16526101"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16526101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 10:36:50 -0700
X-CSE-ConnectionGUID: Q7ZUWyyaR3aGiN523skyCQ==
X-CSE-MsgGUID: qfTrIUMPR7uu1RN0stFcqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49276417"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jun 2024 10:36:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNFWh-000Hco-0k;
	Fri, 28 Jun 2024 17:36:47 +0000
Date: Sat, 29 Jun 2024 01:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/pci/vfio_pci_intrs.c:509 vfio_msi_disable() warn:
 iterator 'i' not incremented
Message-ID: <202406290125.t2IaRAav-lkp@intel.com>
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
head:   5bbd9b249880dba032bffa002dd9cd12cd5af09c
commit: b156e48fffa9f1caea490e4812a1451adb5c0ef4 vfio/pci: Use xarray for interrupt context storage
date:   1 year, 1 month ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 1 month ago
config: alpha-randconfig-r081-20240624 (https://download.01.org/0day-ci/archive/20240629/202406290125.t2IaRAav-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406290125.t2IaRAav-lkp@intel.com/

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
