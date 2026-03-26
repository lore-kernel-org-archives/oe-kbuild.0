Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310A37F75F
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534551; cv=none; b=G7DMOD2DbaP3PtrrQstrhRh8s1NAfCdWaaDuZnvg0SWUvWG/rfCSrLy6whc20nZV9ASoOEP0XAZUdI6VkUEJoNVf2Rd+W/5Fw2lSt/zbTR6EZ6rLeNfA8q83Kb5AGA29LO9CkAIckBIIj2gc1vS8BAGyWoCiGbWeCBkQr3HBp5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534551; c=relaxed/simple;
	bh=1AiLUsREL2aZ4PuWNucYq3+RcemTY/Fv6uKO4sTOR8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MPYf21Qp1+LOphvF4aKm8afEodTvNbEcu0RvO70115X3n+oJaxpfFX3heOgrSx7cIY4hXFqm/SApXgmcF3RZwRF+VufqArm+KUEQqAttVWmTs9a4JyzsCka+1l/WuBU3h3Iz/78eDltSWFKYQiA42p2Gryjs6UIU3ukDaEMDAaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKUXImvS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKUXImvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774534544; x=1806070544;
  h=date:from:to:cc:subject:message-id;
  bh=1AiLUsREL2aZ4PuWNucYq3+RcemTY/Fv6uKO4sTOR8U=;
  b=XKUXImvSW8wj7/KeDLv7NXyTdbgVAtDR93Q9wp157n/Arx2ZHA1lYnG7
   MqPNz41C/3smMfnqGpWDjxCxAzEIKlWU5wDTQoVswkgSopnLYEMx66XTa
   hXOzGoSW4arqfQJLyNt4iGI6kpkHoGDALaRr+2QsqJel+MyjEwHbLtC+g
   H6LjOyExJInAqTny1TT8hLejsh0TNtg3+gcVBIqj+1t7N7N0TT9Gcejh3
   VqFIBlb175CmebXTPXCtB51NFIGP1nDp5Hbr/bGryYNTM7ur047Y/uwva
   rR+g7zM0Ol0iW5zkAnb94C2W0zJShC7NFqT6UfCB0OlOISKwGdg+/lSUj
   Q==;
X-CSE-ConnectionGUID: oZpsRfy+QdeqMyZZsp+odA==
X-CSE-MsgGUID: 94mq6C+vSLSgkjlqHfGQ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75557102"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75557102"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 07:15:43 -0700
X-CSE-ConnectionGUID: NYr8pPRXRVW8nyAP0b37RA==
X-CSE-MsgGUID: DqD/WI9QQsiRCPZ0Ajea1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="221702363"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Mar 2026 07:15:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5lUp-000000007Hl-3U1M;
	Thu, 26 Mar 2026 14:15:39 +0000
Date: Thu, 26 Mar 2026 15:15:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v7.1 39/50]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtb:
 bridge@45 (waveshare,dsi2dpi): ports:port@0:endpoint:data-lanes: [1, 2, 3, 4]
 is too long
Message-ID: <202603261550.opUmrzKM-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.1
head:   1380e36cf8ffd923a4bb0a337abf6473529ce9a2
commit: 2425780b0ac4fceddf028d8d4fec7d565fdaf78f [39/50] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare Display 13.3"
:::::: branch date: 20 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-2052-20260325 (https://download.01.org/0day-ci/archive/20260326/202603261550.opUmrzKM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261550.opUmrzKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603261550.opUmrzKM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtb: bridge@45 (waveshare,dsi2dpi): ports:port@0:endpoint:data-lanes: [1, 2, 3, 4] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/waveshare,dsi2dpi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
