Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED982E541F
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 23:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769037921; cv=none; b=rqE9/47nNPVHE8iod20GU3CfeXNU5mlPVn19MINidUDizd0DVQx+UmCIlmR7fmGOH5gPOwtKKhqzf8eRkfozDYFe9T7Fqo962IB3JBO+Qkbx+Xc08rOsjyT/q9WUXvX3ThOJWyzg9d5NbI1E88ZeRTisYZGt57WZs6dy/ekmoJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769037921; c=relaxed/simple;
	bh=u/7TSx1duRStNER/ef6HDDGmldHh7kEchL2r56GP5hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVIjs6rhPZ+qxPrPvP48OH0mApv1VWZ8lWlxHKz70JwwhX0u+pcjEYjE+5bYCx1HRxBOw++IOIb4mtfstTK1DMSeWwXW2mivc3Ow1kPpGRZXfJR0t9g+GySvMm5nunTuhWPmO8o+2iKPmHxJqOp6QnP7WLDDJ22aXLZQYXbo3Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJmevqUk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJmevqUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769037919; x=1800573919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u/7TSx1duRStNER/ef6HDDGmldHh7kEchL2r56GP5hw=;
  b=iJmevqUkSWFgJCVRk19BFqH5fA5DTntZciv9MfI7ByY56iN8YXlXYTdJ
   rXkg8zYinfK1hNEauy9mHZn4QK3nhr5JEGQNdIh4ojwU99gD4xeP3rh8f
   CV5ecXLqasdYWsOZW8TxtTRXTMr3GFVK9Lxp9iQZk9J6zSoDlN+h9Sx2x
   6PUvtePH/IgYO93ia0qFexrvv4CPyzMhDs8u11MszNpE/2b17pCO8FO5P
   4x10atC2INz3AQ1sbTz4BvMx6rZgCoHN5k1DKLvONVOmwZ4vhuwkZUaUp
   uM/hqa9YykTCq6LtXDo9ixf4Xp23KS3MwIo4BtzFO/ax2DUn6OTP6tqvV
   g==;
X-CSE-ConnectionGUID: mKmpw9uzQg+YH1j9IaMvWg==
X-CSE-MsgGUID: MTUpeAeHTuyWLLe6d4+UKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70326398"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70326398"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 15:25:19 -0800
X-CSE-ConnectionGUID: O+MmOYQJT7qWaBQfzmIMVg==
X-CSE-MsgGUID: Q76I6uvZREmXJYcftNYvTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206480248"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 15:25:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vihZa-00000000S5x-3KRC;
	Wed, 21 Jan 2026 23:25:14 +0000
Date: Thu, 22 Jan 2026 07:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <202601220733.dS3GMZRD-lkp@intel.com>
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
In-Reply-To: <20260121060857.237777-1-acelan.kao@canonical.com>
References: <20260121060857.237777-1-acelan.kao@canonical.com>
TO: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
TO: Andreas Noever <andreas.noever@gmail.com>
TO: Mika Westerberg <westeri@kernel.org>
TO: Yehezkel Bernat <YehezkelShB@gmail.com>
TO: linux-usb@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Chia-Lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v6.19-rc6 next-20260121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chia-Lin-Kao-AceLan/thunderbolt-Fix-PCIe-device-enumeration-with-delayed-rescan/20260121-141206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20260121060857.237777-1-acelan.kao%40canonical.com
patch subject: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed rescan
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-r073-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220733.dS3GMZRD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601220733.dS3GMZRD-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/tb.c:128 tb_pci_rescan_work_fn() error: uninitialized symbol 'dev'.
drivers/thunderbolt/tb.c:2392 tb_tunnel_pci() error: uninitialized symbol 'dev'.

vim +/dev +128 drivers/thunderbolt/tb.c

eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21   97) 
5ae367748f1573 Mika Westerberg       2024-08-26   98  static void tb_scan_port(struct tb_port *port);
4f807e47ee9a75 Mika Westerberg       2018-09-17   99  static void tb_handle_hotplug(struct work_struct *work);
d6d458d42e1e15 Mika Westerberg       2024-08-20  100  static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
d6d458d42e1e15 Mika Westerberg       2024-08-20  101  				       const char *reason);
d6d458d42e1e15 Mika Westerberg       2024-08-20  102  static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
d6d458d42e1e15 Mika Westerberg       2024-08-20  103  					  int retry, unsigned long delay);
4f807e47ee9a75 Mika Westerberg       2018-09-17  104  
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  105) static void tb_pci_rescan_work_fn(struct work_struct *work)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  106) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  107) 	struct tb_pci_rescan_work *rescan_work =
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  108) 		container_of(work, typeof(*rescan_work), work.work);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  109) 	struct tb *tb = rescan_work->tb;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  110) 	struct pci_bus *bus = rescan_work->bus;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  111) 	int devices_after = 0;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  112) 	struct pci_dev *dev;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  113) 	struct tb_switch *sw;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  114) 	struct tb_port *port;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  115) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  116) 	mutex_lock(&tb->lock);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  117) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  118) 	sw = tb_switch_find_by_route(tb, rescan_work->route);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  119) 	if (!sw) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  120) 		tb_dbg(tb, "Switch at route %llx disappeared, skipping rescan\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  121) 		       rescan_work->route);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  122) 		goto out_unlock;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  123) 	}
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  124) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  125) 	port = &sw->ports[rescan_work->port];
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  126) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  127) 	pci_lock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21 @128) 	for_each_pci_dev(dev)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  129) 		devices_after++;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  130) 	pci_unlock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  131) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  132) 	if (devices_after > rescan_work->devices_before) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  133) 		tb_port_dbg(port, "pciehp enumerated %d new device(s)\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  134) 			    devices_after - rescan_work->devices_before);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  135) 	} else {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  136) 		tb_port_info(port, "pciehp failed to enumerate devices, triggering rescan\n");
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  137) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  138) 		pci_lock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  139) 		pci_rescan_bus(bus);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  140) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  141) 		devices_after = 0;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  142) 		for_each_pci_dev(dev)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  143) 			devices_after++;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  144) 		pci_unlock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  145) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  146) 		if (devices_after > rescan_work->devices_before)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  147) 			tb_port_info(port, "rescan found %d new device(s)\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  148) 				     devices_after - rescan_work->devices_before);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  149) 		else
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  150) 			tb_port_warn(port, "no devices found even after rescan\n");
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  151) 	}
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  152) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  153) 	tb_switch_put(sw);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  154) out_unlock:
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  155) 	mutex_unlock(&tb->lock);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  156) 	kfree(rescan_work);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  157) }
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  158) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
