Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415378;
	b=FPueLzFXh7F0918u8KqfyG3tLMU2XYM5+Btb8ncT4Bd1MXfk5jk0ZbR6ErptkJNuQSf/
	 ZTDWsI4Nx3CSNTwJdO87TGiZyiy+QlHPJ5+9/D0mqgGuZIEm8EIf1L3GIC/16CfUEw/w+
	 GJXKlWcLDuR8ca1VWcQp91HkdK4rZQRJOcSW5rMnhegakrO/DCvQAw3mS/b1TuBp98NG+
	 1TVJ6VheS827VpSFlc+rxlU6FEUmdEODOz9SW1M1PyjnxR+Y4lAuGHvouJhmISfvFztv9
	 x3+NIGJnb27cLWxED1nLuDa9xdN5sXzNlNkFA5TNGZ2cPhFdHtSkmg2Wdv2thA+SnAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415378;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=f6sRUK1giD2Je8C0Vj/gNPESRgg4DmTAaRSeyS456yQ=;
	b=EpqS/53fTqa1PJAhKdrc4dtfskR+OCQQ2jx7k95E6nHRpfQt9XohvMWqJymIKz6NwJwc
	 9huQQXhFKL57u7lyJFsDEOYFZhku+WLAssSeeKMxGJuWPHUotdDAtOSUH0QC7fs4Mal/+
	 j4CHmv5fv5t+Yma1VqlETTCfRsoIMI8PMIRD3Zu1yCN1Z4NsRJFM3Q054AWPebX/VnZta
	 7NHiEbQJhBota8BauaKoXBdPb0irZ+RgXSexBzxy6HMaQzddpDpl8je5m8uOGaO2u4Oyu
	 FI/0yyatjRkXB8u0QjCZ+KDoO9pTna4Q44Zp/uHGCMbKjaCPA2Pt4VzHOF6BIYyhLBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f1txIE6X;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1221D606A334
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 16:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1221D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f1txIE6X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794415376; x=1825951376;
  h=date:from:to:cc:subject:message-id;
  bh=S63QM+YXLliIld0cykTfDtY9NXDBnf2q1pF8AUwVr6M=;
  b=f1txIE6XeIJTftGC6TkDoGQKtLPcaIn77JoZ7VhY3mBjaQrJCBeWEtrJ
   oggRcGcGro3o8LsH574ggxP/jk4jGcB8+ARzeYNVtRMEuKRSrO0WhoPuI
   BXBdjfqmLeb86RALTM+PezbUBq06RLozZ+wmQfnhJHxsDutDAd0OcMUNu
   ACp/2hbfgdffCs5E0MBRU4QOb9CQsDzUDn6cq+mQRsyHCa7R5dJCVFNOx
   U9vT3PNGYLuMNGVCwWT4r6aSAfdH5KMjwchOOVuoCcUU0cbd6qTnVoaPn
   WhFY17Tu7+/tySILhXwhrYDxA8f6PtRLth5Lv1FsIyDuu463PdysyWctW
   Q==;
X-CSE-ConnectionGUID: 2EEcebC4RlO6JGfgIY1A5Q==
X-CSE-MsgGUID: dHRzONvpQUaEcQ0i0B77OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3100220"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3100220"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 08:42:55 -0800
X-CSE-ConnectionGUID: QuwXg9GQSWOmOEho/P8m5Q==
X-CSE-MsgGUID: LZUmSCnPTFmHnXbMDT8TBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8610835"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 Nov 2026 08:42:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRBPO-000000000cF-2YFa;
	Wed, 11 Nov 2026 16:42:50 +0000
Date: Wed, 11 Nov 2026 17:42:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 89/242]
 arch/arm64/boot/dts/apple/t6031-j514c.dtb: cpufreq@210e20000
 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202611111750.ja9nOliS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yureka <yuka@yuka.dev>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   c46abf5713fa41e1574fb50c462f53392d6f5cd7
commit: fb6798cc703df76ee65ef5a49b31e455bc8921db [89/242] arm64: dts: apple: Initial t603[124] cpufreq support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261111/202611111750.ja9nOliS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111750.ja9nOliS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611111750.ja9nOliS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
   arch/arm64/boot/dts/apple/t6031-j514c.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6031-j514c.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
   arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: cpufreq@210e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/cpufreq@210e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: cpufreq@211e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/cpufreq@211e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: cpufreq@212e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/cpufreq@212e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
--
   arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
   arch/arm64/boot/dts/apple/t6031-j516c.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6031-j516c.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
   arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: cpufreq@210e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/cpufreq@210e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: cpufreq@211e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/cpufreq@211e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: cpufreq@212e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/cpufreq@212e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
--
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: cpufreq@210e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/cpufreq@210e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: cpufreq@211e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/cpufreq@211e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: cpufreq@212e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/cpufreq@212e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: cpufreq@210e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@2200000000/cpufreq@210e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: cpufreq@211e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
   arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@2200000000/cpufreq@211e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: cpufreq@212e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
--
   arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
   arch/arm64/boot/dts/apple/t6034-j514m.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6034-j514m.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
   arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: cpufreq@210e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/cpufreq@210e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: cpufreq@211e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/cpufreq@211e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: cpufreq@212e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/cpufreq@212e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
--
   arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
   arch/arm64/boot/dts/apple/t6034-j516m.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6034-j516m.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
   arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: cpufreq@210e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/cpufreq@210e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: cpufreq@211e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/cpufreq@211e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: cpufreq@212e20000 (apple,t6031-cluster-cpufreq): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too short
   	['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] is too long
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']
   	'apple,t6031-cluster-cpufreq' is not one of ['apple,s8000-cluster-cpufreq', 'apple,t8010-cluster-cpufreq', 'apple,t8015-cluster-cpufreq', 'apple,t6000-cluster-cpufreq']
   	'apple,t7000-cluster-cpufreq' was expected
   	'apple,s5l8960x-cluster-cpufreq' was expected
   	'apple,t6020-cluster-cpufreq' was expected
   	'apple,cluster-cpufreq' was expected
   	'apple,t8103-cluster-cpufreq' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/cpufreq@212e20000: failed to match any schema with compatible: ['apple,t6031-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
