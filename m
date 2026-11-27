Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745058;
	b=WUr7fBWQSribnFsv76tWw9ImX9iGz2Hm6349fEL/p2/KiEMLm/jPT1Uko0VKZvNoLgGf
	 HK30cIHg2SIWdRTZPR+/MQTQ3m2zwDxN/atO0iM5YeDBxVxtJ6CzK5PyP5XlQ4wAzEcnw
	 bmTUd3bMentlZmIo0pRa/yrd9fDE29Ik1T3giRgNKBDsNlFe5s0uHYWvfBgxPf2U5tTA3
	 cvCyhbzc0WKXgTmw2uMVzZ+SSszHRgk2chasUWvzuBxZzoCc+LuxKqYm45Wq4yJbmrjFz
	 Zsv1E5fRp4QZhyXFYPBH+OcunsvNVYKEGmWgm1xZ0rxKGwj3Deatu4zmqbbdgEDNNLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=l05r0XKdKfvZp/RVw5XrxV+xeQJyIXILOA6Mj78Gbso=;
	b=ICX/xxk/Ojjjct6raqHslNLfj5xQ83Xd42sPoK2JS7L0X8AfVOtBhY3HDglYWKsZkVWf
	 BK9SCcSoLs7YzsYNoOwnZ5/AuZsZ8r+yQl81wmX4QjZBFV8qa4NqS5VlRMIC/wHdLbgdp
	 HRRnMHz9k3Hj25LP+MPgdlXxjcBc4TKLtwJXqheQ/Rqz+/C5k20Acq6GiMPjgNfNNqda8
	 R7qNKLoS2autwknlKVzCLW2eW/jD5tsNZzFEspoyvJwhlf8zgFo+KmGvqhRIb4J3UPJa0
	 AmPqW76NTuH2N7TATeFBIubVgrH2gTdjJz5UlIT3kPrhufThSDa43BZQiwTWtcaBMuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wzh1YE1w;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A984D606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 02:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A984D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wzh1YE1w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795745058; x=1827281058;
  h=date:from:to:cc:subject:message-id;
  bh=nfh5qlDN+49CD7IYbcuKw9f7vJnMBOURENNv02Rc1MU=;
  b=Wzh1YE1wVsUL5EogkHlTW2MPLF+6/MchE2l3F6ALzXB16gpq6IV8oHqv
   nYQZivuLP6TIBpL1KX0psheKO2kUcLCSmOej3+G2iQ0LYefwIoCJyn3mb
   y6A9B4Fx2yqkKe7grYPxgMGRVW7nSNiBcvZHyAzXNgcQ4rTMpnS0Ns6kt
   LqPUe+SOfhBbukGwwbtARMU0TT+dSELVBMyMLZgnsyEy8Itnebzeejj0d
   KaXZUNb7HVebj9Z5QRCar/wd7oICt0tyIjbvuBD1eecRSui1UR2RL2P7x
   EMfHXy5lZqY/0NUqjekecD5FI4/n4WN+XiZbox6u0MPeH87xFf/6sPbZi
   w==;
X-CSE-ConnectionGUID: CbP+Zt8YSCmR924+RIB1zA==
X-CSE-MsgGUID: zVqMRfvyTf+ZWHD0ShiDtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4509227"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4509227"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 18:04:17 -0800
X-CSE-ConnectionGUID: nVZibFzdSF+aBMenf9Ez/Q==
X-CSE-MsgGUID: voD+oLl3ReCaWn0pqxIGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12792296"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 18:04:15 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWlJt-00000001VB4-3EZe;
	Fri, 27 Nov 2026 02:04:13 +0000
Date: Fri, 27 Nov 2026 10:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: arch/mips/pci/pci-octeon.c:39 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <20261127095905.YL7pAgml-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

Hi Randy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9437ee8b6cf607e883b36e44bd755968daaebd48
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b docs: kdoc: various fixes for grammar, spelling, punctuation
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20261127/20261127095905.YL7pAgml-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127095905.YL7pAgml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5f88f44d8427 ("docs: kdoc: various fixes for grammar, spelling, punctuation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261127095905.YL7pAgml-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/mips/pci/pci-octeon.c:39 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This is the bit decoding used for the Octeon PCI controller addresses
   Warning: arch/mips/pci/pci-octeon.c:63 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Map a PCI device to the appropriate interrupt line
   Warning: arch/mips/pci/pci-octeon.c:170 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return the mapping of PCI device number to IRQ line. Each
--
>> Warning: arch/mips/pci/pcie-octeon.c:97 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return the Core virtual base address for PCIe IO access. IOs are
   Warning: arch/mips/pci/pcie-octeon.c:118 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Size of the IO address region returned at address
   Warning: arch/mips/pci/pcie-octeon.c:131 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return the Core virtual base address for PCIe MEM access. Memory is
   Warning: arch/mips/pci/pcie-octeon.c:150 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Size of the Mem address region returned at address
   Warning: arch/mips/pci/pcie-octeon.c:163 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Read a PCIe config space register indirectly. This is used for
   Warning: arch/mips/pci/pcie-octeon.c:191 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Write a PCIe config space register indirectly. This is used for
   Warning: arch/mips/pci/pcie-octeon.c:217 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Build a PCIe config space request address for a device
   Warning: arch/mips/pci/pcie-octeon.c:260 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Read 8bits from a Device's config space
   Warning: arch/mips/pci/pcie-octeon.c:282 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Read 16bits from a Device's config space
   Warning: arch/mips/pci/pcie-octeon.c:304 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Read 32bits from a Device's config space
   Warning: arch/mips/pci/pcie-octeon.c:326 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Write 8bits to a Device's config space
   Warning: arch/mips/pci/pcie-octeon.c:345 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Write 16bits to a Device's config space
   Warning: arch/mips/pci/pcie-octeon.c:364 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Write 32bits to a Device's config space
   Warning: arch/mips/pci/pcie-octeon.c:383 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize the RC config space CSRs
   Warning: arch/mips/pci/pcie-octeon.c:581 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize a host mode PCIe gen 1 link. This function takes a PCIe
   Warning: arch/mips/pci/pcie-octeon.c:689 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize a PCIe gen 1 port for use in host(RC) mode. It doesn't
   Warning: arch/mips/pci/pcie-octeon.c:1086 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
     * Initialize a host mode PCIe gen 2 link. This function takes a PCIe
   Warning: arch/mips/pci/pcie-octeon.c:1145 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize a PCIe gen 2 port for use in host(RC) mode. It doesn't enumerate
   Warning: arch/mips/pci/pcie-octeon.c:1441 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize a PCIe port for use in host(RC) mode. It doesn't enumerate the bus.
   Warning: arch/mips/pci/pcie-octeon.c:1460 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Map a PCI device to the appropriate interrupt line

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
