Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C0D282F02
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156796; cv=none; b=kz6zsELfuDgLOeVVx+sZaK9CM5x0qbBYefW+tVqBoIKqm5J2Ud+74s8P9t+0Np4YHQE9Q+qK/X3HMu4Al6mBif9fRbn2RrNRxXhGrmwqsksZ6T37sPicwe41I0tSSIcB1Y9p1V+/JgF5GJRx1GXJeJAKvPjfc6dmINhoVa7CCN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156796; c=relaxed/simple;
	bh=2D4hZLNWY4UmfAgkIGNunZ82ky+L11REVBTmA3dnzto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fB8VHP7/M51mZAfscOJX/efG4RIGl0P6T0MT05+E14UyNAJWSMChNTIUDlekjAHuNOVEB48gay/e6Lq3VcnVUKqD0OMKPXqq3JP6ALUxAaQ9m0Ic4aGiu3bVEawDFr2+zj/jj0kVv2CHelPneMkhyut9E2+9zNGXMwjOkRpNpgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzruNJLS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzruNJLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156794; x=1810692794;
  h=date:from:to:cc:subject:message-id;
  bh=2D4hZLNWY4UmfAgkIGNunZ82ky+L11REVBTmA3dnzto=;
  b=dzruNJLStAG03RN3zNRs2YKtEgZCpRvw3CNyGaT9tR38amuqS86B8HY2
   DldClRshLTWRWK+LqmgUWGZiEz2CaP+HfydBh+b435vlgZkgcKh8o0zqY
   tOH1qxmYXbVcne9mjILS9BzrqqWzaqY7YaFym3z/ISaDrxCW63n9E3ePG
   PUoNOy918yp3Hp2XSpD/EEMi0mqLyL3sfnMWMsVhpkhweEq7NUnvhTEg2
   jxzuHq7sT+BKLclEpmoudVjbhkfASZkwgfZCvc3PidwnZMkfTnrjDUAwD
   NWOUOEa7oFyZNYmTA++7622EJNaDX3TP2nFkYEABXn/qab0Hx62dJB7C6
   A==;
X-CSE-ConnectionGUID: vC9nMXLMSJGoQZKbASCj3g==
X-CSE-MsgGUID: x0qfJP51TXqtpcvCnHOJjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79876119"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79876119"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:13 -0700
X-CSE-ConnectionGUID: 4ftMw9QkTRGTsZ4KmH/CDA==
X-CSE-MsgGUID: iCo8xPG3QR2gUVO7ICQU6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235167811"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 19:13:12 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xG-00000000017-03FR;
	Tue, 19 May 2026 02:13:10 +0000
Date: Tue, 19 May 2026 08:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: arch/mips/pci/pci-octeon.c:39 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202605190824.9sn7xWhx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
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
head:   4d3a2a466b8d68d852a1f3bbf11204b718428dc4
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b docs: kdoc: various fixes for grammar, spelling, punctuation
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-r062-20260518 (https://download.01.org/0day-ci/archive/20260519/202605190824.9sn7xWhx-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190824.9sn7xWhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5f88f44d8427 ("docs: kdoc: various fixes for grammar, spelling, punctuation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605190824.9sn7xWhx-lkp@intel.com/

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
