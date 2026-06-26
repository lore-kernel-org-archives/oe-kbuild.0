Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C55C3BB118
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 06:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782456991; cv=none; b=nxABcwK/b/JgQyQjJLl+2hXCD+doKdtf6PwjRpzNTYloNqDOvHxQkcYjKGfcBHw1JCjSRlMC3VuUnrPPFMeq6jnM9Wxn1ZzmXj4F/fPWZlDl4wKgGneeENdeQONphvjhnGxfK/voPF2vvIWkLwHwvN/9oKAwDaHbfeHvdvjy74M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782456991; c=relaxed/simple;
	bh=pvoBhbT9evg/QskNfivpg3RM0PQrdiOpkiDFmVtgyb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GkFkzFRB95mRTghS1N26bImm4GWMcmB/RxF6BpfoGPilcMVauuHp3VELbTbfgfi2MOrT9Y9qKOvqhBB50589xZkw/CjqyMoNJ1d+fPFS037/s8aGi9/BFv3BSxyRDSAV/QaYoF/8U5ty7uh8WIyClQZkBCxwylu0jON1mcnEmmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUryXhxt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUryXhxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782456991; x=1813992991;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pvoBhbT9evg/QskNfivpg3RM0PQrdiOpkiDFmVtgyb0=;
  b=OUryXhxt16Yz9CDc/CZeQBHVWZutpDrx2Ysy9zNVh0TyyDGjSV8jbTMt
   6ik7f6LG/KPq7kaBFgAq3KSMJJ9w8XxtpXxoJ5yJ1vA+wLyNOzPN+hps5
   FBy68onOto329FQ+Q/dk70MfbP6FQGryMKeKnqDR/JnXV2eaShx+tRTox
   9uYWgjqA9ZWKidZ7lA1DpmmsIFDLcfRXxT31xoWO+uMFsN0IEuGa3ySuI
   I4EPuvfVIFAJ9g29676ngYMwGgqdJ6Et5VFlgKuBdGHtT1KySjldix8/w
   UMKS4xukDBbPL4Rm/szu4Ooj5i+shs5mTUvE0YEEyLq/+a4zVYMrLTy2w
   Q==;
X-CSE-ConnectionGUID: CsjgITqdR1CWBeO08hjn5g==
X-CSE-MsgGUID: mHAiAsSmSTSdPcd7bSTBEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83019522"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83019522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 23:56:31 -0700
X-CSE-ConnectionGUID: 6vA0fiGBQzOFFuvS5879tg==
X-CSE-MsgGUID: LFdtaxVBRe6oVefAdYxqGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="289354445"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Jun 2026 23:56:29 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd0UF-000000006f7-09wW;
	Fri, 26 Jun 2026 06:56:27 +0000
Date: Fri, 26 Jun 2026 08:55:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb:
 geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
Message-ID: <202606260833.RKa7kYTM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Barnab=C3=A1s Cz=C3=A9m=C3=A1n" <barnabas.czeman@mainlining.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
commit: 7bb7c90e0ac18565a45c02072356bf3dffb81bcb arm64: dts: qcom: Add Redm=
i Note 8T
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2054-20260625 (https://download.01.org/0day-ci/arc=
hive/20260626/202606260833.RKa7kYTM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260626/202606260833.RKa7kYTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 7bb7c90e0ac1 ("arm64: dts: qcom: Add Redmi Note 8T")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606260833.RKa7kYTM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1322.27-1389.6: Warning (avoid_unne=
cessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessa=
ry #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"=
 or "ranges" property
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom=
,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.ya=
ml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom=
,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.ya=
ml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom=
,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.ya=
ml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom=
,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.ya=
ml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
