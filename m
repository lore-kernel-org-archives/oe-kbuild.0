Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D7C374D1
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 05:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748495553; cv=none; b=ZWjgmMZqPvrozizwuybNxoCNZIHAuCDEOVnli1BSEGucyStPJAGaWgvIXa4xe7YTUMME+2J1vlvE6rTesfFznpvws21HCZ1dYIJc0p1oOLbrcBbJN8a8kR+8A/hdw0NJFuNHzdd2wlqgZXfVPo6D/JsTVT6beKYc6fAdTeET06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748495553; c=relaxed/simple;
	bh=gi7EVIJSCRA9efzxhk2LDwCt8lAU94NmvZGNr/siOG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+3glEfNBjul6AlxI6HNobBu3SMpqXiWyqkBW2jk9YSO7wkZbDIE1K6UGyxPE/hlS03BqHVimqP6VaaNoPKKwFFYW/cxlG/WGyyKLHVzgk8iOn3wWkUBcjRpRTOtBHbFHA0380mEeJIN2GS8XQjHIl2H3uRHg+oOULkFGngw+7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lASlBbne; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lASlBbne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748495552; x=1780031552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gi7EVIJSCRA9efzxhk2LDwCt8lAU94NmvZGNr/siOG0=;
  b=lASlBbne7XUB4W8TjWCAPP2tMlKBWpCljAUvngfU0ZVoxq5g+rlr3FKp
   9Ygs9ByoO4uM5PDVmqsbqcG7i+LnXPO8pNjh89t9nVcj35T3yS+avLu1C
   MiBMB+9fOM20nKDr5NYIe7zEVnRxPsrvYect34Ke+7GEnHl1u3dwYFWMG
   Cap1BODkHydYwfYbdubImfJbbXFcDdqGcIUCrb5qmjunBwiVIeDctX1eV
   Vqyl1XseijDBT7lyXkSbMQQQ8YIISFlEQ+kfOlXoWPhR/Byuz4hedbaIP
   mVKSGlinaYe19fBDsGE2HcPR3fuRlMU9Go9EgzknDKp5T89pWWWz7PDR+
   Q==;
X-CSE-ConnectionGUID: TweronbYRzuoVS1dWumaOQ==
X-CSE-MsgGUID: d1/tV215TqmEvCVSxxurzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="75931894"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="75931894"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 22:12:31 -0700
X-CSE-ConnectionGUID: 4ebhS7d4SWaEseI3auhwWg==
X-CSE-MsgGUID: Tdbn5SdTQV65j80lr5+plQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="143438564"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2025 22:12:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKVZ6-000WLI-0i;
	Thu, 29 May 2025 05:12:28 +0000
Date: Thu, 29 May 2025 13:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: net: dsa: microchip: add bit-banged SMI
 example
Message-ID: <202505291249.oVcy9bFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250528203152.628818-1-corentin.guillevic@smile.fr>
References: <20250528203152.628818-1-corentin.guillevic@smile.fr>
TO: Corentin Guillevic <corentin.guillevic@smile.fr>
TO: Woojung Huh <woojung.huh@microchip.com>
TO: UNGLinuxDriver@microchip.com
TO: Andrew Lunn <andrew@lunn.ch>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Marek Vasut <marex@denx.de>
CC: Corentin Guillevic <corentin.guillevic@smile.fr>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Corentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Corentin-Guillevic/dt-bindings-net-dsa-microchip-add-bit-banged-SMI-example/20250529-043300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250528203152.628818-1-corentin.guillevic%40smile.fr
patch subject: [PATCH] dt-bindings: net: dsa: microchip: add bit-banged SMI example
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arc-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291249.oVcy9bFY-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291249.oVcy9bFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505291249.oVcy9bFY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
