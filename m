Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C41862
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 00:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754007892; cv=none; b=LELVQtx/Qbf7f61Ji4oMFy3gWZu5J3pZ8j0QACZwOL4hUpTy+r4nEpN+S+vTsIfvy7WHOR+ZAWdsxq2qTvg7mUjFHhhLxAtHBC+v/KlK/8ro52Hu4JvYMLyEEZ3CiR9JgQ6ZZVR8Q6I2JldQnp/F2h4A54V08+LWUNhzyQD58lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754007892; c=relaxed/simple;
	bh=i3QuYeqrlhUFZQAaBycqAqyA4mqUQOeZ431tHQVmKt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2uAfcCOGfnLzx+KL3PwsFwY76m54hcIjvb37sWo+CQd7KgU/xFHjBGM0dwV20mOHVGNXfNKM5Fb7EZq95R0RxW5miM0JvA70ZD8UHs9XaK2ad3/BDhmULYJjQBgtdqBCALMrnekEBiZH4j+xH7CdiC+VEisjF9hNMQKDA+BZ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzDqQJ/U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzDqQJ/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754007891; x=1785543891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i3QuYeqrlhUFZQAaBycqAqyA4mqUQOeZ431tHQVmKt0=;
  b=jzDqQJ/UyunTROqgTwma02Hf0PfT1wArbyX9CaVNR9VX8BOY1maOymtK
   bgdoViDMVnYloCIXXHglpr7F62YDbN8eL22IIkUJyTGULFC6c+jaFeoe1
   ixPlN4IW9RHYtg/tpvWdfMDEJ2YNU+XqL50bi4cvXo9nP2fubPulOTrM+
   izkEQZac8bOCeitnqjty9xlPkyCR02/zbA0ffOQheirRlnqeuYcuQGkBQ
   tL3CgWIvRgNrXbLhAIn1L9ZDwrDR++jf/xIWSppJf32bKqgOec1Pj1C3+
   v/g8PYoHMD/N6dwce6oDocRK6Z2a0vs9Qk86Q+Wt4AbwRGiQQ7/r5qd8s
   g==;
X-CSE-ConnectionGUID: BNiz+vk8SJuWwY8RqFz5Uw==
X-CSE-MsgGUID: 050ESQatT5KtdW6+eXTynQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56495108"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56495108"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 17:24:50 -0700
X-CSE-ConnectionGUID: y7fHISnWRg+eGCWWaCqcfg==
X-CSE-MsgGUID: cw3IHOlgR8GMxFzeweR+Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="194242330"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2025 17:24:49 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhdZm-0004F2-2t;
	Fri, 01 Aug 2025 00:24:46 +0000
Date: Fri, 1 Aug 2025 08:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] usb:xhci:Fix slot_id resource race conflict
Message-ID: <202508010850.Bqd6wf47-lkp@intel.com>
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
In-Reply-To: <20250730152715.8368-1-WeitaoWang-oc@zhaoxin.com>
References: <20250730152715.8368-1-WeitaoWang-oc@zhaoxin.com>
TO: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
TO: gregkh@linuxfoundation.org
TO: mathias.nyman@intel.com
TO: linux-usb@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: WeitaoWang@zhaoxin.com
CC: wwt8723@163.com
CC: CobeChen@zhaoxin.com
CC: stable@vger.kernel.org

Hi Weitao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.16 next-20250731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Weitao-Wang/usb-xhci-Fix-slot_id-resource-race-conflict/20250730-183802
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250730152715.8368-1-WeitaoWang-oc%40zhaoxin.com
patch subject: [PATCH v3] usb:xhci:Fix slot_id resource race conflict
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010850.Bqd6wf47-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508010850.Bqd6wf47-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci-mem.c:913 xhci_free_virt_device() warn: variable dereferenced before check 'dev->out_ctx' (see line 878)

Old smatch warnings:
drivers/usb/host/xhci-mem.c:2102 xhci_add_in_port() error: uninitialized symbol 'tmp_minor_revision'.

vim +913 drivers/usb/host/xhci-mem.c

839c817ce67178 Sarah Sharp    2011-09-02  861  
839c817ce67178 Sarah Sharp    2011-09-02  862  
839c817ce67178 Sarah Sharp    2011-09-02  863  /* All the xhci_tds in the ring's TD list should be freed at this point.
839c817ce67178 Sarah Sharp    2011-09-02  864   * Should be called with xhci->lock held if there is any chance the TT lists
839c817ce67178 Sarah Sharp    2011-09-02  865   * will be manipulated by the configure endpoint, allocate device, or update
839c817ce67178 Sarah Sharp    2011-09-02  866   * hub functions while this function is removing the TT entries from the list.
839c817ce67178 Sarah Sharp    2011-09-02  867   */
0b5ed80150eb59 Weitao Wang    2025-07-30  868  void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
0b5ed80150eb59 Weitao Wang    2025-07-30  869  		int slot_id)
3ffbba9511b414 Sarah Sharp    2009-04-27  870  {
3ffbba9511b414 Sarah Sharp    2009-04-27  871  	int i;
2e27980e6eb781 Sarah Sharp    2011-09-02  872  	int old_active_eps = 0;
3ffbba9511b414 Sarah Sharp    2009-04-27  873  
3ffbba9511b414 Sarah Sharp    2009-04-27  874  	/* Slot ID 0 is reserved */
0b5ed80150eb59 Weitao Wang    2025-07-30  875  	if (slot_id == 0 || !dev)
3ffbba9511b414 Sarah Sharp    2009-04-27  876  		return;
3ffbba9511b414 Sarah Sharp    2009-04-27  877  
0b5ed80150eb59 Weitao Wang    2025-07-30 @878  	if (xhci->dcbaa->dev_context_ptrs[slot_id] == cpu_to_le64(dev->out_ctx->dma))
8e595a5d30a5ee Sarah Sharp    2009-07-27  879  		xhci->dcbaa->dev_context_ptrs[slot_id] = 0;
3ffbba9511b414 Sarah Sharp    2009-04-27  880  
d850c1658328e7 Zhengjun Xing  2018-06-21  881  	trace_xhci_free_virt_device(dev);
d850c1658328e7 Zhengjun Xing  2018-06-21  882  
2e27980e6eb781 Sarah Sharp    2011-09-02  883  	if (dev->tt_info)
2e27980e6eb781 Sarah Sharp    2011-09-02  884  		old_active_eps = dev->tt_info->active_eps;
2e27980e6eb781 Sarah Sharp    2011-09-02  885  
98871e9470a50c Felipe Balbi   2017-01-23  886  	for (i = 0; i < 31; i++) {
63a0d9abd18cdc Sarah Sharp    2009-09-04  887  		if (dev->eps[i].ring)
63a0d9abd18cdc Sarah Sharp    2009-09-04  888  			xhci_ring_free(xhci, dev->eps[i].ring);
8df75f42f8e67e Sarah Sharp    2010-04-02  889  		if (dev->eps[i].stream_info)
8df75f42f8e67e Sarah Sharp    2010-04-02  890  			xhci_free_stream_info(xhci,
8df75f42f8e67e Sarah Sharp    2010-04-02  891  					dev->eps[i].stream_info);
5aed5b7c2430ce Mathias Nyman  2022-10-24  892  		/*
5aed5b7c2430ce Mathias Nyman  2022-10-24  893  		 * Endpoints are normally deleted from the bandwidth list when
5aed5b7c2430ce Mathias Nyman  2022-10-24  894  		 * endpoints are dropped, before device is freed.
5aed5b7c2430ce Mathias Nyman  2022-10-24  895  		 * If host is dying or being removed then endpoints aren't
5aed5b7c2430ce Mathias Nyman  2022-10-24  896  		 * dropped cleanly, so delete the endpoint from list here.
5aed5b7c2430ce Mathias Nyman  2022-10-24  897  		 * Only applicable for hosts with software bandwidth checking.
2e27980e6eb781 Sarah Sharp    2011-09-02  898  		 */
5aed5b7c2430ce Mathias Nyman  2022-10-24  899  
5aed5b7c2430ce Mathias Nyman  2022-10-24  900  		if (!list_empty(&dev->eps[i].bw_endpoint_list)) {
5aed5b7c2430ce Mathias Nyman  2022-10-24  901  			list_del_init(&dev->eps[i].bw_endpoint_list);
5aed5b7c2430ce Mathias Nyman  2022-10-24  902  			xhci_dbg(xhci, "Slot %u endpoint %u not removed from BW list!\n",
2e27980e6eb781 Sarah Sharp    2011-09-02  903  				 slot_id, i);
8df75f42f8e67e Sarah Sharp    2010-04-02  904  		}
5aed5b7c2430ce Mathias Nyman  2022-10-24  905  	}
839c817ce67178 Sarah Sharp    2011-09-02  906  	/* If this is a hub, free the TT(s) from the TT list */
839c817ce67178 Sarah Sharp    2011-09-02  907  	xhci_free_tt_info(xhci, dev, slot_id);
2e27980e6eb781 Sarah Sharp    2011-09-02  908  	/* If necessary, update the number of active TTs on this root port */
2e27980e6eb781 Sarah Sharp    2011-09-02  909  	xhci_update_tt_active_eps(xhci, dev, old_active_eps);
3ffbba9511b414 Sarah Sharp    2009-04-27  910  
3ffbba9511b414 Sarah Sharp    2009-04-27  911  	if (dev->in_ctx)
d115b04818e57b John Youn      2009-07-27  912  		xhci_free_container_ctx(xhci, dev->in_ctx);
3ffbba9511b414 Sarah Sharp    2009-04-27 @913  	if (dev->out_ctx)
d115b04818e57b John Youn      2009-07-27  914  		xhci_free_container_ctx(xhci, dev->out_ctx);
d115b04818e57b John Youn      2009-07-27  915  
a400efe455f7b6 Mathias Nyman  2018-03-16  916  	if (dev->udev && dev->udev->slot_id)
a400efe455f7b6 Mathias Nyman  2018-03-16  917  		dev->udev->slot_id = 0;
74151b5349266b Niklas Neronin 2024-02-29  918  	if (dev->rhub_port && dev->rhub_port->slot_id == slot_id)
74151b5349266b Niklas Neronin 2024-02-29  919  		dev->rhub_port->slot_id = 0;
0b5ed80150eb59 Weitao Wang    2025-07-30  920  	if (xhci->devs[slot_id] == dev)
326b4810cc9952 Randy Dunlap   2010-04-19  921  		xhci->devs[slot_id] = NULL;
0b5ed80150eb59 Weitao Wang    2025-07-30  922  	kfree(dev);
3ffbba9511b414 Sarah Sharp    2009-04-27  923  }
3ffbba9511b414 Sarah Sharp    2009-04-27  924  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
