Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8025B094
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778802847; cv=none; b=snB/zh0zvfK2+3aG7zhYyntHAP/ZAV+jVqsNhUiwLqwpyzbZ/+WCS/eUF1wRHZft3dpGhx2M6EasnUvKk/ZLkITfikua07S/BIw4LlISsZkHOjsuswoxAXnOFHIEhVtvGGjV9rrnCRWTC8f9bBB3oEIx/TUJI+Zhq/9PC6GskTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778802847; c=relaxed/simple;
	bh=d7bRwtyxjkep4xJpVT2PAv5s9RrInvye64T+5N7o9Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i+ovkRLIMX3g6Cvd7vIv29+4wXzvqKAMf5B5aBDHBnuJTueek4kfdr3vCTvyx1vdspergOMFQpBCyD24cG4/ru4fjFET0j5kA59rJvtMALwjlx63KVBIGpX370pmHsLdhjZifDu+ZC9WseBYGh9OYnYH/F/Jiv9gwgZ1N/pGbp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IP7T4BXv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IP7T4BXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778802844; x=1810338844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d7bRwtyxjkep4xJpVT2PAv5s9RrInvye64T+5N7o9Fk=;
  b=IP7T4BXvgesWgSNj/fDm90HqeTAVO13HlIeP0wrHJfv0BsUXZD9cb8i8
   AuW7dEsEv064cuJL4Dlk+tyZi1alqXjF6U30ozYhNEC75V+4CrwJVmx4F
   LX8oSQVfOs8zhf4M8HYrUaaV4N8/EXhocK1OMnRfHt15diDpnTTQOZkZV
   QNUww3BR+2KqFvT/jl5712yZ51fW6ZbtRYK4wq2m+dichOFvJPbcAdQbM
   xZCp2Psf/lEGnYTF5sGjqWv+4FzM6DKOV5/8jr4tD/vnzjDwBPUhYjBEA
   su9vzXeDIfzf6VDBJ36CQ/ilysd/7EQ1mTCJNVz9FiF3CA57J4zA39nxV
   w==;
X-CSE-ConnectionGUID: FouEwfzwTZqXQkvpXd/fFg==
X-CSE-MsgGUID: SyIntUgnR2iRy52OJuM7PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79648383"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79648383"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 16:54:04 -0700
X-CSE-ConnectionGUID: 0knQJEZiTRKOJ2X3HokamQ==
X-CSE-MsgGUID: JKzGAoIHSreQPWsIUpPtSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="262282424"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2026 16:54:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNfsO-000000008tR-2LYq;
	Thu, 14 May 2026 23:54:00 +0000
Date: Fri, 15 May 2026 01:53:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add pwm support
Message-ID: <202605150138.VZ9vtbvN-lkp@intel.com>
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
In-Reply-To: <20260511-04-k3-pwm-dts-v1-1-81fcde1871f8@kernel.org>
References: <20260511-04-k3-pwm-dts-v1-1-81fcde1871f8@kernel.org>
TO: Yixun Lan <dlan@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Yixun Lan <dlan@kernel.org>

Hi Yixun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f068b204555ad62d6a841a49feb4ea8c4f45b25c]

url:    https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/riscv-dts-spacemit-k3-Add-pwm-support/20260514-181626
base:   f068b204555ad62d6a841a49feb4ea8c4f45b25c
patch link:    https://lore.kernel.org/r/20260511-04-k3-pwm-dts-v1-1-81fcde1871f8%40kernel.org
patch subject: [PATCH] riscv: dts: spacemit: k3: Add pwm support
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: riscv-randconfig-2051-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150138.VZ9vtbvN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150138.VZ9vtbvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150138.VZ9vtbvN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a000 (spacemit,k3-pwm): clocks: [[16, 22], [16, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d401a000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a400 (spacemit,k3-pwm): clocks: [[16, 23], [16, 43]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d401a400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a800 (spacemit,k3-pwm): clocks: [[16, 24], [16, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401a800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d401a800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401ac00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401ac00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401ac00 (spacemit,k3-pwm): clocks: [[16, 25], [16, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401ac00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d401ac00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b000 (spacemit,k3-pwm): clocks: [[16, 26], [16, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d401b000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b400 (spacemit,k3-pwm): clocks: [[16, 27], [16, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d401b400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b800 (spacemit,k3-pwm): clocks: [[16, 28], [16, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401b800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d401b800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401bc00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401bc00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401bc00 (spacemit,k3-pwm): clocks: [[16, 29], [16, 49]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d401bc00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d401bc00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020000 (spacemit,k3-pwm): clocks: [[16, 30], [16, 50]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4020000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020400 (spacemit,k3-pwm): clocks: [[16, 31], [16, 51]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4020400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020800 (spacemit,k3-pwm): clocks: [[16, 32], [16, 52]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4020800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020c00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020c00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020c00 (spacemit,k3-pwm): clocks: [[16, 33], [16, 53]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4020c00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4020c00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021000 (spacemit,k3-pwm): clocks: [[16, 34], [16, 54]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4021000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021400 (spacemit,k3-pwm): clocks: [[16, 35], [16, 55]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4021400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021800 (spacemit,k3-pwm): clocks: [[16, 36], [16, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4021800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021c00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021c00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021c00 (spacemit,k3-pwm): clocks: [[16, 37], [16, 57]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4021c00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4021c00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022000 (spacemit,k3-pwm): clocks: [[16, 38], [16, 58]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4022000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022400 (spacemit,k3-pwm): clocks: [[16, 39], [16, 59]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4022400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022800 (spacemit,k3-pwm): clocks: [[16, 40], [16, 60]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4022800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022c00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022c00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022c00 (spacemit,k3-pwm): clocks: [[16, 41], [16, 61]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: pwm@d4022c00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dtb: /soc/pwm@d4022c00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
--
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a000 (spacemit,k3-pwm): clocks: [[20, 22], [20, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d401a000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a400 (spacemit,k3-pwm): clocks: [[20, 23], [20, 43]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d401a400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a800 (spacemit,k3-pwm): clocks: [[20, 24], [20, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401a800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d401a800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401ac00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401ac00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401ac00 (spacemit,k3-pwm): clocks: [[20, 25], [20, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401ac00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d401ac00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b000 (spacemit,k3-pwm): clocks: [[20, 26], [20, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d401b000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b400 (spacemit,k3-pwm): clocks: [[20, 27], [20, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d401b400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b800 (spacemit,k3-pwm): clocks: [[20, 28], [20, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401b800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d401b800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401bc00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401bc00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401bc00 (spacemit,k3-pwm): clocks: [[20, 29], [20, 49]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d401bc00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d401bc00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020000 (spacemit,k3-pwm): clocks: [[20, 30], [20, 50]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4020000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020400 (spacemit,k3-pwm): clocks: [[20, 31], [20, 51]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4020400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020800 (spacemit,k3-pwm): clocks: [[20, 32], [20, 52]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4020800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020c00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020c00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020c00 (spacemit,k3-pwm): clocks: [[20, 33], [20, 53]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4020c00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4020c00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021000 (spacemit,k3-pwm): clocks: [[20, 34], [20, 54]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4021000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021400 (spacemit,k3-pwm): clocks: [[20, 35], [20, 55]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4021400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021800 (spacemit,k3-pwm): clocks: [[20, 36], [20, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4021800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021c00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021c00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021c00 (spacemit,k3-pwm): clocks: [[20, 37], [20, 57]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4021c00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4021c00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022000 (spacemit,k3-pwm): clocks: [[20, 38], [20, 58]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4022000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022400 (spacemit,k3-pwm): clocks: [[20, 39], [20, 59]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4022400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022800 (spacemit,k3-pwm): clocks: [[20, 40], [20, 60]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4022800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022c00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022c00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022c00 (spacemit,k3-pwm): clocks: [[20, 41], [20, 61]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: pwm@d4022c00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/pwm@d4022c00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
