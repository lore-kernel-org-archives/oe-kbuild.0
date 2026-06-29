Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8964071F8
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jun 2026 13:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738605; cv=none; b=qlBvtw/ZlJ1qSiKNSVnggh8rzI9XVXeW3y8eXUmDerLWN87a+0JbGKRRTycNtk3uHQN+/s6cYxWWSieTDqSYdnCdCupU2onMsRVDtAstt4Q5CgBWXqJ8n6l5fw/UTVHlFME7oyOOcrEGG9A0+d6f46gA+Zctcz2+tKIJaGzz/Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738605; c=relaxed/simple;
	bh=1kVTvYXN1+z+ugtqvMs8VVlVEAVWnSh/Brn1GgY0jSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hc7qXS7WSjSgKKprbjqeDbwKenvFo/LKXARfU8YRxgGT6IvjADPw21GeOILNu/8zrNDaIB5EdZ6WB0k2PqSh5yTnRQw5X+Z1E/I0OHGtmYJrfZpeD7RNcDmS49maRb4DnyuB7/z246TiRSa1VieiOQHuko9AzhGZOqmzXCBtS2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCbt6d7h; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCbt6d7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782738602; x=1814274602;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1kVTvYXN1+z+ugtqvMs8VVlVEAVWnSh/Brn1GgY0jSA=;
  b=DCbt6d7hXrvXJn3c7hkDivwEMjDBC+oP+68zfu0KqQ1p6IOnjhQHiKmn
   wPKwsYx9Ia79dCJtxU7SPylMR4dB3U+vlk36bGIDr8Hc8IJKvUoWknvTj
   N12A1keZ1keq+WOqpvsOS3J9Y317/NAC772xZoJ7y5LoM37BgDCSRlUmW
   sai4lg7UdhCuPzTBx3tz98qAL88E6bkd9kNZgGnKBFng2m+zj8Yv2V70C
   xKsoOQInOSeEJEOJYV3JH0SeIJhwPpv0b9UZABw2NeYFEVlkFJPX6ZXGm
   FGIGd5mL6ILnesaymMS7NLY3uMQ5EPCYUMhUpLMa1sPjBwOukJuiDH3BF
   A==;
X-CSE-ConnectionGUID: 14IJufVVTNmL1oqD7ErxTg==
X-CSE-MsgGUID: XV/NM12uRGehUywfDlhr3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94007174"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94007174"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 06:10:01 -0700
X-CSE-ConnectionGUID: mFYf6IlGREy8wXmXOmDpAw==
X-CSE-MsgGUID: 3zay6kA+RUasxTGX+Rp/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250891783"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 29 Jun 2026 06:10:01 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weBkM-00000000097-3ZDY;
	Mon, 29 Jun 2026 13:09:58 +0000
Date: Mon, 29 Jun 2026 15:09:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb:
 geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
Message-ID: <202606291540.RkZZx1ur-lkp@intel.com>
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
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 7bb7c90e0ac18565a45c02072356bf3dffb81bcb arm64: dts: qcom: Add Redm=
i Note 8T
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2054-20260625 (https://download.01.org/0day-ci/arc=
hive/20260629/202606291540.RkZZx1ur-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260629/202606291540.RkZZx1ur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 7bb7c90e0ac1 ("arm64: dts: qcom: Add Redmi Note 8T")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606291540.RkZZx1ur-lkp@intel.com/

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
