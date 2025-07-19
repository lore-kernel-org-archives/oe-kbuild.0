Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4892A1BA
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 04:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752897694; cv=none; b=F0pHiSznJlbNBNMdenkaZXyWM3shEalwLy8bg/baTCz2NBeQ2qDvq2Njk0pAM85k7py87jZEQKjxiacWCOLVmfmyNqT03GYPgmndcOhHKCFn2oSntLDxYK5meOF1t8eL8m52HdHBlqGpTbxgGTZTkEOYh5ZWir5uwn6M7J5YIrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752897694; c=relaxed/simple;
	bh=VTMaYEU8k0buq/8QJ2uUWwIRFrj2t69eEEroLBk//gE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rp3Ky60kGx8GCigPirHtjFFn2iWgqTlHtFunQZ0P0mYpIxN6Etm7pEgCpGQY6nMllE+DIt2HxQ1HCIKCv5EFbV/TKOawtECsRHdY4LALslbx34stSkzXyUZOjlqN5UdeuSjcd7tIjYX7OgQKhf2H3ZQQRxG/SMXvRoKN58MT/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPP41l8k; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPP41l8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752897692; x=1784433692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VTMaYEU8k0buq/8QJ2uUWwIRFrj2t69eEEroLBk//gE=;
  b=kPP41l8k7rImnbs4eYZ3VQDm/LEh3BXL/OzLkcC9BXpzV4O1sbn+/pYB
   tQrLXoJKNfRb/VVCxLpdxvqRl62ogFnKYJcS5oNIglRrYOwpmSi2e2S4G
   j9GrAWaHywDNfLJNrW6VvlY/IvrLweV/HBuG3N0acsNNJM+vQNO3PFZat
   GVZTW15U1s6KWUHNvebRM3jgno4oYic+B18mqSwLf/gCfmG7Dmq6xpnWT
   1rpGqzn2tfwl4kSaCHHb5ssI9rI7ctLqGH0vGLeq1YSX0gnXQZLVHi7MK
   qnBZ3LnvWXt864ksDN6z8Eje34+gOzSCWk6No+UXKmbQ0tGVyuyczGZRt
   w==;
X-CSE-ConnectionGUID: hTwjrm22Sv6xE+3FEL1JRw==
X-CSE-MsgGUID: 9sxPaWdCR6OKYyvuc8CtnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54296153"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="54296153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 21:01:30 -0700
X-CSE-ConnectionGUID: jjGiIU8lRKyKExOgLLlZ3A==
X-CSE-MsgGUID: GkgtYGlYSICjrByp8EEncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="162415597"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2025 21:01:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucylK-000FEc-2B;
	Sat, 19 Jul 2025 04:01:26 +0000
Date: Sat, 19 Jul 2025 12:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7606/11307]
 drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:99
 wx_request_msix_irqs_vf() warn: why call request_threaded_irq() with a NULL
 thread
Message-ID: <202507191110.FWkwuVJQ-lkp@intel.com>
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
TO: Mengyuan Lou <mengyuanlou@net-swift.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: fd0a2e03bf6083354994c2efe2bd12e369c0c830 [7606/11307] net: txgbevf: init interrupts and request irqs
:::::: branch date: 15 hours ago
:::::: commit date: 9 days ago
config: parisc-randconfig-r071-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191110.FWkwuVJQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507191110.FWkwuVJQ-lkp@intel.com/

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
