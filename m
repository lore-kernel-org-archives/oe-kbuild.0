Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1E62BD59C
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 23:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789257065; cv=none; b=AjYIOGVGYSYS5p1yy35FMopsue//L3+6KMxZIlwxsbdbHxSlZv5gcBCXBfd/iLdgdWZ9kmSk91TueJMWdyaLPzAGwL8ldFZDa3vXl4XyA2mCEnpgHY2KmBiPYPtlFenOGSP6ekG1HisJNFhZhbB7JD8VaeUGvqMCBnrrInetIEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789257065; c=relaxed/simple;
	bh=2HlGqeCCYg3cSUnu+e3e41O4AfA7NCsTkcRdFJhEMpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DLQhFMn7bpcXdsErmhI5XmvqEh38abVZ6P0if8anhbAFFeuKC3ApVhnMQw+M8pJpKgBCKJ7RA8dLfR0ZBissdPzk8J5ucOS8oSrzmblGDHsG/boX6WLNMU14NRQrFFFsE8CuVi8h5qLcOEp+ccfrKay+KqIMVSiK8+DA5WluuEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCqwfDzm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCqwfDzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789257063; x=1820793063;
  h=date:from:to:cc:subject:message-id;
  bh=2HlGqeCCYg3cSUnu+e3e41O4AfA7NCsTkcRdFJhEMpA=;
  b=lCqwfDzmL8bXTDlTiGTnt1KR4IFTYCCNQnY7gSgTmny7D8jLTU8Jn5hE
   fvTdRlpsnWqfMoX3Rj6tHO6RlL4Vo6EWXG/tZ3RmlhIqMvCjEggmoLQrf
   s+KQPF9wA4nrGeUOtg+kf4zgz7filbGiumC6P62swusySdfa3QEnUz5EJ
   t6TTpNNwXJH7OUUlnGDt4XKSFdMKh3gPZWKwcFj5C3kHryV68LmqEc30x
   QdtDQuj6Rpz5d9mTL2SzydL2z+Dlbj9D1Pof6lhkEdKxSeuEEWcdsrfww
   8EnE8W+2Y+q5KyeAwImQhRWuCANwdjMipSlZovATunDQHq/u/97aE6+uW
   w==;
X-CSE-ConnectionGUID: z33qDXuYTo+Xt/ZVDn0F7w==
X-CSE-MsgGUID: P0Xv/XilSSW2vA5bl+8gxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="93543624"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="93543624"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 16:51:02 -0700
X-CSE-ConnectionGUID: ZQnwHmtiQmCy7saOASGN+A==
X-CSE-MsgGUID: 4rAkawPWQ2isny8iGPmlOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="276021259"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Sep 2026 16:51:02 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5XUl-000000003Pn-1kxS;
	Sat, 12 Sep 2026 23:50:56 +0000
Date: Sun, 13 Sep 2026 07:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/usb/host/octeon-hcd.c:235 This comment
 starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202609130710.cJbfk3fW-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cba2348ab114391f5b1a00fa65c5b739f13f0563
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b docs: kdoc: various fixes for grammar, spelling, punctuation
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20260913/202609130710.cJbfk3fW-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130710.cJbfk3fW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5f88f44d8427 ("docs: kdoc: various fixes for grammar, spelling, punctuation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609130710.cJbfk3fW-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
