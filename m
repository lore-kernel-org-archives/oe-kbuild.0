Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7608822D4C8
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766949480; cv=none; b=mJYou7SziVVsZ2ptounnYEV4zqYIe463pJMxVBf8tPsTWveEF9ZqQGo49PG6XnRldRirBvJpiSByCMG5wNNg9uUOT8M/XV17wh89Tqhm1uXuSvUUJuhg3q8fsZ8gwKYOyBDTAjWhZxe1PHDU2W01pTHmQnfvyJAnaGMuefHlwLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766949480; c=relaxed/simple;
	bh=Gv8LluIaxCQHj45M/lR9Yt2g1oCBrcL2Gz0Ji/lk//I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RoV33BWuCndLB4coztEdCUmtrNUAZhe/HzQxmM4vppY2WB6pfTgnHZFakYoXqH1pFeJl81TfL+SIQWHJSyYCMLZJgTYTG2c1tN4oXBlvO8u+bWR4L8iBilCChBvK5JolBsyWsjkB1iP44JoDbqyeWc0zgAE9ZwNKKw/I6A371xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfT9CNRj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfT9CNRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766949479; x=1798485479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gv8LluIaxCQHj45M/lR9Yt2g1oCBrcL2Gz0Ji/lk//I=;
  b=kfT9CNRjwyDsF1/nucI3FwN9uqGD7W7VL7s5pZvjm+6ZGExrTTRKvCQo
   UBU0viKVFugFEIWN1M2WRELAjxHVXCUsPgqWYQGIp03NHZBrgs3lAq1/Y
   tplqcyZ5fvWeZOHX7w77BzJMJu3d6bV1jum1ZlaLH9zFt8xHzBp+RlCkL
   1deCcAciLepbtg975litA6p/t09LDEheXwBKiBgzazmZCJPiEBqwM50Ci
   wng5rqCn3PmR91B7WArfpThI/WhTo4nUKBy2XCL3zYpZjYU9z4k2nmHyf
   3J5CkIM9bDAwceiGGMzMTzClMrXkXni0rth1O2ZbUcsBJ34KlTHi6zLCy
   g==;
X-CSE-ConnectionGUID: xBSkECZCTh6g8HGUmQwTJg==
X-CSE-MsgGUID: h94Z3KRoTgWMdDhl2dVabQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68475513"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="68475513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:17:58 -0800
X-CSE-ConnectionGUID: WKaLNjmlSESOeGs4M1twGg==
X-CSE-MsgGUID: XV+UbxRVRz2iEUUjvdxjZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="205292614"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 28 Dec 2025 11:17:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZwH4-000000007aC-2GiI;
	Sun, 28 Dec 2025 19:17:54 +0000
Date: Sun, 28 Dec 2025 20:16:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] dt-bindings: net: micrel: Convert to DT schema
Message-ID: <202512282012.vSNErbW6-lkp@intel.com>
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
In-Reply-To: <20251223133446.22401-2-eichest@gmail.com>
References: <20251223133446.22401-2-eichest@gmail.com>
TO: Stefan Eichenberger <eichest@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: eichest@gmail.com
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: horms@kernel.org
CC: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Eichenberger/dt-bindings-net-micrel-Convert-to-DT-schema/20251223-213803
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251223133446.22401-2-eichest%40gmail.com
patch subject: [PATCH v1 1/2] dt-bindings: net: micrel: Convert to DT schema
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-2053-20251224 (https://download.01.org/0day-ci/archive/20251228/202512282012.vSNErbW6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512282012.vSNErbW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512282012.vSNErbW6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7790-lager.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7790-stout.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7790-stout.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7791-porter.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7791-porter.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7793-gose.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7794-alt.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7794-alt.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
--
>> arch/arm/boot/dts/renesas/r8a7794-silk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/renesas/r8a7794-silk.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
