Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11741EA65
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983891; cv=none; b=GwcFuW4N1g44hzxacU0G32mBioMfvQokmuM7e4+dcvT3IutQnDBFeMGddLT5jJ8N+caGfo5r7vMQNj7FSBDl+5vyJvif9kJqePKxuaZT/1OSQHXomLSCWyevtb+zh8ot9nt1qhUZKrrsSFN7cLWvYApHGPapcJ/NsTJ1R/HFNBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983891; c=relaxed/simple;
	bh=uWPcnXNV/2aNYpddSz0/5vHJ0wvqPxLSZ0swSl9tTD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AoqlM7fZimuLd5aE5VO6Fs2cVhEEfPpGZE6aMpIZeAakynDJPFq4z+J5BM8u9/PxHVXHaSnaZk8Q5CDP1//XnSzDduezf3BpxFQCklEoRRi6VBk5X8aASco8Dw0HeV0g78f5yGNiFE0Oygc6zMEAw2m7Oi1QhSpd/cOBk5YXX80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWGjX3nK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWGjX3nK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763983890; x=1795519890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uWPcnXNV/2aNYpddSz0/5vHJ0wvqPxLSZ0swSl9tTD0=;
  b=cWGjX3nKSxag4O+488XDe0V8VlPuCAAVM3gRSo7/Ob/bV193C11bPdTp
   kP4XzdocSYVkj+7fFLfvKTrvdAnZpzhl4VtmB6qu6HTQRpY+vroLQp49e
   qVtkUk727qEIUWaQpeVLTya32ub0GAWf5J4XUR3fqT/yL/U1kP9Opolr/
   jQWjPwSWd3538DHH6j2M90pesw3qgzOScV4g34Gdgl3YCR6/sIaS/4W25
   kLxjVCszE6Oe2EJ4Qv8qyjVQyzVPuyyK/HTmwWXjTRcf9PhYeJb3M307v
   Mc6UhzKYpx1s60R6/Y2qkkNMtbq/e2+Hukld7LRdv1CyOrnGkQkGC0lIc
   g==;
X-CSE-ConnectionGUID: OSn3HzNxQNyMw/64kD9VAA==
X-CSE-MsgGUID: oNsBZqHZQTu22RjpzQUHHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69834589"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="69834589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 03:31:30 -0800
X-CSE-ConnectionGUID: xdQDtgKfSlWlEJkrsmgATw==
X-CSE-MsgGUID: JBr6kUYTQNe/5k+j/sbEcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196478648"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 24 Nov 2025 03:31:28 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNUmz-000000000Dh-3YcS;
	Mon, 24 Nov 2025 11:31:25 +0000
Date: Mon, 24 Nov 2025 12:31:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.19-armsoc/dts64 42/65]
 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb:
 /video-capture@ff490000: failed to match any schema with compatible:
 ['rockchip,px30-vip']
Message-ID: <202511241240.ycjfWYeD-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Mehdi Djait <mehdi.djait@bootlin.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Michael Riesch <michael.riesch@wolfvision.net>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.19-armsoc/dts64
head:   e34003dd2fb05da8f420bbd7b8ec62ab88242c45
commit: d2da7e98c0bf7f75433809ad875c6e1ae57f0cea [42/65] arm64: dts: rockchip: add the vip node to px30
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251124/202511241240.ycjfWYeD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241240.ycjfWYeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511241240.ycjfWYeD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:1274.9-1281.5: Warning (graph_child_address): /isp@ff4a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/px30-evb.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
>> arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
>> arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
   arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dtb: panel (ampire,am-1280800n3tzqw-t00h): False schema does not allow ['vesa-24']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
--
>> arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
   arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-edimm2.2.dtb: panel (yes-optoelectronics,ytc700tlag-05-201c): False schema does not allow ['vesa-24']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
--
>> arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core-mb.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:1274.9-1281.5: Warning (graph_child_address): /isp@ff4a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:1274.9-1281.5: Warning (graph_child_address): /isp@ff4a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351v.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2-v11.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
   arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dtb: mux-controller (gpio-mux): 'pinctrl' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mux/gpio-mux.yaml
--
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-lvds-9904379.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']
--
>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: /video-capture@ff490000: failed to match any schema with compatible: ['rockchip,px30-vip']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
