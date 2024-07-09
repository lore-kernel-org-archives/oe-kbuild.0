Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF2143752
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720510514; cv=none; b=Scr5UxgY7g2cBeZHj6dAzlno9uV5kmMR5A+Ju5N/umVwejmCtLoJFO2zhp96aL4JpEcIShnibDiZJ7W/yUl3bEUFd1MZnwdgZy18igzj89hTajWhOX3GanBu2tIRHbEdwiW2ob9VvqjxszXVKzKoMEMQUNclS5Y0mA0OU6MOAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720510514; c=relaxed/simple;
	bh=HaDvJGJwlsPXwlkckW5Pv21jNBO60Bxm541nZDjYJsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tssVJS6rEqfFf8n4NZ8r6t3f6+LcvdTMUz19d3l9PWw3k0wTvZpJShCgCt9oHxA/jPhi8q+BcXY0lnEsBl/wZNEambeFFEdTgD0fok7I9kbDSJtUCTsBVTHUi2wdxC8rpvMUn5GHW/5asrwAu8ii5yQ8j/F0kmMSYadsLnPOTvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WekXKHhr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WekXKHhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720510513; x=1752046513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HaDvJGJwlsPXwlkckW5Pv21jNBO60Bxm541nZDjYJsk=;
  b=WekXKHhrolsArdUPuk83g+3wxJB+QZLfqQn13rppFTbd2s8FYnA/1c5u
   pAifq4KB10uRCQm3dcENao0+1KmcOHffj4M6jnVZI9ISEtawaxlA66rKd
   L8S3fy7NEAzb8VD1V+DEA1Tgdji99HTKV9JHVg8ym8qJQ3XKSqiEASkQq
   hvZSmr2/plTnnFgkxCLF09PSdi28Q8DduUzNUx97p7OP6LQuyJ+sHINCs
   2a9iCc+fkLFvcvTZKUiMnNzBdNu0RLC28JtUHGMy5NEnrOOOFPcJlMV8u
   ihkLwePXT6gbITsYyxCnXBZ8W7rh0aHka20RkH4AVcqN1luyRb7Ds59UD
   w==;
X-CSE-ConnectionGUID: R3fWgUBpSMWmVeCWkqImLQ==
X-CSE-MsgGUID: aFi3SvrGRHqeJFx++CHn1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28907361"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="28907361"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 00:35:12 -0700
X-CSE-ConnectionGUID: uyC3PALUSWKxx9Lp2huRbQ==
X-CSE-MsgGUID: I5uMche8QhS79Q2Vw+11Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47734602"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2024 00:35:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR5NU-000WRC-2E;
	Tue, 09 Jul 2024 07:35:08 +0000
Date: Tue, 9 Jul 2024 15:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [clk:clk-mediatek 2/9] arch/arm/boot/dts/mediatek/mt7629-rfb.dtb:
 syscon@1a100800: compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407091520.2diValhu-lkp@intel.com>
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
CC: linux-clk@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
TO: Christian Marangi <ansuelsmth@gmail.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   58c53d43142f222221e5a76a7016c4d8f3b84b97
commit: 9f7809c6a8824b7147595b3c36e633ffc81fe2ab [2/9] dt-bindings: clock: mediatek: add syscon compatible for mt7622 pciesys
:::::: branch date: 10 hours ago
:::::: commit date: 12 hours ago
config: arm-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091520.2diValhu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091520.2diValhu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091520.2diValhu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000: reg-names:0: 'eint' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000: reg-names: ['base', 'eint'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000: ephy-leds-pins:mux:groups:0: 'gphy_leds_0' is not one of ['ephy_leds', 'ephy0_led', 'ephy1_led', 'ephy2_led', 'ephy3_led', 'ephy4_led', 'wled', 'wf2g_led', 'wf5g_led']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000: ephy-leds-pins:mux:groups: ['gphy_leds_0', 'ephy_leds'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: syscon@1a000000: compatible: ['mediatek,mt7629-ssusbsys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-ssusbsys.yaml#
>> arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: syscon@1a100800: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7629-pciesys', 'syscon'] is too long
   	'mediatek,mt7622-pciesys' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml#
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: /soc/pcie@1a145000: failed to match any schema with compatible: ['mediatek,mt7629-pcie']
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: ethernet@1b100000: compatible: ['mediatek,mt7629-eth', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
