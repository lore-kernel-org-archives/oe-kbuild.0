Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87EB28EF
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918133; cv=none; b=sfk5Bh18HhgMPL/nWVXVz4nQ/Iu1ega8sPQIu3nQpjnthtdjOMEf++3aKxM4HsCjreoPBsP30HSvszdxqvERyBjJeXH8OZj0tJraJMCHsmfOoq2Olz/wCrio+7o+jBYzTMMFK4gUvy2SNftnJ7A3qjLqiYRk1/gUnF3R8XcWRO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918133; c=relaxed/simple;
	bh=XX6LFH5p7lkBifndZ1LhQ5L+HnkpF7B+b7g054yXGTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gII1HVfqDEQfAL8cbuQgbz5r/FEX8yKTvSJWtSA7bCSwZir+PXUgoeqWID6LkJ1yH/M6AACsqvJWTagp9dwkxcImcpnxEsbaHr1zZRG2wj/+WWRTvuGyynrxu2tQjH0ayIYUf/RukozLeFCPbU36af+1XTIT+zT5u+HBnRj97Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNwS2Boe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNwS2Boe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730918132; x=1762454132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XX6LFH5p7lkBifndZ1LhQ5L+HnkpF7B+b7g054yXGTQ=;
  b=BNwS2Boer9kq0eA4Qxxl+U7HtsZQCzmtZ96BEqQt29tdaMR3GvxZyYMt
   5v5VQtRP2yzg4+SLT6Vxw4lcgDlscpUdidQtY2xQftrNZOHhjrRMz6BCs
   ZKKY3cKpFqlIDPXDxh3v0MVSwZcKAiTLspJGdmeioN/q2MSdMbRuwSRK6
   BnkS57Un8v4pqKL0UBppF4vcbELRJwyFyQ44X06Rr/uqrbY97yG+2Bwnp
   cXt+8GpRs5X3Avp70TUaqksxY4++PzqVlSCJPBO/n4Y3oMCfBHdD16Lmh
   AzOaMHoO6a3kyo0DvZGY/AlvYMu83fONaoLXJ7SryJYGWymKSC37eIzdK
   w==;
X-CSE-ConnectionGUID: 8gQjYqATRHqPyZbn8pQB6A==
X-CSE-MsgGUID: PtsI4PX9TkyiwDo6JE4aVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30957230"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="30957230"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 10:35:31 -0800
X-CSE-ConnectionGUID: EwdODaIYTMCSHlJbepI/xA==
X-CSE-MsgGUID: UMv6pZVBScGMlkDnk0cVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89231679"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2024 10:35:29 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ksK-000pHY-1A;
	Wed, 06 Nov 2024 18:35:28 +0000
Date: Thu, 7 Nov 2024 02:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-partner_predev 81/81]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated
 properties are not allowed ('mdio', 'phy-handle', 'phy-mode',
 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config',
 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-...
Message-ID: <202411070207.6gluS0i7-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: 120ab6c06f69b39e54c949542fa85fd49ff51278 [81/81] arm64: dts: qcom: sa8775p-ride: enable ethernet0
:::::: branch date: 7 days ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241107/202411070207.6gluS0i7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070207.6gluS0i7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411070207.6gluS0i7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
