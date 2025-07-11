Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6EC469D
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Jul 2025 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752262693; cv=none; b=FiMUDEzg6jaDkUDFuJ9VXagttxBMnad+y+QLqh/TNf4Y6dCVxRWqNxCbinRBYKiPDXFE8drkYj1zxjzTPJxIsSAkoGRDIB5e6zyYbqxi4bcWXzFq0bAh9QwyMGYHciDzs80FJY3kXwROEakeWBLlnRRkQUYOe5uINobJUHcnDxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752262693; c=relaxed/simple;
	bh=IArfCsQgG/Zc+p/mVi4IugdokM1VuiM7TgrcOczKxd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TpcKqpOFPe8tNR8hrKtWGm5FeodlTTdzcLU/G9zocgPiFtkSWWlAhVcQizbdvlXSiGDQkNqDzi8dLByERVsp6ao87dR8a6k4X2Zha4CryzJYmc3i+bnrBnFukhhzbTWEZRJgWJQSb17Uu4rJ4tAf/TwyAPrhjpNoIc7H9cQ9wvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdNLctOZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdNLctOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752262691; x=1783798691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IArfCsQgG/Zc+p/mVi4IugdokM1VuiM7TgrcOczKxd4=;
  b=mdNLctOZ7aNF+EP/X2ASYpiQV5cHiA8NBg7nALozS50gJxlrdA8qDajX
   32t/C7WHA3YQPU3DNDDIw44E7ayhikOHgE2A/KP301Fq/5NEUpHrNvzzg
   RclpSVNGrGLoYXi2EC6wXTNtrpgK3mKS0uyquP/4s4/YYNsDwsOsu3YVq
   QOzrZHnrMLDYYEZdZeM1F/mXnhzauASVLda8etq/wTdqAhUhUqfaVBHev
   ZxEpp4TVs2SIkz5HAOKs5For3M/zL8xcINVO5Bb5G24wt4RKc1XgKS3y8
   womNEYMNinbJpDqAkywEKU+bb4p/cibIrFxqi3RkacZ5XPS1iaWy8Cxk+
   g==;
X-CSE-ConnectionGUID: mH5mPhezQdSaK2WpgalQKQ==
X-CSE-MsgGUID: VdqrgALXQGi3q/E/cGm9rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65264545"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="65264545"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 12:38:10 -0700
X-CSE-ConnectionGUID: wnT//HiEQxeiRegzPgYrDA==
X-CSE-MsgGUID: G30l0v6OTpOGkqiVv72PHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="187417510"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2025 12:38:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaJZP-0006jb-1J;
	Fri, 11 Jul 2025 19:38:07 +0000
Date: Sat, 12 Jul 2025 03:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mkl-can-next:master 4/28]
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb:
 ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197,
 4], [0, 198, 4], [0, 199, 4]] is too short
Message-ID: <202507120321.4gvbMPi7-lkp@intel.com>
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
CC: linux-can@vger.kernel.org
TO: Frank Wunderlich <frank-w@public-files.de>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git master
head:   0f26870a989bf69957ed69d10c7ffc57ca5a7f52
commit: 356dea0baf4c0903ac188bf18e8ff1af0866c930 [4/28] dt-bindings: net: mediatek,net: allow up to 8 IRQs
:::::: branch date: 18 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20250711 (https://download.01.org/0day-ci/archive/20250712/202507120321.4gvbMPi7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120321.4gvbMPi7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507120321.4gvbMPi7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts:98.10-154.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1100a000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31 (mediatek,mt7531): 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
