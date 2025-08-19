Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7691FC0E2
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755639713; cv=none; b=BKsFbgJ1rutLGvJLVbUQE/Wew41kEFDq48lNPbMTy/I5FkwfAB6dXKzV9iTOE1f5S6Mn+VDXG7WRONBOB4Z0Y33HNdcuHjAFghglJv975IrAvs2m/q771vZHBb7P+qIRsHuTi85E3dQzZZhXQWKg/4qpgXYNuPFeIiGZ5VBOzXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755639713; c=relaxed/simple;
	bh=HVfSelDu8SjhQFcH9qFaxevoV9CD1+Rh2S7TbRuTXBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WN5a5maYLSQQb5ew5GAOWUML5kT8RtBfA9VAItDr7q0Z/FoWC5Exc5ufHJYrco4Vh8pTQqKCio4YooZfl48OJBfKQu7MkYgUy3Z/UbVfWsakcjHYD7PPCSPx6PVxtxvVqC7hdcKQtsNEXPA9s0J8sHopKDYyKUnAyJNUnuY9xR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYOk7Z5Y; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYOk7Z5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755639712; x=1787175712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HVfSelDu8SjhQFcH9qFaxevoV9CD1+Rh2S7TbRuTXBc=;
  b=mYOk7Z5YYJYZSLVckgKFxbqmYlfxTns/1ogs0+M2ow60J0JW/pumpBs4
   ZNIpXl9W19aKXR1pDcoPb2KwC0LOLwsbGkzX3FlRejQU2ES5sdI40GUoF
   8VX6ytPC4o6KU03+p1Hw8J8nYWDBp40u8DdiXoPfvlVQERusD2U62UApl
   NgGyIInifR1LDJrfOVnk5ZZ7+vpplKV5YtE7yEp/czMPwGMtvgB11fjOV
   MNqAgws8rAq8uEheG3u1a/F+vGQfPWfe0R0Dp6s0Ht5NZf79cPihyly7d
   V7ULrxdY7TbFfyKv40qI6r05Nbk/mB2SKtoQIbXcp2F93m/G5IuC9AXqW
   Q==;
X-CSE-ConnectionGUID: rGyB8JCJQjuKpq1Mz0VW/g==
X-CSE-MsgGUID: hMHAN3BERDOo2sF9IFOWhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75477573"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="75477573"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 14:41:51 -0700
X-CSE-ConnectionGUID: z8o61NijRmOYKEeRntnq4w==
X-CSE-MsgGUID: quaSouBbQkWTT76ksRmOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="191644182"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2025 14:41:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoU5U-000HZ5-1q;
	Tue, 19 Aug 2025 21:41:48 +0000
Date: Wed, 20 Aug 2025 05:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
Message-ID: <202508200530.tcTiWy2c-lkp@intel.com>
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
In-Reply-To: <20250819053205.9976-2-mike.looijmans@topic.nl>
References: <20250819053205.9976-2-mike.looijmans@topic.nl>
TO: Mike Looijmans <mike.looijmans@topic.nl>
TO: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>
CC: Andrzej Hajda <andrzej.hajda@intel.com>
CC: Conor Dooley <conor+dt@kernel.org>
CC: David Airlie <airlied@gmail.com>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Jonas Karlman <jonas@kwiboo.se>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Robert Foss <rfoss@kernel.org>
CC: Simona Vetter <simona@ffwll.ch>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Mike,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 53e760d8949895390e256e723e7ee46618310361]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Looijmans/dt-bindings-drm-bridge-ti-tmds181-Add-TI-TMDS181-and-SN65DP159-bindings/20250819-133458
base:   53e760d8949895390e256e723e7ee46618310361
patch link:    https://lore.kernel.org/r/20250819053205.9976-2-mike.looijmans%40topic.nl
patch subject: [PATCH v2 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181 and SN65DP159 bindings
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: csky-randconfig-052-20250820 (https://download.01.org/0day-ci/archive/20250820/202508200530.tcTiWy2c-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508200530.tcTiWy2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508200530.tcTiWy2c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml: ti,slew-rate: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
