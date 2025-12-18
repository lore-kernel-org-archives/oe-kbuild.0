Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E733D4E0
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766062812; cv=none; b=EXR164DeuoPNYUXkfs0JN2f7H1VZeagP6yyomD4tIjWp4baulSC52xPVn6OvtxJxwaOAVWhowb267767OPe2Jd0NiyHsTkQ1DtWfeSS6kEdzjIX8n/BuDQGPNLIvdIJbm16UiPvaZrvyTcYjv96oSnEcik7ozonc6TlKBlXOrHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766062812; c=relaxed/simple;
	bh=mAczpBJEfPOqSP7Ih8TSZGw/itrgBcbnhWV04L9K24g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FLv2gdvHoBUwvPDaJafCodGZqLdKrvl2DLoKme7MOcFAIwUQgw2YnpX8XfE6rOO0ZhlHcVavhQlTogV+iuShbG3LHp6wL88Uf9jWnMY76jeliB6uZSqgNdQJlmzIm9yM6WnLR6ckbfSFt9htfmb4OZK5dRPql9SIguWK0O5YNZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9FYFHLZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9FYFHLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766062810; x=1797598810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mAczpBJEfPOqSP7Ih8TSZGw/itrgBcbnhWV04L9K24g=;
  b=R9FYFHLZyQTI7r7X7ku9QlOOqE/LMksK1MVVg9WR3SCs8919v6v9xOCV
   PlfwTysG/ihEEKHcV7W4P86rnljIiZVx1TzxNj96wZNEZyRBsQneEzJgP
   MO4R8SS3p9G7CoEYmT5bN6DzD+WdhORPWV+BTT2rYi8fGW4S/W4ZXMX5w
   xX8+LPxUv/Ix+sz3DxE/KmBVoh0yHmf7MiF8s0+hRIwgnfrmTZK3JPc/v
   WFx/vAcdeFjffmlRHMhuthQq2CYWaR8nFaUgI0ztbes6SOKUkXcZwHIPM
   ZMWgTCVnlDXrsgdU5iDpn2t02iEt0xggXmihaVxA9Uw1VJg8o43/52hFT
   A==;
X-CSE-ConnectionGUID: MH771mVgTEqHyLii25J0fA==
X-CSE-MsgGUID: xwIbvYYYS26eH4NA1NE1ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78329418"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="78329418"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 05:00:09 -0800
X-CSE-ConnectionGUID: Tp5TBmNqQ1i6VenUrq9SuQ==
X-CSE-MsgGUID: N9p3n19xTYqBzsB07jwYFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="198479117"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Dec 2025 05:00:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWDbz-000000003wW-0LwU;
	Thu, 18 Dec 2025 13:00:07 +0000
Date: Thu, 18 Dec 2025 14:00:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [litex-hub:litex-rebase 14/15]
 Documentation/devicetree/bindings/clock/litex,clk.yaml:
 properties:clock-output-names: {'description': 'List of strings of clock
 output signal names indexed by the first cell in the clock specifier.',
 'minItems': 1, 'maxItems': 7, 'items': [{'const': 'CLK...
Message-ID: <202512181332.OC4AYC3E-lkp@intel.com>
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
TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>
CC: Gabriel Somlo <gsomlo@gmail.com>
CC: Mateusz Holenko <mholenko@antmicro.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/litex-hub/linux litex-rebase
head:   610265c5a972d9f7191ba7243ab6fb79bfc35de5
commit: 553f9a11b145aae5c68d5abf17e5fa38a3a93426 [14/15] LiteX: driver for MMCM
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251218/202512181332.OC4AYC3E-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181332.OC4AYC3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512181332.OC4AYC3E-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/clock/litex,clk.yaml: properties:clock-output-names: {'description': 'List of strings of clock output signal names indexed by the first cell in the clock specifier.', 'minItems': 1, 'maxItems': 7, 'items': [{'const': 'CLKOUT0'}, {'const': 'CLKOUT1'}, {'const': 'CLKOUT2'}, {'const': 'CLKOUT3'}, {'const': 'CLKOUT4'}, {'const': 'CLKOUT5'}, {'const': 'CLKOUT6'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
