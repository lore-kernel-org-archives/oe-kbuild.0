Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1C439EF27
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jul 2026 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153834; cv=none; b=qszTYn1kMWezcOvg6sJnWnGGGRPjaEZkI+fZa3hE0V1N9u8iP9tE55patoaKe4dCHc8pLpgj7R05M0WOl75DxtOXWRUXcQCW8u7xHvTfpUj9uc2DzdtZi46yQIUlHXIMOB1q7eQcAV7nhWDgpaQz72uYQi5Y+/3sRbhh8dwMiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153834; c=relaxed/simple;
	bh=nsPPxwWnZZ5K0VBmZYGp8Yp+mnPIsTLX4/tmKDSSpK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kO/riIlJ4ZxRRVwX8lQ67Aua92K16zJbDSIOkPDspIkTDoYe3Hct1+qGP5VHIzVR170ikXqFjIpED/Lg2WFpcyoAzX/e7kDTifEdBFbLyVQSeaxx7MWZuNi2Uob+37Yz5mkZrrBhGcXbh/Ixi9kcg2+sIyb2ZcDZ8gbpLK3l/HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqqBVPVc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqqBVPVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783153829; x=1814689829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nsPPxwWnZZ5K0VBmZYGp8Yp+mnPIsTLX4/tmKDSSpK8=;
  b=UqqBVPVcOxS/q8Cf2WAgfjwLWk2p/ym5azNBtB/JnQf2kSxoq+Sn5cJv
   O/zKl3f/F6+rkQWs2Qy2X0LMNp6IqWTKbaspgh+hJRxvfnW/3oSZ9QPD0
   8aCeN17UO634+SAnVQaGJAc36pISStCjkFlfCNX7f1T+cqKUXasDwiUxM
   exBEhETVxgU2unecEroQvL7n1+QIOMZPQjiJcQHrwdZIIQ9wLjiM3xtfN
   1tjlq5JcwsgbTb2PQKhmohM2MCfnkBoATJ37g7Os6CNA7WHNBLf4p4jvP
   KK70D+A8pbDDqIs+B6yd9mewETv9Tkjq/HNLSsj3NR0nxiSHwPokAOWPa
   w==;
X-CSE-ConnectionGUID: lR/C3viqQMqAsYUijJ3ItQ==
X-CSE-MsgGUID: W20WdY+nQcG3me5/cxO3lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83857651"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83857651"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 01:30:27 -0700
X-CSE-ConnectionGUID: jRrCRIL/TdC4/1epav+lFw==
X-CSE-MsgGUID: tbFaEdWKR5+kWXO772c38w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="246889762"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jul 2026 01:30:26 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfvlX-000000001iX-3mus;
	Sat, 04 Jul 2026 08:30:23 +0000
Date: Sat, 4 Jul 2026 10:30:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 36/36] phy: rockchip: usbdp: Add USB-C state without
 DP enabled
Message-ID: <202607041027.Yp2GIHYQ-lkp@intel.com>
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
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-36-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-36-a392711ca8a9@collabora.com>
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Frank Wang <frank.wang@rock-chips.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: Andy Yan <andy.yan@rock-chips.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Yubing Zhang <yubing.zhang@rock-chips.com>
CC: Alexey Charkov <alchark@flipper.net>
CC: linux-phy@lists.infradead.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: kernel@collabora.com
CC: devicetree@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/dt-bindings-phy-rockchip-usbdp-add-improved-ports-scheme/20260704-074013
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260703-rockchip-usbdp-cleanup-v10-36-a392711ca8a9%40collabora.com
patch subject: [PATCH v10 36/36] phy: rockchip: usbdp: Add USB-C state without DP enabled
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arc-randconfig-2052-20260704 (https://download.01.org/0day-ci/archive/20260704/202607041027.Yp2GIHYQ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041027.Yp2GIHYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607041027.Yp2GIHYQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml: properties:port: 'anyOf' conditional failed, one must be fixed:
   	'depreated' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
   	'type' was expected
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
