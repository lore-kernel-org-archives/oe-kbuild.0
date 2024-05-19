Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C338751009
	for <oe-kbuild@lists.linux.dev>; Sun, 19 May 2024 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716140218; cv=none; b=g/aSh7XQg3eB9ENdh03PVSuNpS9gee4ZaxQcqjVFXM6BGoHctnwDxVawSMu66jjfSZz9shveAKcjynh7OypmhNqKXGoX/cDo8C42bXTouvhELhlHF/Ex/mJU/eQpOV5QMXB0xiTgLzxD8jISR4Xtei7/0OoCiWwmW3TIQDfZuX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716140218; c=relaxed/simple;
	bh=vr6A03sP1WarjhBKF9Zw7lFBKYB281kRf66B97zNyTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PqLqGKxlT0iCEhx0eqxowyayL/0EYYO11dq81yTzWFrjsrP4h16qyfWXCDM8Hcxa8oFFPr7IVn4B+F8jItJYkn2f8JViBYhBgFpdmnehQvJSRy5tysAHWLhGXwO2TUqQYbj0psynytk1Dhf2ay285A+du0ZUMuzy4ilCi4ss5UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPkvujnz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPkvujnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716140217; x=1747676217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vr6A03sP1WarjhBKF9Zw7lFBKYB281kRf66B97zNyTM=;
  b=WPkvujnzFsiO1MKIHGORQXge12oJ7f2c3PUlzsygKcGLPjouSK9irM33
   ZHVjVRFlZWOA7YKzlmFptgByHAiMAL7d0UDk4taey5qbm/JrAvZa9yr3j
   xBxerLWJDm/qg+VP1oCJiF3G99F3ycbi9To+62xIi82SL9gbtJIfNMiLN
   LXYUebydjyq2RWIiDMxrk7PFjLazP4t1zoeXN+Wg6hO4w0XC3vmBHwVzc
   nJIygQ7agT7iczbZXVkOCgmG7Vd2FrSR2IN/k3IVf4Ght2FhSUUXdllyu
   g2n3LP8HqtLrg0ryi1T2Alwio4nfs/oQLPZsGDe/G/JA8e4rBRCpHL5W6
   A==;
X-CSE-ConnectionGUID: O5tK+HgDS+eLPow2qDdVDw==
X-CSE-MsgGUID: MgS3Lp2ZTluagCkDQtcV5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12111895"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="12111895"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 10:36:56 -0700
X-CSE-ConnectionGUID: XGQQX5OgTRWNLxfC2PvM9A==
X-CSE-MsgGUID: wBY7LsnWTCqqxNWBaSl3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="55527726"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2024 10:36:54 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8kSr-00043s-07;
	Sun, 19 May 2024 17:36:53 +0000
Date: Mon, 20 May 2024 01:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: internal error: arch/alpha/kernel/core_marvel.c:815 SQL error #2:
 near "and": syntax error
Message-ID: <202405200141.lo4IWBGr-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   61307b7be41a1f1039d1d1368810a1d92cb97b44
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   13 days ago
:::::: branch date: 73 minutes ago
:::::: commit date: 13 days ago
config: alpha-randconfig-r071-20240519 (https://download.01.org/0day-ci/archive/20240520/202405200141.lo4IWBGr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405200141.lo4IWBGr-lkp@intel.com/

New smatch warnings:
internal error: arch/alpha/kernel/core_marvel.c:815 SQL error #2: near "and": syntax error
internal error: arch/alpha/kernel/core_marvel.c:815 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

Old smatch warnings:
arch/alpha/kernel/core_marvel.c:614 marvel_pci_tbi() warn: statement has no effect 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
