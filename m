Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A621E08B
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734738935; cv=none; b=pOuUd+1H24yp8dFsecGERP+1BvwAq/ehgME7s/mkaBUM7vD6Jy7MAUCa7j4FIfzVdUgzSrIt7u6c5oM6vY3uppAWDEF3eTFwWrzzk61S+brh6cV/4V5fLWzU+/ocZyfGlyYolmjxePrjFLABUBKHtIKeJfMl9ql9BV4H2pdb2Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734738935; c=relaxed/simple;
	bh=7u4R7Z9634xOa179cwsLfjwn63GQyN+88qMYkp2ZGQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jh5eNyR/D6SsSTaYCw+3uCIAYorEiUWt4b/LdWm2HRv/EVbcUvscdLR49l568g5oCXCIkouTWAMkdR1h0dDT8atUVQfeZMQtMixA5tlDk4GQiIXZ/fR7VO89ybRsh22ZiznIIuKmfzUIi7ohYzpW9O1yBaJ6iLWTGJ8uo6jOf5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNGOSGcJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNGOSGcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734738932; x=1766274932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7u4R7Z9634xOa179cwsLfjwn63GQyN+88qMYkp2ZGQM=;
  b=nNGOSGcJ948xvjQdlzvmB8TU7Ng6wy+iZkSL1oVKWnkbfVvob/UnPy8C
   h2AR3OywEFLV5Cc4GPgxijxCL1Btu50eiFmBX6h4HZk6e7O5jBl6ZntcW
   L55Xqiz7ccYqW5Yvvj3aqItYHrCBIFWFBA1WM+jxcfD2iCzYX96Y20Ior
   EBcI16Jk0B55t9CY9fsW4XWAw10UgKRJZ6neubvjWuJRUbI295srFJ4ZP
   oCIqVRIkNFNp+kcYkIuEprv4s6oU63kmYdxPCJnQjb0CBtW/w4SkPT2pJ
   Fq5gL40BzFkvt9IGqflqv7h0Bt2GojmETrw9HqiDI9j0JCblS+3gIW/uD
   Q==;
X-CSE-ConnectionGUID: JDZrBONlRmK3t2LYK8HD1A==
X-CSE-MsgGUID: h/f8EXPgRKaesa/1/IxPBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35442287"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="35442287"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 15:55:31 -0800
X-CSE-ConnectionGUID: mbW/bVMnTqid7J7KOMKfDQ==
X-CSE-MsgGUID: pJW5cq+kSkWQbjX4uYDwFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="98455256"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2024 15:55:29 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOmq7-0001mz-1z;
	Fri, 20 Dec 2024 23:55:27 +0000
Date: Sat, 21 Dec 2024 07:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:8.30-13.4: Warning
 (simple_bus_reg): /smb/clk100mhz_0: missing or empty reg/ranges property
Message-ID: <202412210758.bhSswEWS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9b8ffafd20ad21357a789cc58ffaa162b3ad074
commit: c2e7075ca83036317cee4a564729eb82a5433169 scripts/dtc: Update to upstream version v1.4.7-57-gf267e674d145
date:   6 years ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 years ago
config: arm64-randconfig-004-20241212 (https://download.01.org/0day-ci/archive/20241221/202412210758.bhSswEWS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210758.bhSswEWS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412210758.bhSswEWS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:8.30-13.4: Warning (simple_bus_reg): /smb/clk100mhz_0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:15.27-20.4: Warning (simple_bus_reg): /smb/clk375mhz: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:22.28-27.4: Warning (simple_bus_reg): /smb/clk333mhz: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:29.30-34.4: Warning (simple_bus_reg): /smb/clk500mhz_0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:36.29-41.4: Warning (simple_bus_reg): /smb/clk500mhz_1: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:43.30-48.4: Warning (simple_bus_reg): /smb/clk250mhz_4: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:50.33-55.4: Warning (simple_bus_reg): /smb/clk100mhz_1: missing or empty reg/ranges property
--
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:8.30-13.4: Warning (simple_bus_reg): /smb/clk100mhz_0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:15.27-20.4: Warning (simple_bus_reg): /smb/clk375mhz: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:22.28-27.4: Warning (simple_bus_reg): /smb/clk333mhz: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:29.30-34.4: Warning (simple_bus_reg): /smb/clk500mhz_0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:36.29-41.4: Warning (simple_bus_reg): /smb/clk500mhz_1: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:43.30-48.4: Warning (simple_bus_reg): /smb/clk250mhz_4: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:50.33-55.4: Warning (simple_bus_reg): /smb/clk100mhz_1: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi:8.36-13.4: Warning (simple_bus_reg): /smb/clk250mhz_0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi:15.36-20.4: Warning (simple_bus_reg): /smb/clk250mhz_1: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi:22.36-27.4: Warning (simple_bus_reg): /smb/clk250mhz_2: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi:29.36-34.4: Warning (simple_bus_reg): /smb/clk250mhz_3: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:283.14-285.5: Warning (unit_address_vs_reg): /sound/dai-link@2: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:287.14-289.5: Warning (unit_address_vs_reg): /sound/dai-link@3: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:291.14-293.5: Warning (unit_address_vs_reg): /sound/dai-link@4: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:295.14-297.5: Warning (unit_address_vs_reg): /sound/dai-link@5: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:299.14-318.5: Warning (unit_address_vs_reg): /sound/dai-link@6: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:306.12-308.6: Warning (unit_address_vs_reg): /sound/dai-link@6/codec@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:310.12-312.6: Warning (unit_address_vs_reg): /sound/dai-link@6/codec@1: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:314.12-316.6: Warning (unit_address_vs_reg): /sound/dai-link@6/codec@2: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:320.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@7: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:328.14-334.5: Warning (unit_address_vs_reg): /sound/dai-link@8: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-axg.dtsi:181.33-956.6: Warning (simple_bus_reg): /soc/bus@ff634000/pinctrl@480: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-axg.dtsi:1222.30-1318.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:23.30-32.4: Warning (unique_unit_address): /audio-controller@0: duplicate unit-address (also used in node /audio-codec@0)
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:34.30-43.4: Warning (unique_unit_address): /audio-controller@1: duplicate unit-address (also used in node /audio-codec@1)
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:45.30-54.4: Warning (unique_unit_address): /audio-controller@2: duplicate unit-address (also used in node /audio-codec@2)
   arch/arm64/boot/dts/amlogic/meson-axg.dtsi:23.30-32.4: Warning (unique_unit_address): /audio-controller@0: duplicate unit-address (also used in node /memory@0)
   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts:63.24-71.4: Warning (unique_unit_address): /audio-codec@0: duplicate unit-address (also used in node /memory@0)
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts:48.12-52.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts:42.19-53.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts:36.12-40.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:64.28-222.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:339.31-659.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts:30.19-41.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts:40.12-44.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts:34.19-45.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts:37.12-41.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts:31.19-42.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts:70.12-74.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts:64.19-75.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts:37.12-41.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts:31.19-42.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:164.29-169.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (unit_address_vs_reg): /soc/periphs@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/pinctrl@4b0: node has a unit name, but no reg property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (unit_address_vs_reg): /soc/periphs@c8834000/eth-phy-mux: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (unit_address_vs_reg): /soc/usb@c9000000: node has a unit name, but no reg property
>> arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:95.28-232.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:420.15-423.6: Warning (simple_bus_reg): /soc/periphs@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:286.31-632.4: Warning (simple_bus_reg): /soc/periphs@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:634.14-660.4: Warning (simple_bus_reg): /soc/periphs@c8834000/eth-phy-mux: simple-bus unit address format error, expected "55c"
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:17.22-38.5: Warning (simple_bus_reg): /soc/usb@c9000000: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi:74.17-80.4: Warning (simple_bus_reg): /soc/bus8: missing or empty reg/ranges property
   arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi:82.17-88.4: Warning (simple_bus_reg): /soc/bus9: missing or empty reg/ranges property
   arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi:90.36-118.4: Warning (simple_bus_reg): /soc/opp_table2: missing or empty reg/ranges property
   arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi:120.36-138.4: Warning (simple_bus_reg): /soc/opp_table3: missing or empty reg/ranges property
   arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi:140.33-152.4: Warning (simple_bus_reg): /soc/opp_table4: missing or empty reg/ranges property
   arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi:154.33-176.4: Warning (simple_bus_reg): /soc/opp_table5: missing or empty reg/ranges property
   arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi:178.33-193.4: Warning (simple_bus_reg): /soc/opp_table6: missing or empty reg/ranges property
>> arch/arm64/boot/dts/exynos/exynos5433.dtsi:852.10-863.6: Warning (graph_child_address): /soc/decon@13800000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi:323.8-333.4: Warning (graph_child_address): /soc/decon@13880000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/exynos/exynos5433.dtsi:916.10-926.6: Warning (graph_child_address): /soc/dsi@13900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi:65.10-71.6: Warning (simple_bus_reg): /ap810-ap0/config-space@e8000000/timer: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:246.23-288.4: Warning (avoid_unnecessary_addr_size): /syscon@ff100000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3328.dtsi:624.17-632.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/sprd/whale2.dtsi:67.10-108.5: Warning (unit_address_vs_reg): /soc/ap-apb: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/sprd/sc9860.dtsi:210.26-216.5: Warning (unit_address_vs_reg): /soc/aon-prediv: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dts:27.8-31.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/sprd/whale2.dtsi:67.10-108.5: Warning (simple_bus_reg): /soc/ap-apb: simple-bus unit address format error, expected "70000000"
>> arch/arm64/boot/dts/sprd/sc9860.dtsi:188.22-193.5: Warning (simple_bus_reg): /soc/pmu-gate: missing or empty reg/ranges property
>> arch/arm64/boot/dts/sprd/sc9860.dtsi:195.12-200.5: Warning (simple_bus_reg): /soc/pll: missing or empty reg/ranges property
   arch/arm64/boot/dts/sprd/sc9860.dtsi:210.26-216.5: Warning (simple_bus_reg): /soc/aon-prediv: simple-bus unit address format error, expected "402d0000"
>> arch/arm64/boot/dts/sprd/sc9860.dtsi:218.26-223.5: Warning (simple_bus_reg): /soc/apahb-gate: missing or empty reg/ranges property
>> arch/arm64/boot/dts/sprd/sc9860.dtsi:225.22-230.5: Warning (simple_bus_reg): /soc/aon-gate: missing or empty reg/ranges property
>> arch/arm64/boot/dts/sprd/sc9860.dtsi:239.24-244.5: Warning (simple_bus_reg): /soc/agcp-gate: missing or empty reg/ranges property
>> arch/arm64/boot/dts/sprd/sc9860.dtsi:260.22-265.5: Warning (simple_bus_reg): /soc/vsp-gate: missing or empty reg/ranges property
>> arch/arm64/boot/dts/sprd/sc9860.dtsi:274.22-279.5: Warning (simple_bus_reg): /soc/cam-gate: missing or empty reg/ranges property
>> arch/arm64/boot/dts/sprd/sc9860.dtsi:288.24-293.5: Warning (simple_bus_reg): /soc/disp-gate: missing or empty reg/ranges property
>> arch/arm64/boot/dts/sprd/sc9860.dtsi:295.26-300.5: Warning (simple_bus_reg): /soc/apapb-gate: missing or empty reg/ranges property
   arch/arm64/boot/dts/sprd/sc9860.dtsi:685.13-711.5: Warning (simple_bus_reg): /soc/gpio-keys: missing or empty reg/ranges property
   arch/arm64/boot/dts/sprd/sc9860.dtsi:318.12-325.7: Warning (graph_port): /soc/funnel@10001000/ports/port@1: graph node unit address error, expected "0"
   arch/arm64/boot/dts/sprd/sc9860.dtsi:327.12-334.7: Warning (graph_port): /soc/funnel@10001000/ports/port@2: graph node unit address error, expected "4"
   arch/arm64/boot/dts/sprd/sc9860.dtsi:384.12-390.7: Warning (graph_port): /soc/funnel@11001000/ports/port@1: graph node unit address error, expected "0"
   arch/arm64/boot/dts/sprd/sc9860.dtsi:392.12-398.7: Warning (graph_port): /soc/funnel@11001000/ports/port@2: graph node unit address error, expected "1"
   arch/arm64/boot/dts/sprd/sc9860.dtsi:400.12-406.7: Warning (graph_port): /soc/funnel@11001000/ports/port@3: graph node unit address error, expected "2"
   arch/arm64/boot/dts/sprd/sc9860.dtsi:435.12-441.7: Warning (graph_port): /soc/funnel@11002000/ports/port@1: graph node unit address error, expected "0"
   arch/arm64/boot/dts/sprd/sc9860.dtsi:443.12-449.7: Warning (graph_port): /soc/funnel@11002000/ports/port@2: graph node unit address error, expected "1"
   arch/arm64/boot/dts/sprd/sc9860.dtsi:451.12-457.7: Warning (graph_port): /soc/funnel@11002000/ports/port@3: graph node unit address error, expected "2"
   arch/arm64/boot/dts/sprd/sc9860.dtsi:459.12-465.7: Warning (graph_port): /soc/funnel@11002000/ports/port@4: graph node unit address error, expected "3"

vim +8 arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi

419043609689d0 Suravee Suthikulpanit 2014-11-26  @8  	adl3clk_100mhz: clk100mhz_0 {
419043609689d0 Suravee Suthikulpanit 2014-11-26   9  		compatible = "fixed-clock";
419043609689d0 Suravee Suthikulpanit 2014-11-26  10  		#clock-cells = <0>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  11  		clock-frequency = <100000000>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  12  		clock-output-names = "adl3clk_100mhz";
419043609689d0 Suravee Suthikulpanit 2014-11-26  13  	};
419043609689d0 Suravee Suthikulpanit 2014-11-26  14  
419043609689d0 Suravee Suthikulpanit 2014-11-26 @15  	ccpclk_375mhz: clk375mhz {
419043609689d0 Suravee Suthikulpanit 2014-11-26  16  		compatible = "fixed-clock";
419043609689d0 Suravee Suthikulpanit 2014-11-26  17  		#clock-cells = <0>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  18  		clock-frequency = <375000000>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  19  		clock-output-names = "ccpclk_375mhz";
419043609689d0 Suravee Suthikulpanit 2014-11-26  20  	};
419043609689d0 Suravee Suthikulpanit 2014-11-26  21  
419043609689d0 Suravee Suthikulpanit 2014-11-26 @22  	sataclk_333mhz: clk333mhz {
419043609689d0 Suravee Suthikulpanit 2014-11-26  23  		compatible = "fixed-clock";
419043609689d0 Suravee Suthikulpanit 2014-11-26  24  		#clock-cells = <0>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  25  		clock-frequency = <333000000>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  26  		clock-output-names = "sataclk_333mhz";
419043609689d0 Suravee Suthikulpanit 2014-11-26  27  	};
419043609689d0 Suravee Suthikulpanit 2014-11-26  28  
419043609689d0 Suravee Suthikulpanit 2014-11-26 @29  	pcieclk_500mhz: clk500mhz_0 {
419043609689d0 Suravee Suthikulpanit 2014-11-26  30  		compatible = "fixed-clock";
419043609689d0 Suravee Suthikulpanit 2014-11-26  31  		#clock-cells = <0>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  32  		clock-frequency = <500000000>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  33  		clock-output-names = "pcieclk_500mhz";
419043609689d0 Suravee Suthikulpanit 2014-11-26  34  	};
419043609689d0 Suravee Suthikulpanit 2014-11-26  35  
419043609689d0 Suravee Suthikulpanit 2014-11-26 @36  	dmaclk_500mhz: clk500mhz_1 {
419043609689d0 Suravee Suthikulpanit 2014-11-26  37  		compatible = "fixed-clock";
419043609689d0 Suravee Suthikulpanit 2014-11-26  38  		#clock-cells = <0>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  39  		clock-frequency = <500000000>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  40  		clock-output-names = "dmaclk_500mhz";
419043609689d0 Suravee Suthikulpanit 2014-11-26  41  	};
419043609689d0 Suravee Suthikulpanit 2014-11-26  42  
419043609689d0 Suravee Suthikulpanit 2014-11-26 @43  	miscclk_250mhz: clk250mhz_4 {
419043609689d0 Suravee Suthikulpanit 2014-11-26  44  		compatible = "fixed-clock";
419043609689d0 Suravee Suthikulpanit 2014-11-26  45  		#clock-cells = <0>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  46  		clock-frequency = <250000000>;
419043609689d0 Suravee Suthikulpanit 2014-11-26  47  		clock-output-names = "miscclk_250mhz";
419043609689d0 Suravee Suthikulpanit 2014-11-26  48  	};
419043609689d0 Suravee Suthikulpanit 2014-11-26  49  
419043609689d0 Suravee Suthikulpanit 2014-11-26 @50  	uartspiclk_100mhz: clk100mhz_1 {

:::::: The code at line 8 was first introduced by commit
:::::: 419043609689d0aba9f727a6faf1ff406e269ecf arm64: amd-seattle: Adding device tree for AMD Seattle platform

:::::: TO: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
