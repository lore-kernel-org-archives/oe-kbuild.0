Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2DC41C72
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765613960; cv=none; b=D5MxugpWZDiJCaSWFC971tdkRwTPECNkCr4pi2RpdlF2UVKlbG4aKmbrDaaCH3hZEODHr/H5EQRqzC/NdycFFxOPFeFhQjcfJilWncgb/EfmC6UW1zI7O0lD6asS8dORi/gvb8gCZS5wDhtzo3u3UXtQ8SHDprVV/rCg+ZAlSXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765613960; c=relaxed/simple;
	bh=nUo4BONlXUshPaityFw2CU/hHudJy+6Or73yy0vryQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CyDfpv1g2jAE7fVJKCsZK8m/ebmsgCGjQDO5wAwqFQ9F11C1avCm7mVbCNs+V6zeEVyB1NZPCxftPRfXIIIB2x5fX9bbMBt1y19H6HGabJiGbWW6nB4qg4dCaBdveYZtEaSAcvHfPpsWDFFXYxDTQzWDj0zBQeQWN6EW247DshY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jb4EJj5a; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jb4EJj5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765613959; x=1797149959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nUo4BONlXUshPaityFw2CU/hHudJy+6Or73yy0vryQA=;
  b=jb4EJj5ag4yWaK2c5GIsBoSPudLB9EWI3F+b5BkhXI5TRGavsrJS5Iw+
   qWkQSc+D3HGdKceJToROd19y2UF0cKJYRVwCnAGrBmVD5c2ptcqC3TGOf
   U2iwZQ/BRZzOuEW6OUzkMNpSmWEr2eN41eD3+ZsU/J+SW7axbCdeuBASG
   ZA6A0cALWmWJbpBB94L0hXOpG4F7IFD5uSqciCbq0SGs0VyOh8U7AdUSS
   QmuXhy7hj7/OZmQEMXoO3sN4XbjuciM2OQfdbAOjaO7FEeeeCt35M0NKx
   /TLl6WTndPIoBMSBQXROTw6uvwd1zPnbZjxZ1tFR/AACKz8IUONEiWyfU
   w==;
X-CSE-ConnectionGUID: XOF3OKo3T7SVWjATtAom0w==
X-CSE-MsgGUID: /6lcPuiMSrm5spC6/nrHIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67564682"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67564682"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:19:18 -0800
X-CSE-ConnectionGUID: 7QZMWpGeTYyr7PSVvVWnhA==
X-CSE-MsgGUID: 5HrEmitYRxyQTncBDdw3yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197547167"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 00:19:17 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKqQ-000000007Ib-1Szn;
	Sat, 13 Dec 2025 08:19:14 +0000
Date: Sat, 13 Dec 2025 16:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/usb/gadget/function/u_serial.c:580 gs_start_io() warn:
 variable dereferenced before check 'port->port_usb' (see line 547)
Message-ID: <202512131652.8xLhxugM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Kuen-Han Tsai" <khtsai@google.com>
CC: Prashanth K <prashanth.k@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: f6c7bc4a6823a0a959f40866a1efe99bd03c2c5b Revert "usb: gadget: u_serial: Add null pointer check in gs_start_io"
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131652.8xLhxugM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131652.8xLhxugM-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/function/u_serial.c:580 gs_start_io() warn: variable dereferenced before check 'port->port_usb' (see line 547)

Old smatch warnings:
drivers/usb/gadget/function/u_serial.c:348 gs_start_rx() warn: variable dereferenced before check 'port->port_usb' (see line 313)

vim +580 drivers/usb/gadget/function/u_serial.c

c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  534  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  535  /**
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  536   * gs_start_io - start USB I/O streams
1ba1f1414b543f drivers/usb/gadget/function/u_serial.c Lee Jones      2020-07-03  537   * @port: port to use
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  538   * Context: holding port_lock; port_tty and port_usb are non-null
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  539   *
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  540   * We only start I/O when something is connected to both sides of
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  541   * this port.  If nothing is listening on the host side, we may
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  542   * be pointlessly filling up our TX buffers and FIFO.
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  543   */
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  544  static int gs_start_io(struct gs_port *port)
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  545  {
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  546  	struct list_head	*head = &port->read_pool;
f6c7bc4a6823a0 drivers/usb/gadget/function/u_serial.c Kuen-Han Tsai  2025-06-17 @547  	struct usb_ep		*ep = port->port_usb->out;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  548  	int			status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  549  	unsigned		started;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  550  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  551  	/* Allocate RX and TX I/O buffers.  We can't easily do this much
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  552  	 * earlier (with GFP_KERNEL) because the requests are coupled to
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  553  	 * endpoints, as are the packet sizes we'll be using.  Different
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  554  	 * configurations may use different endpoints with a given port;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  555  	 * and high speed vs full speed changes packet sizes too.
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  556  	 */
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  557  	status = gs_alloc_requests(ep, head, gs_read_complete,
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  558  		&port->read_allocated);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  559  	if (status)
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  560  		return status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  561  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  562  	status = gs_alloc_requests(port->port_usb->in, &port->write_pool,
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  563  			gs_write_complete, &port->write_allocated);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  564  	if (status) {
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  565  		gs_free_requests(ep, head, &port->read_allocated);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  566  		return status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  567  	}
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  568  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  569  	/* queue read requests */
937ef73d507599 drivers/usb/gadget/u_serial.c          David Brownell 2008-07-07  570  	port->n_read = 0;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  571  	started = gs_start_rx(port);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  572  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  573  	if (started) {
e4bfded56cf39b drivers/usb/gadget/function/u_serial.c Sergey Organov 2020-01-29  574  		gs_start_tx(port);
e4bfded56cf39b drivers/usb/gadget/function/u_serial.c Sergey Organov 2020-01-29  575  		/* Unblock any pending writes into our circular buffer, in case
e4bfded56cf39b drivers/usb/gadget/function/u_serial.c Sergey Organov 2020-01-29  576  		 * we didn't in gs_start_tx() */
35f95fd7f234d2 drivers/usb/gadget/u_serial.c          Jiri Slaby     2012-04-02  577  		tty_wakeup(port->port.tty);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  578  	} else {
4cfbca86f6a8b8 drivers/usb/gadget/function/u_serial.c Lianqin Hu     2024-12-03  579  		/* Free reqs only if we are still connected */
4cfbca86f6a8b8 drivers/usb/gadget/function/u_serial.c Lianqin Hu     2024-12-03 @580  		if (port->port_usb) {
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  581  			gs_free_requests(ep, head, &port->read_allocated);
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  582  			gs_free_requests(port->port_usb->in, &port->write_pool,
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  583  				&port->write_allocated);
4cfbca86f6a8b8 drivers/usb/gadget/function/u_serial.c Lianqin Hu     2024-12-03  584  		}
937ef73d507599 drivers/usb/gadget/u_serial.c          David Brownell 2008-07-07  585  		status = -EIO;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  586  	}
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  587  
937ef73d507599 drivers/usb/gadget/u_serial.c          David Brownell 2008-07-07  588  	return status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  589  }
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  590  

:::::: The code at line 580 was first introduced by commit
:::::: 4cfbca86f6a8b801f3254e0e3c8f2b1d2d64be2b usb: gadget: u_serial: Fix the issue that gs_start_io crashed due to accessing null pointer

:::::: TO: Lianqin Hu <hulianqin@vivo.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
