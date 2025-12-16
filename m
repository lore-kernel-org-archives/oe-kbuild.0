Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8612C3252
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765900222; cv=none; b=UE7yslOB1Zl/f9whHZcC/L4Lby8YqpnmqmwvSYLQkWox3zDvieXMCdpHxfTGG82r/r2cbpK6AE4gdZp2hYhhdjOuU1WQxdJMY9HZ2Z82Sf5UkdbW4Arsz75meGDbyrXRu7VTsJH/err6ggblhN2DhbiUJgqHPJh0Q1f04SkQesQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765900222; c=relaxed/simple;
	bh=4Wx4tqiexymV+gEUJKFhseOpbY87tMnZRzgaVOYZuJk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f84u+yWGYbsX1VpXsEQOgtcpyUbf9+QzzA6rwtKu+UuGcc2JW2t/pSiRzk3NrY7e2C7gWHZIdScCPVyMUAqDqwWR3nMojVsUokSd32bMPD3XW4SbFLOnEy763MVTK5LbpVIFjiRna3LvkXah7J5XkvtZOhackMSUWjouaXSszk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iH/17IfR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iH/17IfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765900220; x=1797436220;
  h=date:from:to:subject:message-id:mime-version;
  bh=4Wx4tqiexymV+gEUJKFhseOpbY87tMnZRzgaVOYZuJk=;
  b=iH/17IfRmKLWY7rAUSi9g3Q48sWB+STsR01Kakon7jSQ2yRpe2PvNj2a
   p1pzLSG/mzDbBLZz5O5HM6inMhMWBTNW0NtALmiZIphCSM54gVVJKWmkv
   B9fCXqSXtJXJQ9YroD5QSIR/NNIpH4podNkbPCuHeHoF51IjNfJLytpw/
   GBY2d9zvqv/ru4WY4NN3qlL2DdoejotteDEaRRbQFK1RqmiJHwCOZdFQz
   7qWFL+Lq5jyzB2XUbq6feOQ3pDo0xh6+fPkUT0PPNZdWeP5GLcFKjh/Wi
   UMgKB44rk4b3oaqYjP+PHC2+yRR2IJ2S5oLMvQl1tAevdVgyW4voujkS/
   Q==;
X-CSE-ConnectionGUID: XXL9t3NPSl+n81WA+dcKlQ==
X-CSE-MsgGUID: 75ZBHs3RR2CZYXwodXprpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="66808568"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="66808568"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:50:20 -0800
X-CSE-ConnectionGUID: JJKvKwLRQyiD7DjNgx5s4Q==
X-CSE-MsgGUID: vtk0O59OT4qnbNkVVNfaHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="235438284"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 07:50:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVXJY-0000000039k-2WVD
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 15:50:16 +0000
Date: Tue, 16 Dec 2025 16:49:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.19-rc1 10/13]
 checkpatch: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202512161615.hujnfKmo-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.19-rc1
head:   c5dbbed8f81c183bdc77059ec990829129c3ae7a
commit: 57d775e01f7ef93243035f7a6404611cc159e2a1 [10/13] fork: fallback to global store of stack pages
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512161615.hujnfKmo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#78: FILE: kernel/fork.c:367:
+static struct page * noinstr dynamic_page_pick(struct page **pages, int no_pages)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#95: FILE: kernel/fork.c:384:
+static struct page * noinstr dynamic_stack_get_page(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
