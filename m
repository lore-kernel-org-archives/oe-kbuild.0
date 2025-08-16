Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2EC1E522
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 05:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755320892; cv=none; b=CgN/ZNzeDTFs+YJnZbQk7EeySYwW4YOLRP3GULDpjeBeclSqi9Yxq+zJrVYsZRDtuY7jg70faq36vjEl+PJFBi0iMTa6OO4Iy+6ZlxF16GKCJ28AsjSGZQ8PJYu1icUgt8Ca9DHDvh4LswTfJVC5/lH8eQGBuh35Jj+ZharLXP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755320892; c=relaxed/simple;
	bh=JwP4OviUuWeU0rEqLHiUOxnAFxJCD4QRgJE0OsrbTkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQ03kjXUsFDc+XxwGf7AaaaZgPU5Fs9u2uYpZZxDpxN/5i+s4U6xV4KKtZtNK05OmrLbyAPgt02O35qYxtWJFX9+MLcrX9ihoiwyFY+3sQaTYF5Lq5sxL1gsZXdrcsQrVl1W2YTYlz6gfz0bpInBv0dXazfhz3HJb+xRq2DqfjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuB8+S1H; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuB8+S1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755320889; x=1786856889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JwP4OviUuWeU0rEqLHiUOxnAFxJCD4QRgJE0OsrbTkk=;
  b=OuB8+S1HiiAL6EfXbrJ029Hla2symHy9oxTBH9v14t2DNX4KKXvt1mDC
   Yau/oagfmFkms5mv8yE+UbuzftK/RueZynC7jDuZID8vPQ0as2t4o3Enp
   Ydi2CldWczdjoDK1Jj3i9k4nzTcrLLP4rpgPExWjZxnCDiQ4SNe0jBJcW
   uE9XgxwYmmPIqPZ1blKwvxYJ3LTVX2jeS9zGAVTH6ZXNYcYK/li7+OYEa
   zZQy4Jlvmuyi+2UosJNQmTXHfirXzkMQrlTLs04I9eb9bcRx3wbUgMGkp
   5SDLE8jf6Sv+fL0YWTyqH40ALxm4PYiKxYqiLO5u+3gZhVYBeDOvFZZW3
   w==;
X-CSE-ConnectionGUID: y9efcjygQDKMm5l87wV4DA==
X-CSE-MsgGUID: sgtP737+TTWue2O7O99bmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57561418"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57561418"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 22:08:08 -0700
X-CSE-ConnectionGUID: f/NvUjNTQRaxjWErtRZyMg==
X-CSE-MsgGUID: 9KR+WqhmRFieV/NlVa/Q1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167504893"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Aug 2025 22:08:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un98x-000CbQ-39;
	Sat, 16 Aug 2025 05:07:57 +0000
Date: Sat, 16 Aug 2025 13:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 635/801] arch/powerpc/boot/dts/fsl/p2041rdb.dtb:
 global-utilities@e0000 (fsl,qoriq-device-config-1.0): '#sleep-cells' does
 not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508161238.IfP6RtpR-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 241d63ed8c24bc82cffde27687ce4aa95a5f207e [635/801] dt-bindings: soc: Convert fsl/guts to DT schema
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250816/202508161238.IfP6RtpR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161238.IfP6RtpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508161238.IfP6RtpR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e0000 (fsl,qoriq-device-config-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e0000 (fsl,qoriq-device-config-1.0): compatible: ['fsl,qoriq-device-config-1.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e0000 (fsl,qoriq-device-config-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e0000 (fsl,qoriq-device-config-1.0): compatible: ['fsl,qoriq-device-config-1.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e0000 (fsl,qoriq-device-config-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e0000 (fsl,qoriq-device-config-1.0): compatible: ['fsl,qoriq-device-config-1.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e0000 (fsl,p5040-device-config): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e0000 (fsl,p5040-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e0000 (fsl,p5040-device-config): compatible:1: 'fsl,qoriq-device-config-2.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e0000 (fsl,p5040-device-config): compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e2000 (fsl,p5040-rcpm): '#sleep-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5040-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5040-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p5040-serdes']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: dma@100300 (fsl,eloplus-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e0000 (fsl,t1023-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e0000 (fsl,t1023-device-config): compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e0000 (fsl,t1023-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e0000 (fsl,t1023-device-config): compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e0000 (fsl,t1023-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e0000 (fsl,t1023-device-config): compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): compatible: ['fsl,mpic', 'chrp,open-pic'] is too long
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: global-utilities@e0000 (fsl,t1040-device-config): compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e0000 (fsl,t2080-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e0000 (fsl,t2080-device-config): compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.1' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e0000 (fsl,t2080-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e0000 (fsl,t2080-device-config): compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.1' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e0000 (fsl,t2080-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e0000 (fsl,t2080-device-config): compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.1' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: global-utilities@e0000 (fsl,t4240-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: global-utilities@e0000 (fsl,t4240-device-config): compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t4240-sfp']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t4240-serdes']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency', 'device_type' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@42100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: timer@42100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: global-utilities@e0000 (fsl,t4240-device-config): compatible:0: 'fsl,qoriq-device-config-1.0' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: global-utilities@e0000 (fsl,t4240-device-config): compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/guts.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t4240-sfp']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t4240-serdes']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
