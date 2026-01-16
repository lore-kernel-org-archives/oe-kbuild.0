Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4D93612E6
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563961; cv=none; b=o2Qc3rUsCaz01p1kjkkXY7mkOa2PmVo9va4X+jUHaDlzak+HJgZf5OwS9dERLMTK8RJ+nBfD/+vkiQufU1QF6NcRY2REnmPBRS/hGqGnDTH8WqF8d2KQjqzgRbrqoltxqKVdOwqEZNyaeJ4Qm3p3kDSbVP9p+9Eb4aNu9M/RrLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563961; c=relaxed/simple;
	bh=ezLnr1B+DQj4iybGuW7LsqJkOZQM1GqyJEUtpoJvgVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eq4Ilj0ckB/EVyCdwdBrtY6S2WttdJLfzmRC1vNkawNeDmedxHJ5knYTjmSZk6kog7uQvZ2nAp0+AfDW5CCeJyjZ+bugv72FY2uCWn3vZ06uJxV4wKWQdwM1uERofFECH1H7iH0b7npQXoWxyAKczfDmi0lmPeZQX9G70+hSBBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zo9kfmQH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zo9kfmQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768563958; x=1800099958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ezLnr1B+DQj4iybGuW7LsqJkOZQM1GqyJEUtpoJvgVs=;
  b=Zo9kfmQHTbzYqY/xQQeHu+YHd/rJM84dLy2Vwi6nL+uJs8V60p/hiNgu
   xe6/p5MA7ZgRI/wNGw6pJ1vqaFoub2QlheLhDhKVA3bI8CGtTZdOn7raO
   Tel9IjbfVHtCEGNlg1iwHkFJcD1S8WN8I46OGL2OTEq/AsajbyabOyC0N
   /swLJ0EQfQjpUb0godKHTuF/wzogYTe5QvyDPVj5+6vd3VuygxtULjS5h
   93vlQqB2VGHpKapU4lg/u6ybjxXbL6DWlp/Wy8o1RBg4z0JVZOR7a8dZU
   aP0CUiJ4MaSCoe7d/nyJFOrVFdKdgFV0aER+VPgTBvFbVSYjuiP1W+aBS
   A==;
X-CSE-ConnectionGUID: i7rU3rjqQ5yDRBDXgal0Fw==
X-CSE-MsgGUID: /KIpw/oJRCqPqGx4kjxp0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69789460"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69789460"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 03:45:57 -0800
X-CSE-ConnectionGUID: y5vfeMZhSM6oZAQf6iuRDw==
X-CSE-MsgGUID: ar95nAgOQROGLZvDALkX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="228240712"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jan 2026 03:45:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgiH4-00000000Kmq-1LMo;
	Fri, 16 Jan 2026 11:45:54 +0000
Date: Fri, 16 Jan 2026 19:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/8] reset: tenstorrent: Add reset controller for Atlantis
Message-ID: <202601161943.3gqYW4vg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/reset/reset-tenstorrent-atlantis.c:162:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260115-atlantis-clocks-v1-7-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-7-7356e671f28b@oss.tenstorrent.com>
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

Hi Anirudh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Anirudh-Srinivasan/dt-bindings-soc-tenstorrent-Add-tenstorrent-atlantis-syscon/20260116-074618
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20260115-atlantis-clocks-v1-7-7356e671f28b%40oss.tenstorrent.com
patch subject: [PATCH 7/8] reset: tenstorrent: Add reset controller for Atlantis
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: csky-randconfig-r131-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161943.3gqYW4vg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161943.3gqYW4vg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601161943.3gqYW4vg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/reset/reset-tenstorrent-atlantis.c:162:1: sparse: sparse: bad integer constant expression
   drivers/reset/reset-tenstorrent-atlantis.c:162:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/reset/reset-tenstorrent-atlantis.c:163:1: sparse: sparse: bad integer constant expression
   drivers/reset/reset-tenstorrent-atlantis.c:163:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/reset/reset-tenstorrent-atlantis.c:164:1: sparse: sparse: bad integer constant expression
   drivers/reset/reset-tenstorrent-atlantis.c:164:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/reset/reset-tenstorrent-atlantis.c:164:1: sparse: sparse: bad integer constant expression
   drivers/reset/reset-tenstorrent-atlantis.c:164:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +162 drivers/reset/reset-tenstorrent-atlantis.c

6e8cb0dcc02494 Anirudh Srinivasan 2026-01-15  161  
6e8cb0dcc02494 Anirudh Srinivasan 2026-01-15 @162  MODULE_AUTHOR("Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
