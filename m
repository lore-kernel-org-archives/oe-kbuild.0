Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B129163
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 00:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754266527; cv=none; b=WrROGtvXn8EFgS+pkrBqLINCZpPtGuQ2ct/SXsnQp3gmMOwLFklDr/EWzrFWRu3XWZrKb4XIUtyIB3ZHhFvQuH7QRNH6XBa0P+zwkaGYYthDP6SoszQ0sMvoxO7APBEmfsc94mz4DHKfov/d77elD2LYgFGph++TdDmvptMmokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754266527; c=relaxed/simple;
	bh=N7EGFH82pNS4fuC5QcmPeRSgG3SRVNZyYWPJJ51Secs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q14eMmyKFgbpNT/GVt59CyaiQhHsVo9o3MOIO13EYfNcpuhJ3LpSgC2grpYibuoSPEd3mucuFddE/v/klndxODG9okFiohy/Qc61FNPtd5fyU+SatkuRExtlDRBlY9gL5xhfPB+hPMXAAr1n61ADQ38xM/bkUr4WsNEp+0mJq38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXwgl+CU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXwgl+CU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754266525; x=1785802525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N7EGFH82pNS4fuC5QcmPeRSgG3SRVNZyYWPJJ51Secs=;
  b=WXwgl+CUU5sK7q/UytZhF+7ncqC3fZ11C2cdoxRmCxdTQwb52SP8s7W0
   5KU1Hi7MZn8k7ZLph6Lua68vSwRLPbJ7BQObCVPfwsmwdnT7hVE2Db942
   oZd5AHkFGEAQSa29wvlkAmiwsCnLxVB0OnlJ+ammOV8TXVP21rfphNqOr
   ln6zcf6VyAOxEcwJYTHRNCvNxXkiTqBpTSKxJ7q3qGX/YB9wZAEGEGmGE
   +XOxfo2F/RIGnB61hnrMyQTeGZVqWzvALteRuwo3XtkoXncuI4ZIgAwxL
   Y3hm/lmR12Qj0DN6rBJ8DdPmknzEGPEZnF47p2hWHK1SgvpZkqXoklbzx
   Q==;
X-CSE-ConnectionGUID: hUwzBTN6SAmgNAwjLVwBSQ==
X-CSE-MsgGUID: J+7Cc1AnTkGN1Y7T4ABfbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="79073201"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79073201"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 17:15:25 -0700
X-CSE-ConnectionGUID: vHffoZwFTvaP0PHPklYkgw==
X-CSE-MsgGUID: AoqcXaz8SC2ZW/2VUsywYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="187710900"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 03 Aug 2025 17:15:24 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiirK-0001hr-0I;
	Mon, 04 Aug 2025 00:15:22 +0000
Date: Mon, 4 Aug 2025 02:14:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 11/60]
 arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display
 (microtips,mf-101hiebcaf0): compatible: ['microtips,mf-101hiebcaf0',
 'panel-simple'] is too long
Message-ID: <202508040228.P16ykczr-lkp@intel.com>
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
commit: 8e43509c0c4dec12fbbc332cd4a3230caa5eb656 [11/60] arm64: dts: ti: Add Microtips OLDI SK-LCD1 Overlay for AM625-SK
:::::: branch date: 5 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250802 (https://download.01.org/0day-ci/archive/20250804/202508040228.P16ykczr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040228.P16ykczr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040228.P16ykczr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): compatible: ['microtips,mf-101hiebcaf0', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: /display: failed to match any schema with compatible: ['microtips,mf-101hiebcaf0', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
