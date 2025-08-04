Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF65B17BA9
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 04:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754281181; cv=none; b=Vko02EsS85f9WpRxJmlnJbrkrBkDuaEiStJe2TxBrxRQ2i26+x9k9KdIgNmP/4CXhWBAPOMwA1/4TzFJAVg/G84fKI95UPqc3r3879PHFJwwA9kot8Yicwf8+JAvsQ2kpppUnd1TLivNrlT9DNGkXD10Vep+WoXRtnF9BgAUBcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754281181; c=relaxed/simple;
	bh=IwLG5dlDvLvAFFWOfABNeenPgqP9RK2+6SDl03+VqIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dikITOYKTZVV8Dvcp/7aJfiYErYMaU+F5GekqyqqvaqZvkYstmoIrscBo4O6N6sH9rvu9Hlu4jBeTH20HyxLC1I9yDaXFn+swQ1+6vkAd4gBfaeyQ//uI/hgRFJl1Zgg+bL1RphrBQTvz5xHs3def8z9hMGUcFeHkrax/oGJbIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7KrdGX6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7KrdGX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754281180; x=1785817180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IwLG5dlDvLvAFFWOfABNeenPgqP9RK2+6SDl03+VqIw=;
  b=e7KrdGX6F8MKzj0BdLJUNo+dSD1Jxgx4MiMHqHdxBumrlbIbnFAm1125
   +TToaNJoDi0yNGiCAkPB7UcNd+M1J5LAOkktaRgsMcgsHy6lMlI6B2UFQ
   7wfhMLtzUnT8vQky3HBhphC1A3V3EZqjgi3MbZ2kgly1YeN2Uz4zClLea
   hXNajRdVDQEsZP270phk5QnH57PHyEO3wNiD94kCMEZO0pWiOMC76vvm8
   LBiZuHdZ5a2FJ+6SooQqnX2cQ7YpfGJhRr208LA3Chmc3fcN4TVRm+rqy
   5yV9hBgcZuQocDvtN6aPS6V9UBlf7SAZ6+sABf4qR0owReFlENtHYe0uN
   g==;
X-CSE-ConnectionGUID: acsnBxYiS5yh9AkzdDJ5Ag==
X-CSE-MsgGUID: OhwFrrXXQ2iHy4oQjMM3vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56402958"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56402958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 21:19:40 -0700
X-CSE-ConnectionGUID: H1RoOw7hQLmza9eOOzLfQg==
X-CSE-MsgGUID: PF2v+bIRQKmvIpGjHvMHZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164836979"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 03 Aug 2025 21:19:38 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uimfg-0001jR-14;
	Mon, 04 Aug 2025 04:19:36 +0000
Date: Mon, 4 Aug 2025 06:19:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 12/60]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd
 (lincolntech,lcd185-101ct): 'power-supply' is a required property
Message-ID: <202508040613.hWuLBZEu-lkp@intel.com>
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
TO: Aradhya Bhatia <a-bhatia1@ti.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: 0a3beea5c650fcd3363683e7c5b7008de0a0bcbe [12/60] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
:::::: branch date: 5 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2051-20250802 (https://download.01.org/0day-ci/archive/20250804/202508040613.hWuLBZEu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040613.hWuLBZEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040613.hWuLBZEu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): compatible: ['lincolntech,lcd185-101ct', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: /lcd: failed to match any schema with compatible: ['lincolntech,lcd185-101ct', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
