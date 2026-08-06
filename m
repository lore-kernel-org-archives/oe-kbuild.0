Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED233B95E7
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026133; cv=none; b=HjNBjIxiJl5ap9n2EoIbNHBQiftXrqe0zSdIkk8dOOx16Ml7fzPPonS2XuUUw5cfgpaTWHf9zZ2KSbKExgc1QU0myhUthyTHHuzrrAadkZTCjPuNmZ7xqzEvvQYhhmQjnat1L/GgeuLQYojkGOgIkhF86zmbnhlCf/InQDOT4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026133; c=relaxed/simple;
	bh=6CyZBJSbIbiWfNEVFb3iqkPX51iVPjlXBFys6jGuNgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ORdCU6R2VLQSIo6QJuiw4V5xTWBxnVHUzu7S6iVjwTMytmHCk3Vv7FXZITWQST9FnxYBjUOtwuLW4WcHfI93igNZzuiRGaMJeftPUYHHNXe0Ad3SFbJXRpDrgv71MiuVCLwAp0zCuvuuLBb1Pf5Z/0TSOap+0uEHQrKY3gWGIs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hd0Oh9PX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hd0Oh9PX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026131; x=1817562131;
  h=date:from:to:cc:subject:message-id;
  bh=6CyZBJSbIbiWfNEVFb3iqkPX51iVPjlXBFys6jGuNgU=;
  b=hd0Oh9PXLHYUta/2YzHhnZVOvixeysglsb3sq9Sv3N0ZKUlJhDus4+gB
   eu93ytT7/LBtzT0gcIT2A22lYGEESjdMs4BToGgevTA+YlTQH5RXiQ1jp
   JBq0T6YEgXkS/II8MijBcdR/pL2QxSBy5XVwaUnwaN622FNG7Zb1EowUL
   rK/oLFNG+JrLmE+9CNVc54vW4FNYMC4GqZHwHVpngnBFxI0M80drdODI/
   0KmveLPQySPhe6R8ul05DpZwWJhS9qkM1AsxUh59VaDeOeen7fgmAj9rz
   IHl25IMEru8+GOUD9OctrYra+j0F77EUYRaJJq6QsnY5T5aBLKK2yWZPJ
   w==;
X-CSE-ConnectionGUID: pk8b0oZ7RSCkwoG2Oh1Wgw==
X-CSE-MsgGUID: CKkGZk2+QBOPR8FrlsCjrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86828210"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86828210"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:22:09 -0700
X-CSE-ConnectionGUID: iOAiYmwlR+yki+K+9EmFrA==
X-CSE-MsgGUID: WScfcf4tTfi9ekiId+ku5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="258244276"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2026 07:22:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wryyz-00000000FI3-33dT;
	Thu, 06 Aug 2026 14:22:05 +0000
Date: Thu, 06 Aug 2026 22:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: arch/mips/pci/pci-octeon.c:39 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202608062239.286hbrrE-lkp@intel.com>
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
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b docs: kdoc: various fixes for grammar, spelling, punctuation
date:   8 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 months ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20260806/202608062239.286hbrrE-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608062239.286hbrrE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5f88f44d8427 ("docs: kdoc: various fixes for grammar, spelling, punctuation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608062239.286hbrrE-lkp@intel.com/

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
