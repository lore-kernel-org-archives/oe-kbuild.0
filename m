Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049A41E1E19
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Sep 2025 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757323100; cv=none; b=WH3oEuuAOHD5V+jytl6kIwCeS2UB7S01RynfBRaoCz40JRiozMfPdFfnnFirOz3EGfbj4+1d1VQ9Ymw9mYKJpKT7TOX7hYrnffL940mlQf/ilkVXB/bo+/CM/5D6bakRjhrg78rG+WJGkOuC1A5QXl4p4aK2yR1G7HodaWwnuj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757323100; c=relaxed/simple;
	bh=a64MMSAPRTHVHPdPadj7mLXVJa4T0N3Oemgab+DzBbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRNftUU6JEtEUVOS6YysQRnqTki6WLpWsF0Tk1f4wzlKbaBRf9QXxrTLB9UMESNqGRwDJRMykg5gyBYgRomn5AZVlQq8BfQHaTlYJlkUm47bIjTg9kXUadPPE81gGN/d1iiQJoU5UJRvQ28AVHz7v0G3E8qirEE89Iyqx5XlK1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ME8VOwS4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ME8VOwS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757323098; x=1788859098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a64MMSAPRTHVHPdPadj7mLXVJa4T0N3Oemgab+DzBbo=;
  b=ME8VOwS472l8YqGL5Y135yxq3J8wqinVXxdxBqYiq5FOeL2y7iKCwgS8
   bvoP8cVQao/a4v/VPSLNq4FpjAp9pzfUev8ChOcsMUhdmo/rfnhXQDhSM
   K8IscAPDUOkveVNo3isyYAhtypAtAvyLvAuIj2dKHWzdnjz5smiw/QgkW
   QDADg1KdHnNwA7eTyCTXZ+JkFNpzoutXb9jaX9al2dW+sjrMkXdXS0FD2
   ZCu/+u0RhliLZRkE96xYAQudn8RiTw1u0DNF/TyCuQ8KPY7A3GIzUHiXt
   HiSuFRkjicsjiPy3VEIcICjrw1ZOQK35jyYPakyUc+yr6n855WhEE/0QB
   Q==;
X-CSE-ConnectionGUID: ZFi3+PQNQUOmcw8CjYs+KQ==
X-CSE-MsgGUID: FwfUWoNETrKMtM8zHVhY6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59271924"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="59271924"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 02:18:16 -0700
X-CSE-ConnectionGUID: YU6Pbk4HRFSAe0jWVhGMcQ==
X-CSE-MsgGUID: hoHhi/ozQhaBunoBszT7Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="172006966"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2025 02:18:15 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvY0q-0003gt-34;
	Mon, 08 Sep 2025 09:18:12 +0000
Date: Mon, 8 Sep 2025 17:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.18-armsoc/dts64 38/48]
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: adc@ffae0000
 (rockchip,rk3528-saradc): 'power-domains' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202509081750.Tbe85f0m-lkp@intel.com>
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
TO: Jonas Karlman <jonas@kwiboo.se>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.18-armsoc/dts64
head:   42bbc32c7e9e974ae4eb830ae1381cb016133e5c
commit: 5b71b3d9aa61626d6a93ed2f761a748aa2ecfa95 [38/48] arm64: dts: rockchip: Add Radxa ROCK 2A/2F
:::::: branch date: 16 hours ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250906 (https://download.01.org/0day-ci/archive/20250908/202509081750.Tbe85f0m-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081750.Tbe85f0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509081750.Tbe85f0m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:240.6-1136.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/syscon@ff348000: failed to match any schema with compatible: ['rockchip,rk3528-pipe-phy-grf', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: adc@ffae0000 (rockchip,rk3528-saradc): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/rockchip-saradc.yaml#
   arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/phy@ffdc0000: failed to match any schema with compatible: ['rockchip,rk3528-naneng-combphy']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:240.6-1136.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/syscon@ff348000: failed to match any schema with compatible: ['rockchip,rk3528-pipe-phy-grf', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: adc@ffae0000 (rockchip,rk3528-saradc): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/rockchip-saradc.yaml#
   arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/phy@ffdc0000: failed to match any schema with compatible: ['rockchip,rk3528-naneng-combphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
