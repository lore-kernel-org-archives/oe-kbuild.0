Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8B259B71
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jun 2024 23:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719186735; cv=none; b=M03HrAGJISneZRmEb40zuxozHPmoqO/u5axOZt1Enj7r4NfHNO7yF8Zvbj8GSH6lxO5apbFEmmV4htj5COdLF5KKxI4f6Yw9J4yi9ph7tkTVmdgfsqNutfHtYlGwyAZ4XffFxnsjRygxSv/IqiUvjLPmWr0ja7J/KrmXYQSXfMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719186735; c=relaxed/simple;
	bh=jDmaZlfqmupfgnHgbA6f2nKMH9SQR/DkjIlkCiMPbKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KfCvePwzT59doqki8RuhFb8RAqjgJt633j1WyxtGpx+mQh0B5c4v+lzGW0WqJsB4VRmRJRjV3mlC25ntEcWmcjk1Zpjj4J3dLuGC3MVB74JWXKaySIcoTCZDMudE/PeXBCDN9vM94SnFC33OctbGQr2isqqz2fy4oLip9JOaNlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrcU1U+R; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrcU1U+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719186732; x=1750722732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDmaZlfqmupfgnHgbA6f2nKMH9SQR/DkjIlkCiMPbKg=;
  b=PrcU1U+RDYdDEHQtZXbm84BXnkd4AEYrHP4VfTLTHeSeSYLo1tejszDV
   qSlqjr+s+qyfAeJwYa2MA/Mrx5mL7mbuUQDxxsqNaqDmH5P1F93Kwaq0A
   yq7Z68XGLsX29bZxelqDX8V3CtVatr6ivL7WT/f14OU+PV9mvIEhDEut+
   KnfnH/K10DuFSvgb3yrzDbHPAl6y+KSGCgHBfhJ0yw05aZZ8vWZajh551
   NAC0CXit+sXPwne9JKoXGct/G/5OKSJPlXS4qYMh2qGwM5ra7y+x7yjfb
   FKEFPVfqQxaN+cRWcUmMU4cT42Nwv9yIV7gToIQ1bqW5o+pzrzsP6rOlh
   Q==;
X-CSE-ConnectionGUID: 81izMjtgRuSf+lp7asZs6A==
X-CSE-MsgGUID: f9p7ysprTRGpMELCk/DYXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="20025033"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="20025033"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 16:52:11 -0700
X-CSE-ConnectionGUID: xqODvO7vTwOhClBSq0IEWQ==
X-CSE-MsgGUID: NGhM7vgvRniMXKHBCF8Hgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="47582502"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jun 2024 16:52:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLX0C-000Bku-16;
	Sun, 23 Jun 2024 23:52:08 +0000
Date: Mon, 24 Jun 2024 07:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/pci/vfio_pci_intrs.c:509 vfio_msi_disable() warn:
 iterator 'i' not incremented
Message-ID: <202406240714.3QZCBolb-lkp@intel.com>
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
head:   f2661062f16b2de5d7b6a5c42a9a5c96326b8454
commit: b156e48fffa9f1caea490e4812a1451adb5c0ef4 vfio/pci: Use xarray for interrupt context storage
date:   1 year, 1 month ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 1 month ago
config: alpha-randconfig-r081-20240624 (https://download.01.org/0day-ci/archive/20240624/202406240714.3QZCBolb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406240714.3QZCBolb-lkp@intel.com/

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
