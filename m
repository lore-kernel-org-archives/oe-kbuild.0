Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00930BB8F
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652572; cv=none; b=YAyWADd6W/VtnN/KZQjlJ4F3AiJpJsjImHXitVRqnCjVRuxPXbR5605GeIMhwhupqqtt/xOlRT31gIHLBjd3xUF3oEtXXB01stF7Ag7uTV0ECoKidfT14mSkCn6By/qdXcqmje3GR14Q8hlN2uIbi8GOSN8vic16qf0ucVPyT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652572; c=relaxed/simple;
	bh=WK34La5ULZsn18whZQOYbmx/3a416rJXOHueOIsTSjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bFX4I/kd8OQPfCiyhm5IarrTRp9XUMnAMXj45LYRApNYjGqLWLke/Z23BJlLwT4gtffcK49+q6nC+kS+NT1bOkPxfgHW/Jt5/iFrf7vIXxn31qHH6qN9CGiyq7UUbVC69lke3+mtBp4gkr8+mP3ku2xRuAp/vJf/Pdm4ZtsiLv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRp1OWoK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRp1OWoK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763652570; x=1795188570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WK34La5ULZsn18whZQOYbmx/3a416rJXOHueOIsTSjE=;
  b=ZRp1OWoKR0p7PNwoYqODFmAf1Mtpvg1X3Ad+a0AB9sN668axDSbzYsku
   RWmQtePbszpArCQDeIc/txAwGLHbCTebKjuBrFP55/TgAi3xzx/onNish
   x1gDxi1G1jpXecr6NsN0cp5W53mnw97ad8d6htYhVrr2suSl0oKiTOWS5
   EmNPJkSRHhZUZ5RWRWxPqf2Y5XzMswXL0wULrjvF9KZarzCC1W7rVFggT
   0kqsBu2SCiwgzE0jOPQ2ot3smRTqMcnoLLilxA//YPdCFhW0vsIWUwVVo
   Zv151ON0mMos1m5eYJvjxlH7fTPC/vLN9bANFHwtavBTVroqCaKw9HuVP
   w==;
X-CSE-ConnectionGUID: 64PHw6WIT1S9zi9KE9bM1Q==
X-CSE-MsgGUID: VrtuD/E0QIi9r2a0RHH6pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64733747"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="64733747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 07:29:29 -0800
X-CSE-ConnectionGUID: 6XfQEEa8QrGKdjuGXkrDJQ==
X-CSE-MsgGUID: A9RQvbNjTnyNyzLpzEC1WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="196371070"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2025 07:29:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM6b8-0004BX-2C;
	Thu, 20 Nov 2025 15:29:26 +0000
Date: Thu, 20 Nov 2025 23:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] kbuild: fix compilation of dtb specified on command-line
 without make rule
Message-ID: <202511202330.fSUeokem-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>
References: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>
TO: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
TO: linux-kbuild@vger.kernel.org
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nicolas Schier <nsc@kernel.org>
CC: linux-kernel@vger.kernel.org

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on deab487e0f9b39ae4603e22d7d00908ebfc9753c]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-De-Schampheleire/kbuild-fix-compilation-of-dtb-specified-on-command-line-without-make-rule/20251120-220837
base:   deab487e0f9b39ae4603e22d7d00908ebfc9753c
patch link:    https://lore.kernel.org/r/20251120140645.478623-1-thomas.de_schampheleire%40nokia.com
patch subject: [PATCH] kbuild: fix compilation of dtb specified on command-line without make rule
:::::: branch date: 75 minutes ago
:::::: commit date: 75 minutes ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251120/202511202330.fSUeokem-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202330.fSUeokem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511202330.fSUeokem-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/openrisc/boot/dts/dtbs-list', needed by '.builtin-dtbs-list'.
   make[3]: Target '__default' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
