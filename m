Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787396;
	b=yIvIQjycFG5QGJiu9tMy2BqNBh29OZ7NBkOWO4OrrubkQP/11Uu/ktVfYdhadrrp9zdc
	 4Yswm7epGpiaytXo5XuFB2BmBfiDebcO+YM3uLOfHW/1hpfE7XLcfO+oZFeK1TMwQeLEU
	 +o9Q0nlrlqk/s93mYnGxjdOC2k0ZPf5isBsF9emm61Ren8lsa+bYiaSM7H3KJ8aXrCkRo
	 Xz4b8OPXvnWvX1CLR5kiK3klPvMv1o88mRZVYMDYtEqrdo5nxudYvCyO4WuqL75J5kEAw
	 z/6sLDedtkxJls68hnf3WYVH/dlPSk4SeHmdj8x+Sg4RGnd70P025MFUJfkZ/7tS5ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787396;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+14REur7WdaDBJaqs3yaLFn3VsE7Ps7oqUGOFsV9n4g=;
	b=1bouCCBjsoSaxfWNf9XYf5P7MoxxF0i9QTN9/EPACl6zkaw6S0blxTal3NSsXvOQY5xc
	 jnGLeWHkkt5ndXKTTyHmdU2/R74jr8mlzfM5QcJYv8D1Wt4YugxXuy6030IWZy80LgzWX
	 n7kWGBhwGS7S4VQ3rKKCVJf91zxQz+bRCg10x8pzouE4RHE2BqNqC2IMnO4JXoXHWnV3Q
	 9gAAuXPHn9GfVWJlMby51KE06Xk+eZ04V+CgpJDGXRd5Jij3HiRddhlN5E1mz5/dN7uKa
	 kJtFWFgq3Ata/bTO5Jw3d9hKpkCuG8K3o58ZorQnKVcizyvxl1je0b9SvSC6hG8HLVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WTrsewQ6;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA92F606A31A
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Oct 2026 20:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA92F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WTrsewQ6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792787395; x=1824323395;
  h=date:from:to:cc:subject:message-id;
  bh=olBDRKZj6vj+bzrvRZ4/PpbXCSgdBujEIZfJTglD/Vo=;
  b=WTrsewQ6kTqUR68qAy8Ef8QKOPAhOh97Q0TrWA4gOlr7w605orQLvvD4
   PdJ+L6vStQDft7TJMv9pG3ibbXn3k++bQk6TMwAizXKZaZYS0kKkqYeX+
   e6/g7EC0E/O5TUQJONPGAIlsZLGq0qfj3usKbuuVsOkgfIYEcs8NwFrjq
   CnY2FQU4l2xxS0JxXydEcRTgQo1Poc4nc1rPDKhZsXavro17RhXQlf23P
   vYDnG2VILc/XP11yoF2l9GAJ8MJKDGkDiVKC3XHbLN0EjvNxLH6VcEMI9
   H1xkYVV+FJefVRjvFZYGcFJhHG+ZIwV95QWJYjiijRTShzcs0a7ApLlRm
   Q==;
X-CSE-ConnectionGUID: A0vRYnDtQXinLE0qQkX6ZA==
X-CSE-MsgGUID: pdainUHWR8mQ1EWznmMzfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1565276"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1565276"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 13:29:54 -0700
X-CSE-ConnectionGUID: 4ppm32n0Tu++7Qk6M3yWOw==
X-CSE-MsgGUID: LRQENjJZQSmX4uVKetZ9Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3722834"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Oct 2026 13:29:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKLte-00000000TEQ-1nRW;
	Fri, 23 Oct 2026 20:29:50 +0000
Date: Sat, 24 Oct 2026 04:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: arch/mips/pci/pci-octeon.c:39 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202610240452.ob3NVEJE-lkp@intel.com>
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
head:   734bef548a96e8774d6eef5dfa2026c6edc4e80b
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b docs: kdoc: various fixes for grammar, spelling, punctuation
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20261024/202610240452.ob3NVEJE-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240452.ob3NVEJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5f88f44d8427 ("docs: kdoc: various fixes for grammar, spelling, punctuation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610240452.ob3NVEJE-lkp@intel.com/

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
