Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC891F4606
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763520050; cv=none; b=uEslwoIApD9jWGfev9FKl0W82Xij0PO+TnTHo4uSuua+j93b43o1Vcll7ZVX1am8tu3kuDWFINau755mMqtrENncPA4p4hcRlDF6hApFLpH/hNwGQ6vdT/Y7weV1aijIPlZC1yBqMoNVS+xfS5UeLg+K147I2cmxGzViMIIRv0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763520050; c=relaxed/simple;
	bh=LTqfDtSL7DKO9lD5ITcv37yh4J6E4v8PbyPigDLv2CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lyCaE3xmD+1cWqPJk00Cs4hJozKjEmv+/bAYdX7T5audL/gHIc2mgnhp1ImYimCWQsfC98Mr7a5qrGEEPb3+TvTiuQlwG/CcbwMJ4+EnAaQKW8d4eyjGdkg7eGxUnZbC1NbMC9ztdVSMn/jXL/Vbyi21q646cQIclgOvJhCi2d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mth2N9y4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mth2N9y4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763520048; x=1795056048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LTqfDtSL7DKO9lD5ITcv37yh4J6E4v8PbyPigDLv2CA=;
  b=mth2N9y4XV6gA1PyRNmlpd9LkPyEOb1JS1i8jmlR03lz9RZud+91WTb7
   7R3USFP4BUIm+6u65WaZqFGd3qtmu2MmEUkgn5PET+GpPu9XIJQDzC1LF
   D/e9PEUoelziRAEaGTG+2iWJpp8wIEIzIvcuHhGfHdf06nqE6Ll3UTv8M
   SGhITn26u/UZqnH2n+z0v1qpqtP/NhIs6ym6U+rRN9hKhsl6/+A51/vfJ
   vJ+VGYBAzlB/poJmUn9UFUDFWvWb824R5W59x/T3PXzzUIBqDBV58VihH
   FHp1a/FwF3oigCEd5RsCNK48IwstcxuESMEfZFQLORxD7cK7cfI1RbZ01
   A==;
X-CSE-ConnectionGUID: AzUfxMvPToWlQmQssdzanQ==
X-CSE-MsgGUID: ahkotV/lR++ba5g+/q7MKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69406312"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="69406312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:40:47 -0800
X-CSE-ConnectionGUID: 0dCqW/u0T3G5GVGtADODKg==
X-CSE-MsgGUID: +EVtSeg1RE6xK9uOx7DmyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191173885"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2025 18:40:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLY7g-0002ND-0f;
	Wed, 19 Nov 2025 02:40:44 +0000
Date: Wed, 19 Nov 2025 10:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: crypto/ahash.o: warning: objtool: sg_set_buf+0x5c: unreachable
 instruction
Message-ID: <202511191027.VS6HhXJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8b690556d8fe074b4f9835075050fba3fb180e93
commit: 9d7a0ab1c75365158b28a5f7fa516061ea40b1b8 crypto: ahash - Handle partial blocks in API
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251119/202511191027.VS6HhXJX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191027.VS6HhXJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511191027.VS6HhXJX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/ahash.o: warning: objtool: sg_set_buf+0x5c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
