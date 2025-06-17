Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4192F5302
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 21:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197327; cv=none; b=ZVXKlpJhlx6vZDzGmSMc2825XH6OF2Caj5w7IOfmtyd+hRazrKyzC6OzI77114bsVdjrsoB14tqWmfcGqYWdjZY9S0qJEvB+keQEsBfwipy+P2levqXFuaYYm92LvU4SuTMcSm+s6fhfdrlSUPM+lbLTsQBn1jW/7cJpwK+y5Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197327; c=relaxed/simple;
	bh=/f4rrWFboYOUb3oZX3OFutFIKP1feKojNBnB9LNmCJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5w/+C6khl5r9Mba4GUDqUcVngtoAvIqZoUR4kW7Wdkizf7i9fEkNaDCh07wUOse5FIZ43Jw5N5kRkrDJPSl5DEuHjZ6elqv/TK0Rd2pc5BuUO4Zu8f06q6BiSj+RPxHbpPKveSOEmiSq/bNngd5/GfxwRok4gzH4erLq5sVXS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ahfisyo8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ahfisyo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750197326; x=1781733326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/f4rrWFboYOUb3oZX3OFutFIKP1feKojNBnB9LNmCJY=;
  b=Ahfisyo8J47R8SRdzW8sX3RxMGGQnIbxtsHuqL4nUbB1/EpCE17doQiA
   ZS/85YV29e+pLe8tO3Q91K+CsJ2BTP7K20MTMb8F4A6DBfE3nOAWIjHZS
   61AU2wNY8NYNcWKruuAg4hmv8Htb4XjNN5RE3jV9iCnNb1rX3PDdu9rDK
   uSACtVSt2O4JlnYnTUb+y8G3x6hoDaJccgWrwUIXonDM4r/giKTPcw4/U
   c2vkZ01IwU+bRHKEhSBrovAzHnjP7I80/16Y49HDqN6VwsKXvlqubdCGL
   9rSIYnZ/Lgt90eh2dUYTS3O2lgvPoo/PDXKfmpbA+A2Fj7+1GeWo0wAvm
   Q==;
X-CSE-ConnectionGUID: RZa9851SQUuLok3Wp5+CWQ==
X-CSE-MsgGUID: 7UH6krB9S3+EMBritKcG+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56198253"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="56198253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 14:55:23 -0700
X-CSE-ConnectionGUID: YJgq4o8wTeGdXMCaLlZfxA==
X-CSE-MsgGUID: Ea//7RPWSJS51uxqVnSQUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="152873299"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jun 2025 14:55:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uReH2-000JAY-16;
	Tue, 17 Jun 2025 21:55:20 +0000
Date: Wed, 18 Jun 2025 05:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sverdlin:snps-trng 9/23]
 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb:
 /soc/reset-controller@3003000: failed to match any schema with compatible:
 ['sophgo,cv1800b-reset']
Message-ID: <202506180522.m066nLBP-lkp@intel.com>
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
TO: Inochi Amaoto <inochiama@gmail.com>
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>

tree:   https://github.com/sverdlin/linux snps-trng
head:   21e232768cb64142db24034d3dceffbc48c2447e
commit: 2634d7a3694b04294e85c039260809f2c59503a8 [9/23] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250617 (https://download.01.org/0day-ci/archive/20250618/202506180522.m066nLBP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180522.m066nLBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506180522.m066nLBP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
