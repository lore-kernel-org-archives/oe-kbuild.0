Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2DE23C4FD
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765438609; cv=none; b=eH3uqjvWzNyGeTGpOLJDb/HooJ4NwgH5fhW1jBo/2CwQLvCeAc5sUBw/nnnyc7uaFL0nb7FioKfd4yf5V8vzoKAdJMyjEzuYScNY6w/rbXOuQJ4WBFbXO4xIGQoSsU+k7XwMQ59JEN/QxOkJz54MsZF10YR9aC+/MSQhydb7dw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765438609; c=relaxed/simple;
	bh=kgfWRR6yCmcZCIOf2VMQdz5zphdhHM1pnl9sBJHvVPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C18+0uw2sIXuSu2IltSgq0ku0RoYFfy0kpV41Cx9nmnVmudp59Ak5u9GiFZIEQOoIV5KNYwHOT2GHAwvZ3T/2P3QrV9ZIzBDRaZxN6GesqQaWYaibvjiLrz5YNKEzxZGOptgc4kXGn8p0YJlDMRk45s4+fRAhgvr5UiFSAmSOVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcNwn/Yb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcNwn/Yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765438608; x=1796974608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kgfWRR6yCmcZCIOf2VMQdz5zphdhHM1pnl9sBJHvVPE=;
  b=OcNwn/YbSh8sANIZDj10DjT6t7OviHWZehUB6lX/zI//eK07QX/tnD05
   MncwZk8FvMjpd0BOWENI99jD/icItQfe+uiy7Wr6hEGzmvJnSzNXxpDh+
   ToQGBsDMsDrVC0lnqyCLnTF8IvTDQEGxlhc1qoOEMlNg1OB3WhESoZhKm
   /3bM0v0GKg0kRZUQ5MIdg8eoRBwfCQPn1Rh3WF44afuiWaFNihROR1lOe
   D8ivDnkDbRNDiJjyUTMV6snlftX6sJm2Vsrx+lkFAHWkn3ys2pS/p0kiE
   vTbbqzR3W5ZMpKON7Nd+Lw0po/yIyVy1nTDvlMf+5IATtcGQtMstdRBTJ
   g==;
X-CSE-ConnectionGUID: 09wOTY4NRFCR/x63/9s3cQ==
X-CSE-MsgGUID: FP6qzh/WTMCdxu88UQsINg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71039920"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71039920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 23:36:48 -0800
X-CSE-ConnectionGUID: VwoQYcR2RMOuAa9KgUW1fg==
X-CSE-MsgGUID: 9j7luHpaR6WVDRK8VYWIsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201651982"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 23:36:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTbEB-000000004MT-2OUp;
	Thu, 11 Dec 2025 07:36:43 +0000
Date: Thu, 11 Dec 2025 15:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC net-next 6/6] cadence: macb/gem: introduce xmit
 support
Message-ID: <202512111439.XPT2quKV-lkp@intel.com>
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
In-Reply-To: <20251119135330.551835-7-pvalerio@redhat.com>
References: <20251119135330.551835-7-pvalerio@redhat.com>
TO: Paolo Valerio <pvalerio@redhat.com>

Hi Paolo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Valerio/cadence-macb-gem-Add-page-pool-support/20251208-222631
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251119135330.551835-7-pvalerio%40redhat.com
patch subject: [PATCH RFC net-next 6/6] cadence: macb/gem: introduce xmit support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111439.XPT2quKV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111439.XPT2quKV-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/cadence/macb_main.c:1515 gem_xdp_run() warn: statement has no effect 'struct'

vim +/struct +1515 drivers/net/ethernet/cadence/macb_main.c

cef83d10b917a0 Paolo Valerio 2025-11-19  1491  
0091ece12c4ae5 Paolo Valerio 2025-11-19  1492  static u32 gem_xdp_run(struct macb_queue *queue, struct xdp_buff *xdp,
cef83d10b917a0 Paolo Valerio 2025-11-19  1493  		       struct net_device *dev, dma_addr_t addr)
0091ece12c4ae5 Paolo Valerio 2025-11-19  1494  {
0091ece12c4ae5 Paolo Valerio 2025-11-19  1495  	struct bpf_prog *prog;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1496  	u32 act = XDP_PASS;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1497  
0091ece12c4ae5 Paolo Valerio 2025-11-19  1498  	rcu_read_lock();
0091ece12c4ae5 Paolo Valerio 2025-11-19  1499  
0091ece12c4ae5 Paolo Valerio 2025-11-19  1500  	prog = rcu_dereference(queue->bp->prog);
0091ece12c4ae5 Paolo Valerio 2025-11-19  1501  	if (!prog)
0091ece12c4ae5 Paolo Valerio 2025-11-19  1502  		goto out;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1503  
0091ece12c4ae5 Paolo Valerio 2025-11-19  1504  	act = bpf_prog_run_xdp(prog, xdp);
0091ece12c4ae5 Paolo Valerio 2025-11-19  1505  	switch (act) {
0091ece12c4ae5 Paolo Valerio 2025-11-19  1506  	case XDP_PASS:
0091ece12c4ae5 Paolo Valerio 2025-11-19  1507  		goto out;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1508  	case XDP_REDIRECT:
0091ece12c4ae5 Paolo Valerio 2025-11-19  1509  		if (unlikely(xdp_do_redirect(dev, xdp, prog))) {
0091ece12c4ae5 Paolo Valerio 2025-11-19  1510  			act = XDP_DROP;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1511  			break;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1512  		}
0091ece12c4ae5 Paolo Valerio 2025-11-19  1513  		goto out;
cef83d10b917a0 Paolo Valerio 2025-11-19  1514  	case XDP_TX:
cef83d10b917a0 Paolo Valerio 2025-11-19 @1515  		struct xdp_frame *xdpf = xdp_convert_buff_to_frame(xdp);
cef83d10b917a0 Paolo Valerio 2025-11-19  1516  
cef83d10b917a0 Paolo Valerio 2025-11-19  1517  		if (!xdpf || macb_xdp_submit_frame(queue->bp, xdpf, dev, addr))
cef83d10b917a0 Paolo Valerio 2025-11-19  1518  			act = XDP_DROP;
cef83d10b917a0 Paolo Valerio 2025-11-19  1519  		goto out;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1520  	default:
0091ece12c4ae5 Paolo Valerio 2025-11-19  1521  		bpf_warn_invalid_xdp_action(dev, prog, act);
0091ece12c4ae5 Paolo Valerio 2025-11-19  1522  		fallthrough;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1523  	case XDP_ABORTED:
0091ece12c4ae5 Paolo Valerio 2025-11-19  1524  		trace_xdp_exception(dev, prog, act);
0091ece12c4ae5 Paolo Valerio 2025-11-19  1525  		fallthrough;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1526  	case XDP_DROP:
0091ece12c4ae5 Paolo Valerio 2025-11-19  1527  		break;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1528  	}
0091ece12c4ae5 Paolo Valerio 2025-11-19  1529  
0091ece12c4ae5 Paolo Valerio 2025-11-19  1530  	page_pool_put_full_page(queue->page_pool,
0091ece12c4ae5 Paolo Valerio 2025-11-19  1531  				virt_to_head_page(xdp->data), true);
0091ece12c4ae5 Paolo Valerio 2025-11-19  1532  out:
0091ece12c4ae5 Paolo Valerio 2025-11-19  1533  	rcu_read_unlock();
0091ece12c4ae5 Paolo Valerio 2025-11-19  1534  
0091ece12c4ae5 Paolo Valerio 2025-11-19  1535  	return act;
0091ece12c4ae5 Paolo Valerio 2025-11-19  1536  }
0091ece12c4ae5 Paolo Valerio 2025-11-19  1537  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
