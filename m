Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA1C25A65C
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737823405; cv=none; b=p/OupIOZmt9b3AmxjUc4JNtnpJ9F8wEjBhxJNwJALR45eOxXPM4KTMeU6Rxl7+wk+PUCTCp3nG1WPJRuEZkrVz2JIjAwF4MWPaQxaDbHGB7RgWVA8VOq5ANWCJxkbjqScgXlr+i6wRhP1VhTW2vP6BDdgvCtyA2B+ASUkN9OWSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737823405; c=relaxed/simple;
	bh=HbBd5GVvEOUqv1AZ4XraOa5ROBno8SIF+hB9rQjSJZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EoI5hPzGyrE1TXS5jX2TYUz6DV0wnDynevVdkq0QjbJoqoWFK3VDdFe42ISa/hHN9ei7mbEoZh15CEK5Zy3jErRHJ/9Or1dA773ngrSc1DwB2g+oGbosFnDNq/hJXzzTPbzDmz1cC0ocHz2d8r7TXd1TizRw7LpF5h5H39d49mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wmmax69Y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wmmax69Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737823403; x=1769359403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HbBd5GVvEOUqv1AZ4XraOa5ROBno8SIF+hB9rQjSJZI=;
  b=Wmmax69YWO0m0bT2CsL4UWXBwaFq5sPVD4kMnVY4BTUizrxMtdcvc9c1
   UdNcBA6fefivhWJSgUahFVrAiKVzUfXALu289oujSNzNh/WNya2YgIUcr
   drVgkCpPMF9uIeASmsvoSICXore786Ob7d3Qp6vQkfEufplpaxRHF8A4B
   EBi1si9lnWEuFp/5vO9JEk4rCJiWWvFYmxy+hSry+VkN+XPER+PBHjuLL
   cX9nfCnkAZKtTnmYnNkG8zm4luvOda5+D7ubOFGELsd1Ezg/qvxYZtVPa
   iENiTWGDl6ERee3XiW3VIuaV3FleiUwNA/UoxoShDanY6eEU0IebBxxF3
   Q==;
X-CSE-ConnectionGUID: 18+69+lrSRS6kl2x1D9LcQ==
X-CSE-MsgGUID: h74VqMqURRKEoeotGHMa5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="48844299"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="48844299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 08:43:22 -0800
X-CSE-ConnectionGUID: JHDZVDq5TMOGlg0IuuncXw==
X-CSE-MsgGUID: 87wDQFyvRwOCtpNu83b+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107894640"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Jan 2025 08:43:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbjFf-000e1q-2o;
	Sat, 25 Jan 2025 16:43:19 +0000
Date: Sun, 26 Jan 2025 00:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.15 49/63]
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: watchdog@14400000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202501260042.M9I38oVW-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
head:   d1be18bd0830e8e5c62e1eab570e890d70a4fafb
commit: c6a9978c79c3ebb508aea49c94ef4658ebf0c36a [49/63] arm64: dts: renesas: r9a09g047: Add WDT1-WDT3 nodes
:::::: branch date: 22 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20250125 (https://download.01.org/0day-ci/archive/20250126/202501260042.M9I38oVW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260042.M9I38oVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501260042.M9I38oVW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,scif-r9a09g047' is not one of ['renesas,scif-r9a07g044']
   	'renesas,scif-r9a09g047' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif' was expected
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: watchdog@14400000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g047-wdt', 'renesas,r9a09g057-wdt'] is too long
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r7s72100-wdt', 'renesas,r7s9210-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r9a06g032-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r9a07g043-wdt', 'renesas,r9a07g044-wdt', 'renesas,r9a07g054-wdt', 'renesas,r9a08g045-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r9a09g011-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r8a7742-wdt', 'renesas,r8a7743-wdt', 'renesas,r8a7744-wdt', 'renesas,r8a7745-wdt', 'renesas,r8a77470-wdt', 'renesas,r8a7790-wdt', 'renesas,r8a7791-wdt', 'renesas,r8a7792-wdt', 'renesas,r8a7793-wdt', 'renesas,r8a7794-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r8a774a1-wdt', 'renesas,r8a774b1-wdt', 'renesas,r8a774c0-wdt', 'renesas,r8a774e1-wdt', 'renesas,r8a7795-wdt', 'renesas,r8a7796-wdt', 'renesas,r8a77961-wdt', 'renesas,r8a77965-wdt', 'renesas,r8a77970-wdt', 'renesas,r8a77980-wdt', 'renesas,r8a77990-wdt', 'renesas,r8a77995-wdt']
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r8a779a0-wdt', 'renesas,r8a779f0-wdt', 'renesas,r8a779g0-wdt', 'renesas,r8a779h0-wdt']
   	'renesas,r9a09g057-wdt' was expected
   	'renesas,rza-wdt' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
