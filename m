Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8330B3C08F
	for <oe-kbuild@lists.linux.dev>; Fri, 24 May 2024 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716575202; cv=none; b=ZajqomwlNyw4myDGh13IrTP2+/iDlbCuEU0VoMILYRyuUqMRb/4dHUm2VjFLa7GrQf43epvG9zT/8P/yAIaGt+eD6nPKM9mycU9XVlXl5IwZpvzUHD2WDI8n0GsqcQx1aGXL7Whcs8vocRw7U6utEyou2Tzj9oij+vSq0HlfF+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716575202; c=relaxed/simple;
	bh=DeoyDZth16DiCQLFaBTF9J1PGfB7VTw3lQwx5q72uoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHHAIa6ub+pS91Za3TDGPH9aHxoEFPKYQggVh96bY/7+yyDMn8Cu5zxIDQtXWBs/dC4ga+v6kTytBht0x7bryx4RbFUnn0G1B8SbCgQrMnUe+twlena6dBWBsB5aG18eP+9nTKEm3jYSegJb5BMdwR1ndZJ2a9ql6Py6rEQ8pSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fS5PSSrH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fS5PSSrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716575201; x=1748111201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DeoyDZth16DiCQLFaBTF9J1PGfB7VTw3lQwx5q72uoM=;
  b=fS5PSSrHmOntMNRJKJ6wXeEdbdgWSi3z9ShQfqYFXtha7oP7361WWdxZ
   uF2RK8Ff3uLOtWSUOBXuT67mzTte9vI2oyQezurXR9LpxXtEu6aDZq0oV
   fNWP+kTb95WBmRylyMlv/gJT3LI7HjrHLqHgwNWNdprUsskQA8FePcdLx
   Y6aawypweF0z/cIwRl/8QwhD70e9bz28nXr2iGwWUbQBdnBlGejbfzomg
   dModN3JdwjJNWdEahr6S0XKtgXN2onlgIRuaveNN7szfFd6DD8uuFAPHw
   +97Xi+3ocazst14M4Sab0heb0RPe1cls1wHIdQlJRfNnwPSK/LJZOtuym
   g==;
X-CSE-ConnectionGUID: Nl3FR5OfTTeQN+DZh4I1gQ==
X-CSE-MsgGUID: Quaz1TmHTtSGs5a4zp/fAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30474644"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="30474644"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 11:26:39 -0700
X-CSE-ConnectionGUID: /TZL9iQgQkuOKEhr4gqe6w==
X-CSE-MsgGUID: AGxVyZr9So+iluBupc+Aqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34119467"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 11:26:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAZcg-0005n7-2w;
	Fri, 24 May 2024 18:26:34 +0000
Date: Sat, 25 May 2024 02:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 6/6] module: add install target for
 modules.builtin.ranges
Message-ID: <202405250226.GFChHcfz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240517042839.544650-7-kris.van.hees@oracle.com>
References: <20240517042839.544650-7-kris.van.hees@oracle.com>
TO: Kris Van Hees <kris.van.hees@oracle.com>

Hi Kris,

kernel test robot noticed the following build errors:

[auto build test ERROR on dd5a440a31fae6e459c0d6271dddd62825505361]

url:    https://github.com/intel-lab-lkp/linux/commits/Kris-Van-Hees/kbuild-add-mod-name-file-_flags-to-assembler-flags-for-module-objects/20240517-123517
base:   dd5a440a31fae6e459c0d6271dddd62825505361
patch link:    https://lore.kernel.org/r/20240517042839.544650-7-kris.van.hees%40oracle.com
patch subject: [PATCH v3 6/6] module: add install target for modules.builtin.ranges
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20240525/202405250226.GFChHcfz-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250226.GFChHcfz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405250226.GFChHcfz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'modules.builtin.ranges', needed by '/tmp/kernel/x86_64-rhel-8.3-kunit/gcc-13/97130a675f5d4a72b7effe364f516c942a723ec8/lib/modules/6.9.0-rc7-00006-g97130a675f5d/modules.builtin.ranges'.
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1827: modules_install] Error 2
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
