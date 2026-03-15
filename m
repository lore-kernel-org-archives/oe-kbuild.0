Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A6540DFAD
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773589420; cv=none; b=Ld9GuFws84wvWTbLhit0IAtKVym8mi3jVFNI/uWBwRIHBgUw+26YbCG9SmQioEy2eMrM0YTGGZW/LE47WA1GtM5fpQdAGPAMv1LwkxY5H+9Wpsxl6JEYUrHs9dYbTOgFBm/Mq+Kvy0AMdqrr3VVR5uocKUa5yYurlJ/FycCsmFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773589420; c=relaxed/simple;
	bh=PN1XtF5j4uOtgDbPRrgyaveUQFnCFTL/wGvD4Fjzvko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hONxDkJSRbo28IX81RyL4/o1NKQnh132kPVGqGJqdd3T3q++r29ueX6JztjL/C0Pm2kHUQEMjIR29gdeoMMGhIbN1kVKoJXRtQm8qDDOjVbN/r20NrpwbfA781tWHF4vq1+Qj9TW89CC6h2izltECX8T7awm/8lbestNcRV5r7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMcnup+1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMcnup+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773589418; x=1805125418;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PN1XtF5j4uOtgDbPRrgyaveUQFnCFTL/wGvD4Fjzvko=;
  b=OMcnup+1A15co1DzRdgnQYyXENYhzs6gUhSW1Z7URUbsq2r2I9X5vFnX
   /1J7h6d5G+xDpt5jyK0HOWv5aG4O02p0FZ1nm+u3A5QCTuhj2svBzEjvT
   2G5J4QlsgfxGQYTyifkkyo3IVgKY9+6xRl2Dm4mAB4LWXXiHgWa+vAZHM
   ivl9c3kXVZhgKBDE5sRiMY6/13yboKZ6sxSL+V6OdaoRp4fWLAbkUrVtr
   0RmkE5h+doIk/bh5E4qfV04y03FZdbf7auuX1CW5OCW11Tckby2B8aZy5
   UkYPUUwv2YIMAaKQEd3W4yOnjMXW2k2mrSV9eicEBc6zJRxS4KIF0f2Cd
   A==;
X-CSE-ConnectionGUID: 8qmRmU+URLCnOazj7Sn8kg==
X-CSE-MsgGUID: 7+efYJNtRSinN61Mpn8JSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74538582"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="74538582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 08:43:37 -0700
X-CSE-ConnectionGUID: OSqBKyw1QQSXecZGuR/bnQ==
X-CSE-MsgGUID: ud1/IJoaT/WYvKaw2PzfRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="223946822"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 15 Mar 2026 08:43:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1ncs-0000000044v-12oC;
	Sun, 15 Mar 2026 15:43:34 +0000
Date: Sun, 15 Mar 2026 16:43:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next] dt-bindings: net: Remove redundant
 ethernet-phy-ieee802.3-c22 fallback
Message-ID: <202603151613.OgnQNFgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260313130623.297712-1-biju.das.jz@bp.renesas.com>
References: <20260313130623.297712-1-biju.das.jz@bp.renesas.com>
TO: Biju <biju.das.au@gmail.com>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Russell King <linux@armlinux.org.uk>
CC: Paul Barker <paul@pbarker.dev>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/dt-bindings-net-Remove-redundant-ethernet-phy-ieee802-3-c22-fallback/20260315-110627
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260313130623.297712-1-biju.das.jz%40bp.renesas.com
patch subject: [PATCH net-next] dt-bindings: net: Remove redundant ethernet-phy-ieee802.3-c22 fallback
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-2051-20260315 (https://download.01.org/0day-ci/archive/20260315/202603151613.OgnQNFgJ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603151613.OgnQNFgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603151613.OgnQNFgJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): Unevaluated properties are not allowed ('interrupts-extended', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: ethernet-phy@7 (ethernet-phy-id0022.1640): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
