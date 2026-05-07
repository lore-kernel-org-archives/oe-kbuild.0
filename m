Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E53EE1E9
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171023; cv=none; b=a343Pg2rB60ZgS7WQmsgue9GFfW00XYJr6MqESsaZ3pMP45ViWdadxjMu3GoZh7gDN0ZrtCZtiX0nXelSCw0kE07nnSGswX1U024zNR2jtj0QWc2Bnd+DpDXYeV3jssjPP7to/HmCFqloE88lnrGbZbrFTDxWlgiH1sStixOJYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171023; c=relaxed/simple;
	bh=NdpuBPARCyIXfjUjKJDfZqOUAtuBohPxbINs2mDk86k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ob4V7tbXK2mMfJTynDGBgj51xTFMcTDNY3ROv3bWFYnpOk3YEHo6CU/NPtoXa5MNOxL4P2T9QGFPw2Nm0ZK5uXRszOA182JzzlWDIeZwqUFDnZitxWkHhbhM4zuxL1Wym0BhCaV+3snAPXVllVQNpKJToTGCvJxvBD8ARqhl7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrXu9ZXF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrXu9ZXF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778171021; x=1809707021;
  h=date:from:to:cc:subject:message-id;
  bh=NdpuBPARCyIXfjUjKJDfZqOUAtuBohPxbINs2mDk86k=;
  b=TrXu9ZXFxDJmHtl8q04R6F/OyBZ8KzCArIEcLAHnd5VShDViiBeqRgxr
   NonCWuv054LkzWtt+jZzTmZ60apTvrIwQijqz755gtaWRuzV5pOOib+3r
   qjXsbA3ERbzIhIiatwBVjmK89o5jQzQIUYoG+FDE3WB6HqG/02zhH9jGS
   UnXsPJOuRyKOiiQapO/zC9aAgFP26JUeEP92P9c9yGUf1xi6Kwls6Pf9X
   omLdk4UsbW3W0u0rn3GlD6hb5ee3v5hhlv+xlozpvMXP93x/qDfNMXwjP
   JNNcRc7i1MMoFayMc2e7ZKc7DPViLJ0zSxVYpWZsQR+VzdfUQwLqauKZ/
   w==;
X-CSE-ConnectionGUID: 72765knFRiWp1hNPbkpQiQ==
X-CSE-MsgGUID: KPXHYHQFSTG+Vd5YwYpfcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78848484"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="78848484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 09:23:40 -0700
X-CSE-ConnectionGUID: ++X6ruuOT4esIpbJu1gdyg==
X-CSE-MsgGUID: P9tkyGdvSxyIo5wPpxlVQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233846319"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2026 09:23:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL1Vh-000000006tp-1B58;
	Thu, 07 May 2026 16:23:37 +0000
Date: Thu, 07 May 2026 18:23:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb:
 geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
Message-ID: <202605071837.Cryo0ALN-lkp@intel.com>
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
TO: Gabriel Gonzales <semfault@disroot.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 9b1a6c925c88ed9331a2cae64fb3580e05345ded arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
date:   1 year, 2 months ago
:::::: branch date: 11 months ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260507/202605071837.Cryo0ALN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071837.Cryo0ALN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605071837.Cryo0ALN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1321.27-1387.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1279.11-1289.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: / (xiaomi,ginkgo): qcom,msm-id:0: [394] is too short
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
