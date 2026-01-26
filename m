Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C67DA66
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 02:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769395458; cv=none; b=pb9Qg0gtBK2s0VYirWUwgV+yTFDawAwVhN81Rt9XayHDlMP5nBHlObl3ub0mSQnHyMPfGMenFIQXcp5BGENwKCZuTFgKi1X5kLFLBPNo1/gGdjo3VM+7ZKxMJK31a9rHtxj7jo4STvH1sKGPgwoI9sOcCbPjmCTF9/1UgmKjaAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769395458; c=relaxed/simple;
	bh=Po7VZLyRgS/jRWAND/DYkaC+ZtsFX45fo9Zx9kcX0T8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gOt8hgKdMru9MCKbqR5eZaXPayAUmPzB34GHlmoXYdQnKulfCX6WXmI32oAVLiwIhWgaFvkqTCKxrQcxe2wPDEh19MF+g32aN9weB26NCl2/3HTxAjVc5TinlUJb7YKm1kp5syam4FmwKX6fwAoViaZD9B0Xwm1U+uZaDF/9yAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOchYWbq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOchYWbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769395457; x=1800931457;
  h=date:from:to:cc:subject:message-id;
  bh=Po7VZLyRgS/jRWAND/DYkaC+ZtsFX45fo9Zx9kcX0T8=;
  b=iOchYWbqBhMBO39uyS5xEkBQgx0yXCoP/vX8dUC+pcQZFlKDT1uLgRTH
   bgI4DoGA7ZE2s1KPOuICTsHvO+Gn24UeTMDtNS0IG4i+d6MNxD1aUnJce
   QF/bvOcTtsAWVwnSN8EXx8cGd0KAhX463XVA1wmwK0gA7oQikT0urQEc3
   M4WtRIDd998EIj1FL5GSDefs3bUWUS3IRfv+Bqydfn/r63sKgIxKmRsPg
   PrR8S2nGjeDTR2f46I5xh/BjGLgO4qEbldkyUtV3B3pePwLe2tGLjCEwn
   TuULUxILMSZaSDEW561Z+STzpUpVbQmJouGb/LMeWfv2aZA6AMXCvWkRP
   Q==;
X-CSE-ConnectionGUID: 4SpYiR/7THeYqT2pNdhUPg==
X-CSE-MsgGUID: rldKzczdQL6pwrDzByM2PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="80876353"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="80876353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 18:44:16 -0800
X-CSE-ConnectionGUID: WqYwQnlbR4uLx/wA9+SL/g==
X-CSE-MsgGUID: aPoTNbJ/QPy72hcD2K2+8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="206802679"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Jan 2026 18:44:15 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkCaK-000000001PF-42wN;
	Mon, 26 Jan 2026 02:44:12 +0000
Date: Mon, 26 Jan 2026 03:43:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb:
 spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed
 ('interrupts' was unexpected)
Message-ID: <202601260318.s3uDvIc6-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63804fed149a6750ffd28610c5c1c98cce6bd377
commit: 85c767d2d36fa9d505266b2038931c5b745e6678 arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260126/202601260318.s3uDvIc6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260318.s3uDvIc6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601260318.s3uDvIc6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: touchscreen@16 (elan,ekth8d18): compatible: 'oneOf' conditional failed, one must be fixed:
   	['elan,ekth8d18', 'elan,ekth6a12nay'] is too long
   	'elan,ekth8d18' is not one of ['elan,ekth5015m']
   	'elan,ekth8d18' is not one of ['elan,ekth6915', 'elan,ekth6a12nay']
   	'elan,ekth6915' was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: touchscreen@16 (elan,ekth8d18): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: /soc/i2c@11008000/touchscreen@16: failed to match any schema with compatible: ['elan,ekth8d18', 'elan,ekth6a12nay']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
