Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D567F48C
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434478; cv=none; b=GqI1cug03smsNfmsQssXhEaCBkjX6gzpVg7hTi4GW0sV5/L3ttNIX5DjmkCCPFU/nQ0NSNJyToFJ79G+26J36DcxNGKUZ0OamUgevqLIlCTgKhYTZEJ2M6EA3g6xL0VfX520tKj0vfW0EnY6xkarwlDFoAbbz0uqqz/HqZQc2i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434478; c=relaxed/simple;
	bh=e80qYUy3hUCHMXvuuCuEBTM0SjuFMzYulQ0OR8c0hoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ajdqF7w+hN5kAqjEYQJygHzzWAZ2Qd9JWqkJwc3mgpRJlNrN048JhbWIidtDw67EbrN225fGfbHAL80EamJv4HJ71a8y0Vqr79UN6EoccycgM/hBeu0xD3C75vZaPzyBYwq7+tmY0/pEVKW3P7Lx6YZsIhrqn1YvPvedV3FJX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=li15IyVN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="li15IyVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720434476; x=1751970476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e80qYUy3hUCHMXvuuCuEBTM0SjuFMzYulQ0OR8c0hoo=;
  b=li15IyVNMOAvQ16lrPfH0/I3/OchUhpnO74/t4W8waLjVruofel4obCd
   mj/ajjIJWxGc5nXl8D6MxaokJq34R2fP3rW1Zn2FuC1hrVJnPW/1f4k4q
   j9BGstcNd12owKEZNP1PKVspyVMdnAEIAUztx5b3AU5PTKuKGeF3ON6DW
   RhAGKj8jxBSc/wyoT/qv25p1JouwSkIcyKdpAIGyreuBIhnqrUt/1rVXn
   708mklhnOMpoCG5q8po3aA5/CKB7FpePPesn98pLp9egT1ABPgPLJL1X0
   h6RafRgCK0a9u71/BPi6d5TO/+i2VNsQyVU8I/224Vbt+0mR/Xjd5Qi6X
   w==;
X-CSE-ConnectionGUID: ROfRFISgTMSWXnujx2iF8Q==
X-CSE-MsgGUID: MLgf0JPrRMS1LNuZQIEmUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17266228"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17266228"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 03:27:55 -0700
X-CSE-ConnectionGUID: myU8DxMSToelrQMDSjWSjQ==
X-CSE-MsgGUID: w+VMKM5qQs6sRQ5npSLyNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47385917"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jul 2024 03:27:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQlb5-000Vfk-0f;
	Mon, 08 Jul 2024 10:27:51 +0000
Date: Mon, 8 Jul 2024 18:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 170/187]
 arch/arm64/boot/dts/apple/t6020-j414s.dtb: mbox@2a9408000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407081812.pj1o6mup-lkp@intel.com>
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
commit: 5275c05ac59e528701bf40a9c2bbf97a28ebdaec [170/187] fixup! arm64: dts: apple: Add MTP nodes to t6020x
:::::: branch date: 3 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240708/202407081812.pj1o6mup-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407081812.pj1o6mup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407081812.pj1o6mup-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@2a9408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@2a9408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@2a9408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@2a9408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@2a9408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@2a9408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mbox@2a9408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mbox@2a9408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
