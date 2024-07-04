Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F91AB8E4
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089307; cv=none; b=HUeXgcapPqb6ire8z3xEW3gJxAe3Em+IZLRpEgCd9jL+aR2b/DEHQJFDf87rHak/WUq8XBhmWOSAOo7Y9aqa5Sza1ZnHA62ac5FhPQU2k46JXzycctxHaUQmAYxkS6wS4Xelz+++eEgALq9FJwpNDdSyOdspqA/FVptP6dF6brE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089307; c=relaxed/simple;
	bh=izs4KbT6Z1JpAz62WrY5N6tO3IQy2WQSTgbw48GoDpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oJOrjX0g1Awo/CmMQQaMTt4sEKVi/WFZ3t/NzsJxusidjigBiEVsAhzx/VWyWHGV73Rgf2L8AnDA8TBKIiai7u83Okgj0T81Uak5ecisMEX1M8rCdEt02sckT7VDaNYRfLdsJ8fSpW1EqZpuRKJRfDeM37SXEpsaRzuuUlh53cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhD4Y5BN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhD4Y5BN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720089305; x=1751625305;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=izs4KbT6Z1JpAz62WrY5N6tO3IQy2WQSTgbw48GoDpc=;
  b=PhD4Y5BNDGSOJ3n6lM6Q7lFy+9oYgSX4BsFNMzjWRxF61eumpqmaqGOL
   TNdAO/ERGCauRqwlYqHwS2t3zF+385Qt/vzNxGxaf4GpIh50XMKf/MWmc
   Y0fGfbNehUMT7vTJSyQ5xUJHQm9E1AZpf7yXXgXMHoL+RNLFurNzBkwQE
   5DzSPh6zkaT526LgTl+REJbFGM1aw6fBEqwlO9ShQrMU+POlpTzxSq88C
   neM8WcT23B3DlHg3UTic+ih8Tqhukj3rVzty1o7Ohy9+4667iRyfGGbnY
   m7KaIZSUTCe0raL/3J7sbW4ZL4sCIORUAd3tMoNaL6Ag3rMZ2YiZFWrmx
   Q==;
X-CSE-ConnectionGUID: 5qgNcMdLRcmgrI2DSoEyzA==
X-CSE-MsgGUID: KgN6HzRmS5S74uVErMpE3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17313158"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17313158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 03:35:05 -0700
X-CSE-ConnectionGUID: CZ7gmpnGRIiDzpqeGjCulQ==
X-CSE-MsgGUID: zii/gvUTQQepKu/ikQvy3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51425920"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2024 03:35:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPJnp-000QsB-2p;
	Thu, 04 Jul 2024 10:35:01 +0000
Date: Thu, 4 Jul 2024 18:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 108/187]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31: Unevaluated properties
 are not allowed ('compatible', 'ti,sdout-zero-fill' were unexpected)
Message-ID: <202407041850.B1fsaCfM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: cd8e8fe54193c919b3ea866f6d113482abd27fc4 [108/187] arm64: dts: apple: t8103-j274: Add speaker I/V sense slots
:::::: branch date: 3 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240704/202407041850.B1fsaCfM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041850.B1fsaCfM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407041850.B1fsaCfM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8103-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8103-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31: compatible:0: 'ti,tas5770l' is not one of ['ti,tas2770']
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31: compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31: Unevaluated properties are not allowed ('compatible', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/i2c@235014000/codec@31: failed to match any schema with compatible: ['ti,tas5770l', 'ti,tas2770']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48: 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48: 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48: 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48: 'VL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
