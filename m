Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E0286898
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437810; cv=none; b=tw9/AeL5f0GGSH1S3MeQoZHmfHQGuXXoapsNv8TSpLuL7AAkvqwaRTxmxG/VoNfeHRSqODmCcNBfejeZ43OXzxhn8cSvqVfpGnIibTFbMyaflcEBmO7Yfv7o/xn5iiW+5zlXhrSj+RFyNDYALCZtiKzqaU9ehE/vOTNjfT3/3Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437810; c=relaxed/simple;
	bh=kuqjdkOJPnVSTkDQjh+b2efJHdsPzJNvN8ym3tfC/ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GDRxe1FaoWlJ8x920kXCLOePylJzXYEe4g9C5gw0X73dfSyZfFI2rsgJe0cE+SwaqljpqvD81cTjNmJmDnMfg6y+tBC0d6hDMTPKdndWbaNV6KpmY2hXXCoHuYHZn0t5fTe4328hnCODJeJYG5nq7LtlScz4a2iYpNb1uZ0TPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYo4MuJN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYo4MuJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748437808; x=1779973808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kuqjdkOJPnVSTkDQjh+b2efJHdsPzJNvN8ym3tfC/ww=;
  b=eYo4MuJNbGJqrzsVs8dg4tH2m0RUAg1fwLUf4MOS3IDdP34gie6uO9at
   K25wmV3aBVmhHFlmFOO2XkWu4og3JSaXThFFddUmAaxmuYRqq98YOLCwd
   f3GuLeabMHHDWEg8CPYzh+7jIfthrG7tAL6pK93P09xukW6ChzWUwuYlA
   L04HY7mtavrDp7ciwinKG+sZhVzCmypyosQVKNt9RqBaXxsmezlynh7ax
   VUJCB/BFQeOmPFqi1xFfwl3YyK5TB2Cid05UzegcFtVIaGw3W4G2tjnKt
   zOH2lWO0W7yeDli9+MeagvuQaiZo+749dy7K5TmFBXDCENlVdEp3RafGY
   Q==;
X-CSE-ConnectionGUID: HY0LZhVhQ8WIGp61GpQKxg==
X-CSE-MsgGUID: Jo4MIOQBQDObgzF/otEgkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61122019"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61122019"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:10:07 -0700
X-CSE-ConnectionGUID: +ngOMeNIR9+CZFs6iAHowg==
X-CSE-MsgGUID: jlIL3ZUnQ/e7xe85LTyLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148276479"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2025 06:10:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKGXk-000Vg8-10;
	Wed, 28 May 2025 13:10:04 +0000
Date: Wed, 28 May 2025 21:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/6] kbuild: Move modules.builtin.modinfo to another
 makefile
Message-ID: <202505282010.7mkEeiON-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <1910073cfee59df4a3edb7f724214eeb4b8a3faa.1748335606.git.legion@kernel.org>
References: <1910073cfee59df4a3edb7f724214eeb4b8a3faa.1748335606.git.legion@kernel.org>
TO: Alexey Gladkov <legion@kernel.org>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.15 next-20250528]
[cannot apply to mkp-scsi/for-next jejb-scsi/for-next mcgrof/modules-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Gladkov/scsi-Define-MODULE_DEVICE_TABLE-only-if-necessary/20250528-020814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/1910073cfee59df4a3edb7f724214eeb4b8a3faa.1748335606.git.legion%40kernel.org
patch subject: [PATCH v3 5/6] kbuild: Move modules.builtin.modinfo to another makefile
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-003-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282010.7mkEeiON-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282010.7mkEeiON-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505282010.7mkEeiON-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'modules.builtin.modinfo', needed by '/tmp/kernel/x86_64-randconfig-003-20250528/clang-20/0f04dfcaa62efc3a521b20ba0b39b2a78c4389db/lib/modules/6.15.0-rc7-00019-g0f04dfcaa62e/modules.builtin.modinfo'.
>> make[3]: *** No rule to make target 'modules.builtin', needed by '/tmp/kernel/x86_64-randconfig-003-20250528/clang-20/0f04dfcaa62efc3a521b20ba0b39b2a78c4389db/lib/modules/6.15.0-rc7-00019-g0f04dfcaa62e/modules.builtin'.
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1909: modules_install] Error 2 shuffle=3457807955
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3457807955
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3457807955
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
