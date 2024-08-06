Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCFA376E6
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 18:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722967841; cv=none; b=HCBy/7D1hMqQ5uq+MMKaprNwfdWEFjOPsdCz14r2zRd0I3UW7rSjhbh2x8n5FCBX/Z22AvYx6B17Odf2Jz4aQ79L9TYm+CO+flaBItX0awrslRHE8+VQsOw1Dedq+cs3B7VC+UjKHK0wWuCuC84bp0Aag2WlPxIRyrw6W38IN2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722967841; c=relaxed/simple;
	bh=JCuvAeN7DouDq59Dbnf+xmhbwuIkcJyOp2+NZzaoEHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fj1Kq+Mvtn42/eEI7cArEVVv2DaTdl1jWOWMVRbyQiiEasHgcicRvX4S7ioDtq4yQbvqcYZbY5TyW78VaGyKE76iBaGHZneNcM8hqKOSH8mJbJa5wnbqtyiVmqXTCPY1iI8TB+l8ths7bScBRBw6JMYQ0OhOwttrwWBtf+OOj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5bnESAC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5bnESAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722967839; x=1754503839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JCuvAeN7DouDq59Dbnf+xmhbwuIkcJyOp2+NZzaoEHg=;
  b=D5bnESACEI+ZJCHpnIlF338sJnXMSl6ABSW4bAKfmd0vo6W1xit5PMYa
   4S5WB93QwZXyPU23YxTLe/cJ1vvb1MUBLM00CgmnV0enSneHcK4mW6leW
   yQGrk5DbqvgFPzQCh0w27Uus6Sp4BivPtzAixfE+B8slRy9kGiOh7abNB
   fPZOHE2Mt9+hFaE0PaHq2UvWXcDAJNBweBxMw3a37acEOuoUGfB9tkvj8
   z5GfCmPx+147uq+Q7iH6dghhCrwRb8UDOrXUWxJ/FuZRAU7D67OMbm7cj
   UNiq7M9Vw2orLruWkn9bBnacGMv5UTqGNzhs/EuDQ22BUpbfwbJBJPtjd
   g==;
X-CSE-ConnectionGUID: +MkH2WT0SzqXz5ub2DPebA==
X-CSE-MsgGUID: veYGzxd6S/q7Hcpr/N7wxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="38511304"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="38511304"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 11:10:38 -0700
X-CSE-ConnectionGUID: 405I2T8iSRe4ygO1y2JkyQ==
X-CSE-MsgGUID: o4BZMQ86QBugUu2qcnM9ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61233890"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2024 11:10:37 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbOdm-0004jY-1S;
	Tue, 06 Aug 2024 18:10:34 +0000
Date: Wed, 7 Aug 2024 02:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 150/186]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@28c304000: compatible:
 ['apple,t6000-dart', 'apple,t8110-dart'] is too long
Message-ID: <202408070205.gXsORlEg-lkp@intel.com>
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
head:   764b25bdce40ae3e2e1b75a4783844617d4b0683
commit: 6c9268f335e66ae12abcdcfb5331b6cd1118333b [150/186] arm64: dts: apple: t600x: Add t6000 dispext device nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240805 (https://download.01.org/0day-ci/archive/20240807/202408070205.gXsORlEg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070205.gXsORlEg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408070205.gXsORlEg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: network@0,1: $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@289304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@28930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: mbox@289c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@28c304000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@28c304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@28c30c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@28c30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: mbox@28cc08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000: power-controller@290: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000: power-controller@298: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000: power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: network@0,1: $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@289304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@28930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: mbox@289c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@28c304000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@28c304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@28c30c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@28c30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: mbox@28cc08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000: power-controller@290: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000: power-controller@298: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000: power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: network@0,1: $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@289304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@28930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: mbox@289c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@28c304000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@28c304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@28c30c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@28c30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: mbox@28cc08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000: power-controller@290: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000: power-controller@298: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000: power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: network@0,1: $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@289304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@28930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: mbox@289c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@28c304000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@28c304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@28c30c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@28c30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: mbox@28cc08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000: power-controller@290: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000: power-controller@298: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000: power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: network@0,1: $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@289304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@28930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: mbox@289c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@28c304000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@28c304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@28c30c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@28c30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: mbox@28cc08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000: power-controller@290: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000: power-controller@298: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e580000: power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: network@0,1: $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@289304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: mbox@289c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28c304000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28c304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28c30c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28c30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: mbox@28cc08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000: power-controller@290: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000: power-controller@298: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000: power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
--
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@289304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: mbox@289c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/dcp@289c00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28c304000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28c304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28c30c000: compatible: ['apple,t6000-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@28c30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: mbox@28cc08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/dcp@28cc00000: failed to match any schema with compatible: ['apple,t6000-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000: power-controller@288: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000: power-controller@290: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000: power-controller@298: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e580000: power-controller@2a0: 'apple,externally-clocked' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
