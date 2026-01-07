Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8523D7F5
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821785; cv=none; b=C2KfvL1Nd55em5/kk5l4H62/eOs4B6uGUBRdQzW8sCUPP7DwwK7M+/NApqYpd+fgccJBzL8hUi5cQJveL8eWlLbtHoyz2hD/+SVc6EKemX9RmaS3XS7cVDDWGxnqhvInGdhlCXZ3fIIJOio+8gcvN3S4ME+2OLN6JtSYMFSaHLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821785; c=relaxed/simple;
	bh=Py95zTwcssuw98hOTMVWuWqwZWcTd7XscJNcJNC5I20=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WuY8r20PmYhytblS+RB4+TjA7OhjXQ3ha1ZPBZSUsSpA7z4elPAoN7SQT+JvwWSwU2dpTEr47bsawyTkY6skOA8KOUiDYKuF2/rQ0ZW6jCJQp9MjUurMUbpuc8yjnm7cHAwtbWBagAnGLrW8jMIhbWIR7LBcm2wdjwdiHl77DGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hG3+cOKZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hG3+cOKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767821784; x=1799357784;
  h=date:from:to:cc:subject:message-id;
  bh=Py95zTwcssuw98hOTMVWuWqwZWcTd7XscJNcJNC5I20=;
  b=hG3+cOKZBm4g+WhAEPV51932RKd2OSyAFfz1hUVPoMotTrBhgeu6zKEN
   l2VdvMA6PuTNQ6ykBTvkTfLubBEZUBnCDS+LG4EII+Snm/VLzqA6ueoAk
   OeQoxX6WIXokxCz5HD6eQ2q5IzvKk8OJ5cc1iX26HE8qD/zDyw2/TTQM3
   loKJ1YbstCj+1rJc5ws/ivT4f8cX9nFqufxoPTSpKXNTum2bXktnfcEk4
   DbLQvLQ1yI7kB9EqAktyzg/NW1e1+QnSacUQSJRROsxugIS2QthkzH5DD
   T4H2n9Nfx0uAG44NXBuI7x2yhOubkIKfVf33q/fLcIdjRqRIjpjbnquqw
   w==;
X-CSE-ConnectionGUID: KsoOHbCIQHKs28opNb+C7A==
X-CSE-MsgGUID: wusoBEC7RHq4F0NgK96c0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="91857497"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="91857497"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 13:36:22 -0800
X-CSE-ConnectionGUID: bwCKhyqSTJSZFBYJk+9Kkw==
X-CSE-MsgGUID: xGRT3f+xTTGTUL4DaLwdVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="203291799"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2026 13:36:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdbCT-000000004BP-0zgj;
	Wed, 07 Jan 2026 21:36:17 +0000
Date: Thu, 08 Jan 2026 05:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3852/4438]
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c:19:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601080526.TnHDjDxs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c:19:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gert Wollny <gert.wollny@collabora.com>
CC: Christian Gmeiner <cgmeiner@igalia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
commit: 6a0b99e9fb45f403c3097a9047963d2dd5b0fab2 [3852/4438] drm/etnaviv: Add module parameter to force PPU flop reset
:::::: branch date: 15 hours ago
:::::: commit date: 30 hours ago
config: openrisc-randconfig-r133-20260108 (https://download.01.org/0day-ci/archive/20260108/202601080526.TnHDjDxs-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080526.TnHDjDxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601080526.TnHDjDxs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c:19:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c:19:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"

vim +19 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c

85ba57ad88cf96 Gert Wollny 2025-11-19  17  
6a0b99e9fb45f4 Gert Wollny 2025-11-19  18  static int etnaviv_force_flop_reset;
6a0b99e9fb45f4 Gert Wollny 2025-11-19 @19  module_param_named(force_flop_reset, etnaviv_force_flop_reset, int, 0);
6a0b99e9fb45f4 Gert Wollny 2025-11-19  20  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
