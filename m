Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C713396560
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 21:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779138007; cv=none; b=op2zr5ZCTCtiFspbk3Pcb/Dg+tideJ801AoDvxw2xIKz87tfPS9KjAuXQUY6M6DAgiuVZNf1G+pWEyKre9x+F7RSmTYSWS4Y+by8NCO1xFJdoATY69Z15K8vhlMaH4JKwIuc0DzePHBbwbpkdnm8EnoKP7eBdHplU7GL9K19N4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779138007; c=relaxed/simple;
	bh=AvYeNyOpcJ7IhO8zd7XhlxuQpapYSz2L68fa3lfBKfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHbW4xL8jm0dz9EVFXL+NTtLw/iqeGP+/Yt6NyKngvW5uJMfT4pXdHyRJLPhVGbaTRlcD6FFmDmQZ+y2JqKLJ8iS62+jM5KB9PJMBXDkjZXD0WPMiOerpiAWctPnBUyAR2wO3t/Qt32Lcs2BQ4iaXYe28w5gHFe/xZd8o1dLVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbK28lyj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbK28lyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779138005; x=1810674005;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AvYeNyOpcJ7IhO8zd7XhlxuQpapYSz2L68fa3lfBKfU=;
  b=nbK28lyj1zRMPlRMzvG8q6r98AaCPF+UsaSQyx/qIyFrJAA81UkN0T02
   NTKG8TTTWz0x2bmMh2NSO/KPpdrEgmj8QvkSmjoukJqX9+rRJTu4x2lfM
   goyzrX2xz0e5KRDqQJdMzx8PVtfr9wX61m0Fxj8syy8ZN5oXif51qKn3G
   eGKaJkUpe1E5H0pKr5hx0EjXp5dZffyvNVuoXz0RrARONNZQ/t5/Lu1uI
   PRscYjsXtTaDA0upFvuZHQN1GY4jBFhc3C0bwTSfE8PijcsTDroF0ohSO
   vYWcwTKRVIfciuouOS89RBJJYKp96VnG8YPJGcxxeZmy683nNYo9VJXyR
   w==;
X-CSE-ConnectionGUID: F3uEAxReTFWtLPln/Ef69Q==
X-CSE-MsgGUID: eWtTN9o/RtaV5RV0d+4mrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91396969"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="91396969"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:00:04 -0700
X-CSE-ConnectionGUID: 88dxP/XPQDOHu+Iozg0tjA==
X-CSE-MsgGUID: /GaTvFVBQyiT0VpeWe087A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="233168797"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 18 May 2026 14:00:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP54D-000000009vt-0Zcs;
	Mon, 18 May 2026 21:00:01 +0000
Date: Mon, 18 May 2026 22:59:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] iio: adc: Add StarFive SAR-ADC driver
Message-ID: <202605182259.SbTgaR7d-lkp@intel.com>
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
In-Reply-To: <20260518081852.116909-3-xingyu.wu@starfivetech.com>
References: <20260518081852.116909-3-xingyu.wu@starfivetech.com>
TO: Xingyu Wu <xingyu.wu@starfivetech.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Xingyu Wu <xingyu.wu@starfivetech.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-iio@vger.kernel.org

Hi Xingyu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v7.1-rc4 next-20260518]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xingyu-Wu/bindings-iio-adc-Add-StarFive-JHB100-SARADC/20260518-162705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260518081852.116909-3-xingyu.wu%40starfivetech.com
patch subject: [PATCH v1 2/2] iio: adc: Add StarFive SAR-ADC driver
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arc-randconfig-2051-20260518 (https://download.01.org/0day-ci/archive/20260518/202605182259.SbTgaR7d-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605182259.SbTgaR7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605182259.SbTgaR7d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/iio/adc/starfive,jhb100-saradc.yaml: properties:reg: 'anyOf' conditional failed, one must be fixed:
   	'maxItem' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
   	'type' was expected
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/iio/adc/starfive,jhb100-saradc.yaml: properties:reg: 'anyOf' conditional failed, one must be fixed:
   	'maxItems' is a required property
   		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   	'maxItem' is not one of ['maxItems', 'description', 'deprecated']
   		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   	Additional properties are not allowed ('maxItem' was unexpected)
   		hint: Arrays must be described with a combination of minItems/maxItems/items
   	'maxItem' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
   	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
