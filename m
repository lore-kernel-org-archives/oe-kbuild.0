Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174FF32A817
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757701410; cv=none; b=EwTK5WwPSI5RH/961OORbPq/hw+5ZYqSy42wrvE2PMnTw4yYU27adoMKfkF+5mwd1ce6q7aY9fqtXRubYL+fk7C3fxaDgxoM0e/HAITkhtFW92yxqR5Js3sYiMFDwM2EHU2OPFU+daaPrhZ4OSdqs3S3rqMVx/fQ1ShKtzQBDjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757701410; c=relaxed/simple;
	bh=bm6v7446fKfdxMU6KDHK4uvrYsvWw7d11vAVCKNiP6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJ8MkfGlYULrN7Gsf4DNYBiEj7hUsO5ZfTtbG6O27jALIm2dDXjJZXwzMrVZuv/a9CPTi1eCOfbXZ9lT2QVMyr48gOBzVfvemrH3P8bUpHeKJgJyymonHN4Os6jHVgcOJ1o9VKRjYQWDBxoKMvUp1J2qbe23xqb9g0e2TJp1uEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCDveZdF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCDveZdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757701408; x=1789237408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bm6v7446fKfdxMU6KDHK4uvrYsvWw7d11vAVCKNiP6k=;
  b=KCDveZdFtmGP8MDHs8w3cTJ3OUyv8/gaHPIBqH8GQJ4x9gCSiearxUeA
   hPnx5Mr367xtluO9Hf4ikyz3VZJqMD5mAfWdnmL/jQ973XMUqCTZGIat+
   ZkYQ7CqXleNc1rFyfzuvgaio1LpItqr2XOP+AtZH8Uxdit30/hmX32lNL
   Vf8OEzGaWk1rdz2Tis+xgnGQWHg1I60IIpOVcVFawihLj565yH8Nc5GxV
   VW0a1Fb92N0//Rqj3TQgU4qALJQT6zZJ/K2hiBFnEi58MA6ayMjIJKpwq
   LhiGks8ib1XIollmM/6PgUTAnWWx0J1kOF7u3MKOVi0kte5kX9QvhIorR
   Q==;
X-CSE-ConnectionGUID: dxHDRz0QSeqcA04De2sfXQ==
X-CSE-MsgGUID: p1RiGkv8SfCphHNdqVDGtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59279504"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="59279504"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 11:23:25 -0700
X-CSE-ConnectionGUID: 3+4VuPoOQ3yoga8Ll2S2DA==
X-CSE-MsgGUID: qSk1rOMiR/+31gb2mjDVcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="173944272"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Sep 2025 11:23:24 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux8Qc-0001AO-1G;
	Fri, 12 Sep 2025 18:23:22 +0000
Date: Sat, 13 Sep 2025 02:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:x5h-upstream-2025-09-12 6/13]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache):
 'cache-unified' is a required property
Message-ID: <202509130258.2oujJuyV-lkp@intel.com>
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
TO: Hai Pham <hai.pham.ud@renesas.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
CC: Takeshi Kihara <takeshi.kihara.df@renesas.com>
CC: Khanh Le <khanh.le.xr@renesas.com>
CC: Huy Bui <huy.bui.wm@renesas.com>
CC: Phong Hoang <phong.hoang.wz@renesas.com>

tree:   https://github.com/morimoto/linux x5h-upstream-2025-09-12
head:   0eb95c8741433390cd9b90399428fdddcbb54b7b
commit: a2abdec2af0287e433eab131e0cb53dd6a4344d0 [6/13] arm64: dts: renesas: R8A78000: Add initial Ironhide support
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-053-20250912 (https://download.01.org/0day-ci/archive/20250913/202509130258.2oujJuyV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509130258.2oujJuyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509130258.2oujJuyV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@10300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@20300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@30300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@40300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@50300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@60300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70000 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70100 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70200 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@70300 (arm,cortex-a720ae): Unevaluated properties are not allowed ('cache-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r8a78000', 'renesas,scif'] is too long
   	['renesas,scif-r8a78000', 'renesas,scif'] is too short
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
--
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a09g047', 'renesas,scif-r9a09g056']
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,rcar-gen5-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r8a78000', 'renesas,scif'] is too long
   	['renesas,scif-r8a78000', 'renesas,scif'] is too short
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g044']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
--
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a09g047', 'renesas,scif-r9a09g056']
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,rcar-gen5-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c070c000 (renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r8a78000', 'renesas,scif'] is too long
   	['renesas,scif-r8a78000', 'renesas,scif'] is too short
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g044']
   	'renesas,scif-r8a78000' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
--
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml#
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0714000 (renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7778', 'renesas,hscif-r8a7779']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a7742', 'renesas,hscif-r8a7743', 'renesas,hscif-r8a7744', 'renesas,hscif-r8a7745', 'renesas,hscif-r8a77470', 'renesas,hscif-r8a7790', 'renesas,hscif-r8a7791', 'renesas,hscif-r8a7792', 'renesas,hscif-r8a7793', 'renesas,hscif-r8a7794']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a774a1', 'renesas,hscif-r8a774b1', 'renesas,hscif-r8a774c0', 'renesas,hscif-r8a774e1', 'renesas,hscif-r8a7795', 'renesas,hscif-r8a7796', 'renesas,hscif-r8a77961', 'renesas,hscif-r8a77965', 'renesas,hscif-r8a77970', 'renesas,hscif-r8a77980', 'renesas,hscif-r8a77990', 'renesas,hscif-r8a77995']
   	'renesas,hscif-r8a78000' is not one of ['renesas,hscif-r8a779a0', 'renesas,hscif-r8a779f0', 'renesas,hscif-r8a779g0', 'renesas,hscif-r8a779h0']
   	'renesas,rcar-gen1-hscif' was expected
   	'renesas,rcar-gen2-hscif' was expected
   	'renesas,rcar-gen3-hscif' was expected
   	'renesas,rcar-gen4-hscif' was expected
   	'renesas,rcar-gen5-hscif' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
