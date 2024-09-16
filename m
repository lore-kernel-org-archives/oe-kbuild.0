Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A81494A5
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726501276; cv=none; b=jXqMCYkM3lpOualjt8P5OeTxhKxWO/Sks1r5SEE2z+U0VZxp4QW7MCDuiNPOwburTIteulZW+HaRF7AZVu/tVH9LkENZMn+T6nMyJh1Gn/T/SVpdV8rK+QUn9mq5hPhYKDJ7rupgrkpOgKTZYr3wcldT2cdZvtBXB7PvZGdOuSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726501276; c=relaxed/simple;
	bh=VzkkW7ZDLrGDsV8ypnojljV/+r4fc0ReH1VrfxqgyQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+Su78QyVBtz84QJ82eHGSKS+2xOjLHVvg5kywuSD8rf8Tkuz8ubD3BTfVW4YOWyI131Bi++soEF9iqBDn85mABF2YAfW2fQFMadG2cBh7glhgr+MZUrDhy0J/8lZU5ZDHva9ZDT8tFuQf5U9UQQWao6zQLpF/8C3gWfWA/DEnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Put0qQNl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Put0qQNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726501275; x=1758037275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzkkW7ZDLrGDsV8ypnojljV/+r4fc0ReH1VrfxqgyQ0=;
  b=Put0qQNlmd/wJwlAaumn8Cycoj6OVtM2MliPlxLNaISPCVIBv9G8VHzk
   sCwJJhLO5gq1IqmJMIFZQIc/gQ4qDVsklOG46QJwg+TrDLy1HP00QtCQh
   ErI9RRYTZT32ZBwpHVwjZkvj1uLPpc8oMRh7v3b4ZAMRNVu/CEYlzfhaN
   3iOwCx1mXExM8guX20v7OOvLZr+e7WVDDlvjksbzNJiIOvou86MBg4LYS
   QOTwLirtGTRscL9I9BNvhSIEyHUo85scQGaQ3HyzhC0ITVXtEIcjxqBWk
   Bv+TiuZys9BT2rKNroJT/jXt8rQeLuZ9Qqmf7NxG4fHPwIsf1ZzN41e+N
   Q==;
X-CSE-ConnectionGUID: r8+L4fDtQmSm94I5j8JgFQ==
X-CSE-MsgGUID: m5woM1tpQjCLFzZ/BPSaag==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29079295"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="29079295"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 08:41:14 -0700
X-CSE-ConnectionGUID: /80qGhrIQeKOmXNgkWA67g==
X-CSE-MsgGUID: Rz7Yh+bMQ4+fcpcpCio7Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73905799"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Sep 2024 08:41:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqDqg-000AEA-2f;
	Mon, 16 Sep 2024 15:41:10 +0000
Date: Mon, 16 Sep 2024 23:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses()
 error: uninitialized symbol 'ret'.
Message-ID: <202409162313.TnpH4qKB-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@linaro.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   adfc3ded5c33d67e822525f95404ef0becb099b8
commit: 9799873717398e8fa1727482e578b9d777da645e spmi: pmic-arb: Add multi bus support
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-r072-20240916 (https://download.01.org/0day-ci/archive/20240916/202409162313.TnpH4qKB-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409162313.TnpH4qKB-lkp@intel.com/

smatch warnings:
drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses() error: uninitialized symbol 'ret'.

vim +/ret +1782 drivers/spmi/spmi-pmic-arb.c

02922ccbb330128 Abel Vesa 2024-05-07  1761  
9799873717398e8 Abel Vesa 2024-05-07  1762  static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
9799873717398e8 Abel Vesa 2024-05-07  1763  					struct platform_device *pdev)
9799873717398e8 Abel Vesa 2024-05-07  1764  {
9799873717398e8 Abel Vesa 2024-05-07  1765  	struct device *dev = &pdev->dev;
9799873717398e8 Abel Vesa 2024-05-07  1766  	struct device_node *node = dev->of_node;
9799873717398e8 Abel Vesa 2024-05-07  1767  	struct device_node *child;
9799873717398e8 Abel Vesa 2024-05-07  1768  	int ret;
9799873717398e8 Abel Vesa 2024-05-07  1769  
9799873717398e8 Abel Vesa 2024-05-07  1770  	/* legacy mode doesn't provide child node for the bus */
9799873717398e8 Abel Vesa 2024-05-07  1771  	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
9799873717398e8 Abel Vesa 2024-05-07  1772  		return spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
9799873717398e8 Abel Vesa 2024-05-07  1773  
9799873717398e8 Abel Vesa 2024-05-07  1774  	for_each_available_child_of_node(node, child) {
9799873717398e8 Abel Vesa 2024-05-07  1775  		if (of_node_name_eq(child, "spmi")) {
9799873717398e8 Abel Vesa 2024-05-07  1776  			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
9799873717398e8 Abel Vesa 2024-05-07  1777  			if (ret)
9799873717398e8 Abel Vesa 2024-05-07  1778  				return ret;
9799873717398e8 Abel Vesa 2024-05-07  1779  		}
9799873717398e8 Abel Vesa 2024-05-07  1780  	}
9799873717398e8 Abel Vesa 2024-05-07  1781  
9799873717398e8 Abel Vesa 2024-05-07 @1782  	return ret;
9799873717398e8 Abel Vesa 2024-05-07  1783  }
9799873717398e8 Abel Vesa 2024-05-07  1784  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
