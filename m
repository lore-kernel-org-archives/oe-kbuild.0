Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE1B313526
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770197704; cv=none; b=XGpzEcS8H7o/Ch6RC6m9j1dJ3dlqbJ9cZEm6BwHGFmyBB+YS9UJGt+BMHBALWZbSP8dReKSuE5/6V52b1+1wrVQq3UxMVh0JLpUJkUtlN+/vQUHAr7rAfE1nsfcNgmq6vQtkkVLI87m6JiCdkJkCupCg88FHXVI6fM2EU7uvSoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770197704; c=relaxed/simple;
	bh=R3xx93enHOE0ymwrfeDosabcD7Svq/jcnqJWCCp84bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BA2JX4MovZlL7Yhd/2fUgbMTwAgEb/DdWlAwqY2N/79GqdGc5pj2fFFVYUlG+MBJzpvsSczM2hWaZFJkT2EIO8JrizrdFvDGvzXUANLp8hg6QbrOLnwJ9vt4ryTf4BPDWoM6GDF3Gq55vtHJGkGQJ7yPCDxzep5dr0vEnGBkOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m54MS+op; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m54MS+op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770197705; x=1801733705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3xx93enHOE0ymwrfeDosabcD7Svq/jcnqJWCCp84bw=;
  b=m54MS+opoAyOxH91z51vBnqWYmwUwvwkEyFEJtZR4tZW5UvFRcBl60SU
   UshW9yc6clWgatJfUg2Eyjr2HyRKbYgVycg9eFl6WlzvKc57y7rG/YTx9
   sN4JVLWxQJqPfG56tEITCRt6MemNRsoqo/FmYmfPBrPGJYiFc09DzwGfC
   tfQcKRcBjOhPOIaFbtM/s3/Gp+HRZEuJkSQjG8lHJ1k1e5RCpManNsUpy
   Fb/2t8Zlw2EOMiVZEZorVhOejtPdzauXGhH0VZfSWeHyOadRTQFygB+4y
   vlidJ3f1uqs9cEvnMQoLO4/knMbw/Zusb/Rq06a1tuUDrOmlxkhXXev0/
   w==;
X-CSE-ConnectionGUID: CIxz3P7TTQuEL+peSvA6ig==
X-CSE-MsgGUID: eO0izHyeQ/O96zLxHyr+AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75000546"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="75000546"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 01:35:04 -0800
X-CSE-ConnectionGUID: r25+J+dMT7O1KMBTQ9YJKQ==
X-CSE-MsgGUID: gVewnSvRSY+rXX5C3AotZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209727843"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2026 01:35:02 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnZHo-000000003g9-1wIB;
	Wed, 04 Feb 2026 09:35:00 +0000
Date: Wed, 4 Feb 2026 10:34:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible
 too long warnings
Message-ID: <202602041003.axw61K4w-lkp@intel.com>
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
In-Reply-To: <20260203121723.312336-1-biju.das.jz@bp.renesas.com>
References: <20260203121723.312336-1-biju.das.jz@bp.renesas.com>
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
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Stefan Eichenberger <eichest@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: linux-renesas-soc@vger.kernel.org

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/dt-bindings-net-micrel-Fix-dtbs-compatible-too-long-warnings/20260203-202622
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260203121723.312336-1-biju.das.jz%40bp.renesas.com
patch subject: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible too long warnings
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: riscv-randconfig-2051-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041003.axw61K4w-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041003.axw61K4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602041003.axw61K4w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: phy@0 (ethernet-phy-ieee802.3-c22): $nodename:0: 'phy@0' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: phy@0 (ethernet-phy-ieee802.3-c22): $nodename:0: 'phy@0' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: phy@0 (ethernet-phy-ieee802.3-c22): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: phy@0 (ethernet-phy-ieee802.3-c22): $nodename:0: 'phy@0' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dtb: phy@0 (ethernet-phy-ieee802.3-c22): $nodename:0: 'phy@0' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dtb: phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dtb: phy@0 (ethernet-phy-ieee802.3-c22): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dtb: phy@0 (ethernet-phy-ieee802.3-c22): $nodename:0: 'phy@0' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dtb: phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dtb: phy@0 (ethernet-phy-ieee802.3-c22): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
>> arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: phy@0 (ethernet-phy-ieee802.3-c22): $nodename:0: 'phy@0' does not match '^ethernet-phy(@[a-f0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: phy@0 (ethernet-phy-ieee802.3-c22): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-ieee802.3-c22'] is too short
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-ieee802.3-c22' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: phy@0 (ethernet-phy-ieee802.3-c22): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios', 'rx-internal-delay-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
