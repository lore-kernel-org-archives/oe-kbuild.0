Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4431DFF7
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 18:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732990563; cv=none; b=PgKQ9TrNUKVfbkiqQk6YjKjOJL2QyHJqQcX2TfOxSymocMGt8gxCZCopPDRfCWSfL3cw1F8uJhDlF9pFattAU76CQXP2icaJf+mH1ZVXhDM0sivCYHmGe3dDJKANJtqUgZLbibrGuzFp6qAgnKuPHtGIwIshQO2NtEJ1oOxnVRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732990563; c=relaxed/simple;
	bh=iDXB8jE/HJ/Vr0O/yp+sPd5X4Q48m5IMpkqgsLekSdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCovw9SVi78KxFJNCsZ2QP0OrhqQp+H9hmB0e+HULa7HHhbrMzhd/HJdKRuQtQRCID5LDE3xlyUV97l0z7G/rd01C4b/B3Z8yUxe7wmIcBAdvIW8OJK9IM+Ft8dkEOd3Uw3Q6AMbPRRaAOE9WlbSU1D7u5DLslbpm+P9mjfZeH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7mx2qhg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7mx2qhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732990561; x=1764526561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDXB8jE/HJ/Vr0O/yp+sPd5X4Q48m5IMpkqgsLekSdA=;
  b=A7mx2qhglNbjA1EAiFccSHz2T6XrmwMcxozQJLZBDQSSkZRvpyYaK7g8
   5ntIiQAvdWqjzUppTaUvNOQxS+esZSwYH8jScCJVuokEKTL6xQ2pnD67n
   xqXwXSweTAQsq7nZY4wpvw09tNy5d0DQC+W+d6U6S0nXEcKSZpzTFZPKp
   Gt4cuB9/6NHEz7/8tg67lj7xa4jJDl5c8udXrnsA4M/VJRYX8gfIaayEl
   xrQs4ZOTL4fonyOvF84KJlB4QkHFWmrP8GVNLMEBl9Opn0UEd3+cbGxzM
   e6b8wVzqwvXFR3fQFrvfxcDNxsXIV6liUz2tjul7HUAH/lIKjbhdHT574
   A==;
X-CSE-ConnectionGUID: joIupFBbTMm3eXWGfxWiPw==
X-CSE-MsgGUID: n0PBCYxTSRO9LLRHj1kyzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="32547099"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="32547099"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 10:16:00 -0800
X-CSE-ConnectionGUID: 139y/7obQz+XA+6ij6dbwA==
X-CSE-MsgGUID: La0byijZQx23bHm09begcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92540493"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Nov 2024 10:15:58 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHS07-0000th-17;
	Sat, 30 Nov 2024 18:15:33 +0000
Date: Sun, 1 Dec 2024 02:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_cx0_phy.c:119:7-50: opportunity
 for str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK)
Message-ID: <202412010222.fknnOfYv-lkp@intel.com>
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
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: 51390cc0e00a378b7c152bb6f63efc0a01b59d20 drm/i915/mtl: Add Support for C10 PHY message bus and pll programming
date:   1 year, 8 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 8 months ago
config: i386-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241201/202412010222.fknnOfYv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412010222.fknnOfYv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_cx0_phy.c:119:7-50: opportunity for str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK)
   drivers/gpu/drm/i915/display/intel_cx0_phy.c:126:7-50: opportunity for str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK)

vim +119 drivers/gpu/drm/i915/display/intel_cx0_phy.c

51390cc0e00a378 Radhakrishna Sripada 2023-04-13  100  
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  101  static int intel_cx0_wait_for_ack(struct drm_i915_private *i915, enum port port,
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  102  				  int command, int lane, u32 *val)
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  103  {
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  104  	enum phy phy = intel_port_to_phy(i915, port);
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  105  
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  106  	if (__intel_de_wait_for_register(i915,
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  107  					 XELPDP_PORT_P2M_MSGBUS_STATUS(port, lane),
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  108  					 XELPDP_PORT_P2M_RESPONSE_READY,
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  109  					 XELPDP_PORT_P2M_RESPONSE_READY,
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  110  					 XELPDP_MSGBUS_TIMEOUT_FAST_US,
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  111  					 XELPDP_MSGBUS_TIMEOUT_SLOW, val)) {
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  112  		drm_dbg_kms(&i915->drm, "PHY %c Timeout waiting for message ACK. Status: 0x%x\n",
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  113  			    phy_name(phy), *val);
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  114  		return -ETIMEDOUT;
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  115  	}
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  116  
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  117  	if (*val & XELPDP_PORT_P2M_ERROR_SET) {
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  118  		drm_dbg_kms(&i915->drm, "PHY %c Error occurred during %s command. Status: 0x%x\n", phy_name(phy),
51390cc0e00a378 Radhakrishna Sripada 2023-04-13 @119  			    command == XELPDP_PORT_P2M_COMMAND_READ_ACK ? "read" : "write", *val);
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  120  		intel_cx0_bus_reset(i915, port, lane);
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  121  		return -EINVAL;
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  122  	}
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  123  
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  124  	if (REG_FIELD_GET(XELPDP_PORT_P2M_COMMAND_TYPE_MASK, *val) != command) {
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  125  		drm_dbg_kms(&i915->drm, "PHY %c Not a %s response. MSGBUS Status: 0x%x.\n", phy_name(phy),
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  126  			    command == XELPDP_PORT_P2M_COMMAND_READ_ACK ? "read" : "write", *val);
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  127  		intel_cx0_bus_reset(i915, port, lane);
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  128  		return -EINVAL;
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  129  	}
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  130  
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  131  	return 0;
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  132  }
51390cc0e00a378 Radhakrishna Sripada 2023-04-13  133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
