Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE1863B9
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431499; cv=none; b=eV8DrvruIbplJDjjTfAyau42xrXuVxkxHNfdLQ/KoGpxF8GT+Vo2KE+tMfn1Eb3n/cqE1IgtQcnWhpojOJZ8/e/WAcZUrhEbRGkfN1wkAlITI3m4C6tXsG9uAwLQ5NnB69hvHZ/FNU6MWZWA0A9HVbmMWUlv6HJn7m05WPkObp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431499; c=relaxed/simple;
	bh=QyA5GMQGkhMTRnkt4QMvBmIgnlfSMZkRWe0MQJcj7IA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URxQdM3rZLKqbLnLB0yqgHXNILm5vC8zq1s8khtd4yWFGXA4pDe8ezMgKM9bsSW+UjajatFXnet53m4f02AgE5Z8askoEHKJqXp+sHYcWyQXUzR3ro6x6thyBoVIN1K1IOy08MGzTPNXNkgZpTFXEU1oHmHCRVZzn3OMlciCpJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWzJAJzL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWzJAJzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736431498; x=1767967498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QyA5GMQGkhMTRnkt4QMvBmIgnlfSMZkRWe0MQJcj7IA=;
  b=NWzJAJzL68na8h8+0ffqLcLW4j0zqf6b6mnu+Un8IxUVM+Qv8I2m9V2i
   /3JQcQMjrtpU2TyBQvxjqcarW4i0a6Ce0lQIy5dkbJZX7qttjfuweQIVo
   aHES01qvmQQjvqXlwbf3VszwZDHpGWtQ5bU9A/KLTU+47qfrBuB1CGIPh
   WoGQ1FAxs+v0vHNg+4c+3FxKu7SFwvpQi2i/0L6TNhbDN+FcU3Z6nWMsG
   FKfZKFZfWVnY1wKMRt+ULzmsZBdJKVfSI57xHj5u3zv5/f55ssMccFJDz
   pS2eeVxbevXdEgPu7ECrP3vEcHEWiZ28FoN350G7phDB6lq9GgtOTWgUx
   A==;
X-CSE-ConnectionGUID: i8Mu9V69ROO+b0+y0NTBhA==
X-CSE-MsgGUID: akfzXIxpQaeFRhGubi0Zxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47680828"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47680828"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:04:57 -0800
X-CSE-ConnectionGUID: 6pkIsjQzRCW8nTQqWJyjvw==
X-CSE-MsgGUID: f055g/6YTQqv8Hpe+uaY1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="134247977"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jan 2025 06:04:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVt9a-000Hdr-1I;
	Thu, 09 Jan 2025 14:04:54 +0000
Date: Thu, 9 Jan 2025 22:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
Message-ID: <202501092114.4rkCvTyo-lkp@intel.com>
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
In-Reply-To: <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
TO: amergnat@baylibre.com
TO: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Jitao Shi <jitao.shi@mediatek.com>
TO: CK Hu <ck.hu@mediatek.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Simona Vetter <simona@ffwll.ch>
CC: dri-devel@lists.freedesktop.org
CC: linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Alexandre Mergnat <amergnat@baylibre.com>
CC: Fabien Parent <fparent@baylibre.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d89551994a430b50c4fffcb1e617a057fa76e20]

url:    https://github.com/intel-lab-lkp/linux/commits/amergnat-baylibre-com/dt-bindings-display-mediatek-dpi-add-power-domains-property/20250109-002152
base:   9d89551994a430b50c4fffcb1e617a057fa76e20
patch link:    https://lore.kernel.org/r/20231023-display-support-v5-1-3905f1e4b835%40baylibre.com
patch subject: [PATCH v5 1/7] dt-bindings: display: mediatek: dpi: add power-domains property
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: csky-randconfig-051-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092114.4rkCvTyo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092114.4rkCvTyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501092114.4rkCvTyo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
