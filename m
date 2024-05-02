Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0D160797
	for <oe-kbuild@lists.linux.dev>; Thu,  2 May 2024 19:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714676638; cv=none; b=lt4oMteXr83K1cAZmB2XiiiZ76fp9TkIDN80JRcQwFHsK/fvstvhHWS+F/JN4ogOW0HiqNrOJ6OEwrrJQ6fsvyVAq6Dr8PJ7DjMnFwWo0X52Dgraw0OYZFjfcP4vY8k1koqyhBPPJ24lyBoSeKJvC04NEJXJFsFP7Yy2DBhbD3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714676638; c=relaxed/simple;
	bh=Zegxr/xJ3c2LZVvsU/KT2umqNDPYE8ApRUHQIQ/OBlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UO2NdH0klLihFax8u4yGQmGgtfX/OJNqNXPSgBp8MohHlbZCIw6rwzp87PGsEjVtdBFyCpYt0m9Zo5ITcK4C64n4OCCDXZm6nbq9Cw+aAlmnK1rt6h4Hrw2oQQzP+KETGBfoqLj9RlddMFCZbuPDDYkDW/YRBfnaZuoST7ZIPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvR5fXti; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvR5fXti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714676636; x=1746212636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zegxr/xJ3c2LZVvsU/KT2umqNDPYE8ApRUHQIQ/OBlw=;
  b=CvR5fXtiBckiYUnQPnxIqhxWgpnh9U6fkkae3dC+Li1FpdeXVCuOG6r9
   Cx89ws6OgzvNmp2EDe4VmvjGq/5QN4Vm71gC/CUnWTIKeE5GwfZhecdIz
   OsUzvWzF5+nf1tCaDWE03eF70ALV1pV68UqcyONc81YC08k8tOLfjv9vJ
   E0Es7LPePrqCrXOixgxLCm3e8nmcOrzFzBEUNT3OdzNEdw3DATIc1jPoe
   8gVY7lq4kFm1aBuH7NwmZl52W5gWaynuNNRaO6XiKz6Cb1o/QbKV/XYd1
   7YHkmonD/Vdz+pVH7dchuqPEyu/4PFK9YayDM/6WEl7Sl7PYeU1FJSWNe
   w==;
X-CSE-ConnectionGUID: jr67dN73QkGCmZyeTDgvtg==
X-CSE-MsgGUID: cGqQNAEwR7mbi3fqgv7j4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21083772"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="21083772"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP; 02 May 2024 12:03:55 -0700
X-CSE-ConnectionGUID: tqzsDz4pR0Sh5UACjJ6Org==
X-CSE-MsgGUID: 0NeLiMu9RWmBOObK9Fdk6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27229312"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 May 2024 12:03:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2bii-000AuM-06;
	Thu, 02 May 2024 19:03:52 +0000
Date: Fri, 3 May 2024 03:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/s390/cio/qdio_main.c:735 qdio_establish_handle_irq() warn:
 missing unwind goto?
Message-ID: <202405030253.tX6zPDgx-lkp@intel.com>
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
head:   f03359bca01bf4372cf2c118cd9a987a5951b1c8
commit: 607638faf2ff1cede37458111496e7cc6c977f6f s390/qdio: handle deferred cc1
date:   3 weeks ago
:::::: branch date: 67 minutes ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-r081-20240503 (https://download.01.org/0day-ci/archive/20240503/202405030253.tX6zPDgx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405030253.tX6zPDgx-lkp@intel.com/

New smatch warnings:
drivers/s390/cio/qdio_main.c:735 qdio_establish_handle_irq() warn: missing unwind goto?

Old smatch warnings:
drivers/s390/cio/qdio_main.c:968 qdio_allocate() warn: Please consider using kzalloc instead of kmalloc

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
