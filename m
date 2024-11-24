Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B572500C2
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Nov 2024 22:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732485983; cv=none; b=u7fGjKYtcxAsNZ0qRVSEfKt2OzpZtFkjb32h+3wfJB9AKGbZtcUNY2CbDk+7gb2raC7sTS2oiDefuGUFDCLR611j9QoGGtekw/HHOaiVfUoVCaqhqJ2liQ3KVxFgj0mzwHX1z4oQEams/zzmTMfXQEh4NLk6s+kOTtooTbXHfNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732485983; c=relaxed/simple;
	bh=nl7AO5BV4XATLt+wiaAA3wqduI740/euIIgS0tQBfkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OL4YacmnM16oa1XyTpB7e1TPOxsDOXWvt4g7Bek3Kn6GGvuVQwrqoboJQOtAd65FbdvW70wjBe0nD3k417hf+3znJ1FnA1JZCv4R+qrqzKkCFXN++d9zBZ5UBUZ4sts/rRxm1CMomliY2qTyVjxWQXnsvfTHopGWsCBWuPZH4SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfTkDTCj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfTkDTCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732485980; x=1764021980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nl7AO5BV4XATLt+wiaAA3wqduI740/euIIgS0tQBfkQ=;
  b=RfTkDTCjFQsgEnt2mwFM5+E79SbtcgXGUoHY8Kf49vpaeZTuvhqF2OEz
   1n3YZxDmXwTSc8vHiDBbVso0lb/gqsyWGmA+poh4GYWyuf1m6qDW9SMtP
   Mj/nKiW5zADHp6sc+bH94yTJ2f/CXddTaImmwlFEsy7K5RBPOZoXWoGyD
   CyGPq9T4mTH3fsBZa1XUBBZRPhLnMg7hu3P5bL32psRU9cztl5F+foRSH
   jCRr6mMj4/h7IdLJBN1ZmbXTAoFhfrppS9TUvIK7wr0LlZ15J/5sKM5Fj
   z2YkrUQxQ2/VlqRBD8GHteoX1EU9b6nDU4OZZ5f+NBnSPLdav7IelUglV
   w==;
X-CSE-ConnectionGUID: vo8aPLDWRvmT9KDb3WOFEA==
X-CSE-MsgGUID: +EKzDal9SAirBB1yn/OptQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43638849"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="43638849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 14:06:20 -0800
X-CSE-ConnectionGUID: 0t0FoiRIS6evDf9dVbJTiw==
X-CSE-MsgGUID: FA3LQFjaSoWW2BMTt6QIZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="90889834"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2024 14:06:19 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFKkC-0005Fh-30;
	Sun, 24 Nov 2024 22:06:16 +0000
Date: Mon, 25 Nov 2024 06:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broadcom-stblinux:devicetree-arm64/next 1/8]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:67.21-84.4: Warning
 (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges
 property
Message-ID: <202411250523.IAB46CbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://github.com/Broadcom/stblinux devicetree-arm64/next
head:   7f2f7b2248110a77a330a6ac9cbc527794b45f30
commit: e1417095a1395cd21e067c105f709773141c83d1 [1/8] arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
:::::: branch date: 4 hours ago
:::::: commit date: 5 hours ago
config: arm64-randconfig-001-20241125 (https://download.01.org/0day-ci/archive/20241125/202411250523.IAB46CbS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250523.IAB46CbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411250523.IAB46CbS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:67.21-84.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:86.15-90.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property

vim +67 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts

e1417095a1395c Dave Stevenson 2024-10-25  65  
e1417095a1395c Dave Stevenson 2024-10-25  66  &soc {
e1417095a1395c Dave Stevenson 2024-10-25 @67  	firmware: firmware {
e1417095a1395c Dave Stevenson 2024-10-25  68  		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
e1417095a1395c Dave Stevenson 2024-10-25  69  		#address-cells = <1>;
e1417095a1395c Dave Stevenson 2024-10-25  70  		#size-cells = <1>;
e1417095a1395c Dave Stevenson 2024-10-25  71  
e1417095a1395c Dave Stevenson 2024-10-25  72  		mboxes = <&mailbox>;
e1417095a1395c Dave Stevenson 2024-10-25  73  		dma-ranges;
e1417095a1395c Dave Stevenson 2024-10-25  74  
e1417095a1395c Dave Stevenson 2024-10-25  75  		firmware_clocks: clocks {
e1417095a1395c Dave Stevenson 2024-10-25  76  			compatible = "raspberrypi,firmware-clocks";
e1417095a1395c Dave Stevenson 2024-10-25  77  			#clock-cells = <1>;
e1417095a1395c Dave Stevenson 2024-10-25  78  		};
e1417095a1395c Dave Stevenson 2024-10-25  79  
e1417095a1395c Dave Stevenson 2024-10-25  80  		reset: reset {
e1417095a1395c Dave Stevenson 2024-10-25  81  			compatible = "raspberrypi,firmware-reset";
e1417095a1395c Dave Stevenson 2024-10-25  82  			#reset-cells = <1>;
e1417095a1395c Dave Stevenson 2024-10-25  83  		};
e1417095a1395c Dave Stevenson 2024-10-25  84  	};
e1417095a1395c Dave Stevenson 2024-10-25  85  
e1417095a1395c Dave Stevenson 2024-10-25 @86  	power: power {
e1417095a1395c Dave Stevenson 2024-10-25  87  		compatible = "raspberrypi,bcm2835-power";
e1417095a1395c Dave Stevenson 2024-10-25  88  		firmware = <&firmware>;
e1417095a1395c Dave Stevenson 2024-10-25  89  		#power-domain-cells = <1>;
e1417095a1395c Dave Stevenson 2024-10-25  90  	};
e1417095a1395c Dave Stevenson 2024-10-25  91  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
