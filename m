Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C1079FE
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748450070; cv=none; b=GCn2WKESrrtDG06ZHr3+d5Hieej9Q22ZhOgVGhkq+v3BsdBiK/701SKv0o6+53ttuWAnzxdmHbQVVpXF8H4BcnabFp1PgMYczpaW/ndFXykW2OCVoTJboLDhkUXVDANjacMC+YonHxc1i+eLasOQ9UiVFDiL85LjKXQWaW6Zj80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748450070; c=relaxed/simple;
	bh=3ia5HgRwMxpD95WUHAM5npEMVd8l25c0jQb7NLSJcTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F6A5pGJArPSkrBj+egpFV8rHqO38/k3s9/FgGMyiRbruxj9Ibd+Z+TRHIScMqYLWHr4hGemTn54mNuYiFWBZP7gZlqY751unXfpde52sI8NkzOA8oT/Pg4LbYCAD+5BxV5BuaKHbyNPZBtLdf35gNbDqoOP++s+5YgoeBr/DraQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IU2f8b+A; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IU2f8b+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748450069; x=1779986069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ia5HgRwMxpD95WUHAM5npEMVd8l25c0jQb7NLSJcTE=;
  b=IU2f8b+AnSruqBHKEb0rvZrY+YfR7axMUQsZKzufjmBgZ6C+3TL66oLz
   8/KXIoGVMlYBOAquf2Xy5Z8x3OmBeJ5LARbQonK1opxZMsngGOibVSUqz
   Ha1t41L1MWp+1UeV9ejkZEBBqtyy4M8095WzYCWROYEtQ4hpKyhTi1D/3
   wh5n5NlVBNNwmAS/FsvUlO0sqgHcjh/bI7qbSLqDuOlNOB9gW+mOGK9Eo
   2leM8yXufw7gUorHA1Jxbsu1aMS0gTJiQHfM7cVjQyPB2CrBmVeT2aFc2
   eaXuX3NmO6i//tTheNuIdBFlx9gbvi7dFjoqmVJM6/NycVdsa8U9PJySS
   A==;
X-CSE-ConnectionGUID: yGb1/TriTyej1ph/A9cqTg==
X-CSE-MsgGUID: hXvfpI/dSTOoFMbUe1+nMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50639731"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50639731"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 09:34:28 -0700
X-CSE-ConnectionGUID: VEYdjpMPSKGtuk8tpqndvQ==
X-CSE-MsgGUID: iydXpbKjQNqwy8t3GHUosg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="174293897"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 May 2025 09:34:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKJjU-000Vs8-1y;
	Wed, 28 May 2025 16:34:24 +0000
Date: Thu, 29 May 2025 00:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 6/6] kbuild: Create modules.builtin.modinfo for
 modpost results
Message-ID: <202505290016.N02ofupF-lkp@intel.com>
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
In-Reply-To: <6e34b761f118c2b2a4d05cabe9ad89ee8e1dd4c6.1748335606.git.legion@kernel.org>
References: <6e34b761f118c2b2a4d05cabe9ad89ee8e1dd4c6.1748335606.git.legion@kernel.org>
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
patch link:    https://lore.kernel.org/r/6e34b761f118c2b2a4d05cabe9ad89ee8e1dd4c6.1748335606.git.legion%40kernel.org
patch subject: [PATCH v3 6/6] kbuild: Create modules.builtin.modinfo for modpost results
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-004-20250528 (https://download.01.org/0day-ci/archive/20250529/202505290016.N02ofupF-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290016.N02ofupF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505290016.N02ofupF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> llvm-objcopy: error: '.vmlinux.export.o': The file was not recognized as a valid object file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
