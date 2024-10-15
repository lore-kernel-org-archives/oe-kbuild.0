Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0EA1C57B1
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994089; cv=none; b=tFFx82pMq/X5D7bA7CISpDoQmwgCalqldxIOMnwj1BBaBBi/02sOhMCg8sJqZegqQoaMkSqx5E36wVs9R8rdWLIzzor94/evcyJU6BHM/kaLpQ0X/gGocX/FXVyniLUDfwI2g2I9ZZ0rwC+UOvwsbewK/jZNDnftSbKu7iY/7xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994089; c=relaxed/simple;
	bh=VJo7ZfotPm31RLwr/nDfM87OMqyy0aQ0HD8NSWggZao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MehSkUJr2KgowhiKxwim6pcdyMBtFiCWnnHrFUMgPLvZu+EjLg4CqowkYMBMMYvZ/HxaYJC42L3g3VdT3IqAWTdugGhZ4sbfJ3jSckWQmLUHwACMVDSKwI1EhX8kPgfr4t9hTa6j+ZQlXKirAvWNoadxNSMUo3prPGVzH6GndF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJCsKvs1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJCsKvs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728994088; x=1760530088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VJo7ZfotPm31RLwr/nDfM87OMqyy0aQ0HD8NSWggZao=;
  b=VJCsKvs1RbZ6txrrLik6yKo5vnpkjN4nU/djhhQqyQUo6VeZngmNi8rd
   0zkvHEBFx1NuadPMT5q5iVya9BUIgr78aaEuVBMG5xQ26WiPBx4Jxxbph
   hWDKmSMLKkcnoOYSbnFSc32V9j4RxMTVmYKvjujejUbe8QYcwwLTtja3c
   10mXaCpLeWCu8oBFyV5Wz8xLYOXjwKH8KnlyeuwYprjCPXyPC3zLnXUVB
   eGDV/hmEezxID3FWDksVlMfeJlqQ4ya4sbsULRluWdSJEt6Izh4di5C1M
   lJJDW2WoiLCNVHXl0SQr4Fi558m9b+UMND1GPQ1R0WLlvASJlMdtD9dU/
   g==;
X-CSE-ConnectionGUID: B5B15r2VRIydvySUZIl1uw==
X-CSE-MsgGUID: 614iCAUNSieADKXm5p5vhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28172397"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28172397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 05:08:08 -0700
X-CSE-ConnectionGUID: SWM3MhjBRq2uWzIQf1FGxQ==
X-CSE-MsgGUID: aI9TNXNFRQWvo/UBPUZDhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="82663391"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2024 05:08:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0gLL-000Idf-22;
	Tue, 15 Oct 2024 12:08:03 +0000
Date: Tue, 15 Oct 2024 20:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/9] can: m_can: Map WoL to device_set_wakeup_enable
Message-ID: <202410151950.6UahbF47-lkp@intel.com>
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
In-Reply-To: <20241011-topic-mcan-wakeup-source-v6-12-v3-3-9752c714ad12@baylibre.com>
References: <20241011-topic-mcan-wakeup-source-v6-12-v3-3-9752c714ad12@baylibre.com>
TO: "Markus Schneider-Pargmann" <msp@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/dt-bindings-can-m_can-Add-wakeup-properties/20241011-212232
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241011-topic-mcan-wakeup-source-v6-12-v3-3-9752c714ad12%40baylibre.com
patch subject: [PATCH v3 3/9] can: m_can: Map WoL to device_set_wakeup_enable
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151950.6UahbF47-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410151950.6UahbF47-lkp@intel.com/

smatch warnings:
drivers/net/can/m_can/m_can.c:2199 m_can_set_wol() warn: add some parenthesis here?

vim +2199 drivers/net/can/m_can/m_can.c

0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2195  
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2196  static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2197  {
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2198  	struct m_can_classdev *cdev = netdev_priv(dev);
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11 @2199  	bool wol_enable = !!wol->wolopts & WAKE_PHY;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2200  	int ret;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2201  
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2202  	if ((wol->wolopts & WAKE_PHY) != wol->wolopts)
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2203  		return -EINVAL;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2204  
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2205  	if (wol_enable == device_may_wakeup(cdev->dev))
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2206  		return 0;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2207  
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2208  	ret = device_set_wakeup_enable(cdev->dev, wol_enable);
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2209  	if (ret) {
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2210  		netdev_err(cdev->net, "Failed to set wakeup enable %pE\n",
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2211  			   ERR_PTR(ret));
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2212  		return ret;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2213  	}
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2214  
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2215  	return 0;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2216  }
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
