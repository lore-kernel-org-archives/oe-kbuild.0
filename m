Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92B440B6F7
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 17:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545012; cv=none; b=cgcXOhMtcOuEwS4gV5S2LaGACWBdZjttma+1l3hKI32Cyz0S0hJYtbB/UiqtEdmt6PkdiWhQOJfGk/329Drh2vWcfniVkVIZken44UkC2K78KHm5tpHx8dCeC4961786tdaBQca4XIke0a52rgog/Qqww+htF0FZZtqFjHqTQNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545012; c=relaxed/simple;
	bh=hX0sIol5WMODGAYNDmgTNt6cZLtUKHf++37apcPy59Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEcOrLAxnOcnPllp8Ploga0pLeX+Hj85dbP6f5KhpIKtPBEiKIMvrFVAN0FfXLPS1bNgkgZLYeUV01zsDYQemHI58dc3QamqwUiH5aYrPJijv5Iz+fNN8cckGpgfMnh0Eh13JSxiiutnhjseFniXoiEGX7eId0OGUoV8EM7KvFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BN9opDfH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BN9opDfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781545011; x=1813081011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hX0sIol5WMODGAYNDmgTNt6cZLtUKHf++37apcPy59Y=;
  b=BN9opDfHPxnO07EbcAkn6SI5sz5mmHmBHh8UN1T/8413qCVQ4lkMG3dI
   E5j9fTM4m7+l3LGDTHWgrxvERr+sDN0Yz9QT8fQzwh6bCm9iW/+5v8HqE
   uVV1W1H8VI5UP+jHfuqRf3+xE/RHtubJbJmf5DgJ+0i9PhIQWty7WsVUY
   t0/fMfOlHcwk8z5j6iQI43m0qGDbvhmr2gVkUgFcOomOGC8TdAzYwh6JY
   Dlo8MeSMhBgTSxQd6+l5xfH+JM9DRRUIDbSf5j0OqNdnuZ+UdAqOsLd02
   u88TXypn8uxa7UWzIVVCwGMi4PrTkn/9TMRAvgQJuKxofS8leOmA3aaJk
   w==;
X-CSE-ConnectionGUID: YPAwqz36RWS1zMnpyE1sVw==
X-CSE-MsgGUID: 27HR15ljTNuNEJvulmb5NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82192025"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82192025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 10:36:51 -0700
X-CSE-ConnectionGUID: 2fcaiwFHSGCeijknWO6krQ==
X-CSE-MsgGUID: iCEszGBMQrOqcb9PLkjWWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="246420412"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Jun 2026 10:36:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZBEt-000000004x7-0O2X;
	Mon, 15 Jun 2026 17:36:47 +0000
Date: Mon, 15 Jun 2026 19:36:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 6/6] drm/verisilicon: extend Kconfig to support
 ARCH_MA35 platforms
Message-ID: <202606151932.e0K8XuzO-lkp@intel.com>
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
In-Reply-To: <20260615065003.76661-7-a0987203069@gmail.com>
References: <20260615065003.76661-7-a0987203069@gmail.com>
TO: Joey Lu <a0987203069@gmail.com>
TO: zhengxingda@iscas.ac.cn
TO: maarten.lankhorst@linux.intel.com
TO: mripard@kernel.org
TO: tzimmermann@suse.de
TO: airlied@gmail.com
TO: simona@ffwll.ch
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: ychuang3@nuvoton.com
CC: schung@nuvoton.com
CC: yclu4@nuvoton.com
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Joey Lu <a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.1 next-20260615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-display-verisilicon-dc-generalize-for-single-output-variants/20260615-151817
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260615065003.76661-7-a0987203069%40gmail.com
patch subject: [PATCH v4 6/6] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: microblaze-randconfig-2051-20260615 (https://download.01.org/0day-ci/archive/20260615/202606151932.e0K8XuzO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606151932.e0K8XuzO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606151932.e0K8XuzO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml: properties:hisilicon,sap-dll-reg:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml: properties:hisilicon,sap-dll-reg:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/display/verisilicon,dc.yaml: allOf:0:then:properties:clocks: {'minItems': 5, 'maxItems': 5, 'items': [{'description': 'DC Core clock'}, {'description': 'DMA AXI bus clock'}, {'description': 'Configuration AHB bus clock'}, {'description': 'Pixel clock of output 0'}, {'description': 'Pixel clock of output 1'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/display/verisilicon,dc.yaml: allOf:0:then:properties:clocks: 'oneOf' conditional failed, one must be fixed:
   	False schema does not allow 5
   	[{'description': 'DC Core clock'}, {'description': 'DMA AXI bus clock'}, {'description': 'Configuration AHB bus clock'}, {'description': 'Pixel clock of output 0'}, {'description': 'Pixel clock of output 1'}] is too long
   	[{'description': 'DC Core clock'}, {'description': 'DMA AXI bus clock'}, {'description': 'Configuration AHB bus clock'}, {'description': 'Pixel clock of output 0'}, {'description': 'Pixel clock of output 1'}] is too short
   	1 was expected
   	5 is greater than the maximum of 2
   	5 is greater than the maximum of 3
   	5 is greater than the maximum of 4
   	hint: "minItems" is only needed if less than the "items" list length
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/display/verisilicon,dc.yaml: allOf:1:then:properties:clocks: {'minItems': 2, 'maxItems': 2, 'items': [{'description': 'DC Core clock'}, {'description': 'Pixel clock of output 0'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/display/verisilicon,dc.yaml: allOf:1:then:properties:clocks: 'oneOf' conditional failed, one must be fixed:
   	False schema does not allow 2
   	[{'description': 'DC Core clock'}, {'description': 'Pixel clock of output 0'}] is too long
   	[{'description': 'DC Core clock'}, {'description': 'Pixel clock of output 0'}] is too short
   	1 was expected
   	hint: "minItems" is only needed if less than the "items" list length
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/display/verisilicon,dc.yaml: properties:resets: {'minItems': 1, 'maxItems': 3, 'items': [{'description': 'DC Core reset'}, {'description': 'DMA AXI bus reset'}, {'description': 'Configuration AHB bus reset'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/display/verisilicon,dc.yaml: properties:reset-names: {'minItems': 1, 'maxItems': 3, 'items': [{'const': 'core'}, {'const': 'axi'}, {'const': 'ahb'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/display/verisilicon,dc.yaml: properties:clock-names: {'minItems': 2, 'maxItems': 5, 'items': [{'const': 'core'}, {'const': 'axi'}, {'const': 'ahb'}, {'const': 'pix0'}, {'const': 'pix1'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml: properties:st,syscfg-dlyb:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
