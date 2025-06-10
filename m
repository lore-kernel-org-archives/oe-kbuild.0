Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B729B79C
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560293; cv=none; b=ns6/HwSg1SS4iPCkxw9zDTvCXaHBkTmmcPpRndzWYs3d8eyyKKIrYtTw2QC3hYdaW502M0mRqAseyk+oqgYWFe4GZuDzBSa7v/Rcdg3xr/n0TevR7oHFnzSpubS6ECRvtXbqgx01w6/fyzLlpbrkThbjwMnjxUAdvoXo1fFEJo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560293; c=relaxed/simple;
	bh=MlLRLnmpckLN9f+jzl9zxjB8/2sPLg9dCgvvn5IO8mA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uO+bJ+mOCbXQuyycJW7jikvcX5xVPIMqSUQYD4WCpjfdXsn0bNNxMBEtzJX4rOsXupXoCEUNUy/lswg7RnzCu9NXHkyJcSoA6XDDqKrtLDh1kzkRcW7ILs47QQg/dIlwO12psefmU7JYtG7EBnEW+9qPwDLxMES0iEuCCiF1FAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djZZrAfn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djZZrAfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749560291; x=1781096291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlLRLnmpckLN9f+jzl9zxjB8/2sPLg9dCgvvn5IO8mA=;
  b=djZZrAfnLtfnETiAJ0/9Zd3hla7xYvqoN+GEXJc1Dt0K+o5mgZW6Nxt6
   xQXL/zSnsEMWoKTpRDp3aIHF7UGZgts6sUtidjPYPFRXU0D5zkKYAv6MX
   Ot0RJS+k8lLknWE+4hl3mzju5r5K8XwnGEPd/XCs9v+CjFPgvml8nmrBm
   17tCLP40RRnPLVgR8AvBhYhb+H1QPD0XH38GEtElQmI2P6Q/xBxlTBtAt
   OCUJJH+1iwAPRwnZL4SljeG1GKmel61iR12kanAqQoqI497CzYkkKIqap
   2z7fAdPqO9IO/2AExnM3+u6zTq/27obs3+9sXe+z6ZDGsuRkFCbXyQO4G
   w==;
X-CSE-ConnectionGUID: AaiNo9vxQHi6NE0y6lzIdQ==
X-CSE-MsgGUID: ryN7lxB0TQmD6YHcrwMZww==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51655310"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51655310"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:58:10 -0700
X-CSE-ConnectionGUID: P56WtzSzSNyADyvA6ZddIw==
X-CSE-MsgGUID: NKh5mZU9R1OPoO6Kgv0WMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="184009476"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2025 05:58:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOyYJ-0008Ef-0P;
	Tue, 10 Jun 2025 12:58:07 +0000
Date: Tue, 10 Jun 2025 20:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [net-next v2 1/4] dt-bindings: net: ftgmac100: Add resets
 property
Message-ID: <202506102011.SjfMy9S8-lkp@intel.com>
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
In-Reply-To: <20250610012406.3703769-2-jacky_chou@aspeedtech.com>
References: <20250610012406.3703769-2-jacky_chou@aspeedtech.com>
TO: Jacky Chou <jacky_chou@aspeedtech.com>
TO: netdev@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-clk@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: andrew+netdev@lunn.ch
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: joel@jms.id.au
CC: andrew@codeconstruct.com.au
CC: mturquette@baylibre.com
CC: sboyd@kernel.org
CC: p.zabel@pengutronix.de
CC: BMC-SW@aspeedtech.com

Hi Jacky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-net-ftgmac100-Add-resets-property/20250610-092618
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250610012406.3703769-2-jacky_chou%40aspeedtech.com
patch subject: [net-next v2 1/4] dt-bindings: net: ftgmac100: Add resets property
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: loongarch-randconfig-052-20250610 (https://download.01.org/0day-ci/archive/20250610/202506102011.SjfMy9S8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506102011.SjfMy9S8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506102011.SjfMy9S8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
