Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5A315444E
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723097366; cv=none; b=RkjDALDdhoT40FJr7u6PicOzEXCEWfR5i7foSNNBn9Hd78ugoaZ7qeCFPGi/uIJQvhtzdv/w+qqzVDx7ZVQCRfJmpWcjhR914t1qRKsEOScwRE9UifTN5S2Pz9I7lJ2YAnkukcyAHxhbbnPSq+SeS7ovEnySZDxH4wwa8sSV8u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723097366; c=relaxed/simple;
	bh=K3r0mFhe7Z/emboXE/KpvxlKtEcqd1YZWcImkUxOhMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUm7DTbRWBCHRil5bCBUeoebHZ36USUELlewEdivP4VDAd4mPeTEUsDQNT5TQEikp0dU9EdvVQ4k8oiUVbcbTYuao3+pV/EqWXW636F4aud2Mx3x5W8UpWCXYg+WIQKJYDkXcnzFCk4gHj5YQyEd9SymowwWuQxP3UaMMyWJtT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgHbuhZ6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgHbuhZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723097364; x=1754633364;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K3r0mFhe7Z/emboXE/KpvxlKtEcqd1YZWcImkUxOhMs=;
  b=GgHbuhZ6HOStpoWtXKjGffmwt6+rugNbFtH/4OpXxs0dcEVcVZasbuaV
   JRWbJTujv/9GowZePzCs4ZPtab0Ia2pQM9y0rBggVoqVSyaxDW+rjmpMj
   8CAz+Yvt+7lYmB9kd/xQZ6tmoGYL94CsgmtMAHiKZeoHEwozxIX4ZViLg
   Aam+Yay/4pmeansN054I/wN8gC/g+1nDLdOhq0jP/5YNezEKWYmS43X6c
   TDNASJwjYPV2P4CnJCT+ZO0ujTu0+TKjiVPnM+OgdEramiTmOBdLyvAd0
   SQen/cdp15TapuHWut54gxkmVqVvX/iRMW0euhAtWSAdv9mARBMrrWsyl
   g==;
X-CSE-ConnectionGUID: 5TLJuNpYTYOGRlOdMy+G6A==
X-CSE-MsgGUID: V47SxoB/RqG1FRjSQke3fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31832117"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="31832117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 23:09:23 -0700
X-CSE-ConnectionGUID: Ei8PkkwpStS1PSyElPoskQ==
X-CSE-MsgGUID: 9aL1BIW+Qe6jdA6ABnDHxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="61949031"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Aug 2024 23:09:18 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbwKo-0005yc-2K;
	Thu, 08 Aug 2024 06:09:14 +0000
Date: Thu, 8 Aug 2024 14:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29923/30000]
 arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: geniqup@ac0000: serial@a98000:
 Unevaluated properties are not allowed ('bt_wcn7850' was unexpected)
Message-ID: <202408081343.J2l9Fr7Y-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@linaro.org>

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: 337ce2c4a0efb2b5b724bf2da58cb87b535f9db6 [29923/30000] arm64: dts: =
qcom: x1e80100-crd: Add bluetooth nodes
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/arch=
ive/20240808/202408081343.J2l9Fr7Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240808/202408081343.J2l9Fr7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408081343.J2l9Fr7Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-s=
leep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.=
yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-s=
leep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.=
yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: geniqup@ac0000: serial@a98000=
: Unevaluated properties are not allowed ('bt_wcn7850' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.ya=
ml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: serial@a98000: Unevaluated pr=
operties are not allowed ('bt_wcn7850' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/qcom,serial-geni-=
qcom.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: $nodename:0: 'bt_=
wcn7850' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-b=
luetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'swctrl-gpios' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-b=
luetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddio-supply' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-b=
luetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddaon-supply' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-b=
luetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vdddig-supply' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-b=
luetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfa0p8-supply=
' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-b=
luetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfa1p2-supply=
' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-b=
luetooth.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: bt_wcn7850: 'vddrfa1p9-supply=
' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-b=
luetooth.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fd5000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fd5000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000: 'vdda-phy-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000: 'vdda-pll-supply'=
 is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000: 'vdda-phy-supply'=
 is a required property
--
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@7: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@7: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@a: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@a: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@b: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@b: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pinctrl@f100000: Unevaluated =
properties are not allowed ('bt-en-sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tl=
mm.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
