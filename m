Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA8B288AD
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 11:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769427204; cv=none; b=cs2Asj9hRWKV7iDMnl2q3ZrMGUEcwxB8tu1AyS0ihCM2Ywl/4+UqLATr/Dq8P176DUgsINlp8dIfGobT7JzZpLgzVwga6UcAJg58E8+9n11/deELmDTuR8fj6yvFQz3WmKK/HMJ4tJpSzU/syqFPMRVJU03pCzA8CVzlTTNJoEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769427204; c=relaxed/simple;
	bh=D7+w/JK0c1ZTrlJWbGMF/+astq7Q19NuH+g7vVa2Z98=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Trr7tUzlHgyAQm1Dn1NzjFXHytz75UBN/SCV5L4Ok6dijTRZcrW9yGQULoJp3B3rHxi9JdsmKA83dPVoMYlgL7/48D2wpuCOfDIKaCd2ziEanCWYA8zKTLJwTqDa2VU5dreSWRk2no31TLeTNiVBAcMl2uZU1MmYoDVzMf82PCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZbU/ld4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZbU/ld4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769427202; x=1800963202;
  h=date:from:to:cc:subject:message-id;
  bh=D7+w/JK0c1ZTrlJWbGMF/+astq7Q19NuH+g7vVa2Z98=;
  b=iZbU/ld4QisRvpIiQxFRiQzSD/y+OQuvdwlB7O77GOLc8cNOTv+NDph7
   rimZHAYfuRw/W3JopOGRCXhfmO1oIRxjI1cIwnq3285wA+krYsiRM9pwr
   XMaYwuvGF/8Icak/v10TpeLGCKp1aUX8T0qaCyUNvijfdKNyAdlCQAcnN
   y0G5+J6rj4Baw39n7I9KBKjuZYbXJX7D5uwAsfGoBQLFFqNnIwvXh2VOT
   T1O2jWRCEp4pLi+xqJTqQNyX1MEPZhF6Bl3xbmcKN3Z+Vptl/pQosf5QJ
   1I3cGN1rrl7JJwrQ/dSC6o6tTyas6v6+16sLC8Eqeyc4081RPjz84iFWS
   Q==;
X-CSE-ConnectionGUID: zDVd3L/TThCpaH9vBNamaw==
X-CSE-MsgGUID: yYGzrFQfSr+Ps4Dk5TftXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70644851"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70644851"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:33:21 -0800
X-CSE-ConnectionGUID: yvOhrJ1EScedB3o924QPcA==
X-CSE-MsgGUID: PpFRx5+eSEitGSwppY1nJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="206778805"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Jan 2026 03:33:20 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkKqM-000000001WT-0Gw4;
	Mon, 26 Jan 2026 11:33:18 +0000
Date: Mon, 26 Jan 2026 12:33:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pcarrier:v6.19-rc6-odin3 11/12]
 arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: touchscreen@38
 (focaltech,ft5426): Unevaluated properties are not allowed
 ('no-regmap-bulk-read' was unexpected)
Message-ID: <202601261246.bFdDHbov-lkp@intel.com>
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
TO: Gianni Spadoni <me@gio.blue>

tree:   https://github.com/pcarrier/linux v6.19-rc6-odin3
head:   91a28d8aa538293ebd31727779aac8f23cb73b39
commit: 45c2c24a3acc685ec151e5974d3b2af961318413 [11/12] arm64: dts: qcom: Enable touchscreen on Ayn Odin 3
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2052-20260125 (https://download.01.org/0day-ci/archive/20260126/202601261246.bFdDHbov-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261246.bFdDHbov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601261246.bFdDHbov-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1e80100' was expected
   	'qcom,hamoa-iot-som' was expected
   	'asus,zenbook-a14-ux3407qa' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
   arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: /: failed to match any schema with compatible: ['ayn,odin3', 'qcom,sm8750']
>> arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: touchscreen@38 (focaltech,ft5426): Unevaluated properties are not allowed ('no-regmap-bulk-read' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml
   arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: pinctrl@f100000 (qcom,sm8750-tlmm): disp0-reset-n-active-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	0 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8750-tlmm.yaml
   arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: pinctrl@f100000 (qcom,sm8750-tlmm): disp0-mipi-vdd-active-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	0 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8750-tlmm.yaml
   arch/arm64/boot/dts/qcom/sm8750-ayn-odin3.dtb: /display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['chipone,icna3520']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
