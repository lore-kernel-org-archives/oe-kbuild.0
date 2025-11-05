Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C62877E3
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762330874; cv=none; b=s7Kjs1H8oUWfGXqUe2IX5E+ODw+7OEncSg7H6BNh043nHlofDqag7L+RIdlYhAaboeVnrtSM8tfQLi2xzqj69DO5tCRv7l4XiS+CNJ/Brtw11p0kydy/wNG+ffMwdH5BK5uqXlWUrMzucTwwq+SilmC4PsGFV3jg3KgfVzy1W2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762330874; c=relaxed/simple;
	bh=P8fQ+tAerI+j1v56OMunS+qYOovCQJdWpWyJOxqQ+DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NuOf01mODyNLaJbvrh+4LZ8sKDtFMl5uHoqJoBkvzRwqwIRlDFikuaE6+UyYhZXYjfJGjyRMIUUCbbIQ/Ao1Cz1LwdcYoCQkRA++0YQLyMYv5tTWsf+VuhFHWQvL/O/8LjA0LzUglTNSGsxO5rfocVldvIFICHmYxId8sJ4MwAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2Htp6Ph; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2Htp6Ph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762330873; x=1793866873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8fQ+tAerI+j1v56OMunS+qYOovCQJdWpWyJOxqQ+DA=;
  b=l2Htp6PhTMD8sE9447TYGRNBcB0s9aEFEObt0/+zv9QQlrVnB2rtXEPe
   v4qn0yhS3advYwFVD78B5dUBj0w4IpBvdDCWLLKr4r+GdWTXeBc21q63P
   I9R4GyH9PrlqOd2KkB2t4OQ7MdlBiaKvVW6oBodN+HOkD7WhAHHfPzwIk
   EMb72qHt45T38yhVugqi/kz4wy6RrBySESlDP6+7UziBa5I/QF2u4gIW3
   TBHskZlrUTFB9D21ITsTib+WMZpgbUZetX0gNxlXbX+389anqu/24WTuU
   77vF1vk6c68IG52FDF+Fs5QQX6tCdEaOoDztUejnvjwqfr3QlshymFrI/
   Q==;
X-CSE-ConnectionGUID: Hv6prqJ5Sj6s0LRvkhhqlw==
X-CSE-MsgGUID: OcDU/EZWRQm3ftKoGUlKKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64345015"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64345015"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 00:21:13 -0800
X-CSE-ConnectionGUID: jyYwC3YcSeWwf7g3hcrmFg==
X-CSE-MsgGUID: peqyi1rQScOfi7GR6R1TPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187081355"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 00:21:11 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGYlQ-000SJE-12;
	Wed, 05 Nov 2025 08:21:08 +0000
Date: Wed, 5 Nov 2025 16:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kanjimonster:b53/wip 10/12] drivers/net/dsa/b53/b53_common.c:2590
 b53_br_set_stp_state() error: uninitialized symbol 'i'.
Message-ID: <202511051638.nrNDaBgy-lkp@intel.com>
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
TO: Jonas Gorski <jonas.gorski@gmail.com>

tree:   https://github.com/KanjiMonster/linux b53/wip
head:   f9ab05563b5d3ec24b324fcceb80727aeaddfd99
commit: 70fb214830ff40f92fbfbacf66223b3cd3e803b9 [10/12] net: dsa: b53: add MSTI support
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051638.nrNDaBgy-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511051638.nrNDaBgy-lkp@intel.com/

smatch warnings:
drivers/net/dsa/b53/b53_common.c:2590 b53_br_set_stp_state() error: uninitialized symbol 'i'.
drivers/net/dsa/b53/b53_common.c:2616 b53_br_set_stp_state() warn: inconsistent indenting

vim +/i +2590 drivers/net/dsa/b53/b53_common.c

70fb214830ff40f Jonas Gorski     2023-07-06  2574  
3117455dd6c16da Florian Fainelli 2017-01-08  2575  void b53_br_set_stp_state(struct dsa_switch *ds, int port, u8 state)
ff39c2d68679c8d Florian Fainelli 2016-06-09  2576  {
04bed1434df256b Vivien Didelot   2016-08-31  2577  	struct b53_device *dev = ds->priv;
597698f1e00d37d Vivien Didelot   2016-09-22  2578  	u8 hw_state;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2579  	u8 reg;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2580  
70fb214830ff40f Jonas Gorski     2023-07-06  2581  	if (dev->num_msts) {
70fb214830ff40f Jonas Gorski     2023-07-06  2582  		int i;
70fb214830ff40f Jonas Gorski     2023-07-06  2583  
70fb214830ff40f Jonas Gorski     2023-07-06  2584  		if (port == B53_CPU_PORT)
70fb214830ff40f Jonas Gorski     2023-07-06  2585  			return;
70fb214830ff40f Jonas Gorski     2023-07-06  2586  
70fb214830ff40f Jonas Gorski     2023-07-06  2587  		/* Update CIST entry */
70fb214830ff40f Jonas Gorski     2023-07-06  2588  		b53_set_mst_state(dev, port, 0, state);
70fb214830ff40f Jonas Gorski     2023-07-06  2589  
70fb214830ff40f Jonas Gorski     2023-07-06 @2590  		if (dsa_to_port(dev->ds, i)->bridge)
70fb214830ff40f Jonas Gorski     2023-07-06  2591  			return;
70fb214830ff40f Jonas Gorski     2023-07-06  2592  
70fb214830ff40f Jonas Gorski     2023-07-06  2593  		for (i = 1; i < dev->num_msts; i++)
70fb214830ff40f Jonas Gorski     2023-07-06  2594  			b53_set_mst_state(dev, port, i, state);
70fb214830ff40f Jonas Gorski     2023-07-06  2595  	} else {
ff39c2d68679c8d Florian Fainelli 2016-06-09  2596  		switch (state) {
ff39c2d68679c8d Florian Fainelli 2016-06-09  2597  			case BR_STATE_DISABLED:
ff39c2d68679c8d Florian Fainelli 2016-06-09  2598  				hw_state = PORT_CTRL_DIS_STATE;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2599  				break;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2600  			case BR_STATE_LISTENING:
ff39c2d68679c8d Florian Fainelli 2016-06-09  2601  				hw_state = PORT_CTRL_LISTEN_STATE;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2602  				break;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2603  			case BR_STATE_LEARNING:
ff39c2d68679c8d Florian Fainelli 2016-06-09  2604  				hw_state = PORT_CTRL_LEARN_STATE;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2605  				break;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2606  			case BR_STATE_FORWARDING:
ff39c2d68679c8d Florian Fainelli 2016-06-09  2607  				hw_state = PORT_CTRL_FWD_STATE;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2608  				break;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2609  			case BR_STATE_BLOCKING:
ff39c2d68679c8d Florian Fainelli 2016-06-09  2610  				hw_state = PORT_CTRL_BLOCK_STATE;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2611  				break;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2612  			default:
ff39c2d68679c8d Florian Fainelli 2016-06-09  2613  				dev_err(ds->dev, "invalid STP state: %d\n", state);
ff39c2d68679c8d Florian Fainelli 2016-06-09  2614  				return;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2615  
ff39c2d68679c8d Florian Fainelli 2016-06-09 @2616  			b53_read8(dev, B53_CTRL_PAGE, B53_PORT_CTRL(port), &reg);
ff39c2d68679c8d Florian Fainelli 2016-06-09  2617  			reg &= ~PORT_CTRL_STP_STATE_MASK;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2618  			reg |= hw_state;
ff39c2d68679c8d Florian Fainelli 2016-06-09  2619  			b53_write8(dev, B53_CTRL_PAGE, B53_PORT_CTRL(port), reg);
ff39c2d68679c8d Florian Fainelli 2016-06-09  2620  		}
70fb214830ff40f Jonas Gorski     2023-07-06  2621  	}
70fb214830ff40f Jonas Gorski     2023-07-06  2622  }
3117455dd6c16da Florian Fainelli 2017-01-08  2623  EXPORT_SYMBOL(b53_br_set_stp_state);
ff39c2d68679c8d Florian Fainelli 2016-06-09  2624  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
