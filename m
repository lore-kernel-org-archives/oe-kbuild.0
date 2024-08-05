Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771013D53B
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Aug 2024 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722881452; cv=none; b=uQsWpz1uhDcHBPrH6rtAnNOgx8fhkcM+11N3x6ocQ+8dMB9gTNICkIQW8vuuZnKaWjHpq4MrIs7B3l12lOn3efWmzbguMhE+1vstP235ETYIgzS+/LfXblJFdB6mM6Z/qHWYEjWD5t9xiqquYYyQ3GmdLAhC0kPtCahiJAxB+7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722881452; c=relaxed/simple;
	bh=UvXeWUjwu0t3OzSEhjTzqDaon9w8/o/aIRHQ0ukHu4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJ8mGrmcLbZY8vKCjwKcmATiP3Yh9ZjsOwM8x99WVcJpPDUxudvJL/kVvujdFJ5L0fwfzoTdXzfC2eCxU3HCeE4O/Bfu/jD5ueQ6IwFD0dOW2pdV0rHLMlO/3cs+iCej0hJ6tuqqOKy5c+qygDCrjuvOjWOcDrmv1akezelSEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaxrxwNl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaxrxwNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722881451; x=1754417451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UvXeWUjwu0t3OzSEhjTzqDaon9w8/o/aIRHQ0ukHu4w=;
  b=iaxrxwNlyJ1HX3hKbc0WAPAmuqtBvqYCBf4CmOE0df1wiPyao6QcEoSi
   M2lxUDM0dbnGQBhY0FmITxa+5gQRfXPawWY6DjBT4kkpG/dg9VFyig7KM
   I/4O2SaIj2eiAX/GB++GArr2jnnru5HtWlalbgVttym5tgYqHy3tEWfko
   uoIOhac6odC9zTlxdi3F+sAz5HAsKWjLBEzUMlshAxE975X4TXgalJkfT
   x7HQkspZzn4s7D67044hhsGaB7tudvZUvLh0C3uQgxKqVypWEuEuL2B3X
   22R7RKjPQ4Ch4eofwj7uanTVWPtmDSro6HNBIxCwXWMMKe5P9p/oux5mv
   w==;
X-CSE-ConnectionGUID: U+YmHVxCTBq8yhye+Zfxvg==
X-CSE-MsgGUID: s5DONhNHQQCoqB83stldsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20716033"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="20716033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 11:10:50 -0700
X-CSE-ConnectionGUID: +BLyYyjcR+mPpAyOrHs2vw==
X-CSE-MsgGUID: KmruIayDTIO7FAMgLNYRHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="86833737"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Aug 2024 11:10:50 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb2AR-0003Pi-01;
	Mon, 05 Aug 2024 18:10:47 +0000
Date: Tue, 6 Aug 2024 02:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 12699/13217]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated
 properties are not allowed ('dma-coherent', 'phy-handle', 'phy-mode',
 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config',
 'snps,mtl-tx-config', 'snps,pbl', '...
Message-ID: <202408060203.7OzdIHxS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: ZhangPeng <zhangpeng362@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d59a335bf0dd2aac9debe211a0a07fbeaf605fed
commit: 79effa9d33aed236955bd5d6ea9588b16958803b [12699/13217] arm64: dts: qcom: sa8775p: mark ethernet devices as DMA-coherent
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240805 (https://download.01.org/0day-ci/archive/20240806/202408060203.7OzdIHxS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060203.7OzdIHxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408060203.7OzdIHxS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('dma-coherent', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('dma-coherent', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
