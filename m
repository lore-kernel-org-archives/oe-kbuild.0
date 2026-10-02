Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9B135BDD5
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946982; cv=none; b=Y1HS3Q+sCFnmMg3nbRKX4e5in5MDzl87XEDAul8sAhN0qCywWCwrF+42Jiolq51wpBpsAcaiVLnlhXag3ri9LSOzzH6sbrFLOHwWZ5Mw0wBIPseRGntWZRykmhGCmHIOzdCwSrnv33H9BEth3qzkmIj8JQAgkjSAsCxPqZFBwlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946982; c=relaxed/simple;
	bh=58PCp6YKX72KefMOp318ztlKfFpk2ParTzjaLqJO3H4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ice9xZi1MAS8XBTDdEzfMoWW0VQ78XNVMfIWruICONJ70AjCwtmpbjFRcyLr27oyXTVHv4D2RsfCTithetUR593t3Y7CmacPU7irq1ZRdIdsb5rOZlivAjdOX9RU8cWVkh+SvI3z4Mun0lyYQ8CF8xMeLLGUMzCwnNXN6gPitJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfVfkYtn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfVfkYtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790946980; x=1822482980;
  h=date:from:to:cc:subject:message-id;
  bh=58PCp6YKX72KefMOp318ztlKfFpk2ParTzjaLqJO3H4=;
  b=AfVfkYtnkvXeZ5LrKc8MXlY3qm2agKNifQzec9uvLY8dh6hRwclmfbd7
   2jDuPJ3hWDW07feapnU9md+9e7AERTK9VAEmXZZpqvz9U8tlH3fRWfv16
   fvXSqzHWTg1nCFvc7IbNkC3PkamzzXvI2x84G6BrjYYMpyri8qhPLkpI5
   /k2zFM/avasHZyWj+HydZoMzzodfR3+nG7YIU8OPRFCxkk7LUnWHEnX5Z
   ErlaUwyWwv5S9rsda2W4dV1YhhH2UN2/584BtHlk9lbR/kK6g4FGN7sGI
   0QPcIgCaRtxh7UrfPDngGgIKZQTzWaQ/3/Dw8Egnd/fVUaM5mMRTRf1UN
   A==;
X-CSE-ConnectionGUID: PmBsQUHFSHK+7I2QrXwx2A==
X-CSE-MsgGUID: NRDNUiSCSsm6Kl/L/2EuKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90570742"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90570742"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:16:19 -0700
X-CSE-ConnectionGUID: Vz2r5AwVRP2EDu1YQ8A+lg==
X-CSE-MsgGUID: s73ADYQFR82+6UgIQvlo7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="269679"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 02 Oct 2026 06:16:18 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCd7Y-000000000Y5-1CgG;
	Fri, 02 Oct 2026 13:16:16 +0000
Date: Fri, 02 Oct 2026 15:15:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/mahua-crd.dtb: thermal-zones:
 'ec-back-cover', 'ec-keyboard', 'ec-soc' do not match any of the regexes:
 '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
Message-ID: <202610021536.GdwJOn5K-lkp@intel.com>
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
TO: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anvesh-Jain-P/dt-bindings-embedded-controller-qcom-hamoa-crd-ec-Add-thermal-sensors/20260928-120637
head:   336d6db9b8459aee9298b06c6d8a3b98784da5a3
commit: 336d6db9b8459aee9298b06c6d8a3b98784da5a3 arm64: dts: qcom: glymur: Add EC thermal zones
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2402-20260930 (https://download.01.org/0day-ci/archive/20261002/202610021536.GdwJOn5K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021536.GdwJOn5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021536.GdwJOn5K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: thermal-zones: 'ec-back-cover', 'ec-keyboard', 'ec-soc' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: thermal-zones: 'ec-back-cover', 'ec-keyboard', 'ec-soc' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
