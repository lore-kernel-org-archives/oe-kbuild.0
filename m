Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101FE2FFF8E
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331609; cv=none; b=DJD350ZTTTRNZfUV/Gn6pI2nIiGXvkscPueKSshxG0hbO6OuxQ156uw4D/5IK8NpPNcLKK+tFlEhD4sfa0GkCUXZ/r9k3xLfpxIE3Tz5gN6kS4+hZnYGf00z7dDISSKfL3Db7MIYVrjEbi1C9TIELomcv2tUY7W+NXUEbw95MqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331609; c=relaxed/simple;
	bh=VwTqe5IbBEDo5vHRIBE8iGVCf/DLexL7UoQRgrW2IjA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OWmyi5QMq+4taIak9FGeuWS4jUEg9iWJJLRcbpDzMAv29YYMBoiTS18axQbFQ/tBRV4AyH6L0XRg8rR62g5jXlSzCmrbmpy3fEzXJUhwXFzuBORbx8jQuP+1V5uD8ueG37+g/pxwSb/T1hJ14wWfdVvlcfJM73D7ZYMkYyFilYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2WFYpkI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2WFYpkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331608; x=1797867608;
  h=date:from:to:subject:message-id:mime-version;
  bh=VwTqe5IbBEDo5vHRIBE8iGVCf/DLexL7UoQRgrW2IjA=;
  b=F2WFYpkIIr9YwEaOWxE8gDlnSpEw1zjhSSo8u5OY4R0LhyUmpUoLOliv
   Mcmk8w5SVQRJQxWXm7rfcdpIvhipnf0QPhBChitHYpEQPS6iwn3oCNzre
   EVEHy3lvCBVZMgNU2uId3xrmiCXGzW4uFnZukcbBdugHJW2Pgeu/ezLUl
   TKiEzacztjcpGADwyymWKP+Pzdx3MbJO3UtJjlBJPb9Q53G119eEbSkq4
   g9j4HgyZenYKijqAqtbYVsz3LqpN33LvttKUzTAvO+/0KkUvCETmQVHIH
   OLoTldqYpdTmko04KRjOjnZRElcai5mdYljmSE99AUNpqutTmSNTIB1HU
   Q==;
X-CSE-ConnectionGUID: OIJgdcoiRL6T8vPjmsAyBQ==
X-CSE-MsgGUID: UfbdCXIJT3Gn9XfliQWhUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68090782"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68090782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:40:04 -0800
X-CSE-ConnectionGUID: xIuF/W0bS4q2RhEyISfCLA==
X-CSE-MsgGUID: 0wnn4yutTC6IdgH/2OI48w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199347366"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 07:40:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLXN-0000000058u-1shX
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:40:01 +0000
Date: Sun, 21 Dec 2025 16:39:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 195/246] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512211653.enCpdswh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: e8e3ca60ea8420c2d28e08f0a0a34ab493d105f3 [195/246] drm: apple: Override drm_vblank's page flip event handling [HACK]
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211653.enCpdswh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#69: FILE: drivers/gpu/drm/apple/dcp.c:66:
+	/*
+		* e->event is a user space structure, with hardcoded unsigned

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
