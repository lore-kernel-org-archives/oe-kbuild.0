Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0851A9FA0
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 02:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353295; cv=none; b=n7Gc79AuUYrbAc+SwYV2w3Nnvs56iWXdSoGU6ztDEolB5zjCahodMLyj8xJWoTWKvE5+F68oze5v2txJDdc9T5i9TooB8YSDSa7yAEpMwoBnMzXTzzUXiIdQ2ZpDCoCW6/q50bfMJp2SBo+d0wk3KYX4gqfs3Lh1w3Q89QiDToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353295; c=relaxed/simple;
	bh=f9qEJdVvcmJ8cm0WAscAXKxWbCdWQNSx4KDh0zEMf8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=APU64PI7yvIXjQLQyxIbNdzMBksJM4sUHjdVPBJKwgRQvmkwz8wBaNV/HyXqYSjvCVQWF/DxEk/piIYkshW/M/Z8HtX1GFHQzBbOAv1TeSeKPgqDZ2YCka+MJliR+nM4e1Ut51nYGD+muAr6AN7k9ER2A4Yn/qgTvjpctn1RcGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+gMcDB4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+gMcDB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789353293; x=1820889293;
  h=date:from:to:cc:subject:message-id;
  bh=f9qEJdVvcmJ8cm0WAscAXKxWbCdWQNSx4KDh0zEMf8s=;
  b=B+gMcDB4ScUdZgEiIJDiDWPEm9T5jb2FbMG8I0LM8ymAGNPsA+e/IW6G
   wGAupfI3lFctgmwyr9XS4EnjOrCf/l/XlCtSJKqwWB/Hla4ZR+UbVXpvF
   exz1P16tf45sZ8ajddMaJPGGuXIBciJ1t+yU59uoDoPkzvBgaulLLLZtl
   ebsqGBsUcJ9xhDeecq42zLaZehoqbXz3xDXY0WjeFQWaOj3xpgzwbKCrZ
   6Z7ZwQwUY1Jb05J6L/rorhU1ctyHZrIUlLzUftbcBRB85gUB3eJNL/sx2
   Sacdl8ajaEWI4I9m33Ag5H5AtjNMd6Eu3EEk+g36rZ2HQV/S1ZUAMZ4iS
   Q==;
X-CSE-ConnectionGUID: B5pd1XS2Q/qoU9FXZxwaYQ==
X-CSE-MsgGUID: CrNgWWY8SLK3So8qLX1sYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="115244007"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="115244007"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 19:34:53 -0700
X-CSE-ConnectionGUID: xp4n8l/XSJ6CVS2b/FGchg==
X-CSE-MsgGUID: E/peI5PuTp+yQgjZjvA2kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="733445"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 13 Sep 2026 19:34:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5wWv-000000002PL-1sCa;
	Mon, 14 Sep 2026 02:34:49 +0000
Date: Mon, 14 Sep 2026 10:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/usb/host/octeon-hcd.c:288 Excess struct
 member 'flags' description in 'cvmx_usb_transaction'
Message-ID: <202609141054.j835Coun-lkp@intel.com>
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
TO: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Jonathan Corbet <corbet@lwn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cba2348ab114391f5b1a00fa65c5b739f13f0563
commit: 46d9c16115cf046ce564f0230126cae785f73826 scripts/kernel-doc: Detect mismatched inline member documentation tags
date:   4 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 4 months ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20260914/202609141054.j835Coun-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141054.j835Coun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 46d9c16115cf ("scripts/kernel-doc: Detect mismatched inline member documentation tags")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609141054.j835Coun-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/usb/host/octeon-hcd.c:159 struct member 'reserved' not described in 'cvmx_usb_port_status'
   Warning: drivers/usb/host/octeon-hcd.c:235 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Logical transactions may take numerous low level
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'xfersize' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'pktcnt' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'retries' not described in 'cvmx_usb_transaction'
>> Warning: drivers/usb/host/octeon-hcd.c:288 Excess struct member 'flags' description in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:335 Excess struct member 'next' description in 'cvmx_usb_pipe'
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
   Warning: drivers/usb/host/octeon-hcd.c:2929 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Poll the USB block for status and call all needed callback
   Warning: drivers/usb/host/octeon-hcd.c:159 struct member 'reserved' not described in 'cvmx_usb_port_status'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'xfersize' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'pktcnt' not described in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:288 struct member 'retries' not described in 'cvmx_usb_transaction'
>> Warning: drivers/usb/host/octeon-hcd.c:288 Excess struct member 'flags' description in 'cvmx_usb_transaction'
   Warning: drivers/usb/host/octeon-hcd.c:335 Excess struct member 'next' description in 'cvmx_usb_pipe'
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
