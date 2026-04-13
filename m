Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2782A393DE2
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 20:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776112779; cv=none; b=ZRGAhbuNW7Opg7vUvZrNPLQLeW5aMv0xBpEkmDmXE3tUqR0Hbrx8TI1tTi+ZR+iDG6rFhqXRBfilOKmYuDJ0heqg2j1wPwLI36rHKa/L58mS5sna/cDK1hPvN+bzEe4iqSkWShWkXjO7VNOt1fGXsdWEXRA9gdFvIWAiwl7A6vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776112779; c=relaxed/simple;
	bh=wci98D7wY7PjV9yI5Z7Iws8rP77lVUxTkIR6ZAsTnfI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ssO55/ky8ebsNmNyIvcl8HXvoiwntlSz6EU7xh3+RZRRFSMVkjrLoEMQ8jyv7XsKpSTS3FFSUbCQtyB6zNy+q2ikbr3QYTLkpJGzTesi+I1IUHIVIHEXwu5aEv1xXGinrB+Weu186t5u9g3mf/j4e2haRaStdwn4RpYzuIBAq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/TEOC52; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/TEOC52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776112776; x=1807648776;
  h=date:from:to:cc:subject:message-id;
  bh=wci98D7wY7PjV9yI5Z7Iws8rP77lVUxTkIR6ZAsTnfI=;
  b=m/TEOC52hcmwU2WOiEl6lGzg0f10WbR8ChwsIQbIuG8+EsI2wWT+gBCv
   aWTfIvzuQ2+v0bwXxD2XVhvBRDAEbOGjB6LPFEg5av+d1P5q2G3n9//XP
   f8vhCn7Q6WGqdJGHDqzfuPgUasqvVCr2FhkRsFZXUvtE1TwTSAohQteQb
   GDUnhWzFFklcocJ4fyetoPZ9Il1qiO0HtR0yOGe5ciGluVmIVRg013eta
   t0fJ+uWZPh2H9yGvBwRtv5n6GAipitB/IIPS1OTZQgvU8h7IX4lw+j1RJ
   0EDmKPf75GvniNIYGXgOv0LSS66Hrk0AAecgxm3vt+euyyzjo4iAOETSZ
   Q==;
X-CSE-ConnectionGUID: vz2V4u7zQ7eGTwjiTpiAow==
X-CSE-MsgGUID: CLq6AdgRRxyBe4t3ytDJmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102515237"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="102515237"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 13:39:35 -0700
X-CSE-ConnectionGUID: QOo8c1tYTGO/4S6yBegz1g==
X-CSE-MsgGUID: 2I382rrhQ7yc1M+Li9J2mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="234814950"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Apr 2026 13:39:35 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCO4D-000000000pl-0naz;
	Mon, 13 Apr 2026 20:39:33 +0000
Date: Tue, 14 Apr 2026 04:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: arch/mips/pci/pci-octeon.c:39 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202604140435.MxzdODB8-lkp@intel.com>
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
head:   0f00132132937ca01a99feaf8985109a9087c9ff
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b docs: kdoc: various fixes for grammar, spelling, punctuation
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20260414/202604140435.MxzdODB8-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140435.MxzdODB8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5f88f44d8427 ("docs: kdoc: various fixes for grammar, spelling, punctuation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140435.MxzdODB8-lkp@intel.com/

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
   Warning: drivers/usb/host/octeon-hcd.c:159 struct member 'reserved' not described in 'cvmx_usb_port_status'
>> Warning: drivers/usb/host/octeon-hcd.c:235 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Logical transactions may take numerous low level
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'xfersize' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'pktcnt' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'retries' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'lock' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'init_flags' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'index' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'idle_hardware_channels' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'usbcx_hprt' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'pipe_for_channel' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'indent' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'port_status' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'idle_pipes' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'active_pipes' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'frame_number' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'active_split' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'periodic' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'nonperiodic' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:514 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Read a USB 32bit CSR. It performs the necessary address swizzle
   Warning: drivers/usb/host/octeon-hcd.c:529 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Write a USB 32bit CSR. It performs the necessary address
   Warning: drivers/usb/host/octeon-hcd.c:545 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return non zero if this pipe connects to a non HIGH speed
   Warning: drivers/usb/host/octeon-hcd.c:561 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Trivial utility function to return the correct PID for a pipe
   Warning: drivers/usb/host/octeon-hcd.c:649 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Shutdown a USB port after a call to cvmx_usb_initialize().
   Warning: drivers/usb/host/octeon-hcd.c:681 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize a USB port for use. This must be called before any
   Warning: drivers/usb/host/octeon-hcd.c:952 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Reset a USB port. After this call succeeds, the USB port is
   Warning: drivers/usb/host/octeon-hcd.c:985 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Disable a USB port. After this call the USB port will not
   Warning: drivers/usb/host/octeon-hcd.c:1003 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get the current state of the USB port. Use this call to
   Warning: drivers/usb/host/octeon-hcd.c:1033 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Open a virtual pipe between the host and a USB device. A pipe
   Warning: drivers/usb/host/octeon-hcd.c:1146 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Poll the RX FIFOs and remove data as needed. This function is only used
   Warning: drivers/usb/host/octeon-hcd.c:1192 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Fill the TX hardware fifo with data out of the software
   Warning: drivers/usb/host/octeon-hcd.c:1252 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Check the hardware FIFOs and fill them as needed
   Warning: drivers/usb/host/octeon-hcd.c:1288 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Fill the TX FIFO with an outgoing packet
   Warning: drivers/usb/host/octeon-hcd.c:1340 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Perform channel specific setup for Control transactions. All
   Warning: drivers/usb/host/octeon-hcd.c:1489 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Start a channel to perform the pipe's head transaction
   Warning: drivers/usb/host/octeon-hcd.c:1833 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Find a pipe that is ready to be scheduled to hardware.
   Warning: drivers/usb/host/octeon-hcd.c:1891 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Called whenever a pipe might need to be scheduled to the
   Warning: drivers/usb/host/octeon-hcd.c:2045 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Signal the completion of a transaction and free it. The
   Warning: drivers/usb/host/octeon-hcd.c:2102 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Submit a usb transaction to a pipe. Called for all types
   Warning: drivers/usb/host/octeon-hcd.c:2176 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Call to submit a USB Bulk transfer to a pipe.
   Warning: drivers/usb/host/octeon-hcd.c:2200 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Call to submit a USB Interrupt transfer to a pipe.
   Warning: drivers/usb/host/octeon-hcd.c:2225 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Call to submit a USB Control transfer to a pipe.
   Warning: drivers/usb/host/octeon-hcd.c:2256 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Call to submit a USB Isochronous transfer to a pipe.
   Warning: drivers/usb/host/octeon-hcd.c:2283 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Cancel one outstanding request in a pipe. Canceling a request
   Warning: drivers/usb/host/octeon-hcd.c:2332 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Cancel all outstanding requests in a pipe. Logically all this
   Warning: drivers/usb/host/octeon-hcd.c:2356 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Close a pipe created with cvmx_usb_open_pipe().
   Warning: drivers/usb/host/octeon-hcd.c:2378 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get the current USB protocol level frame number. The frame
   Warning: drivers/usb/host/octeon-hcd.c:2587 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Poll a channel for status
   Warning: drivers/usb/host/octeon-hcd.c:159 struct member 'reserved' not described in 'cvmx_usb_port_status'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'xfersize' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'pktcnt' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'retries' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'lock' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'init_flags' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'index' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'idle_hardware_channels' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'usbcx_hprt' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'pipe_for_channel' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'indent' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'port_status' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'idle_pipes' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'active_pipes' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'frame_number' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'active_split' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'periodic' not described in 'octeon_hcd'
   Warning: drivers/usb/host/octeon-hcd.c:380 struct member 'nonperiodic' not described in 'octeon_hcd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
