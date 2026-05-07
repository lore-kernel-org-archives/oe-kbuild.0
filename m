Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FDB3CBE7D
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153441; cv=none; b=Cs41c7NHY0u8G6gAqiWdkUCesPf9Ds0Tuutki/iuCMLFc1P7Kbg+VIan2Hv1/qKc8DvXBCrikz60iQ/pgn8IbYZdwpFxFE5XrCMfbvEBF0SCxeKdYGNWDOMGzYwuS0YMjkHksnGixG9h9PMDAjkVMe/WxjJM+H0QoGWuycWa1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153441; c=relaxed/simple;
	bh=8ZWoyf0PceYz0k1fFBp5RNEl3Za7XQVIJ7U3VfHeiC8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QxXm/cnW980tx0VxZMpCCgZFR/ip4PGO5HTs3wv1wN0LpvPtoQy4rh+iCL9tBsW/yn/noL2OiDoWk9Yn1ySzI0l5yyN9h1u+q8Sg5ZKAN154qj4q1rYZqGbrl5sDw+YlMKwhHfXYjcugYMMhjWMp2f1ZfVIS3xzRnZdD1MSGRAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIwklSUv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIwklSUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778153439; x=1809689439;
  h=date:from:to:cc:subject:message-id;
  bh=8ZWoyf0PceYz0k1fFBp5RNEl3Za7XQVIJ7U3VfHeiC8=;
  b=PIwklSUvPwF1DDVwleMNvGV8qsdgidRtNoJC6jUapeUH06ySG6Ydb1fe
   njTFhLo+vlYuXUnNoPsy5wwVqu4y1HHZPvuL/m6BemC/CELgByKy00OzZ
   7WKUcM70YdmO18WCZSrXrQIF93mHL+YSFKcLPsihDC3x85qdKv6hqPJvb
   SD2JtiY+3kD+88WFSki1y9k3Z7IGMIOOJvv7kxLsSPbpW6irBJ7hjOfue
   O3SiTHuA0x+8ToMnVPAoPE8M5kVieSYCrjamBPuoqFrvWN9QLd4HRIQTE
   kGhwi5+mG1q6ubom0CLe8p06scHNiZD8HROsktIusgkXigaDTIwpj9ztw
   g==;
X-CSE-ConnectionGUID: P9GC1hHpSC6fRhSaryL47A==
X-CSE-MsgGUID: ZB1N5l+jTSS6GS6Kj6dBRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89795682"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="89795682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 04:30:38 -0700
X-CSE-ConnectionGUID: g8Fy7j78Tw6yotuvLREZ3A==
X-CSE-MsgGUID: YsUkM1N1RsC0/kMmBA9APg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="266819640"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2026 04:30:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKww7-000000006rl-0MOf;
	Thu, 07 May 2026 11:30:35 +0000
Date: Thu, 07 May 2026 13:29:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb:
 bluetooth (qcom,wcn6855-bt): 'vddaon-supply' is a required property
Message-ID: <202605071327.Yu5NY9Sm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nikita Travkin <nikita@trvn.ru>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
commit: 263780f3189730f2efa511181c3970384e54afde arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA devices
date:   1 year ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260507/202605071327.Yu5NY9Sm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071327.Yu5NY9Sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 263780f31897 ("arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA devices")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605071327.Yu5NY9Sm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
