Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5F4D535
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720649393; cv=none; b=BFFfbhdnGDSb6R33xcBnzfTvafWM9oj78yYouLX2aqQ89WyckUcB8/+Kmp/9JgW9yTuQFv4pl1uHSmNhgfNMXt/wM1vmDlo1UPoqtn0SGTL9bPGE9XWHvNYEeqAxDFls+Z1tTjczco9RAnLN2p84qAyCvSDhV/AxsZ0JYcT4cqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720649393; c=relaxed/simple;
	bh=Nl9zsZCqFEK+wDjJwORK59paRWOPA22OtQLLI6G/sU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXOfwJz566w8b2mWUDKU1xiGUU5IVbLU7cJpVzz3ML3wAqoN4amXVf0T9LjZCBwQkie+SNwzbSiZFYV+4qOxpoTatuBgvGY+w6AVjq8/eNG11G+3nDoLzBT01qHXEOCvvcza+hoSwP+fOjwlD8Rn0MPWtAiMT9hxfWMPXJfTJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AH4PzShe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AH4PzShe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720649391; x=1752185391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nl9zsZCqFEK+wDjJwORK59paRWOPA22OtQLLI6G/sU4=;
  b=AH4PzSheoxy3o8tfZdAegW7QACfR+YlLdgS8O3Qnrk0buUoReX3q4v7W
   sG/JDiBvCGXJRHeOBe8wwTZx9DuZmHvwbHSm09Y0lbxXoQ0qbjnwKX+Jb
   AGqqHpNF2nzf39/OIPfWXE5Zqk6Zee4kLyZKPVrfg+ij+qfXXkuzUFGVd
   hEL2EFvNxg6xw936W3214MFi8qznt+f9rZMe4OAPBeZrb0XVmssZNvxmf
   DGOsm4q/Hdtoa/BEKsmtCJPCkPO/pnmM0GiqLRsL4a3fnfntVLFg4v4ad
   SZsTmAeV7+ty/XYVNlF7k1JMZOQAVd6PD8ZM5NTSddY30UVUA17r3Smm9
   A==;
X-CSE-ConnectionGUID: zaQjIgXdTzeFtenektHilA==
X-CSE-MsgGUID: nZ6U0ByZSVqGAL4b7KNwsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35539460"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="35539460"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 15:09:50 -0700
X-CSE-ConnectionGUID: mhEw0cKTQDepmVIK3F9iVA==
X-CSE-MsgGUID: WtLQj67IRs2Lhpof2rsGmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53173087"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2024 15:09:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRfVS-000YLs-1a;
	Wed, 10 Jul 2024 22:09:46 +0000
Date: Thu, 11 Jul 2024 06:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-1.0.x-imx 2607/11740]
 arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb:
 /soc/i2c@e6510000/gpio@21: failed to match any schema with compatible:
 ['onnn,pca9654']
Message-ID: <202407110641.8hUP1TOb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   13ed4e83694299049a3d4449fdb61471292ef19b
commit: 5c8cf515d45b79e8a788443c1446204e742a1549 [2607/11740] MLK-19251-01 gpio: max732x: add output IO default voltage set
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110641.8hUP1TOb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110641.8hUP1TOb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110641.8hUP1TOb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e6510000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e6510000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e6510000/gpio@23: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: clock-controller@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: clock-controller@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e66d8000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: versaclock_som@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: versaclock_som@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e66e0000/gpio@70: failed to match any schema with compatible: ['nxp,pca9538']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: sound@ec500000: ports:port@0: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: sound@ec500000: ports:port@1: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e6510000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e6510000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e6510000/gpio@23: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: clock-controller@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: clock-controller@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e66d8000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: versaclock_som@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: versaclock_som@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e66e0000/gpio@70: failed to match any schema with compatible: ['nxp,pca9538']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: sound@ec500000: ports:port@0: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: sound@ec500000: ports:port@1: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1677.12-1687.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1705.12-1715.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1733.12-1743.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1761.12-1771.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e6510000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e6510000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e6510000/gpio@23: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: clock-controller@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: clock-controller@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e66d8000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: versaclock_som@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: versaclock_som@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e66e0000/gpio@70: failed to match any schema with compatible: ['nxp,pca9538']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: sound@ec500000: ports:port@0: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: sound@ec500000: ports:port@1: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1175.12-1185.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1203.12-1213.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1231.12-1241.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1259.12-1269.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1287.12-1297.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1315.12-1325.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1343.12-1353.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1371.12-1381.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2455.12-2465.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2621.12-2631.7: Warning (graph_child_address): /soc/isp@fed30000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: /soc/i2c@e6500000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: /soc/i2c@e6500000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: /soc/i2c@e6500000/gpio@23: failed to match any schema with compatible: ['onnn,pca9654']
--
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: /soc/i2c@e6500000/gpio@20: failed to match any schema with compatible: ['ti,tca9554']
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1191.12-1201.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1219.12-1229.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1247.12-1257.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1275.12-1285.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1303.12-1313.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1331.12-1341.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1359.12-1369.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1387.12-1397.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2067.12-2077.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: /soc/i2c@e6500000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: /soc/i2c@e6500000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: /soc/i2c@e6500000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
