Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A551CF43
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874711; cv=none; b=L8nHhBrO11MVXId69iEX2/Oi0GJ9PyVwiqbnw0pBmTcxgfm7FY+sY0O3oPRga+rRbQ1s5Xo7ls2+e9NLR+wDS4RO1S7V9yyt9ayUnMM5tQ6FOciKxor504yKk5Hj939m75n2SRRoHt/AeoRYk8Al46RCLtkjDrhcEfN+SCTwHXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874711; c=relaxed/simple;
	bh=bpOA3JNUGCtUmSB54RH0JVI2fz+GUxoKmez8das1YHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jXUAxiAQdjyvWD7t+CN8tlLWdftXpRoJa0JGaiUCQ3DMgjD/1whXVOoXiGh4DzdfRzDAs1+rM5yepoax1m9ttMqIGybjcbhCygxu6tMZ3IY/peF9o2+JMNguzYgc8i657VFbSUodDBw88nkmarAd0o+LOoh/HM3btwePcSkT1pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GF81WmtX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GF81WmtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790874706; x=1822410706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bpOA3JNUGCtUmSB54RH0JVI2fz+GUxoKmez8das1YHc=;
  b=GF81WmtXrqrw1GX2C11tCT1M6f3AvQnHjdfHvYi/pesWzJp1DKiVX8Oq
   XW/iDuNbfY229+XBk65qkffMye90JioesH0q4msWcPEKNWtIMRnTrxnoi
   gPfMF4/o4gZ1gipH4EW+oQ0KjCFy6iUpdVzkW8daW6rGVKefKG76XhGqS
   f1aJlZocU+c0yIG/pZ6pOeWwKgfrlsq/49vMQnbdFgicrCwbFSEIMofca
   /zCn/6ENVMiLdTIVdihXP6hrtKGFvEC1owuNu5KwLxIVH3R0wefx1OKk7
   /QcC8YBs2ogvCd85h6niotMsdhtfwqofsPn/dUa9m3KRMz6MojEVyhL7I
   g==;
X-CSE-ConnectionGUID: ZqzvRaimSEm6D493tkxgyg==
X-CSE-MsgGUID: u3fD2iwZQkGBdqH45B1CrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90500457"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90500457"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 10:11:41 -0700
X-CSE-ConnectionGUID: jiMPbvRhTU+cjrkUmhGTQw==
X-CSE-MsgGUID: 9K8/Tsg5SEWVcPLCnK4oCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275166007"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 01 Oct 2026 10:11:39 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCKJh-0000000009n-0aUn;
	Thu, 01 Oct 2026 17:11:33 +0000
Date: Thu, 1 Oct 2026 19:10:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: arm64: csum: Add fused copy and Internet checksum
Message-ID: <202610011906.fcPTzknP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/lib/csum-copy-neon.c:91:9: sparse: sparse: Trying to use reserved word 'if' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <202610011906.fcPTzknP-lkp@intel.com>
References: <202610011906.fcPTzknP-lkp@intel.com>

Hi Demian,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Demian-Shulhan/arm64-csum-Add-fused-copy-and-Internet-checksum/20260927-151757
base:   
patch link:    https://lore.kernel.org/r/202610011906.fcPTzknP-lkp%40intel.com
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r2301-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011906.fcPTzknP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011906.fcPTzknP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610011906.fcPTzknP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: got __o
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: got __o
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34587:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34587:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34594:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34594:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34601:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34601:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34609:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34609:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34617:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34617:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34625:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34625:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34632:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34632:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34640:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34640:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34648:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34648:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34656:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34656:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34665:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34665:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34672:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34672:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34679:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34679:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34688:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34688:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34695:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34695:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34702:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34702:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34709:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34709:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34716:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34716:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34723:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34723:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34730:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34730:1: sparse: sparse: got }
   arch/arm64/lib/csum-copy-neon.c:71:35: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:71:35: sparse: sparse: got words_sum
   arch/arm64/lib/csum-copy-neon.c:74:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/csum-copy-neon.c:74:1: sparse: sparse: got }
   arch/arm64/lib/csum-copy-neon.c:80:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/csum-copy-neon.c:80:1: sparse: sparse: got }
   arch/arm64/lib/csum-copy-neon.c:86:20: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:86:20: sparse: sparse: got acc0
>> arch/arm64/lib/csum-copy-neon.c:91:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> arch/arm64/lib/csum-copy-neon.c:91:13: sparse: sparse: missing type declaration for parameter 'tail'
   arch/arm64/lib/csum-copy-neon.c:93:28: sparse: sparse: Expected ; at end of statement
   arch/arm64/lib/csum-copy-neon.c:93:28: sparse: sparse: got v
   arch/arm64/lib/csum-copy-neon.c:102:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> arch/arm64/lib/csum-copy-neon.c:102:13: sparse: sparse: missing type declaration for parameter 'head'
   arch/arm64/lib/csum-copy-neon.c:103:28: sparse: sparse: Expected ; at end of statement
   arch/arm64/lib/csum-copy-neon.c:103:28: sparse: sparse: got v
>> arch/arm64/lib/csum-copy-neon.c:116:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/arm64/lib/csum-copy-neon.c:116:12: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:116:12: sparse: sparse: got {
   arch/arm64/lib/csum-copy-neon.c:118:28: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:118:28: sparse: sparse: got v1
   arch/arm64/lib/csum-copy-neon.c:119:28: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:119:28: sparse: sparse: got v2
   arch/arm64/lib/csum-copy-neon.c:120:28: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:120:28: sparse: sparse: got v3
   arch/arm64/lib/csum-copy-neon.c:121:28: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:121:28: sparse: sparse: got t0
   arch/arm64/lib/csum-copy-neon.c:124:28: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/csum-copy-neon.c:124:28: sparse: sparse: got +
   arch/arm64/lib/csum-copy-neon.c:125:28: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/csum-copy-neon.c:125:28: sparse: sparse: got +
   arch/arm64/lib/csum-copy-neon.c:126:28: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/csum-copy-neon.c:126:28: sparse: sparse: got +
   arch/arm64/lib/csum-copy-neon.c:135:19: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:135:19: sparse: sparse: got +=
   arch/arm64/lib/csum-copy-neon.c:136:19: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:136:19: sparse: sparse: got +=
   arch/arm64/lib/csum-copy-neon.c:137:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:137:21: sparse: sparse: got -=
   arch/arm64/lib/csum-copy-neon.c:138:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/csum-copy-neon.c:138:9: sparse: sparse: got }
   arch/arm64/lib/csum-copy-neon.c:140:17: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/csum-copy-neon.c:140:17: sparse: sparse: got &
   arch/arm64/lib/csum-copy-neon.c:140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/arm64/lib/csum-copy-neon.c:142:28: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:142:28: sparse: sparse: got v1
   arch/arm64/lib/csum-copy-neon.c:145:28: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/csum-copy-neon.c:145:28: sparse: sparse: got +
   arch/arm64/lib/csum-copy-neon.c:148:19: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:148:19: sparse: sparse: got +=
   arch/arm64/lib/csum-copy-neon.c:149:19: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/csum-copy-neon.c:149:19: sparse: sparse: got +=
   arch/arm64/lib/csum-copy-neon.c:150:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/csum-copy-neon.c:150:9: sparse: sparse: got }
   arch/arm64/lib/csum-copy-neon.c:156:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/csum-copy-neon.c:156:9: sparse: sparse: got }
   arch/arm64/lib/csum-copy-neon.c:160:18: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/csum-copy-neon.c:160:18: sparse: sparse: got &
   arch/arm64/lib/csum-copy-neon.c:160:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/arm64/lib/csum-copy-neon.c:165:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/csum-copy-neon.c:165:9: sparse: sparse: got }
   arch/arm64/lib/csum-copy-neon.c:168:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/csum-copy-neon.c:168:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3164:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3164:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3171:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3171:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3178:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3178:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3185:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3185:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3192:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3192:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3199:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3199:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3206:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3206:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3213:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3213:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3220:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3220:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3227:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3227:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3234:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3234:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3241:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3241:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3248:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3248:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3255:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3255:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3264:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3264:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3271:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3271:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3278:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3278:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3285:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3285:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3292:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3292:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3299:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3299:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3306:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3306:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3313:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3313:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3320:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3320:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3327:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3327:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3334:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3334:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3341:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3341:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3348:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3348:10: sparse: sparse: bad constant expression type

vim +/if +91 arch/arm64/lib/csum-copy-neon.c

15b4870d68269b Demian Shulhan 2026-09-27   81  
15b4870d68269b Demian Shulhan 2026-09-27   82  __wsum __csum_partial_copy_neon(const void *src, void *dst, int len)
15b4870d68269b Demian Shulhan 2026-09-27   83  {
15b4870d68269b Demian Shulhan 2026-09-27   84  	const u8 *s = src;
15b4870d68269b Demian Shulhan 2026-09-27   85  	u8 *d = dst;
15b4870d68269b Demian Shulhan 2026-09-27   86  	uint64x2_t acc0 = { }, acc1 = { };
15b4870d68269b Demian Shulhan 2026-09-27   87  	unsigned int head = -(unsigned long)d & 15;
15b4870d68269b Demian Shulhan 2026-09-27   88  	unsigned int tail = (len - head) & 15;
15b4870d68269b Demian Shulhan 2026-09-27   89  	u32 sum;
15b4870d68269b Demian Shulhan 2026-09-27   90  
15b4870d68269b Demian Shulhan 2026-09-27  @91  	if (tail) {
15b4870d68269b Demian Shulhan 2026-09-27   92  		/* Final vector, ending exactly at the buffer end; see above */
15b4870d68269b Demian Shulhan 2026-09-27   93  		uint8x16_t v = vld1q_u8(s + len - 16);
15b4870d68269b Demian Shulhan 2026-09-27   94  
15b4870d68269b Demian Shulhan 2026-09-27   95  		vst1q_u8(d + len - 16, v);
15b4870d68269b Demian Shulhan 2026-09-27   96  		v &= vld1q_u8(csum_copy_mask + tail);
15b4870d68269b Demian Shulhan 2026-09-27   97  		if (tail & 1)
15b4870d68269b Demian Shulhan 2026-09-27   98  			v = vrev16q_u8(v);	/* odd tail: match loop grid */
15b4870d68269b Demian Shulhan 2026-09-27   99  		acc1 = vpadalq_u32(acc1, words_sum(v));
15b4870d68269b Demian Shulhan 2026-09-27  100  	}
15b4870d68269b Demian Shulhan 2026-09-27  101  
15b4870d68269b Demian Shulhan 2026-09-27 @102  	if (head) {
15b4870d68269b Demian Shulhan 2026-09-27  103  		uint8x16_t v = vld1q_u8(s);
15b4870d68269b Demian Shulhan 2026-09-27  104  
15b4870d68269b Demian Shulhan 2026-09-27  105  		vst1q_u8(d, v);
15b4870d68269b Demian Shulhan 2026-09-27  106  		v &= vld1q_u8(csum_copy_mask + 32 - head);
15b4870d68269b Demian Shulhan 2026-09-27  107  		if (head & 1)
15b4870d68269b Demian Shulhan 2026-09-27  108  			v = vrev16q_u8(v);	/* odd head: match loop grid */
15b4870d68269b Demian Shulhan 2026-09-27  109  		acc0 = vpadalq_u32(acc0, words_sum(v));
15b4870d68269b Demian Shulhan 2026-09-27  110  
15b4870d68269b Demian Shulhan 2026-09-27  111  		s += head;
15b4870d68269b Demian Shulhan 2026-09-27  112  		d += head;
15b4870d68269b Demian Shulhan 2026-09-27  113  		len -= head;
15b4870d68269b Demian Shulhan 2026-09-27  114  	}
15b4870d68269b Demian Shulhan 2026-09-27  115  
15b4870d68269b Demian Shulhan 2026-09-27 @116  	do {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
