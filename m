Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1CB30DEB8
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 22:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624014; cv=none; b=KEH6LZNypu4Y+tybwsE1onfQY5Vof/Y4X/iOD2std9W+A5BLej4xHw8DzjxP5BBhQQSCAjRJzJ5TrNgKKaGHF+f1uuYiNFfW002qIW9WXbvGVvr2N2xd23L7VdVqifOcEfSM/7TXAlkgx+NeFgnBjSkV2IkXe5PxuRHCdKDFSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624014; c=relaxed/simple;
	bh=shc/kkOvT+6P+6OyqTj9P9POpt2TXR1SC886/43QG2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJV5MtTONkuRtwHygXmozuyf+7krLGthDNR0I1gwiNhAeAB9ZXWbbQ2DSglEK5l58c4YmXar5kMRKqGLmC4djCzvs+ZmAxuydSjHCxxhlBmNoilF2lMPHTkaiEvnk2hw7zuRQUCCygcbOOf18t6cTsg54lnfj3Wq2UM0fAU9YVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApNew/QA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApNew/QA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778624013; x=1810160013;
  h=date:from:to:cc:subject:message-id;
  bh=shc/kkOvT+6P+6OyqTj9P9POpt2TXR1SC886/43QG2w=;
  b=ApNew/QAsH9Bog/8/yAvdwAHhHFBlTNz188urbMywjO1F5cYtSh+eO9O
   aQxxiXAZxC9RaYSlgrXxMRMMB3DMn3GHsERhnuveCFluSaPNnsf6Y567a
   18N6uPd4DpwrOoWP66MGftA3GwZL+ykOQJvfYZtm1IowreITl+tOVL3Kw
   Elmy7c8BO/oFf4XR7uukdOvGSRCWqz/B+I89znL3z++4U8KQlKNpDcsYk
   2ZeWmDGXjhAn4DTRtSgEqdYu042swOwN35Nw+62kKLq9qhrmONZSw6F3O
   R/X/s/HhnhwASQvT8pGA7TPk0ADEm4ueI+kADH1ARdSAsVwit5kRhIUZn
   w==;
X-CSE-ConnectionGUID: FvI8DwxXS2KUB1S134+tDA==
X-CSE-MsgGUID: vKrlkUhXR0e4m0ESUDfB5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97114473"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="97114473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 15:13:32 -0700
X-CSE-ConnectionGUID: LKxn82oqT82vC54tJCQA0Q==
X-CSE-MsgGUID: Wr3lDOvJSxut0zFlAAbcpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="242870346"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 15:13:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMvM1-000000008MX-1tCJ;
	Tue, 12 May 2026 22:13:29 +0000
Date: Wed, 13 May 2026 00:13:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 [qcom:20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com
 1/1] arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000
 (qcom,eliza-inline-crypto-engine): clocks: [[42, 124]] is too short
Message-ID: <202605130053.tXXUeqSG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Harshal Dev <harshal.dev@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux 20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com
head:   e27264daac7d9ce892a2a5b4a864d6d9a3c9276a
commit: e27264daac7d9ce892a2a5b4a864d6d9a3c9276a [1/1] dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130053.tXXUeqSG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130053.tXXUeqSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130053.tXXUeqSG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000 (qcom,eliza-inline-crypto-engine): clocks: [[42, 124]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000 (qcom,eliza-inline-crypto-engine): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000 (qcom,eliza-inline-crypto-engine): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
--
   arch/arm64/boot/dts/qcom/milos.dtsi:391.11-395.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /soc@0)
>> arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: crypto@1d88000 (qcom,milos-inline-crypto-engine): clocks: [[45, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: crypto@1d88000 (qcom,milos-inline-crypto-engine): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: crypto@1d88000 (qcom,milos-inline-crypto-engine): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
