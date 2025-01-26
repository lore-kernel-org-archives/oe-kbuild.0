Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F7A155330
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jan 2025 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737886881; cv=none; b=WcptHsHwNZIyMKVy4/2uejMd75Fs/K0ezSsjTs3te9TB29Pyo6/efZZxuJ4lU+fwd21LcVhL8qzCFiN9IVMx17Ha7lYMnxNyphmkPjbtuLAaBvJHNaY+4FF4o4SR0kS8NJ5UNu2D4X0MuUDWNpVI1EgPwylhzT8xoq5SsqXzerU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737886881; c=relaxed/simple;
	bh=7RC+/kCPi3+tYFXdUAHrrJnM3/0tVMO0B8xa6zRp7X8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3Yt+3aHx4EYrygJ6OKcg8ts3bNsuqEb/EegjhtOTRuTdJcaiXpAvEDDv/8rHDgkHxlFR0+nXb3Ahk7rMS0M8Bno8lkRokLfd6N2GtdHhrBk5eOrjG9MEUKuClvxmoY2YtvPrNuQ54tg78O6rLR9NHs8vfG7JmkVObbIzxvwceY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edl2XCD6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edl2XCD6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737886879; x=1769422879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7RC+/kCPi3+tYFXdUAHrrJnM3/0tVMO0B8xa6zRp7X8=;
  b=edl2XCD6aj0tlu7mLWkd0TtkUGo3TIrQeiHe23CfwDmP2eUtZJSaDLnK
   ZGAh7V0ax+RJqdBDPBe5Ia4dcFsIr+ZnMs+KmXXSviBwv46HSqbySGmBf
   SGDCx87B0jNzLKqrz1vxd2RFIkmK/DkDzkFr60FNdxgeZ5Q137d43BiBS
   oIP8w2PR89uEEATKv5o0J6bloo68N2sxNm9ssCUzH6Iy/9QmBOChFquX5
   6CEP+b7935J+bGa1iK7Nk0RE8YIQGsRkSTIw25fB8T0WsnO8JSfU/MyEW
   4tUoFex0uJgtCLbqr7RQYty22WTcq+0rKw/vNXuOR4eaapw9bDMYKXJGp
   w==;
X-CSE-ConnectionGUID: BTzHMpLlSZe/JEfhohJSlA==
X-CSE-MsgGUID: 7/vlCHb+TWqWJ8hKNm3klQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="42124864"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="42124864"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 02:21:18 -0800
X-CSE-ConnectionGUID: HEmOI7KrQOKO+gK4dM5YiQ==
X-CSE-MsgGUID: ATPa2dkMS0K/wSw6T/4TKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="108063494"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jan 2025 02:21:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbzlS-000fGd-2r;
	Sun, 26 Jan 2025 10:21:14 +0000
Date: Sun, 26 Jan 2025 18:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.4 1/1]
 drivers/usb/gadget/function/u_serial.c:570 gs_start_io() warn: variable
 dereferenced before check 'port->port_usb' (see line 537)
Message-ID: <202501261840.WluPurER-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   49530c73f82d0377a960e70d167621ca922d4d59
commit: 4efdfdc32d8d6307f968cd99f1db64468471bab1 [1/1] usb: gadget: u_serial: Fix the issue that gs_start_io crashed due to accessing null pointer
:::::: branch date: 16 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-161-20250126 (https://download.01.org/0day-ci/archive/20250126/202501261840.WluPurER-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501261840.WluPurER-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/function/u_serial.c:570 gs_start_io() warn: variable dereferenced before check 'port->port_usb' (see line 537)

Old smatch warnings:
drivers/usb/gadget/function/u_serial.c:339 gs_start_rx() warn: variable dereferenced before check 'port->port_usb' (see line 304)

vim +570 drivers/usb/gadget/function/u_serial.c

c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  524  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  525  /**
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  526   * gs_start_io - start USB I/O streams
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  527   * @dev: encapsulates endpoints to use
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  528   * Context: holding port_lock; port_tty and port_usb are non-null
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  529   *
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  530   * We only start I/O when something is connected to both sides of
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  531   * this port.  If nothing is listening on the host side, we may
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  532   * be pointlessly filling up our TX buffers and FIFO.
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  533   */
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  534  static int gs_start_io(struct gs_port *port)
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  535  {
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  536  	struct list_head	*head = &port->read_pool;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19 @537  	struct usb_ep		*ep = port->port_usb->out;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  538  	int			status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  539  	unsigned		started;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  540  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  541  	/* Allocate RX and TX I/O buffers.  We can't easily do this much
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  542  	 * earlier (with GFP_KERNEL) because the requests are coupled to
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  543  	 * endpoints, as are the packet sizes we'll be using.  Different
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  544  	 * configurations may use different endpoints with a given port;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  545  	 * and high speed vs full speed changes packet sizes too.
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  546  	 */
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  547  	status = gs_alloc_requests(ep, head, gs_read_complete,
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  548  		&port->read_allocated);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  549  	if (status)
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  550  		return status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  551  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  552  	status = gs_alloc_requests(port->port_usb->in, &port->write_pool,
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  553  			gs_write_complete, &port->write_allocated);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  554  	if (status) {
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  555  		gs_free_requests(ep, head, &port->read_allocated);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  556  		return status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  557  	}
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  558  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  559  	/* queue read requests */
937ef73d507599 drivers/usb/gadget/u_serial.c          David Brownell 2008-07-07  560  	port->n_read = 0;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  561  	started = gs_start_rx(port);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  562  
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  563  	if (started) {
5d48ee32116070 drivers/usb/gadget/function/u_serial.c Sergey Organov 2020-01-29  564  		gs_start_tx(port);
5d48ee32116070 drivers/usb/gadget/function/u_serial.c Sergey Organov 2020-01-29  565  		/* Unblock any pending writes into our circular buffer, in case
5d48ee32116070 drivers/usb/gadget/function/u_serial.c Sergey Organov 2020-01-29  566  		 * we didn't in gs_start_tx() */
35f95fd7f234d2 drivers/usb/gadget/u_serial.c          Jiri Slaby     2012-04-02  567  		tty_wakeup(port->port.tty);
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  568  	} else {
4efdfdc32d8d63 drivers/usb/gadget/function/u_serial.c Lianqin Hu     2024-12-03  569  		/* Free reqs only if we are still connected */
4efdfdc32d8d63 drivers/usb/gadget/function/u_serial.c Lianqin Hu     2024-12-03 @570  		if (port->port_usb) {
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  571  			gs_free_requests(ep, head, &port->read_allocated);
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  572  			gs_free_requests(port->port_usb->in, &port->write_pool,
28609d4083bcd4 drivers/usb/gadget/u_serial.c          Jim Sung       2010-11-04  573  				&port->write_allocated);
4efdfdc32d8d63 drivers/usb/gadget/function/u_serial.c Lianqin Hu     2024-12-03  574  		}
937ef73d507599 drivers/usb/gadget/u_serial.c          David Brownell 2008-07-07  575  		status = -EIO;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  576  	}
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  577  
937ef73d507599 drivers/usb/gadget/u_serial.c          David Brownell 2008-07-07  578  	return status;
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  579  }
c1dca562be8ada drivers/usb/gadget/u_serial.c          David Brownell 2008-06-19  580  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
