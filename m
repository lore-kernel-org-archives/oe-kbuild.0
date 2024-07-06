Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED40132492
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720272175; cv=none; b=J05Mlt3Z7jQOKXHxZSvIUev32YhwhZjfIDvnZeRw9JcQlFJoVl1h9aq+j+c0l+tQlvnrTcceOp5NmcHfvJHGFRoDZPLzmWWh+L/gE6cHULM7CTsqvWWmkaothbf5ZEpf1NnbJoAqEJORzHg+q9MRx5xodDo/xP8qgxW6jb2BDu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720272175; c=relaxed/simple;
	bh=95bIMxSU5n6y+kAjqsuMuFMhEtQXOZm2/u2l1H3cZpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxvBfYa9BdVZ0FoK3C6DsyteWW6hQrR4AbKSt64oqBrpMZoJuZ+NH9FqQ+Ds39UvHu5x7eLlPdTg/g5Cz6W4oTaom7BMsE0iU+7LyT9MThdIzd8v196OtT7irw06O3M2DyftkKQihtzk2TY9tm6PkvdqaRtgYxzLoAHcgPAQ1ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iq3r0kYu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iq3r0kYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720272171; x=1751808171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=95bIMxSU5n6y+kAjqsuMuFMhEtQXOZm2/u2l1H3cZpE=;
  b=iq3r0kYufHaIj7moTzPb8GA7UuUCpYcvkf/GRHPU5h7Me9tc4gyQbRpd
   MsVDaNEO9cq5tppwqE6bxg38ynUgMjS5QfqX/o2fqnT+vVWODCay+P7tq
   48g5G2fYLuWdZPM03Z8EZ0Q3CBJsUVTQOFqghHRklNmYxGM45zJJ4ONnC
   cjAoeYA/LcDz+olYkFXTJyPb1RN5m0qwTNnEiUo0l8QIaeBlZ4JwS+unY
   8+QEzaBDeJlD+s5G/08+yky3cTbitL3AC0JW5s/iwwSwhXluRL4XzlzQG
   DAuvEA/t2D8A6KFPGjiqUCEU4nojcH6sJOIQUDsmzsqmYmelqcaQCbKgS
   Q==;
X-CSE-ConnectionGUID: Ltd5zt3iTqaBx0BZXVjVGg==
X-CSE-MsgGUID: wmJsQV7SQ525uxQLGAQUfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28924236"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="28924236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:22:50 -0700
X-CSE-ConnectionGUID: +TC2RbvSSF2e64gIJMe47w==
X-CSE-MsgGUID: 8LWE7HiHQCmhNiEfX5rAlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="70277772"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2024 06:22:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ5NG-000TpA-1w;
	Sat, 06 Jul 2024 13:22:46 +0000
Date: Sat, 6 Jul 2024 21:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 138/187]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a: Unevaluated properties
 are not allowed ('SDZ-supply', 'compatible' were unexpected)
Message-ID: <202407062124.CCrEZLFV-lkp@intel.com>
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
TO: James Calligeros <jcalligeros99@gmail.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: c40308be533a638e7b79e2ca0a7abebb8eb5ee1f [138/187] arm64: dts: apple: describe shared SDZ GPIO for tas2764
:::::: branch date: 3 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240706/202407062124.CCrEZLFV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407062124.CCrEZLFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407062124.CCrEZLFV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b044000/codec@3a: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b04c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b04c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6000', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6000', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6000-isp', 'apple,isp']
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b044000/codec@3a: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b04c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b04c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6001', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6001', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6000-isp', 'apple,isp']
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b044000/codec@3a: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b04c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b04c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6000', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6000', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6000-isp', 'apple,isp']
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b044000/codec@3a: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b04c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b04c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6001', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6001', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/isp@384000000: failed to match any schema with compatible: ['apple,t6000-isp', 'apple,isp']
--
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j415', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j415', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@235014000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@235014000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@235014000/codec@3a: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@23501c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@23501c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@23501c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/i2c@23501c000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000: power-controller@2c0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000: power-controller@2c8: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j493', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j493', 'apple,panel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@235014000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@235014000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@23501c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@23501c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@23501c000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000/touchbar@0: failed to match any schema with compatible: ['apple,j493-touchbar', 'apple,z2-touchbar', 'apple,z2-multitouch']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000/touchbar@0: failed to match any schema with compatible: ['apple,j493-touchbar', 'apple,z2-touchbar', 'apple,z2-multitouch']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000/touchbar@0: failed to match any schema with compatible: ['apple,j493-touchbar', 'apple,z2-touchbar', 'apple,z2-multitouch']
--
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b044000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b044000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3a: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3a: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3a: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b044000/codec@3a: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b04c000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3d: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b04c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b04c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b050000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b054000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b044000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b044000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3a: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3a: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3a: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b044000/codec@3a: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b04c000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3d: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b04c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b04c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b050000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b054000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b044000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b044000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3a: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3a: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3a: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b044000/codec@3a: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b04c000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3d: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b04c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b04c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b050000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b054000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b044000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b044000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3a: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3a: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3a: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b044000/codec@3a: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@38: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@39: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b048000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b048000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b04c000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b04c000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3d: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3b: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-force-zero-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b04c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3c: Unevaluated properties are not allowed ('SDZ-supply', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b04c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b050000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b054000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,spi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
