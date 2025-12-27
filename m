Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBFB1DA55
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766854365; cv=none; b=ebcdkq4BPobPyxF/LUkwB6p491DUgL5NF+Cg6b6APjHWxg996WUhDdBaY433BB3stYFGLTjLd27SHIprtIhdXldXB436vn8vR3twDKRyR5NGmmraE5vUOGyMAGo/XGld/GLzi8ihLnBsH2QJP42vdNimBJXzlIvTVB2br67FjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766854365; c=relaxed/simple;
	bh=emoRYxJEraCj1g2ZYtZMMXvpomvrxH7cvcpkqiFIorE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oY3uMs7GFwTW6zgOSZuEnxjjc9bX6fQ8QQFMMmNcZjxjSnsl+0wQ++zIaE9BuEo83rt3cqqIw9JJUVpn9TN1DzgWXsi4lXTwOjdFMailFokl3AY6jXkwnyb2kNtIHu3EPileXavoruA0sDt2ffJ+6L4mpHDwvRT7qEUBJdGN+Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcefwxnX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcefwxnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766854363; x=1798390363;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=emoRYxJEraCj1g2ZYtZMMXvpomvrxH7cvcpkqiFIorE=;
  b=mcefwxnXZC+ujk098n/mmo+u8Xtou/2nschSGv2mnkvSNCu7WfUCtl0p
   jyw+c+TXrmipW87zgg6DOA5HYgyUD7DMDCBq2ZzFwM2ykSGcbgZgqaR0B
   AHuiImOEmJ9CAlZ3L2whLM7g7JwbjXbNgnOS2TdeK4DazhgZrg/cjS+st
   zN6YXQ5hnMuw/1fN5/PGtAL0FIdsn65lZyunxF1SM+gio9itqd4DPDrAY
   wCAmY5l6meyu2SPd+AUTeC7qUTUPGqS/V/yOWBTNUTdD5RCHipzCITlSE
   NkvZibg+4MEDXT0ZhhkQ2/Zx3BADbbctyIeEoPUd8YpAigq2hCEzkmh/W
   w==;
X-CSE-ConnectionGUID: /rP1PC0xRU61DppQbm8xfQ==
X-CSE-MsgGUID: 1US7+nBFQjGrwrsEz+nMBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68303624"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68303624"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 08:52:42 -0800
X-CSE-ConnectionGUID: 5XtXU8mXStyLkanO4gQPTQ==
X-CSE-MsgGUID: hdgG9fUmTH6hS3AoKgT7EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205061095"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2025 08:52:41 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZXWw-000000007Ee-2X8F;
	Sat, 27 Dec 2025 16:52:38 +0000
Date: Sat, 27 Dec 2025 17:51:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 26/128]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l):
 Unevaluated properties are not allowed ('ti,sdout-zero-fill' was unexpected)
Message-ID: <202512271721.OhZCWD4M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: ffa9a2cdd88ecf105f265f98776f925b24f016ec [26/128] arm64: dts: apple: t8103*: Put in audio nodes
:::::: branch date: 5 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251227/202512271721.OhZCWD4M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271721.OhZCWD4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512271721.OhZCWD4M-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_address_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_address_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:105.14-114.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:116.14-125.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('ti,sdout-zero-fill' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VL-supply' is a required property
--
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_address_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_address_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:237.14-247.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:249.14-258.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:488.26-492.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no', 'ti,sdout-pull-down' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VL-supply' is a required property
--
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_address_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_address_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:133.14-142.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:144.14-153.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
