Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FE622D7BB
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Mar 2025 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741766161; cv=none; b=JgFizsqZZDN4PK7P4/HrTMza++p6KZvMjjgNxi5iiN/S+2400VZNqvmHOADkVf9umx0BhwMBGMRn3gUDCYSsYxnn0h6nPRTpuIZD79JfRTKaijtGx9BuWo6jR6GY7shfD2Y6aFxey0AtNn93m1Fr9x/wtQzOuNHkE0mIhrLz4AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741766161; c=relaxed/simple;
	bh=c/fvcHJXL6xw8+MO9/tJdtFsbJPa0CU4sb51SJP4vAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGpTtw8+WcpkagcsuOOl+5l6SuI3sWV8yCwVme/tUvbLcuawEY+shh8Wlg6OL/IwW/K+XrKIW5sNdibsqg3yvlZmyMUibiXtpBPKQrzOtnkPNJG6TX1gs2J0TKsTwVp5hVGAl8yLD+KBmqKIzfGe4YhPy4gY3rsrc8rsNqk9l5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IouU0K7v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IouU0K7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741766160; x=1773302160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/fvcHJXL6xw8+MO9/tJdtFsbJPa0CU4sb51SJP4vAc=;
  b=IouU0K7v+cewbGgbuhHfSQ+1aEjn78/ie+eJb6BFbEELYQ7JUR/x2Z1H
   7VB5tvNHSAS4T/hCVkAgd8iAaH/B7DP8/f0NVdAz+6dn1oKhrthwMYXYb
   z1YE3BWuzpQQDggqgnREDbFsr/yYpMpAYVJxy2grTh9DVi7E0BHUmzLjm
   Fjdm87kPchbrz25oTSEapPL8J//mj8/0VS9cwT+QEjJw94B+dnXc4kvVn
   yvx1PcJndx62gdesNd6RuibRoDpHa8MLa7V5TofdmSpni1FzZu+OaFIKW
   bVj3fl+PfuNY2FGkOct/fdLS7Q0fTzs08rA+IbaSQ/lg5egw0zvj/smch
   g==;
X-CSE-ConnectionGUID: BLC/6EhPRTeeaeVZ3kJyvg==
X-CSE-MsgGUID: SqMKE9eoR1u+RByXkVsKcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42687895"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42687895"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 00:56:00 -0700
X-CSE-ConnectionGUID: ipSw5htKTxq2vuZTFsMJ0w==
X-CSE-MsgGUID: MpYpJhOxS0WjhFnLV4oKBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125758169"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2025 00:55:57 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsGwU-0008FK-2C;
	Wed, 12 Mar 2025 07:55:54 +0000
Date: Wed, 12 Mar 2025 15:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-desktop 2/2]
 drivers/usb/host/xhci-mem.c:2366 xhci_create_secondary_interrupter() error:
 uninitialized symbol 'i'.
Message-ID: <202503121547.DVzP1C7e-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   501e3c4dad2caa7d89416bbca980b0b803316a2e
commit: cca9824fd10fa5cf91be0a83f71a9ced6adc7c2a [2/2] FROMLIST: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-141-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121547.DVzP1C7e-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503121547.DVzP1C7e-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci-mem.c:2366 xhci_create_secondary_interrupter() error: uninitialized symbol 'i'.

Old smatch warnings:
drivers/usb/host/xhci-mem.c:2057 xhci_add_in_port() error: uninitialized symbol 'tmp_minor_revision'.

vim +/i +2366 drivers/usb/host/xhci-mem.c

b17a57f89f69069 Mathias Nyman  2023-02-02  2324  
c99b38c41234305 Mathias Nyman  2024-01-02  2325  struct xhci_interrupter *
9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2326  xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
cca9824fd10fa5c Wesley Cheng   2023-05-09  2327  				  u32 imod_interval, unsigned int intr_num)
c99b38c41234305 Mathias Nyman  2024-01-02  2328  {
c99b38c41234305 Mathias Nyman  2024-01-02  2329  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
c99b38c41234305 Mathias Nyman  2024-01-02  2330  	struct xhci_interrupter *ir;
c99b38c41234305 Mathias Nyman  2024-01-02  2331  	unsigned int i;
c99b38c41234305 Mathias Nyman  2024-01-02  2332  	int err = -ENOSPC;
c99b38c41234305 Mathias Nyman  2024-01-02  2333  
cca9824fd10fa5c Wesley Cheng   2023-05-09  2334  	if (!xhci->interrupters || xhci->max_interrupters <= 1 ||
cca9824fd10fa5c Wesley Cheng   2023-05-09  2335  	    intr_num >= xhci->max_interrupters)
c99b38c41234305 Mathias Nyman  2024-01-02  2336  		return NULL;
c99b38c41234305 Mathias Nyman  2024-01-02  2337  
db4460b6ecf0757 Niklas Neronin 2024-04-29  2338  	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
c99b38c41234305 Mathias Nyman  2024-01-02  2339  	if (!ir)
c99b38c41234305 Mathias Nyman  2024-01-02  2340  		return NULL;
c99b38c41234305 Mathias Nyman  2024-01-02  2341  
c99b38c41234305 Mathias Nyman  2024-01-02  2342  	spin_lock_irq(&xhci->lock);
cca9824fd10fa5c Wesley Cheng   2023-05-09  2343  	if (!intr_num) {
c99b38c41234305 Mathias Nyman  2024-01-02  2344  		/* Find available secondary interrupter, interrupter 0 is reserved for primary */
c99b38c41234305 Mathias Nyman  2024-01-02  2345  		for (i = 1; i < xhci->max_interrupters; i++) {
cca9824fd10fa5c Wesley Cheng   2023-05-09  2346  			if (!xhci->interrupters[i]) {
c99b38c41234305 Mathias Nyman  2024-01-02  2347  				err = xhci_add_interrupter(xhci, ir, i);
c99b38c41234305 Mathias Nyman  2024-01-02  2348  				break;
c99b38c41234305 Mathias Nyman  2024-01-02  2349  			}
c99b38c41234305 Mathias Nyman  2024-01-02  2350  		}
cca9824fd10fa5c Wesley Cheng   2023-05-09  2351  	} else {
cca9824fd10fa5c Wesley Cheng   2023-05-09  2352  		if (!xhci->interrupters[intr_num])
cca9824fd10fa5c Wesley Cheng   2023-05-09  2353  			err = xhci_add_interrupter(xhci, ir, intr_num);
cca9824fd10fa5c Wesley Cheng   2023-05-09  2354  	}
c99b38c41234305 Mathias Nyman  2024-01-02  2355  	spin_unlock_irq(&xhci->lock);
c99b38c41234305 Mathias Nyman  2024-01-02  2356  
c99b38c41234305 Mathias Nyman  2024-01-02  2357  	if (err) {
c99b38c41234305 Mathias Nyman  2024-01-02  2358  		xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
c99b38c41234305 Mathias Nyman  2024-01-02  2359  			  xhci->max_interrupters);
c99b38c41234305 Mathias Nyman  2024-01-02  2360  		xhci_free_interrupter(xhci, ir);
c99b38c41234305 Mathias Nyman  2024-01-02  2361  		return NULL;
c99b38c41234305 Mathias Nyman  2024-01-02  2362  	}
c99b38c41234305 Mathias Nyman  2024-01-02  2363  
9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2364  	err = xhci_set_interrupter_moderation(ir, imod_interval);
9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2365  	if (err)
9c0c11bb87b09a8 Mathias Nyman  2024-09-05 @2366  		xhci_warn(xhci, "Failed to set interrupter %d moderation to %uns\n",
9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2367  			  i, imod_interval);
9c0c11bb87b09a8 Mathias Nyman  2024-09-05  2368  
c99b38c41234305 Mathias Nyman  2024-01-02  2369  	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
cca9824fd10fa5c Wesley Cheng   2023-05-09  2370  		 ir->intr_num, xhci->max_interrupters);
c99b38c41234305 Mathias Nyman  2024-01-02  2371  
c99b38c41234305 Mathias Nyman  2024-01-02  2372  	return ir;
c99b38c41234305 Mathias Nyman  2024-01-02  2373  }
c99b38c41234305 Mathias Nyman  2024-01-02  2374  EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
c99b38c41234305 Mathias Nyman  2024-01-02  2375  

:::::: The code at line 2366 was first introduced by commit
:::::: 9c0c11bb87b09a8b7cdc21ca1090e7b36abe9d09 xhci: support setting interrupt moderation IMOD for secondary interrupters

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
