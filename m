Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D6446A2
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722411089; cv=none; b=YhY0Ps50QRTbDbPjzDReFa96RMwGpVh+E9+mpfglcMbrfLt0wUHvFToBguhcbN12zCjkaddT6XbnHd9qONjNbbJB2JynixfHeVRko5syYzCVxPUXqkljytqiL6pVeFjFMp2k+Wz31F2zNtnxztHu8Ypf7PiezCpZF8vHNppP+b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722411089; c=relaxed/simple;
	bh=L8q1eVrBC780JuUtOzJYae3O7gk5BKQVUxuVHtB4LY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EszW56lYeKYajlzPw8gcSXJkUKN4SDvqXVzVbgokLc6tV0rTBUXs8/zUCC86ARnchjD8LSvqaTQ/HgnQagJlAHb/mGV2wKm6tQVk6w5gJNhgY1N05Nt7VF1bim/u3qLMukDoS9Sgw95ypa+bu4ccVingmis8t35KEZX22Udk9jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiLabRPW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiLabRPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722411087; x=1753947087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L8q1eVrBC780JuUtOzJYae3O7gk5BKQVUxuVHtB4LY0=;
  b=PiLabRPWdaNMXMxOZbD/hC46D2kyZJO9SNdOcb41mUsOA2ELM88wWbRB
   cxoaqB9BS6h5wiDSnDGB+BW61S/k717Kp/TErb/K7vEXthps9JhKRTzVu
   Fa2N0A6cBgwTm5oADBmhT+r5MHE41H7guiJGconOmXqRsMYoVs8gSJLxL
   +sHokRZbfiMAz2D2LBTZ0d2uRtk0vIsybXcXNJS66RrspGm5WYvCRaWfa
   LLd4NK0P93ITQc1PUCs57si37sKTYdLqqCsMK+c9YZC/+eMkzRKPbB7eL
   seHOtQ5NN2eSQ01LieiCWM6oHsXk7D7psAys23ekxVuKyjX7+NQ9iB0k1
   g==;
X-CSE-ConnectionGUID: b/+QBszzQkW3Jl5XxPc8DQ==
X-CSE-MsgGUID: TeiALXEiR3+VLiI/T1NHsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37784844"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="37784844"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 00:31:25 -0700
X-CSE-ConnectionGUID: UobO9CUyTEOgE6scQxobuA==
X-CSE-MsgGUID: dVyDqrbESUS+KkaCcbvr7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54647365"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2024 00:31:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ3nu-000tyy-34;
	Wed, 31 Jul 2024 07:31:22 +0000
Date: Wed, 31 Jul 2024 15:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.11-rc 30/39]
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb:
 crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0,
 119, 4]] is too short
Message-ID: <202407311540.teHKJ5Rl-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   d0b454428b65bf8df63ee618297329981b9658e7
commit: 4d8a0645b366bb973eafdf28d7cb126663bc3583 [30/39] arm64: dts: mt7986: add dtbs with applied overlays for bpi-r3
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-051-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311540.teHKJ5Rl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311540.teHKJ5Rl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407311540.teHKJ5Rl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0: Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: switch@31: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: switch@31: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0: Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: switch@31: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: switch@31: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
