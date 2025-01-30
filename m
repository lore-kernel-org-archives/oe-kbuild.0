Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131292AE9A
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jan 2025 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235785; cv=none; b=n7N7sXlfPxF0c2tivDC5q8s9rJeOGZo727ZohB+eT0gsvK/IMPw6xS8HJLZy7Bb7sdOanEPI0AooPcdeV9Bc5yepwF2MTEzJJkGz76K/kktgwRSKt2GS+zubM6lUVFeCsXOzB4qiZKmtrppwNUPSpGWq0peE66hQI0gUm2rw06Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235785; c=relaxed/simple;
	bh=9kZXY8NVSah8lbpCepTCVc0JxoFd5RzoiJensPoRtbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iABCW1QL6QN9zGptj4pvx2JY61ENtzTTfDmV+ut1NjxY6PQA7vvw/af1Tw49xepRzijjUegmNzTByEGVaGh/Jm2q3ajBjeBejI6U3P1Rn/B9u9giyNbmOpGFEnvE8QV7Ys5t5TUMO6tRxqG1//5dXboiQlM2gs3uYgFPLWw1oOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhCsXuq9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhCsXuq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738235785; x=1769771785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9kZXY8NVSah8lbpCepTCVc0JxoFd5RzoiJensPoRtbI=;
  b=YhCsXuq9w8CUC0yyzBM5NsySow4S9Ap58ziBrLuf8yunqsHxseIHOQeY
   i62L4QoGD629ZYtGVq35zaZKBKGC7SDkDsFx/XTFjbnLR7UkNfgxNGiSz
   wZTWQoeXF3g7rKb7MNEYtOClYdahEDqPC1272t92PxBbehZ1aXlRNyfRe
   W9y5epmpa3TSwqpz2gYQlBqW6mD7ApJi6CJo5IpbZljgtL1CfLqhpn+CL
   7E3nDyYdpzYy8489BuKXOJnMcoU8f0T2mVojULbc/xyFivIJ3ih+xU4AR
   73Py2QOlm1NbWngNe+9icANz+OL5h0dh58hRFBT1lm9QEOMX9pQavjOiL
   g==;
X-CSE-ConnectionGUID: vuSygBOWTAmmGHMvkF5F8w==
X-CSE-MsgGUID: nO9iHdkQT5yneuXGbBcRvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38654429"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="38654429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 03:16:24 -0800
X-CSE-ConnectionGUID: gjdO2bRuT+esV2+aoiQSMg==
X-CSE-MsgGUID: I8FsYP0DRg6NL24Vqpzj4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109206193"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jan 2025 03:16:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdSWy-000jzD-1M;
	Thu, 30 Jan 2025 11:16:20 +0000
Date: Thu, 30 Jan 2025 19:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jirislaby:devel 38/49] drivers/tty/ttytest.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202501301928.nBSLaA9w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "objtool: .discard.annotate_insn: dodgy linker"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   a2ea6ca94c68a7ab616969102e07614d1be0a5a8
commit: 34e336a961ca6b92723a8bed2c79c51e94911942 [38/49] ttytest: add
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-buildonly-randconfig-001-20250130 (https://download.01.org/0day-ci/archive/20250130/202501301928.nBSLaA9w-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301928.nBSLaA9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501301928.nBSLaA9w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/ttytest.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
