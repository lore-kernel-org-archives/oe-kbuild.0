Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78B1D5CED
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 02:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754274340; cv=none; b=Z311gyDl0YBKggjX7JM9x5rwymY1aCqqyg/1370hI2xhgE9LMdhZ2BXAjVyWOkLbQdR4Uti2R5GFDf1qbCgembIOmP8/yM2e0cp8WbhUKr6I8b/MEjUJ52QUQoLDPFBCVAJrGLuP4GFStJIMe2XwW1mlAl+q3u1wwuWnxJtyxmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754274340; c=relaxed/simple;
	bh=pCQ0NSx/jcOahHSoPJernBDRPZbJxSqOgXsIBWXoC0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOK3qwDT97cL+8ZrMKwA+yxlnZkEVcfVXXsDQyQtHxzMvli2KzQfb3+8dP081MEYRJHZPdf0+nhM8OfR5A4qzzQo6pU/AsHvDY+Tr7Fg9+yyEt2Dyu4R159qY5GLtkGQP2bK5UEYr3wt014/HXGuE0/RpUSZ/V2PIYIcpJVGaZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIJcipCn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIJcipCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754274338; x=1785810338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pCQ0NSx/jcOahHSoPJernBDRPZbJxSqOgXsIBWXoC0Y=;
  b=iIJcipCnntExn4+o0gySNqUyghwvkwsxeCG0dpWgCvcrn6lepoFK5DCv
   tVf6cPCD8ty3pBXyJQuL5Ic1JmvKtBuIXrZ3npg4rNN+nuFVpVT8hT6AD
   8ko+HEmX9UaGxYh1NVmAiIPggNziN2iRk4E52SglTZHVRg+tjQJtfrQwj
   X/wVaxjPF32Or09E6nX46uTJrL1j0H5yO5SSvVr1f1d7Rd3kFR+HTXS6R
   i5FsJWRHqt512rkZqrVnGn5CWG11F7qLyz82wXhKH+QCRh2LGvbK5MCBh
   57FGZFRZEd1fF0Pfn2OHlxxhOuDmlFg0ULJqkPwNUbsGXUj4LXH45NsHO
   w==;
X-CSE-ConnectionGUID: bNq9aCHCQRaOdbeFt+p+YQ==
X-CSE-MsgGUID: cUt4b5mGT+SCQJBXj/VrsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56228797"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56228797"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 19:25:33 -0700
X-CSE-ConnectionGUID: FDFbL7PgRyCks2VDXA4/sQ==
X-CSE-MsgGUID: bT9S+wbPS7q1oVxIWL31pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168494432"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2025 19:25:32 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiktF-0001ip-2i;
	Mon, 04 Aug 2025 02:25:29 +0000
Date: Mon, 4 Aug 2025 04:25:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 12/60]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd
 (lincolntech,lcd185-101ct): compatible: ['lincolntech,lcd185-101ct',
 'panel-simple'] is too long
Message-ID: <202508040452.X96aMruj-lkp@intel.com>
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
config: arm64-randconfig-2052-20250802 (https://download.01.org/0day-ci/archive/20250804/202508040452.X96aMruj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040452.X96aMruj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040452.X96aMruj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): compatible: ['lincolntech,lcd185-101ct', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: /lcd: failed to match any schema with compatible: ['lincolntech,lcd185-101ct', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
