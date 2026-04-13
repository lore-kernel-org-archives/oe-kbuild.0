Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3789F495E5
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 00:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776039100; cv=none; b=b7Hja/Mfc1qw3VRwpTW4fxp9mkSv4agGxJU9vwFBlfKEodNgc9r0OeRFGzfD99VLiWvfiFlyYj761yPNZaac7wcQxmd9TeL8sG0XUcWmU36beHnOThNNZXlFLXeD8PflBdkTfY8/yzO2ofJ6Q47n9VtI+w2zI32rZ4msGpKqhoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776039100; c=relaxed/simple;
	bh=p+RuAS4rp7O9WwLO9p1NL7arjthXPC1E6p1V+YOWdvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kmpCQu0OVeGjOm4PYz8QixBuwFGIKwAg+sJYxSL4p7yOYoM75vANQW29/z/r7wrQPyMHnqN1xxVTmlxTi9iRZELnRcfi3p5J73v5vQWrInLoizI7r4YD8yHjCN4AZY7pYgYmrFBjpJhdcNT8ZPKf7R9EKa65ysvqL/+4ie61bSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeWWjBcw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeWWjBcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776039098; x=1807575098;
  h=date:from:to:cc:subject:message-id;
  bh=p+RuAS4rp7O9WwLO9p1NL7arjthXPC1E6p1V+YOWdvo=;
  b=GeWWjBcwu3HYns8kvXXgYorwrcM6uq5dYqe8Z+O0G3nZAEfVQKwMvWMB
   +yHlFFJr599jlQ3acJ2qXfRd4sHn8hoSZlKxYOcMBkOZqXKxIVPvXSX+V
   U/bKThoFz3ddaVAyhOs2ieH3w6JX+O4HRbS8MoqjKTdStLlE3CVxgt2vL
   UxNGt1cGPe6CsXfSymQ+T0qC2mA9MHpHmdZyS6+7j35p+7aEBrTCj6Lz+
   MV1QS/2ab100vT5nehh+O+4pRztYwgDeJl0P1Xh0meMxN5TCuAtvWM97t
   qVRLEF5zRWLalc1yWjeBMfm2JzBEhAnGHLaAn2YmUIZkI4xUnn3v/UnMX
   g==;
X-CSE-ConnectionGUID: 9QD8SIWCS+2E6wnA8AomlQ==
X-CSE-MsgGUID: dEmOWqx9Rquq5CJvmyCIew==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="102430999"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="102430999"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 17:11:37 -0700
X-CSE-ConnectionGUID: bA31uRfgQU6Y4Xdy80gq3A==
X-CSE-MsgGUID: yYefsZkfQfej2SmrAugkcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="226931881"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 12 Apr 2026 17:11:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wC4tq-00000000BNv-0P6x;
	Mon, 13 Apr 2026 00:11:34 +0000
Date: Mon, 13 Apr 2026 02:10:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 28/28]
 arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: sram@0 (mmio-sram):
 pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the
 given schema
Message-ID: <202604130233.ufVVHQjx-lkp@intel.com>
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
TO: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   738dd185d3e447e1dfa65b5287730fef456089bf
commit: 738dd185d3e447e1dfa65b5287730fef456089bf [28/28] dt-bindings: sram: Allow multiple-word prefixes to sram subnode
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20260411 (https://download.01.org/0day-ci/archive/20260413/202604130233.ufVVHQjx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130233.ufVVHQjx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604130233.ufVVHQjx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@47900000/spi@0/flash@0: failed to match any schema with compatible: ['mx66l51235l']
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: display (osddisplays,osd070t1718-19ts): compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: display (osddisplays,osd070t1718-19ts): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
--
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
>> arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
--
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: display (osddisplays,osd070t1718-19ts): compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: display (osddisplays,osd070t1718-19ts): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
--
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@47900000/spi@0/flash@0: failed to match any schema with compatible: ['mx66l51235l']
>> arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
--
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
>> arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: display (startek,startek-kd050c): enable-gpios: [[122, 14, 0], [123, 28, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/startek,startek-kd050c.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: display (startek,startek-kd050c): port:endpoint: Unevaluated properties are not allowed ('data-lines' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/startek,startek-kd050c.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: display (startek,startek-kd050c): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/startek,startek-kd050c.yaml
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: display (startek,startek-kd050c): enable-gpios: [[122, 14, 0], [123, 28, 0]] is too long
--
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@47900000/spi@0/flash@0: failed to match any schema with compatible: ['mx66l51235l']
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: display (newhaven,nhd-4.3-480272ef-atxl): compatible: ['newhaven,nhd-4.3-480272ef-atxl', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: display (newhaven,nhd-4.3-480272ef-atxl): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
