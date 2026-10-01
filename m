Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733883655E9
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 00:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814631; cv=none; b=qu2/Cvs8QVbcKBFJCYPTqcapVyNX+wDe32gH2CwKu/qwbvIWlKxG7tjY9tn4nZoMOxbS2f8H9L95v1u85KREWVYICSOHvIIWJFAoKsYQ53oxBKc3M2TIrFIS0H8apkVF1slJFPNUFvx1rfIqqyizAEdGG/xJBTGvCw5J+YzIJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814631; c=relaxed/simple;
	bh=25faTIzowjCGyOfjWDWGL+H8Ipt5zx9Ax5s+nRxRePg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u3V16LpVBoBmxYIShcJ2ULw2cgmDmDgI2U8v7TuOIpxqd7n4AGfkw3esZPdTQvQM1ELcvHQd0exyOGbgZzaaLAOhNOPecmG83JE57WunmC3E8ran2F9rZ7V9PSnF3lrOIH9alLiXn9gDqw//KdQ1pB6Yx5bpheUv2Txulekkh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRlIBQsm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRlIBQsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790814616; x=1822350616;
  h=date:from:to:cc:subject:message-id;
  bh=25faTIzowjCGyOfjWDWGL+H8Ipt5zx9Ax5s+nRxRePg=;
  b=cRlIBQsm5wMgisVPurhlyafyrGe9dOg14cV5e3XoZ4zBsMvo3GimvBQI
   vJPOlsdkEuYWjIYLFPwJJD/gXTZlWUspELoppj46p4H0lHubJbzUKXdre
   MqVWM+sbIid9wzJT0j9EAoVXzI3dcqfRcIHZPVWM1kcvYe4+Dxx3scGJd
   v/WSB71qPDW+RPkdnoKV92wMiog8a0y5qVFqm20BM6AClObJmZtTVMMXi
   iPanuJ2x9VhogBymKU3fLsQ9szy2AV3lRcskP5BtF5/Gcn92st7nKHZwN
   5CBVoxaG0Ac1anf4Gy2FKLxfd/y9UQn7awefi6Tjb54PBn5G25Lhtr8Wl
   A==;
X-CSE-ConnectionGUID: C6/luGegTWGTFyRV7sy/jg==
X-CSE-MsgGUID: or+qiQ9gRLeaKZVGoSVjmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="94279529"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="94279529"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 17:30:13 -0700
X-CSE-ConnectionGUID: V2HilO64QOmmuUjYlyR4Cg==
X-CSE-MsgGUID: DQaARez8Sw+RsHTXK4QpAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="279636645"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Sep 2026 17:30:10 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC4ga-0000000028V-1EZM;
	Thu, 01 Oct 2026 00:30:08 +0000
Date: Thu, 01 Oct 2026 02:30:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 105/291]
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fd5000
 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux',
 'usb3_pipe', 'p2rr2p_pipe'] is too long
Message-ID: <202610010222.R0mhXuGM-lkp@intel.com>
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
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.4
head:   300f5c59beb257550ae3863aeeed2ba63871dae8
commit: 1360126eeb38872b68f5b89d793bd28e328224fd [105/291] arm64: dts: qcom: hamoa: Extend QMPPHY description for USB4
:::::: branch date: 26 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2403-20260923 (https://download.01.org/0day-ci/archive/20261001/202610010222.R0mhXuGM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010222.R0mhXuGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610010222.R0mhXuGM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/purwa-iot-evk-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 284], [2, 0], [63, 286], [63, 287], [63, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 288], [34, 7], [63, 290], [63, 291], [63, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[63, 292], [34, 8], [63, 294], [63, 295], [63, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: clock-controller@1fc0000 (qcom,x1e80100-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx3-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-qreftx1-1p2-supply', 'vdda-refgen0-0p9-supply', 'vdda-refgen0-1p2-supply', 'vdda-refgen2-0p9-supply', 'vdda-refgen2-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
