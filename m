Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306422D613
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 01:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751162195; cv=none; b=cGQ9CqOUcOu9d0/2Qvpb64i8TDCVJ+k7iD9shJJFA/zey0pO8rcYP2aNyQkUON+ELY9zlyiDD5EtHAxNT9NAaAjTvq4UBnWyl4UDlrrUa1+0OJ/h6bpIVH1Yir2TTKx4bxmwFgnXjyob6GzMrVZuZzycakVHifYP5tVPu+hmKv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751162195; c=relaxed/simple;
	bh=G8c/zYXexG+vV9N+oz7RggumAu3c1u+cGHcgBUbqXBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SUQQPsNsvdFF8t63ikBcKX2wgwDd7YQpGe2a0JbLGwDqy535cgMNqy4HfiIx6esTo41TCPZC2jcc0nVdAuwe8dMxKIZn/tuLDuNpZhqXnGxDGZIz4hwRq8y8IEFXFMhLcbdjy55PdaPTwDMUrAAJgepFF0Q9km58h2FAliwDypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qb786XY1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qb786XY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751162193; x=1782698193;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G8c/zYXexG+vV9N+oz7RggumAu3c1u+cGHcgBUbqXBI=;
  b=Qb786XY1IW/Bj/8X8VOt+XH62HllQeVJC1JrCen/TBzDCspX/9ykYvMe
   EChKUrQOAo8W4IxDlZT0OOIOeJ+54DhHtwlQJipCc+lDJIdNy8TDwnUxJ
   hjiguKarqeHtrIE91+emBmjRcG1uSByLxVinz8OfZN5UtLIIJQ6Ez0dO9
   iv213RBbXeg6LK2JVqzoTVhkEEDRNrBBt8TTlBsBZYlDvHO9sD1w4VajY
   HjY8z1PfD+YWd42VTPH+O1sSp4D4s+9lX3jjFoEaCE7M4FMc3f1Av81UV
   lXs7kBbnc19MvFN75qMwR8JbVWWTNJoHGl5epVoBSobVBBj+preog3lv0
   A==;
X-CSE-ConnectionGUID: BYp3YdoKQealTj020LH5cA==
X-CSE-MsgGUID: tQB6vLEaSmKOCNoDQ+x9+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="57204082"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="57204082"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 18:56:33 -0700
X-CSE-ConnectionGUID: AUa5Hew4R6aqH7OmjeJm+A==
X-CSE-MsgGUID: fVyNC9aVSIGOc9koh70NAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="153427568"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2025 18:56:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVhHR-000XZy-1P;
	Sun, 29 Jun 2025 01:56:29 +0000
Date: Sun, 29 Jun 2025 09:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 02/13] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
Message-ID: <202506290937.5pWpVttE-lkp@intel.com>
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
In-Reply-To: <20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com>
TO: "Clément Le Goffic" <clement.legoffic@foss.st.com>
TO: Will Deacon <will@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Gatien Chevallier <gatien.chevallier@foss.st.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-perf-users@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: "Clément Le Goffic" <clement.legoffic@foss.st.com>

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 86731a2a651e58953fc949573895f2fa6d456841]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250623-173554
base:   86731a2a651e58953fc949573895f2fa6d456841
patch link:    https://lore.kernel.org/r/20250623-ddrperfm-upstream-v1-2-7dffff168090%40foss.st.com
patch subject: [PATCH 02/13] dt-bindings: stm32: stm32mp25: add `access-controller-cell` property
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250629/202506290937.5pWpVttE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290937.5pWpVttE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506290937.5pWpVttE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/st/stm32mp235f-dk.dtb: clock-controller@44200000 (st,stm32mp25-rcc): '#access-controller-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/st,stm32mp25-rcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
