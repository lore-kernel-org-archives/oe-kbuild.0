Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A03221D009
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734721150; cv=none; b=S0LRT15Pqqfc85nYUbQEjOUulhe/Ta+DKSx4gu7mxR5Mtz+UOYDFo/uVrtuLZOkZG4GJnpoz+ACdB6t8XZU94fKXImMhF9qdoDNsrZ8UL+ZDpkWMLbD+OoD/6K2Fg1ZYQo2C+etbGrEdQRmyfemSYUdqKGh2SzCDpvsyWJlF0h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734721150; c=relaxed/simple;
	bh=INWKbpwBY+lpOeiEMQD2PdoxpIeobjRc4XuraV+fWdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lFQ7avAG+1fM8nTK878rF5KpSJJsr8Ei6kk+UBCoxHYoH7wDs7bxzU8GYhx8CbsPzXiwpgpXwEKOVO4GIUNXtS4nukabNbb0nqP/BB2Nl5WHA6V8dOSx1yXlT9oNgbB24yqZUszDcIDjP9j3KYPYcoLmiutG6V3wtdzCyEbwT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7XdGo3I; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7XdGo3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734721147; x=1766257147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=INWKbpwBY+lpOeiEMQD2PdoxpIeobjRc4XuraV+fWdU=;
  b=N7XdGo3IVdW1aKycuVDIelJ9Set1MEU1J8fdcfMVPakqb/9mmjIlSrMQ
   nuQ2g5F0rTAHwIPh9xEk2BEEfxsmwjb3Puxe+7Qy2NEBqGuEya+T7YHuo
   2vsLHR++VJP9ayMU0nntws1AgTtIQ+M+kHZf/IXgx9lBzXXMbIEMqwIvR
   TLYdY4q4GnCHwbRtEU8I7lfN9nLJvWuQ2bJGjFMdDh0KcDrw2HdEJOOOK
   Cdh9KXDOBT35KiXFqu4ucSUvDsqL5lHNybirZ3YrspMqtDWTaku187Xga
   2rsj40eXP4etqRO1Z4LIZt3lMfPxg7NMllVAgISRQcjFw/hYB+mXgODzq
   w==;
X-CSE-ConnectionGUID: eKSEnSFQQN2XyA/6am1nzA==
X-CSE-MsgGUID: OgGwVSlsSLu0tkRMXXVFHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34598298"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="34598298"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 10:59:05 -0800
X-CSE-ConnectionGUID: OM8i0OidSIa70IxwaZnz3g==
X-CSE-MsgGUID: R5NWpv1cQaSpdsJV1W/V+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="99110437"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2024 10:59:03 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOiDF-0001ai-1N;
	Fri, 20 Dec 2024 18:59:01 +0000
Date: Sat, 21 Dec 2024 02:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/amd/amd-seattle-clks.dtsi:8.30-13.4: Warning
 (simple_bus_reg): /smb/clk100mhz_0: missing or empty reg/ranges property
Message-ID: <202412210256.zs3hXSxD-lkp@intel.com>
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
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: c2e7075ca83036317cee4a564729eb82a5433169 scripts/dtc: Update to upstream version v1.4.7-57-gf267e674d145
date:   6 years ago
:::::: branch date: 26 hours ago
:::::: commit date: 6 years ago
config: arm64-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241221/202412210256.zs3hXSxD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210256.zs3hXSxD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412210256.zs3hXSxD-lkp@intel.com/

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
