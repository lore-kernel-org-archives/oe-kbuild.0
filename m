Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5FB313264
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Oct 2025 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698762; cv=none; b=S6aAcuw5BmzmHzx1srAh1YAHXCdJAjMJW6dkK6kw9U7TdiGImtb/o3LwloGyWTwlG5KqfMUUFvoCgNX6pP8JX1AwOpa4eHReW3S0JD3jxpxo554IT0Jq+RHMcY24KZIxJR/U3zI03BfXnhYtqFEh7tNNY+4dNgg8gzBdY9uV8kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698762; c=relaxed/simple;
	bh=7PvgO4h8cDI8PbparzATfrI9LsblU7OXsTmuSXo9DU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kE2trhUXc8FhBPFke4DHkMg2bCwj9zy1D6nMYtUTTeFJ5CRyNgJNKPfAFlaIIb22kGKeTZ8b0a7x4bAjXq8pwZuBYWm8YumnAdCiU0CWVUTcVfotOYCy2HPX3nrainjEJNgZUbvMv+7YORd1XNbe+2pu3Dcqv8Ffe7fAnrsXOzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qqyo/W3D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qqyo/W3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760698761; x=1792234761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7PvgO4h8cDI8PbparzATfrI9LsblU7OXsTmuSXo9DU0=;
  b=Qqyo/W3DfZ5wcNoic7LB/uljYOMkgeBSqewMhQ22g8bA6xOU8bEqXRsF
   k+Zijpsevo6SH7w+GeBg+I/6K2CKhwRcoTgG4yQL0k+SnKXHLePFUcH/y
   wiTKTMSaxHzL8xjaVQhRKTLlFWgVix69Q44O9V03FlOa5x2ImZ8Trj1cx
   NK/jYbFsvFviAnQ2kv+hLtxNGC45EARTfqQzHy9sFTf2788juXHemBlpd
   e8UHzHLlxKbIVjnRtQkj7Kj6NxWBS3u9za+eh75M7j8ZipPmbN5RNbE6J
   T1Lm8sY6cY+W+d2u2BNlX4Qf8N7nqtSjWjwK27PVpFWvhmR+1CDvZLYBs
   Q==;
X-CSE-ConnectionGUID: bQN4fX97QYirs/FLxLs8Sw==
X-CSE-MsgGUID: vTA4Ky7iQUKiZLSVUkUSLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80352037"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="80352037"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 03:59:21 -0700
X-CSE-ConnectionGUID: Eg2kjtY8SamjeYLJiGKqFg==
X-CSE-MsgGUID: xyIpnCW0SwmZnRkl0ZM7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="182391034"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2025 03:59:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9iB3-0005tD-0m;
	Fri, 17 Oct 2025 10:59:17 +0000
Date: Fri, 17 Oct 2025 18:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 8/8] arm64: dts: imx94: add basic NETC nodes and
 properties
Message-ID: <202510171806.ddpVZ3bo-lkp@intel.com>
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
In-Reply-To: <20251016102020.3218579-9-wei.fang@nxp.com>
References: <20251016102020.3218579-9-wei.fang@nxp.com>
TO: Wei Fang <wei.fang@nxp.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: claudiu.manoil@nxp.com
TO: vladimir.oltean@nxp.com
TO: xiaoning.wang@nxp.com
TO: Frank.Li@nxp.com
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: richardcochran@gmail.com
CC: imx@lists.linux.dev
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Fang/dt-bindings-net-netc-blk-ctrl-add-compatible-string-for-i-MX94-platforms/20251016-185612
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251016102020.3218579-9-wei.fang%40nxp.com
patch subject: [PATCH 8/8] arm64: dts: imx94: add basic NETC nodes and properties
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171806.ddpVZ3bo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171806.ddpVZ3bo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510171806.ddpVZ3bo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx943-evk.dtb: system-controller@4ceb0000 (nxp,imx94-netc-blk-ctrl): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
