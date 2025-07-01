Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB08A1C3306
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Jul 2025 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388953; cv=none; b=sKJ9u0QrJbSSLMq2JpyJQ9Uw2vZ6D62uo/VvcpDOuRQTwVVwJy84PullzQi5wn8p+m8sWYMJZz8s//jWsWDXvvWIEf+LD80fU6RYu/TFvCyVp0sjiuV/EUE7QoYjt7FEevM/+/FFI45kdOpNd621qs/A4xGvEf8JA3gpVRM5nQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388953; c=relaxed/simple;
	bh=MoTFeNN4ReVkT1yBvADOfmOd2Wi3jsyUwSoHT0Mh2sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PHDYrytCM4x8LExR4BhDsH6CpdLyb5NArxphTj+LE9DpiIkc1FAPDvuBi5uKZfOLe/pumw2OsDuw6F0qnb+MfA2TGjVJZGYIh/f6TuSZt1EyFwrV9ZsRJ8rHBTyDnOvbYIGeb4FhF8mas2ya5MMR3j01HruS2NGGp7MZ/8kP9l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGXD28zs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGXD28zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751388952; x=1782924952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MoTFeNN4ReVkT1yBvADOfmOd2Wi3jsyUwSoHT0Mh2sw=;
  b=oGXD28zscc1RIKXWxxlNgJ/xyMBfnn+SIBfhJu54sbKfqlwdEZmGE8KL
   HS2rZ4L3efPAWpFn1Fjx7adPfZf7aNzA0AyjTd27NBFnsFpcpXdeQdTRC
   bKuSLw1u+i5RvalBUlDGW8VQ39KXtU0FqHPKzh8TgvZjnl8berisdR9Ow
   +sWoq80+wfzyUta84MbThZ1gE8nqPbEFj/a/SNbjDYzlcw68bb6p/D4kN
   +pTrvyf/i443g8ffbA4ugbcopMEE2KIseCDjSj/NQNl8KzKa4BqfLa8rS
   YSsoccr3lvst4i1uUDEBCJclxJyIo/kEpV2T+V7ZYqDGFmGtztzAvVFaL
   A==;
X-CSE-ConnectionGUID: bH2hwfHTRYCJ0DZoT0Ytwg==
X-CSE-MsgGUID: NKtCFdBrTMC0/hfeTobFKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="41297975"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="41297975"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:55:51 -0700
X-CSE-ConnectionGUID: upJuazyHSKOKADbcE15Ujw==
X-CSE-MsgGUID: chdhLkiWS3O4D/uoeLYqog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153596299"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2025 09:55:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWeGp-000aSA-2L;
	Tue, 01 Jul 2025 16:55:47 +0000
Date: Wed, 2 Jul 2025 00:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-v6.16-rc1 10/10]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb:
 /bus@ff800000/i2c@2100: failed to match any schema with compatible:
 ['brcm,bcmbca-i2c']
Message-ID: <202507020024.l5jGwI7S-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-v6.16-rc1
head:   5420b6e9c9c247c32861570d0332ec5376c283a8
commit: 5420b6e9c9c247c32861570d0332ec5376c283a8 [10/10] fix to dtsi for I2C
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250702/202507020024.l5jGwI7S-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020024.l5jGwI7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507020024.l5jGwI7S-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:236.20-300.4: Warning (avoid_unnecessary_addr_size): /bus@ff800000/mdio@2060/switch@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: /bus@ff800000/i2c@2100: failed to match any schema with compatible: ['brcm,bcmbca-i2c']
--
>> arch/arm/boot/dts/broadcom/bcm96846.dtb: /bus@ff800000/i2c@2100: failed to match any schema with compatible: ['brcm,bcmbca-i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
