Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D3714A60F
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 01:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758503777; cv=none; b=JQKm6nEqjxe2StibQsu1iUE6joiQQLxExVwgF75KHORXwR4x8oQdyi9qLh8BT0mn/anRBxbo99zB9rnYz/rj7GwK3i8LKiOyDJ6p95Uvpae6A7QcMN+8Whwg8CJf+sqUvqfib+pO/Sr90C8coHkWN++Qamqww2WDR/5sS1XRMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758503777; c=relaxed/simple;
	bh=loMpGUv4wbTiCO1+xGUJUyIq3NgbnnPpW0afpWtDm0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ts7cPY9+M+u7PNzlLGmyo7vGWj4maVfxjN7rxrz394xKv7f0Lv6iLbX5Yz+yWlrLKUloB7TzBzjxK99ps/DBjDNKjHS6WxYKNwJMS7rCikNZAg3tfV9Nk0dCJKiQa3Bez3VQmv2xnNsw4X9lB1AdNUV+8VvpOouP9z94oruUuYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9MRRiVc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9MRRiVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758503774; x=1790039774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=loMpGUv4wbTiCO1+xGUJUyIq3NgbnnPpW0afpWtDm0E=;
  b=g9MRRiVc3ZfrL10bN9zGpyuyoS7+K8gr5BkYgEPTM/3D67QYv3L2ghlM
   OqCbDgDh6bido5vcZsXhf+lKdBpj/IDbwgfgh2Li3xhjN/d/VPWbbLIl+
   HqYsbnE8RLipeUhomQ4Q6bAlaCObwq8IE5v8r/79a4MxcA7qQ8lPoAK6u
   euG03p2ir4SnK2unTYTC0woPV24RSeGSEaN5Zl0+bMEc5rLUJvJk9raFL
   hrYcDHn7X98NYlJBzxnS6xYorXk8+hfpcyM+jS5hKchHRHoRzR2sO8+r7
   9gJNu/B9wWZfOt13WUKLsrQs23QGn6FrQ63iFajMLNv7rCYmQGgPb8wAp
   A==;
X-CSE-ConnectionGUID: EsrzXcS3R6+VsCmDjs5iDw==
X-CSE-MsgGUID: zTaGzM0LQvm/lQ7+aViKBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71439581"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="71439581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 18:16:13 -0700
X-CSE-ConnectionGUID: 8O5x08BVTz+R7iDyK5FIaA==
X-CSE-MsgGUID: x0Bhtd6AQUKFK/TPPXr3Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="176169007"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Sep 2025 18:16:12 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0VA1-0001Bx-2Z;
	Mon, 22 Sep 2025 01:16:09 +0000
Date: Mon, 22 Sep 2025 09:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] ARM: dts: microchip: add I3C controller
Message-ID: <202509220838.axS5scyS-lkp@intel.com>
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
In-Reply-To: <20250918095429.232710-5-durai.manickamkr@microchip.com>
References: <20250918095429.232710-5-durai.manickamkr@microchip.com>
TO: Durai Manickam KR <durai.manickamkr@microchip.com>
TO: linux-i3c@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: alexandre.belloni@bootlin.com
TO: Frank.Li@nxp.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: balamanikandan.gunasundar@microchip.com
TO: nicolas.ferre@microchip.com
CC: Durai Manickam KR <durai.manickamkr@microchip.com>

Hi Durai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next abelloni/rtc-next linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Durai-Manickam-KR/clk-at91-sama7d65-add-peripheral-clock-for-I3C/20250918-175934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250918095429.232710-5-durai.manickamkr%40microchip.com
patch subject: [PATCH 4/4] ARM: dts: microchip: add I3C controller
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-053-20250919 (https://download.01.org/0day-ci/archive/20250922/202509220838.axS5scyS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220838.axS5scyS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509220838.axS5scyS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: i2c@600 (microchip,sama7d65-i2c): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/uddrc@e3800000: failed to match any schema with compatible: ['microchip,sama7d65-uddrc', 'microchip,sama7g5-uddrc']
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible: ['microchip,sama7d65-ddr3phy', 'microchip,sama7g5-ddr3phy'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: ddr3phy@e3804000 (microchip,sama7d65-ddr3phy): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/i3c@e9000000: failed to match any schema with compatible: ['mchp,sama7d65-i3c-hci']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
