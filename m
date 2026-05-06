Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917B372B58
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 23:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778111971; cv=none; b=Mqm22hAOZ1tD8UfvyrFKm0u7sS2iAtxh57bbih8cJhSXLYprI1CQ2dq8dwNEsDAyTYfd+9Y3M592T9ExqnUsokWUdX0opDatHYleEJzjooxGd+CLwoYoNr7ZJBhOyBw5dyZ/04Wt7s6X9+kiY+5GhsuC+Jfp8Z/+Rla8NeIR7Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778111971; c=relaxed/simple;
	bh=LyLayZ3rvv3OFdix7ljCPdhk0/xf/scwW7rHUeog24I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YzORGa10Caig4njiis12UZpHapZxnUiWxl7jPNUXQ7amz6hhkAfmz6nVyuB9mqPajJVJz9joKVpyUifjY2yfck/K1xwytrqHu0fmVUdeAFQypYZLAl8fzB96dtj7jvayA23VPSdecsQEgGUjx4bm8oBFPw7QnBJoC58hsBlpMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J446kDbE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J446kDbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778111970; x=1809647970;
  h=date:from:to:cc:subject:message-id;
  bh=LyLayZ3rvv3OFdix7ljCPdhk0/xf/scwW7rHUeog24I=;
  b=J446kDbEyQknEUiOP/7bh7LKInf1wuC4A7l/bicIf9DN237vR9oQV0sl
   ojb9XNhfYAHP5WH29iUHuF5VtNcBkoCg3FeCwn1sciXxvkdDzCLAoXt+a
   yguUHFmKafnqLono2s2PamSQZvDl4k6dNWMPrO32pJZyooMX9vqAZIChQ
   pNJiNcq67tOwJ9qitxRWfkcf/rUiQAzje+bjGU70ihuoz9l367P8w1UiL
   IhyniMJWiF60C5FATeE9Iz9Q2nFUx5T4zzhZla/kr+gby6TIJPKZOnsFO
   Gb6e5VkZl8KYFHdpO5eDSPAzRQZb05gRsXP94FezKIWALVS9RLtKMxoAw
   w==;
X-CSE-ConnectionGUID: 7xaBCVC/ShSBgsuTFpX/Uw==
X-CSE-MsgGUID: iSy+nj0QStGF1aJbj3Ifcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96485888"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="96485888"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 16:59:26 -0700
X-CSE-ConnectionGUID: 6Ul3+me9StiDeL6M5zOaeQ==
X-CSE-MsgGUID: oBTwqVQhRjOlo8nkL4fMgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="266676092"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2026 16:59:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKm9C-000000006fZ-2l23;
	Wed, 06 May 2026 23:59:22 +0000
Date: Thu, 07 May 2026 01:58:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb:
 geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
Message-ID: <202605070109.AxmGJ77e-lkp@intel.com>
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
head:   5862221fddede6bb15566ab3c1f23a3c353da5e1
commit: 9b1a6c925c88ed9331a2cae64fb3580e05345ded arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
date:   1 year, 2 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260507/202605070109.AxmGJ77e-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070109.AxmGJ77e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605070109.AxmGJ77e-lkp@intel.com/

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
