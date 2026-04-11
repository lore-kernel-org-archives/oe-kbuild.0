Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C87F239E63
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775934746; cv=none; b=lK2DMC49EZfrmcPMFmt1N84+AA7TJSHJmRH2CbU/HIz4NyZUaKO44PL8aIEUjKfc3ej9S1HD9JUZJAkg3V4qKg1KI/DaaxejLv3nxYmNAH1s8seWLfF6OYSgjSN8JwI3MIq/bYcWGlsP6+ZpUG6WoyrZnBT5Myz1pagguz+c8eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775934746; c=relaxed/simple;
	bh=zwCU/czE/0K13uNRNd30QRqCY2gy1r05CFXScudG5us=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W948ogR/uGIJP/zmUqDdnyqkwj4Y5WWxdo7c0cXQx80l4LvJsa5oP18fPIp2qZgeQEGlV0IaUnqWG1pPuHDTsvliRjiPPgCStaAzROUf8nydcHYHaa+Jux2hyU+jB96OmZb4tHVg9d+vSF7kn5x2TgZNTXc+4d3r2rgj8qMPL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/qgi1US; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/qgi1US"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775934743; x=1807470743;
  h=date:from:to:cc:subject:message-id;
  bh=zwCU/czE/0K13uNRNd30QRqCY2gy1r05CFXScudG5us=;
  b=J/qgi1USm/pdcDeOcLFcA+9kjw7mB73yq2IkLp98FaQ/twdMpH8rAlre
   iA4zAuqd+4IehspelnRsSWsWTiBZFm8kIfpi7w3l+AM6XETS9ifY3Fk3I
   +zZ+nfwRWw5sOUVp1ihob+CR3FcWkDJ8TWK/g0W9T+HWO2yNuJ004Jd+I
   pRlQy2hj9ExgGi6Ok1oXso3AvPXusbmaEOz3VbY1732qSTmsqzcul0YuA
   0plTreDkVuDkBFfdXC1GKtOYYs1eipE+IOwVv3X47gMGKmxPbgQV2Tq4v
   Xb1Du/7tQLesnx2xcAEcd8yYQ7fNH2R9rtO+PMRgYUUWZP1UaiVpwHkX6
   w==;
X-CSE-ConnectionGUID: 9dtqwS9OS1+GJ9Tj2KZ6vg==
X-CSE-MsgGUID: wDDUt9nuRraZiqlOBHRvHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76090593"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="76090593"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 12:12:23 -0700
X-CSE-ConnectionGUID: JYYgPegEQHW3WA3Vi3aMHA==
X-CSE-MsgGUID: yOFeYZigRsyMnot5hSyDhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="229274513"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2026 12:12:22 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBdkh-00000000B77-1VC2;
	Sat, 11 Apr 2026 19:12:19 +0000
Date: Sat, 11 Apr 2026 21:11:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 104/106]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: pinctrl@f100000
 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed
 ('i2c-imu-default' was unexpected)
Message-ID: <202604112145.u1nMfL3d-lkp@intel.com>
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
TO: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   c368130866898c0f67e75fb8e36b0708e623553b
commit: e746f14e26b842aa88d82e6cc98a38ded711afa5 [104/106] arm64: dts: qcom: x1e80100-t14s: Add IMU I2C bus
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2052-20260410 (https://download.01.org/0day-ci/archive/20260411/202604112145.u1nMfL3d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604112145.u1nMfL3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604112145.u1nMfL3d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('i2c-imu-default' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('i2c-imu-default' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml
--
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('i2c-imu-default' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
--
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: remoteproc@6800000 (qcom,x1e80100-adsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('i2c-imu-default' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: remoteproc@32300000 (qcom,x1e80100-cdsp-pas): Unevaluated properties are not allowed ('qcom,broken-reset' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
