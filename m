Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0E314D1F
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Aug 2026 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785695670; cv=none; b=WnVOYDMgJvyG4ektqGBai74Xbaz3CWjfglI+Px+BMh1XPdbCKLMAjpOdRM1zPbWbiYI+Gs4iZPNk17tUuJR/7XkyprDHLYwNlMJbQvOStuqztU6QRpbJp1iSflDHLCYOloSfidZkbIJJ/cZgDEJvKOw8ddENc176hP2S+GFmk2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785695670; c=relaxed/simple;
	bh=7MpuzSUA1cFlYvvtscSCCqcpJfIF2/0+g14m4aWif9c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WkQJk536nK7wLHXXCL4wNUwZSvD2fIE6QwXul5KCbx8dhKVUTwuhU8XcBZ6GrBVZMFdR070+miWGcOQfuoIUNEghkYC4gX7K86h6VDgKKWXP2p8+Oy8kNk283if9jsSucfdUACkh6ikeOlaDhl3nx2V3Vqc1/o2fmIYpOv3z45o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3oWXGEk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3oWXGEk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785695667; x=1817231667;
  h=date:from:to:cc:subject:message-id;
  bh=7MpuzSUA1cFlYvvtscSCCqcpJfIF2/0+g14m4aWif9c=;
  b=D3oWXGEkPtK1RrP8nm8GVQNJ7oR3oKGH1aWDM6FhOFvF2a07ebAWO5aH
   cBacELq21Ez2zHrYq0bpeM+zHj+M+kiuJOqK6ht1takskcEo5Mt15570U
   G5tTfQXWuI4qKYjLmeUri3OLgSYuxC21InkFJnp3/s58c7H7mwWTL6Q/X
   jACgB5SiDXc7moUNVMi5SmLdAcE3UdK5sCem8+01FLlAJVlvcubkRlRvf
   kMSmtaVdzgTi+1Da2F0gNGqB8h5QZPkeYw0k4iaeoAZKK4axEtk15Mt7F
   3JqV8SrA5KcKJL2AL3jFRv9wjg0MtDgZCe0vIol6R2i63MvXcdwCrlr7Z
   Q==;
X-CSE-ConnectionGUID: 1KCU6kycRlO1PSxPEf8KMg==
X-CSE-MsgGUID: xZ7bAAz7T6KdqVlrdlCG6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96832988"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="96832988"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 11:34:26 -0700
X-CSE-ConnectionGUID: uxoyE9FlSBuZJ0U27zFvOQ==
X-CSE-MsgGUID: nLhXTB/zRYOgHOu4xRSABg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="263016441"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 02 Aug 2026 11:34:25 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqb0x-000000003hy-1GcE;
	Sun, 02 Aug 2026 18:34:23 +0000
Date: Sun, 02 Aug 2026 20:33:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sven:apple-soc/dt-7.3 21/23]
 arch/arm64/boot/dts/apple/t6031-j514c.dtb: watchdog@2a02d4000
 (apple,t6031-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202608022023.02xq44wc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sven Peter <sven@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git apple-soc/dt-7.3
head:   6e890bf6442553c7bf56867a91c2dbcc2c295900
commit: 67d9574cf8ed1c81c472b932a9d9819f47fb5286 [21/23] arm64: dts: apple: Initial T603[124] (M3 Max and Ultra) device trees
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2055-20260801 (https://download.01.org/0day-ci/archive/20260802/202608022023.02xq44wc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608022023.02xq44wc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608022023.02xq44wc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: watchdog@2a02d4000 (apple,t6031-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-wdt' is not one of ['apple,t6020-wdt', 'apple,t8122-wdt']
   	'apple,t6031-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/watchdog@2a02d4000: failed to match any schema with compatible: ['apple,t6031-wdt', 'apple,t8103-wdt']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: pinctrl@2a4820000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/pinctrl@2a4820000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: pinctrl@2a01f0000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/pinctrl@2a01f0000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: pinctrl@2a8824000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/pinctrl@2a8824000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: pinctrl@2b3000000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/pinctrl@2b3000000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
--
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: watchdog@2a02d4000 (apple,t6031-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-wdt' is not one of ['apple,t6020-wdt', 'apple,t8122-wdt']
   	'apple,t6031-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/watchdog@2a02d4000: failed to match any schema with compatible: ['apple,t6031-wdt', 'apple,t8103-wdt']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: pinctrl@2a4820000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/pinctrl@2a4820000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: pinctrl@2a01f0000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/pinctrl@2a01f0000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: pinctrl@2a8824000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/pinctrl@2a8824000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: pinctrl@2b3000000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/pinctrl@2b3000000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
--
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: watchdog@2a02d4000 (apple,t6031-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-wdt' is not one of ['apple,t6020-wdt', 'apple,t8122-wdt']
   	'apple,t6031-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/watchdog@2a02d4000: failed to match any schema with compatible: ['apple,t6031-wdt', 'apple,t8103-wdt']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: pinctrl@2a4820000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/pinctrl@2a4820000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: pinctrl@2a01f0000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/pinctrl@2a01f0000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: pinctrl@2a8824000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/pinctrl@2a8824000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: pinctrl@2b3000000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/pinctrl@2b3000000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: pinctrl@2a01f0000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@2200000000/pinctrl@2a01f0000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: pinctrl@2a8824000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@2200000000/pinctrl@2a8824000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: pinctrl@2b3000000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@2200000000/pinctrl@2b3000000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
--
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: watchdog@2a02d4000 (apple,t6031-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-wdt' is not one of ['apple,t6020-wdt', 'apple,t8122-wdt']
   	'apple,t6031-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/watchdog@2a02d4000: failed to match any schema with compatible: ['apple,t6031-wdt', 'apple,t8103-wdt']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: pinctrl@2a4820000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/pinctrl@2a4820000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: pinctrl@2a01f0000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/pinctrl@2a01f0000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: pinctrl@2a8824000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/pinctrl@2a8824000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: pinctrl@2b3000000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/pinctrl@2b3000000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
--
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: watchdog@2a02d4000 (apple,t6031-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-wdt' is not one of ['apple,t6020-wdt', 'apple,t8122-wdt']
   	'apple,t6031-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/watchdog@2a02d4000: failed to match any schema with compatible: ['apple,t6031-wdt', 'apple,t8103-wdt']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: pinctrl@2a4820000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/pinctrl@2a4820000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: pinctrl@2a01f0000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/pinctrl@2a01f0000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: pinctrl@2a8824000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/pinctrl@2a8824000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: pinctrl@2b3000000 (apple,t6031-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6031-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/pinctrl@2b3000000: failed to match any schema with compatible: ['apple,t6031-pinctrl', 'apple,t8103-pinctrl']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
