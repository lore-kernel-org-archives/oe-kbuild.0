Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C80733BBAD
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Aug 2026 20:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702933; cv=none; b=QWTCULhtcirFgR8vjrUFQjryLVT4+1knYiynWhldvey96j9Ssxinrx71FoChSSf6AIDCUJZRhgqlH5UrPQxMwK+cB12DXMRnSZkPRqdHFyzhSfJP9GxhoBKlVdqHR+Ta/CJfMCPTzGN5q6+Sr6b2i5MvZRij9woNcnUT6+OLjJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702933; c=relaxed/simple;
	bh=i2OVVTYBCPKug2zvZe+IWUh9qNwMtwKYdkklal62S0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EocmTs7NDyWM1aQ8y8IJuUx+qWYwTUx9ppPXJfezhRf4wn9beoPfdku3YeUbl9Q7zU+GgjajWKVPzZnKE0yQFLepKa0Lh2ZCN0mYmdM6gYbm0q2t/HHSRQV55HrEBVWVxgdAMNq+92ms6pgXRXG9vR5wqD05dvarFO9kby1/eu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SftHNMry; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SftHNMry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785702929; x=1817238929;
  h=date:from:to:cc:subject:message-id;
  bh=i2OVVTYBCPKug2zvZe+IWUh9qNwMtwKYdkklal62S0g=;
  b=SftHNMrype7vkPkCoOvbtTy3OQHIS7MLtW2B94kbHs2Y688hZl0cAS1v
   eDenqylsptXEB1Ir2LkTZ1KTcxOv/EVFz+jUYfMiIdgDSWZ6XKPVde4M5
   nHJYau/U1/FocsSqHAZMs5vqQqav6JE13dPnceQ0sMNLd2bj42eevRrFS
   vx9OukDZDpwSE6xSt3gzyjtPOsTxSA6jnVgTSUZ7U9J9YWYZa+HEo128a
   C3OJ4vgvp54ibE3NneDQmQxpNRhUwjppT6C9Da42jyQ1qQXWxTc4akUSc
   Hlo/f2f4eGAzm7T9jCGXe386NmmqFMaDNywLlWjOb+Qff5yJx7b0VCFL5
   g==;
X-CSE-ConnectionGUID: imFkjuvNSKiGCR+/OJEzQA==
X-CSE-MsgGUID: DyurYz6QSPiRG+5bTPanbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="97618691"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="97618691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 13:35:29 -0700
X-CSE-ConnectionGUID: 2VLgYE/wTnuWWVQH5JKBhg==
X-CSE-MsgGUID: F5evNjo0RzW7e6mvgge3UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="261100038"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Aug 2026 13:35:27 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqcu5-000000003jG-2FuD;
	Sun, 02 Aug 2026 20:35:25 +0000
Date: Sun, 02 Aug 2026 22:34:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sven:apple-soc/dt-7.3 22/23]
 arch/arm64/boot/dts/apple/t6030-j514s.dtb: pinctrl@347100000
 (apple,t6030-pinctrl): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202608022256.ln4OSSiZ-lkp@intel.com>
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
commit: e81af013dbdd84c4e13f92c304eee555b1f9447a [22/23] arm64: dts: apple: Initial T6030 (M3 Pro) device trees
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-2055-20260801 (https://download.01.org/0day-ci/archive/20260802/202608022256.ln4OSSiZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608022256.ln4OSSiZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608022256.ln4OSSiZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: pinctrl@347100000 (apple,t6030-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6030-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/pinctrl@347100000: failed to match any schema with compatible: ['apple,t6030-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: pinctrl@3641f0000 (apple,t6030-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6030-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/pinctrl@3641f0000: failed to match any schema with compatible: ['apple,t6030-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: watchdog@3642b0000 (apple,t6030-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-wdt' is not one of ['apple,t6020-wdt', 'apple,t8122-wdt']
   	'apple,t6030-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/watchdog@3642b0000: failed to match any schema with compatible: ['apple,t6030-wdt', 'apple,t8103-wdt']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: pinctrl@36c820000 (apple,t6030-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6030-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/pinctrl@36c820000: failed to match any schema with compatible: ['apple,t6030-pinctrl', 'apple,t8103-pinctrl']
   arch/arm64/boot/dts/apple/t6030-j514s.dtb: pinctrl@374824000 (apple,t6030-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6030-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
   arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/pinctrl@374824000: failed to match any schema with compatible: ['apple,t6030-pinctrl', 'apple,t8103-pinctrl']
--
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: pinctrl@347100000 (apple,t6030-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6030-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/pinctrl@347100000: failed to match any schema with compatible: ['apple,t6030-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: pinctrl@3641f0000 (apple,t6030-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6030-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/pinctrl@3641f0000: failed to match any schema with compatible: ['apple,t6030-pinctrl', 'apple,t8103-pinctrl']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: watchdog@3642b0000 (apple,t6030-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-wdt' is not one of ['apple,t6020-wdt', 'apple,t8122-wdt']
   	'apple,t6030-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/watchdog@3642b0000: failed to match any schema with compatible: ['apple,t6030-wdt', 'apple,t8103-wdt']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: pinctrl@36c820000 (apple,t6030-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6030-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/pinctrl@36c820000: failed to match any schema with compatible: ['apple,t6030-pinctrl', 'apple,t8103-pinctrl']
   arch/arm64/boot/dts/apple/t6030-j516s.dtb: pinctrl@374824000 (apple,t6030-pinctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-pinctrl' is not one of ['apple,t6020-pinctrl', 'apple,t8122-pinctrl']
   	'apple,t6030-pinctrl' is not one of ['apple,s5l8960x-pinctrl', 'apple,t7000-pinctrl', 'apple,s8000-pinctrl', 'apple,t8010-pinctrl', 'apple,t8015-pinctrl', 'apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	'apple,pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml
   arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/pinctrl@374824000: failed to match any schema with compatible: ['apple,t6030-pinctrl', 'apple,t8103-pinctrl']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
