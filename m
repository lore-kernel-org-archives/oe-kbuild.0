Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024DA932
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774095097; cv=none; b=tVFbFaAdSvxWyOGJJSdNhrODRmaiy10GhY+B/d8c2pNBRuyzHuvQit6hlhagIdQu53+0wYhAwjp9kZ91EHTUrOWEvrZZgH93nw+mzKqRCIB472i9GquCcf9LUjaq6QjQIapsw5Ka9T9Qsp63vj8GIrUrrojzuf/pSRg57UHd45A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774095097; c=relaxed/simple;
	bh=M6U15XPUv/EBfiAv1Kus03ENwNnZCbf0SW9Rx9bWEL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BFsPN+BsxVSV2GhVAoUpc0BKHbUKwG298fNSdy6ANAuYAads3W3Klvjm8xMs+rItooDLLU/A1ezMiQYNX8qMAGf9pYeq1Z8RPWFp3GBl7TbJDhXrbFnBXBKcCFY7USN9vjiWgEsXqplWxJNKbYEwWpeDwPxK+q+/TbIDVUnmcKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkrILrhK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkrILrhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774095095; x=1805631095;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M6U15XPUv/EBfiAv1Kus03ENwNnZCbf0SW9Rx9bWEL4=;
  b=BkrILrhKFtzfxwVjeX0FPPMo3VT2HxQ+oPJU3Siztq1o0c2Dqc+92rst
   ajXvsrCwuP6b9kr2gYV8RHlH0v+Exz1o234Dh5D9YqW64uTct0q4R3UIn
   7ptddRZbhdBtUc6JSKlsfxRVKm5aODlEK1SxIvsaukqpstbF+DjGC+Gd0
   VbFrozW5ixJEW3NBPyNDi5oOimSFIhyV13c9/3be0aEJR2hbEfbjlvFwE
   1GGNXucKSQu3/yfpkZAduEQet5F9XOn/5Sb2KBX9GvTsyJ2poAUtqEYt2
   SHT4T+u47T5wDrJAEgDDzZh2srbQATQn7vXYxJFlFlxd6lEw1wMsXhdfu
   Q==;
X-CSE-ConnectionGUID: EMdb8EvETSKLEDBawB46fQ==
X-CSE-MsgGUID: S0O4xj0QThez+kfWmwQ90Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74875571"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="74875571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 05:11:35 -0700
X-CSE-ConnectionGUID: pLTjMJV5TMu9fEB0V67Iqw==
X-CSE-MsgGUID: koqge2xIRkO/Ku5wgdGx3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="222783537"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 21 Mar 2026 05:11:34 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3vAx-0000000066r-0Z0d;
	Sat, 21 Mar 2026 12:11:31 +0000
Date: Sat, 21 Mar 2026 13:11:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/4] dt-bindings: iio: adc: add AD4691 family
Message-ID: <202603211345.hJIly0Jr-lkp@intel.com>
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
In-Reply-To: <20260320-ad4692-multichannel-sar-adc-driver-v4-1-052c1050507a@analog.com>
References: <20260320-ad4692-multichannel-sar-adc-driver-v4-1-052c1050507a@analog.com>
TO: Radu Sabau via B4 Relay <devnull+radu.sabau.analog.com@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Michael Hennerich <Michael.Hennerich@analog.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Uwe Kleine-König" <ukleinek@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Linus Walleij <linusw@kernel.org>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: Radu Sabau <radu.sabau@analog.com>

Hi Radu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Radu-Sabau-via-B4-Relay/dt-bindings-iio-adc-add-AD4691-family/20260321-120718
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260320-ad4692-multichannel-sar-adc-driver-v4-1-052c1050507a%40analog.com
patch subject: [PATCH v4 1/4] dt-bindings: iio: adc: add AD4691 family
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: openrisc-randconfig-2051-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211345.hJIly0Jr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211345.hJIly0Jr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603211345.hJIly0Jr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml: properties:interrupt-names: {'description': 'Names of the interrupt lines, matching the GP pin names.', 'minItems': 1, 'maxItems': 4, 'items': [{'const': 'gp0'}, {'const': 'gp1'}, {'const': 'gp2'}, {'const': 'gp3'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
