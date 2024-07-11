Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E4B1366
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 04:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720670948; cv=none; b=NC2+d2rEWvnLq6VwsRIDPeEi6YUj+qEPWUU2rQZn1CdwojkrR7AvYg7xXIs3YkGKumrUwb/gwv+jdX30rrS0e99+VcigP8xg7xt/EKUrFvs+kqtEBuhPOcIPIvIq/64v1R9KtshSaYl74YO7IM0SYamAT7ac9L5lFIHk9gxHVDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720670948; c=relaxed/simple;
	bh=X1XPw0Zu+AXeu9Pzyy6L+YlrVeSSOrEfz5C/nzng0B0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDLX5zNm99AwXSxQDAVJvQ3g99XDFJlPOcIPTqG+QsVevNxMc34EpA2u04n4F4D2VOusS35NjPEjfCoAIS0uTkInMVsoFsXLB7MydWILZYlNdgXQU4H+iVdspCyaevKpTM4vlwBEeIYn9y0d2Nh/juNw3Qw1S6L2iVUAWenoclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSj0f/UA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSj0f/UA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720670945; x=1752206945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X1XPw0Zu+AXeu9Pzyy6L+YlrVeSSOrEfz5C/nzng0B0=;
  b=CSj0f/UAMJx8K28rnP2gpSZKTeNX1pK4JTpQA+zh6WLQJyukIpJyKkF7
   wyHISU3LZaZc835+ZJCVdpnlTWaXrJDJZGJOj07V3720WkNaod9yVyOBR
   zsZ81SBKT0VzQL5oZEB3XiYD1mnNeBeEgsybPaD+FpHGIs22x7tzAp6Gs
   4TVVcSZgQk5C5fL8kpVcDSR7Ewe+FS1bj8R4drXuqA43RsgKRrGxYz9rY
   loZiP50qzjsZ2JyjkIHiKJw39+rbMW1Gj2acGpH5f9GrDhNwE9z5gHq9/
   IOMH5hWhkZnIINhTNxryAF0jdsZCwAwkPLnFH6yTJMtIZieza4NlWzFXu
   w==;
X-CSE-ConnectionGUID: a4CH+WQNRzmqUpa1KnsHoQ==
X-CSE-MsgGUID: VDNQObPBTZWiV1LB0Cgc5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18139466"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="18139466"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 21:09:05 -0700
X-CSE-ConnectionGUID: T5qA6y+cTimm7xwian8Few==
X-CSE-MsgGUID: PODF1z07RGKSvBMOvwGM2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="53030423"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jul 2024 21:09:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRl76-000Yjk-1G;
	Thu, 11 Jul 2024 04:09:00 +0000
Date: Thu, 11 Jul 2024 12:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 36/36]
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts:172.9-197.4: Warning
 (avoid_unnecessary_addr_size): /bridge: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407111203.4hLmrk6R-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   12d638f48c082831388358cc12a1c6ee58185ad8
commit: 12d638f48c082831388358cc12a1c6ee58185ad8 [36/36] scripts/dtc: Update to upstream version v1.7.0-93-g1df7b047fe43
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111203.4hLmrk6R-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111203.4hLmrk6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407111203.4hLmrk6R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:80.17-86.4: Warning (unit_address_vs_reg): /mclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:88.21-94.4: Warning (unit_address_vs_reg): /kmiclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:96.21-102.4: Warning (unit_address_vs_reg): /sspclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:104.23-110.4: Warning (unit_address_vs_reg): /uartclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:113.15-117.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:342.24-358.5: Warning (unit_address_vs_reg): /soc/cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:333.46-340.5: Warning (simple_bus_reg): /soc/interrupt-controller@10120000: simple-bus unit address format error, expected "10121000"
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:342.24-358.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "10110000"
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:360.7-364.5: Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:562.48-571.5: Warning (simple_bus_reg): /fpga/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
>> arch/arm/boot/dts/arm/arm-realview-pb1176.dts:172.9-197.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:66.27-70.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:66.27-70.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:80.17-86.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:66.27-70.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:80.17-86.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:88.21-94.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:66.27-70.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:80.17-86.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:88.21-94.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb1176.dts:96.21-102.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:95.23-117.4: Warning (unit_address_vs_reg): /cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:166.27-170.4: Warning (unit_address_vs_reg): /xtal24mhz@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:178.20-184.4: Warning (unit_address_vs_reg): /timclk@1M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:186.17-192.4: Warning (unit_address_vs_reg): /mclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:194.21-200.4: Warning (unit_address_vs_reg): /kmiclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:202.21-208.4: Warning (unit_address_vs_reg): /sspclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:210.23-216.4: Warning (unit_address_vs_reg): /uartclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:218.23-224.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:227.15-231.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:703.46-712.5: Warning (simple_bus_reg): /soc/interrupt-controller@1e000000: simple-bus unit address format error, expected "1e001000"
>> arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:253.9-278.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:166.27-170.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:166.27-170.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:186.17-192.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:166.27-170.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:186.17-192.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:194.21-200.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:166.27-170.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:186.17-192.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:194.21-200.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pb11mp.dts:202.21-208.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:48.25-54.11: Warning (unit_address_vs_reg): /fixedregulator@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unit_address_vs_reg): /xtal24mhz@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:62.20-68.4: Warning (unit_address_vs_reg): /timclk@1M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unit_address_vs_reg): /mclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unit_address_vs_reg): /kmiclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unit_address_vs_reg): /sspclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:94.23-100.4: Warning (unit_address_vs_reg): /uartclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:102.23-108.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:111.15-115.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dts:51.39-58.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:154.9-179.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unit_address_vs_reg): /xtal24mhz@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:62.20-68.4: Warning (unit_address_vs_reg): /timclk@1M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unit_address_vs_reg): /mclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unit_address_vs_reg): /kmiclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unit_address_vs_reg): /sspclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:94.23-100.4: Warning (unit_address_vs_reg): /uartclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:102.23-108.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:111.15-115.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dts:51.39-58.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:154.9-179.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:102.23-108.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:111.15-115.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (unit_address_vs_reg): /soc/cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (unit_address_vs_reg): /soc/pmu@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (simple_bus_reg): /soc/pmu@0: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:154.9-179.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:102.23-108.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:111.15-115.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (unit_address_vs_reg): /soc/cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (unit_address_vs_reg): /soc/pmu@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (simple_bus_reg): /soc/pmu@0: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:154.9-179.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "10102000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:86.21-89.5: Warning (simple_bus_reg): /soc/scu@1f000000: simple-bus unit address format error, expected "10100000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:91.29-96.5: Warning (simple_bus_reg): /soc/timer@1f000600: simple-bus unit address format error, expected "10100600"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:98.31-103.5: Warning (simple_bus_reg): /soc/watchdog@1f000620: simple-bus unit address format error, expected "10100620"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (simple_bus_reg): /soc/pmu@0: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:154.9-179.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "10102000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:86.21-89.5: Warning (simple_bus_reg): /soc/scu@1f000000: simple-bus unit address format error, expected "10100000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:91.29-96.5: Warning (simple_bus_reg): /soc/timer@1f000600: simple-bus unit address format error, expected "10100600"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:98.31-103.5: Warning (simple_bus_reg): /soc/watchdog@1f000620: simple-bus unit address format error, expected "10100620"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (simple_bus_reg): /soc/pmu@0: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:154.9-179.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:102.23-108.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:111.15-115.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (unit_address_vs_reg): /soc/cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (unit_address_vs_reg): /soc/pmu@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (simple_bus_reg): /soc/pmu@0: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:154.9-179.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:102.23-108.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:111.15-115.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (unit_address_vs_reg): /soc/cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (unit_address_vs_reg): /soc/pmu@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:41.39-48.5: Warning (simple_bus_reg): /soc/interrupt-controller@1f000100: simple-bus unit address format error, expected "1f001000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:51.46-60.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:62.24-84.5: Warning (simple_bus_reg): /soc/cache-controller: simple-bus unit address format error, expected "1f002000"
   arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi:106.14-113.5: Warning (simple_bus_reg): /soc/pmu@0: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:154.9-179.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:56.27-60.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:70.17-76.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:78.21-84.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:86.21-92.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:42.9-46.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unit_address_vs_reg): /xtal24mhz@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:77.20-83.4: Warning (unit_address_vs_reg): /timclk@1M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:85.17-91.4: Warning (unit_address_vs_reg): /mclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:93.21-99.4: Warning (unit_address_vs_reg): /kmiclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:101.21-107.4: Warning (unit_address_vs_reg): /sspclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:109.23-115.4: Warning (unit_address_vs_reg): /uartclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:117.23-123.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:126.15-130.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pba8.dts:43.13-48.4: Warning (unit_address_vs_reg): /pmu@0: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:170.9-195.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:85.17-91.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:85.17-91.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:93.21-99.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:85.17-91.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:93.21-99.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:101.21-107.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unit_address_vs_reg): /xtal24mhz@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:77.20-83.4: Warning (unit_address_vs_reg): /timclk@1M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:85.17-91.4: Warning (unit_address_vs_reg): /mclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:93.21-99.4: Warning (unit_address_vs_reg): /kmiclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:101.21-107.4: Warning (unit_address_vs_reg): /sspclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:109.23-115.4: Warning (unit_address_vs_reg): /uartclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:117.23-123.4: Warning (unit_address_vs_reg): /wdogclk@24M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:126.15-130.4: Warning (unit_address_vs_reg): /pclk@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dts:63.23-79.4: Warning (unit_address_vs_reg): /cache-controller: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/arm-realview-pbx-a9.dts:100.13-106.4: Warning (unit_address_vs_reg): /pmu@0: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:170.9-195.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /mclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:85.17-91.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /kmiclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:85.17-91.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:93.21-99.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /sspclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:65.27-69.4: Warning (unique_unit_address_if_enabled): /xtal24mhz@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:85.17-91.4: Warning (unique_unit_address_if_enabled): /mclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:93.21-99.4: Warning (unique_unit_address_if_enabled): /kmiclk@24M: duplicate unit-address (also used in node /uartclk@24M)
   arch/arm/boot/dts/arm/arm-realview-pbx.dtsi:101.21-107.4: Warning (unique_unit_address_if_enabled): /sspclk@24M: duplicate unit-address (also used in node /uartclk@24M)
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:541.10-555.4: Warning (avoid_unnecessary_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@480/gpio@77: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: ftgmac@1e660000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: ftgmac@1e680000: $nodename:0: 'ftgmac@1e680000' does not match '^ethernet(@.*)?$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts:55.28-57.4: Warning (unit_address_vs_reg): /ethernet-phy@0: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:254.25-262.5: Warning (avoid_unnecessary_addr_size): /ahb/ftgmac@1e670000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /: ethernet-phy@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /: spi1-gpio: {'compatible': ['spi-gpio'], '#address-cells': 1, '#size-cells': 0, 'gpio-sck': [52, 203, 0], 'gpio-mosi': [52, 204, 0], 'gpio-miso': [52, 205, 0], 'num-chipselects': 1, 'cs-gpios': [[52, 200, 1]], 'tpm@0': {'compatible': ['infineon,slb9670', 'tcg,tpm_tis-spi'], 'spi-max-frequency': 33000000, 'reg': [[0]]}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
--
>> arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:264.25-272.5: Warning (avoid_unnecessary_addr_size): /ahb/ftgmac@1e690000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: ftgmac@1e680000: $nodename:0: 'ftgmac@1e680000' does not match '^ethernet(@.*)?$'
--
>> arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:264.25-272.5: Warning (avoid_unnecessary_addr_size): /ahb/ftgmac@1e690000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: ftgmac@1e680000: $nodename:0: 'ftgmac@1e680000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
--
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:157.18-164.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:324.18-331.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:86.19-103.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	'ibm,bonnell-bmc' is not one of ['delta,ahe50dc-bmc', 'facebook,galaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
   	'ibm,bonnell-bmc' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'yadro,vegman-sx20-bmc']
   	'ibm,bonnell-bmc' is not one of ['ampere,mtmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,bletchley-bmc', 'facebook,cloudripper-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,greatlakes-bmc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,yosemite4-bmc', 'ibm,everest-bmc', 'ibm,rainier-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-bmc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /: failed to match any schema with compatible: ['ibm,bonnell-bmc', 'aspeed,ast2600']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts:105.19-134.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:655.36-659.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: ftgmac@1e680000: $nodename:0: 'ftgmac@1e680000' does not match '^ethernet(@.*)?$'

vim +172 arch/arm/boot/dts/arm/arm-realview-pb1176.dts

f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   26  
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   27  / {
abe60a3a7afb40 arch/arm/boot/dts/arm-realview-pb1176.dts Rob Herring      2019-01-09   28  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/arm-realview-pb1176.dts Rob Herring      2019-01-09   29  	#size-cells = <1>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   30  	model = "ARM RealView PB1176";
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   31  	compatible = "arm,realview-pb1176";
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   32  
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   33  	chosen { };
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   34  
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   35  	aliases {
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   36  		serial0 = &pb1176_serial0;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   37  		serial1 = &pb1176_serial1;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   38  		serial2 = &pb1176_serial2;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   39  		serial3 = &pb1176_serial3;
7f9ac7dafe1dd9 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   40  		serial4 = &fpga_serial;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   41  	};
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   42  
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   43  	memory {
abe60a3a7afb40 arch/arm/boot/dts/arm-realview-pb1176.dts Rob Herring      2019-01-09   44  		device_type = "memory";
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   45  		/* 128 MiB memory @ 0x0 */
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   46  		reg = <0x00000000 0x08000000>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   47  	};
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   48  
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   49  	/* The voltage to the MMC card is hardwired at 3.3V */
f3b2f758ec1e6c arch/arm/boot/dts/arm-realview-pb1176.dts Rob Herring      2018-12-03   50  	vmmc: regulator-vmmc {
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   51  		compatible = "regulator-fixed";
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   52  		regulator-name = "vmmc";
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   53  		regulator-min-microvolt = <3300000>;
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   54  		regulator-max-microvolt = <3300000>;
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   55  		regulator-boot-on;
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   56          };
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   57  
f3b2f758ec1e6c arch/arm/boot/dts/arm-realview-pb1176.dts Rob Herring      2018-12-03   58  	veth: regulator-veth {
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14   59  		compatible = "regulator-fixed";
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14   60  		regulator-name = "veth";
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14   61  		regulator-min-microvolt = <3300000>;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14   62  		regulator-max-microvolt = <3300000>;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14   63  		regulator-boot-on;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14   64  	};
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14   65  
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   66  	xtal24mhz: xtal24mhz@24M {
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   67  		#clock-cells = <0>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   68  		compatible = "fixed-clock";
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   69  		clock-frequency = <24000000>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   70  	};
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   71  
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   72  	timclk: timclk@1M {
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   73  		#clock-cells = <0>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   74  		compatible = "fixed-factor-clock";
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   75  		clock-div = <24>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   76  		clock-mult = <1>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   77  		clocks = <&xtal24mhz>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   78  	};
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01   79  
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   80  	mclk: mclk@24M {
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   81  		#clock-cells = <0>;
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   82  		compatible = "fixed-factor-clock";
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   83  		clock-div = <1>;
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   84  		clock-mult = <1>;
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   85  		clocks = <&xtal24mhz>;
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   86  	};
10d8ddee10b886 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-13   87  
7406c3957f28aa arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   88  	kmiclk: kmiclk@24M {
7406c3957f28aa arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   89  		#clock-cells = <0>;
7406c3957f28aa arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   90  		compatible = "fixed-factor-clock";
7406c3957f28aa arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   91  		clock-div = <1>;
7406c3957f28aa arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   92  		clock-mult = <1>;
7406c3957f28aa arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   93  		clocks = <&xtal24mhz>;
7406c3957f28aa arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   94  	};
7406c3957f28aa arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   95  
24ec3ff329b994 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   96  	sspclk: sspclk@24M {
24ec3ff329b994 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   97  		#clock-cells = <0>;
24ec3ff329b994 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   98  		compatible = "fixed-factor-clock";
24ec3ff329b994 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10   99  		clock-div = <1>;
24ec3ff329b994 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10  100  		clock-mult = <1>;
24ec3ff329b994 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10  101  		clocks = <&xtal24mhz>;
24ec3ff329b994 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10  102  	};
24ec3ff329b994 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-10  103  
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  104  	uartclk: uartclk@24M {
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  105  		#clock-cells = <0>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  106  		compatible = "fixed-factor-clock";
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  107  		clock-div = <1>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  108  		clock-mult = <1>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  109  		clocks = <&xtal24mhz>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  110  	};
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  111  
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  112  	/* FIXME: this actually hangs off the PLL clocks */
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  113  	pclk: pclk@0 {
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  114  		#clock-cells = <0>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  115  		compatible = "fixed-clock";
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  116  		clock-frequency = <0>;
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  117  	};
f123a66cbdc47e arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-01  118  
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  119  	flash@30000000 {
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  120  		compatible = "arm,versatile-flash", "cfi-flash";
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  121  		reg = <0x30000000 0x4000000>;
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  122  		bank-width = <4>;
ed3a03b70749ca arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2019-01-23  123  		partitions {
ed3a03b70749ca arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2019-01-23  124  			compatible = "arm,arm-firmware-suite";
ed3a03b70749ca arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2019-01-23  125  		};
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  126  	};
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  127  
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  128  	fpga_flash@38000000 {
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  129  		compatible = "arm,versatile-flash", "cfi-flash";
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  130  		reg = <0x38000000 0x800000>;
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  131  		bank-width = <4>;
ed3a03b70749ca arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2019-01-23  132  		partitions {
ed3a03b70749ca arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2019-01-23  133  			compatible = "arm,arm-firmware-suite";
ed3a03b70749ca arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2019-01-23  134  		};
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  135  	};
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  136  
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  137  	/*
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  138  	 * The "secure flash" contains things like the boot
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  139  	 * monitor so we don't want people to accidentally
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  140  	 * screw this up. Mark the device tree node disabled
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  141  	 * by default.
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  142  	 */
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  143  	secflash@3c000000 {
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  144  		compatible = "arm,versatile-flash", "cfi-flash";
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  145  		reg = <0x3c000000 0x4000000>;
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  146  		bank-width = <4>;
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  147  		status = "disabled";
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  148  	};
5c3f5edbe0a1df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2014-10-14  149  
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  150  	/* SMSC 9118 ethernet with PHY and EEPROM */
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  151  	ethernet@3a000000 {
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  152  		compatible = "smsc,lan9118", "smsc,lan9115";
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  153  		reg = <0x3a000000 0x10000>;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  154  		interrupt-parent = <&intc_fpga1176>;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  155  		interrupts = <0 10 IRQ_TYPE_LEVEL_HIGH>;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  156  		phy-mode = "mii";
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  157  		reg-io-width = <4>;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  158  		smsc,irq-active-high;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  159  		smsc,irq-push-pull;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  160  		vdd33a-supply = <&veth>;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  161  		vddvario-supply = <&veth>;
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  162  	};
3bf0a4194f1a14 arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  163  
cc9ab84cd942df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  164  	usb@3b000000 {
cc9ab84cd942df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  165  		compatible = "nxp,usb-isp1761";
cc9ab84cd942df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  166  		reg = <0x3b000000 0x20000>;
cc9ab84cd942df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  167  		interrupt-parent = <&intc_fpga1176>;
cc9ab84cd942df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  168  		interrupts = <0 11 IRQ_TYPE_LEVEL_HIGH>;
3eb96e04be9918 arch/arm/boot/dts/arm-realview-pb1176.dts Rui Miguel Silva 2021-05-13  169  		dr_mode = "peripheral";
cc9ab84cd942df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  170  	};
cc9ab84cd942df arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2016-01-14  171  
3088a5c7ad990b arch/arm/boot/dts/arm-realview-pb1176.dts Linus Walleij    2018-01-23 @172  	bridge {

:::::: The code at line 172 was first introduced by commit
:::::: 3088a5c7ad990b8ac2afb6dbfeae25c67392c6e9 ARM: dts: Augment VGA connector bridge on PB1176

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
