Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94DF2566F7
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 21:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756589989; cv=none; b=cZcJf9dhpwTGWpH5DHyk3ubCYF26/XmSCdxl6rgpJIKv6W9u526HzQ3J19RaG1vaoMqccF/cZAY3gI8+YndodLT/oTLV3gwIP9v1+/bTgUvnvm7s6hhN+ZTzdE5o5cWF5i7ufbtTE/jN2cW6ppkfzlbq3TN80khuvx4uHXsYmGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756589989; c=relaxed/simple;
	bh=1UAd8IE18AJnZF4ajnu2zvqFLlux4TJ+YS3qR1SLG8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWyjtTOr/I81rFiseqF/LBw5hO/Ou2yc0LhlAcDuAd6DHZsnQf5JIUnyiQnQChD3CPkYcELZl5lnL7AcoBTduyXzj4jGsFvflnIJtSv7Uf5986DUd2jazJpYoo9AuetGwTRLD94XRHRlhrXERwQnh5SpOUJjTdbp+H29g/SA0kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bon/xXTC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bon/xXTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756589987; x=1788125987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1UAd8IE18AJnZF4ajnu2zvqFLlux4TJ+YS3qR1SLG8k=;
  b=bon/xXTCSJfaOXyyxrfObFnyG1ZhUXTpfSaYu6SIBz4uwnruQTTlhgqE
   yFxecXg8cpDbnYRDumAZtTmI7MjJWGdA6OQfqWqfJQ0VEl/Y6KHlvy34q
   O+/TrXB/lHgKKvqiZ8xYlTczqvQ0HwXcsr7Ywxy3rsOmrSPDBbNgf8x9f
   R7u+3SkQ+wj0Zi9GG+fs5eUZKcC5hyi+4DKdV/xyEu0urPDW4mg7Ez4eU
   taHVb9TY6NTccNKOrB2Ul3xXt1NSgpogCoLj8YBpLBP/fFwSukmDUm0N9
   zlbiqqq0AKgXHmtNR+V1KZSGgxDJX68lU6c00EbBwX3/Z63Al5u1xxLrm
   A==;
X-CSE-ConnectionGUID: 5TxMi53vTKO86CUlOosMHg==
X-CSE-MsgGUID: K7OWLYjiQoO69rIHOYrEgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81429894"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81429894"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 14:39:45 -0700
X-CSE-ConnectionGUID: cbdMk+jnR/W8C3I/J29w1g==
X-CSE-MsgGUID: TasvZ2WtRxSGCKqkXQhHLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194314264"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2025 14:39:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usTHr-000ViB-26;
	Sat, 30 Aug 2025 21:39:21 +0000
Date: Sun, 31 Aug 2025 05:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 10/13]
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105000c0
 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202508310525.l6hwWEGl-lkp@intel.com>
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
TO: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Sam Protsenko <semen.protsenko@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   a874b387213bd80b1288884aeb427cb7599eb5ea
commit: 1bc8f09ce98ca8a56f2059c9a8fe26cc351318f0 [10/13] arm64: dts: exynos2200: define all usi nodes
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-051-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310525.l6hwWEGl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310525.l6hwWEGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508310525.l6hwWEGl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105000c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@105000c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@105100c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@105100c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109000c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@109000c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109100c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@109100c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109200c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@109200c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109300c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@109300c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109400c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@109400c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109500c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@109500c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109600c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@109600c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@109700c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@109700c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d000c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d000c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d100c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d100c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d200c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d200c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d300c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d300c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d400c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d400c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d500c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d500c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d600c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d600c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d700c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d700c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d800c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d800c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11d900c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11d900c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11da00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11da00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11db00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11db00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11dd00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11dd00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@11de00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@11de00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f000c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f000c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f100c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f100c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f200c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f200c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f300c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f300c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f400c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f400c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f500c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f500c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f600c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f600c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f700c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f700c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f800c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f800c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14f900c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14f900c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fa00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14fa00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fb00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14fb00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fc00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14fc00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fd00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14fd00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: usi@14fe00c0 (samsung,exynos2200-usi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,exynos2200-usi', 'samsung,exynos850-usi'] is too long
   	'samsung,exynos2200-usi' is not one of ['google,gs101-usi', 'samsung,exynosautov9-usi', 'samsung,exynosautov920-usi']
   	'samsung,exynos2200-usi' is not one of ['samsung,exynos850-usi', 'samsung,exynos8895-usi']
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc@0/usi@14fe00c0: failed to match any schema with compatible: ['samsung,exynos2200-usi', 'samsung,exynos850-usi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
