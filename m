Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF572F8E83
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 20:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186562; cv=none; b=tyhGDU9kmnJQ8pP+0hF/J+lmyofg3XfUbvta885Ve5TmsrbwtnCLEvSQi8MaXN/Ub1CVJxN7ax6na8eP+eeoGCQuJyZDd3uQ8t1dOWzV+Uny8oYgXMWRIHlQ24wgnaprWC5vQm+3KQsVWqO6TPb0dcFFpwq62Tl5veZLue8ChhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186562; c=relaxed/simple;
	bh=nIXGSVDlktVHOLpbb+XC2Bq/He6WIc1hiJzyvMxU//M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uCYNQhIi/+5QpoEcXBC6GpDjijbrrUuKYXRr8KgH1xnZeOpFtczom0qYzos1GaDxkfa9FiIML8ODjhv7ozC/rmWAQf3/Pbr4+xvkrUqtXa2vjwIeCeSLr5xhepNIVmYpWbUVhDaB4NQcjTEmlpjOTWDfDxcUoYzFkJUdsTRrDmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajR73nNs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajR73nNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778186560; x=1809722560;
  h=date:from:to:cc:subject:message-id;
  bh=nIXGSVDlktVHOLpbb+XC2Bq/He6WIc1hiJzyvMxU//M=;
  b=ajR73nNs5E9VoiRmUY4we7i0ClGSdcH18IOt9/ZmMk1MvBFvxrHxHbzp
   PkRLtQ1qos/zXyAxX+Uo2TpdiT1zUvSDl9sG5f6DbERuX+4SNOcmhIif+
   EW2d4ZTKhyYEANDnSMzIteD3j735LxNdUfuSvixj5JXYjaT2bhY7w8uka
   zKh85k4+5n9LWG+okEYs6ngNL1DTemYB03zUq0IGJeUKGfFTA01qHf3v3
   XawGf7+4I7a+4vcTTEa3DZ57OrAVJLncgKOJjvct8ERRs0DLrs2OlP4Bw
   sdoXDP4w/qn6aQfEjOLAsTAp3HCf+qQtx8FyBE4aQ1BCQKhbtNR5O0fOc
   g==;
X-CSE-ConnectionGUID: 6wC2KBPqT5emnoi29unVgQ==
X-CSE-MsgGUID: QkRQU2TpTxGWWzo7lY++Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="83021974"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="83021974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 13:42:40 -0700
X-CSE-ConnectionGUID: uX88Sp26Q2CS2TUWe5A4YQ==
X-CSE-MsgGUID: 5YVZe7o+TDWlWMTPE2ANBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="240905615"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2026 13:42:39 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL5YK-000000000RF-0gIt;
	Thu, 07 May 2026 20:42:36 +0000
Date: Fri, 08 May 2026 04:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: arch/mips/cavium-octeon/octeon-crypto.c:15 This
 comment starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202605080439.XvWoiMdF-lkp@intel.com>
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
head:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b docs: kdoc: various fixes for grammar, spelling, punctuation
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-r131-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080439.XvWoiMdF-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080439.XvWoiMdF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5f88f44d8427 ("docs: kdoc: various fixes for grammar, spelling, punctuation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605080439.XvWoiMdF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/mips/cavium-octeon/octeon-crypto.c:15 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Enable access to Octeon's COP2 crypto hardware for kernel use. Wrap any
--
>> Warning: arch/mips/cavium-octeon/executive/octeon-model.c:34 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Read a byte of fuse data
--
>> Warning: arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c:44 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Perform initialization required only once for an SGMII port.
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c:128 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize the SERTES link for the first time or after a loss
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c:191 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Configure an SGMII link to the specified speed after the SERTES
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c:297 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Bring up the SGMII interface to be ready for packet I/O but
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c:333 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Probe a SGMII interface and determine the number of ports
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c:357 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Bringup and enable a SGMII interface. After this call packet
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-sgmii.c:387 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return the link state of an IPD/PKO port as returned by
--
>> Warning: arch/mips/cavium-octeon/executive/cvmx-helper-npi.c:40 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Probe a NPI interface and determine the number of ports
--
>> Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:52 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return the number of interfaces the chip has. Each interface
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:79 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return the number of ports on an interface. Depending on the
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:94 Cannot find identifier on line:
    * @INTERNAL
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:95 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return interface mode for CN68xx.
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:146 Cannot find identifier on line:
    * @INTERNAL
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:147 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return interface mode for an Octeon II
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:246 Cannot find identifier on line:
    * @INTERNAL
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:247 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return interface mode for CN7XXX.
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:282 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get the operating mode of an interface. Depending on the Octeon
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:364 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Configure the IPD/PIP tagging and QoS options for a specific
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:413 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function sets the interface_port_count[interface] correctly,
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:487 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function probes an interface to determine the actual
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:555 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Setup the IPD/PIP for the ports on an interface. Packet
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:577 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Setup global setting for IPD/PIP not related to a specific
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:599 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Setup the PKO for the ports on an interface. The number of
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:643 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Setup global setting for PKO not related to a specific
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:678 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Setup global backpressure setting.
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:712 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Enable packet input/output from the hardware. This function is
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:774 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Function to adjust internal IPD pointer alignments
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:968 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Called after all internal packet IO paths are setup. This
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:1004 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize the PIP, IPD, and PKO hardware to support
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper.c:1064 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return the link state of an IPD/PKO port as returned by
--
>> Warning: arch/mips/cavium-octeon/executive/cvmx-helper-spi.c:62 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Probe a SPI interface and determine the number of ports
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-spi.c:95 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Bringup and enable a SPI interface. After this call packet I/O
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-spi.c:133 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Return the link state of an IPD/PKO port as returned by
--
>> Warning: arch/mips/cavium-octeon/executive/cvmx-helper-loop.c:39 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Probe a LOOP interface and determine the number of ports
--
>> Warning: arch/mips/cavium-octeon/executive/cvmx-interrupt-rsl.c:44 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Enable ASX error interrupts that exist on CN3XXX, CN50XX, and
--
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-errata.c:28 Cannot find identifier on line:
    *
>> Warning: arch/mips/cavium-octeon/executive/cvmx-helper-errata.c:29 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Fixes and workaround for Octeon chip errata. This file
--
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-jtag.c:29 Cannot find identifier on line:
    *
>> Warning: arch/mips/cavium-octeon/executive/cvmx-helper-jtag.c:30 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Helper utilities for qlm_jtag.
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-jtag.c:39 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Initialize the internal QLM JTAG logic to allow programming
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-jtag.c:73 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Write up to 32bits into the QLM jtag chain. Bits are shifted
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-jtag.c:103 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Shift long sequences of zeros into the QLM JTAG chain. It is
--
>> Warning: arch/mips/cavium-octeon/executive/cvmx-helper-util.c:48 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Convert a interface mode into a human readable string
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-util.c:83 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Setup Random Early Drop on a specific input queue
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-util.c:120 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Setup Random Early Drop to automatically begin dropping packets.
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-util.c:170 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Setup the common GMX settings that determine the number of
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-util.c:279 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Returns the IPD/PKO port number for a port on the given
   Warning: arch/mips/cavium-octeon/executive/cvmx-helper-util.c:308 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Returns the interface number for an IPD/PKO port number.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
