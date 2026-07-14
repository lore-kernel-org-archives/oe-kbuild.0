Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC62D7DEA
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jul 2026 07:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012992; cv=none; b=Qd1cqynFt5A3h88zJkVCIejw3hb/SjOUXpCRRZdOdygNB9mnnUrJmngBlkiopCPGmwyYtY/r8apcEIZ5Ds9qhyDQuLFCifQS0Kmb3eH3GAxYLgCD/0M3helASYwDt6RF0oQKDBoMmiM1HzNm03VvXDztx763vW8SaXPpQU5CI2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012992; c=relaxed/simple;
	bh=EcYmcj4/MYKJwYUfFlNLjrOaauNaCM2yoym48C0WfZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YleRQImYgpCHiQRNlJNdxuiugQ7scZMb/alzqv7r2uBND5cUNcAynnvMumiJsHypHjz6L42eDqvLhEEd4qZt4f8vmE8s+XuTwvf8feTauww6cCm2+j8Nt+CZBCVf+oRrf24rVhR8I6RrssDtDHENhNnim6zlCSlAp1RRD3Fau/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHuNpBRD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHuNpBRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784012990; x=1815548990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EcYmcj4/MYKJwYUfFlNLjrOaauNaCM2yoym48C0WfZI=;
  b=UHuNpBRDFTxSNHtj/hEmMHbpQRrJf3NsEJEQz0/jLE+r0GNEB4w2SanE
   BSqqucfBWNeCmMOaUxJhsn8bQp1n3EAV86SUafZ79n34ZONIu16NVM2Nq
   iwnVGlEsqsA8kAi1CeDaLmEmJScfQfkObj5oLQZhwbZwnCcFT4dKKz2uM
   t2Ax4UsOCut1fA12eJGhyXif8zTmJVVmlHmz9Uj2cfoeemHHv6sQRhDmh
   n9Tn5E5tbL/3BDfv/B69pFa8XQzvsVrrA0IbhFd15113z+eS9f1UKwBFS
   KmGvAZrpemMUicIXAU8gcSZr/QYfDhugaxw7LNfU8AJDKsr+cO/tBDCK8
   w==;
X-CSE-ConnectionGUID: 7tu6Zc2/S2qSkJMMO5M0Gw==
X-CSE-MsgGUID: xW+NXb8gT7SlL0p47FIdqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84509077"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84509077"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 00:09:49 -0700
X-CSE-ConnectionGUID: u6vbhz2VRqy704Z3YonRUw==
X-CSE-MsgGUID: 6yDCNylfR46v8QRl+u/iPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="255275584"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Jul 2026 00:09:49 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjXH0-000000003ur-1ZZw;
	Tue, 14 Jul 2026 07:09:46 +0000
Date: Tue, 14 Jul 2026 09:09:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 2/2] net: phy: add DAPU Telecom DAP8210R(I)
 Gigabit Ethernet PHY driver
Message-ID: <202607140952.KecC8HjW-lkp@intel.com>
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
In-Reply-To: <20260713131223.279555-3-a.shimko.dev@gmail.com>
References: <20260713131223.279555-3-a.shimko.dev@gmail.com>
TO: Artem Shimko <a.shimko.dev@gmail.com>
TO: netdev@vger.kernel.org
TO: Andrew Lunn <andrew@lunn.ch>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Russell King <linux@armlinux.org.uk>
TO: "David S . Miller" <davem@davemloft.net>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Artem Shimko <a.shimko.dev@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Artem,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Shimko/dt-bindings-net-add-DAPU-Telecom-DAP8211R-I-PHY-binding/20260713-212130
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260713131223.279555-3-a.shimko.dev%40gmail.com
patch subject: [PATCH net-next 2/2] net: phy: add DAPU Telecom DAP8210R(I) Gigabit Ethernet PHY driver
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: microblaze-randconfig-2051-20260714 (https://download.01.org/0day-ci/archive/20260714/202607140952.KecC8HjW-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140952.KecC8HjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607140952.KecC8HjW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/dapu,dap8211r.yaml:78:7: [error] no new line character at the end of file (new-line-at-end-of-file)

vim +78 Documentation/devicetree/bindings/net/dapu,dap8211r.yaml

740c090ecf2e15 Artem Shimko 2026-07-13  64  
740c090ecf2e15 Artem Shimko 2026-07-13  65  examples:
740c090ecf2e15 Artem Shimko 2026-07-13  66    - |
740c090ecf2e15 Artem Shimko 2026-07-13  67      mdio {
740c090ecf2e15 Artem Shimko 2026-07-13  68          #address-cells = <1>;
740c090ecf2e15 Artem Shimko 2026-07-13  69          #size-cells = <0>;
740c090ecf2e15 Artem Shimko 2026-07-13  70  
740c090ecf2e15 Artem Shimko 2026-07-13  71          ethernet-phy@1 {
740c090ecf2e15 Artem Shimko 2026-07-13  72              compatible = "ethernet-phy-ieee802.3-c22";
740c090ecf2e15 Artem Shimko 2026-07-13  73              reg = <1>;
740c090ecf2e15 Artem Shimko 2026-07-13  74              rx-internal-delay-ps = <1050>;
740c090ecf2e15 Artem Shimko 2026-07-13  75              tx-internal-delay-ps = <1150>;
740c090ecf2e15 Artem Shimko 2026-07-13  76              tx-inverted-clk;
740c090ecf2e15 Artem Shimko 2026-07-13  77          };
740c090ecf2e15 Artem Shimko 2026-07-13 @78      };

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
