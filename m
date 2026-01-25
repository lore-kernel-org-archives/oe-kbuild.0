Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EC03EBF04
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769365113; cv=none; b=sZ50p+SpD2bjdGgnZtA7jGzYYA85LKbnlK2oEsMai42Y5bvRycrLczOMrIVDMY4PcJYldcwptEIPWvljJwD/wlLSSnfn1xhreGZ9ZuNBg6ZX0G2fDz5hRT8W4cwMh6nJh0YFn4MmS2GMgmCat+HX+6fhZff5vkdeNCF9mMmPTa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769365113; c=relaxed/simple;
	bh=koE4zw6XsfdI8reopglcPAe8/QFKsOG5xrz1+LzeOb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dPWmkcSp7OZu91+Br70Wu6aFm4x2Y+yNL+q5M/Gw5IOynZPEQsl8qZRZy3sBAF9FTW34WEcvxAS0aU1g8wBUSq+HZhc3kiobSKkKrA4rej5dT58JiRI1zpeCxih3JK/D9Nzk6zUxMlJs50rY0wBxtUeNXoErSN+Rz9kxivIClHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSZOQYOP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSZOQYOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769365112; x=1800901112;
  h=date:from:to:cc:subject:message-id;
  bh=koE4zw6XsfdI8reopglcPAe8/QFKsOG5xrz1+LzeOb4=;
  b=cSZOQYOPzjfikkiJ+BA3BqllSZhppE5t+k8CMvCJ42wWYR2KvEI/rbqI
   Bc8YYJHbr9MQFbdLdhJtfHDm4yxJutHXF+Kz4GgBXAjxd380e575EC3tC
   U7rgceWRJ6SOQa9EdKXtW50+b0Cj9WX/T5pppFK3Br8/hp5PFrzwWPqE4
   Ow7+Gd5G5aNxHvZ+/m/WtSNH9XgxoE03Bwmn0SwZDB0liJVlxcBXMIGDg
   1O9bFxWDmAEof/NOIrCoLkXYzlOjCJn99xboEtjDCDmm/2YKZ4/oOhHkb
   qmDsavs9cElU3JXrOGVmWYszdjPfaIulkfyMxw59dCSjeOGCCK+uBxIRG
   A==;
X-CSE-ConnectionGUID: ISkJb9XVTvyjRlKvvGXL+Q==
X-CSE-MsgGUID: FF2jFYAgRs22xBL5bl0SAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="80855256"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="80855256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 10:18:32 -0800
X-CSE-ConnectionGUID: BPqXGD0zQQmbqpJ5CqX1+Q==
X-CSE-MsgGUID: iAYYcLkhTViv9ufmgvpLug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207551390"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Jan 2026 10:18:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk4gu-00000000WKW-1Fwa;
	Sun, 25 Jan 2026 18:18:28 +0000
Date: Mon, 26 Jan 2026 02:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pcarrier:v6.19-rc6-odin3 9/12]
 drivers/gpu/drm/panel/panel-chipone-icna3520.c:353:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601260210.rWRNpw1g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/panel/panel-chipone-icna3520.c:353:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gianni Spadoni <me@gio.blue>

tree:   https://github.com/pcarrier/linux v6.19-rc6-odin3
head:   91a28d8aa538293ebd31727779aac8f23cb73b39
commit: deae82762fe83e6dcfda215a495c15577ce57f14 [9/12] arm64: dts: qcom: Enable display on Ayn Odin 3
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r121-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260210.rWRNpw1g-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260210.rWRNpw1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601260210.rWRNpw1g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-chipone-icna3520.c:353:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/panel/panel-chipone-icna3520.c:353:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/panel/panel-chipone-icna3520.c:354:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/panel/panel-chipone-icna3520.c:354:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/panel/panel-chipone-icna3520.c:355:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/panel/panel-chipone-icna3520.c:355:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/panel/panel-chipone-icna3520.c:355:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/panel/panel-chipone-icna3520.c:355:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +353 drivers/gpu/drm/panel/panel-chipone-icna3520.c

deae82762fe83e Gianni Spadoni 2026-01-23  352  
deae82762fe83e Gianni Spadoni 2026-01-23 @353  MODULE_AUTHOR("Gianni Spadoni <me@gio.blue>"); 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
