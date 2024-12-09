Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89D41662E9
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718927; cv=none; b=JzL4k4viwroluGWHBJz7yBhMOVJ/dxe+XcwmLYQDDurnbrp/UsaaypbUYUc6ZbQaCXiGwGFle1D0rCwIrzRzBLOHT/SZkDrsSMUAoir+OiriV3CCtBqf0/YCa5XfG1FESLfOaj0vn+2WdQ+zYxBBTgscfgQKfkvK6neHp2UowhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718927; c=relaxed/simple;
	bh=okDmUtznhzRsEIB90ofh3mxeCLT/sWnkdxBqyktVys0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qgIeZJVfqnG4T0nbxyaGIVxTInnPCrkqtfYmSVCJveKKBMFpIqKxYTTBTs92fVubCPXTiNqNgVd1ipIjLTx9T2Dugon4z3wHyF9hDpuLYYsdJMCOe2I+OSZgJpdIWCnomzigNWAL7EcHAmp59UUhqFcG8gwmGr5m4U8R1q3VE5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdM6bnio; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdM6bnio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718926; x=1765254926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=okDmUtznhzRsEIB90ofh3mxeCLT/sWnkdxBqyktVys0=;
  b=LdM6bnioPNuO/dVWo5Y81Pzg9kQ6FYJPD+pDezhCnXr1nXZ6Okp+Omt2
   SfTZZf+qnwR/q/XbMRc1bKU4BH4wCdhED2qVxNUMVdsTFfAK6KhJPiDA/
   KMcdRXE1L0AfuZ8ZdQ6Vb8+TX3T/3GebtXztocAr7jxzp8vMauvbqrVIN
   zts3D0KXw+x/FvIb073bZ5+pCSDZATMM/6D1pbiwmpw1h5wvf+JCHmXps
   Da/AAjzAvjkvYu+opSo4uWp9w8EAagNaro+UZ+ZMnpommLlNI5eoMoC28
   /D4aqBG+1FJf6i+yO/wKvRlVTSEZlP9zHy9QumW7Pv6TE00qM7l4YVEAq
   Q==;
X-CSE-ConnectionGUID: y8vaSSiCSsGwUDA0381n4w==
X-CSE-MsgGUID: uK3ztTiUTwaiUJlylRdtEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33916668"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33916668"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:35:23 -0800
X-CSE-ConnectionGUID: 8bmajQzZQ0+L2gEjePAIwg==
X-CSE-MsgGUID: /8dDxnoeRCStx3yFSpTAnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="118204026"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Dec 2024 20:35:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVUO-0003sn-1v;
	Mon, 09 Dec 2024 04:35:20 +0000
Date: Mon, 9 Dec 2024 12:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/s390/cio/qdio_main.c:735 qdio_establish_handle_irq() warn:
 missing unwind goto?
Message-ID: <202412080852.EvxEqxjU-lkp@intel.com>
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
TO: Peter Oberparleiter <oberpar@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Alexandra Winter <wintera@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: 607638faf2ff1cede37458111496e7cc6c977f6f s390/qdio: handle deferred cc1
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-r071-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080852.EvxEqxjU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412080852.EvxEqxjU-lkp@intel.com/

smatch warnings:
drivers/s390/cio/qdio_main.c:735 qdio_establish_handle_irq() warn: missing unwind goto?

vim +735 drivers/s390/cio/qdio_main.c

779e6e1c724d30 Jan Glauber         2008-07-17  724  
607638faf2ff1c Peter Oberparleiter 2024-04-10  725  static int qdio_establish_handle_irq(struct qdio_irq *irq_ptr, int cstat,
607638faf2ff1c Peter Oberparleiter 2024-04-10  726  				     int dstat, int dcc)
779e6e1c724d30 Jan Glauber         2008-07-17  727  {
4c57542320e73b Jan Glauber         2009-06-12  728  	DBF_DEV_EVENT(DBF_INFO, irq_ptr, "qest irq");
779e6e1c724d30 Jan Glauber         2008-07-17  729  
4c57542320e73b Jan Glauber         2009-06-12  730  	if (cstat)
779e6e1c724d30 Jan Glauber         2008-07-17  731  		goto error;
4c57542320e73b Jan Glauber         2009-06-12  732  	if (dstat & ~(DEV_STAT_DEV_END | DEV_STAT_CHN_END))
779e6e1c724d30 Jan Glauber         2008-07-17  733  		goto error;
607638faf2ff1c Peter Oberparleiter 2024-04-10  734  	if (dcc == 1)
607638faf2ff1c Peter Oberparleiter 2024-04-10 @735  		return -EAGAIN;
4c57542320e73b Jan Glauber         2009-06-12  736  	if (!(dstat & DEV_STAT_DEV_END))
4c57542320e73b Jan Glauber         2009-06-12  737  		goto error;
4c57542320e73b Jan Glauber         2009-06-12  738  	qdio_set_state(irq_ptr, QDIO_IRQ_STATE_ESTABLISHED);
607638faf2ff1c Peter Oberparleiter 2024-04-10  739  	return 0;
4c57542320e73b Jan Glauber         2009-06-12  740  
779e6e1c724d30 Jan Glauber         2008-07-17  741  error:
22f9934767f490 Jan Glauber         2008-12-25  742  	DBF_ERROR("%4x EQ:error", irq_ptr->schid.sch_no);
22f9934767f490 Jan Glauber         2008-12-25  743  	DBF_ERROR("ds: %2x cs:%2x", dstat, cstat);
779e6e1c724d30 Jan Glauber         2008-07-17  744  	qdio_set_state(irq_ptr, QDIO_IRQ_STATE_ERR);
607638faf2ff1c Peter Oberparleiter 2024-04-10  745  	return -EIO;
779e6e1c724d30 Jan Glauber         2008-07-17  746  }
779e6e1c724d30 Jan Glauber         2008-07-17  747  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
