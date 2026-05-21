Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA41360ECC
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 18:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779389052; cv=none; b=lQDonXg0uT3MxP1NTWSsTtDptcrmiBIpVfbbAFPb/T3GDa+QFXJ69h8/Z5W1TyoJRaTDP36ABIjkji5sXo33B0lzDmefCLN01pywTr/axGxvz+p55tJNmajMPZjcANdxI/9jy42wmoHom2xyB4/4lGZ0b1uZzoKWPFYP5uWcXg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779389052; c=relaxed/simple;
	bh=koNhtyjc41ru2dGe81lGqnjiZBQAWj1xetLN7UVEpz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=brlUg2obyUtsAsDq58Rbr5qjPb9jRAOFTkmC/aelkd0V/n1vOyixg0r2zOUvMSLVueuelg6BEEiMrELbSXnLFuyNmQEC8Pm7cawt/JvpYzNHaTG08WwUnDp8Ft2jJ9XexiyH6tG0+QZ1bLVUTURZmjyVMkot8iYwCPESYoe1EMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zno1AIO1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zno1AIO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779389051; x=1810925051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=koNhtyjc41ru2dGe81lGqnjiZBQAWj1xetLN7UVEpz0=;
  b=Zno1AIO1nBJksXUdP1sEW8C758Cepe4Msq8T1O+bLwCKAsRkRIaXqlCr
   euB4IMZZ6AgOGgTYLSrL8wiM2Rtz0W3imn1jloTV2R4EPA/GJt0UofKL8
   QvXhsSWN7rjqMD4GXCzZjACGBQ5DHNQpQDmmOL1gAin1vns53aI3iV9zj
   zsMWIOUUCMJjTfOgxUgnSLn8XHA4EYtXAGV1hmM7i7HqoTWrg3JyVnu5U
   +tAf8zGsif3JTmshSqoyjuHTVtIPDFL8WSV3qs9WhrhSi0FtUnYsdiw11
   wm7Pi84DigVDshrdwYFZDFwfHxN9bH3RRmhYy/w6Uhs7wGt5SIUFj7ce4
   w==;
X-CSE-ConnectionGUID: Q46epGvET1Sm+movir+aEQ==
X-CSE-MsgGUID: 309hUshWRMaEg0AaS1hkkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80217029"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="80217029"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 11:44:10 -0700
X-CSE-ConnectionGUID: /JDTt5m2QTKUUywYu9qjNw==
X-CSE-MsgGUID: G78hZKhCTkuUNs1TZ3DX0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="234267446"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2026 11:44:09 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ8NL-00000000B33-0JLM;
	Thu, 21 May 2026 18:44:07 +0000
Date: Thu, 21 May 2026 20:43:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v4 6/6] net: phy: air_an8801: ensure maximum
 available speed link use
Message-ID: <202605212011.mWCMIBod-lkp@intel.com>
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
In-Reply-To: <20260521-add-airoha-an8801-support-v4-6-1e4837d30ef4@collabora.com>
References: <20260521-add-airoha-an8801-support-v4-6-1e4837d30ef4@collabora.com>
TO: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Heiner Kallweit <hkallweit1@gmail.com>
TO: Russell King <linux@armlinux.org.uk>
CC: kevin-kw.huang@airoha.com
CC: macpaul.lin@mediatek.com
CC: matthias.bgg@gmail.com
CC: kernel@collabora.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 830d8771ae3c7bc90a62dde76a6556e612529fbc]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Alexis-Eyraud/dt-bindings-net-Add-support-for-Airoha-AN8801R-GbE-PHY/20260521-163105
base:   830d8771ae3c7bc90a62dde76a6556e612529fbc
patch link:    https://lore.kernel.org/r/20260521-add-airoha-an8801-support-v4-6-1e4837d30ef4%40collabora.com
patch subject: [PATCH net-next v4 6/6] net: phy: air_an8801: ensure maximum available speed link use
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: openrisc-randconfig-2052-20260521 (https://download.01.org/0day-ci/archive/20260521/202605212011.mWCMIBod-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212011.mWCMIBod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605212011.mWCMIBod-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml: properties:extcon:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/net/airoha,an8801.yaml: ^led@[0-2]$: Missing additionalProperties/unevaluatedProperties constraint
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
