Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CBF4C97
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 00:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317070; cv=none; b=HbbrnPrWKqWXeMlfSu3KZpWFp2gAiIdBRfKyYR9G819/MQ4MVpJyTNc5lA4XsWmcUzpNYTCc1GvNUcDxmLVZJRuBM+vbioKjB/tVLnU9kbB8XVyZCgq4FDGJBhJSgnTFXFNYecZMrhhOVGbJ+oOC65Oq5kgVHVFRCHW27+hEj4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317070; c=relaxed/simple;
	bh=N/AwLWUN7nNooWD4bam53yZ9pXQB/oGXEa2bMhNI6Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dv0Kfs7sE+rXXGIF6yO7fWS1xLhXrOMPs8BwI901qqRHJxfN7vbjuHGqAkEFe8hycbeykhz3f5LCNHhxpOmZ6NbrjCo8W7OaKJkx08YXe2Hh9eI0CNvAF27VZzS/3ERrzwWoqStM0wvJzWk9zt6GKdzh5UGNem33Q5VypSZcfIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUMR1Ea7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUMR1Ea7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760317069; x=1791853069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N/AwLWUN7nNooWD4bam53yZ9pXQB/oGXEa2bMhNI6Fo=;
  b=QUMR1Ea7l/QIiCj5c20PXHu+lQ5BVLMZbhJ+dDRtZ7Q5B7Nt6zlLKVq0
   EyPGKy1Fh6WjfgnCXsE34umYQmx+H4JNGOJOLmzr2jwdunpujvQFXCxuo
   IpQtn/tXlrYVYLJNkfXdnXUPEvqNgYA3eRtavsad45fzGBT4DmLfZJsBI
   eSj82erUBSLT0xA5FWsz5IJBcJLUMsQ/LmjPuJP++FwlV93X6LhI980RR
   Snu4mMenGwcSLOMxhCpMXG4AtrPt0wp7IkIBHosJFa5BSmvvXEW8giz45
   r7DeFvfMmhJSiNAMtlS67O9pOeS6SCmtBcNto4gyMi6sfVTeXB6fU6uB6
   A==;
X-CSE-ConnectionGUID: 7eht+gAkRU+qIy5fVPX9xQ==
X-CSE-MsgGUID: jUff/ZqLSpiKVl/HoZueiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62340093"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="62340093"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 17:57:49 -0700
X-CSE-ConnectionGUID: DgxuowuVQ8WkP3YGwZTz3w==
X-CSE-MsgGUID: pZyXnU0NTiyRXhKA3Gi07g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="181891666"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Oct 2025 17:57:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v86sR-000017-3A;
	Mon, 13 Oct 2025 00:57:30 +0000
Date: Mon, 13 Oct 2025 08:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/4] arm64: dts: freescale:
 moduline-display-av101hdt-a10: add backlight
Message-ID: <202510130747.tulDMKjB-lkp@intel.com>
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
In-Reply-To: <20251009-max25014-v4-3-6adb2a0aa35f@gocontroll.com>
References: <20251009-max25014-v4-3-6adb2a0aa35f@gocontroll.com>
TO: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Daniel Thompson <danielt@kernel.org>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Pavel Machek <pavel@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Helge Deller <deller@gmx.de>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-fbdev@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Maud Spierings <maudspierings@gocontroll.com>

Hi Maud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7c3ba4249a3604477ea9c077e10089ba7ddcaa03]

url:    https://github.com/intel-lab-lkp/linux/commits/Maud-Spierings-via-B4-Relay/dt-bindings-backlight-Add-max25014-bindings/20251010-054728
base:   7c3ba4249a3604477ea9c077e10089ba7ddcaa03
patch link:    https://lore.kernel.org/r/20251009-max25014-v4-3-6adb2a0aa35f%40gocontroll.com
patch subject: [PATCH v4 3/4] arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20251011 (https://download.01.org/0day-ci/archive/20251013/202510130747.tulDMKjB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510130747.tulDMKjB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510130747.tulDMKjB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: backlight@6f (maxim,max25014): 'default-brightness' does not match any of the regexes: '^led@[01]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
