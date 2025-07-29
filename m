Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C64438B
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Jul 2025 17:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753811692; cv=none; b=c0Syv5X1SPaYCrC5FYJzRyELCY/wzF8IHGk1d0MKxb9ylre/borQRqNjRG39JRE9+pawZiMb9bm6Wt40UY9JJAak5k0oyhTXDizBEfJWUnXnq9TwFTSvin0L5Xqk+m9z/zNW9OTXL/f1XRoIPuVy4OQefCxPAUvkCTIhEkhH8zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753811692; c=relaxed/simple;
	bh=20NFHfFV7F4KZp9SnA74s31rz+o1CmFtvuuWNJFSbRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YS3TjPNM6wXOsHp8tcEnuqzwug+XcMZPJkRSm0+0CjykW6GgmKWDfxK4oblL2cuRhOiSoLXzk9XILS2I6+haeDMzJxH8Aq2n8o8JHOp2Mx+XhOBcSPHbkkm2gL+gr8tVCgTtvCgvbnzEwO2fMqs1CE2wbd+auxhWQ7CbNeI+u/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtNaUiHY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtNaUiHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753811690; x=1785347690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20NFHfFV7F4KZp9SnA74s31rz+o1CmFtvuuWNJFSbRQ=;
  b=dtNaUiHYwUf7FziSsXKU6JIykDZviL52iLOY/XJlAmLtHu7jV6dmLHop
   p6r7UNL0vzlGf8Pnvb2n1dxDdGHQZtD1gDEfCzMxcKWP8mqUdx9HDLOV4
   KTBTA9RTJM3gzFxFyn6Pt+mdeztCdmhMTa20fAiRpChZkPJi4pcedU8L7
   cKNFJ+yiZeVTh2srct/4unkN0njGjaI7rGItRNwrL1GPuggFh20nqAKdI
   L0hd7P9m+HWR7/KIt2j808mmz9F1+B2JMGQ0HSTkWUtFcVCEx74NTHVB3
   YaZEMeHsKltmHd5OYEeRxAQVsm8EZ8UqtCvikOqBUa5BnopQqFbHixgYN
   Q==;
X-CSE-ConnectionGUID: GQlBnk2zSDyTJUkz03cqug==
X-CSE-MsgGUID: JrDr5K4CSz2ryux/3cQcFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55796016"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55796016"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 10:54:49 -0700
X-CSE-ConnectionGUID: Q0W/mDiJQb+DgB/N+/Egmg==
X-CSE-MsgGUID: 86DCHZgNTbe+GOaQfiEZUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="199933452"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2025 10:54:49 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugoXG-0001XV-2d;
	Tue, 29 Jul 2025 17:54:46 +0000
Date: Wed, 30 Jul 2025 01:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 dt-bindings]dt-bindings: debix-model-a: Add bindings
 for BT and audio
Message-ID: <202507300128.MGw1d78F-lkp@intel.com>
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
In-Reply-To: <20250729031351.3875406-1-WangErQianY@icloud.com>
References: <20250729031351.3875406-1-WangErQianY@icloud.com>
TO: WangErQian <WangErQianY@icloud.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: devicetree@vger.kernel.org
TO: imx@lists.linux.dev
CC: WangErQian <WangErQianY@icloud.com>
CC: linux-arm-kernel@lists.infradead.org
CC: john@polyhex.net

Hi WangErQian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on broonie-sound/for-next krzk-dt/for-next linus/master v6.16 next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/WangErQian/dt-bindings-debix-model-a-Add-bindings-for-BT-and-audio/20250729-111608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250729031351.3875406-1-WangErQianY%40icloud.com
patch subject: [PATCH v1 dt-bindings]dt-bindings: debix-model-a: Add bindings for BT and audio
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: csky-randconfig-051-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300128.MGw1d78F-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300128.MGw1d78F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507300128.MGw1d78F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: ignoring, error in schema: properties: pinctrl-0: type
   Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: ignoring, error in schema: properties: audio-routing: type

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
