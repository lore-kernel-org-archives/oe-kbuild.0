Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5F2E36EB
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 01:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754271272; cv=none; b=GFLiaI9DlZtCmPW+JQrxs3VobvGOibHWU9T6R+s9cGBw9FBh3yQ0UkMgM4HzCol5V3aOBgf8hKp0mLMPkGrzvF0FxD7QAePPOcHX/YllVzzwcuOJ09SPMyYpHcp4OYbxHI3ynBjeFcQyDwaQ4BJBT6EJSb1ENK4yFpinmJwwYM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754271272; c=relaxed/simple;
	bh=y7pAM9ONeXvTcdBMlk4MfCCmFuuj3c7vFyjuzASpXY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aB4mHZkYquJlIbppneUJs2Pyfr+/PZ2yRNhf2Qj45OxNoj3DYDdUbRLbjz6430RpVG/UTT/bbQvxCAmap4nC+Y0M/AJz2UQNDat0TwS/838L8xnBDyqdaOXiV4SzOr99asbRA5vYb/7AIClVaKVOqToYgVHvPFh1kCEXPoJ1soY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pks1Ua0Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pks1Ua0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754271270; x=1785807270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7pAM9ONeXvTcdBMlk4MfCCmFuuj3c7vFyjuzASpXY0=;
  b=Pks1Ua0YIH8fHKGHaIl5nwrcgBvJbSa8oBbFAP8OrO8lwVgVJICOEg9s
   CP39+887pQuAAgjYutaODVquEEKfZ2Un2DZ7kgpmnI87rMbTqw7n7KL6z
   +X8xKaFll6MUbK/uMhr+Nzrrs7HgpNPEU90/LMuJYwG0ytVl85n3k6I/S
   N9uIiblPkngePDulF6pUqtXbweCWD39iIYBPO+whp3JPelE8FoInfGI5q
   avLP4KpXS3xEMRoEXABZAPhvVaAtHC92ZWiO8+3rd64WGksai7fqyV7at
   hWJye8nFuQDpGiq1QiZ6MRdNnawuYB8gJZSetByWIxlHHQ8Iphy6XdRfm
   A==;
X-CSE-ConnectionGUID: n57oGDU4SpaA4EB3bkmBAQ==
X-CSE-MsgGUID: 8f4YJTQoRCa38t4C/xTDCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67092606"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67092606"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 18:34:30 -0700
X-CSE-ConnectionGUID: FQoIPPk3QLiJUGHJ7GQyEw==
X-CSE-MsgGUID: sGF0tL0MStS9uzB2AYcUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169408260"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 03 Aug 2025 18:34:29 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uik5q-0001iN-2U;
	Mon, 04 Aug 2025 01:34:26 +0000
Date: Mon, 4 Aug 2025 03:34:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 11/60]
 arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display
 (microtips,mf-101hiebcaf0): 'power-supply' is a required property
Message-ID: <202508040342.dKS1pI7o-lkp@intel.com>
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
config: arm64-randconfig-2051-20250802 (https://download.01.org/0day-ci/archive/20250804/202508040342.dKS1pI7o-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040342.dKS1pI7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508040342.dKS1pI7o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): compatible: ['microtips,mf-101hiebcaf0', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: /display: failed to match any schema with compatible: ['microtips,mf-101hiebcaf0', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
