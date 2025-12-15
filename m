Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B547EEAB
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765761903; cv=none; b=k5zJ08pl7ustVMX1YoNj0RLa96QPM0wSXhja2BllgebHFs5rTZ+vVtXRG3CmoUKm8tHYMHX6o6iPWA40nOi3zL6Tm8gqV0zdZGnhW5wlm9XLDEdN1yxMNLRQ+DJCd2/nwoA0DdDUDcciIFDtwwnyZ22IIDeGOZdLs84oaip7CAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765761903; c=relaxed/simple;
	bh=ztMliIoOgTvsv+G5BLQ2INja0a27eXNOMGRB7bBwCqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPng5sIeuQiIKg+W9lsaJeL1S+Em/hSFjAJ4kfJjFWOZqlbVVTjiJvpbMU22RX4/AJ7bmXmj7rAyvB/8iLPLlqbsCeuZjUFsGm4NP3cmYU7ttbru+SB/lhxMkvqEW8lnSWQ0OQyYnCsIxa2bKltcHe8aGtoL3p0QTnq9RaZYLjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyEH6gRN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyEH6gRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765761901; x=1797297901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ztMliIoOgTvsv+G5BLQ2INja0a27eXNOMGRB7bBwCqA=;
  b=UyEH6gRNRiebAXW4uknD9MWIj+qVFrMRhvxL0rEGvzbuB1En/fD2hPUF
   QjoH1OuDsWCPxVYxUANePvlykq96X6xJbzXgMAtfgc2kQ9dC1QMTrO/Jb
   MPag9H8lDIo9MYrFvS54RiFeIK2GTDRhIzXGyfF2CqP9VzzYyVlsfAWXe
   p1tR5xRuD4DwScVXqxPDHk3L3vI0RkIN30AtOTDiJDJw6Ds2ajeTMh1NM
   vfNNLl1Nd9qE8B6iXvxfJtpELUSEvLO6siChn1Hds1W2WkQzqcI65u6JY
   ISWivBucScJ+fw6NNu/3SBRw8LHam2/au5GCApBz4cAMJ+4G2U/b3YMUi
   Q==;
X-CSE-ConnectionGUID: vGIuXBhhSXqQPbx7iGFd7A==
X-CSE-MsgGUID: mBeqL6qJQe6qJUxPgQLTzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67601818"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67601818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 17:24:59 -0800
X-CSE-ConnectionGUID: 46hSn0gTSk+4cmnfJYyP0w==
X-CSE-MsgGUID: focEaRDrRCSpez1JfZVHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202101819"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Dec 2025 17:24:57 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUxKY-000000009Yl-32lO;
	Mon, 15 Dec 2025 01:24:54 +0000
Date: Mon, 15 Dec 2025 09:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/thunderbolt/tunnel.c:155:16-17: WARNING opportunity for max()
Message-ID: <202512150921.zRadglCI-lkp@intel.com>
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
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   7 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 months ago
config: um-randconfig-r063-20251215 (https://download.01.org/0day-ci/archive/20251215/202512150921.zRadglCI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512150921.zRadglCI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thunderbolt/tunnel.c:155:16-17: WARNING opportunity for max()
   drivers/thunderbolt/tunnel.c:1653:16-17: WARNING opportunity for max()
--
>> drivers/pci/quirks.c:2758:4-31: opportunity for str_enabled_disabled(flags & HT_MSI_FLAGS_ENABLE)
--
>> drivers/net/ethernet/realtek/r8169_main.c:5634:7-23: opportunity for str_enabled_disabled(tp -> dash_enabled)
--
>> drivers/pci/setup-bus.c:2108:21-24: ERROR: invalid reference to the index variable of the iterator on line 2082

vim +155 drivers/thunderbolt/tunnel.c

6ed541c53edcd5 Mika Westerberg 2021-03-22  110  
6ed541c53edcd5 Mika Westerberg 2021-03-22  111  /**
6ed541c53edcd5 Mika Westerberg 2021-03-22  112   * tb_available_credits() - Available credits for PCIe and DMA
6ed541c53edcd5 Mika Westerberg 2021-03-22  113   * @port: Lane adapter to check
6ed541c53edcd5 Mika Westerberg 2021-03-22  114   * @max_dp_streams: If non-%NULL stores maximum number of simultaneous DP
6ed541c53edcd5 Mika Westerberg 2021-03-22  115   *		    streams possible through this lane adapter
6ed541c53edcd5 Mika Westerberg 2021-03-22  116   */
6ed541c53edcd5 Mika Westerberg 2021-03-22  117  static unsigned int tb_available_credits(const struct tb_port *port,
6ed541c53edcd5 Mika Westerberg 2021-03-22  118  					 size_t *max_dp_streams)
6ed541c53edcd5 Mika Westerberg 2021-03-22  119  {
6ed541c53edcd5 Mika Westerberg 2021-03-22  120  	const struct tb_switch *sw = port->sw;
6ed541c53edcd5 Mika Westerberg 2021-03-22  121  	int credits, usb3, pcie, spare;
6ed541c53edcd5 Mika Westerberg 2021-03-22  122  	size_t ndp;
6ed541c53edcd5 Mika Westerberg 2021-03-22  123  
6ed541c53edcd5 Mika Westerberg 2021-03-22  124  	usb3 = tb_acpi_may_tunnel_usb3() ? sw->max_usb3_credits : 0;
6ed541c53edcd5 Mika Westerberg 2021-03-22  125  	pcie = tb_acpi_may_tunnel_pcie() ? sw->max_pcie_credits : 0;
6ed541c53edcd5 Mika Westerberg 2021-03-22  126  
6ed541c53edcd5 Mika Westerberg 2021-03-22  127  	if (tb_acpi_is_xdomain_allowed()) {
7ee20d0afb69df Mika Westerberg 2022-09-08  128  		spare = min_not_zero(sw->max_dma_credits, dma_credits);
6ed541c53edcd5 Mika Westerberg 2021-03-22  129  		/* Add some credits for potential second DMA tunnel */
6ed541c53edcd5 Mika Westerberg 2021-03-22  130  		spare += TB_MIN_DMA_CREDITS;
6ed541c53edcd5 Mika Westerberg 2021-03-22  131  	} else {
6ed541c53edcd5 Mika Westerberg 2021-03-22  132  		spare = 0;
6ed541c53edcd5 Mika Westerberg 2021-03-22  133  	}
6ed541c53edcd5 Mika Westerberg 2021-03-22  134  
6ed541c53edcd5 Mika Westerberg 2021-03-22  135  	credits = tb_usable_credits(port);
6ed541c53edcd5 Mika Westerberg 2021-03-22  136  	if (tb_acpi_may_tunnel_dp()) {
6ed541c53edcd5 Mika Westerberg 2021-03-22  137  		/*
6ed541c53edcd5 Mika Westerberg 2021-03-22  138  		 * Maximum number of DP streams possible through the
6ed541c53edcd5 Mika Westerberg 2021-03-22  139  		 * lane adapter.
6ed541c53edcd5 Mika Westerberg 2021-03-22  140  		 */
93bf344f66995e Gil Fine        2022-05-09  141  		if (sw->min_dp_aux_credits + sw->min_dp_main_credits)
6ed541c53edcd5 Mika Westerberg 2021-03-22  142  			ndp = (credits - (usb3 + pcie + spare)) /
6ed541c53edcd5 Mika Westerberg 2021-03-22  143  			      (sw->min_dp_aux_credits + sw->min_dp_main_credits);
93bf344f66995e Gil Fine        2022-05-09  144  		else
93bf344f66995e Gil Fine        2022-05-09  145  			ndp = 0;
6ed541c53edcd5 Mika Westerberg 2021-03-22  146  	} else {
6ed541c53edcd5 Mika Westerberg 2021-03-22  147  		ndp = 0;
6ed541c53edcd5 Mika Westerberg 2021-03-22  148  	}
6ed541c53edcd5 Mika Westerberg 2021-03-22  149  	credits -= ndp * (sw->min_dp_aux_credits + sw->min_dp_main_credits);
6ed541c53edcd5 Mika Westerberg 2021-03-22  150  	credits -= usb3;
6ed541c53edcd5 Mika Westerberg 2021-03-22  151  
6ed541c53edcd5 Mika Westerberg 2021-03-22  152  	if (max_dp_streams)
6ed541c53edcd5 Mika Westerberg 2021-03-22  153  		*max_dp_streams = ndp;
6ed541c53edcd5 Mika Westerberg 2021-03-22  154  
6ed541c53edcd5 Mika Westerberg 2021-03-22 @155  	return credits > 0 ? credits : 0;
6ed541c53edcd5 Mika Westerberg 2021-03-22  156  }
6ed541c53edcd5 Mika Westerberg 2021-03-22  157  

:::::: The code at line 155 was first introduced by commit
:::::: 6ed541c53edcd5bf3cbd9fd600fd593e95ec79fb thunderbolt: Allocate credits according to router preferences

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Mika Westerberg <mika.westerberg@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
