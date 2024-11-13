Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BC615A858
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 05:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731474752; cv=none; b=bHg9ahfxBYrk/dBin9Q65Itp+28AkDqCMj4ZDbAfVj74Wv4+si/ZqH1p5wYSbsMtchNGHu4rZgmLhbKoBgdYIeq5iQHDZM1tUkrfEAzxwpz8jfAtkn/XijkEeTfzGyoHx7a79wDj1f2NfqgOuxnrrEGeG1anLnxPMwqz12Vb50c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731474752; c=relaxed/simple;
	bh=Fa+S7VFwlJl2x1jHV8q4BFhnXlb8A3Z4oUrSCuCpAzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKZgmsAOfsjQlFnUf7zYWT7nBod7kVRiO4wLIIfabRliBqs0mN5phnuo/vcgc8hDK3uYjLiWNdgdiacAPJ//i5MjJes6KYHPrRlVdA9w5E+xv0KR7k9/JLxAzP9CvMz2kd64WPeDLZ1uP76WlKFkJjYAJjzFGvd/ktm302kltjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzLZV/+D; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzLZV/+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731474749; x=1763010749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fa+S7VFwlJl2x1jHV8q4BFhnXlb8A3Z4oUrSCuCpAzM=;
  b=PzLZV/+DyWT4e3tACUtDKQYOetT0sYDGxgIjCwCYSYR+CY/r0ZEEZAMv
   XqAKcH6S9X4zA4tcvoqsIiL5ynVQQRO8fC6pT4VQGA9HYiI2Aj3z4sM8L
   5UlhDSnSb+4kjVl5i9MpJVc+vcHal4n2c7GxS1joqL+4PlwiDrno3CqK6
   9e3bpsavIu3OYVHgYcgIBdX+Cl1wxU3/8dOtNsNKa1qWcfFXPdpPDjcMt
   ToNZ4RGMwvPdKygay03ofs1RiZnHRxf3sHz6PowLOz9q/3nakpYEUk9tO
   4Ih3wXfLeXK/42kdu3ZRhmQWsRRXHEJRcVL2VXEGUkboTcRDu7N+SK0yy
   A==;
X-CSE-ConnectionGUID: TAw+Md1tQHuAqZ1n7rfn7Q==
X-CSE-MsgGUID: VTkxAvgqQ5SC0hU1NcZdEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31229733"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="31229733"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 21:12:28 -0800
X-CSE-ConnectionGUID: 31IEQ4D3Qkqma7pYmBZzhA==
X-CSE-MsgGUID: 9NRgF5egTeCs1+FyznaAOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92685522"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Nov 2024 21:12:25 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB5fx-000067-39;
	Wed, 13 Nov 2024 05:12:21 +0000
Date: Wed, 13 Nov 2024 13:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/s390/cio/qdio_main.c:735 qdio_establish_handle_irq() warn:
 missing unwind goto?
Message-ID: <202411131327.GCaXJWW6-lkp@intel.com>
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
head:   f1b785f4c7870c42330b35522c2514e39a1e28e7
commit: 607638faf2ff1cede37458111496e7cc6c977f6f s390/qdio: handle deferred cc1
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: s390-randconfig-r073-20241112 (https://download.01.org/0day-ci/archive/20241113/202411131327.GCaXJWW6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411131327.GCaXJWW6-lkp@intel.com/

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
