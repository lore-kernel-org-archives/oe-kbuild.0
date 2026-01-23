Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF036607D
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 04:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769141329; cv=none; b=ZD4yyFV6WoR4/gTRRAi1mUce/mRZo9vurvOuIk5+fh8p7VCqYn0cDE1CDJJXq63VkexQWjLjOlUgGeN5yEgXlFvyRht5mbaszMbjtZ6BGvGX6RoJoSuZBdg3kagI1gguzAIi+wLzZsG16f84NWtt+/b6Fhsm8BsMXKQAsz1jZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769141329; c=relaxed/simple;
	bh=AveJk5Ggie9h64omIHYzlnX3Vbf5ngzC6kl4JwoCS0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TvqE5ombxNmDz16NtSthNIbZ4pNz00DKnkd2Kw84lErXc8f3RB8KEN4sReT4sO6CoXYVE9t5OToZ1idU6RVAf71JBM4ZKFIvVnnbR+J18HvlWtMEw/CL78YbOYP8WDLZ4CquFf92HCsXAQmceAEGKq9Zgb/3p+gYBwUKEB2lAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiNiHRtn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiNiHRtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769141319; x=1800677319;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AveJk5Ggie9h64omIHYzlnX3Vbf5ngzC6kl4JwoCS0c=;
  b=eiNiHRtn/WzaVEtyPrJ/NMi4QryG57kECQBv+OZVGhBD5wakosS09M3+
   AxLmIOZO3BtK9FpUeEb0SLiqdK5GmMQM1n7gNJGkNIuFMf6BwPPgmDuU+
   YoKNG2+tt333U1LYn8tNsLl0HGUzMLqaNnBw3tYF9ApwCcb9IAKiBYSCj
   93Urwkl1sDyrVYYly11MFdNf4fYEob1luju31nYL6mukV5Sl5Usxe5ihj
   uut3BQSmH1cqz2gWfn11X5VSOFKFEBqu0kNsy8xp1d6xXPfbZc5N1UQO4
   aRS0SI9iXIKFQC2OvwbqiCPiQeu5s5BxX4QLrmxWeQG1r2Oe12c8h0tCw
   w==;
X-CSE-ConnectionGUID: zPVa1okVQJqeyCWGAB7fUA==
X-CSE-MsgGUID: WK7BnJBlRPu0MEzEYrj9ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70303054"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70303054"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 20:08:33 -0800
X-CSE-ConnectionGUID: YQXlaXSGSPWjfT3In7kTog==
X-CSE-MsgGUID: Zvu+X/ExQHu2raSSeLqjvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207183118"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jan 2026 20:08:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj8TF-00000000TUw-3wMU;
	Fri, 23 Jan 2026 04:08:29 +0000
Date: Fri, 23 Jan 2026 12:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:timers/vdso 15/17]
 arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
Message-ID: <202601231123.SAEQw4lP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dynamic relocations are not supported"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@kernel.org>
CC: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/=
vdso
head:   bbef8e2c29c32f048fac8e07f884f827d028f1da
commit: 759a1f97373f25770cf438d9fb5f2bddf4d77a54 [15/17] powerpc/vdso: Prov=
ide clock_getres_time64()
:::::: branch date: 5 days ago
:::::: commit date: 9 days ago
config: powerpc-randconfig-r111-20260122 (https://download.01.org/0day-ci/a=
rchive/20260123/202601231123.SAEQw4lP-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260123/202601231123.SAEQw4lP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601231123.SAEQw4lP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supp=
orted
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/=
vdso/vdso32.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because =
of errors.
   make[2]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
