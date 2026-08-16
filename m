Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A152C3B47C3
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786892428; cv=none; b=NpJNphD2sbmz+YOfi7xJfUxZc2iuniXBcXsprC0VgGyknlzUw3g0ZWtIRrZ6rn+UDCD5Ke/AXBz6/AXSri5Ul4hly0y39fv8HskJOjh8HMFnz2MqLZuhCMOE3QjsS38huiqzo/Eec63ZUSMDn4jTGIAN69czy2QkxiodlOkLhEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786892428; c=relaxed/simple;
	bh=JP+D2TxXZ+d+I5fGHKo7JjyvIWe9rzW7xt/NLfmXm4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vj32iJXqJYrlgbWGUUOJyHiU7wpSI6J208PK/8ITV1IBuFoNgK6td+01DfmlGHOaNo5yr2z7gPe6VsuP9/CglRY7ujqQj+BgWqHn8LISBIgeONb6/xI5YJdEcShT7jBw6xZ6+VXYeIicsk3mjfB2HApAxeJ2iCJKVrz/DApEjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T97S43p2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T97S43p2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786892423; x=1818428423;
  h=date:from:to:cc:subject:message-id;
  bh=JP+D2TxXZ+d+I5fGHKo7JjyvIWe9rzW7xt/NLfmXm4o=;
  b=T97S43p2RUuvUTkQBjyw5FWYy6PUSofHAF8Jo86p4ZglRUrBkd8yOFLm
   VPv+hfAIeuNzG/bXOYIsP1p8219u4rHxcE19scZeiNXySSlt7DQ1AqXjj
   aefsS56Q7m81SR/6PJxm/7f3ZMzQe0q/AaFvQDl7IYZVHzBhXFsIMHLNW
   JWR9o7o+CGRdu1353CZvz5i2B8B6IpHiSbPpWOjXqzzuBPNJ2IfQ0HU6j
   2v/k4Zs8+u69sokPe4WP7gxMM48tS5FH63msa/qYlOthP1Q8+Ld6VVW5+
   cJLtDlXTIbIE3cPXHcIOhtezCRxsoKmYshAWZiemZ1ie6BKgyoDNufALQ
   g==;
X-CSE-ConnectionGUID: PZ/r2rJIQKqxeqG6n3enow==
X-CSE-MsgGUID: Hhno1k93QBCJBuyuL5mJbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98050060"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="98050060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 08:00:21 -0700
X-CSE-ConnectionGUID: HGeq4NkTSTyjxrz2m3Id+w==
X-CSE-MsgGUID: E5iMQg0rTAi+PGal1DkbLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="262922775"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Aug 2026 08:00:21 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvcLS-000000006bZ-13Aq;
	Sun, 16 Aug 2026 15:00:18 +0000
Date: Sun, 16 Aug 2026 17:00:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: /
 (gocontroll,moduline-display-106): hardware: b'Moduline Display V1.06\x00' is
 not of type 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608161603.CyPM1m5o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maud Spierings <maudspierings@gocontroll.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: 056c68875122dd342782e5956ed145fe9e059614 arm64: dts: freescale: moduline-display: fix compatible
date:   8 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260816/202608161603.CyPM1m5o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161603.CyPM1m5o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 056c68875122 ("arm64: dts: freescale: moduline-display: fix compatible")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608161603.CyPM1m5o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: / (gocontroll,moduline-display-106): hardware: b'Moduline Display V1.06\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: / (gocontroll,moduline-display-106): hardware: b'Moduline Display V1.06\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: / (gocontroll,moduline-display-106): hardware: b'Moduline Display V1.06\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
