Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72613FD86
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Mar 2025 06:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743314624; cv=none; b=Jw/r4tXFkc3E4kmnTRJlAHiqBlMTJhqCbUHEA3Ya8A1tUh6/4EpRIPbTLae08jSYeaEUmUT9BbuJIRhbZhjBp8mF5QAV+8G0wAHr4jzbUvSNopubvje5aCCyzEWhezRO4k5vImx6z/WBEChtN1JO4REUlFY++fW2FXtP4NPmD7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743314624; c=relaxed/simple;
	bh=FIKMfX+pBd/TtPgV3FpaulzJ+B38PxWaMhS2qk4xqek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O0zQQEyeX/xoQTi+msllO/y+Xjwx+CJbapUKzP4njNfgxYhiwwYF/RhWCA5P+3+A+Nsne0L6rGVsqFAu08pHZdooiG6gdKMJ5EGL6qPHvhkPjR40GaUQrQkffJ1BFlXEyH35oIybwU0Mccnw9mlZPn5oigFKSk+piur4SPH+7D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtIKIDt0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtIKIDt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743314622; x=1774850622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FIKMfX+pBd/TtPgV3FpaulzJ+B38PxWaMhS2qk4xqek=;
  b=MtIKIDt0pW2U5EcajNfsMFcmRmgzUYNexk3xkEkBjrdhNWNe04ay0wzy
   4+/yMwlnPAjLckncDvBu0I0HHZ6YkqKy41Zf6TUTiXU38T76uoPV/+Z9B
   xiher6YHQwbLF4DT0V4179jwE7JB3JH8eeOY60hAl6rZZYlm/Q3T0AiCr
   xEpSmSJZt2+qzeIjz2p3MEFauUrR8dyme3NYx+WUfArs7gM0MaGsXCoDy
   /3BPgUYueZ3FbtdnnaQDwq9NLOSjCoBFGCvw6s1DOPPqQxyYLXGf9WlrG
   t4Gefcno07fAJr22ImUnwSuR33i3r+ApnnD9k+8xmopWvrBxUSvpECQtP
   g==;
X-CSE-ConnectionGUID: 85kk9rxxRwW6AKWtOIhfHw==
X-CSE-MsgGUID: OywCBiSXRv6N+9KC6toKgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="43877528"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="43877528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 23:03:39 -0700
X-CSE-ConnectionGUID: /4SVzW96QPyghdFuOxmelg==
X-CSE-MsgGUID: J0APLBz1S7u7ePsfxRDt4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="130507311"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Mar 2025 23:03:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyllg-0008XW-1z;
	Sun, 30 Mar 2025 06:03:36 +0000
Date: Sun, 30 Mar 2025 14:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 6/6] super: add filesystem freezing helpers for
 suspend and hibernate
Message-ID: <202503301305.wiPCA3TP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250329-work-freeze-v2-6-a47af37ecc3d@kernel.org>
References: <20250329-work-freeze-v2-6-a47af37ecc3d@kernel.org>
TO: Christian Brauner <brauner@kernel.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on acb4f33713b9f6cadb6143f211714c343465411c]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/super-remove-pointless-s_root-checks/20250329-164716
base:   acb4f33713b9f6cadb6143f211714c343465411c
patch link:    https://lore.kernel.org/r/20250329-work-freeze-v2-6-a47af37ecc3d%40kernel.org
patch subject: [PATCH v2 6/6] super: add filesystem freezing helpers for suspend and hibernate
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20250330 (https://download.01.org/0day-ci/archive/20250330/202503301305.wiPCA3TP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503301305.wiPCA3TP-lkp@intel.com/

smatch warnings:
fs/super.c:1187 get_active_super() error: uninitialized symbol 'active'.

vim +/active +1187 fs/super.c

08fdc8a0138afa Mateusz Guzik     2017-10-03  1178  
1bd87d01c81377 Christian Brauner 2025-03-29  1179  static inline bool get_active_super(struct super_block *sb)
1bd87d01c81377 Christian Brauner 2025-03-29  1180  {
1bd87d01c81377 Christian Brauner 2025-03-29  1181  	bool active;
1bd87d01c81377 Christian Brauner 2025-03-29  1182  
1bd87d01c81377 Christian Brauner 2025-03-29  1183  	if (super_lock_excl(sb)) {
1bd87d01c81377 Christian Brauner 2025-03-29  1184  		active = atomic_inc_not_zero(&sb->s_active);
1bd87d01c81377 Christian Brauner 2025-03-29  1185  		super_unlock_excl(sb);
1bd87d01c81377 Christian Brauner 2025-03-29  1186  	}
1bd87d01c81377 Christian Brauner 2025-03-29 @1187  	return active;
1bd87d01c81377 Christian Brauner 2025-03-29  1188  }
1bd87d01c81377 Christian Brauner 2025-03-29  1189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
