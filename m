Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F17F1EA90
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723127936; cv=none; b=gZZDokgshHCMEopVAjlF1eETEnp+/MXj0B7XKai60CUwLoePujd2eSDRbriqO/Vm0Jdx8ux4KbP6QFArUGVb5sLw9wsgaEOP6mPYGBTJHaMQoA+UgduYcLwMsbVgKfO8nTmQeoFlt+wZDDJWEATXHPnQlo+wfZHKBeodsz/TPAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723127936; c=relaxed/simple;
	bh=0mc0q8FaDPfEa6zVFVNFiF4JFCA4BK073iT/NPcBFCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4LFdvFf5zY5eeXp0H+aiC3R8Uh5+EvkZ4y4/Vn6WfgJOC/zA6ttJigtOUN4G1iVRcQ7wm0Za38nj0aPrS/J2hLN+UkP0KQK4VWkqm2MxnSGGXUnslBKmOiIV2FJOryv2tkH8XWa3RU57tgUSvbfiVkwWXRcADpXPnxKTsiNYgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVY+7J9l; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVY+7J9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723127934; x=1754663934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0mc0q8FaDPfEa6zVFVNFiF4JFCA4BK073iT/NPcBFCw=;
  b=EVY+7J9lKT/6PcB9sa48astkig+MVak9p76Tk23gmf6bDQUEsBkhPQPI
   Jxs0m4raPNsZ1lijpBatENg9lA8ZUSvD+r30UhBfS/dikxFHNzKjVjpIa
   I00zmRN8mv15SkSdjQbpYWCvWcNPDpPuLRYTrLMoeOHjmqI4sk0gPgDhB
   D7+YeKCnf6g/lZqGXY7F3Y2n+F0sGeLFGQl1+ceO5NtSVw/+cmOSvUslJ
   Hr2uNaeK+3pLmcY8VbJVzXkACjWdoPWjwyIIayROtK5BVeOHzT9mP1Lkd
   /Go6ADseZ3zcYR+AvXfpV8qL5rMb2bGb6z/Pqk4H6L4guPpWXT95MKzkZ
   g==;
X-CSE-ConnectionGUID: oqbu4cuLTeekOoa9TyvgbA==
X-CSE-MsgGUID: CCJ+UWrSSCmlsDHq0k2iyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21425357"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21425357"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 07:38:53 -0700
X-CSE-ConnectionGUID: Eg4VlhHuS2uz6ngF+b/6jg==
X-CSE-MsgGUID: eo7SbC/ZQci+x8jgILncqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="62180887"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2024 07:38:51 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc4Hv-0006F0-2w;
	Thu, 08 Aug 2024 14:38:48 +0000
Date: Thu, 8 Aug 2024 22:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] arm64: dts: imx8mm-kontron: Add DL (Display-Line)
 overlay with LVDS support
Message-ID: <202408082229.A4ftAaLu-lkp@intel.com>
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
In-Reply-To: <20240806133352.440922-5-frieder@fris.de>
References: <20240806133352.440922-5-frieder@fris.de>
TO: Frieder Schrempf <frieder@fris.de>
TO: Conor Dooley <conor+dt@kernel.org>
TO: devicetree@vger.kernel.org
TO: imx@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Shawn Guo <shawnguo@kernel.org>
CC: Frieder Schrempf <frieder.schrempf@kontron.de>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Fabio Estevam <festevam@gmail.com>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>
CC: Gregor Herburger <gregor.herburger@ew.tq-group.com>
CC: Hugo Villeneuve <hvilleneuve@dimonoff.com>
CC: Joao Paulo Goncalves <joao.goncalves@toradex.com>
CC: Mathieu Othacehe <m.othacehe@gmail.com>
CC: Parthiban Nallathambi <parthiban@linumiz.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>

Hi Frieder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next drm-tip/drm-tip linus/master v6.11-rc2 next-20240808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/dt-bindings-vendor-prefixes-Add-Jenson-Display/20240806-220206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240806133352.440922-5-frieder%40fris.de
patch subject: [PATCH 4/4] arm64: dts: imx8mm-kontron: Add DL (Display-Line) overlay with LVDS support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240808/202408082229.A4ftAaLu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082229.A4ftAaLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408082229.A4ftAaLu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: /soc@0/bus@30800000/spba-bus@30800000/spi@30830000/can@0: failed to match any schema with compatible: ['microchip,mcp2515']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
