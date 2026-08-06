Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F6E41C302
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005765; cv=none; b=QUKwFfRsIijm1kf6RRf1khtkRigjqdHbqNcZi1x0EjnhgREgonB1wvaGUeSTblluMR9YoJN5cvHM0OA+kixEkTNVGNOXpUus7DeaCTBHaGanR0sqayQN2OmGhXb8NfQu1ZQmdQoxH9ckZK/YjWozmZq0zS8lPxsbtT+ePMRH5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005765; c=relaxed/simple;
	bh=4QmUlhsnmzz38BKaMuWTAOBnRYtV9+PM6llfW4SWAZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BeyimyFOnDFaKmmNYkOE/st6FdYkB7eiZICUlthVZKT1HDIYhYCG151Ch1THuyrDpWng42vW8g8ovRii7HrKKk89pjx6MfHuOwtmh/b99tS0VVe+WaRUnUUYJ4UlMAVWtnt8jsmytTF8OMpB268fJUAI/gd2qQMVadAqIuknIaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdvDUpzL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdvDUpzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786005764; x=1817541764;
  h=date:from:to:cc:subject:message-id;
  bh=4QmUlhsnmzz38BKaMuWTAOBnRYtV9+PM6llfW4SWAZw=;
  b=IdvDUpzL35Ba9wBJ6n5Y5fDRGYLneg2ELW8B7/rTqlDnvzC6tAuKTzUe
   tTDP6cuK82+lK2T9VsEDIs/kJpN4aGVmCUb3+6vOpsMFHppqN9lk3vcwT
   G/dzXULj/CwLcKWtWlTnYnhuy8i1r0sWwx2/f2mUWXOvcj76BvJm/1S8k
   72sy1bfNcLMMB7nG52/8XuunQk7JLU7dtjJ/vwQdLLiaOoFmdN63Dp/YT
   BYcGOzt2+G3arAXiPPwOhtG3zMiaj9upYg5Upz1VY01W5DnX7VsPj/igi
   qS+q/YL0+L0P6ACUYtFnGANWEs0Q75+0/ApgAKU60cvHGxXltM7uWmNoY
   A==;
X-CSE-ConnectionGUID: nOnFwfjSQq+KIbPvyiPZ2A==
X-CSE-MsgGUID: WYkxAKRTRGyO30rZJsSAZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97953850"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97953850"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 01:42:43 -0700
X-CSE-ConnectionGUID: HnzyLdOASQm4jcJojGtnmA==
X-CSE-MsgGUID: 3rPxDZU/RF2Rcd6R09HyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="264035142"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2026 01:42:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrtgW-000000004b8-2A1B;
	Thu, 06 Aug 2026 08:42:40 +0000
Date: Thu, 06 Aug 2026 10:42:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: /
 (lenovo,thinkedge-se70): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202608061031.d4iuWUxI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiqi Li <lijq9@lenovo.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jiqi-Li/arm64-tegra-Add-Lenovo-ThinkEdge-SE70-carrier-board-DTS/20260804-222550
head:   6bfc748b9093e8c55041e45a8c49fc55c1c7588c
commit: 6bfc748b9093e8c55041e45a8c49fc55c1c7588c arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2054-20260805 (https://download.01.org/0day-ci/archive/20260806/202608061031.d4iuWUxI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061031.d4iuWUxI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608061031.d4iuWUxI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:115.14-118.4: Warning (unit_address_vs_reg): /i2c@3160000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:121.16-129.4: Warning (unit_address_vs_reg): /sdhci@3440000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:138.21-140.4: Warning (unit_address_vs_reg): /tachometer@39c0000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:141.14-143.4: Warning (unit_address_vs_reg): /pwm@c340000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:144.14-146.4: Warning (unit_address_vs_reg): /pwm@3280000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:147.14-149.4: Warning (unit_address_vs_reg): /pwm@32c0000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:150.14-152.4: Warning (unit_address_vs_reg): /pwm@32d0000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:153.14-155.4: Warning (unit_address_vs_reg): /pwm@32f0000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:161.14-163.4: Warning (unit_address_vs_reg): /spi@3210000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts:164.14-166.4: Warning (unit_address_vs_reg): /spi@3230000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: / (lenovo,thinkedge-se70): compatible: 'oneOf' conditional failed, one must be fixed:
   	['lenovo,thinkedge-se70', 'nvidia,p3509-0000+p3668-0001', 'nvidia,tegra194'] is too long
   	['lenovo,thinkedge-se70', 'nvidia,p3509-0000+p3668-0001', 'nvidia,tegra194'] is too short
   	'lenovo,thinkedge-se70' is not one of ['compal,paz00', 'compulab,trimslice', 'nvidia,harmony', 'nvidia,seaboard', 'nvidia,ventana']
   	'lenovo,thinkedge-se70' is not one of ['ad,medcom-wide', 'ad,plutux', 'ad,tec']
   	'lenovo,thinkedge-se70' is not one of ['toradex,colibri_t20-eval-v3', 'toradex,colibri_t20-iris']
   	'lenovo,thinkedge-se70' is not one of ['asus,sl101', 'asus,tf101', 'asus,tf101g']
   	'acer,picasso' was expected
   	'lenovo,thinkedge-se70' is not one of ['nvidia,beaver']
   	'lenovo,thinkedge-se70' is not one of ['nvidia,cardhu-a02', 'nvidia,cardhu-a04']
   	'asus,p1801-t' was expected
--
   	'nvidia,p3701-0008' was expected
   	'nvidia,p3834-0008' was expected
   	'toradex,apalis_t30-v1.1' was expected
   	'toradex,apalis-tk1-v1.2' was expected
   	'google,nyan-big-rev5' was expected
   	'google,nyan-blaze-rev8' was expected
   	'google,nyan-big-rev8' was expected
   	'google,smaug-rev6' was expected
   	'nvidia,tegra264' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: / (lenovo,thinkedge-se70): pinmux@c302000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: / (lenovo,thinkedge-se70): pinmux@2430028: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: / (lenovo,thinkedge-se70): pinmux@2430000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: / (lenovo,thinkedge-se70): i2c@3160000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: / (lenovo,thinkedge-se70): sdhci@3440000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: pmic@3c (maxim,max20024): regulators: 'in-sd4-supply', 'sd4' do not match any of the regexes: '^(sd[0-3]|ldo[0-8])$', '^in-(sd[0-3]|ldo(0-1|2|3-5|4-6|7-8))-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
