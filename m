Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72091D1730
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 13:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734441415; cv=none; b=L8pRhUtpDTca6xZK4dZmh5leXJXYwgtYaiQeDu8CAS/M8X9Aadv7hV5T/34z0P/P17jE6vDC6qlLICq9fIiPcVgmSZTpP1vc1zWqGCFNFuqehsJRjPJJ7cyKAu4s+tnnTlNzfiPt7ueSpFbEOwbLat5pkSRZLEfUlivUz081TFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734441415; c=relaxed/simple;
	bh=G7cT45uA4Ekwe+vGTz8hzxJB8cnushGvchlnh+Mg6r8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ka161BsRb9VpBLfgWJiHWCXVYb0+oI9XC+cUkQS4r8PXSjfPG2C5lUSQQzoPd7EqgVmD2QEKsJFNPfLupZ6+8kGy9SNosXWQrqWyDJMnvNioVYwVxB5h0Adt5bomB/XAcz77lQ+sMSODjTgTuqcmJoZcuppu4WTBJlItRKTf280=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4wMFf8S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4wMFf8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734441413; x=1765977413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7cT45uA4Ekwe+vGTz8hzxJB8cnushGvchlnh+Mg6r8=;
  b=V4wMFf8SyuAl8k2Q8AcNurZl76wpuAbKppScKRFwc+ho/DAEHXxhnnIN
   NNnCWC6l7xVx57nPxs/cBtYwDfP86YXCfnQJAbkmozBA9V09VlcQp++j6
   sKo5Z3EjzMMXVDoYWkYCducmI8ua8gecnJEfRruOBVG3g4QDKMD9bB2LY
   UXx6paeqRDKLo5qgbMfM50z4uEGD2ooNb0Vgp5vT9f0B+kxfbXCZJ++bO
   HLUCD9Z8fzX+Naj2ju7aJumuMQnEq3dxQfjQj1OKgjtKxXlWSFfbzsAwP
   Vv6IqTTG+61CP3MFHNyCwQ6cf31E+XpAFV72jsQwVMZ5Vz3tpaN5CV3fj
   Q==;
X-CSE-ConnectionGUID: XbkSw3aMRq6HKfwUndIUfQ==
X-CSE-MsgGUID: n4IYcEodR/yKa6mFlGpEYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="35015148"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="35015148"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:16:53 -0800
X-CSE-ConnectionGUID: NDPQ1WqTS5qoBLkAAFeaEw==
X-CSE-MsgGUID: Qg7P6TO0TNi+pk4ZD/kHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="97310903"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Dec 2024 05:16:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNXRS-000F0y-0X;
	Tue, 17 Dec 2024 13:16:50 +0000
Date: Tue, 17 Dec 2024 21:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.14 27/31]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb:
 /soc/i2c@10090400/clock-generator@68: failed to match any schema with
 compatible: ['renesas,5l35023']
Message-ID: <202412172109.U1wmDz0j-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Biju Das <biju.das.jz@bp.renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.14
head:   acb247afab5bc2b4462f4dfc17a9d930e1153e52
commit: a94253232b0454ae3f45e2a941bbc0a1d5bdb955 [27/31] arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
:::::: branch date: 4 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20241217 (https://download.01.org/0day-ci/archive/20241217/202412172109.U1wmDz0j-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412172109.U1wmDz0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412172109.U1wmDz0j-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /soc/i2c@10090400/clock-generator@68: failed to match any schema with compatible: ['renesas,5l35023']
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8000: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8400: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8800: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: ssi@100a8c00: compatible:0: 'renesas,r9a08g045-ssi' is not one of ['renesas,r9a07g043-ssi', 'renesas,r9a07g044-ssi', 'renesas,r9a07g054-ssi']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: clock-controller@11010000: #power-domain-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
