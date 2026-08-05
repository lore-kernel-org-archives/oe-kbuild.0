Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258243DB325
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910941; cv=none; b=fZGjuSp+2fUwaq1j7gy2BFXXItmZIU1H7qgLyYMsEcal/LYz2GsYsllJPMW8Hc9hzUqwl67fLPlJI73HelhXyWa9jXqKyg4mK2kP5p5eR72FVik8BNQL3nEIgYRCWf+DMaF+bE8NTGqdiRTj82eT/xr6onYKZ23WAXwW7u8ZHa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910941; c=relaxed/simple;
	bh=LxDn/QWlBh32ehTk+aqXJRhZ1Odg2pLVHMDXKjiXdb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fuuhw2Q9Atmpxj1+vpCzoOECDRoC36Azt3XtzwDcl0kEtF9uai4PlHYAqb5bI15nvgHuu9p+nKFvIwaFr3Z0Clv38F20NNSxoynnZLXbpLdA1GQDvh1N9UfOl8cGhPImMAjDg1seubTaZJz/amZUi/YzU1+AHx6t4cyjUCsixoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0uR5TcW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0uR5TcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785910937; x=1817446937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LxDn/QWlBh32ehTk+aqXJRhZ1Odg2pLVHMDXKjiXdb0=;
  b=K0uR5TcWtZxIX+RU28DOmGO1Io181bk/IRvbE19mSLdLxmsW90xGxHeT
   CNgDQ66lqZU5XVsLpaqsXo3BJEJ7bGs32gv/7U8hs/43qvLAqGeryhvGt
   dKTlz8nYdYF5SHNvc3kBvl9vK3d38psooz0MhmQdzeuxXoJJ1BpGMCTbc
   tEA10TkQgw3hUYmUh+dxcJWkiJkGuVIo7Ppp+iA2QoZgnRQUItHe9Xe4f
   X5OjdIv1os24+p6NS2wrCe9kf2lBNDrFoni/t0V3f8yMO+LVSTA3+qQe2
   na/JqPQSv75zwGLx/Eav1VTviz1d0ch8Enj/Z0oRBN6VPU+mbKqGDwBfU
   w==;
X-CSE-ConnectionGUID: MiU8VPeNRciEfew0yjMGLA==
X-CSE-MsgGUID: JoYilXX2RXGlVRvLi+kVEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97980966"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="97980966"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 23:22:09 -0700
X-CSE-ConnectionGUID: 04ASPfk2T9WJ4NSZ7gm4Gw==
X-CSE-MsgGUID: 5x0lH8iERVab+Gr4CBYzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="285087517"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Aug 2026 23:21:53 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrV0g-000000004M2-2tMy;
	Wed, 05 Aug 2026 06:21:50 +0000
Date: Wed, 5 Aug 2026 08:21:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties
Message-ID: <202608050835.iNs0S2Cn-lkp@intel.com>
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
In-Reply-To: <20260716212001.989872-1-thierry.reding@kernel.org>
References: <20260716212001.989872-1-thierry.reding@kernel.org>
TO: Thierry Reding <thierry.reding@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Jonathan Hunter <jonathanh@nvidia.com>
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next net-next/main net/main linus/master v7.2-rc6 next-20260804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-net-nvidia-tegra234-mgbe-Add-missing-properties/20260805-011853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260716212001.989872-1-thierry.reding%40kernel.org
patch subject: [PATCH] dt-bindings: net: nvidia,tegra234-mgbe: Add missing properties
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: openrisc-randconfig-2051-20260805 (https://download.01.org/0day-ci/archive/20260805/202608050835.iNs0S2Cn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050835.iNs0S2Cn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608050835.iNs0S2Cn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml: properties:snps,axi-config: 'anyOf' conditional failed, one must be fixed:
   	'description' is a dependency of '$ref'
   	'snps,dwmac.yaml#/properties/snps,axi-config' does not match 'types.yaml#\\/definitions\\/'
   		hint: A vendor property needs a $ref to types.yaml
   	'snps,dwmac.yaml#/properties/snps,axi-config' does not match '^#\\/(definitions|\\$defs)\\/'
   		hint: A vendor property can have a $ref to a a $defs schema
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
