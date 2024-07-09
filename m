Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6215C84DF5
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 04:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720499468; cv=none; b=VGEtHnhPHMi4ZHoocfvrezUWXhluXlUddNklu6zeW27xdfm/D0CIonisC3l0f6APuaI8F5EI78AbTvrdSaEbsuNOpg+3lYIfOy1j4aGI8zFJZHmtBm5du9mkHS8+3wH5a09+i3KlBoZbnqX1xnUszjdUm3l1aBAqo0Acl87bo/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720499468; c=relaxed/simple;
	bh=Vyle5hiVhTr4Z6x7ZdJS9GoAQTMCLbd1dOU8THzM2ko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WOfJY8KKiQ8eKRXsNYXnwaWSYQuWkWBrzsjjt5XBIFo6Hxdix+GP5ORLm0L38UWXKZSkpDbB8pqOSvteZfqDrm6Y6QELFPyL2pivcQ36vQxqUK5zaZsZsRraIPUg175QjTNkyQJ6qylQWbkV0UA5KhZt99tjdjhl4OVsw560RdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOUgOEvY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOUgOEvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720499465; x=1752035465;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Vyle5hiVhTr4Z6x7ZdJS9GoAQTMCLbd1dOU8THzM2ko=;
  b=WOUgOEvYliHfpgsqRGp14DV/50OAeax+IpBxoQJYaReuIO5+QNFE76WV
   Bi+t5ys3qqrHA7rSlyxZUhvdtV5/VnVnS8YRdLNlqxcu+wqF38HVmirwj
   JQEgW+CiKKygA0uWtdKKcLaThT7rgvoUSW63N4lkMEogpW6sQNZdTxdEl
   oOReYlE11V1GSk23IkRnOtU93LnnN61rrQNIKedfDf3n3wR1/eN9O/tys
   zaII8FnC6s6M3KrpEsSEy0kT776p+8g4aHIDZShvgaZnbwpBnJ/WpLJI+
   bH0AMX7Vw1LEP7S9468mpv1Yw3+K6GliAB5Xz/+uxnWwdXaMuV8RUgGQw
   Q==;
X-CSE-ConnectionGUID: 2WjQvKDgQUeinSy0V2bqUg==
X-CSE-MsgGUID: DzYc/7qQQkSy9qqTg5EVQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28330311"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="28330311"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 21:31:04 -0700
X-CSE-ConnectionGUID: rHVyyJtlTc6tlBHCBHTRhQ==
X-CSE-MsgGUID: UgImle5sS6OnYGq/Dt0gcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47687275"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2024 21:31:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR2VI-000WJi-2z;
	Tue, 09 Jul 2024 04:31:00 +0000
Date: Tue, 9 Jul 2024 12:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:qcom/arm32 24/24]
 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407091247.zZWRKruY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Raymond Hackley <raymondhackley@protonmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Luca Weiss <luca@lucaweiss.eu>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git qcom/ar=
m32
head:   2a5454d0fe5684855581f8ad958afbcdc476fd64
commit: 2a5454d0fe5684855581f8ad958afbcdc476fd64 [24/24] ARM: dts: qcom: qc=
om-msm8226-samsung-ms013g: Add initial device tree
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20240709 (https://download.01.org/0day-ci/archiv=
e/20240709/202407091247.zZWRKruY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c=
6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240709/202407091247.zZWRKruY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091247.zZWRKruY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:950.28-1001.6: Warning (avoid_u=
nnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnece=
ssary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:654.27-657.6: Warning (unique_u=
nit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-addr=
ess (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:689.27-692.6: Warning (unique_u=
nit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-addr=
ess (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:937.11-947.7: Warning (graph_ch=
ild_address): /soc/display-subsystem@fd900000/display-controller@fd900000/p=
orts: graph node has single child node 'port@0', #address-cells/#size-cells=
 are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: /: compatible: '=
oneOf' conditional failed, one must be fixed:
   	['samsung,ms013g', 'qcom,msm8226'] is too short
   	'samsung,ms013g' is not one of ['qcom,apq8016-sbc']
   	'samsung,ms013g' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,=
lenok', 'samsung,matisse-wifi']
   	'samsung,ms013g' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 's=
ony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'samsung,ms013g' is not one of ['qcom,apq8074-dragonboard']
   	'samsung,ms013g' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm86=
60-surf']
   	'samsung,ms013g' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'samsung,ms013g' is not one of ['microsoft,dempsey', 'microsoft,makepea=
ce', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,s3ve3g']
   	'samsung,ms013g' is not one of ['htc,memul', 'microsoft,superman-lte', =
'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
   	'samsung,ms013g' is not one of ['huawei,kiwi', 'longcheer,l9100', 'sams=
ung,a7', 'sony,kanuti-tulip', 'square,apq8039-t2']
--
   	'qcom,sm7125' was expected
   	'qcom,sm7225' was expected
   	'qcom,sm8150' was expected
   	'qcom,sm8250' was expected
   	'qcom,sm8350' was expected
   	'qcom,sm8450' was expected
   	'qcom,sm8550' was expected
   	'qcom,sm8650' was expected
   	'qcom,x1e80100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: /: failed to mat=
ch any schema with compatible: ['samsung,ms013g', 'qcom,msm8226']
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: syscon@f9011000:=
 compatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'altr,sdr-ctl', 'amd,pensando-el=
ba-syscon', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene=
-rb', 'apm,xgene-scu', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'f=
reecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93=
-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'hisilicon,dsa-subctrl', 'hisilico=
n,hi6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl',=
 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls=
1c-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'm=
arvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'mediatek,mt=
2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-p=
ctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-sys=
cfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,=
sparx5-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,=
wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-=
qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', =
'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockc=
hip,rk3588-qos', 'rockchip,rv1126-qos', 'starfive,jh7100-sysmain', 'ti,am62=
-usb-phy-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti=
,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
