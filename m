Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DAA13AA53
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Nov 2024 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731410504; cv=none; b=P6Tu+AMF58mee0AsTypXA90N5wzCLA7DZ2UNhkCYvPNB0Dxdke16P1h2jQx+iEbQAzVg2ZWnhU8c8h7E8LgWsEHINipcEYPOA9dTWUf7sXjAK48mBcXIWb4o/FVKUqpLNaEf//nj2YHySslY5LOoh2rPRMrOl06j2vYeMl4x1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731410504; c=relaxed/simple;
	bh=OHAI+Z8lzey+beJwgp4vWMJMEwrKoA5N1pRcC4Do1gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o/45qWqHgUIpDGjgOGv0X07DkG2hYFB3lcebFSWzeAio+KJi6AluQJ/XgAegSo4/BFwPs87ZczWRjc6Kw4JwRAqhLVnmGkcRtSL0RHxvbVR/XdB1P0KW8kV+eKWEMzLZgYbhqmJTEjRCKTDjEly9lKB7iQLswRIp9LQpD1IQKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxVmcgc/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxVmcgc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731410502; x=1762946502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OHAI+Z8lzey+beJwgp4vWMJMEwrKoA5N1pRcC4Do1gg=;
  b=UxVmcgc/zuNzgHXoeEEeUeZMfWIoaFw7RaAL5ud9Ks5X5LkliQ0INlLP
   CvN3jIQ9C6hS789mv++aV8CWxsegtPCBH2PkLIJb0ExaksVNZkUw8i6HS
   Z+omDe4R+ufzKboxQKl1iMTgNOlZnY6JYcrlzllL4fB9RikVyqvZlhYSM
   rqw9MDyTJKSYmCHioEjrXjtca9VCgYs77aIOzg2dZBwIZpZGdaOut5KHn
   vQTvr+BiCP9VnNbzOtpUAaTKGdEmC6yYuEGnILz6N4r7zQVqIQNr/IhI1
   1qnnaGGZ2nq1vax/Sqa/APPth9wmaTqQUxIovM3eMBev+1xyyUaDzblvP
   w==;
X-CSE-ConnectionGUID: LJjxVexRTfyzNGnt+HIM7Q==
X-CSE-MsgGUID: QH0XaSEqTSCb1Hcwa3Gq8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34104567"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="34104567"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 03:21:42 -0800
X-CSE-ConnectionGUID: 1K17B+cdSkePCLRgYX57+w==
X-CSE-MsgGUID: 66B+EQuuTTirRbjbvqeKDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="92496038"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Nov 2024 03:21:41 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAoxm-0001CR-2B;
	Tue, 12 Nov 2024 11:21:38 +0000
Date: Tue, 12 Nov 2024 19:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/s390/cio/qdio_main.c:735 qdio_establish_handle_irq() warn:
 missing unwind goto?
Message-ID: <202411121927.sodblsKG-lkp@intel.com>
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
head:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
commit: 607638faf2ff1cede37458111496e7cc6c977f6f s390/qdio: handle deferred cc1
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: s390-randconfig-r073-20241112 (https://download.01.org/0day-ci/archive/20241112/202411121927.sodblsKG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411121927.sodblsKG-lkp@intel.com/

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
