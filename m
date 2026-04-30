Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE0344DAE
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 03:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777521454; cv=none; b=H7Tril7DyFmOgpyri5/+RhmxkpGRw34jdwazf4wWCIqzuRl8Eu7ytn4T8owbyDbZ99GO8j021qYrTeuG+u84dJU6ZBb/0RInGHJgjpOzrsPVPKsf2cqRxbXCfqdqVNmDtkD+H6mJWDMK3MQc13B8ll7LpHIXHNJ6rvB94fWUZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777521454; c=relaxed/simple;
	bh=Kr2BoOdyP45aK3HQfCIar3T2Ox0M3KCy2NUP5cOiyNc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QdxZ84TLMxZDBGBZ+F403Vt3XagoX+oMGVb+NA2IsRJCtcOsaTPp+CDMBS5vZnHsLidYikeSE4TX1tf4CLCA/lwlBwXxrUYVxkPp1Sof8NFygIZUP8r31o+lFcwIrpwCRvNTHKKPP6OFCz3PIrd6Z42/T/BObhyZ0pLEKJXFqsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpemGGR7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpemGGR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777521453; x=1809057453;
  h=date:from:to:cc:subject:message-id;
  bh=Kr2BoOdyP45aK3HQfCIar3T2Ox0M3KCy2NUP5cOiyNc=;
  b=BpemGGR7/sio84oYCjM5QKjsE/FpZ/C3EgRk8aY9vj8++N0eEhkZ/E+8
   X/ptNMmZh8HwI/gSr2pC3FqWLoD5iupg8hC46Gshw2GgWvxITcCL0Q43x
   fJ4Dkd9+eACB1K6nM3Pvm6IpRm+2ivxuFPZiX3e9MkrpHTZL6Fa8UNXN+
   Z8nRWVkXFjwwAmSd+0oEP4JQSEGIWSyPv5Vb1Xw7s5Vycfi7pG7omhas5
   +0wNo8gCJMTI0nwKOUWpQdm06j5muXH94ZQt1dgTdX/C6h/Ey5Rl/1oj4
   ISl22cQe/PJfjuNsxIrxo1dblehkujQs8IwyA7Ty8wG50Rd02gLtJK3LM
   g==;
X-CSE-ConnectionGUID: g2GnxAY7QRC2iz645CUxLg==
X-CSE-MsgGUID: CICHYx2gSyO6G8H4CYXtsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89922094"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89922094"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:57:33 -0700
X-CSE-ConnectionGUID: FZeqzCX5R9emEkgskzKDkw==
X-CSE-MsgGUID: 4vz+9DTBThSJUIIOkqXgMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="231822175"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2026 20:57:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIIWn-000000004jV-1Jnc;
	Thu, 30 Apr 2026 03:57:29 +0000
Date: Thu, 30 Apr 2026 05:56:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../../../mm/vma.c:249:9: error: implicit declaration of
 function 'inc_mapping_vma'
Message-ID: <202604300542.5TzdHOgw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Huang Shijie <huangsj@hygon.cn>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Huang-Shijie/mm-use-mapping_mapped-to-simplify-the-code/20260417-080421
head:   92aa74f3c18e2e251db847f50b3de456d0982226
commit: 92aa74f3c18e2e251db847f50b3de456d0982226 mm: split the file's i_mmap tree for NUMA
date:   13 days ago
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604300542.5TzdHOgw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300542.5TzdHOgw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604300542.5TzdHOgw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from main.c:10:
   ../../../mm/vma.c: In function '__vma_link_file':
>> ../../../mm/vma.c:249:9: error: implicit declaration of function 'inc_mapping_vma' [-Wimplicit-function-declaration]
     249 |         inc_mapping_vma(mapping);
         |         ^~~~~~~~~~~~~~~
   ../../../mm/vma.c: In function '__remove_shared_vm_struct':
>> ../../../mm/vma.c:264:9: error: implicit declaration of function 'dec_mapping_vma' [-Wimplicit-function-declaration]
     264 |         dec_mapping_vma(mapping);
         |         ^~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
