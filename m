Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60B7A927
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 01:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754269719; cv=none; b=kPu09QQ6PW8BmY27FK9OY1QNcnBjYiT91lV2WJqvGtg5Aw3wKIhPsvjRc7uDeIDtYw9ei/Yp46FdXWlb/M54UERCSVqjybNvc701G9F3vwqULrZp1kNErskN8zZKvdhUUkIjqNKE/R+/Z0m+l+wEIXTgRbPvgRgjryrV/oCZZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754269719; c=relaxed/simple;
	bh=FyscT8l7r9C15KFLjMCF6pLB1D/maPHSK8eUbaVjfZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HwJnZj1qYe2sIhsComEVyvrL+6AB/uPPfPQoIkCGClYkb0DYxSbWywk5CtSlFIdY+htuXB+2lGtqQ5Y8wwbJwv8ZWQ1B8J6AaFsTjMuMeQhemgDlZBoWnU+cWAmxW4vDLIrtD2fte8fIpalZ+u86pxEMVKigZFgrW6wXkRbh66k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ws6SgJTH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ws6SgJTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754269718; x=1785805718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FyscT8l7r9C15KFLjMCF6pLB1D/maPHSK8eUbaVjfZU=;
  b=Ws6SgJTHs9QIlxGbKM+pkG71dX7rzFyu9GLEvesaKxXFYOAIt4qv4frn
   YACKozFrLUeV1BSwyDi4/BabcTBwAvNdXeTkrBox27Tz0oBbX+1vco4Yj
   uDRaO5NpqWuO7ZMoX7BfrodBxR1o+11xqrLDlQNusJPPHP0YM5a8H7XNk
   8HX9Pgj/AxoItEvm3QbwBFZKoX8zmNrg6zsnzsQ3gg0MBuXVs4opbxynJ
   0tydylvKCPqxDBPJU1Cl6h8igmlpqbQf5N9kpx1Nzo40+kzz88AirxN7q
   I2tqs0eyxKbaErqdH1un8JqGciUOkqHNhpOVFGUeM6iwXN2OEbVM2ibnv
   w==;
X-CSE-ConnectionGUID: 7c2zJED4RSCVuunkEfi/AA==
X-CSE-MsgGUID: J63HVpF3RP2sl4yU9/S4IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="60337285"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60337285"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 18:08:37 -0700
X-CSE-ConnectionGUID: oZP4z47NRp6g4YJJ6DTZAw==
X-CSE-MsgGUID: QWSjutldQ6GuCHC2JOasVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164362037"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Aug 2025 18:08:36 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uijgn-0006i8-17;
	Mon, 04 Aug 2025 01:08:33 +0000
Date: Mon, 4 Aug 2025 09:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 11/60]
 arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display
 (microtips,mf-101hiebcaf0): compatible: ['microtips,mf-101hiebcaf0',
 'panel-simple'] is too long
Message-ID: <202508040914.GNtK07x3-lkp@intel.com>
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
config: arm64-randconfig-052-20250802 (https://download.01.org/0day-ci/archive/20250804/202508040914.GNtK07x3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040914.GNtK07x3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040914.GNtK07x3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): compatible: ['microtips,mf-101hiebcaf0', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: /display: failed to match any schema with compatible: ['microtips,mf-101hiebcaf0', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
