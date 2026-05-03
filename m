Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C523A63E3
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777788379; cv=none; b=V8UHFQ62SZTC5kPhMPDncf2cNSXL4WAqGp1nMJfbgJsVDBteknL17LxgFe8p9cQaKlE923g2efbPIiuRIPoSzuxYWLuMOJXIi9YLN9vi2erb/LqKxeyzDcbrq2WBcfGaMIESdR6Kmf0K2G8Hz6X3XYSaJiWGnGu9nKiJWj8K7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777788379; c=relaxed/simple;
	bh=yh6IERS58f3XBeiAvDCUg4aKSKPt2KQnVED0pBG4y8A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H5I73Kf0MqmpZnc+xb1SewIbCkzWgeZRT+TQ8yuWqDlG1zssww3m8emFtH4i4dIwYj/FVYaSuSVxioen8xJ/6Zz8Ec+j0cOb+6mvz/R/jGMxwpK94O0dmhZffVS1uMpHb6WKT4UkyYv9QHJQ+fTFH1p7z3vPave/xWFpz3ojHAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAGGA75N; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAGGA75N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777788376; x=1809324376;
  h=date:from:to:cc:subject:message-id;
  bh=yh6IERS58f3XBeiAvDCUg4aKSKPt2KQnVED0pBG4y8A=;
  b=RAGGA75Nh8BLF5uAQH+rmUZgd4YamRJWdjH2ggSfyeK7nzAiJwrCUphX
   bkJVj3OlTJwnnqUeTwCjZ/VvSmL6pi/LiZpmcGoxuj3X+wTE6u/pa4RAg
   2Svn1+Rf9FoDUaO8I3FJEesjzZrxX/JfVHjf+K6S1IVxb5kdhonpBmM31
   dsXYw7QTl70c+MXfAuw/v5HWuxkeIw7q36LoygSwiYRqqJoIdL/HlZoQd
   n1Rq8pRY6JUHjCOpxJx2V39B6K1YYZFqAO5DmMoBRI6ZFulkm0QJEWBhA
   SmTiwxXqrwtWdC3ncjg4bUB3Ig56mblkCw/yM2rIIEkcG5koAHLIQIWXs
   Q==;
X-CSE-ConnectionGUID: aAGOHq/FTOSEuhhRzxyUVA==
X-CSE-MsgGUID: tE0CWs/3RoWlnM8KYHo98g==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82556506"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="82556506"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 23:06:15 -0700
X-CSE-ConnectionGUID: zt4W9TLRRBW27kEQTtLlpw==
X-CSE-MsgGUID: oPy5b9chRJ+d296FPZgPlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="258580935"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2026 23:06:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJPy0-000000005TJ-0aug;
	Sun, 03 May 2026 06:06:12 +0000
Date: Sun, 03 May 2026 08:05:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb:
 geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
Message-ID: <202605030712.3lQuRbwN-lkp@intel.com>
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
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: 9b1a6c925c88ed9331a2cae64fb3580e05345ded arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
date:   1 year, 2 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260503/202605030712.3lQuRbwN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030712.3lQuRbwN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605030712.3lQuRbwN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1321.27-1387.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1279.11-1289.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: / (xiaomi,ginkgo): qcom,msm-id:0: [394] is too short
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
