Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB0B28134A
	for <oe-kbuild@lists.linux.dev>; Tue,  6 May 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534391; cv=none; b=YNtD3t/3rPRYxvj3YOXkj1+0K5e7WAmsDxyHTKN2tkzqCkchpQWc425sLhQ1Kk37aNj06ZXljAkwyfnQj9Cb6uVtP6cqsWsIWVwXl/QxmO401Tyzd9QLOUPGFB1WWWGQmdEiKOYYmmRBZE3LT57b4y7tFIY3/MyJokBAd4UMFnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534391; c=relaxed/simple;
	bh=jB+j6JxqeILPvotlUyy02tm+rCY/eAZ24VCLS2jDyWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C01rOq4KDlOax73fVPuWY0hpHWqa/3BBN8cXPNLvmcbqgndJh5yfAvmjpbbHxQw9k7+W8C/+jiZviUaVG3S0Gqmxau5VQw16pQUV9X4BfCxYaZcYT5EOkIVi7L/2vMpMt0G6CXJr4q/DWRHcncRadWl4Gt40MZYksty2X9Y7kew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzyiOj2b; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzyiOj2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746534389; x=1778070389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jB+j6JxqeILPvotlUyy02tm+rCY/eAZ24VCLS2jDyWk=;
  b=dzyiOj2bnBKVhtRPH4foelYZawNMkoXdwL/pn7AlNWpLXpzMrhB4qJWt
   PW9rEtJC1WT3qfigYQA2xJ7wIhOjt+l8rHx5prVgIF+vOYuEiCTtod3bZ
   O0M//syIejfMnTfyWSCV9GfWWDU5pDNvK52yPW6XugAxLdtNwj2PYWnB9
   DljUm1YtMBmBabCOfKkyLefje4+RTGZWYQsdEyZFe3Tcp/jaDUGdNncm5
   YEpanDdE8nUJ77fl5TpgaU3P7OAw5ZewxszkPe2IYxPbnOcR2XnNmoxhg
   l6jKvvL7fRrRrVLZp7iqXyv0iVyakdwKqvq5TB9suR08rXNm40NLH6/cg
   A==;
X-CSE-ConnectionGUID: ix9T2valQBy2aiEbOPoeLg==
X-CSE-MsgGUID: 8R9uQajHSj+9TXizhjww2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70700036"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="70700036"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 05:26:29 -0700
X-CSE-ConnectionGUID: 5/8B2jKBQzeio6KHeE6oMQ==
X-CSE-MsgGUID: zBpExxR0QcmePHREkdNlsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136103984"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2025 05:26:27 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCHNQ-00003e-1e;
	Tue, 06 May 2025 12:26:24 +0000
Date: Tue, 6 May 2025 20:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb:
 spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed
 ('interrupts' was unexpected)
Message-ID: <202505062001.h4c2eK7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   01f95500a162fca88cefab9ed64ceded5afabc12
commit: 321ad586e6073e33dd576ec33ae1803db3b1e717 arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2051-20250429 (https://download.01.org/0day-ci/archive/20250506/202505062001.h4c2eK7p-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505062001.h4c2eK7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505062001.h4c2eK7p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: pmic@6 (mediatek,mt6319-regulator): compatible:0: 'mediatek,mt6315-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: pmic@6 (mediatek,mt6319-regulator): compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator'] is too long
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: /soc/spmi@10015000/pmic@6: failed to match any schema with compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: dp-bridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: pmic@6 (mediatek,mt6319-regulator): compatible:0: 'mediatek,mt6315-regulator' was expected
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: pmic@6 (mediatek,mt6319-regulator): compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator'] is too long
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: /soc/spmi@10015000/pmic@6: failed to match any schema with compatible: ['mediatek,mt6319-regulator', 'mediatek,mt6315-regulator']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: dp-bridge@5c (ite,it6505): 'extcon' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
