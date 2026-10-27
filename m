Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120976;
	b=bwJpufm3BvsWYo4PInobyBCkCArEjPWxt14TCmPXspGb4/oqJj6HzL1wzReg/17bZlVa
	 tRnukxg6aeCPQ95w0EjAuGSIH+j26ECFnkIkG/TquPkmRd5/eCZYfI7uY22AmLwilOw6t
	 WuMVttlt22SAX7yLpgUs3oEyWIiSE054iCgn5iibPdccnETXoV2zQ+HZvuI6WuGGEUo3D
	 zZZ6vFVXvr7pEb8prQphisVvmTefcwi12KkXxTpqvfIJ3BuX2CsLRMhurdaNEiYbDIo5j
	 mb3dpvPwv/mWsDBnOfG4f8D50YSPs+WkDaWIDe0P+ZowNBVlB4JnOgdtQjAeldGKVLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120976;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Bc0b6Pp2Oj+c5TIQiOKVxSNBuyhY0aj5Pjkiha6iTZA=;
	b=SQicnEzxer5c8pyImAPRBAEy8FfYM10XtWD2A1bQoVB5nUPr46md0vRMCL5YPYrn3eSR
	 qZ6IvxBD691iwzGelfTIfwQSbs5zOEuQnG3ALmmxLrTu2tjYDlB8zOP814Q1X1nSrAG0l
	 uThPPMJKo/T+taPX861GzNqMp6UNHSKtn6ZOtyFRe62kAonmX/nrxfQUuFS9SRDFHNyrs
	 WXoSnrHBrVyiyq+QI6PS7BAPpl/x/GBd+Y5zVzAUIvnkdx623G4xfXx+YzOpuLs9M20rt
	 y7RVvNInu2YykTU87z9v/tMARYFBublZ7aaCUj9tIIeXBz7mYLsdASAA6ahR7ph1dpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E2a120ov;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA01606A31D
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Oct 2026 17:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA01606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E2a120ov
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793120976; x=1824656976;
  h=date:from:to:cc:subject:message-id;
  bh=MIhN3ifLBoPmasat9zN2lRLgrhahvvPIDpW2dBLVghc=;
  b=E2a120ovL/nyHneEZE6WYM59EW9GeBv3pI5orSfZ7VM6ovwui4HjQDPg
   AyAnCOUIhWNfBPPXief2LmmEJlSWG772A63XZs+Ehl6WtwGrpXqHERbP6
   T5Khm+bBNhFZoAJXOFs7Zpk/+R96iDUzshHaLREpt0vSxufcF9nWKHHDL
   jmK4vTaTn2j2S3UDsXbZ+OrpVFS8eWalDzwoW7c24Mbli+MIPWw4jY5pE
   42c5Jt2yCn13AgAfhpfp4Ap3HzrtYVVaVlo9aH/bzySx1Lcssfd5RUV7J
   EFBlMkQodKBeUW9UBFRUDbiJpX9n7daEdOZpUS0vo+wzK5E+33LTFtREZ
   g==;
X-CSE-ConnectionGUID: VijNwBm7Q2aUDJW/Prg02Q==
X-CSE-MsgGUID: YtCvNVwMSVCLK7hYEIvclQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1828721"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1828721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:09:35 -0700
X-CSE-ConnectionGUID: fMGYlGJZTXOIV66QpY4DOg==
X-CSE-MsgGUID: Dt1eiuOtSt+aLWxZv0B+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4596988"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2026 10:09:34 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLkg0-000000004Zn-0aev;
	Tue, 27 Oct 2026 17:09:32 +0000
Date: Tue, 27 Oct 2026 18:09:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 608/608]
 tools/testing/selftests/vfio/lib/drivers/ioat/hw.h:67:35: warning: 'struct
 pci_dev' declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202610271815.LnlMSeBK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

Hi Zelin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   e8129feece4324195ea94555f0d752df963558bf
commit: ea3a4739b72d7d986abc880bf040ce542dece955 [608/608] anolis: tools: selftests: Sync vfio tests with upstream
:::::: branch date: 30 hours ago
:::::: commit date: 5 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271815.LnlMSeBK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271815.LnlMSeBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610271815.LnlMSeBK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c:14:
>> tools/testing/selftests/vfio/lib/drivers/ioat/hw.h:67:35: warning: 'struct pci_dev' declared inside parameter list will not be visible outside of this definition or declaration
      67 | int system_has_dca_enabled(struct pci_dev *pdev);
         |                                   ^~~~~~~


vim +67 tools/testing/selftests/vfio/lib/drivers/ioat/hw.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
