Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785D93F4135
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281927; cv=none; b=mwMiYyRoGxEZhEL9QVPKTf+N5RaaLrMAKtFMGh68bXhyxoLDcEBPS25sC5YPs9OIRq0tIthiER0bQ7FVmjuC8hAHf2G0czPXPgrsGUGrIDO5TppFgKTQCUi68a493TbCIZGoHTAOxtHLMP03T8h2b/AgRShqEuwLe2hmws6OV5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281927; c=relaxed/simple;
	bh=EiVcRGnOXUVNHv1YSB2YvCnS+9/Bl9mFBJvc6Yk6QVI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UiPTpUMUYe8Zftuot7OMkjoPFnRHsbbae/+2uKulrAmTagDfJpwM2/dV1foOhE2eLrc3ymgK1FhKDEYSCAFBlMyigubffQfaora+Ry8ATVo+KURo4J87E3DB6dqZnFnIUw4neTNVPyqI1ran9DkYKOxxwrygwpYnXeMI4rG3K4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrK5Egv9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrK5Egv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781281924; x=1812817924;
  h=date:from:to:cc:subject:message-id;
  bh=EiVcRGnOXUVNHv1YSB2YvCnS+9/Bl9mFBJvc6Yk6QVI=;
  b=ZrK5Egv982ebzUnq6aPoEneh5M70UMbzQvluPeR02VyEuL/eIszxVSZp
   6HJFgJpi4fvikNw9rvZ/Xo3YVZQlfudNF8Aca6UzTUSvGPhCFreWSPRtM
   mn1lX2o0N3qF8WglOl8m7R/o/rf/hrXInGRq5nXlzWhPLQA43QjvgSk0H
   7KvgtKLoLjSDO+45jVmba6q//qKY9ZQrkqKvcgDn1nBH35MN0WeKha893
   BUtmAWe8Zq7GXcLLYva2bJP8363xzteu+NOo66slbfHhS36RGkTDoiSaJ
   oq4jzj+vssVcJGPA2cMwBXI9briGDGDLyKqZbnrkZ5fEBYtlZQyr1r+LQ
   w==;
X-CSE-ConnectionGUID: 39zTGPeAQmS6371zk5mEOQ==
X-CSE-MsgGUID: m6R6pPjmR3aV5k/Ak34boA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93608207"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="93608207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 09:32:04 -0700
X-CSE-ConnectionGUID: 54XSxCRGRx24ubnjoGP54w==
X-CSE-MsgGUID: P5oBZEUwQvWRZxHv/x9u2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="246890799"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jun 2026 09:32:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY4nY-00000000P3b-2GOB;
	Fri, 12 Jun 2026 16:32:00 +0000
Date: Sat, 13 Jun 2026 00:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:irq/core 3/17] kernel/irq/proc.c:467:31: sparse:
 sparse: label 'continue' already bound
Message-ID: <202606130029.51vvy0B5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/irq/proc.c:467:31: sparse: sparse: label 'continue' already bound"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Thomas Gleixner <tglx@kernel.org>
CC: Dmitry Ilvokhin <d@ilvokhin.com>
CC: Radu Rendec <radu@rendec.net>
CC: Shrikanth Hegde <sshegde@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
head:   171cc0d9eed1cad5de7ce6a212efbeda390edb0f
commit: 95c33a64f203be444954a1e1d855a4820c4f0efa [3/17] genirq/proc: Avoid formatting zero counts in /proc/interrupts
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: um-randconfig-r122-20260612 (https://download.01.org/0day-ci/archive/20260613/202606130029.51vvy0B5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130029.51vvy0B5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606130029.51vvy0B5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/irq/proc.c:467:31: sparse: sparse: label 'continue' already bound
>> kernel/irq/proc.c:467:31: sparse: sparse: label 'break' already bound

vim +/continue +467 kernel/irq/proc.c

a6e120ed42004d6 Thomas Gleixner 2011-03-25  453  
95c33a64f203be4 Thomas Gleixner 2026-05-17  454  /* Same as seq_put_decimal_ull_width(p, " ", cnt, 10) */
95c33a64f203be4 Thomas Gleixner 2026-05-17  455  #define ZSTR1 "          0"
95c33a64f203be4 Thomas Gleixner 2026-05-17  456  #define ZSTR1_LEN	(sizeof(ZSTR1) - 1)
95c33a64f203be4 Thomas Gleixner 2026-05-17  457  #define ZSTR16		ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 \
95c33a64f203be4 Thomas Gleixner 2026-05-17  458  			ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1
95c33a64f203be4 Thomas Gleixner 2026-05-17  459  #define ZSTR256		ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 \
95c33a64f203be4 Thomas Gleixner 2026-05-17  460  			ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16
95c33a64f203be4 Thomas Gleixner 2026-05-17  461  
95c33a64f203be4 Thomas Gleixner 2026-05-17  462  static inline void irq_proc_emit_zero_counts(struct seq_file *p, unsigned int zeros)
95c33a64f203be4 Thomas Gleixner 2026-05-17  463  {
95c33a64f203be4 Thomas Gleixner 2026-05-17  464  	if (!zeros)
95c33a64f203be4 Thomas Gleixner 2026-05-17  465  		return;
95c33a64f203be4 Thomas Gleixner 2026-05-17  466  
95c33a64f203be4 Thomas Gleixner 2026-05-17 @467  	for (unsigned int n = min(zeros, 256); n; zeros -= n, n = min(zeros, 256))
95c33a64f203be4 Thomas Gleixner 2026-05-17  468  		seq_write(p, ZSTR256, n * ZSTR1_LEN);
95c33a64f203be4 Thomas Gleixner 2026-05-17  469  }
95c33a64f203be4 Thomas Gleixner 2026-05-17  470  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
