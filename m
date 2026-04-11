Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B711723BCED
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775920164; cv=none; b=ifbjaFDzs4fC4XKnApc/yPaifOfBewaph1xCuam4gi0FN1is1MJRm9K717B8gYXlWqWnT5Q1GdRemT2ftHz6Zfv9m0BdFDMQsJNprJlj6IgGjWICAPP4omdS/II0s0CJyz82guYxAx+iK3vYYGTXmhBrZ7X8DXyLRFW9tvMj/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775920164; c=relaxed/simple;
	bh=Fd8nKbzV0ZCBoxWhaKAe9NCVbwdfBYrIPoQD0eYhvSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dCemk3VcyS+d2iv6G02NlU41H5uHNb4kUpZM6/vFVKp+XvGOwY6+krUSdiswsiitVJpXhtPpPs8piYvbyr3vHu9g6do+2DLYRSd6r3UKZDinuerN+G50PCVVaXnpV8rwUBwsZTSGZqB2dBRxtJx+AzdZ88Z7BYfxCoZxnh+ioyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAT6jxzV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAT6jxzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775920162; x=1807456162;
  h=date:from:to:cc:subject:message-id;
  bh=Fd8nKbzV0ZCBoxWhaKAe9NCVbwdfBYrIPoQD0eYhvSo=;
  b=jAT6jxzVoNeS43CR4hDEG9JaSdkjyU9BCJ5Lv3y9LOpxxD7F51dAzdiC
   3RsVuhzfb4wRkpzrA0l5ds47+SMU1qRcXzUvT6DV9NMPAEzpj78GElCon
   H4mIQiPONnTdpH2yE81tiZ3yYAaWilJlqIjOg17DFt3BXHvitGvzTKgmH
   qisJ3aSgMiWe0nHlx0wjNZIo2UyaiIvNlEYEot55hoD+w8KPVLjywvQe/
   1R27AZAuOePTRsyHjI2tEVoIHOiDDWm8qpTCI0DDIBaIEVpYpwnJ5z9nM
   yrfPs8hJcFA2LccrhS8ALzneA6+UeVFpdXYGk9Zc/Qc4E58SPN80TcNql
   w==;
X-CSE-ConnectionGUID: wlf5kktJRRi/TXQdG/40EA==
X-CSE-MsgGUID: zmirGf+ES5Wl6B2asUtftg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94309374"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="94309374"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 08:09:21 -0700
X-CSE-ConnectionGUID: 8i/uJ8Q6SNyKJUDuV9gLCQ==
X-CSE-MsgGUID: 7jFgYtE+Qh6eAtdTwPNZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="252748330"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Apr 2026 08:09:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBZxW-00000000B5t-0d3h;
	Sat, 11 Apr 2026 15:09:18 +0000
Date: Sat, 11 Apr 2026 17:08:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 88/106]
 arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: remoteproc@6800000
 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed
 ('qcom,broken-reset' was unexpected)
Message-ID: <202604111732.Gk7fmPH5-lkp@intel.com>
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
TO: Stephan Gerhold <stephan@gerhold.net>
CC: Sebastian Reichel <sre@kernel.org>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   c368130866898c0f67e75fb8e36b0708e623553b
commit: d62e84e8cd874e1e738d295bd488a232179e3e3a [88/106] arm64: dts: qcom: x1-el2: Add qcom,broken-reset for remoteprocs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2052-20260410 (https://download.01.org/0day-ci/archive/20260411/202604111732.Gk7fmPH5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111732.Gk7fmPH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604111732.Gk7fmPH5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: csiphy@acec000 (qcom,x1e80100-mipi-csi2-combo-phy): 'phy-type' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
