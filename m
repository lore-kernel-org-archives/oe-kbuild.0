Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8078BE5
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 05:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734239527; cv=none; b=hoM3qtvTYM/bT7y8k3hStWdlcqY6FSwbTVoiaSaQAFjPR2uxR82LvVyGyVdw5xpxR9S4KP4MOLYuzYR3Leqw8mG84JjXfvTsXutZL3Xm1MFFy0i5CSBOY3jmWvNndREN64HMmmeZ6rUh9mhCDe+eBgFOcuJFyCyE9zi2xBOTzcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734239527; c=relaxed/simple;
	bh=UjicLU9mnkZWrNtD66aZt2xpBPScEkwlcQpds6ZNid0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MKzExn1fYhuDuUXUwiRUxMbvPZ3R/8qkhEwCqgGoB55g74f1NF71sA2Tt6LWMnbTSmBibhfky+XU5cO/dEQ12SPf7D688co5BdBMm4NM1a0MQTY851/RTzmIGlgVuSax6Z1eUKhpTo5ZrvfDCKaFfCrw5u9HA5R/KbaONXqPUDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KI/De/St; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KI/De/St"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734239525; x=1765775525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjicLU9mnkZWrNtD66aZt2xpBPScEkwlcQpds6ZNid0=;
  b=KI/De/Stwo8QeN87l8hs7IknzUtIn11MxgXuSluQB2/NnHwca3UAOLgP
   yAETPt/49YyY7j/kwHkEF8pSkUPfP6verB9eQpCqLcIzbC6WlZqbwgB2N
   eTh7u35SlEF/uwJfodTKYa6r1M+7WhiN6EDbDgk9ztOOqv+xGLH/8yaoN
   Tka93rnXoyhYeH8mE5aFjTU7AxitipsH7zZAYNgLR3iRRkhlZEBakYUF6
   CaxRrfUugbfIT/El9jD3foYUkPY1w/lLicLh3pQvKBQ+E6u1/VRQq07Au
   4DkSkImwPA3rzAZ2cBrJp+BiyGK25lTFIsCJobTUlIOExAtgMydLGnR8b
   g==;
X-CSE-ConnectionGUID: gh2kca7eQQGhia6zJxNU3g==
X-CSE-MsgGUID: 5CnilRB+RiSALIWTdezb1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45339697"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="45339697"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 21:12:04 -0800
X-CSE-ConnectionGUID: 0y7ZjCSNTt6WDCCshjH0Gw==
X-CSE-MsgGUID: KmjXicwCSxOVhACQJHsjfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97693865"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Dec 2024 21:12:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMgvB-000DRv-0H;
	Sun, 15 Dec 2024 05:12:01 +0000
Date: Sun, 15 Dec 2024 13:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.13-rc1 8/159]
 arch/mips/boot/dts/ingenic/gcw0.dtb: /: memory: False schema does not allow
 {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 268435456]],
 'phandle': 57}
Message-ID: <202412151328.RhroNubJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.13-rc1
head:   a48936ee46cd2afd08e4b81aaae14c8e791fdfe6
commit: bcbede4b77f674b6140af1faaab0308872bc7136 [8/159] kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: mips-randconfig-052-20241215 (https://download.01.org/0day-ci/archive/20241215/202412151328.RhroNubJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151328.RhroNubJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412151328.RhroNubJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/gcw0.dts:41.26-49.4: Warning (unit_address_vs_reg): /regulator@1: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/gcw0.dts:51.37-58.4: Warning (unit_address_vs_reg): /analog-amplifier@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/gcw0.dts:60.34-66.4: Warning (unit_address_vs_reg): /analog-amplifier@1: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/gcw0.dts:239.25-317.4: Warning (unit_address_vs_reg): /i2c-controller@3: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/ingenic/gcw0.dts:32.19-39.4: Warning (unique_unit_address_if_enabled): /regulator@0: duplicate unit-address (also used in node /analog-amplifier@0)
   arch/mips/boot/dts/ingenic/gcw0.dts:41.26-49.4: Warning (unique_unit_address_if_enabled): /regulator@1: duplicate unit-address (also used in node /analog-amplifier@1)
   arch/mips/boot/dts/ingenic/gcw0.dtb: /: memory@1fc00000: 'bank-width', 'compatible', 'device-width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: /: memory@1fc00000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/mips/boot/dts/ingenic/gcw0.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456], [805306368, 268435456]], 'phandle': 57}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: /: regulator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: /: regulator@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/ingenic/gcw0.dtb: /: analog-amplifier@0: 'anyOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
