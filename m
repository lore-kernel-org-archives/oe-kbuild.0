Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B79625
	for <oe-kbuild@lists.linux.dev>; Sat,  4 May 2024 02:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714790055; cv=none; b=ipDvx24JuDbaYOTBTFfG3Peaa9+nENdNyIlCLCmAdEHWMxYO4CsppobOUdf/hLaBLIVYaw1esfTEnrhFYUXuehFACAQOvH91burS66qcfTLhdWGnhouWpFlmb01FbilhRxZb9UyO7wrQYBOBbLv1gS0+giW5LuHBT5BUIIiutBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714790055; c=relaxed/simple;
	bh=CRMSJbuAE4Ug6ZrDGgQi0SyTUgvpsfKb0ueSJB6cDdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pSpCTYv3fYUyaJPNbCp+Wgmp3+y8j7La0Fmfq3P9XfFUE7XU0BYloIcNxst1SAfbT2GdQzwFgw13c2HSbtlQxFSokWyj1aRZ3zyGK5gGibVKWSxExcfyoX6Dd2Q/kEp6GsWKlY0N5QeIbxiiiCW9Cjwy6DvG27HhtRyBluAkOJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/WVvHbD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/WVvHbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714790053; x=1746326053;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CRMSJbuAE4Ug6ZrDGgQi0SyTUgvpsfKb0ueSJB6cDdA=;
  b=n/WVvHbDLRaZWCe6dG4MBSysXoT3U+MFi5iXCS+tusZJhcIawKwA8sqH
   H6JlAhQxfJ37xwJsXS1Vi6xphG+wnb6LOEqbojijCZWyb5u05KS2nsMan
   GTc13sSaB0N1dGeIiSrRiWMIH6LhuMhSiZ0t6JydmKF1aRS9UdugUJT4c
   XpFmHG8tikSaV8jXYr6+SORqgBNGi+SpflKNVFLKFv8t5CBl0b4NJky7s
   ED67j2yojTK9U4jqWJg/aXlYjZOGlfQmIHBo3o6VI59TSLeElKORt/XQr
   smmcHnZUjlulcqJg5JmCofLAq3/7nd9PH6MyZmuQlCiWErj2oXQ5fJJHf
   Q==;
X-CSE-ConnectionGUID: nK6DB3ZXQUmGTWBB2ZxB5A==
X-CSE-MsgGUID: OV7dt9d5SqKOnKLAfmv9og==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21225081"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="21225081"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 19:34:13 -0700
X-CSE-ConnectionGUID: ubS6UKOLRX2/zl/v0xdBtQ==
X-CSE-MsgGUID: HELgqdtUSIKhRq4Fzq7Zig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="28122097"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 May 2024 19:34:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s35E0-000CM0-21;
	Sat, 04 May 2024 02:34:08 +0000
Date: Sat, 4 May 2024 10:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] net: phy: bcm-phy-lib: Implement BroadR-Reach
 link modes
Message-ID: <202405041037.sjZak003-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240503083719.899312-4-kamilh@axis.com>
References: <20240503083719.899312-4-kamilh@axis.com>
TO: "Kamil Horák - 2N" <kamilh@axis.com>
TO: florian.fainelli@broadcom.com
TO: bcm-kernel-feedback-list@broadcom.com
TO: andrew@lunn.ch
TO: hkallweit1@gmail.com
CC: kamilh@axis.com
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Kamil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.9-rc6 next-20240503]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamil-Hor-k-2N/net-phy-bcm54811-New-link-mode-for-BroadR-Reach/20240503-164308
base:   net/main
patch link:    https://lore.kernel.org/r/20240503083719.899312-4-kamilh%40axis.com
patch subject: [PATCH v2 3/3] net: phy: bcm-phy-lib: Implement BroadR-Reach link modes
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-141-20240504 (https://download.01.org/0day-ci/archive/20240504/202405041037.sjZak003-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405041037.sjZak003-lkp@intel.com/

smatch warnings:
drivers/net/phy/broadcom.c:627 bcm5481x_config_delay_swap() error: uninitialized symbol 'ret'.
drivers/net/phy/broadcom.c:1249 bcm_read_master_slave() error: uninitialized symbol 'cfg'.

vim +/ret +627 drivers/net/phy/broadcom.c

b0ed0bbfb3046e Kevin Lo         2020-05-16  610  
f1e9c8e593d6ea Kamil Horák - 2N 2024-05-03  611  static int bcm5481x_config_delay_swap(struct phy_device *phydev)
57bb7e222804c6 Anton Vorontsov  2008-03-04  612  {
b14995ac2527b4 Jon Mason        2016-11-04  613  	struct device_node *np = phydev->mdio.dev.of_node;
57bb7e222804c6 Anton Vorontsov  2008-03-04  614  	int ret;
57bb7e222804c6 Anton Vorontsov  2008-03-04  615  
f1e9c8e593d6ea Kamil Horák - 2N 2024-05-03  616  	/* Set up the delay. */
042cb56478152b Tao Ren          2018-11-05  617  	bcm54xx_config_clock_delay(phydev);
57bb7e222804c6 Anton Vorontsov  2008-03-04  618  
b14995ac2527b4 Jon Mason        2016-11-04  619  	if (of_property_read_bool(np, "enet-phy-lane-swap")) {
b14995ac2527b4 Jon Mason        2016-11-04  620  		/* Lane Swap - Undocumented register...magic! */
b14995ac2527b4 Jon Mason        2016-11-04  621  		ret = bcm_phy_write_exp(phydev, MII_BCM54XX_EXP_SEL_ER + 0x9,
b14995ac2527b4 Jon Mason        2016-11-04  622  					0x11B);
b14995ac2527b4 Jon Mason        2016-11-04  623  		if (ret < 0)
b14995ac2527b4 Jon Mason        2016-11-04  624  			return ret;
b14995ac2527b4 Jon Mason        2016-11-04  625  	}
b14995ac2527b4 Jon Mason        2016-11-04  626  
57bb7e222804c6 Anton Vorontsov  2008-03-04 @627  	return ret;
57bb7e222804c6 Anton Vorontsov  2008-03-04  628  }
57bb7e222804c6 Anton Vorontsov  2008-03-04  629  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
