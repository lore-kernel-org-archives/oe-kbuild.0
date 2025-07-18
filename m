Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313DA2D9ECB
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752849444; cv=none; b=H1qDRtdlluBkTIhVkdr9Ur3QylrdYUFlmxDsK2eyenibONVNYpZyPn1DmQU2ILREliHv2Q15+o4Q6nQJgz24krnCxiv6mUyuM+t5oTYGK7k9z2Vmiz/nG/jar9fanJcbK7LoD9n69R8BT8I01AlhOYO5ns6P77x/ZH3fC2Nr+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752849444; c=relaxed/simple;
	bh=IkYCBEBgiswpkLIeDK88AzinzdkJHWrVtAHXkefXUR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ixAhoQT4+v6V2u/us5l+gPW2mMCCU5kMs8b4yZDifjR+VhYyT8s6HjlLTl/4qiWSlcy7DvvpptBYfpml5zVfRgh60bZEbcYRSvTD7SjU1uekAOYzbF8UTQJ4KK1mL9sC8iMczD1PL/uwOGwp29W4+4ck+C5KVF3d57f5nUG4uF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jD14UHJv; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jD14UHJv"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56IEbGcV730712;
	Fri, 18 Jul 2025 09:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752849436;
	bh=UtWNMuh8nwqx7UmE319STXI0ZEqHC/QDLqDZ5jvpDws=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=jD14UHJvPdreev1IvFe2Efskzi5Ag2w2Jv/973Vaf44PbwN2Yj4J74zqigNOi/WHF
	 rV78eMMmkiCHrmPFFzg3VEqTcNuv9a7kz7RPGnjROB9vNw7cZUl+3DgviHe1FwYX45
	 66aGcUF4cSYPZfUpLEyMGjPwVV+z25TteYVKdRD4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56IEbGo22436459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 18 Jul 2025 09:37:16 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 18
 Jul 2025 09:37:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 18 Jul 2025 09:37:16 -0500
Received: from [10.249.35.103] ([10.249.35.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56IEbFEB3969735;
	Fri, 18 Jul 2025 09:37:15 -0500
Message-ID: <b6ea8920-baf9-4fc9-b5c8-44d5f04eeffd@ti.com>
Date: Fri, 18 Jul 2025 09:37:15 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mfd: dt-bindings: Convert TPS65910 to DT schema
To: kernel test robot <lkp@intel.com>, <oe-kbuild@lists.linux.dev>
References: <202507161400.TprGl50V-lkp@intel.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <202507161400.TprGl50V-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 7/16/2025 2:10 AM, kernel test robot wrote:
> :::::: 
> :::::: Manual check reason: "dtcheck: binding changes may go via different trees"
> :::::: 
>
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> In-Reply-To: <20250708210448.56384-1-s-ramamoorthy@ti.com>
> References: <20250708210448.56384-1-s-ramamoorthy@ti.com>
> TO: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> TO: lee@kernel.org
> TO: robh@kernel.org
> TO: krzk+dt@kernel.org
> TO: conor+dt@kernel.org
> TO: devicetree@vger.kernel.org
> TO: linux-kernel@vger.kernel.org
> CC: praneeth@ti.com
> CC: m-leonard@ti.com
> CC: rklein@nvidia.com
> CC: jm@ti.com
> CC: khilman@baylibre.com
> CC: kory.maincent@bootlin.com
> CC: thomas.petazzoni@bootlin.com
>
> Hi Shree,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on lee-mfd/for-mfd-next]
> [also build test WARNING on lee-mfd/for-mfd-fixes lee-leds/for-leds-next robh/for-next linus/master v6.16-rc5 next-20250711]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Shree-Ramamoorthy/mfd-dt-bindings-Convert-TPS65910-to-DT-schema/20250709-050706
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
> patch link:    https://lore.kernel.org/r/20250708210448.56384-1-s-ramamoorthy%40ti.com
> patch subject: [PATCH v2] mfd: dt-bindings: Convert TPS65910 to DT schema
> :::::: branch date: 7 days ago
> :::::: commit date: 7 days ago
> config: arm-randconfig-051-20250710 (https://download.01.org/0day-ci/archive/20250716/202507161400.TprGl50V-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
> dtschema version: 2025.6.2.dev4+g8f79ddd
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161400.TprGl50V-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202507161400.TprGl50V-lkp@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1154.15-1166.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm

It seems like this patch exposed that other DTS files are using this PMIC compatible incorrectly.
My game plan is to submit patches for the files that use this PMIC compatible as I have time as there are a lot of dependent files.
Any recommendations on how to best proceed? Thank you!

> /boot/dts/nvidia/tegra30-apalis-eval.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: pmic@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: touchscreen@41 (st,stmpe811): 'blocks', 'id', 'irq-gpio', 'irq-trigger', 'stmpe_adc', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: touchscreen@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: /i2c@7000d000/temp-sensor@4c: failed to match any schema with compatible: ['national,lm95245']
>    arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
> --
>    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi:49.22-55.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: pmic@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
> --
>    arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf201.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tg.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi:53.22-59.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1154.15-1166.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>    arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: rt5640@1c (realtek,rt5640): Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps65911@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps65911@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps62361@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: tps65911@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: tps65911@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: tps62361@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: tps65911@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: tps65911@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: tps62361@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1154.15-1166.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: pmic@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: touchscreen@41 (st,stmpe811): 'blocks', 'id', 'irq-gpio', 'irq-trigger', 'stmpe_adc', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: touchscreen@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: /i2c@7000d000/temp-sensor@4c: failed to match any schema with compatible: ['national,lm95245']
>    arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dtb: regulator@60 (ti,tps62362): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
> --
>    arch/arm/boot/dts/nvidia/tegra30-ouya.dts:46.22-52.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1154.15-1166.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: pmic@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: tps62361@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-ouya.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts:57.22-63.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
>    arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>>> arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>    arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
> --
>    arch/arm/boot/dts/rockchip/rk3066a.dtsi:100.18-108.5: Warning (graph_child_address): /vop@1010c000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    arch/arm/boot/dts/rockchip/rk3066a.dtsi:126.18-134.5: Warning (graph_child_address): /vop@1010e000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>>> arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
> --
>    arch/arm/boot/dts/rockchip/rk3066a.dtsi:100.18-108.5: Warning (graph_child_address): /vop@1010c000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    arch/arm/boot/dts/rockchip/rk3066a.dtsi:126.18-134.5: Warning (graph_child_address): /vop@1010e000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>>> arch/arm/boot/dts/rockchip/rk3066a-marsboard.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-marsboard.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-marsboard.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-marsboard.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-marsboard.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
> --
>    arch/arm/boot/dts/rockchip/rk3066a.dtsi:100.18-108.5: Warning (graph_child_address): /vop@1010c000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    arch/arm/boot/dts/rockchip/rk3066a.dtsi:126.18-134.5: Warning (graph_child_address): /vop@1010e000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>>> arch/arm/boot/dts/rockchip/rk3066a-rayeager.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-rayeager.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-rayeager.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-rayeager.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/rockchip/rk3066a-rayeager.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
> --
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll4_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/wkup_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/dss_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/core_l4_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/wdt@48314000: failed to match any schema with compatible: ['ti,omap3-wdt']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
>    arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: target-module@480a0000 (ti,sysc-omap2): 'clocks' is a dependency of 'clock-names'
> --
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>>> arch/arm/boot/dts/ti/omap/omap3-echo.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/omap3-echo.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/omap3-echo.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/omap3-echo.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/omap3-echo.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/mmc@480ad000/atheros@0: failed to match any schema with compatible: ['atheros,ath6kl']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/wdt@48314000: failed to match any schema with compatible: ['ti,omap3-wdt']
>    arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
> --
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: tps@2d (ti,tps65910): ti,en-ck32k-xtal: 1 is not of type 'boolean'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
>    	'clocks' is a required property
>    	'power-domains' is a required property
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
> --
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: tps@2d (ti,tps65910): ti,en-ck32k-xtal: 1 is not of type 'boolean'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
>    	'clocks' is a required property
>    	'power-domains' is a required property
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
> --
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: tps@2d (ti,tps65910): ti,en-ck32k-xtal: 1 is not of type 'boolean'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
>    	'clocks' is a required property
>    	'power-domains' is a required property
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
> --
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: tps@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-base0033.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> --
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: tps@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-evm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> --
>    arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: tps@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: lis331dlh@18 (st,lis331dlh): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: lis331dlh@18 (st,lis331dlh): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['st,lis331dlh', 'st,lis3lv02d'] is too long
>    	'st,lis331dlh' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
>    	'st,iis328dq' was expected
>    	'st,lis331dlh' is not one of ['silan,sc7a20']
>    	'st,lis331dlh' is not one of ['st,l3g4200d-gyro', 'st,l3g4is-gyro', 'st,l3gd20-gyro', 'st,l3gd20h-gyro', 'st,lsm330-gyro', 'st,lsm330d-gyro', 'st,lsm330dl-gyro', 'st,lsm330dlc-gyro', 'st,lsm9ds0-gyro']
>    	'st,lis331dlh' is not one of ['st,iis2mdc', 'st,lis2mdl', 'st,lis3mdl-magn', 'st,lsm303agr-magn', 'st,lsm303c-magn', 'st,lsm303dlh-magn', 'st,lsm303dlhc-magn', 'st,lsm303dlm-magn', 'st,lsm9ds1-magn']
> --
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: power-controller@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: power-controller@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: power-controller@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: power-controller@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: power-controller@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: power-controller@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: power-controller@2d (ti,tps65910): '#power-domain-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: tsc (ti,am3359-tsc): 'ti,wires' is a required property
>    	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: tsc (ti,am3359-tsc): 'ti,x-plate-resistance' is a required property
>    	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: tsc (ti,am3359-tsc): 'ti,coordinate-readouts' is a required property
>    	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,am3359-tsc.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: tsc (ti,am3359-tsc): 'ti,wire-config' is a required property
> --
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: tps@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> --
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: tps@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: regulator@12 (regulator-fixed): Unevaluated properties are not allowed ('reg', 'regulator-compatible' were unexpected)
>    	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: rtc_wdt@68 (dallas,ds1374): $nodename:0: 'rtc_wdt@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
>    	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
> --
>    arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: tps@2d (ti,tps65910): ti,en-ck32k-xtal: 1 is not of type 'boolean'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
>    arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
>    	'clocks' is a required property
>    	'power-domains' is a required property
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
> --
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: tps@2d (ti,tps65910): ti,en-ck32k-xtal: 1 is not of type 'boolean'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
>    	'clocks' is a required property
>    	'power-domains' is a required property
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
> --
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: tps@2d (ti,tps65910): ti,en-ck32k-xtal: 1 is not of type 'boolean'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/mmc@0: failed to match any schema with compatible: ['ti,am335-sdhci']
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
>    	'clocks' is a required property
>    	'power-domains' is a required property
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
>    	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
> --
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: serial@0 (ti,am3352-uart): Unevaluated properties are not allowed ('rts-gpio' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: tps@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: tps@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: tps@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: tps@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: tps@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: tps@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> --
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: pmic@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: pmic@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: pmic@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: pmic@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: pmic@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: pmic@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> --
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: pmic@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: pmic@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: pmic@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: pmic@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: pmic@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: pmic@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> --
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1000: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1100: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/prm@1200: failed to match any schema with compatible: ['ti,am3-prm-inst', 'ti,omap-prm-inst']
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,am3352-uart', 'ti,omap3-uart'] is too long
>    	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
>    	'ti,am654-uart' was expected
>    	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: pmic@2d (ti,tps65910): 'oneOf' conditional failed, one must be fixed:
>    	'interrupts' is a required property
>    	'interrupts-extended' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: pmic@2d (ti,tps65910): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@10', 'regulator@11', 'regulator@12', 'regulator@13', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6', 'regulator@7', 'regulator@8', 'regulator@9' do not match any of the regexes: '^(vdd[1-3]|vaux([1-2]|33)|vdig[1-2])$', '^(vrtc|vio|vpll|vdac|vmmc|vbb|vddctrl)$', '^ldo[1-8]$', '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: pmic@2d (ti,tps65910): 'interrupt-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: pmic@2d (ti,tps65910): '#interrupt-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: pmic@2d (ti,tps65910): 'gpio-controller' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>>> arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: pmic@2d (ti,tps65910): '#gpio-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: scm_conf@0 (syscon): clocks: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>    arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: scm_conf@0 (syscon): phy-gmii-sel: 'ranges' is a required property
>    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>
