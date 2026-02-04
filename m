Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C038735E
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187863; cv=none; b=Wl1J3CJVQZNwThj69JaD80OkoPcBRZT0UclN+/hYtBh0vPJOZQZyMD/lCfLOz9/z1BK00c5sXp9FoCTLqj338skCHYOMI8maKTv8Ux4H7oVHUTMTNCkXaW5bkZhLomKDPg0xNeiLGuhRZdBkEK8tlZ4sWpR7kEwzY+JDrbyCUEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187863; c=relaxed/simple;
	bh=/kwaVUsVXMvheWVyurvOzWb6h4JRSz/mKIzvtOqxmuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3guHGB7OgpDmdr5BqSdQVvOSr1uWGHIIx6SeOYOp2HxyBVeFnuhOy5YZFpgKwfHE7r/YJ6k3F1/8AkcAbNji2HlwZ1+gPGnvNLdWuHqw+IuhrRSBqUaCcyTivewvuqVt9+6LbmGkpnCq0cNiYItwOppIFR80CR1PxYpzs/Gobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWvO/+jm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWvO/+jm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770187863; x=1801723863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/kwaVUsVXMvheWVyurvOzWb6h4JRSz/mKIzvtOqxmuc=;
  b=fWvO/+jmKZg++aEIDeQkeKs7UH8cr3pyRUDsWDcfgLfq5E846Gjeym1W
   SmDd5cnCxKuqRIrmoUEMFAcARdGDMACk7XHcURqOkMCJaoSSPN6LPNgzJ
   ukRawIZS1TlznSr7RlcMXYT6DkQQXtZUxzO4vf8yqAU7orxgojil2v5DA
   Bpr1p7bZ549lahdaY5/QiaRZs77oO/2kCH3kKv07QmYH/LMYvbzjMGsuq
   0Rkh7R/vz5NlMTQO4VOn1KCEhPD7HVs+jXGsxCRB0UinYDv+wLh7mlFeE
   2yiX9eQore2daEvacp+wPAH1pRBgfF7UqBXdc4dmMoGsG/dHafCdObx85
   A==;
X-CSE-ConnectionGUID: ULeQCyyLQAS1Owj01lgxYg==
X-CSE-MsgGUID: IWR6Hjl8RDil3jdIUOZvfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82737337"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82737337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 22:51:03 -0800
X-CSE-ConnectionGUID: T60Z26JWStK0ngxuvGq3BA==
X-CSE-MsgGUID: +IgUS0mcRrWVceSVltPfPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214619903"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2026 22:51:02 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnWj5-000000003er-1ajs;
	Wed, 04 Feb 2026 06:50:59 +0000
Date: Wed, 4 Feb 2026 07:50:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible
 too long warnings
Message-ID: <202602040724.ZN9CE7KU-lkp@intel.com>
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
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: mips-randconfig-2051-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040724.ZN9CE7KU-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040724.ZN9CE7KU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602040724.ZN9CE7KU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-id0022.1640' was expected
   	'brcm,40nm-ephy' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): Unevaluated properties are not allowed ('max-speed', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: /rdb/ethernet@430000/mdio@e14/ethernet-phy@1: failed to match any schema with compatible: ['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22']
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/brcm/bcm97346dbsmb.dtb: usb@480300 (brcm,bcm7346-ehci): Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
--
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97358svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-id0022.1640' was expected
   	'brcm,40nm-ephy' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/mips/boot/dts/brcm/bcm97358svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): Unevaluated properties are not allowed ('max-speed', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97358svmb.dtb: /rdb/ethernet@430000/mdio@e14/ethernet-phy@1: failed to match any schema with compatible: ['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22']
   arch/mips/boot/dts/brcm/bcm97358svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/brcm/bcm97358svmb.dtb: usb@480300 (brcm,bcm7358-ehci): Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
--
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-id0022.1640' was expected
   	'brcm,40nm-ephy' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/mips/boot/dts/brcm/bcm97360svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): Unevaluated properties are not allowed ('max-speed', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: /rdb/ethernet@430000/mdio@e14/ethernet-phy@1: failed to match any schema with compatible: ['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22']
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/brcm/bcm97360svmb.dtb: usb@480300 (brcm,bcm7360-ehci): Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
--
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-id0022.1640' was expected
   	'brcm,40nm-ephy' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/mips/boot/dts/brcm/bcm97362svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): Unevaluated properties are not allowed ('max-speed', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: /rdb/ethernet@430000/mdio@e14/ethernet-phy@1: failed to match any schema with compatible: ['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22']
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/brcm/bcm97362svmb.dtb: usb@480300 (brcm,bcm7362-ehci): Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
--
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-id0022.1640' was expected
   	'brcm,40nm-ephy' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/mips/boot/dts/brcm/bcm97425svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): Unevaluated properties are not allowed ('max-speed', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: /rdb/ethernet@b80000/mdio@e14/ethernet-phy@1: failed to match any schema with compatible: ['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22']
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/brcm/bcm97425svmb.dtb: usb@480300 (brcm,bcm7425-ehci): Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
--
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-id0022.1640' was expected
   	'brcm,40nm-ephy' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
>> arch/mips/boot/dts/brcm/bcm97435svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): Unevaluated properties are not allowed ('max-speed', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: /rdb/ethernet@b80000/mdio@e14/ethernet-phy@1: failed to match any schema with compatible: ['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22']
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: ethernet-phy@1 (brcm,40nm-ephy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,40nm-ephy', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,40nm-ephy' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/brcm/bcm97435svmb.dtb: usb@480300 (brcm,bcm7435-ehci): Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
--
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10051000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10051000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10052000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10052000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10052000 (ingenic,x1000-i2c): $nodename:0: 'i2c-controller@10052000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: ethernet@134b0000 (ingenic,x1000-mac): 'mdio', 'phy-handle', 'phy-mode', 'snps,reset-active-low', 'snps,reset-delays-us', 'snps,reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ingenic,mac.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: ethernet@134b0000 (ingenic,x1000-mac): compatible: ['ingenic,x1000-mac', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/ingenic,mac.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: ethernet-phy@0 (ethernet-phy-id0007.c0f0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-id0007.c0f0', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-id0007.c0f0' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
--
   	['ingenic,x1830-mmc', 'ingenic,x1000-mmc'] is too long
   	'ingenic,x1830-mmc' is not one of ['ingenic,jz4740-mmc', 'ingenic,jz4725b-mmc', 'ingenic,jz4760-mmc', 'ingenic,jz4775-mmc', 'ingenic,jz4780-mmc', 'ingenic,x1000-mmc']
   	'ingenic,jz4770-mmc' was expected
   	'ingenic,jz4760-mmc' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/ingenic,mmc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /mmc@13460000: failed to match any schema with compatible: ['ingenic,x1830-mmc', 'ingenic,x1000-mmc']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: ethernet@134b0000 (ingenic,x1830-mac): 'mdio', 'phy-handle', 'phy-mode', 'snps,reset-active-low', 'snps,reset-delays-us', 'snps,reset-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ingenic,mac.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: ethernet@134b0000 (ingenic,x1830-mac): compatible: ['ingenic,x1830-mac', 'snps,dwmac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/ingenic,mac.yaml
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: ethernet-phy@0 (ethernet-phy-id0243.0c54): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ethernet-phy-id0243.0c54', 'ethernet-phy-ieee802.3-c22'] is too long
   	'ethernet-phy-id0022.1640' was expected
   	'ethernet-phy-id0243.0c54' is not one of ['ethernet-phy-id0022.1610', 'ethernet-phy-id0022.1611', 'ethernet-phy-id0022.1620', 'ethernet-phy-id0022.1631', 'ethernet-phy-id0022.1640', 'ethernet-phy-id0022.1650', 'ethernet-phy-id0022.1660', 'ethernet-phy-id0022.1670']
   	from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
