Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF011E25E3
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Mar 2025 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740843835; cv=none; b=BRTRZRmMNjAN6VIuTOyug6PnnHJHe7PQzcS79Bv+PovN2Dlr9QCQAleb0QeFlOw6yGMvg5+YPkb8HsLVq3ST7RRjb/dfQqx2TqJXBgjuwdApWj9l7I8ivnpGRfpH+MZI4TrudM3Ex13jFt+LYeEU/gnh405NFM3P+efw1kZZQ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740843835; c=relaxed/simple;
	bh=sANHfV9C7jxXWyugHGu4VFctlyALvlfRaNS6Q3Q0o4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RViigBmu8Phgd/bTa5myYKXaQD4mIJloFA0wZ4Ca7TBQYQKKB8DkFT5jTlhMKgzAKdSWTkvZg28R6cuXZqiHHOxv+rfKReTW+0WToGPHcu/ztzjgcBMulp47Yeh/Fs3tnpZH8LKGC1DTsu6PjJDZ/gDTcM9uHyQ8lLy7+DdLA7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITdZGY3T; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITdZGY3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740843832; x=1772379832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sANHfV9C7jxXWyugHGu4VFctlyALvlfRaNS6Q3Q0o4E=;
  b=ITdZGY3TtWgZ9e88pf1dxY/+5I3hA9amTmWK8J1jSt8pfeS1X1kwdQx7
   n5HJGLioK3CG3WOPslJRvgvA7Q+F3jheEL3CEBO8ywO4ry7twFnx2agqi
   I0sq+Z/RUi9uhlw5wQ/iBQkfp/5h3u37aV39G5z5aHmZaq7iJR9nXhZ6w
   0PJ6VJ+DK26is7AZeINbvzI1eDYMMEcFZY05eipu88H44W2zEUJlYiGfT
   ZWzfGttaVL7knpXUqj2UORbmzJHadRgv966t1ELb7Oc7q789LuOwpw/3E
   bSb9EJR+xSlqQki7HHtDpEMrFawLEINDjSbUTpVMX2+odU8VlZG2LCAHL
   A==;
X-CSE-ConnectionGUID: APAFdOAISEiLB7BgIlHlow==
X-CSE-MsgGUID: NW+IgvLdRu2v6Rv0QuWjVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45410416"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="45410416"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 07:43:50 -0800
X-CSE-ConnectionGUID: U6di1ZEfSBmC0iMrwxOJMQ==
X-CSE-MsgGUID: 3B8w2V8qT0Sr4QIoa79JUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="140831015"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2025 07:43:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toP0D-000GOS-2V;
	Sat, 01 Mar 2025 15:43:45 +0000
Date: Sat, 1 Mar 2025 23:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Message-ID: <202503012341.lFo5gyVu-lkp@intel.com>
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
In-Reply-To: <20250226130935.3029927-3-thierry.bultel.yh@bp.renesas.com>
References: <20250226130935.3029927-3-thierry.bultel.yh@bp.renesas.com>
TO: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
TO: thierry.bultel@linatsea.fr
CC: linux-renesas-soc@vger.kernel.org
CC: geert@linux-m68k.org
CC: paul.barker.ct@bp.renesas.com
CC: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus geert-renesas-devel/next linus/master v6.14-rc4 next-20250228]
[cannot apply to geert-renesas-drivers/renesas-clk]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Bultel/dt-bindings-clock-Add-cpg-for-the-Renesas-RZ-T2H-SoC/20250226-221033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250226130935.3029927-3-thierry.bultel.yh%40bp.renesas.com
patch subject: [PATCH v3 02/13] dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250301/202503012341.lFo5gyVu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503012341.lFo5gyVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503012341.lFo5gyVu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1189.12-1199.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1218.12-1228.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1247.12-1257.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1276.12-1286.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1305.12-1315.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1334.12-1344.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1363.12-1373.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1392.12-1402.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2515.12-2525.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2683.12-2693.7: Warning (graph_child_address): /soc/isp@fed30000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: Unevaluated properties are not allowed ('backlight', 'compatible', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 2992]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: Unevaluated properties are not allowed ('backlight', 'compatible', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1682.12-1692.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1710.12-1720.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1738.12-1748.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1766.12-1776.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: Unevaluated properties are not allowed ('backlight', 'compatible', 'height-mm', 'panel-timing', 'port', 'power-supply', 'width-mm' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1682.12-1692.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1710.12-1720.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1738.12-1748.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1766.12-1776.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1682.12-1692.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1710.12-1720.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1738.12-1748.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1766.12-1776.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1682.12-1692.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1710.12-1720.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1738.12-1748.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1766.12-1776.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1682.12-1692.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1710.12-1720.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1738.12-1748.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1766.12-1776.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77970-v3msk.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-v3msk.dtb: hdmi@39: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dtb: hdmi@39: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2244.12-2254.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1128.12-1138.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1157.12-1167.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1186.12-1196.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1215.12-1225.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1244.12-1254.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1273.12-1283.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1302.12-1312.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1331.12-1341.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1934.10-1944.6: Warning (graph_child_address): /soc/display@feb00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1961.12-1971.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtb: gpio@27: 'vin0_adv7612_en' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtb: vin0_adv7612_en: $nodename:0: 'vin0_adv7612_en' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 16384]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: panel: data-mapping:0: 'jeida-24' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: panel: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
   arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: panel: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
