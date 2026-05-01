Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AAE37CD3F
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777628992; cv=none; b=bw0ZHnX8u+wIRierndA969iTWH+c/EVEB6pOfMbHR9YAjmzZkJEE0WVo/mBUOucRoXT9IcTLE74Y8e+a0Q2m1zMGmLQqosjqmIyUatp4drJvGsFUvMuzYIG5j9UVPkZU/UpTPOicEWEgbz8M6HP3ouDHbz5rnbBsf3C7YimcmG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777628992; c=relaxed/simple;
	bh=OjVdo1KpGywMc0LqkNrb1HsAikDljRkPrrv5camEUfA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nmGjalH1xtJ6jw93N8ISS7DBVKoaYwzY4GQAij0v9VwBUWBZivBet3zoBTwYF2qqnDvjzy6jhtnh9UzDKFZ9nGiBDESMQxysWmQYGzzkkmUFmD76xpVdBUktaUdD6tJN5XA91BemI8Rsak1QZ2WeeR5GT0JyG6PF7UV2x7RmEUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q32h2DgR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q32h2DgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777628990; x=1809164990;
  h=date:from:to:cc:subject:message-id;
  bh=OjVdo1KpGywMc0LqkNrb1HsAikDljRkPrrv5camEUfA=;
  b=Q32h2DgRB10IY7o0noqqXZKIBGu1b9cUljq8nn4kDtChcQITUJ5wNeFi
   gmudr0jxplUf35WK2izGB/BmDpwTNZ5RFvozyM20mZrUxaDfUh48f5Vsg
   GWYM85ubh49ir/e3NoEVH2ze6713UykDnAi9szUpkLr6/Ux/BweHadUHZ
   Wyd/EVLi51MWEInukApLtMXzBJ2+sk7zKXlisLdshc4wXOKiSWvINpf9y
   v6s/TwLuhK6kr7EoXE1gVtRM/7jAA27E1Vjsvex5P4nhPkxRV53CFvdhO
   Y0N73rDvBvVC/M8yyjktjPso5336ZZnTZ5y8445F6aVuoifVtEEnAvVk6
   g==;
X-CSE-ConnectionGUID: iqMVB6ITTa6Hgv3xQgCTeQ==
X-CSE-MsgGUID: A+KhQn+7TSeiKzoq9c0VRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="96009319"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="96009319"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 02:49:49 -0700
X-CSE-ConnectionGUID: YMHbHvZgRFicKdmH7p1jQA==
X-CSE-MsgGUID: deONhSRsTMKn4iyE4blTVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="236627932"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2026 02:49:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIkVF-0000000051V-3Iy8;
	Fri, 01 May 2026 09:49:45 +0000
Date: Fri, 01 May 2026 11:49:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb:
 geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
Message-ID: <202605011135.S9rAN3fN-lkp@intel.com>
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
head:   26fd6bff2c050196005312d1d306889220952a99
commit: 9b1a6c925c88ed9331a2cae64fb3580e05345ded arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
date:   1 year, 2 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260501/202605011135.S9rAN3fN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011135.S9rAN3fN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605011135.S9rAN3fN-lkp@intel.com/

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
