Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278B1D7E41
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 04:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777782967; cv=none; b=U9PY2jwwJyamqQCz5a6MnHxco1pSsGqNlmkhGRw7qXG31uu9aCiIXYhaA0BnOG3kgEn2nmxxHlj1O26UUK+xuHiDeLznmPqkMbNkZlp+zWKwB9C1S0NO82yQW9C1o1Ch9K7PTI/FEFtYQn+ZBioUN5Dw6QyExeZBcD+TCy3cFx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777782967; c=relaxed/simple;
	bh=CeoIDBd1J2cg6HWVzSldhnC3rzN9todCVwu5Y88OI/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OkrFcH5ncnIXLZmGpZfJ1SWQHgWBTzKdUIN/9dPLIhLT0EOqCi1l/tJJZ0zIM8bi4KJVAowzs38OrnW+BntfHgaIyVSwKp2+jRl9u+Id2KXWPQA0+Yz1b8JFVKnIFBG1AFBsQip8xesSwl4L5UE3hKVqONXkuaNObWOFOfNUg5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mC2lYlX1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mC2lYlX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777782965; x=1809318965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CeoIDBd1J2cg6HWVzSldhnC3rzN9todCVwu5Y88OI/8=;
  b=mC2lYlX1Plr6S3yWu4JZ8etBnsXGLBJHkSIfXhr2XHAxODhFsaMmEKa8
   X+9CRAisvC6EQSiwyifadHmvXlhEpfJY0X1NHsyJbmIcQw1D08IKE1T5H
   0Mhzirno7tCt4UQCkWQJL5cJ53Mr6RWqz6o52OgJ5RM0l3xtUKtbjLAkJ
   XnKcDOV75H1ePBQsBrDvvPSeNmQGhksxQ69bw4c8Zgf1gUrJK3JKol9Nw
   +/dXTlQRSe7GhbLfTo+2bm36pnylJi3xQ53ALwfihejOBa183XbsxYxZj
   G2EuvDbrc6ytn5hXnmo9CfFNwc9p3qB/gJupuo65mAdVRjAHIFiLmsoJL
   Q==;
X-CSE-ConnectionGUID: xK7qg1DkSJuvKb6zhfO9Xg==
X-CSE-MsgGUID: HC/bzo1qQ7CL1mNdU2owoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="96113301"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="96113301"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 21:36:04 -0700
X-CSE-ConnectionGUID: dzZFkE19SpCtw/R4tjvq4g==
X-CSE-MsgGUID: UpI2yVJ+S/qthU0qUl9Scg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235284949"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2026 21:36:03 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJOYi-0000000029P-3hLD;
	Sun, 03 May 2026 04:36:00 +0000
Date: Sun, 3 May 2026 12:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
Message-ID: <202605031249.FM3r5TyX-lkp@intel.com>
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
In-Reply-To: <20260501160800.4043276-1-shuicheng.lin@intel.com>
References: <20260501160800.4043276-1-shuicheng.lin@intel.com>
TO: Shuicheng Lin <shuicheng.lin@intel.com>
TO: linux-doc@vger.kernel.org
CC: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: linux-kernel@vger.kernel.org
CC: intel-xe@lists.freedesktop.org

Hi Shuicheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuicheng-Lin/scripts-kernel-doc-Detect-mismatched-inline-member-documentation-tags/20260502-081921
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260501160800.4043276-1-shuicheng.lin%40intel.com
patch subject: [PATCH v2] scripts/kernel-doc: Detect mismatched inline member documentation tags
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260503/202605031249.FM3r5TyX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031249.FM3r5TyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605031249.FM3r5TyX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/ov9282.c:223 Excess struct member 'mutex' description in 'ov9282'
>> Warning: drivers/media/i2c/ov9282.c:223 Excess struct member 'mutex' description in 'ov9282'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
