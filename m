Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A949632A3C9
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295869; cv=none; b=DDcU1H4u0AohxsUAgNpr9CeikP9dsRKUmBba/bkARTiCFLwpRtUOLEM62CkBy4s4S8c23YNMtmGBnWSRozFtQUl7eLSbRyIBt8rROGm6T3bIIDSOE7U5MDE5Iz+o+hWdpMBk7SATZ5Nxbs5Na0QHIfKeQ5rM+SNj66soE33D0Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295869; c=relaxed/simple;
	bh=gZ7BVs8EVCg7QTB2E2cSMOZ1b7r1j191bHaLkO+R8wc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qigE43LkuyjS4ZYAAx6Dt9YOWH10kjkOQnUE4rQ/Vz7hq7tX67R1HXFCqPX7cU8Zoc41jldv6T9yKDg1zmwq7P6FsqjRMx74Ei737YneYbOthLVjEF7NYU8atmwSq+A2mVngBNiN/5sGQOC44Tz0s0MiSfU6Wuru6UrIrkxLddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYd6Fw2K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYd6Fw2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791295867; x=1822831867;
  h=date:from:to:cc:subject:message-id;
  bh=gZ7BVs8EVCg7QTB2E2cSMOZ1b7r1j191bHaLkO+R8wc=;
  b=CYd6Fw2Khj9TJJWruF86PI1Pga+sxcdAXYsYHc1xpwsoQ/xJraHL/07O
   s7aLKF1hLn+k5v+rW2A+r5iCTjsMp9As0r33FRwf7MhE1Nyyjp3DxZkwh
   csyzwa0pfN/FWF2CBfM3rKQUaRwrG9/yDWZsSNekOY24iJ9FBIeVHG6ij
   35eQw4oyr7gnxzcZDxK6UbfkQoH5LVxJP+NeK64Mi+zglpSWZSouGsTrh
   5cnJ7AhADvY2jUv6ZeRHSl9F/S5tRGD9Dw6D8R3HZAA5WfJ7xpBHJg4ce
   MV99VHuGTJF/Z+nj088OnmVqevkQTzstt1QkEmwfoXKn6UFbAhgYxEc8q
   g==;
X-CSE-ConnectionGUID: 5nKhy7afT4ie9ArCBkEf0w==
X-CSE-MsgGUID: nnOUzHvuTb+i2DX5QkVKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="26430"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="26430"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 07:11:05 -0700
X-CSE-ConnectionGUID: StHzh+dWSe2qnl7G1scvnw==
X-CSE-MsgGUID: 33sEMOvmT26h18YJ8WZfLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="277295011"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2026 07:11:04 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE5sj-000000001M7-2W3J;
	Tue, 06 Oct 2026 14:11:01 +0000
Date: Tue, 06 Oct 2026 16:10:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/broadcom/bnge/bnge_link.c:401:8-32:
 opportunity for str_on_off(( fec & BNGE_FEC_AUTONEG ))
Message-ID: <202610061616.gcBpAFvk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Vikas Gupta <vikas.gupta@broadcom.com>
CC: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
CC: Ajit Kumar Khaparde <ajit.khaparde@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   22430ae5d90ab288b0ee2ad99ae941f4a666b694
commit: 7626cd3d53be5249769bd2784a65bfccdce9ffaf bng_en: query PHY capabilities and report link status
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-r2104-20261005 (https://download.01.org/0day-ci/archive/20261006/202610061616.gcBpAFvk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7626cd3d53be ("bng_en: query PHY capabilities and report link status")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610061616.gcBpAFvk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/broadcom/bnge/bnge_link.c:401:8-32: opportunity for str_on_off(( fec & BNGE_FEC_AUTONEG ))

vim +401 drivers/net/ethernet/broadcom/bnge/bnge_link.c

7626cd3d53be52 Bhargava Marreddy 2026-04-06  349  
7626cd3d53be52 Bhargava Marreddy 2026-04-06  350  void bnge_report_link(struct bnge_dev *bd)
7626cd3d53be52 Bhargava Marreddy 2026-04-06  351  {
7626cd3d53be52 Bhargava Marreddy 2026-04-06  352  	if (BNGE_LINK_IS_UP(bd)) {
7626cd3d53be52 Bhargava Marreddy 2026-04-06  353  		const char *signal = "";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  354  		const char *flow_ctrl;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  355  		const char *duplex;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  356  		u32 speed;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  357  		u16 fec;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  358  
7626cd3d53be52 Bhargava Marreddy 2026-04-06  359  		netif_carrier_on(bd->netdev);
7626cd3d53be52 Bhargava Marreddy 2026-04-06  360  		speed = bnge_fw_to_ethtool_speed(bd->link_info.link_speed);
7626cd3d53be52 Bhargava Marreddy 2026-04-06  361  		if (speed == SPEED_UNKNOWN) {
7626cd3d53be52 Bhargava Marreddy 2026-04-06  362  			netdev_info(bd->netdev,
7626cd3d53be52 Bhargava Marreddy 2026-04-06  363  				    "NIC Link is Up, speed unknown\n");
7626cd3d53be52 Bhargava Marreddy 2026-04-06  364  			return;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  365  		}
7626cd3d53be52 Bhargava Marreddy 2026-04-06  366  		if (bd->link_info.duplex == BNGE_LINK_DUPLEX_FULL)
7626cd3d53be52 Bhargava Marreddy 2026-04-06  367  			duplex = "full";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  368  		else
7626cd3d53be52 Bhargava Marreddy 2026-04-06  369  			duplex = "half";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  370  		if (bd->link_info.pause == BNGE_LINK_PAUSE_BOTH)
7626cd3d53be52 Bhargava Marreddy 2026-04-06  371  			flow_ctrl = "ON - receive & transmit";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  372  		else if (bd->link_info.pause == BNGE_LINK_PAUSE_TX)
7626cd3d53be52 Bhargava Marreddy 2026-04-06  373  			flow_ctrl = "ON - transmit";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  374  		else if (bd->link_info.pause == BNGE_LINK_PAUSE_RX)
7626cd3d53be52 Bhargava Marreddy 2026-04-06  375  			flow_ctrl = "ON - receive";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  376  		else
7626cd3d53be52 Bhargava Marreddy 2026-04-06  377  			flow_ctrl = "none";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  378  		if (bd->link_info.phy_qcfg_resp.option_flags &
7626cd3d53be52 Bhargava Marreddy 2026-04-06  379  		    PORT_PHY_QCFG_RESP_OPTION_FLAGS_SIGNAL_MODE_KNOWN) {
7626cd3d53be52 Bhargava Marreddy 2026-04-06  380  			u8 sig_mode = bd->link_info.active_fec_sig_mode &
7626cd3d53be52 Bhargava Marreddy 2026-04-06  381  				      PORT_PHY_QCFG_RESP_SIGNAL_MODE_MASK;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  382  			switch (sig_mode) {
7626cd3d53be52 Bhargava Marreddy 2026-04-06  383  			case PORT_PHY_QCFG_RESP_SIGNAL_MODE_NRZ:
7626cd3d53be52 Bhargava Marreddy 2026-04-06  384  				signal = "(NRZ) ";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  385  				break;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  386  			case PORT_PHY_QCFG_RESP_SIGNAL_MODE_PAM4:
7626cd3d53be52 Bhargava Marreddy 2026-04-06  387  				signal = "(PAM4 56Gbps) ";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  388  				break;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  389  			case PORT_PHY_QCFG_RESP_SIGNAL_MODE_PAM4_112:
7626cd3d53be52 Bhargava Marreddy 2026-04-06  390  				signal = "(PAM4 112Gbps) ";
7626cd3d53be52 Bhargava Marreddy 2026-04-06  391  				break;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  392  			default:
7626cd3d53be52 Bhargava Marreddy 2026-04-06  393  				break;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  394  			}
7626cd3d53be52 Bhargava Marreddy 2026-04-06  395  		}
7626cd3d53be52 Bhargava Marreddy 2026-04-06  396  		netdev_info(bd->netdev, "NIC Link is Up, %u Mbps %s%s duplex, Flow control: %s\n",
7626cd3d53be52 Bhargava Marreddy 2026-04-06  397  			    speed, signal, duplex, flow_ctrl);
7626cd3d53be52 Bhargava Marreddy 2026-04-06  398  		fec = bd->link_info.fec_cfg;
7626cd3d53be52 Bhargava Marreddy 2026-04-06  399  		if (!(fec & PORT_PHY_QCFG_RESP_FEC_CFG_FEC_NONE_SUPPORTED))
7626cd3d53be52 Bhargava Marreddy 2026-04-06  400  			netdev_info(bd->netdev, "FEC autoneg %s encoding: %s\n",
7626cd3d53be52 Bhargava Marreddy 2026-04-06 @401  				    (fec & BNGE_FEC_AUTONEG) ? "on" : "off",

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
