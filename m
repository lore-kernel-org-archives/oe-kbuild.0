Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E89256D
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Apr 2025 20:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745787441; cv=none; b=mgfoD2CDaM1NGzJNzwJ3Ag3kWvVkO8FAhHn1MLDOy2AloE9a6dMXEE5XTqCYRSb/UYvVSknhgYz4ftCK/JpAj8zABgtx32ZjSFugwLWSoG/9QsHuUYMb63TwEl5Mk4VjAuwOfjcbDLklaP+1l+s4fD4+SKrdMTytRzowwyBOqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745787441; c=relaxed/simple;
	bh=QwTFvGeeBQ5WeA118QOc9LefWS29AFhCHDzx8zvsLOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6/RT2LOibiBXfk7Ez1GYG7Q2qE5vrZre2K0HKsYcFaLZU0mjtJqy3KeMNhQUKfq0PMKxXNrbekJQsm31OB7mYwFua9gIvF+k9ECe5dw1hKmd/NjbdWy7H4Uzy9ANmzBXLOwvS6SfWDqWUkV2WSTp7NjRjTv1Oa0hzHXa/0oEsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoMBpFRZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoMBpFRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745787440; x=1777323440;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QwTFvGeeBQ5WeA118QOc9LefWS29AFhCHDzx8zvsLOY=;
  b=SoMBpFRZhwt2XbRu/nKYY+hu4zEzGX+49j/eEb7LEtZW/kIuEhuL0vYO
   Q0elYaaAJm/tQF96R0EqR602cEnwXfoGGF8c76PJPsr8chHNwSwNDdBYs
   jHKPGrq7CNsPY1GWJuZ0gIaJHpPQMSCm5xHzcHTxDeJmKa+xFMAbSRB2V
   p0EOH19QyyLJ2I+3d6bqEmZjrRfP/wJRMPhJKx/WpQG+IZqBZp0VH3C61
   0fUb4P4gw6qVURMsxkidvsB14KjE3juhqtRY/oIHEUCAJvBRgAbba7V+O
   cbBoLtM3zj6S5MYXJ8tXsbF7zPHFP5waJWJJ4NDJSTF62O1g7cr8gGnyv
   w==;
X-CSE-ConnectionGUID: VdigloWFTAKkG6dXTErEmQ==
X-CSE-MsgGUID: y4rEbH4zRs+QxAhC9lXb4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="51044209"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="51044209"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 13:57:19 -0700
X-CSE-ConnectionGUID: 9LJJBUU5QcaHrquh74bMcg==
X-CSE-MsgGUID: Ft/HlYPsQc2fXaiV0CBPMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="164308915"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Apr 2025 13:57:18 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u993r-0006TJ-0r;
	Sun, 27 Apr 2025 20:57:15 +0000
Date: Mon, 28 Apr 2025 04:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 8/8] ARM: dts: stm32: support STM32h747i-disco board
Message-ID: <202504280446.DbGUdlrN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250427074404.3278732-9-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-9-dario.binacchi@amarulasolutions.com>
TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
TO: linux-kernel@vger.kernel.org
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: linux-amarula@amarulasolutions.com
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: Conor Dooley <conor+dt@kernel.org>
CC: David Jander <david@protonic.nl>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Leonard Göhrs" <l.goehrs@pengutronix.de>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>
CC: Marek Vasut <marex@denx.de>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Roan van Dijk <roan@protonic.nl>
CC: Rob Herring <robh@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-stm32@st-md-mailman.stormreply.com

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next clk/clk-next linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/ARM-dts-stm32h7-pinctrl-add-_a-suffix-to-u-s-art_pins-phandles/20250427-154610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20250427074404.3278732-9-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH 8/8] ARM: dts: stm32: support STM32h747i-disco board
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-051-20250427 (https://download.01.org/0day-ci/archive/20250428/202504280446.DbGUdlrN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250428/202504280446.DbGUdlrN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504280446.DbGUdlrN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/st/stm32h747i-disco.dtb: /interrupt-controller@e000e100: failed to match any schema with compatible: ['arm,armv7m-nvic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
