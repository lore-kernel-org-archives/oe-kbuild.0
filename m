Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD043BA24F
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 20:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772741343; cv=none; b=BLOQft/tAbg0OkMbk1yHwqb8Jw381WVjs3KXibUO9gQpM2uUfuZlt9I825yoQe69UEsRAcZQivz6FmBd/yL78bfRuLTtix9vlFtUZd9nLQwxFYJsFW9GQsIGZ+ZR5tKmMC9sHMvVTWNwuSC6svNpY+dcWhOKcNinodKl95PP/Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772741343; c=relaxed/simple;
	bh=+YiS5r1lxPibD6Bzg5D7UX7kDFnnRZv4IsKXVHRH1mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gDFZYiXJ4Adf0aM6A4pIdbpL9KONd5029ZxwPj0zSd8nEHHGYtHKmjrht6DqkmUL22rDca5QqferB2cbhSdLZc37ctXm1pkRHFb5tHeou3iOlb5WTumNSDeQqERhxo1fVr7n+QgRFmihGYLKiN06i91AOWobH7aM9vd4H9zojLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQXINQP8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQXINQP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772741342; x=1804277342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YiS5r1lxPibD6Bzg5D7UX7kDFnnRZv4IsKXVHRH1mk=;
  b=WQXINQP8CD0tO1MzUpNGT53Uq6l5+YlqLTxVgaCFHC6wNMRNgKAIRc22
   rn2DCWzK0qkp+d1leYkf3Rlv+lfj0UQzUDgeb2eeJNeMiV8fxUUgTrPM6
   BZFqsRZ0aYwzAuitSVurQdKy5w4k+0MPMga+SNqyph4F+ETl5naxeiMxR
   +QXc2ITmsxtn33EbChDSSvQEHHP/wqQ+dWx/pWR6qMjbPBUL2kpiPGraV
   exNP+w5UCR1fP1KDv9lpvP3TDY7JO9DAs8aZG7tCmbyRyLdapbwORqw1t
   6q6cOSFe347FRwu+SBL6bhHmARmXzkUDUVUN1JqpEDMnJG5A/AEgV2mu2
   A==;
X-CSE-ConnectionGUID: 1mUE1pE3SSWoCPIjjuCggQ==
X-CSE-MsgGUID: GQ7CzF0ETSuHZmZZV3sWUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91417910"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="91417910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 12:09:01 -0800
X-CSE-ConnectionGUID: /o3TARy8QRKf5CTUHxH+Bw==
X-CSE-MsgGUID: XspE4xBIQXyzRgL2NTeIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="256689319"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 12:08:59 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyF0C-000000001B4-2at8;
	Thu, 05 Mar 2026 20:08:56 +0000
Date: Fri, 6 Mar 2026 04:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8 2/5] crash: Exclude crash kernel memory in crash core
Message-ID: <202603060454.MeuKcrhO-lkp@intel.com>
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
In-Reply-To: <20260302035315.3892241-3-ruanjinjie@huawei.com>
References: <20260302035315.3892241-3-ruanjinjie@huawei.com>
TO: Jinjie Ruan <ruanjinjie@huawei.com>
TO: corbet@lwn.net
TO: skhan@linuxfoundation.org
TO: catalin.marinas@arm.com
TO: will@kernel.org
TO: chenhuacai@kernel.org
TO: kernel@xen0n.name
TO: maddy@linux.ibm.com
TO: mpe@ellerman.id.au
TO: npiggin@gmail.com
TO: chleroy@kernel.org
TO: pjw@kernel.org
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: alex@ghiti.fr
TO: tglx@kernel.org
TO: mingo@redhat.com
TO: bp@alien8.de
TO: dave.hansen@linux.intel.com
TO: hpa@zytor.com
TO: robh@kernel.org
TO: saravanak@kernel.org
TO: akpm@linux-foundation.org
TO: bhe@redhat.com
TO: vgoyal@redhat.com
TO: dyoung@redhat.com
TO: rdunlap@infradead.org
TO: pmladek@suse.com
TO: dapeng1.mi@linux.intel.com
TO: kees@kernel.org
TO: paulmck@kernel.org

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on robh/for-next linus/master v7.0-rc2 next-20260305]
[cannot apply to powerpc/next powerpc/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/powerpc-crash-sort-crash-memory-ranges-before-preparing-elfcorehdr/20260302-115646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260302035315.3892241-3-ruanjinjie%40huawei.com
patch subject: [PATCH v8 2/5] crash: Exclude crash kernel memory in crash core
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060454.MeuKcrhO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603060454.MeuKcrhO-lkp@intel.com/

smatch warnings:
kernel/crash_core.c:305 crash_exclude_core_ranges() warn: we never enter this loop

vim +305 kernel/crash_core.c

747ee16995b671 Jinjie Ruan 2026-03-02  289  
747ee16995b671 Jinjie Ruan 2026-03-02  290  static int crash_exclude_core_ranges(struct crash_mem *cmem)
747ee16995b671 Jinjie Ruan 2026-03-02  291  {
747ee16995b671 Jinjie Ruan 2026-03-02  292  	int ret, i;
747ee16995b671 Jinjie Ruan 2026-03-02  293  
747ee16995b671 Jinjie Ruan 2026-03-02  294  	/* Exclude crashkernel region */
747ee16995b671 Jinjie Ruan 2026-03-02  295  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
747ee16995b671 Jinjie Ruan 2026-03-02  296  	if (ret)
747ee16995b671 Jinjie Ruan 2026-03-02  297  		return ret;
747ee16995b671 Jinjie Ruan 2026-03-02  298  
747ee16995b671 Jinjie Ruan 2026-03-02  299  	if (crashk_low_res.end) {
747ee16995b671 Jinjie Ruan 2026-03-02  300  		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
747ee16995b671 Jinjie Ruan 2026-03-02  301  		if (ret)
747ee16995b671 Jinjie Ruan 2026-03-02  302  			return ret;
747ee16995b671 Jinjie Ruan 2026-03-02  303  	}
747ee16995b671 Jinjie Ruan 2026-03-02  304  
747ee16995b671 Jinjie Ruan 2026-03-02 @305  	for (i = 0; i < crashk_cma_cnt; ++i) {
747ee16995b671 Jinjie Ruan 2026-03-02  306  		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
747ee16995b671 Jinjie Ruan 2026-03-02  307  					      crashk_cma_ranges[i].end);
747ee16995b671 Jinjie Ruan 2026-03-02  308  		if (ret)
747ee16995b671 Jinjie Ruan 2026-03-02  309  			return ret;
747ee16995b671 Jinjie Ruan 2026-03-02  310  	}
747ee16995b671 Jinjie Ruan 2026-03-02  311  
747ee16995b671 Jinjie Ruan 2026-03-02  312  	return 0;
747ee16995b671 Jinjie Ruan 2026-03-02  313  }
747ee16995b671 Jinjie Ruan 2026-03-02  314  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
