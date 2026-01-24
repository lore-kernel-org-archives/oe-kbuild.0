Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C82246774
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769254678; cv=none; b=FFwp+n4iZ19wpQAV26IPPYaGya0XwfykeKBe0q95T/7ozgKOtOyKyNdnzlWwCOT4SlDpf3cS/xbQD+U/yRnGqsbhnZqXRFaYhpbA525WymFMeQudmJT4ftwio+1dNfuUWaF2jJKudMU/FKPWy0lXBDFh1stquE+lE/X40nJ9fj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769254678; c=relaxed/simple;
	bh=T5WWV1XnqT2q7BCmNdH1FuGsG6tyIJ1UbD/SNSu8oVU=;
	h=Date:From:To:Subject:Message-ID; b=Iaihjso9ByaJyOoaWDaZ1dr7N5E4sK3sBT2F3AG5+Tp2DBL0AFPWQZWlpSxsgwR2/c4fhi9WAveBtrCzA7i3g2jdsBCCT75pLVWdbxOrdcHf8n/PVbRxEwSQ8AOmN6UviX+/Gok0/V/LBEPNaEneB0Vqvzxmsqag+oZhGmGW/F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KenfgKhT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KenfgKhT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769254677; x=1800790677;
  h=date:from:to:subject:message-id;
  bh=T5WWV1XnqT2q7BCmNdH1FuGsG6tyIJ1UbD/SNSu8oVU=;
  b=KenfgKhTDShRu9J5AVpk9OKVaZX+qm9b4GO56lioaiVtDP/jmFBnTLje
   zR93E5c3eyIyustWpuyC8YGlC4xoNlkcFy/B8AqA7jrA7ulWJ2Oe8Uzu5
   r0GSqQ33H2sgu+W+NZA76Dr8TFj7JZnJBMu1ECmu/Sw+CuGEzK6yHgj8A
   gQ6jMZO1CySJ2oaTno6F16n5aTPrF8P3OLYISAtLQ+jMEq7q9GYMpWk9c
   3agKwf1X/vyUfJ1gOBfvjA21L5leZExkxl64kEN0RfCfRqn8x1OJRFAq4
   5pmUhXB99aHXCbLUXuohEAl7xQ4ewBzITFJ1aDKyI06bswt1TRQJz72tk
   g==;
X-CSE-ConnectionGUID: KWTu6yOeQvKzaYycrCKoxw==
X-CSE-MsgGUID: ngGNT3vfQIa6xNSexMyVYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70210344"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="70210344"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 03:37:56 -0800
X-CSE-ConnectionGUID: Awn2eGGjTKatVXFTl5VsWA==
X-CSE-MsgGUID: eiwrROBUTXyXHkSb6z5Nrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="238503807"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jan 2026 03:37:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjbxg-000000000xn-3DSy
	for oe-kbuild@lists.linux.dev;
	Sat, 24 Jan 2026 11:37:52 +0000
Date: Sat, 24 Jan 2026 12:37:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 36/47] checkpatch:
 WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute
 nominal patch author 'Xiaoyao Li <xiaoyao.li@intel.com>'
Message-ID: <202601241230.0kvGHjGF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Xiaoyao Li <xiaoyao.li@intel.com>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   4277c23972d92102c257f4d22acd908a47c0d69e
commit: 8c69ce616f4f3dd90bddec3451f0748cd40edc41 [36/47] x86/tdx: Add API to demote a 2MB mapping to 512 4KB mappings
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601241230.0kvGHjGF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Xiaoyao Li <xiaoyao.li@intel.com>'
#69: 
Co-developed-by: Xiaoyao Li <xiaoyao.li@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
