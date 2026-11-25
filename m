Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650307;
	b=S8nRUk44giQjvlL3smZnky8t0ob0bMbS3GqubzD96pMODJ/oTtVLsTYk5ra+Opp+oBVB
	 Fr2XkVq4u0RvZG6d5SuFAMXrUyLH1m7+QSVvloAy9yq+qu13/oFl9ZJzD7/gj/5NFXTeu
	 1+ni6Ce2yYrG4SOBJ0Y35f8XpQNl3lutjwDsZoL+BxAsbgmhQPsa91siA6Yox3nr2FI5J
	 7B6FMV16MyLu9fh9XK7q6EUNVdidjzP2Ue63EQAvZmkkaJ68JSqqXuo3OiKVbTJBuWCUU
	 RYaRWFmbh1waW/8wP1qOxXOuWoEMNIHRLc+KbHk5wJKzuv34nwtwW8nj+gAbUn54xCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650307;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JeB3twK+3SA4clxH4r4gPFVHqGWXZIFMsC4Oi3nzrG8=;
	b=kYDrI70ISjm6Pno9gS03BPbUKT70ADD5XhsYTWwUI5Am3QMKM/MRNZrjf+gODyPEojM+
	 q2NUEc/zOx3OMy2D7D/bf/39us/JFppCgYHhVVeE+CXYUtCOKFlEeMJLM/3o3wiWhM3JS
	 VP7Wg/eXxf1UumN+kI6sdr/pa0MFWQPHVXL7xM7YrATzQOLYi90zHl30G6dAgiEMhvx30
	 C0XFP4C5ZquBwhQVHpHu4o0vpMvrTm0w0dJ+JCtHqfF9QcdaoEnB3CkFcSevnmtfn+Ztd
	 y3lXRzDPIHNmbrrI+TL293pTVdCu9P23jMB5eIA1CDMHwOdcCAuirPgZP4HuTXL1X6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZDWmo2g;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39801606A32A
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 23:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39801606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZDWmo2g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795650303; x=1827186303;
  h=date:from:to:cc:subject:message-id;
  bh=lnyJUbRlE73sb1bqZvGEl1fnPxl96RtyUGgD7sKx6T4=;
  b=PZDWmo2g/PszQsnth4FNZ6akIqNx13r8DUkucjQwizFcQXCbPpd8HORo
   DcqutUEEwQw5hHIl4nVKXmQCeJQiQX53Xv2m7XyuZIREFc1OMPZkQYe42
   e2FW2QxY36RkkLzmY+KuG8bJWWJybPIT+JfIRVZCqepDMiW092cg9k6h3
   XatPj1tY29M1hwp6MTfuEsfSDeXYJcjSnb/V5WKc35bZt8HBFilcz5ua4
   DWi6cdupbl4KlC+cBZoFPTs978UTgvr5PFRFF77T7pVDuXc8WLZisth59
   6NiZVIWlcFiO+4Dogv1UMupyXAiRnGnskN0UMXcRsvzEu/AKgB1KyHCiB
   g==;
X-CSE-ConnectionGUID: UY0sVxSbScyOp1IHGlHM2A==
X-CSE-MsgGUID: NQS+LScmQyO5PY1zyp8syg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4535337"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4535337"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:45:02 -0800
X-CSE-ConnectionGUID: TZdwpUesQ06r6ruVYsZzKA==
X-CSE-MsgGUID: KrsjkRdHTGyblkjNOPlLuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12427646"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2026 15:45:02 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWMfb-0000000009T-1tJ8;
	Wed, 25 Nov 2026 23:44:59 +0000
Date: Thu, 26 Nov 2026 00:44:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.5-armsoc/dts64 67/94]
 arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dtb: vop@fdd90000
 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <20261126004133.h5lbutTe-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Michael Trimarchi <michael@amarulasolutions.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.5-armsoc/dts64
head:   7f7ad16007a93bdd56b9d8eb80f856fb0cf5b2d3
commit: 4cfbc536b8728b6c217add4f321a6e80d7c03cc8 [67/94] arm64: dts: rockchip: Add Axelera Embedded 111c
:::::: branch date: 2 hours ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261126/20261126004133.h5lbutTe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev9+g7453fd0b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126004133.h5lbutTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126004133.h5lbutTe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
