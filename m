Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAEA1DA605
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731863584; cv=none; b=CcpP7yLOXfW2qTsqrcGHxaRH1uYKj3pKc7cfJsHOpUtUsnHaMiqkBMNXt4ExkZ5q00aWd11bhMj3xQs8oEaPIqHGGzvK2JEfXQenaYTihRYyM3lOsyJwDa3uzt2uLhDS8t6ijCQhilLmuSiOsGkk9vgMrBIljB9Jd2gcK7Ya76E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731863584; c=relaxed/simple;
	bh=as/o90OAnpW7RdtbJAKiBFZASL308DBRyUQwJYqALo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2IzpmHEe0mPPkXZC6K2j37K3CqUBYu4v4gTicSpYF2xvBQX1ruNLpGtlH9n0O9v5MmUd+/DZUIbwSgF368G19Bf8eRvnp8pSpPn3a+csvbL9u79/ONf2A48klWmx6j3t9kwhzMj01WfU+UIW7CMk9u8FS9h/xx15+O3u4z5n20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eo1Q5XGm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eo1Q5XGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731863582; x=1763399582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=as/o90OAnpW7RdtbJAKiBFZASL308DBRyUQwJYqALo8=;
  b=eo1Q5XGmpw4z4Atm9XuCNZpDCeIgV9meMhkD5/IfSJOdZF3nq8BxKH0K
   VEuQ6k44ws+UnT7yOXxpL1TgedfaEom6cXXxfyM7L3xU3WldujOD11fNP
   uPheW30/88YO08Kvg26wIfrsmNRIUsvMNxy3wZs3l0J6J4sZ/xpbrBGFp
   tfpl+4d4x83IoTqtKpKmqBLugyQKssOYOmSbn/tjCLX1wRs+6iNZDIIze
   Xco67RIYXaa4Zyb9yVAx1vwuxou2xUJnTXvXMsNsjUuhPYevoxf7q26MD
   rJlPpgg8BhTgNuw9YgbSd3jTq3AzCY1N1iL0jR1mDmmmuzc68gP2O/h1e
   Q==;
X-CSE-ConnectionGUID: heI1+9GbS5+xt89i101coQ==
X-CSE-MsgGUID: EuDEQFaDTBWnQPrWFp7zzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43216976"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="43216976"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 09:13:01 -0800
X-CSE-ConnectionGUID: hCTTgXF/RfSMibXXt2Oq3Q==
X-CSE-MsgGUID: aym/fizkQIuVzn3cu0LMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="93949638"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2024 09:13:00 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCipV-0001xp-2U;
	Sun, 17 Nov 2024 17:12:57 +0000
Date: Mon, 18 Nov 2024 01:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_cx0_phy.c:119:7-50: opportunity
 for str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK)
Message-ID: <202411180127.gaKCnj3T-lkp@intel.com>
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
TO: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
CC: Mika Kahola <mika.kahola@intel.com>
CC: Imre Deak <imre.deak@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a5df37964673effcd9f84041f7423206a5ae5f2
commit: 51390cc0e00a378b7c152bb6f63efc0a01b59d20 drm/i915/mtl: Add Support for C10 PHY message bus and pll programming
date:   1 year, 7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 7 months ago
config: i386-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180127.gaKCnj3T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411180127.gaKCnj3T-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_cx0_phy.c:119:7-50: opportunity for str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK)
   drivers/gpu/drm/i915/display/intel_cx0_phy.c:126:7-50: opportunity for str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK)

vim +119 drivers/gpu/drm/i915/display/intel_cx0_phy.c

51390cc0e00a37 Radhakrishna Sripada 2023-04-13  100  
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  101  static int intel_cx0_wait_for_ack(struct drm_i915_private *i915, enum port port,
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  102  				  int command, int lane, u32 *val)
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  103  {
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  104  	enum phy phy = intel_port_to_phy(i915, port);
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  105  
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  106  	if (__intel_de_wait_for_register(i915,
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  107  					 XELPDP_PORT_P2M_MSGBUS_STATUS(port, lane),
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  108  					 XELPDP_PORT_P2M_RESPONSE_READY,
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  109  					 XELPDP_PORT_P2M_RESPONSE_READY,
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  110  					 XELPDP_MSGBUS_TIMEOUT_FAST_US,
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  111  					 XELPDP_MSGBUS_TIMEOUT_SLOW, val)) {
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  112  		drm_dbg_kms(&i915->drm, "PHY %c Timeout waiting for message ACK. Status: 0x%x\n",
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  113  			    phy_name(phy), *val);
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  114  		return -ETIMEDOUT;
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  115  	}
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  116  
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  117  	if (*val & XELPDP_PORT_P2M_ERROR_SET) {
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  118  		drm_dbg_kms(&i915->drm, "PHY %c Error occurred during %s command. Status: 0x%x\n", phy_name(phy),
51390cc0e00a37 Radhakrishna Sripada 2023-04-13 @119  			    command == XELPDP_PORT_P2M_COMMAND_READ_ACK ? "read" : "write", *val);
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  120  		intel_cx0_bus_reset(i915, port, lane);
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  121  		return -EINVAL;
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  122  	}
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  123  
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  124  	if (REG_FIELD_GET(XELPDP_PORT_P2M_COMMAND_TYPE_MASK, *val) != command) {
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  125  		drm_dbg_kms(&i915->drm, "PHY %c Not a %s response. MSGBUS Status: 0x%x.\n", phy_name(phy),
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  126  			    command == XELPDP_PORT_P2M_COMMAND_READ_ACK ? "read" : "write", *val);
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  127  		intel_cx0_bus_reset(i915, port, lane);
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  128  		return -EINVAL;
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  129  	}
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  130  
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  131  	return 0;
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  132  }
51390cc0e00a37 Radhakrishna Sripada 2023-04-13  133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
