Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBA01F5842
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 14:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523395; cv=none; b=LIhhLAXplMSTHelC8D6UG83MmVLd7rykEjw2TA3AqC+MUxOhlyLMvswSM8uF/ZRiJq/TuPLL5tEgOwCW5go0+e2xoUQMmhRhxRjtu0d2ywp6I6e+UshYey8MFf6MKPHuNFe9YsoIkNf7hq9M2ir7h9AgPDGAyPyuILPdUvDEzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523395; c=relaxed/simple;
	bh=yOg870iQ9mvbRYX5mk7KQ7RjmdadlVVqwLnihS200dU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KdOeOffsSzr+Sgoy+6K36ODPVde1I4DOBj49PnJMFuoYEyZDkzXBvtV0GBnOd+ryEG8Pn+uut+f/ejnmbmHgDubEFuEUSjI8OJGZnE2izcHZ1hTPP31bvRhjosCOerHlnGZWoo9OfmqznLc81gfME4FiobIGaMkp5nugbn0JhCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEGo/C5v; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEGo/C5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769523393; x=1801059393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yOg870iQ9mvbRYX5mk7KQ7RjmdadlVVqwLnihS200dU=;
  b=AEGo/C5vQRrZUXHRPzvXsViVL0LPZCROq3oVoPUNH0z+335ZQBMHu0iV
   UH5ySUI53+im684i7Vtgqj7bBex8yUDLnl8mp18mRgdivsGqTus3BL5wo
   WSKJZ1B5rl9XECBMwlt+3PZcjuWQikWM61jzsZWheYfwVSE9KAk4Sp3Cz
   1qdJcWLgHmMEReKzKiPdeBlvvWP2T2mokIvH0hlQ5dAnWLB1a1dO1Eq5P
   JhZm76JZ3kbqqpET8pRCBwMbOu5i3VJ5hwpOJmzgPW/ClDigkTS4ZEAFB
   IdNAcGyrNPk1ZYTaR8VMjz8SawgaeZq+kpHYA391Asr8hzL7zmzBI1zQf
   Q==;
X-CSE-ConnectionGUID: 4E7MnO6zRWmWJcQLCeHlzA==
X-CSE-MsgGUID: wA4O/8fMRUK7m0pSMkM3RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70620813"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70620813"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 06:16:32 -0800
X-CSE-ConnectionGUID: sIZmzfa2SI6LffMxq0MnAQ==
X-CSE-MsgGUID: CgdInVO3RayZysGSzBZOgQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2026 06:16:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkjro-00000000YXg-3evr;
	Tue, 27 Jan 2026 14:16:28 +0000
Date: Tue, 27 Jan 2026 22:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <202601272236.5gRbHfvd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/tenstorrent/atlantis-prcm.c:939:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260126-atlantis-clocks-v3-3-b016135551b7@oss.tenstorrent.com>
References: <20260126-atlantis-clocks-v3-3-b016135551b7@oss.tenstorrent.com>
TO: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
TO: Drew Fustini <dfustini@oss.tenstorrent.com>
TO: Joel Stanley <jms@oss.tenstorrent.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: joel@jms.id.au
CC: fustini@kernel.org
CC: mpe@kernel.org
CC: mpe@oss.tenstorrent.com
CC: npiggin@oss.tenstorrent.com
CC: agross@kernel.org
CC: agross@oss.tenstorrent.com
CC: bmasney@redhat.com

Hi Anirudh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Anirudh-Srinivasan/dt-bindings-clk-tenstorrent-Add-tenstorrent-atlantis-prcm/20260127-051019
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20260126-atlantis-clocks-v3-3-b016135551b7%40oss.tenstorrent.com
patch subject: [PATCH v3 3/3] clk: tenstorrent: Add Atlantis clock controller driver
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arc-randconfig-r113-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272236.5gRbHfvd-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272236.5gRbHfvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601272236.5gRbHfvd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/tenstorrent/atlantis-prcm.c:939:1: sparse: sparse: bad integer constant expression
   drivers/clk/tenstorrent/atlantis-prcm.c:939:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/tenstorrent/atlantis-prcm.c:940:1: sparse: sparse: bad integer constant expression
   drivers/clk/tenstorrent/atlantis-prcm.c:940:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clk/tenstorrent/atlantis-prcm.c:941:1: sparse: sparse: bad integer constant expression
   drivers/clk/tenstorrent/atlantis-prcm.c:941:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/tenstorrent/atlantis-prcm.c:941:1: sparse: sparse: bad integer constant expression
   drivers/clk/tenstorrent/atlantis-prcm.c:941:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +939 drivers/clk/tenstorrent/atlantis-prcm.c

6129d503f96b34 Anirudh Srinivasan 2026-01-26  938  
6129d503f96b34 Anirudh Srinivasan 2026-01-26 @939  MODULE_DESCRIPTION("Tenstorrent Atlantis PRCM Clock Controller Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
