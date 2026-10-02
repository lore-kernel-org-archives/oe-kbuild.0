Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C0528726E
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 00:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790902593; cv=none; b=otq18sv4ZdvtqY6QfRf+H/+ZQJSEi9pzUsa+oBY9pCmWdIMWZa4KGluB8A4di2H0iU+XHfhhP6Lv1twVCO7u6qgkyDXju+puj7TDdGpzgxBgsRjpE2TzUhlvD31q7yX5QwpPrWXFZfhsWZC/ZlnR31hmYEFH/TXQdoY0QsYtUqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790902593; c=relaxed/simple;
	bh=ZjY0AE7cbj6j9AdjdW/g+UrOuByDEZE9542xQAZbTaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NYbn3BbDgSNJG/LJ55CsY6keQlST5G9AzeyPFfUEn/kMzSyOprOjIc7Fs8MVI4uWskcjS8Yq9e/ECohY0ZgKC3TxmnP9BfVqRdvVAV3Zt7a6Cz5XgtcOJuQPXcQ/XptI4IhHuGL8sxyUZiooYOXixb0MbFu/SwVCBaEXvHdnvvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyP75/5m; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyP75/5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790902590; x=1822438590;
  h=date:from:to:cc:subject:message-id;
  bh=ZjY0AE7cbj6j9AdjdW/g+UrOuByDEZE9542xQAZbTaU=;
  b=fyP75/5m2qMjuhbK2ibWsER2egPHLkOvK39KSGM+I1jT/1blx1/NlIYs
   6W6/VGfEJd7q6QiB5QsEJu5Gb+lqDxKowhTgcBw1qjqeLXRsNiyssdcUg
   j71yCSoFr/wa4eZHqWkPxNLyzsD0tlOniFGjyTB4eUTJE1DbaPyfTwYjW
   TMpf3UZdQz4XePGyHsDpyXOhyFpI7nvmJVsFv5Q7TF2UeGpTk+9fWUY7W
   lpF5s25I490l1CIyg0UTH8+x59iRgVITs1CjUZBANEIIOOyVky0rltPwZ
   fT4zwFJElBUb/lk3xEuGkjE+EcgfOpGnLSKJL8sWpJi7qKLAZ476peYTx
   w==;
X-CSE-ConnectionGUID: 4XrObnhvS1eeAMRZgbU7wg==
X-CSE-MsgGUID: 3iStChoiRbCk9oRbqNzT6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102348146"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="102348146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 17:56:29 -0700
X-CSE-ConnectionGUID: a8ygrzGoQFivJ5bzBllwnQ==
X-CSE-MsgGUID: D6ZCBh8WQI2pRizTHPB13g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="302388851"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2026 17:56:28 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCRZZ-000000000JP-23YE;
	Fri, 02 Oct 2026 00:56:25 +0000
Date: Fri, 02 Oct 2026 02:56:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6619/12559]
 arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80123000
 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
Message-ID: <202610020239.aKOgZK98-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: dts patches queued in parallel for SoC"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linusw@kernel.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
commit: cc47a544d4f7e4d5603af2e0d5c18fbdac5fe257 [6619/12559] ASoC: dt-bindings: sound: Prepare Ux500 audio graph links
:::::: branch date: 35 hours ago
:::::: commit date: 13 days ago
config: arm-randconfig-2404-20260923 (https://download.01.org/0day-ci/archive/20261002/202610020239.aKOgZK98-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020239.aKOgZK98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610020239.aKOgZK98-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x8e\x00\x00\x00\x8f' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x90' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x86\x00\x00\x00\x87' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x88' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-snowball.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x82\x00\x00\x00\x83' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x84' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: input_pull_down: ste,input: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x8f\x00\x00\x00\x90' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x91' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/sound: failed to match any schema with compatible: ['stericsson,snd-soc-mop500']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: sound (stericsson,snd-soc-mop500): stericsson,cpu-dai: b'\x00\x00\x00\x8f\x00\x00\x00\x90' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: sound (stericsson,snd-soc-mop500): stericsson,audio-codec: b'\x00\x00\x00\x91' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80124000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: msp@80125000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: mcde@a0350000 (ste,mcde): dsi@a0351000: Unevaluated properties are not allowed ('panel' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/ste,mcde.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: in_nopull: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: input_pull_up: ste,input: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
