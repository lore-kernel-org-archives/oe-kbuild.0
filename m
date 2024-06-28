Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964C448788
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jun 2024 01:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536862; cv=none; b=kNDodU6Df9IMA6JzmEiREoCPq88YAz28JbfrfJkhOWtaHCghmKX8wd8Pw1PmLqAvUBP1w2umNq7CqvYWVpEvTQUbjq6MKv6+TuRsWJfhBik41y/LB41FILHpuZob6JTUYZoXlprXJdIX6X3/aZ4RcNNOF5e4Zrnqwz+fawJZEng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536862; c=relaxed/simple;
	bh=J5TtFIMXQRgKUvdEadpx6EMQ8faXDXNgDL88yMeZOrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jp273mzRPYcCxqcAhOeQ3pINm9As2PQXwxqigj9tTo8TEhKUk7BsHRC+w5c8QMbmOJskLWb3X32cafG381k8kftnkSpPyzSrtJvv5MbcYHbBnKN8BP851xp9y08zXlagfo9D/JpFPrmlZc0Yp7d8b+95OFIQvOGuGrWwR4xhA6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7lfNsCT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7lfNsCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719536860; x=1751072860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J5TtFIMXQRgKUvdEadpx6EMQ8faXDXNgDL88yMeZOrM=;
  b=W7lfNsCTgNwDAN0DCg/XzsFjwE/aOtV2NZed5pzuPUbyjGWdFiRrr9fO
   WhKkDsXeu38mAsL/vU66+zTk0Xb2k0zCUQxuCW20cXF0z990sX2dikY+Y
   8PcOtI1RWrbfI157RuBTV0l1CpKSua8JXFev+SjsDQ7nOG7Hhz15fWBw3
   SQHE1oGlT4a6fwObC2MwIK2kGvO8h/SkjCQlL6ExZJSq5uJYkxsxiJY+4
   TiT9sLiH3NfTdGt53FfnciYAh8ujE1m0WAFfVtj2/jdALEjWAkmh0daeY
   lNntzSLY6VG260Dvm1ncxMU6uUCyXpnJBMiNlbBVZ0K+p7skwp0UsMOx/
   g==;
X-CSE-ConnectionGUID: JbKkEFWoSpy0CDk8qZ9dMw==
X-CSE-MsgGUID: GrXoo3lrQaO51O7K4+p0NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="42122690"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="42122690"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 18:07:40 -0700
X-CSE-ConnectionGUID: gIGOiiADRX6Ymjs7gJfDow==
X-CSE-MsgGUID: 3Pw0wvjSQAGttuyjDLL77Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="44665149"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2024 18:07:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN05Q-000GgU-2j;
	Fri, 28 Jun 2024 01:07:36 +0000
Date: Fri, 28 Jun 2024 09:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/pci/vfio_pci_intrs.c:509 vfio_msi_disable() warn:
 iterator 'i' not incremented
Message-ID: <202406280959.mgXnW3W6-lkp@intel.com>
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
head:   6d6444ba82053c716fb5ac83346202659023044e
commit: b156e48fffa9f1caea490e4812a1451adb5c0ef4 vfio/pci: Use xarray for interrupt context storage
date:   1 year, 1 month ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 1 month ago
config: alpha-randconfig-r081-20240624 (https://download.01.org/0day-ci/archive/20240628/202406280959.mgXnW3W6-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406280959.mgXnW3W6-lkp@intel.com/

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
