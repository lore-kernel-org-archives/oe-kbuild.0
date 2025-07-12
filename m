Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320A11E5701
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 21:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752356730; cv=none; b=jLrANF3vSLP7LWSIkNzTvic502GCBo/CuKBqPhTkkKa6SCiq53zLdJHtFCEoD1/n8jTvPqtc/RDjj3keH7ZU2vCRUcz5+Pp7w/xtmDWijRfxsgn5UDch32/9skpMEC3hVKVF0Bbdt25po4uw9sJXA06wD1d2MG5RX4ps6069jZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752356730; c=relaxed/simple;
	bh=00vkYPBYR+dp6kP0Yogz1WybplQpB7ev8zjMhBvwCXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XR7imUV4Aw6/lKupJt5W6ofXIIajj6RZm4CuF2ome+cI05bgiR8ws/Xadk4wsHNsvaKt31rDsAAtSqkvyqftLk7E6+cNNnftS4PEc2Mi36HNRFpi+YHtBaeSN8TJ/Cy17juUDDAa9vLVgqcO3wnWyDUFd6WYgJi4M0uHT6Si0L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzIVVM/D; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzIVVM/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752356728; x=1783892728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=00vkYPBYR+dp6kP0Yogz1WybplQpB7ev8zjMhBvwCXk=;
  b=bzIVVM/DBJ6r83+aMpFYjXWyZcE1356fRsQVqWy0gBB7UrKwot8ahVWj
   wtOnntnqy4SHCj8+rIwSrVg09hFSDvEA+/TUtlZRiMLd9YS3wzMc3C/KR
   kqSyIKTxrEvm9uo9mqpRKpKRf3yGgbHq1pTgKHJIlyZlQOuf3SPFfdzZk
   ZhQMbrNT3bhLxLEy85dzgIyb6C0IZaGSpQZ9/WHgjjaHn2JOxe9sbBOnu
   43dmoUnqPqIc89INVP/11SSIr+acz6VE0mbO9wswaqr5O8GwULA14guzH
   4Qz1CzKGkjbVfo0OqCuhjkW5nYzhAFr3UX7xPvs9YfHVl4FhZ9OAlkGN8
   w==;
X-CSE-ConnectionGUID: bxd+oXKRRc+yevh8vcFhcg==
X-CSE-MsgGUID: rwNykYvFRyyKHQaIP0v2kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="80046348"
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="80046348"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 14:45:27 -0700
X-CSE-ConnectionGUID: F8uUifd3QkWjt4P/O19EHw==
X-CSE-MsgGUID: WdApsHmBSXOPwE++XSDCNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="157119190"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jul 2025 14:45:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uai28-0007i5-1N;
	Sat, 12 Jul 2025 21:45:24 +0000
Date: Sun, 13 Jul 2025 05:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.17-armsoc/dts64 56/56]
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@36
 (ovti,ov8858): 'orientation', 'rotation' do not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202507130559.dte1Aoqe-lkp@intel.com>
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
TO: Olivier Benjamin <olivier.benjamin@bootlin.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Ondrej Jirman <megi@xff.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.17-armsoc/dts64
head:   b45f9f910aa28fc6151ac5d1ff107522b4a6b1af
commit: b45f9f910aa28fc6151ac5d1ff107522b4a6b1af [56/56] arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-051-20250712 (https://download.01.org/0day-ci/archive/20250713/202507130559.dte1Aoqe-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130559.dte1Aoqe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507130559.dte1Aoqe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1951.11-1955.6: Warning (graph_child_address): /isp0@ff910000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1984.9-1993.5: Warning (graph_child_address): /isp1@ff920000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1988.11-1992.6: Warning (graph_child_address): /isp1@ff920000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@1a (sony,imx258): 'lens-focus', 'orientation', 'rotation' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@36 (ovti,ov8858): 'orientation', 'rotation' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8858.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
