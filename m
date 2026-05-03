Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5623D7DC
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 05:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777786518; cv=none; b=dwttjDfJ4n4QhXiTEzvENnoHZyj75vuro8FzxN8gU2PWs2lvV4Fteo3ApR8nCyQWIhuYa9XQLpqjsFdjMcZbGzPSZZygMO+r6vIqSRySP7jniBDuJnJ9ohSpDRHZS6e4mYXbbzwmaHhe13OqP8YR8oVk2BoGQCm84dyVkuzoJJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777786518; c=relaxed/simple;
	bh=NGkc6BXXoDt2YizXHe8uskr5auYL4RoYHCZIUlKrSVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCEkz3rI0TMOKfrwrPn0WLlR9P8zkN5T0HWbAaruuDhxOvSc0HrTVCcnWXfPGN7XoSJGiIDHmKbStUGYm7b3neDgnU26JeX6k/3Z/FR7KhdWvv2y+rRbcVkaSY1CYiyeGRFxW5kUXbWY63zQ2pn7Y5NRU2fk4vD9JSp/EcJHPyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rh+yigCw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rh+yigCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777786516; x=1809322516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGkc6BXXoDt2YizXHe8uskr5auYL4RoYHCZIUlKrSVM=;
  b=Rh+yigCwRz4Fvoj5L8MtI2J8qPc4XLafY5sCjl8EZRlaK/IE5Ni5tYsO
   04JE5sLd6f79L6AVyzfULqL2Nm8wQjU7Vq9IYNDQA95U2+hlyiTT98yuc
   nkjYXHkPcrUXDMi1UM41vLdwJA805Ga+05BC9w1zWE0bBQpmlkdLSDD3Q
   epTZqf4w2nmHjLD9dd+sx3YRtLiBR0BboVcGQPhIt+tmcLye2D7hckWrK
   gDUDod9zy3Y7wQ9aubMaZuolrfU9/vSehNpSHF3i888/HtfGVDw3iHuiP
   waHC+BxtB9ioB31LVBgpx/tT1XzX9ASNqtTR8rwJ3jcp5Fl6T1ji74Ee3
   Q==;
X-CSE-ConnectionGUID: Ah11Z5QASUWk15hV4Kqb9w==
X-CSE-MsgGUID: ONQTOhGaRBeHDx05ZvDFgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78617338"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78617338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 22:35:15 -0700
X-CSE-ConnectionGUID: pidX51SDT22Z2idDXxPf0Q==
X-CSE-MsgGUID: M7kI+i65SiOvfFnYFyKJvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="234188589"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 02 May 2026 22:35:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJPTz-000000005Sv-3ROw;
	Sun, 03 May 2026 05:35:11 +0000
Date: Sun, 3 May 2026 07:34:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] thermal: mediatek: lvts: Add MT8189 support
Message-ID: <202605030756.pnC8wk6p-lkp@intel.com>
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
In-Reply-To: <20260427065236.1685057-2-kuanfu.lu@mediatek.com>
References: <20260427065236.1685057-2-kuanfu.lu@mediatek.com>
TO: mtk36707 <kuanfu.lu@mediatek.com>
TO: "Rafael J . Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@kernel.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Balsam CHIHI <bchihi@baylibre.com>
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: jarried.lin@mediatek.com
CC: vince-wl.liu@mediatek.com
CC: justin.yeh@mediatek.com
CC: Kuanfu Lu <kuanfu.lu@mediatek.com>

Hi Kuanfu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v6.16-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mtk36707/thermal-mediatek-lvts-Add-MT8189-support/20260503-034858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20260427065236.1685057-2-kuanfu.lu%40mediatek.com
patch subject: [PATCH 2/2] thermal: mediatek: lvts: Add MT8189 support
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: openrisc-randconfig-2051-20260503 (https://download.01.org/0day-ci/archive/20260503/202605030756.pnC8wk6p-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030756.pnC8wk6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605030756.pnC8wk6p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml:99:11: [warning] wrong indentation: expected 8 but found 10 (indentation)
   Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml:119:11: [warning] wrong indentation: expected 8 but found 10 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +99 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml

498e2f7a6e69dc Balsam CHIHI     2023-02-09    8  
498e2f7a6e69dc Balsam CHIHI     2023-02-09    9  maintainers:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   10    - Balsam CHIHI <bchihi@baylibre.com>
498e2f7a6e69dc Balsam CHIHI     2023-02-09   11  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   12  description: |
498e2f7a6e69dc Balsam CHIHI     2023-02-09   13    LVTS is a thermal management architecture composed of three subsystems,
498e2f7a6e69dc Balsam CHIHI     2023-02-09   14    a Sensing device - Thermal Sensing Micro Circuit Unit (TSMCU),
498e2f7a6e69dc Balsam CHIHI     2023-02-09   15    a Converter - Low Voltage Thermal Sensor converter (LVTS), and
498e2f7a6e69dc Balsam CHIHI     2023-02-09   16    a Digital controller (LVTS_CTRL).
498e2f7a6e69dc Balsam CHIHI     2023-02-09   17  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   18  properties:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   19    compatible:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   20      enum:
aee1950f73f40c Frank Wunderlich 2025-12-23   21        - mediatek,mt7987-lvts-ap
d8b877d60d77a5 Frank Wunderlich 2023-09-22   22        - mediatek,mt7988-lvts-ap
a2ca202350f97b Nicolas Pitre    2024-04-01   23        - mediatek,mt8186-lvts
78c88534e5e1f8 Nicolas Pitre    2024-04-01   24        - mediatek,mt8188-lvts-ap
78c88534e5e1f8 Nicolas Pitre    2024-04-01   25        - mediatek,mt8188-lvts-mcu
96c58aa03a12e1 Kuanfu Lu        2026-04-27   26        - mediatek,mt8189-lvts-ap
96c58aa03a12e1 Kuanfu Lu        2026-04-27   27        - mediatek,mt8189-lvts-mcu
498e2f7a6e69dc Balsam CHIHI     2023-02-09   28        - mediatek,mt8192-lvts-ap
498e2f7a6e69dc Balsam CHIHI     2023-02-09   29        - mediatek,mt8192-lvts-mcu
498e2f7a6e69dc Balsam CHIHI     2023-02-09   30        - mediatek,mt8195-lvts-ap
498e2f7a6e69dc Balsam CHIHI     2023-02-09   31        - mediatek,mt8195-lvts-mcu
03656dc61deb01 Laura Nao        2025-11-25   32        - mediatek,mt8196-lvts-ap
03656dc61deb01 Laura Nao        2025-11-25   33        - mediatek,mt8196-lvts-mcu
498e2f7a6e69dc Balsam CHIHI     2023-02-09   34  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   35    reg:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   36      maxItems: 1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   37  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   38    interrupts:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   39      maxItems: 1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   40  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   41    clocks:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   42      maxItems: 1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   43  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   44    resets:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   45      maxItems: 1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   46      description: LVTS reset for clearing temporary data on AP/MCU.
498e2f7a6e69dc Balsam CHIHI     2023-02-09   47  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   48    nvmem-cells:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   49      minItems: 1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   50      items:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   51        - description: Calibration eFuse data 1 for LVTS
498e2f7a6e69dc Balsam CHIHI     2023-02-09   52        - description: Calibration eFuse data 2 for LVTS
498e2f7a6e69dc Balsam CHIHI     2023-02-09   53  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   54    nvmem-cell-names:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   55      minItems: 1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   56      items:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   57        - const: lvts-calib-data-1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   58        - const: lvts-calib-data-2
498e2f7a6e69dc Balsam CHIHI     2023-02-09   59  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   60    "#thermal-sensor-cells":
498e2f7a6e69dc Balsam CHIHI     2023-02-09   61      const: 1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   62  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   63  allOf:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   64    - $ref: thermal-sensor.yaml#
498e2f7a6e69dc Balsam CHIHI     2023-02-09   65  
96c58aa03a12e1 Kuanfu Lu        2026-04-27   66    - if:
96c58aa03a12e1 Kuanfu Lu        2026-04-27   67        properties:
96c58aa03a12e1 Kuanfu Lu        2026-04-27   68          compatible:
96c58aa03a12e1 Kuanfu Lu        2026-04-27   69            contains:
96c58aa03a12e1 Kuanfu Lu        2026-04-27   70              enum:
96c58aa03a12e1 Kuanfu Lu        2026-04-27   71                - mediatek,mt8189-lvts-ap
96c58aa03a12e1 Kuanfu Lu        2026-04-27   72                - mediatek,mt8189-lvts-mcu
96c58aa03a12e1 Kuanfu Lu        2026-04-27   73      then:
96c58aa03a12e1 Kuanfu Lu        2026-04-27   74        properties:
96c58aa03a12e1 Kuanfu Lu        2026-04-27   75          nvmem-cells:
96c58aa03a12e1 Kuanfu Lu        2026-04-27   76            minItems: 2
96c58aa03a12e1 Kuanfu Lu        2026-04-27   77  
96c58aa03a12e1 Kuanfu Lu        2026-04-27   78          nvmem-cell-names:
96c58aa03a12e1 Kuanfu Lu        2026-04-27   79            minItems: 2
96c58aa03a12e1 Kuanfu Lu        2026-04-27   80  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   81    - if:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   82        properties:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   83          compatible:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   84            contains:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   85              enum:
78c88534e5e1f8 Nicolas Pitre    2024-04-01   86                - mediatek,mt8188-lvts-ap
78c88534e5e1f8 Nicolas Pitre    2024-04-01   87                - mediatek,mt8188-lvts-mcu
498e2f7a6e69dc Balsam CHIHI     2023-02-09   88                - mediatek,mt8192-lvts-ap
498e2f7a6e69dc Balsam CHIHI     2023-02-09   89                - mediatek,mt8192-lvts-mcu
498e2f7a6e69dc Balsam CHIHI     2023-02-09   90      then:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   91        properties:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   92          nvmem-cells:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   93            maxItems: 1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   94  
498e2f7a6e69dc Balsam CHIHI     2023-02-09   95          nvmem-cell-names:
498e2f7a6e69dc Balsam CHIHI     2023-02-09   96            maxItems: 1
498e2f7a6e69dc Balsam CHIHI     2023-02-09   97  
96c58aa03a12e1 Kuanfu Lu        2026-04-27   98        required:
96c58aa03a12e1 Kuanfu Lu        2026-04-27  @99            - clocks
96c58aa03a12e1 Kuanfu Lu        2026-04-27  100            - resets
96c58aa03a12e1 Kuanfu Lu        2026-04-27  101  
498e2f7a6e69dc Balsam CHIHI     2023-02-09  102    - if:
498e2f7a6e69dc Balsam CHIHI     2023-02-09  103        properties:
498e2f7a6e69dc Balsam CHIHI     2023-02-09  104          compatible:
498e2f7a6e69dc Balsam CHIHI     2023-02-09  105            contains:
498e2f7a6e69dc Balsam CHIHI     2023-02-09  106              enum:
a2ca202350f97b Nicolas Pitre    2024-04-01  107                - mediatek,mt8186-lvts
498e2f7a6e69dc Balsam CHIHI     2023-02-09  108                - mediatek,mt8195-lvts-ap
498e2f7a6e69dc Balsam CHIHI     2023-02-09  109                - mediatek,mt8195-lvts-mcu
498e2f7a6e69dc Balsam CHIHI     2023-02-09  110      then:
498e2f7a6e69dc Balsam CHIHI     2023-02-09  111        properties:
498e2f7a6e69dc Balsam CHIHI     2023-02-09  112          nvmem-cells:
498e2f7a6e69dc Balsam CHIHI     2023-02-09  113            minItems: 2
498e2f7a6e69dc Balsam CHIHI     2023-02-09  114  
498e2f7a6e69dc Balsam CHIHI     2023-02-09  115          nvmem-cell-names:
498e2f7a6e69dc Balsam CHIHI     2023-02-09  116            minItems: 2
498e2f7a6e69dc Balsam CHIHI     2023-02-09  117  
96c58aa03a12e1 Kuanfu Lu        2026-04-27  118        required:
96c58aa03a12e1 Kuanfu Lu        2026-04-27  119            - clocks
96c58aa03a12e1 Kuanfu Lu        2026-04-27  120            - resets
96c58aa03a12e1 Kuanfu Lu        2026-04-27  121  
498e2f7a6e69dc Balsam CHIHI     2023-02-09  122  required:
498e2f7a6e69dc Balsam CHIHI     2023-02-09  123    - compatible
498e2f7a6e69dc Balsam CHIHI     2023-02-09  124    - reg
498e2f7a6e69dc Balsam CHIHI     2023-02-09  125    - interrupts
498e2f7a6e69dc Balsam CHIHI     2023-02-09  126    - nvmem-cells
498e2f7a6e69dc Balsam CHIHI     2023-02-09  127    - nvmem-cell-names
498e2f7a6e69dc Balsam CHIHI     2023-02-09  128  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
