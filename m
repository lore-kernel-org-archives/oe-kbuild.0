Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771445979
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720117549; cv=none; b=oUYuTQ6lXIIyoCJOd0I3gjiHXqsFOtFKFtlZ0s3v5W90/j0c5An7QK2M0wvQfD2puH+LO185uC7trF3VvMrM2WaExWW19OQTKC+SPuErfjFCekAx6F250ECK9v7F1wKGKlb637UF4MQevC3gf0vWSZZeHhYUzOPCZzyaePhlBE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720117549; c=relaxed/simple;
	bh=HPc7u/ZnxIYmQ538tQYMn7jJymlhBb1op+1mRB5kpFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdrRYFtnWT5YXuImK7dB+Bb6VH0dM5Sm2jPpnnjdrbgeDOMWGBSTr9ASV37fjxlk8/PTN0oG3Ux1+a5+/lSK+P34C+tGmYJKSxsuwnl7QEkG/XYK3R5V4A+7k4rRBBRrQ5XFuCGcL4GngwL/foAl2TG6JWpIXg2XtuB8ZIN5koI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8zR0j1J; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8zR0j1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720117548; x=1751653548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPc7u/ZnxIYmQ538tQYMn7jJymlhBb1op+1mRB5kpFE=;
  b=e8zR0j1JAv18ts0tez4pyzXH7swLQJaDeqIehLAixvvo6CChrqLLG4TI
   FF1QeEisgUHAezrrIFWE9Kk4LLL9TESiNx0naSjGwR+mbbttPcrBVY+m3
   Pd7zKWt+ELktGg03F32jdidKS3fOww/8iqe3y4oGJYJzPl6t6Plpn469A
   N+lxOaxmibRuLGh3hp/C4OJwdm8PYcwnRtANyIjjNZ3ykXpylGFjucpzg
   Puy2uWLFDfQFQfRtn4gsDQlaBLZUO42rZrCxV1Pb1PGqZOzl4Qn+Sv9If
   H0VLpChABtO3iR44ZFGHjdGo22s/pa59lFIb7oyohIQSWGAG5dJCIzQA2
   Q==;
X-CSE-ConnectionGUID: 3XVKwzuiQpSWzEVx/Rfdfw==
X-CSE-MsgGUID: Aqio6sQWTZ6fnh261vqjFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="39925046"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39925046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 11:25:47 -0700
X-CSE-ConnectionGUID: WYOIutzmR9C8SGnkIuJXtA==
X-CSE-MsgGUID: RHzm9UVvQei8Ttm2bEyPag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46598113"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2024 11:25:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPR9L-000RJW-0V;
	Thu, 04 Jul 2024 18:25:43 +0000
Date: Fri, 5 Jul 2024 02:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:renesas-bsp/v6.1.96-2024-07-04 2/733]
 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb:
 /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with
 compatible: ['realtek,rt5682s']
Message-ID: <202407050239.vmP3rlYj-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.96-2024-07-04
head:   1b9709202bfb34b00fdd8afb116f0da23b15bc2d
commit: b90504837393e1d7a4d322c030aee06aee13cd43 [2/733] ASoC: dt-bindings: Reference common DAI properties
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-051-20240704 (https://download.01.org/0day-ci/archive/20240705/202407050239.vmP3rlYj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050239.vmP3rlYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407050239.vmP3rlYj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: soc@0: opp-table-qspi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682s']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi5-cs-gpio: {'pinmux': {'pins': ['gpio25', 'gpio26', 'gpio27'], 'function': ['qup05']}, 'pinmux-cs': {'pins': ['gpio28'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb: pinctrl@3500000: qup-spi6-cs-gpio: {'phandle': [[93]], 'pinmux': {'pins': ['gpio59', 'gpio60', 'gpio61'], 'function': ['qup10']}, 'pinmux-cs': {'pins': ['gpio62'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio59', 'gpio60', 'gpio61', 'gpio62'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: soc@0: opp-table-qspi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682s']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi5-cs-gpio: {'pinmux': {'pins': ['gpio25', 'gpio26', 'gpio27'], 'function': ['qup05']}, 'pinmux-cs': {'pins': ['gpio28'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb: pinctrl@3500000: qup-spi6-cs-gpio: {'phandle': [[92]], 'pinmux': {'pins': ['gpio59', 'gpio60', 'gpio61'], 'function': ['qup10']}, 'pinmux-cs': {'pins': ['gpio62'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio59', 'gpio60', 'gpio61', 'gpio62'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: soc@0: opp-table-qspi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682s']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi5-cs-gpio: {'pinmux': {'pins': ['gpio25', 'gpio26', 'gpio27'], 'function': ['qup05']}, 'pinmux-cs': {'pins': ['gpio28'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: pinctrl@3500000: qup-spi6-cs-gpio: {'phandle': [[84]], 'pinmux': {'pins': ['gpio59', 'gpio60', 'gpio61'], 'function': ['qup10']}, 'pinmux-cs': {'pins': ['gpio62'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio59', 'gpio60', 'gpio61', 'gpio62'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: opp-table-qup: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: soc@0: opp-table-qspi: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/geniqup@8c0000/spi@880000/tpm@0: failed to match any schema with compatible: ['google,cr50']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: bluetooth: 'qcom,local-bd-address-broken' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: proximity@28: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
>> arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: /soc@0/geniqup@ac0000/i2c@a8c000/codec@1a: failed to match any schema with compatible: ['realtek,rt5682s']
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi0-cs-gpio: {'phandle': [[52]], 'pinmux': {'pins': ['gpio34', 'gpio35', 'gpio36'], 'function': ['qup00']}, 'pinmux-cs': {'pins': ['gpio37'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio34', 'gpio35', 'gpio36', 'gpio37'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi1-cs-gpio: {'pinmux': {'pins': ['gpio0', 'gpio1', 'gpio2'], 'function': ['qup01']}, 'pinmux-cs': {'pins': ['gpio3'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi3-cs-gpio: {'pinmux': {'pins': ['gpio38', 'gpio39', 'gpio40'], 'function': ['qup03']}, 'pinmux-cs': {'pins': ['gpio41'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi5-cs-gpio: {'pinmux': {'pins': ['gpio25', 'gpio26', 'gpio27'], 'function': ['qup05']}, 'pinmux-cs': {'pins': ['gpio28'], 'function': ['gpio']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: pinctrl@3500000: qup-spi6-cs-gpio: {'phandle': [[84]], 'pinmux': {'pins': ['gpio59', 'gpio60', 'gpio61'], 'function': ['qup10']}, 'pinmux-cs': {'pins': ['gpio62'], 'function': ['gpio']}, 'pinconf': {'pins': ['gpio59', 'gpio60', 'gpio61', 'gpio62'], 'drive-strength': [[2]], 'bias-disable': True}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
