Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E3A1E1E19
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Mar 2025 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742283118; cv=none; b=bmJwz8FE7EephvUGCweu44G9lZ80uSOTs/eQL7jsiSBqY55JuMUfCeH53Q6VnpCkcnA0hQYt1hxYVbP8N5vhPFVo4OkYvibMGfJJjaGy0GxbCXLeVQEYeWIE7Zl6u2rFsSFUemfnkea6cKmUL+Yvf+tALoiphrF1wANjhZPg0gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742283118; c=relaxed/simple;
	bh=HASSBOyc77dV8/oi7aVzYlAzNW/73sohmGkFOQWqGKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2b+Kn0CNLamYHAHirKSRM02MjGb8WVHPUTT4naU6lSWPqNm7i+Qjif29r1/rPW672eAfS/XY8lO4Jo2PbErEEEbU10agpMT2Oxo5a4kuxSt2xN6PBKMVNSYHWS37nZKzW6rE2z1Fm03vqdAF2XfkkzYixlmgNoCLC0Mica/92o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcgyVKUs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcgyVKUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742283116; x=1773819116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HASSBOyc77dV8/oi7aVzYlAzNW/73sohmGkFOQWqGKQ=;
  b=hcgyVKUs8jwd+xAyakXHP6agROkCGe2eGqjYDEo2Og0gk1dI0nxgcQt9
   /c4HiSNkjFpaBgzjmwmOzQrFhoGLAL+uH2eNr92e6F57AeL8eMVLsfOR8
   FZk3K7TtYXnzD9SeK3VeBo238CT1XuFiCglpyLhtAaiIdtIJK4dbJVRKt
   Rx0PdlBTN15sfXaN06KPt77pOfW6fS4FQjLXeeqC38pjv1WMhb0f98guB
   6XQuSfotIx4MvSbd5GYFGevVXn0Yl+5wThPnyQfzCGJpI2/DcnOGJuos/
   8YUJ+oKJPt6KKOZjGruE7T4MQFY4lNKA+BKYVRRNqmgk0dz+GwDWiCfzg
   Q==;
X-CSE-ConnectionGUID: jK0AzNNHQ16xJuC1zzVIXQ==
X-CSE-MsgGUID: 27FOJbFHQW++Uxx1aGOPXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42656335"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="42656335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 00:31:52 -0700
X-CSE-ConnectionGUID: wf/VyPqIS46BUcfPwfmx4A==
X-CSE-MsgGUID: AUAuPRzeQL+D5TaA+UFlGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="126372051"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Mar 2025 00:31:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuRQS-000DWk-25;
	Tue, 18 Mar 2025 07:31:48 +0000
Date: Tue, 18 Mar 2025 15:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.16 37/43]
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: mmc@15c00000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202503181513.B4UGmX7r-lkp@intel.com>
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
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.16
head:   4c78b0707043146e31671548c813f07ddddd24f7
commit: 8136204f83985653e4b600c10c92ef74189421fe [37/43] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20250318 (https://download.01.org/0day-ci/archive/20250318/202503181513.B4UGmX7r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181513.B4UGmX7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503181513.B4UGmX7r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,r9a09g047-wdt' is not one of ['renesas,r8a779a0-wdt', 'renesas,r8a779f0-wdt', 'renesas,r8a779g0-wdt', 'renesas,r8a779h0-wdt']
   	'renesas,r9a09g057-wdt' was expected
   	'renesas,rza-wdt' was expected
   	'renesas,rzn1-wdt' was expected
   	'renesas,rzg2l-wdt' was expected
   	'renesas,rzv2m-wdt' was expected
   	'renesas,rcar-gen2-wdt' was expected
   	'renesas,rcar-gen3-wdt' was expected
   	'renesas,rcar-gen4-wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/renesas,wdt.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: mmc@15c00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,sdhi-r9a09g047', 'renesas,sdhi-r9a09g057'] is too long
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-mmc-r8a77470', 'renesas,sdhi-r7s72100', 'renesas,sdhi-r7s9210', 'renesas,sdhi-r8a73a4', 'renesas,sdhi-r8a7740', 'renesas,sdhi-r9a09g057', 'renesas,sdhi-sh73a0']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a7778', 'renesas,sdhi-r8a7779']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a7742', 'renesas,sdhi-r8a7743', 'renesas,sdhi-r8a7744', 'renesas,sdhi-r8a7745', 'renesas,sdhi-r8a77470', 'renesas,sdhi-r8a7790', 'renesas,sdhi-r8a7791', 'renesas,sdhi-r8a7792', 'renesas,sdhi-r8a7793', 'renesas,sdhi-r8a7794']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a774a1', 'renesas,sdhi-r8a774b1', 'renesas,sdhi-r8a774c0', 'renesas,sdhi-r8a774e1', 'renesas,sdhi-r8a7795', 'renesas,sdhi-r8a7796', 'renesas,sdhi-r8a77961', 'renesas,sdhi-r8a77965', 'renesas,sdhi-r8a77970', 'renesas,sdhi-r8a77980', 'renesas,sdhi-r8a77990', 'renesas,sdhi-r8a77995']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a779a0', 'renesas,sdhi-r8a779f0', 'renesas,sdhi-r8a779g0', 'renesas,sdhi-r8a779h0']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r9a07g043', 'renesas,sdhi-r9a07g044', 'renesas,sdhi-r9a07g054', 'renesas,sdhi-r9a08g045', 'renesas,sdhi-r9a09g011']
   	'renesas,rcar-gen1-sdhi' was expected
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen3-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
   	'renesas,rzg2l-sdhi' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: mmc@15c10000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,sdhi-r9a09g047', 'renesas,sdhi-r9a09g057'] is too long
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-mmc-r8a77470', 'renesas,sdhi-r7s72100', 'renesas,sdhi-r7s9210', 'renesas,sdhi-r8a73a4', 'renesas,sdhi-r8a7740', 'renesas,sdhi-r9a09g057', 'renesas,sdhi-sh73a0']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a7778', 'renesas,sdhi-r8a7779']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a7742', 'renesas,sdhi-r8a7743', 'renesas,sdhi-r8a7744', 'renesas,sdhi-r8a7745', 'renesas,sdhi-r8a77470', 'renesas,sdhi-r8a7790', 'renesas,sdhi-r8a7791', 'renesas,sdhi-r8a7792', 'renesas,sdhi-r8a7793', 'renesas,sdhi-r8a7794']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a774a1', 'renesas,sdhi-r8a774b1', 'renesas,sdhi-r8a774c0', 'renesas,sdhi-r8a774e1', 'renesas,sdhi-r8a7795', 'renesas,sdhi-r8a7796', 'renesas,sdhi-r8a77961', 'renesas,sdhi-r8a77965', 'renesas,sdhi-r8a77970', 'renesas,sdhi-r8a77980', 'renesas,sdhi-r8a77990', 'renesas,sdhi-r8a77995']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a779a0', 'renesas,sdhi-r8a779f0', 'renesas,sdhi-r8a779g0', 'renesas,sdhi-r8a779h0']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r9a07g043', 'renesas,sdhi-r9a07g044', 'renesas,sdhi-r9a07g054', 'renesas,sdhi-r9a08g045', 'renesas,sdhi-r9a09g011']
   	'renesas,rcar-gen1-sdhi' was expected
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen3-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
   	'renesas,rzg2l-sdhi' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: mmc@15c20000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,sdhi-r9a09g047', 'renesas,sdhi-r9a09g057'] is too long
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-mmc-r8a77470', 'renesas,sdhi-r7s72100', 'renesas,sdhi-r7s9210', 'renesas,sdhi-r8a73a4', 'renesas,sdhi-r8a7740', 'renesas,sdhi-r9a09g057', 'renesas,sdhi-sh73a0']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a7778', 'renesas,sdhi-r8a7779']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a7742', 'renesas,sdhi-r8a7743', 'renesas,sdhi-r8a7744', 'renesas,sdhi-r8a7745', 'renesas,sdhi-r8a77470', 'renesas,sdhi-r8a7790', 'renesas,sdhi-r8a7791', 'renesas,sdhi-r8a7792', 'renesas,sdhi-r8a7793', 'renesas,sdhi-r8a7794']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a774a1', 'renesas,sdhi-r8a774b1', 'renesas,sdhi-r8a774c0', 'renesas,sdhi-r8a774e1', 'renesas,sdhi-r8a7795', 'renesas,sdhi-r8a7796', 'renesas,sdhi-r8a77961', 'renesas,sdhi-r8a77965', 'renesas,sdhi-r8a77970', 'renesas,sdhi-r8a77980', 'renesas,sdhi-r8a77990', 'renesas,sdhi-r8a77995']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r8a779a0', 'renesas,sdhi-r8a779f0', 'renesas,sdhi-r8a779g0', 'renesas,sdhi-r8a779h0']
   	'renesas,sdhi-r9a09g047' is not one of ['renesas,sdhi-r9a07g043', 'renesas,sdhi-r9a07g044', 'renesas,sdhi-r9a07g054', 'renesas,sdhi-r9a08g045', 'renesas,sdhi-r9a09g011']
   	'renesas,rcar-gen1-sdhi' was expected
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen3-sdhi' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
