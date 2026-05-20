Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4033B3890
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269987; cv=none; b=s4HUxj0271ikeQxkK9o5kOOxjnpfA+ro9BuI2EZqFXYucvMH+LRhkTP5uKG3ej1FrtsajlXyWazrKWCOlJVubAsk5lxE/9Pe5tU6nXORUmwC73jp2RwWIGcsnPArGoeQ+mbnOK+Oy2+NgAjjYn6hoBUEsoNijxf40VvLIwDcj4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269987; c=relaxed/simple;
	bh=PiMGc46nAwTWHDFjQIcJvSVJotEZxtV0ghOCHrVA1aw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XyOwwW43sepYtKYb50ONEdfxO0vYZ9YTjcLfKIo6yzKLwMa6WpmO8k9h+xgOd17TgksDgeVG2mv12nr9tb/deqU5t9yi0J1LSZELkXPxdhIynG2RJM+UdKETcUK8xuw0xqls/mBrop1KIYuHLLkwUSqEkaj1awfNkh7b489MYsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsgaMqnN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsgaMqnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779269978; x=1810805978;
  h=date:from:to:cc:subject:message-id;
  bh=PiMGc46nAwTWHDFjQIcJvSVJotEZxtV0ghOCHrVA1aw=;
  b=XsgaMqnNUTnBAgkArJ9AeJ/UkmFR9Tq4qYJhlnQieDxP9t37Tz0YZFRg
   AvH7NwgBMzCJRD4jNLuadzzBbk7wjKInqEwLnbA/2Q0G1kqKDKKjC5MvI
   tXUvJqd+W7/BHyCK0dtAr2zJj5fvJYvaOM/QNEaJyAOVbm6bsWtQstCpL
   HibQIhWAaaikmcYEJ+E+CF0Y1Esj2dWe4NOGeK5RPhGknkXGEe/pAssZy
   nHai3ylG4wQDFAWWf53ApFbvG/iUCNWxM86Luxl+qqjQROHDQXHTVLw3X
   OUCq3leO/ORdK8frdDwkSzqCQX15qIW2OptVOEkvAyRPqoUu4ScuZ1NCh
   A==;
X-CSE-ConnectionGUID: coNo11KAQaiGPH1tpi0sFQ==
X-CSE-MsgGUID: g/09HiWXSlu/wInnuIy4rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90461359"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="90461359"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 02:39:33 -0700
X-CSE-ConnectionGUID: R9x8vrzSQyO5hWrWaVqg/A==
X-CSE-MsgGUID: Yg0UDKvQRrae/5bELZKSOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="241926565"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2026 02:39:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPdOk-00000000AUj-2O9G;
	Wed, 20 May 2026 09:39:30 +0000
Date: Wed, 20 May 2026 11:38:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202605201157.37h464ZH-lkp@intel.com>
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
TO: Neil Cheng <neilcheng0417@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Neil-Cheng/dt-bindings-arm-aspeed-Add-Meta-Rainiera6-board/20260518-162025
head:   3220ca54a950aec78cbd09364f027c8721c2131b
commit: 3220ca54a950aec78cbd09364f027c8721c2131b ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2053-20260518 (https://download.01.org/0day-ci/archive/20260520/202605201157.37h464ZH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201157.37h464ZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605201157.37h464ZH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
