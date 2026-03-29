Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA540DFA2
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774743793; cv=none; b=Ya1NBCqbsDqU9mZhwskT64pM0gBSwmfsG1eFO+DhymHcmlxXNmD/cuinaI8I9MjKkdcvtFUhLT817nI5tuqHGFDUFGc0W4ZZjANehKLOTTayIjF+C2OpAh7U/Vx7KUPSZhAEFX7Db+k1mZGKKO2K/Q/bcIdSVVv66/pa1p4Nwms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774743793; c=relaxed/simple;
	bh=oGZWMWkNJoMAvinOTSGafCTU/OAaJVBMoTpJK/j7/YY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cf8WabD4dklrktFuLwcfuoUhae/qHjmF52VJsdEO64GwUedfUkyobM2XltPCWdsPAuCSA3lJcS6J/25miMfWMJCi7zPjFEf7S9cAgCV37oe7xFxI27TKWC3G0iRKIGEG+AIDlrkK4XgCJym5ca4rncsCIhK9uI2prnpGgntqcL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmGUCbYX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmGUCbYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774743792; x=1806279792;
  h=date:from:to:cc:subject:message-id;
  bh=oGZWMWkNJoMAvinOTSGafCTU/OAaJVBMoTpJK/j7/YY=;
  b=dmGUCbYXFEQhv5eXyAAIXqDQCZmXvIgFxWvPFuR3RKhFLNSndBHCR/2h
   Xm1OcRmm0jsXj1Jw5F9z1Eir4whEcfgTOmpwmBD2PAJGzG1Bn75hE4mSM
   wRHOQpF1yh+C38rLxTIU2NbTHbDb0RerToZL+TOm2ma9aEMsqfYg2UO+D
   /Oi47Iz3a/QTcvzkjeeqITiuX45+34y+OQh8rB5873f9wY2X+utNBvd1z
   c5MouMxrvRv2HUnJdWT80wkX9O09C/UY5NhFGaKmgJw0eaxJI1Lv0N1C7
   4cj8vCmidByJPFMUg1UKwgEhINmQNZUt0D83jx+MVG/3YUvPic5XNxwoT
   g==;
X-CSE-ConnectionGUID: sJJsxdTAQhqXLYaEkBbeRw==
X-CSE-MsgGUID: gZh00yVzTMy0mB6G50IWAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86082573"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="86082573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 17:23:11 -0700
X-CSE-ConnectionGUID: e5TUOtfjToG2lezP43A/8A==
X-CSE-MsgGUID: GepEEfzXT9ObUjOtCG1xrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="221274636"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 28 Mar 2026 17:23:10 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6dvn-000000007mf-3bOF;
	Sun, 29 Mar 2026 00:23:07 +0000
Date: Sun, 29 Mar 2026 01:22:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [litex-hub:litex-rebase 15/17]
 Documentation/devicetree/bindings/clock/litex,clk.yaml:
 properties:clock-output-names: {'description': 'List of strings of clock
 output signal names indexed by the first cell in the clock specifier.',
 'minItems': 1, 'maxItems': 7, 'items': [{'const': 'CLK...
Message-ID: <202603290111.6te65ClF-lkp@intel.com>
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
TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>
CC: Gabriel Somlo <gsomlo@gmail.com>
CC: Mateusz Holenko <mholenko@antmicro.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/litex-hub/linux litex-rebase
head:   41a82f0908a16bafad979f344f7c2d391338710e
commit: 961531e39f7b771063d80a065273675dc90fbcd2 [15/17] LiteX: driver for MMCM
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arc-randconfig-2052-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290111.6te65ClF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290111.6te65ClF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603290111.6te65ClF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/clock/litex,clk.yaml: properties:clock-output-names: {'description': 'List of strings of clock output signal names indexed by the first cell in the clock specifier.', 'minItems': 1, 'maxItems': 7, 'items': [{'const': 'CLKOUT0'}, {'const': 'CLKOUT1'}, {'const': 'CLKOUT2'}, {'const': 'CLKOUT3'}, {'const': 'CLKOUT4'}, {'const': 'CLKOUT5'}, {'const': 'CLKOUT6'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
