Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967AA5475E
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 04:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747024655; cv=none; b=lNjFRgZciuSqBQKr9G7BkCL5/Tz8TlnkQJi2uipd7x25zmSLBAhbuh48YrJjUsHn8xuxv3b1FcMyzJzBIk2ZCXNf3NPfpi/B9x04M7aKEE4QCKZ6xwgnAq/+fiWm2kWZImDMbdJUY5sMPhczbVDCCNhnJ7dkiKJKG5V59P6s5h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747024655; c=relaxed/simple;
	bh=jOL2pJWPL2Q38nikGHBK0tYxKk+vdiDUUTLQh1/Q88w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ca4e4u47N3EWYr/T9yDe1SvjNMwMpcY0LAi/Sc9HHiR/eGD+jW242VSWIwniFDoiuMiut9VT3B0OwYoVSWTdvnkwfrKGJHdId+6XxI7USM+niUeXmijYqpXZ7KCJU3Vo0C4PVK0dNArplbXIttgIE2XZdn5bdiUs2ogZjmv/7g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cj37ewNz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cj37ewNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747024654; x=1778560654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jOL2pJWPL2Q38nikGHBK0tYxKk+vdiDUUTLQh1/Q88w=;
  b=cj37ewNzaiBWaWG4fBlADF+oCBfpfIJlASh2Bv35UaXvgE/6TdqAWA4L
   DBJKeW39nQJVY6qF4gZ5CapWPcaRU0wqkMGc6DWG2ns0eXNGKQkl599cC
   roBh3QKHFS0jDivBrC9/yOSIC/A8cQXnneuEg/fEqw3rv4EZI9dLor+YF
   IHXEtJamt9KJPIOOq1ry4YL+x6uH0MsCbgb8OSH608bWmz6UCtKKv3flB
   wOA1JYBL6g03hUAoN18DlwwnSbqGmPfxqWiKei/jGrYNIly3PfamnB9e4
   heFDNxgnYNfKbMC5k+zXCofpZAJySV6EGYa3kHzGuwfozHj4eVEDWclam
   g==;
X-CSE-ConnectionGUID: mgDcRU0FRuuUhhU9iqsllA==
X-CSE-MsgGUID: ioe9UYNDQ1mgM19c7PX/kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48053283"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48053283"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 21:37:33 -0700
X-CSE-ConnectionGUID: 6Qc0ynMjR8eTb4pFoim38A==
X-CSE-MsgGUID: 6jjByw8LSr63V/5W8/x3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="136959720"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 May 2025 21:37:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEKuv-000EAz-2S;
	Mon, 12 May 2025 04:37:29 +0000
Date: Mon, 12 May 2025 12:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/scsi_debug.o: warning: objtool:
 do_device_access.part.0+0x14c: unreachable instruction
Message-ID: <202505121241.o4HDogVA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: John Garry <john.g.garry@oracle.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
commit: 84f3a3c01d70efba736bc42155cf32722067b327 scsi: scsi_debug: Atomic write support
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505121241.o4HDogVA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121241.o4HDogVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505121241.o4HDogVA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/scsi_debug.o: warning: objtool: resp_unmap+0x184: unreachable instruction
>> drivers/scsi/scsi_debug.o: warning: objtool: do_device_access.part.0+0x14c: unreachable instruction
   drivers/scsi/scsi_debug.o: warning: objtool: prot_verify_write+0xac: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
