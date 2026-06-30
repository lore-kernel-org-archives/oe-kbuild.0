Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8BF383333
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jun 2026 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833274; cv=none; b=drrifihmgpWHkAbdo0MyIsnAXyMQznNEVfTW5STkZ6xQ8Y2uG++u+/Epvyv7Wz8mi/bgkNTuQ7T3c+NR9DpOLdLLmHvtv/XpLNyrZ9yn4LTXGBo8Zbv2vWgyn14qImWrwt9l349dXxZH68DlNcOosJNFrAr7TTvC18FdInL3LtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833274; c=relaxed/simple;
	bh=Jpf+LRH0JYBmVDlGFZkZeFWatzz/t6mDWeFPE2htJ1o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GG+QguLceXx2USipv0ayvcti2YjZd+f0iIksAW5JGIvGXhAW3+jFuoVuMYufUGT6PYAXBy0JwyIpzU3vglrotmPNXDuHsIX8UY2pTKTGMdUE4hO8xbbytfqNBwAnfTVYItBXAwjnt0EUGVTnr7NSOZuH7os8LjkJ4UKxNWUcy+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbNjupKf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbNjupKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782833270; x=1814369270;
  h=date:from:to:cc:subject:message-id;
  bh=Jpf+LRH0JYBmVDlGFZkZeFWatzz/t6mDWeFPE2htJ1o=;
  b=nbNjupKfvYDadx71+Rdq3iMvSpfkOACZvoDOyf59e9/Dd8swlvJDE1lJ
   RZhNSQ/mqMxw6WtBh4F0aw7CGK1i6LFYvEwhxEsehjIpw4mw5dlegLswE
   HNR966cg1t2mWH6/zFLjvzl/1IGkHNVF/6OvwKueQz7cBe4as8l+/THPk
   HNfg/Gu3730aYURgbu4w7hJDaWAQrX2xxAZ2v+/HtlSI0wHxWZOd3py7o
   eCuoSuOSWBO6SQnIpUdXkS9mD/hGHCXQeNeqOXyVgyk8o3mkep6biX4rA
   afiatXDw6zQL1YEr+q03BV2yfoEE5Rm6hnJ62GkaA2Kk4ESlPzfvJ3lnK
   Q==;
X-CSE-ConnectionGUID: MPR+mz45SGCDB2zg3nAFzg==
X-CSE-MsgGUID: 2wxtzz8oQyeetu7Ksf1nqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93907944"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="93907944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:27:49 -0700
X-CSE-ConnectionGUID: l8qBuDNZRX+HQMRSmxUPeA==
X-CSE-MsgGUID: bnp0y0f0TViFHb8LAvm5wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="252946888"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Jun 2026 08:27:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weaNF-000000008Ry-2ImI;
	Tue, 30 Jun 2026 15:27:45 +0000
Date: Tue, 30 Jun 2026 23:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:7.2-rc 97/160]
 drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3854:18: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202606302329.LU6hi3Uw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3854:18: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

Hi Daniel,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: b38c51084f43bbd0577275476789fd2611e06ffc [97/160] net: dsa: add 802.1Q VLAN-based tag driver for MxL862xx
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: sparc64-randconfig-r133-20260630 (https://download.01.org/0day-ci/archive/20260630/202606302329.LU6hi3Uw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302329.LU6hi3Uw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606302329.LU6hi3Uw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2138:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2138:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2145:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2145:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2157:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2157:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2157:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2333:65: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2333:65: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2333:65: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2336:66: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2336:66: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2336:66: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2399:65: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2399:65: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2399:65: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2402:66: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2402:66: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2402:66: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2419:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2419:36: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2419:36: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2424:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2424:51: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2424:51: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2427:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2427:52: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2427:52: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2555:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] bridge_id @@     got restricted __le16 [addressable] [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2555:41: sparse:     expected unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2555:41: sparse:     got restricted __le16 [addressable] [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2605:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_id @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2605:32: sparse:     expected restricted __le16 [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2605:32: sparse:     got unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2676:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2676:35: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2676:35: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2784:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] age_timer @@     got unsigned int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2784:25: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] age_timer
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2784:25: sparse:     got unsigned int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2814:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] bridge_id @@     got restricted __le16 [addressable] [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2814:49: sparse:     expected unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2814:49: sparse:     got restricted __le16 [addressable] [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2851:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2851:57: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2851:57: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2854:58: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2854:58: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2854:58: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2867:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2867:44: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2867:44: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2871:59: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2871:59: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2871:59: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2874:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2874:60: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2874:60: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2894:51: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] bridge_id @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2894:51: sparse:     expected restricted __le16 [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2894:51: sparse:     got unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2990:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2990:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2990:28: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2993:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2993:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2993:28: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3178:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got unsigned int [assigned] cpu_port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3178:36: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3178:36: sparse:     got unsigned int [assigned] cpu_port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3179:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3179:40: sparse:     expected restricted __le16
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3179:40: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3195:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3195:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3195:28: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3368:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3368:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3368:28: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3506:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3506:28: sparse:     expected restricted __le32 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3506:28: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3525:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] fid @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3525:27: sparse:     expected restricted __le16 [addressable] [usertype] fid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3525:27: sparse:     got unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3527:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] tci @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3527:35: sparse:     expected restricted __le16 [addressable] [usertype] tci
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3527:35: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3551:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] tci @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3551:27: sparse:     expected restricted __le16 [addressable] [usertype] tci
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3551:27: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3561:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] fid @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3561:27: sparse:     expected restricted __le16 [addressable] [usertype] fid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3561:27: sparse:     got unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3591:26: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3592:44: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3633:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] bridge_id @@     got unsigned short [assigned] [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3633:41: sparse:     expected restricted __le16 [assigned] [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3633:41: sparse:     got unsigned short [assigned] [usertype] bridge_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3854:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/sparc/include/uapi/asm/byteorder.h, include/asm-generic/qrwlock_types.h, ...):
   include/uapi/linux/byteorder/big_endian.h:83:32: sparse: signed value source

vim +3854 drivers/net/dsa/mxl862xx_downstream/mxl862xx.c

96aefe538fdf60 Frank Wunderlich 2026-03-07  3839  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3840  static int ds_add_mux(struct mxl862xx_priv *priv, struct device_node *np)
96aefe538fdf60 Frank Wunderlich 2026-03-07  3841  {
96aefe538fdf60 Frank Wunderlich 2026-03-07  3842  	const __be32 *_id = of_get_property(np, "reg", NULL);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3843  	struct device_node *child;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3844  	struct combo_port_mux *mux;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3845  	unsigned int id;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3846  	int err, sfp_present;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3847  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3848  	if (!_id) {
96aefe538fdf60 Frank Wunderlich 2026-03-07  3849  		dev_err(priv->dev, "missing attach dp id\n");
96aefe538fdf60 Frank Wunderlich 2026-03-07  3850  		return -EINVAL;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3851  	}
96aefe538fdf60 Frank Wunderlich 2026-03-07  3852  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3853  	id = be32_to_cpup(_id);
96aefe538fdf60 Frank Wunderlich 2026-03-07 @3854  	if (id < 0 || id >= MAX_PORTS) {
96aefe538fdf60 Frank Wunderlich 2026-03-07  3855  		dev_err(priv->dev, "%d is not a valid attach dp id\n", id);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3856  		return -EINVAL;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3857  	}
96aefe538fdf60 Frank Wunderlich 2026-03-07  3858  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3859  	mux = kzalloc(sizeof(struct combo_port_mux), GFP_KERNEL);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3860  	if (unlikely(!mux)) {
96aefe538fdf60 Frank Wunderlich 2026-03-07  3861  		dev_err(priv->dev, "failed to create mux structure\n");
96aefe538fdf60 Frank Wunderlich 2026-03-07  3862  		return -ENOMEM;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3863  	}
96aefe538fdf60 Frank Wunderlich 2026-03-07  3864  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3865  	mux->mod_def0_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
96aefe538fdf60 Frank Wunderlich 2026-03-07  3866  				"mod-def0", 0, GPIOD_IN |
96aefe538fdf60 Frank Wunderlich 2026-03-07  3867  				GPIOD_FLAGS_BIT_NONEXCLUSIVE, "?");
96aefe538fdf60 Frank Wunderlich 2026-03-07  3868  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3869  	if (IS_ERR(mux->mod_def0_gpio)) {
96aefe538fdf60 Frank Wunderlich 2026-03-07  3870  		dev_err(priv->dev, "failed to requset gpio for mod-def0\n");
96aefe538fdf60 Frank Wunderlich 2026-03-07  3871  		err = PTR_ERR(mux->mod_def0_gpio);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3872  		goto err_free_mux;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3873  	}
96aefe538fdf60 Frank Wunderlich 2026-03-07  3874  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3875  	mux->chan_sel_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
96aefe538fdf60 Frank Wunderlich 2026-03-07  3876  				"chan-sel", 0, GPIOD_OUT_LOW, "?");
96aefe538fdf60 Frank Wunderlich 2026-03-07  3877  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3878  	if (IS_ERR(mux->chan_sel_gpio)) {
96aefe538fdf60 Frank Wunderlich 2026-03-07  3879  		dev_err(priv->dev, "failed to requset gpio for chan-sel\n");
96aefe538fdf60 Frank Wunderlich 2026-03-07  3880  		err = PTR_ERR(mux->chan_sel_gpio);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3881  		goto err_put_mod_def0;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3882  	}
96aefe538fdf60 Frank Wunderlich 2026-03-07  3883  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3884  	if (of_property_read_u32(np, "sfp-present-channel",
96aefe538fdf60 Frank Wunderlich 2026-03-07  3885  				 &mux->sfp_present_channel))
96aefe538fdf60 Frank Wunderlich 2026-03-07  3886  		mux->sfp_present_channel = 0;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3887  	else if (mux->sfp_present_channel > 1)
96aefe538fdf60 Frank Wunderlich 2026-03-07  3888  		mux->sfp_present_channel = 1;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3889  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3890  	priv->ds_mux[id] = mux;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3891  	mux->dp = dsa_to_port(priv->ds, id);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3892  	/* Keep probe deterministic: always start from non-SFP channel.
96aefe538fdf60 Frank Wunderlich 2026-03-07  3893  	 * The monitor worker will switch to SFP channel after boot if needed.
96aefe538fdf60 Frank Wunderlich 2026-03-07  3894  	 */
96aefe538fdf60 Frank Wunderlich 2026-03-07  3895  	sfp_present = gpiod_get_value_cansleep(mux->mod_def0_gpio);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3896  	if (sfp_present < 0) {
96aefe538fdf60 Frank Wunderlich 2026-03-07  3897  		dev_warn(priv->dev,
96aefe538fdf60 Frank Wunderlich 2026-03-07  3898  			 "failed to read mod-def0 gpio, forcing non-SFP init channel\n");
96aefe538fdf60 Frank Wunderlich 2026-03-07  3899  	}
96aefe538fdf60 Frank Wunderlich 2026-03-07  3900  	mux->channel = !mux->sfp_present_channel;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3901  	gpiod_set_value_cansleep(mux->chan_sel_gpio, mux->channel);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3902  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3903  	for_each_child_of_node(np, child) {
96aefe538fdf60 Frank Wunderlich 2026-03-07  3904  		err = ds_add_mux_channel(mux, child);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3905  		if (err) {
96aefe538fdf60 Frank Wunderlich 2026-03-07  3906  			dev_err(priv->dev, "failed to add ds_mux\n");
96aefe538fdf60 Frank Wunderlich 2026-03-07  3907  			of_node_put(child);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3908  			goto err_put_chan_sel;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3909  		}
96aefe538fdf60 Frank Wunderlich 2026-03-07  3910  	}
96aefe538fdf60 Frank Wunderlich 2026-03-07  3911  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3912  	mux->dp->dn = mux->data[mux->channel]->of_node;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3913  	mux->dp->pl = mux->data[mux->channel]->phylink;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3914  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3915  	INIT_DELAYED_WORK(&mux->sfp_monitor_work, sfp_monitor_work_func);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3916  	mod_delayed_work(system_wq, &mux->sfp_monitor_work, msecs_to_jiffies(3000));
96aefe538fdf60 Frank Wunderlich 2026-03-07  3917  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3918  	return 0;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3919  
96aefe538fdf60 Frank Wunderlich 2026-03-07  3920  err_put_chan_sel:
96aefe538fdf60 Frank Wunderlich 2026-03-07  3921  	gpiod_put(mux->chan_sel_gpio);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3922  err_put_mod_def0:
96aefe538fdf60 Frank Wunderlich 2026-03-07  3923  	gpiod_put(mux->mod_def0_gpio);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3924  err_free_mux:
96aefe538fdf60 Frank Wunderlich 2026-03-07  3925  	kfree(mux);
96aefe538fdf60 Frank Wunderlich 2026-03-07  3926  	priv->ds_mux[id] = NULL;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3927  	return err;
96aefe538fdf60 Frank Wunderlich 2026-03-07  3928  }
96aefe538fdf60 Frank Wunderlich 2026-03-07  3929  

:::::: The code at line 3854 was first introduced by commit
:::::: 96aefe538fdf60924d25ab9ee28d665648458ddc net: dsa: add mxl downstream driver from 6.19-main

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
