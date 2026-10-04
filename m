Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0849227BB9
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791126619; cv=none; b=X85ct2CVhuZG0qdH49EmJnwTH5Yuo6j6rtXo1uPYbVwhj+aix7HhDzdyu0/BH2Yq+LSoo4kHSqajdIPoXoowpygJV/O/A6nRRvWf9+p0t3Ifu3ETswA0MEYVqml1cD7VUr58iCqiJFo1WIgnD6zOnWUq1bQwB8nyiK/pH5O3ma4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791126619; c=relaxed/simple;
	bh=yl9v4ltkRrHN+8XmBiaF/10CvTOLAliveuSf4qtvdic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rgmqi8oT/ryrRKXXEAl5t/9/Pms+Ap3ghZgUzmh0Li+S8JBizmaIkgoEVgb3LShI04TS3e7PrEfTUFNqzNx6VWa3IJhiXzPuh1rsVowT10jFRn5PNfkcxc3iM7ZU728KQcV3F2Ywt3zRf45lqoChdYKaen78fNKS+YD80MUYRoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NA2kNYGV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NA2kNYGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791126617; x=1822662617;
  h=date:from:to:cc:subject:message-id;
  bh=yl9v4ltkRrHN+8XmBiaF/10CvTOLAliveuSf4qtvdic=;
  b=NA2kNYGV5i3LaxWCRW7qHk3EEHak4UGBZzZYqDc8APln1LqWfFs1p9g6
   eEtQwzpYvtM6TM32O1phQn63hrN/eyWYGm1ooH/gLr1nvpTgPYo69+Xj4
   erkcJD5xH2BjRSW/ysJl/Qew49Rmv7Uq2VxT9mmbIv8ygcpDYQqhJXW7W
   nqvwhUScOjIyzIq7zS6NMxiBhYwy9SRE5qPJqQN8KjAYkc19Nvrv2+HSG
   9rMJiRRKoFJ4uCr6cHL+A7xh5lIsgbWpLfi3+qiCb8kUSbijULv5xMBEK
   5P0U+pG2pHjDBafpQ5uh3AoSCxzTVExh/mc1i5dp7hrTQdWbSidANxyoD
   Q==;
X-CSE-ConnectionGUID: FTW1P0TwTGKw0ECiqYYsXw==
X-CSE-MsgGUID: hWEUkztFQF+cVOFfhhS7uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="95626740"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="95626740"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 08:10:17 -0700
X-CSE-ConnectionGUID: fqD9y959RjitcZNAA7QBFA==
X-CSE-MsgGUID: hfh+nBWsSGq2GbxAglzFCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="273027417"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Oct 2026 08:10:16 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDNqw-00000000Up7-19sz;
	Sun, 04 Oct 2026 15:10:14 +0000
Date: Sun, 04 Oct 2026 23:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/tiny/ra8875.c:140:undefined reference to
 `of_get_videomode'
Message-ID: <202610042347.idGisdDW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Adam-Azuddin/dt-bindings-display-panel-Add-RAiO-RA8875-display-controller/20261001-224125, commit: 9d03fa1e817a89924a845989503ebd78e0e6484e"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Adam Azuddin <azuddinadam@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Adam-Azuddin/dt-bindings-display-panel-Add-RAiO-RA8875-display-controller/20261001-224125
head:   9d03fa1e817a89924a845989503ebd78e0e6484e
commit: 9d03fa1e817a89924a845989503ebd78e0e6484e drm/tiny: Add RAiO RA8875 display controller driver
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: xtensa-randconfig-1000-20261003 (https://download.01.org/0day-ci/archive/20261004/202610042347.idGisdDW-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610042347.idGisdDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610042347.idGisdDW-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/gpu/drm/tiny/ra8875.o: in function `ra8875_connector_get_modes':
>> drivers/gpu/drm/tiny/ra8875.c:140:(.text+0x268): undefined reference to `of_get_videomode'
   xtensa-linux-ld: drivers/gpu/drm/tiny/ra8875.o: in function `ra8875_probe':
   drivers/gpu/drm/tiny/ra8875.c:614:(.text+0x3a2): undefined reference to `of_get_videomode'


vim +140 drivers/gpu/drm/tiny/ra8875.c

9d03fa1e817a89 Adam Azuddin 2026-10-01  133  
9d03fa1e817a89 Adam Azuddin 2026-10-01  134  static int ra8875_connector_get_modes(struct drm_connector *connector)
9d03fa1e817a89 Adam Azuddin 2026-10-01  135  {
9d03fa1e817a89 Adam Azuddin 2026-10-01  136  	struct ra8875_device *ra8875 =
9d03fa1e817a89 Adam Azuddin 2026-10-01  137  		container_of(connector, struct ra8875_device, connector);
9d03fa1e817a89 Adam Azuddin 2026-10-01  138  
9d03fa1e817a89 Adam Azuddin 2026-10-01  139  	return drm_connector_helper_get_modes_fixed(connector, &ra8875->mode);
9d03fa1e817a89 Adam Azuddin 2026-10-01 @140  }
9d03fa1e817a89 Adam Azuddin 2026-10-01  141  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
