Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2232C4C97
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 04:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773202613; cv=none; b=HnhPa+kTUg9igD4LEl6AJZiD6n0oCUPCJ9VwRQJByLNZ+EociiKnFlOkOmEI9K/NiDvkSlxJFGynnCXMYDO/E9A01Qu/gNx21yO4uvNhf6iZC74IEBt5+/XLZ6sAllCSAY2XQ2yGRUGOHr/r9Z8fqThPAIH9u7Aa/PASIzz4qGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773202613; c=relaxed/simple;
	bh=gz49D+zBJym2B/PWwuvfxP9NQ/Fli9KT+k8B9d6OOCM=;
	h=Date:From:To:Subject:Message-ID; b=EPgJTtFj+GkubHHQNIKx0Wh8j7OPEH1pPrny/0MeOh1phWCo26iWRN5pK9H6y6XEwGQ2DUzehKNDJ7kCL16zljGp8e+C0IYaFNMCURuwL7S/fFPmnyGMMZjoBXfO7aWv1ykYtfBcvM53ysGBd7xbiiHG8OU5tcPNDOpDFGU0aNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EErpp5sW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EErpp5sW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773202612; x=1804738612;
  h=date:from:to:subject:message-id;
  bh=gz49D+zBJym2B/PWwuvfxP9NQ/Fli9KT+k8B9d6OOCM=;
  b=EErpp5sWc/SaPq98wGpnupm/FLdtWOTf2bli6h43T3Mo/L6MoV768dHf
   /wwsfKc5uFxesF6VgqR/wpqwWHR/AdncS/nMtB9VMGUOLUxTLvKS7DUqh
   shOI37z8lTIgHrBX1ML346zLMoWSAwKDpHZUPpGKJhlJ2ZUjSc+eXgil/
   JA8/RvZ1EJAJF0V0OpliBulyUFQV9oTSX/PDNF/4rqE02KRfK1yXFIZeJ
   5wqx60/5d2i5tuDkCLDlvp/X++9HAVX1Ue4+MPP1aYetopKIfsmSAfpfQ
   xal80wVOalece28CgTcFaSgb0tBPDQZZHP7M3Hr+SmuGfhPuAzJ8JzSsG
   A==;
X-CSE-ConnectionGUID: uZhZ2p7uS0iU5CS9F1Ihuw==
X-CSE-MsgGUID: LnMpRpX0QEKIXwv2xFB7yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74451700"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74451700"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 21:16:51 -0700
X-CSE-ConnectionGUID: 8H+EFvRoQPecrhQ5nWsxgw==
X-CSE-MsgGUID: hzmdbWG8RBevoHHQRI1lDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216633424"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2026 21:16:50 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0B03-000000003FL-2XYB
	for oe-kbuild@lists.linux.dev;
	Wed, 11 Mar 2026 04:16:47 +0000
Date: Wed, 11 Mar 2026 05:16:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [robh:dt-convert 314/621] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'debug'
Message-ID: <202603110520.XiOT3AYb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: b3b315c1b46db4d483235dc926498e8184daace4 [314/621] dt-bindings: net: Convert hisilicon,hns-nic to DT schema
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260311/202603110520.XiOT3AYb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'debug'
#90: FILE: Documentation/devicetree/bindings/net/hisilicon,hns-nic.yaml:71:
+           debug debug   service

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
