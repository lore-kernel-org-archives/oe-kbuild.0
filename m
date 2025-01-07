Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A647E18641
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736232974; cv=none; b=MAcIAl7vCf2ruk80Yi70Le+lZToWYVAqNEexA77fii4YAz6Ah6CgZeuqV7Jetm8sSkrSk55LahryEHliOGUPwk9sX2beJnQZ/4eNj4pY8rvoiuVCrKqrpNMwdwU1dykfIUGTTyTVnahNH8Drc056CpCbGbAfNCmgMXD0YwGIQz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736232974; c=relaxed/simple;
	bh=jtOpsQaPDxyVy5B4YsaZnwraowHtUA0I4PCKSoCTZBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sXo09vlBNF1Sc4fBznbEF0vjPUK2w2JODdWRq/RJQ8+Yivp7emyCskwCum0kBct98SLFUKupZS/WI8v8GkB+mIfsoZx8Z/Oy0qXjRMJYOvKiM/o17vvIv0CnGgBVMpoRZgHW2qitzgn/lGMvE4fogklY0ChWiZ/o0giHhV10j4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KoAbgfnf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoAbgfnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736232971; x=1767768971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jtOpsQaPDxyVy5B4YsaZnwraowHtUA0I4PCKSoCTZBE=;
  b=KoAbgfnfjPKsH3Bu+kQbnUi58T311QVeo6tP/1RA/GpSbPtKHKyLY7l4
   139GgS350k8RsEUBNuKw8DxZK8PW0gy7s364NYDaj+HyVPvJb5AFZLiu+
   GioHpyXUYuQq+oRGjoQJYuH+DiNeUEeH8jvRWubdQ/mj51TqwLqbPtJRE
   BZTmQXDAKYtqbVc8IU2BjjHwxk+F3ppkwNY1eZG33UKM3E97va5vAU3yY
   WvjRG6/9FNz7e98M9EfndodZgWHMhBV4Kgrb6nuXiMHHwFXalrxBMsZSf
   OiGKEQymhphoxuCIxlQsM01LhTApiYrG0DMAZQshCiW5rUJ38k0NYCt8E
   w==;
X-CSE-ConnectionGUID: 4bD+kiWMTFy/ZpOeKuEaiw==
X-CSE-MsgGUID: dzo7MQtKQaqac4CM+lS/cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46896532"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="46896532"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 22:56:11 -0800
X-CSE-ConnectionGUID: 8mDosib4RgqQkd0rCaxw1A==
X-CSE-MsgGUID: 3NmtulGQTqORxeGJk1KdMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125970958"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2025 22:56:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV3VX-000EL1-2n;
	Tue, 07 Jan 2025 06:56:07 +0000
Date: Tue, 7 Jan 2025 14:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: microchip_rds_ptp : Add PEROUT
 feature library for RDS PTP supported phys
Message-ID: <202501071428.F9gIQY3T-lkp@intel.com>
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
In-Reply-To: <20250103090731.1355-4-divya.koppera@microchip.com>
References: <20250103090731.1355-4-divya.koppera@microchip.com>
TO: Divya Koppera <divya.koppera@microchip.com>
TO: andrew@lunn.ch
TO: arun.ramadoss@microchip.com
TO: UNGLinuxDriver@microchip.com
TO: hkallweit1@gmail.com
TO: linux@armlinux.org.uk
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: richardcochran@gmail.com
TO: vadim.fedorenko@linux.dev

Hi Divya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Divya-Koppera/net-phy-microchip_rds_ptp-Header-file-library-changes-for-PEROUT/20250103-171126
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250103090731.1355-4-divya.koppera%40microchip.com
patch subject: [PATCH net-next 3/3] net: phy: microchip_rds_ptp : Add PEROUT feature library for RDS PTP supported phys
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r072-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071428.F9gIQY3T-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501071428.F9gIQY3T-lkp@intel.com/

smatch warnings:
drivers/net/phy/microchip_rds_ptp.c:247 mchp_rds_ptp_perout_off() error: uninitialized symbol 'event'.

vim +/event +247 drivers/net/phy/microchip_rds_ptp.c

568c86a861124f Divya Koppera 2025-01-03  227  
568c86a861124f Divya Koppera 2025-01-03  228  static int mchp_rds_ptp_perout_off(struct mchp_rds_ptp_clock *clock,
568c86a861124f Divya Koppera 2025-01-03  229  				   s8 gpio_pin)
568c86a861124f Divya Koppera 2025-01-03  230  {
568c86a861124f Divya Koppera 2025-01-03  231  	u16 general_config;
568c86a861124f Divya Koppera 2025-01-03  232  	int event;
568c86a861124f Divya Koppera 2025-01-03  233  	int rc;
568c86a861124f Divya Koppera 2025-01-03  234  
568c86a861124f Divya Koppera 2025-01-03  235  	if (clock->mchp_rds_ptp_event_a == gpio_pin)
568c86a861124f Divya Koppera 2025-01-03  236  		event = MCHP_RDS_PTP_EVT_A;
568c86a861124f Divya Koppera 2025-01-03  237  	else if (clock->mchp_rds_ptp_event_b == gpio_pin)
568c86a861124f Divya Koppera 2025-01-03  238  		event = MCHP_RDS_PTP_EVT_B;
568c86a861124f Divya Koppera 2025-01-03  239  
568c86a861124f Divya Koppera 2025-01-03  240  	/* Set target to too far in the future, effectively disabling it */
568c86a861124f Divya Koppera 2025-01-03  241  	rc = mchp_set_clock_target(clock, gpio_pin, 0xFFFFFFFF, 0);
568c86a861124f Divya Koppera 2025-01-03  242  	if (rc < 0)
568c86a861124f Divya Koppera 2025-01-03  243  		return rc;
568c86a861124f Divya Koppera 2025-01-03  244  
568c86a861124f Divya Koppera 2025-01-03  245  	general_config = mchp_rds_phy_read_mmd(clock, MCHP_RDS_PTP_GEN_CFG,
568c86a861124f Divya Koppera 2025-01-03  246  					       MCHP_RDS_PTP_CLOCK);
568c86a861124f Divya Koppera 2025-01-03 @247  	general_config |= MCHP_RDS_PTP_GEN_CFG_RELOAD_ADD_X_(event);
568c86a861124f Divya Koppera 2025-01-03  248  	rc = mchp_rds_phy_write_mmd(clock, MCHP_RDS_PTP_GEN_CFG,
568c86a861124f Divya Koppera 2025-01-03  249  				    MCHP_RDS_PTP_CLOCK, general_config);
568c86a861124f Divya Koppera 2025-01-03  250  	if (rc < 0)
568c86a861124f Divya Koppera 2025-01-03  251  		return rc;
568c86a861124f Divya Koppera 2025-01-03  252  
568c86a861124f Divya Koppera 2025-01-03  253  	if (event == MCHP_RDS_PTP_EVT_A)
568c86a861124f Divya Koppera 2025-01-03  254  		clock->mchp_rds_ptp_event_a = -1;
568c86a861124f Divya Koppera 2025-01-03  255  
568c86a861124f Divya Koppera 2025-01-03  256  	if (event == MCHP_RDS_PTP_EVT_B)
568c86a861124f Divya Koppera 2025-01-03  257  		clock->mchp_rds_ptp_event_b = -1;
568c86a861124f Divya Koppera 2025-01-03  258  
568c86a861124f Divya Koppera 2025-01-03  259  	return 0;
568c86a861124f Divya Koppera 2025-01-03  260  }
568c86a861124f Divya Koppera 2025-01-03  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
