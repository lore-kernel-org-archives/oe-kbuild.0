Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABF12BE03C
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769879180; cv=none; b=aiVwaF2gxa0JsYrzi4DOb9TQL5YgMxUla3WQ+7EJbNztSaJk+9K4AFf9ttfMAsf5eRp4l4jMlCJ9vIxhQlJyPQZAgNSgco0GZBvrUZ5v1F0Q2U+SS2z8kQuDGjWx+OEZWg0iLuL4uS1YPfd0jPbnc/ghETu4sCKMvP3nn2pwRWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769879180; c=relaxed/simple;
	bh=oUpxsr2PoaPdacnWXgeS6TiH3Acbjb5GfFo+CmpbQ94=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JRwszL72HaYomgCpaRUgd2bjjoOC04XJk4vVCvUygzMchCuMUzPydme6Cl73uADZ7R10nakUPmxiXJUnq8Gy0/GhC6TtULd2RQriSoW9GYqm15YVyqZQEryszaEVW6u+OQkzvWRbxp3RdILUwH1FwdwDaug0NxrkMc8n2vr1c+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USF1H+Y+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USF1H+Y+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769879178; x=1801415178;
  h=date:from:to:cc:subject:message-id;
  bh=oUpxsr2PoaPdacnWXgeS6TiH3Acbjb5GfFo+CmpbQ94=;
  b=USF1H+Y+3gNuY+NWKOuHXVAdtErauMPwcwiErZdmejCJXIbeUAsQnM/x
   H+3UZeW1C/NEzAED2zIixRdBeLy3BmG7gnhUiGnoK2YWZK8wd1EkXIDJE
   Am8IJhIfuKm5sRqN67M5DyCULjsUzsLxs+wghoNUHrAyd7U5AjDZjt+l2
   iwQMJa8YynCWZiqaG/M69R6e2M7yMdjCl1BQZ8Ji5q5Mumu+D0nOrlRU5
   GyMu28+/McNh9aGImmRc6WAT6y/trNkpJxPVVFvUh/9gt+LsjFdBxkXR+
   FkqobuC6eKk9VYjFvpqKsAT1rWGvMR1nHV/oiMMjjaJnZf2Hs1repRcIe
   w==;
X-CSE-ConnectionGUID: jLkySUD0ReaqOVU8lmbBMA==
X-CSE-MsgGUID: eUNy1SvRQY+8IT82DNQlKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71084986"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="71084986"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 09:06:17 -0800
X-CSE-ConnectionGUID: 20BDEA4kQnukI5S5GJcooQ==
X-CSE-MsgGUID: y6HoQbatQnq1YR9VPA8dOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="232040552"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2026 09:06:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmEQI-000000002in-1VN0;
	Sat, 31 Jan 2026 17:06:14 +0000
Date: Sat, 31 Jan 2026 18:05:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.20_v2 11/12]
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.dtb: /
 (intel,socfpga-agilex-socdk-emmc): compatible: 'oneOf' conditional failed,
 one must be fixed:
Message-ID: <202601311853.qKJkbSm9-lkp@intel.com>
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
TO: Ng Tze Yee <tzeyee.ng@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.20_v2
head:   42a8d7d72185247c0bbada1d2c44bef743ee6a5d
commit: 95cc767d6f54e48629b593edc2ccbd154ec65d95 [11/12] arm64: dts: socfpga: agilex: add emmc support
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-2051-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311853.qKJkbSm9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311853.qKJkbSm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601311853.qKJkbSm9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:612.10-669.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.dtb: / (intel,socfpga-agilex-socdk-emmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['intel,socfpga-agilex-socdk-emmc', 'intel,socfpga-agilex'] is too short
   	'intel,socfpga-agilex-socdk-emmc' is not one of ['altr,socfpga-arria5-socdk']
   	'intel,socfpga-agilex-socdk-emmc' is not one of ['altr,socfpga-arria10-socdk']
   	'intel,socfpga-agilex-socdk-emmc' is not one of ['enclustra,mercury-aa1-pe1', 'enclustra,mercury-aa1-pe3', 'enclustra,mercury-aa1-st1', 'google,chameleon-v3']
   	'intel,socfpga-agilex-socdk-emmc' is not one of ['altr,socfpga-cyclone5-socdk', 'denx,mcvevk', 'ebv,socrates', 'macnica,sodia', 'novtech,chameleon96', 'samtec,vining', 'terasic,de0-atlas', 'terasic,de10-nano', 'terasic,socfpga-cyclone5-sockit']
   	'intel,socfpga-agilex-socdk-emmc' is not one of ['enclustra,mercury-sa1-pe1', 'enclustra,mercury-sa1-pe3', 'enclustra,mercury-sa1-st1']
   	'intel,socfpga-agilex-socdk-emmc' is not one of ['enclustra,mercury-sa2-pe1', 'enclustra,mercury-sa2-pe3', 'enclustra,mercury-sa2-st1']
   	'intel,socfpga-agilex-socdk-emmc' is not one of ['altr,socfpga-stratix10-socdk', 'altr,socfpga-stratix10-swvp']
   	'intel,socfpga-agilex-socdk-emmc' is not one of ['intel,n5x-socdk', 'intel,socfpga-agilex-n6000', 'intel,socfpga-agilex-socdk']
   	'intel,socfpga-agilex-socdk-emmc' is not one of ['intel,socfpga-agilex3-socdk']
--
   	'altr,socfpga-arria10' was expected
   	'enclustra,mercury-aa1' was expected
   	'altr,socfpga-cyclone5' was expected
   	'enclustra,mercury-sa1' was expected
   	'enclustra,mercury-sa2' was expected
   	'altr,socfpga-stratix10' was expected
   	'intel,socfpga-agilex3' was expected
   	'intel,socfpga-agilex5' was expected
   	'altr,socfpga' was expected
   	from schema $id: http://devicetree.org/schemas/arm/altera.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.dtb: /: failed to match any schema with compatible: ['intel,socfpga-agilex-socdk-emmc', 'intel,socfpga-agilex']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
