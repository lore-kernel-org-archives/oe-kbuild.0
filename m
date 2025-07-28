Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F602237163
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Jul 2025 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753714752; cv=none; b=fXcPhqPbmTiUl726Jlp/LtgTMuV7EcrMwtuYN0WL7D/bnoYqYMyY0EoES5XamUX7qMamIlMIpmTVOwxOe/oQIfnNw/FWlhQwIdwycI1O+J0ysJJiCYyibl68zJcCiC1xPRByfEp6HveOe8tK2l9ze/bxwjgDV18HCN467BgClmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753714752; c=relaxed/simple;
	bh=ePBlL3Xxs3KA4fTlORZO3zYcMq2rVPPSOI83kE00lQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRVZ4RZMBsznQ8hdagUwsd6LekMuJLQXYnyS59tTvUNl4tyCbu2zEYih9NLu6Xu5on6eaoyzpF2gR3oVQt+tWvUqYqujMWJiU+/BobwmssTHq5fcEsY/Vd1XeWaQXkutsn/yAkCYZxBuykF7jfH/0JxI201Y5zFRuDb9vbX45M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Unkm7s7d; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Unkm7s7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753714750; x=1785250750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ePBlL3Xxs3KA4fTlORZO3zYcMq2rVPPSOI83kE00lQQ=;
  b=Unkm7s7dTw2Lg4C1/yxOjLX1qSOTJ/AzijFswxmYCbNHw/H2PktyJpbj
   1MVuhFE0uaZZat9ldUFq57Jt3HOlLMY+lc4bblwumhH2qRFYqNIwVHe5H
   Vondm19cDLpzm8cNtaUrBM6H3rygfkayKsDcOzZyPxo/bEhqbap6rFcGV
   ENx59WiP2twae6ptTdPtA5SPT9NXM3P5KMhV2HzI2i2KdVcm0ydxPSW3R
   5VdL12ZA2mSTnWs3WabaN6xuA7PQwX0ZAiHeIFvex2dGxjys/KoVCpj4i
   smiZb0I5tBbaD+4pfyLuhCZ0UGAchRzfRnywMhA6RZE1Mfer9R27aMIhC
   w==;
X-CSE-ConnectionGUID: g1CvT0nbQPO1cwuIFK6Hxg==
X-CSE-MsgGUID: X7kfHcRLTVSkSqhKWZzHZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="43577405"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="43577405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 07:59:09 -0700
X-CSE-ConnectionGUID: S49AtkODRAmJQ6ODjftIig==
X-CSE-MsgGUID: 6XtRphXXS5aOwxo1kz/+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161717939"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Jul 2025 07:59:07 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugPJh-0000WN-0L;
	Mon, 28 Jul 2025 14:59:05 +0000
Date: Mon, 28 Jul 2025 22:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 3/5] dpll: zl3073x: Add firmware loading
 functionality
Message-ID: <202507282200.NdMNR61W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250725154136.1008132-4-ivecera@redhat.com>
References: <20250725154136.1008132-4-ivecera@redhat.com>
TO: Ivan Vecera <ivecera@redhat.com>
TO: netdev@vger.kernel.org
CC: Jiri Pirko <jiri@resnulli.us>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Prathosh Satish <Prathosh.Satish@microchip.com>
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Michal Schmidt <mschmidt@redhat.com>
CC: Petr Oros <poros@redhat.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dpll-zl3073x-Add-functions-to-access-hardware-registers/20250725-234600
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250725154136.1008132-4-ivecera%40redhat.com
patch subject: [PATCH net-next 3/5] dpll: zl3073x: Add firmware loading functionality
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-r072-20250728 (https://download.01.org/0day-ci/archive/20250728/202507282200.NdMNR61W-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507282200.NdMNR61W-lkp@intel.com/

smatch warnings:
drivers/dpll/zl3073x/fw.c:494 zl3073x_fw_flash() error: uninitialized symbol 'rc'.

vim +/rc +494 drivers/dpll/zl3073x/fw.c

1be19dc363ff8f7 Ivan Vecera 2025-07-25  478  
1be19dc363ff8f7 Ivan Vecera 2025-07-25  479  int zl3073x_fw_flash(struct zl3073x_dev *zldev, struct zl3073x_fw *zlfw,
1be19dc363ff8f7 Ivan Vecera 2025-07-25  480  		     struct netlink_ext_ack *extack)
1be19dc363ff8f7 Ivan Vecera 2025-07-25  481  {
1be19dc363ff8f7 Ivan Vecera 2025-07-25  482  	int i, rc;
1be19dc363ff8f7 Ivan Vecera 2025-07-25  483  
1be19dc363ff8f7 Ivan Vecera 2025-07-25  484  	for (i = 0; i < ZL_FW_NUM_COMPONENTS; i++) {
1be19dc363ff8f7 Ivan Vecera 2025-07-25  485  		if (!zlfw->component[i])
1be19dc363ff8f7 Ivan Vecera 2025-07-25  486  			continue; /* Component is not present */
1be19dc363ff8f7 Ivan Vecera 2025-07-25  487  
1be19dc363ff8f7 Ivan Vecera 2025-07-25  488  		rc = zl3073x_fw_component_flash(zldev, zlfw->component[i],
1be19dc363ff8f7 Ivan Vecera 2025-07-25  489  						extack);
1be19dc363ff8f7 Ivan Vecera 2025-07-25  490  		if (rc)
1be19dc363ff8f7 Ivan Vecera 2025-07-25  491  			break;
1be19dc363ff8f7 Ivan Vecera 2025-07-25  492  	}
1be19dc363ff8f7 Ivan Vecera 2025-07-25  493  
1be19dc363ff8f7 Ivan Vecera 2025-07-25 @494  	return rc;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
