Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8673825634
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 22:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744065172; cv=none; b=AC249E4JxhFzBr/e45xlsebOTBbGpolYCbH+CtTQGyjNBYQ0VP+ft6xkGBSmd0qmYBSzLNVwW8rmLfxXwBYJBF57DNHNmLeuhjBVG5YaWt4tNORSwTet2GPwf5iI18Kkwh2a8l7qY1mS3YIPSY7V/gDGLNFyHZafeIafpjhwbYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744065172; c=relaxed/simple;
	bh=g7ZRmUPGC/BSCzzYMC6GIwAsS0i5IoYXKoDo4RWoK/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TaH8uGPWgLrL6OiV7FDlydU8z8msBhh/Ufy53uTGpeNJIwSihlqx2WK+1YcAaEzO+wu2cmLEA20h7WAEvC0xLIDcp2nWRYqI4Uvav/T4bg9JdwTg5n2UC0n0rGXRMpqQU6qQTxT2ioT0+JnggKED5KCTD8u5qAkMRGnK/l55Vb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPCR2XoF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPCR2XoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744065168; x=1775601168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g7ZRmUPGC/BSCzzYMC6GIwAsS0i5IoYXKoDo4RWoK/k=;
  b=GPCR2XoFQkr+D74CW+3O66FrNNzfu754Qt0v2HnXbpEJjMJjRLb/rV4A
   twBNfVBItIFQTpFYNJDLJSC2GXQGVfl5lzNTyXr5LsQhIv+xpCUfpqFa3
   9b94EbRmuYF1LA3ecuCex/icH07CoyRhkv1rzpkUd+dn1+SN91PJAwxvv
   sQ4d+7XqTXs7o1PJKoaMQDt4rngiteNaV+wt42OX7Y/MuM7dfg3I27iNf
   JHXPK6vnmOqtyG3GBFvMtYdQiS1/RjfPMkruqTLRoDidxNlGvoxreyASo
   ZrJUZhmneB/XHkc2G4mRo+tsyAklIRwzZX0I9sVeZP8uT7I2cfsW2l99K
   Q==;
X-CSE-ConnectionGUID: R3oxh2vSRIabVhuLMaGWbA==
X-CSE-MsgGUID: TnXluL0hSyaSxngZfIexRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62877657"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="62877657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 15:32:47 -0700
X-CSE-ConnectionGUID: 5jYYkhdYSF+qzJeAeS9Viw==
X-CSE-MsgGUID: NH01FQBcSzyvMrnY07kRvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="133252275"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Apr 2025 15:32:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1v1H-0003rx-0i;
	Mon, 07 Apr 2025 22:32:43 +0000
Date: Tue, 8 Apr 2025 06:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 81/102]
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202504080644.LtHIQlhR-lkp@intel.com>
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
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   239252d33658f16e30ebbe940292946ccc610d00
commit: a152e6db5f68bc9eba427b591e523a803adcc087 [81/102] dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
:::::: branch date: 32 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250407 (https://download.01.org/0day-ci/archive/20250408/202504080644.LtHIQlhR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080644.LtHIQlhR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504080644.LtHIQlhR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5211.22-5394.5: Warning (simple_bus_reg): /soc@0/isp@acb6000: simple-bus unit address format error, expected "acb7000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4838.11-4848.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['asus,vivobook-s15', 'qcom,x1e80100'] is too short
   	'asus,vivobook-s15' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'asus,vivobook-s15' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'asus,vivobook-s15' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'asus,vivobook-s15' is not one of ['qcom,apq8074-dragonboard']
   	'asus,vivobook-s15' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'asus,vivobook-s15' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'asus,vivobook-s15' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
   	'asus,vivobook-s15' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
   	'asus,vivobook-s15' is not one of ['wingtech,wt82918hd']
--
   	'qcom,sm8350' was expected
   	'qcom,sm8450' was expected
   	'qcom,sm8550' was expected
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /: failed to match any schema with compatible: ['asus,vivobook-s15', 'qcom,x1e80100']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
