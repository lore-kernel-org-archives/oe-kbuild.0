Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77AC1E5710
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195779; cv=none; b=iie4MW6e4jWTaW7e3V2kP5ScnBohos2lZLwI5gSw3mLOUHY7c0TS4KPyZlmxBSKskxvsmUfhf1sjMYFpcf2GOmTfmk7r+xsekmv1CtZvlwchBBIcOm4nnTOAkHcg+h4xgkY9W51A1s18ls/3nxDk3epRzItVenmQxsSVVluhKno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195779; c=relaxed/simple;
	bh=0Cs1OcvJ3XleQo1y1cz58zkXZ4ltADOF9kHSPELjNvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ObAKuj4q9cOxMIuc4/P3dDZWMBtFbu7d5GYP1scBuC52wNthAiMdRFXYHOXk3ZnQTlQY7pLCzC84ocZuVW/PihuZufkp21yi+gKgd0ChgFriTioLW2lOrLcFOs3QaMqILhliMdRaWeoXJtbfItt7X340bnbb459Lg2dmzN00hNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JILaxXL+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JILaxXL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743195778; x=1774731778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Cs1OcvJ3XleQo1y1cz58zkXZ4ltADOF9kHSPELjNvY=;
  b=JILaxXL+4n1srWwaCKC05ZxOuTupry4iCoI3pmkv9BCfLus18gC8JqSg
   KnW8tPgfpLRkuRMz0pSbXEDczp+KNkNOWhareEnYoMJP/Rw2tkInH8kxB
   miANv59lTRCLG8CH0xHLnVXqGLD0VwBOa0sIpcUSO0AulqNb/vOoAjHKA
   Bt0cjywiX+Pa1deU/kSvx1txB966wtfp3Qd0bHbEst3MmwPGS2c/r68Ji
   GQlSByJluDCwo2iDLXBxpZ6HaMzxKhhwdeQRWN8YzW97R8ImRoj2Cz6np
   Drnl+6N4x2mJwE+owwbIGRzWGSABNPH1RACT8TgNkGPcdEqrRhqBJpFlK
   Q==;
X-CSE-ConnectionGUID: ngnliCA3RjOOjoonlc6gdg==
X-CSE-MsgGUID: ei8qdgiMR6W0KiKvXoIPIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="54766886"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="54766886"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 14:02:57 -0700
X-CSE-ConnectionGUID: hxZGqmDQT7GsVPNyM2XuOg==
X-CSE-MsgGUID: HigmrqVwS6GAXvjsxySlMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="129677085"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2025 14:02:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyGqs-0007hi-1T;
	Fri, 28 Mar 2025 21:02:54 +0000
Date: Sat, 29 Mar 2025 05:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-26-2 13/25]
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtb:
 display@10890000: ports:port@0: 'reg' is a required property
Message-ID: <202503290455.iCdVCGwW-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-26-2
head:   2518ccf64c65482b415e5a831057998bfe2bda1d
commit: 7db9499a8aca54cab3e2937b4da640c8838a6071 [13/25] arm64: dts: renesas: r9a07g043u: tidyup video endpoint node
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250326 (https://download.01.org/0day-ci/archive/20250329/202503290455.iCdVCGwW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290455.iCdVCGwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503290455.iCdVCGwW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtb: display@10890000: ports:port@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/renesas,rzg2l-du.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
