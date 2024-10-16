Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAE22071ED
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077735; cv=none; b=dsQxery3KoV193zgdjtrInVif4LqMHnSiCXgX80T7nbw+Bqxm2Zh3vNlNfGj40ondOwGHtCB+IzODq/gElNJPuBS3wO0yuPaRxEpxb7zXtQMpsMvu2ww+BVHllaZlHRB6Ims7/xwavKaSUOHj2k2Bj2SX3zJrLm+++fPcUXUJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077735; c=relaxed/simple;
	bh=3Oa4lcav9ENrgUs9QKiLdEunUGltNQATaiSXlH4Tozc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2nSHkC75PZ7UFvypsNXIx4BF4YFzJDw6wL6/pmSMDOSxtAn3PCi5p58bNk0/7ajWm96cxwrS67YIU1DxsAhZbVuuL2ckHf3tum2P1q9VUa1/7hObHZumnBn3NJac/xw2j8SzJs9uKxy+yzywg9YSn0/RD58qw9gugtt7nBomqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBcKo/hm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBcKo/hm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729077733; x=1760613733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Oa4lcav9ENrgUs9QKiLdEunUGltNQATaiSXlH4Tozc=;
  b=nBcKo/hm1Nbw2K0pT+lDuJGjvG6S7GqpDNj1jCGQgteBaQXxHQDSaDNj
   znkbuvqcKfet6HEN9Dr9QM7H4gE4OoH5dWIjNZ5qk/jjavjtKUM5mcA0p
   pZd0wUvpWb67QORUfCEUwmVWk++7N7M7J9i4n8T7a6WdMvxiQp+rgg05o
   LuTEnutMgClQK1tcPdGSkA9YTloDi/uVvBSUxSkraG08PIXW2QsuMxaSk
   oAv2JzclZSEAjXmK/iikqaAaJLAfbprmQmf3jXv6KlORecR1+eNaZ1c6+
   OlzvQJ7Y1FnNxgr39mwzAvlsRWvAl7rfOhI4JjM6Np/sbgCp7RV1bpQaj
   w==;
X-CSE-ConnectionGUID: EmwrW9rbQOObb5pxpLsNTg==
X-CSE-MsgGUID: 5rGKDUEXQnu81LYiPiXFpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39150870"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="39150870"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:22:10 -0700
X-CSE-ConnectionGUID: ogGKubBfT4eZTJbhDZF6Hw==
X-CSE-MsgGUID: PDS1ui4DRDO+KUb4Q2lmgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83005834"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2024 04:22:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t126R-000Kpr-0f;
	Wed, 16 Oct 2024 11:22:07 +0000
Date: Wed, 16 Oct 2024 19:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] kbuild: Restore the ability to build out of tree dtbs
Message-ID: <202410161857.7osnf6AX-lkp@intel.com>
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
In-Reply-To: <20241015212830.3899891-1-chris.packham@alliedtelesis.co.nz>
References: <20241015212830.3899891-1-chris.packham@alliedtelesis.co.nz>
TO: Chris Packham <chris.packham@alliedtelesis.co.nz>
TO: masahiroy@kernel.org
TO: nathan@kernel.org
TO: nicolas@fjasle.eu
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Chris Packham <chris.packham@alliedtelesis.co.nz>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.12-rc3 next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/kbuild-Restore-the-ability-to-build-out-of-tree-dtbs/20241016-053034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20241015212830.3899891-1-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH] kbuild: Restore the ability to build out of tree dtbs
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20241016/202410161857.7osnf6AX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161857.7osnf6AX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410161857.7osnf6AX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'arch/openrisc/boot/dts/or1ksim.dtb.o', needed by 'arch/openrisc/boot/dts/built-in.a'.
   make[5]: Target 'arch/openrisc/boot/dts/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
