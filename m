Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332CC3D5236
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440517; cv=none; b=FmcJo4waK9R/GeoK+xnM9QPmejUZW0b2rpKI6d9MICBdfUNcJAa8OwwF89rLSKL2gEW3W0RxV2BEYh5o8qIwkCnLsIF5cMS08pJrRZNmuy+zXTY48E2pQKk94ka4ewiK1zXSwdbtTX+DoO9Ca9ARwc6h5KvfTQ2E2GNKqj7EHYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440517; c=relaxed/simple;
	bh=SvD/IhDKnrXrqfydea0VtclR2RjRpb9yFg9OODKQSWc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fhSE+b5+3wFIoDqUqnVaT6qr/h8iqvC9kzaETGNddAhRN6KVVrORmhe/rqvoSvCOz4qupeyo7Dc18j7CUKNnLsxesVx3bSOWqiFhngeqvTymbD2CiGBcHjJechyst15q3EIpxaREwJ/7ud/dj91B8mmnJy5B7B73A2CsCc9uaBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNQUD8q7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNQUD8q7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774440517; x=1805976517;
  h=date:from:to:cc:subject:message-id;
  bh=SvD/IhDKnrXrqfydea0VtclR2RjRpb9yFg9OODKQSWc=;
  b=GNQUD8q7UlgLqnLsVx7npud18YNzR1h3J/FAjTKk0GIriJCkwKIbFtA/
   +L0oRuO8oOHIxyRPsAWlczvX3trMPimoxJDDR74Exy282hS5Y0E9BQu2N
   AHlqhVm14/GH3HPLuLraNL3depcfDgOZclWrVAmSvhURlS3xcDXiNHLSP
   1+/eaKIK+FNqQviwqSdTQ703dI6j9AtThTYXTdW7QUSX1xi0o897z9que
   3UAX6snE5dQbpmZVi5bDO6wAhH+zONqWHBKeWBS328tLdx/7Iyg3kiPpZ
   c6qZO6nLSL6Xk2YwpoMvM1JvZUwX9eba4SjOplC9APGRPETj1IXbZEHMa
   g==;
X-CSE-ConnectionGUID: 7vVa6oeQR+eumihWP680/w==
X-CSE-MsgGUID: IzpegJxxQh+tSxxIXKMc/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79330526"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79330526"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:08:35 -0700
X-CSE-ConnectionGUID: TLfx6MHrTtKCEWGULHREEg==
X-CSE-MsgGUID: TqQfXx+ZS/ONAtrJ1bHiyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224925537"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2026 05:08:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5N2D-000000006mT-0VTw;
	Wed, 25 Mar 2026 12:08:29 +0000
Date: Wed, 25 Mar 2026 20:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:99
 wx_request_msix_irqs_vf() warn: why call request_threaded_irq() with a NULL
 thread
Message-ID: <202603252044.Cacz4oRd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mengyuan Lou <mengyuanlou@net-swift.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: fd0a2e03bf6083354994c2efe2bd12e369c0c830 net: txgbevf: init interrupts and request irqs
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-r073-20260323 (https://download.01.org/0day-ci/archive/20260325/202603252044.Cacz4oRd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603252044.Cacz4oRd-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:99 wx_request_msix_irqs_vf() warn: why call request_threaded_irq() with a NULL thread
drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:115 wx_request_msix_irqs_vf() warn: 'entry->vector' from request_irq() not released on lines: 115.

vim +99 drivers/net/ethernet/wangxun/libwx/wx_vf_common.c

eb4898fde1de8c Mengyuan Lou 2025-07-04   73  
eb4898fde1de8c Mengyuan Lou 2025-07-04   74  int wx_request_msix_irqs_vf(struct wx *wx)
eb4898fde1de8c Mengyuan Lou 2025-07-04   75  {
eb4898fde1de8c Mengyuan Lou 2025-07-04   76  	struct net_device *netdev = wx->netdev;
eb4898fde1de8c Mengyuan Lou 2025-07-04   77  	int vector, err;
eb4898fde1de8c Mengyuan Lou 2025-07-04   78  
eb4898fde1de8c Mengyuan Lou 2025-07-04   79  	for (vector = 0; vector < wx->num_q_vectors; vector++) {
eb4898fde1de8c Mengyuan Lou 2025-07-04   80  		struct wx_q_vector *q_vector = wx->q_vector[vector];
eb4898fde1de8c Mengyuan Lou 2025-07-04   81  		struct msix_entry *entry = &wx->msix_q_entries[vector];
eb4898fde1de8c Mengyuan Lou 2025-07-04   82  
eb4898fde1de8c Mengyuan Lou 2025-07-04   83  		if (q_vector->tx.ring && q_vector->rx.ring)
eb4898fde1de8c Mengyuan Lou 2025-07-04   84  			snprintf(q_vector->name, sizeof(q_vector->name) - 1,
eb4898fde1de8c Mengyuan Lou 2025-07-04   85  				 "%s-TxRx-%d", netdev->name, entry->entry);
eb4898fde1de8c Mengyuan Lou 2025-07-04   86  		else
eb4898fde1de8c Mengyuan Lou 2025-07-04   87  			/* skip this unused q_vector */
eb4898fde1de8c Mengyuan Lou 2025-07-04   88  			continue;
eb4898fde1de8c Mengyuan Lou 2025-07-04   89  
eb4898fde1de8c Mengyuan Lou 2025-07-04   90  		err = request_irq(entry->vector, wx_msix_clean_rings, 0,
eb4898fde1de8c Mengyuan Lou 2025-07-04   91  				  q_vector->name, q_vector);
eb4898fde1de8c Mengyuan Lou 2025-07-04   92  		if (err) {
eb4898fde1de8c Mengyuan Lou 2025-07-04   93  			wx_err(wx, "request_irq failed for MSIX interrupt %s Error: %d\n",
eb4898fde1de8c Mengyuan Lou 2025-07-04   94  			       q_vector->name, err);
eb4898fde1de8c Mengyuan Lou 2025-07-04   95  			goto free_queue_irqs;
eb4898fde1de8c Mengyuan Lou 2025-07-04   96  		}
eb4898fde1de8c Mengyuan Lou 2025-07-04   97  	}
eb4898fde1de8c Mengyuan Lou 2025-07-04   98  
fd0a2e03bf6083 Mengyuan Lou 2025-07-04  @99  	err = request_threaded_irq(wx->msix_entry->vector, wx_msix_misc_vf,
fd0a2e03bf6083 Mengyuan Lou 2025-07-04  100  				   NULL, IRQF_ONESHOT, netdev->name, wx);
eb4898fde1de8c Mengyuan Lou 2025-07-04  101  	if (err) {
eb4898fde1de8c Mengyuan Lou 2025-07-04  102  		wx_err(wx, "request_irq for msix_other failed: %d\n", err);
eb4898fde1de8c Mengyuan Lou 2025-07-04  103  		goto free_queue_irqs;
eb4898fde1de8c Mengyuan Lou 2025-07-04  104  	}
eb4898fde1de8c Mengyuan Lou 2025-07-04  105  
eb4898fde1de8c Mengyuan Lou 2025-07-04  106  	return 0;
eb4898fde1de8c Mengyuan Lou 2025-07-04  107  
eb4898fde1de8c Mengyuan Lou 2025-07-04  108  free_queue_irqs:
eb4898fde1de8c Mengyuan Lou 2025-07-04  109  	while (vector) {
eb4898fde1de8c Mengyuan Lou 2025-07-04  110  		vector--;
eb4898fde1de8c Mengyuan Lou 2025-07-04  111  		free_irq(wx->msix_q_entries[vector].vector,
eb4898fde1de8c Mengyuan Lou 2025-07-04  112  			 wx->q_vector[vector]);
eb4898fde1de8c Mengyuan Lou 2025-07-04  113  	}
eb4898fde1de8c Mengyuan Lou 2025-07-04  114  	wx_reset_interrupt_capability(wx);
eb4898fde1de8c Mengyuan Lou 2025-07-04 @115  	return err;
eb4898fde1de8c Mengyuan Lou 2025-07-04  116  }
eb4898fde1de8c Mengyuan Lou 2025-07-04  117  EXPORT_SYMBOL(wx_request_msix_irqs_vf);
eb4898fde1de8c Mengyuan Lou 2025-07-04  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
