Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C93A48CD47
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Sep 2026 12:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353780; cv=none; b=XqHH5eeXmLqr3gqSyg7n9j+uQUWYiLOojwb27JGmi0yFRBrEmCSlVokU+anl+a1UE+3PZWIe67fyB6Whtx2CaEXX3HtT3GtyWyb7DWKRMgdYDIDeMf++tpq0q1dfqSdK3eh3IJYp8ZiwEbLgVL5BP83YFhKbyYZDtmOFeyNO9+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353780; c=relaxed/simple;
	bh=mqlkXlyoUuvgtYaTQXcV1TX69Ve1UAwe/67A/K9lcOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hbLHgyct/HagRrRO5kGxuZDIMcJRu15k8498zB3Gn0vTCNR7mNkpevoNy0A7pIar35aGvsiGY6DhPAiFDpqw3S2N5mS1F3cJnbBMqlm0345/BhcVz/vCekF56SPCTi38rKzNY9f2ecz1hMLMYGLTeVq6MCjdyb/W7uNh7m1b/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1oxEd1L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1oxEd1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788353777; x=1819889777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mqlkXlyoUuvgtYaTQXcV1TX69Ve1UAwe/67A/K9lcOQ=;
  b=P1oxEd1LCR11PKbQRChJ1bMqeXlLxODGLt1xFFR0qHe+5vWNpOJSPSVa
   Z51Ai95e5SzG+LsDcU7CYOjRMV4AlIH7d0F68VZnk7vzpjUyJ8w3mIQwo
   85SpI2jwUII5jahWErimpYacgASHKy5hjGBTS7Ug7Ki0HMN3jYHe7hs0V
   IhJ1RdxYZJO+6qabR/u9IbqGfmZ1QCG8knFoBCoJ4tNET05+41QxNtcN7
   NljE/EDRt0P23NEYXXBclg+DqtXJxIe75BPhFTiGbdg3wN18NvjrMgetA
   X3jpXRelEOhHJ0HCOMgWQKJUjCE5fS+/RVl2wpUzd8oZN0zygKiBrf2Av
   g==;
X-CSE-ConnectionGUID: xMwaeOOYRFeOuExxhIp0TQ==
X-CSE-MsgGUID: vjel9bebRLukdiATjZAX9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106177727"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="106177727"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:56:17 -0700
X-CSE-ConnectionGUID: wJS01scCSS2TABS1VAVEtA==
X-CSE-MsgGUID: tsX6gNGyRMeuK5eeJ5UanQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="299278561"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Sep 2026 05:56:15 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1kVh-000000002iA-1SND;
	Wed, 02 Sep 2026 12:56:13 +0000
Date: Wed, 2 Sep 2026 20:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v14] net: phy: Add driver for Motorcomm Quad
 2.5GbE phy
Message-ID: <202609022033.agNeEqvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260824025625.2688693-1-kyle.switch@motor-comm.com>
References: <20260824025625.2688693-1-kyle.switch@motor-comm.com>
TO: Kyle Switch <kyle.switch@motor-comm.com>
TO: Frank.Sae@motor-comm.com
TO: andrew@lunn.ch
TO: hkallweit1@gmail.com
TO: linux@armlinux.org.uk
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: ming.xu@motor-comm.com
CC: xiaolin.xu@motor-comm.com
CC: jianmin.wang@motor-comm.com
CC: jie.han@motor-comm.com

Hi Kyle,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Switch/net-phy-Add-driver-for-Motorcomm-Quad-2-5GbE-phy/20260824-105625
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260824025625.2688693-1-kyle.switch%40motor-comm.com
patch subject: [PATCH net-next v14] net: phy: Add driver for Motorcomm Quad 2.5GbE phy
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-075-20250806 (https://download.01.org/0day-ci/archive/20260902/202609022033.agNeEqvg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609022033.agNeEqvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609022033.agNeEqvg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ytphy_read_top_ext':
>> drivers/net/phy/motorcomm.c:481:(.text+0x2a8e6e5): undefined reference to `__phy_package_write'
>> ld: drivers/net/phy/motorcomm.c:485:(.text+0x2a8e708): undefined reference to `__phy_package_read'
   ld: vmlinux.o: in function `yt8824_probe':
>> drivers/net/phy/motorcomm.c:4569:(.text+0x2a8fc60): undefined reference to `devm_of_phy_package_join'
>> ld: drivers/net/phy/motorcomm.c:4573:(.text+0x2a8fca2): undefined reference to `phy_package_probe_once'
   ld: vmlinux.o: in function `yt8824_phy_package_probe_once':
>> drivers/net/phy/motorcomm.c:4530:(.text+0x2a8fcc0): undefined reference to `phy_package_get_priv'
>> ld: drivers/net/phy/motorcomm.c:4531:(.text+0x2a8fccb): undefined reference to `phy_package_get_node'
   ld: vmlinux.o: in function `ytphy_write_top_ext':
   drivers/net/phy/motorcomm.c:502:(.text+0x2a903a5): undefined reference to `__phy_package_write'
>> ld: drivers/net/phy/motorcomm.c:506:(.text+0x2a903cc): undefined reference to `__phy_package_write'
   ld: vmlinux.o: in function `yt8824_config_aneg':
   drivers/net/phy/motorcomm.c:4495:(.text+0x2a90794): undefined reference to `phy_package_get_priv'
   ld: vmlinux.o: in function `yt8824_aneg_done':
   drivers/net/phy/motorcomm.c:4205:(.text+0x2a90898): undefined reference to `phy_package_get_priv'
   ld: vmlinux.o: in function `yt8824_get_features':
   drivers/net/phy/motorcomm.c:4183:(.text+0x2a91254): undefined reference to `phy_package_get_priv'
   ld: vmlinux.o: in function `yt8824_read_status':
   drivers/net/phy/motorcomm.c:4289:(.text+0x2a912dc): undefined reference to `phy_package_get_priv'
   ld: vmlinux.o: in function `yt8824_soft_reset':
   drivers/net/phy/motorcomm.c:915:(.text+0x2a92a16): undefined reference to `phy_package_get_priv'
   ld: vmlinux.o:drivers/net/phy/motorcomm.c:4400: more undefined references to `phy_package_get_priv' follow


vim +481 drivers/net/phy/motorcomm.c

70479a40954cf3 Frank       2022-10-28  468  
7d5c6b4a2f233a Kyle Switch 2026-08-24  469  /**
7d5c6b4a2f233a Kyle Switch 2026-08-24  470   * ytphy_read_top_ext() - read a PHY's top extended register for YT8824
7d5c6b4a2f233a Kyle Switch 2026-08-24  471   * @phydev: a pointer to a &struct phy_device
7d5c6b4a2f233a Kyle Switch 2026-08-24  472   * @regnum: register number to read
7d5c6b4a2f233a Kyle Switch 2026-08-24  473   *
7d5c6b4a2f233a Kyle Switch 2026-08-24  474   * Returns: the value of regnum reg or negative error code
7d5c6b4a2f233a Kyle Switch 2026-08-24  475   */
7d5c6b4a2f233a Kyle Switch 2026-08-24  476  static int ytphy_read_top_ext(struct phy_device *phydev, u16 regnum)
7d5c6b4a2f233a Kyle Switch 2026-08-24  477  {
7d5c6b4a2f233a Kyle Switch 2026-08-24  478  	int ret;
7d5c6b4a2f233a Kyle Switch 2026-08-24  479  
7d5c6b4a2f233a Kyle Switch 2026-08-24  480  	lockdep_assert_held(&phydev->mdio.bus->mdio_lock);
7d5c6b4a2f233a Kyle Switch 2026-08-24 @481  	ret = __phy_package_write(phydev, 0, YTPHY_PAGE_SELECT, regnum);
7d5c6b4a2f233a Kyle Switch 2026-08-24  482  	if (ret < 0)
7d5c6b4a2f233a Kyle Switch 2026-08-24  483  		return ret;
7d5c6b4a2f233a Kyle Switch 2026-08-24  484  
7d5c6b4a2f233a Kyle Switch 2026-08-24 @485  	return __phy_package_read(phydev, 0, YTPHY_PAGE_DATA);
7d5c6b4a2f233a Kyle Switch 2026-08-24  486  }
7d5c6b4a2f233a Kyle Switch 2026-08-24  487  
7d5c6b4a2f233a Kyle Switch 2026-08-24  488  /**
7d5c6b4a2f233a Kyle Switch 2026-08-24  489   * ytphy_write_top_ext() - write a PHY's top extended register for YT8824
7d5c6b4a2f233a Kyle Switch 2026-08-24  490   * @phydev: a pointer to a &struct phy_device
7d5c6b4a2f233a Kyle Switch 2026-08-24  491   * @regnum: register number to write
7d5c6b4a2f233a Kyle Switch 2026-08-24  492   * @val: register val to write
7d5c6b4a2f233a Kyle Switch 2026-08-24  493   *
7d5c6b4a2f233a Kyle Switch 2026-08-24  494   * Returns: 0 or negative error code
7d5c6b4a2f233a Kyle Switch 2026-08-24  495   */
7d5c6b4a2f233a Kyle Switch 2026-08-24  496  static int ytphy_write_top_ext(struct phy_device *phydev, u16 regnum,
7d5c6b4a2f233a Kyle Switch 2026-08-24  497  			       u16 val)
7d5c6b4a2f233a Kyle Switch 2026-08-24  498  {
7d5c6b4a2f233a Kyle Switch 2026-08-24  499  	int ret;
7d5c6b4a2f233a Kyle Switch 2026-08-24  500  
7d5c6b4a2f233a Kyle Switch 2026-08-24  501  	lockdep_assert_held(&phydev->mdio.bus->mdio_lock);
7d5c6b4a2f233a Kyle Switch 2026-08-24  502  	ret = __phy_package_write(phydev, 0, YTPHY_PAGE_SELECT, regnum);
7d5c6b4a2f233a Kyle Switch 2026-08-24  503  	if (ret < 0)
7d5c6b4a2f233a Kyle Switch 2026-08-24  504  		return ret;
7d5c6b4a2f233a Kyle Switch 2026-08-24  505  
7d5c6b4a2f233a Kyle Switch 2026-08-24 @506  	return __phy_package_write(phydev, 0, YTPHY_PAGE_DATA, val);
7d5c6b4a2f233a Kyle Switch 2026-08-24  507  }
7d5c6b4a2f233a Kyle Switch 2026-08-24  508  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
