Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551C25E469
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 01:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776390288; cv=none; b=MyTkdWG9B3/GzeQvy/mSITdlBxGmk/5LbUBsj5+BV84LYWSNL14IrB+6DlT3baWfzHChR7z6UgDIETjvIm/+zHPT126qzdnoHvcj2LTt7QEWjuZk/A4wmUVeDMMSYX5MGUDXBE3iQ5orzFobYuUOMDTO6peuvEBJyN2xaA5Orb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776390288; c=relaxed/simple;
	bh=Uykdm/r9mAqpVbYO6yOH3ElGEjYIH8/7ccMOFVDtVEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eDIBMWPWVWoIppDMhkz4T7D0ywAQNk3K3QOyYTvQLldBrDdo8qdUXhxLiC0JdPKL3uQEV9dyU0Rv5chZR02oZkkiB2+QHReluw3cjCSYHjnDaTmJcCn4xgRRqMPJaj5jZ6o+7npw51DlQs2MKuDTAu5kF/iKMXsFGgacQMdwJ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCEZ/vW6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCEZ/vW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776390287; x=1807926287;
  h=date:from:to:cc:subject:message-id;
  bh=Uykdm/r9mAqpVbYO6yOH3ElGEjYIH8/7ccMOFVDtVEs=;
  b=lCEZ/vW6KlhpLOfLeHrwf6hRgSdmo/hj/c3WAx9J6ENETxh9rNyaUlev
   PHQQJipVWGKIckEvLuAWCkS190vGkdFsFEOA918gCoQv12/UqLxvH70Av
   kYw9pQPtEkiSaXeqcE8e2wZXmnK39VuEOUN1nz0xYlOh2yL9U9n7yw8Ys
   9MN/tqiy0DN2cLVZKchnthNpTLFjoVazV8ysUhJUz/GEkdlt82V98ZEM5
   d0m5conu6WL125pgVa1JicytWtyO3JkyDd7YM99L3SKAp7TKgZJG3k8iF
   xkOLz6FC2DlVKkVik4CG/4HaYBa/3KeVaJO+WvrHfud2TPRTIegNUN4ik
   w==;
X-CSE-ConnectionGUID: zMS/mdFkRMCIZTUfbV83mA==
X-CSE-MsgGUID: UyygvAJWT7u/ptzrP3RB0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77274354"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77274354"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 18:44:46 -0700
X-CSE-ConnectionGUID: CXsnMdHyQRSjsnbo6A5fhg==
X-CSE-MsgGUID: YlYr1gBLTpKodRazVHo84A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="232648222"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2026 18:44:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDYGA-000000001Aj-3pY4;
	Fri, 17 Apr 2026 01:44:42 +0000
Date: Fri, 17 Apr 2026 03:44:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: allOf:1:
 'then' is a dependency of 'if'
Message-ID: <202604170317.63yLHHl0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Billy Tsai <billy_tsai@aspeedtech.com>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-pinctrl-Add-aspeed-ast2700-soc0-pinctrl/20260416-181713
head:   9e0e46d440ca8082b542a7edd805730ffaf76a23
commit: f193e7e26a08997de9b4a80aa5b6ca0324185899 dt-bindings: mfd: aspeed,ast2x00-scu: Describe AST2700 SCU0
date:   15 hours ago
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: openrisc-randconfig-2052-20260416 (https://download.01.org/0day-ci/archive/20260417/202604170317.63yLHHl0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170317.63yLHHl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604170317.63yLHHl0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'if'
   	hint: Keywords must be a subset of known json-schema keywords
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
   Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'else'
   	hint: Keywords must be a subset of known json-schema keywords
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: allOf:1: 'then' is a dependency of 'if'
   	hint: Keywords must be a subset of known json-schema keywords
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: allOf:1: 'then' is a dependency of 'else'
   	hint: Keywords must be a subset of known json-schema keywords
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
