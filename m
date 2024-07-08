Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A432143751
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720452691; cv=none; b=UdmodJEAwmw8rOKL/cfrj6dyZ6MLw4FQ5WXq87vfXgWeaMixWCoAKtJHHCiKugdHoGDpDkSmHIfe2ocC5g/1BDQwdvek51kXF6wj+cBzsi9BuGQNCHf3qmn3dP2xuAbx3cN2x5aAN8zMcaK6Xqm/jKA7Mkd2Yvb8Y33viWRczKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720452691; c=relaxed/simple;
	bh=s7cthipmBF/qHU4gvMOgQEEEDetbHrb+Mg0Ptt2bKYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IL9GOfduE7S0Zc2QXba3OgIvQIqsl6WmkrMjWJ8BUQR83+FrQ+FLmQ17MbpALz2VfQv3Ienv3jXVvQrarhY4BfLHT2ocMSR3lk3M/53kC/gXfVEemnGi6WAzm+w1uIzG62iuE2mVFUo2myMrg1mT1VoTOuaSAIyGYO+Bvh4CI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKZzLBV6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKZzLBV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720452689; x=1751988689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s7cthipmBF/qHU4gvMOgQEEEDetbHrb+Mg0Ptt2bKYI=;
  b=PKZzLBV6CmNPeZnuQu1XLxM2C39ii6LLjpj3Sf0F2eNeXGB8g2DOq7Zs
   Nb19jHdxW80bSqUxySFqItQnYI3w5dTQ01UAwBotyM7cjKW8ohgUjRQL1
   e1yr/l/DE+sfZ1q/6LiF20/PgQtHP3qmwzKAFZqqo3+8Zx/wI+pPC46sB
   aoF91bzHnjkBeZyi6OSjLgApDcHBsqZwQewWSYbpDIouSxvDsetQopkWn
   /59LEdoT7ijFYZzEVoUjBVQeAYA2ETjoEZSJrQ3ZgxRwB4OWVgK7V1ldB
   2lxMl/AKqgxo/3bx/osR96DZw4liO4HfbjV+kgWKhrMeXMB/NQkHrvXtC
   Q==;
X-CSE-ConnectionGUID: /7SkjfvMRgCD55Hhq+zx5A==
X-CSE-MsgGUID: 6e2FZFngRKWtUhXj6iTufg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28822451"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="28822451"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 08:31:28 -0700
X-CSE-ConnectionGUID: rtUruGTCRourbGVh83JDpw==
X-CSE-MsgGUID: kiotDseCQI+OvbknSirRMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="70745510"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2024 08:31:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQqKq-000Vpa-1p;
	Mon, 08 Jul 2024 15:31:24 +0000
Date: Mon, 8 Jul 2024 23:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 179/187]
 arch/arm64/boot/dts/apple/t6020-j414s.dtb: mbox@39bc08000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407082339.20WqhstF-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: 4136082e07135f46d14b888f121fcffa08276b21 [179/187] arm64: apple: t602x: Add sio and dpaudio device nodes
:::::: branch date: 3 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240708/202407082339.20WqhstF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407082339.20WqhstF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407082339.20WqhstF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@39b028000: 'usb_hub_oe-hog', 'usb_hub_rst-hog' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/dcp@315c00000: failed to match any schema with compatible: ['apple,t6020-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: mbox@39bc08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/mbox@39bc08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/sio@39bc00000: failed to match any schema with compatible: ['apple,t6020-sio', 'apple,sio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/audio-controller@39b504000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/audio-controller@39b508000: failed to match any schema with compatible: ['apple,t6020-dpaudio', 'apple,dpaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
