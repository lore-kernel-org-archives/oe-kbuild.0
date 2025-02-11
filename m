Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ACC79C0
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 02:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739241001; cv=none; b=q4wzsupW1FEIVl9uIcBDnbZlgLxK5gYoVKUeGyCG+cwLdnolYVuFfW6pL7pmOsvNeJxsSR06f3svRDMgtdFWAcNqGDtkDJaB3ar30eLey8IshkoBgs0CCc8X8X2Q/wZ26dKXIhg4PAl2+XoGBdVnDB5MRzYRjipw8Ctt7zqe0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739241001; c=relaxed/simple;
	bh=QP1s+GRyeGWYgd/XEfrG1KBU3PpgoOUC3wft20WPccs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IuqlIZSMlAIlzEL6eo6cFw/4U2ZZBoMrre1uWVRBTxQjorM///S7rT5Tygxe5y3JmgSJ+7OKvF2wOPd8VoHi6/Sx3sQbv+ik5xput+uHxhtjgJMbJE/cH4ixAZ/y06ZgZ6Px+UWHf3IpLQs0W2iJWOhjvUoIHoG2wzebzzT1EXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcUeNepY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcUeNepY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739240998; x=1770776998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QP1s+GRyeGWYgd/XEfrG1KBU3PpgoOUC3wft20WPccs=;
  b=dcUeNepYZCal+MkkRSMZvbUwweIa2ScphWsBhqa3qAgAFb2ZU56okE1Q
   f7GOP1SurxtmnKea6wXUD0U4HfuG6vRVwY5kAVvoP3W7JuxznBoLBr+jI
   AY+bekhPXWu48d/cjidCX5Nvg9k6XzoI2AUvL5gF+Caov8l8KmFapTk2S
   LLrIg2cauQmvoNo1vc6vzeNfs7xdlAaxKdto3dQQdwtzzlxtEvUiO5iTS
   ZCc6pdkBik+z6jYnCekcYBExtxMX5CXAcOb6aSLXuNImONbWyC5xv7XRI
   5wadrt53Ajhdqcvje8RQJZjRkrrk068wFOLE1Nj91KuKFzsLwt9a5rROS
   A==;
X-CSE-ConnectionGUID: e1xN+sizSdCilsUYWU+cZA==
X-CSE-MsgGUID: 968PlD45S3yGdqaY1IXRGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50076838"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="50076838"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:29:55 -0800
X-CSE-ConnectionGUID: +1+4XppTR5q2eh9+oQteKg==
X-CSE-MsgGUID: +urD3HSTSE23WYBCl79YjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="112206847"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2025 18:29:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thg24-0013fj-0B;
	Tue, 11 Feb 2025 02:29:52 +0000
Date: Tue, 11 Feb 2025 10:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 180/191]
 arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@394ac0000: compatible:0:
 'apple,t6020-dart' is not one of ['apple,t8103-dart',
 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
Message-ID: <202502111032.0SMxs1XN-lkp@intel.com>
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
TO: Sasha Finkelstein <fnkl.kernel@gmail.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   058e9844046713928f5f78593e66e92da1b0c0c2
commit: b830d7177a9017bdc9f5c02a1553dcb60185db85 [180/191] arm64: dts: apple: Add SEP device tree nodes
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250210 (https://download.01.org/0day-ci/archive/20250211/202502111032.0SMxs1XN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111032.0SMxs1XN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502111032.0SMxs1XN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@394ac0000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@394ac0000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@394ac0000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/sep@396400000: failed to match any schema with compatible: ['apple,sep']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: mbox@396408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@396408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@394ac0000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@394ac0000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@394ac0000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/sep@396400000: failed to match any schema with compatible: ['apple,sep']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: mbox@396408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@396408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@394ac0000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@394ac0000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@394ac0000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/sep@396400000: failed to match any schema with compatible: ['apple,sep']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: mbox@396408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@396408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@394ac0000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@394ac0000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@394ac0000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/sep@396400000: failed to match any schema with compatible: ['apple,sep']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: mbox@396408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@396408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@38930c000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@389c08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@394ac0000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@394ac0000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@394ac0000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/sep@396400000: failed to match any schema with compatible: ['apple,sep']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@396408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@396408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
--
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@38930c000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: mbox@389c08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@394ac0000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@394ac0000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@394ac0000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/sep@396400000: failed to match any schema with compatible: ['apple,sep']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: mbox@396408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@396408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@394ac0000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@394ac0000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@394ac0000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/sep@396400000: failed to match any schema with compatible: ['apple,sep']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: mbox@396408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mbox@396408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860fc000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860fc000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@3860fc000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@3860fc000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/isp@384000000: failed to match any schema with compatible: ['apple,t6020-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@394ac0000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@394ac0000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@394ac0000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/sep@396400000: failed to match any schema with compatible: ['apple,sep']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: mbox@396408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mbox@396408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
