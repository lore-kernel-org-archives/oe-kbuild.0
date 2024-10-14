Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8571AC8A2
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917974; cv=none; b=GobyA49Ws8hr3B/ibYjncOFNdLY4pySeVwcY+zb0xnA8k0R5aWzVbtAdI5V/v3LMaz+g60dadeynaJDTIftodan4T77UgY4ee7ZojR3qVhk27r3FwEP72Cjobyhr33hXO5X2Vb8i7nK8sXEjd80vDJy0q2sOYGq+XdoUUxmTL0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917974; c=relaxed/simple;
	bh=mLSTPyaXrqRNHHy+pLwndiHOwHjpcztOuTd+4UyQyEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UqHWSPlbfmu5VyHsY0nZX5vA7bXswgEkSTs2g1f2tHRPM0TsLz++tdK1ZPaozqey2Y2LNSCY2sjmIkRk08hj64Jw0jMxMKXE6dI4wfDivWmle2j5kg9+E4cOZFpy9JBgR5PcbBN0m2uDIUKXcBvZgzX1IoHEbc2KpV0spHYMOYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1Xv9G2a; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1Xv9G2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728917973; x=1760453973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mLSTPyaXrqRNHHy+pLwndiHOwHjpcztOuTd+4UyQyEg=;
  b=V1Xv9G2a1ogDNmkUKmaQ6OeUdeCEuSFfxDm9SdbDJE7UDtgAyy4XMjZg
   Emk8zGdxy/eluunn+sgwPeT4Poo8ZMtQGRlo4eU88IIOq5CfbhZdpRpdp
   rXFMjOtCnuPwNK9qMeg9UNLnHPZQh3ruRsMF0D/MR69V7m7hK9SFKKRy4
   Bk6rE3+vXGyRJfJuPKtMaMXbYtgbq940IQLbkqYxZ22TjvBdnSmrXRBAO
   N5OdAmY1w/9IkEnF4XT+kbQ+nDFHGHHi0Mgig0wVz5mDJnXsEebC9dAlA
   GotIdR7cuwQ+35ayuirEt5StWI1PPEq1aRzUYo6LctNAP0rwqP6urQ99K
   w==;
X-CSE-ConnectionGUID: QIjcLuNmT1agp3rHRjKM0g==
X-CSE-MsgGUID: 6Oku03RXRkORnls3ypyR9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28153847"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28153847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:59:31 -0700
X-CSE-ConnectionGUID: aBxuElx9T4m+D4zYC2/bfw==
X-CSE-MsgGUID: Kx96kmqbRryXyaTzqqw70A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77258101"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2024 07:59:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0MXf-000G5P-0l;
	Mon, 14 Oct 2024 14:59:27 +0000
Date: Mon, 14 Oct 2024 22:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/s390/cio/qdio_main.c:735 qdio_establish_handle_irq() warn:
 missing unwind goto?
Message-ID: <202410142203.nc2L66Sk-lkp@intel.com>
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
head:   6485cf5ea253d40d507cd71253c9568c5470cd27
commit: 607638faf2ff1cede37458111496e7cc6c977f6f s390/qdio: handle deferred cc1
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-r073-20241014 (https://download.01.org/0day-ci/archive/20241014/202410142203.nc2L66Sk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410142203.nc2L66Sk-lkp@intel.com/

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
