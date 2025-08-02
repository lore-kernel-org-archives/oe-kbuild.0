Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57246BF
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 23:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754175715; cv=none; b=fs/I60ogl8B8TcXv2fp3y+AzDnv/rjyYtbZVYVvRVtBJUUUFrVcOddVm72C4K3fABz6NSPFjrAj6LrkX0OuwdHTHrnoTIQ8nJSsUMQSGUyWBoWsKP/TYA8O4wh+ZyW1o6j4EIn7HwJ5OUAOqzNRp31queIPnnfQ9LUuq9EY6BEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754175715; c=relaxed/simple;
	bh=z8Fo5An2/jJYc7ntMxWX+yLVMnFf+dDQA0H0AcKyABY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8tcamasSGDBD1J4FRB5f/RdtQ1ahIf8xRDLt3mp7YdrBObOHgVD3luNWmq4y9LFQgTK6m9O2s0bLT2tmC45rHm70HYTkakotE9HSs30mTSFtKIewDCPkCjQ9k3QSdScAWq/nHddR9w9L7RCciibpAuT8sAgMtvatk2dr7HqjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbB34ptZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbB34ptZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754175714; x=1785711714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z8Fo5An2/jJYc7ntMxWX+yLVMnFf+dDQA0H0AcKyABY=;
  b=KbB34ptZe9vtvlMtcC67ag56z5I/9X3yXvpGiEeUHAyxZibO1Fxv8D8G
   uvqs/Fy74Xr7bQoiu0T6uyCQqlWu9mXaPt0EzORbjqCMrJbOO6feWxu3G
   eq6R6gjvrLEkhFJsKTgwgwwrHuyfCMxmb0j4MLyOWRQqSR5myn7qwm3Xm
   8KtL3mn5DPkLRDJnaY1QsT7wQ60RWvFyfnzv975iOxbQZC1SQ2O7Q2bYD
   hi5pWoSVKXQgz2GNeAecfbQ3p5iEFDUF5VXq258RTDOpX415cP4+cCoSu
   mdKqdIh0x5XiNXCYsmolOT7tzGFoFQaP1L12ju6Hh7CawPXA+JzqTByTD
   Q==;
X-CSE-ConnectionGUID: IdWAEG8iSe6K10IToEjGPg==
X-CSE-MsgGUID: q5FeTAIKQvmqGdxHdXzV0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="79035622"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79035622"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 16:01:52 -0700
X-CSE-ConnectionGUID: ks8eGMPrSc+ufM8cIc1lsQ==
X-CSE-MsgGUID: mr8sP0TyQ4CvApMIcNGnBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163127076"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Aug 2025 16:01:51 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiLEb-0005e0-1R;
	Sat, 02 Aug 2025 23:01:49 +0000
Date: Sun, 3 Aug 2025 07:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 11/60]
 arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display
 (microtips,mf-101hiebcaf0): Unevaluated properties are not allowed
 ('compatible' was unexpected)
Message-ID: <202508030640.CkDIY3Nc-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-053-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030640.CkDIY3Nc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030640.CkDIY3Nc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508030640.CkDIY3Nc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): compatible: ['microtips,mf-101hiebcaf0', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: display (microtips,mf-101hiebcaf0): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtb: /display: failed to match any schema with compatible: ['microtips,mf-101hiebcaf0', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
