Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6621A4B1E44
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 02:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747274804; cv=none; b=EGxlQMnJYOUDoiNwk1ovnooBAX5qgXfHLUvo8ci91pdktLcTlCpxw8igkR7HJ2S2axhZa5Q++03FVnSPo6ebHmAH+nKsGYFq9tf37oDeTP8jCr03yZC4FGzTwX+JJLnIo0QoSUCauYrUupytfpX2m5EB1+fQCAImzlkTSyzWVQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747274804; c=relaxed/simple;
	bh=0qX/jeukUkiMNi0rxRQLvtbD1aUtDQrPqrt/JW9qwaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EbS0PJBh8XXIPYGSuHi9KUlMH6TgHRn2t2QR7zmd5dJHAk0xT64BHRPxZqszTx2ne8HzN6Cb+xqw9U6dv3F5/CgGQfy6Xe7aQFG4NR+dU7AOIeaWlLBfwmouhc86xOQwL6oG8XB3i53T6nrJG65ZUPqiSzqKeQgKNhDLk7Dg7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OL0B1VmA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OL0B1VmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747274802; x=1778810802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qX/jeukUkiMNi0rxRQLvtbD1aUtDQrPqrt/JW9qwaY=;
  b=OL0B1VmAjFC+K8+hQ82tvIBrhNFHsQ0x0DU7W9Lyz4Eb7jY2NF4dGqpd
   bvQMyOoLuz1Uh0AlQw86rOICnZWbzI+COgyxcLU0+Z2h/x5BTOQAPdq4w
   NPSxoRiz7oMFTTlUIQGw3mnuBCcVAZoWbBlhH0JjF1P1DTtfBx8tbu/1a
   vNrRfncyTiTP6dmSU8sftQ17+Tx+mhV2v3oPoeRkr7PoNpFg+7Oawu67V
   KcE4jg3IpgCWIEZzN69fyPLPLt4culpfHGtx7zuIXESyNy0pKlsosugDC
   TtuPfNeMMeBTWkexewRae82zkzBGAscMyYdbdSjelvnqjWWxfwIowc4jc
   A==;
X-CSE-ConnectionGUID: BUM5LBgQTGqlHP91myPFew==
X-CSE-MsgGUID: id3brrqfQ4K14Op5Vt98iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60530657"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="60530657"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 19:06:42 -0700
X-CSE-ConnectionGUID: mxRK4H5yQGyJO1St9czFuw==
X-CSE-MsgGUID: rc8lw7PsSYW0TLRRIQs/Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="143320166"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 May 2025 19:06:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFNza-000Hmj-1S;
	Thu, 15 May 2025 02:06:38 +0000
Date: Thu, 15 May 2025 10:05:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lpieralisi:irqchip/gicv5-v4 27/27]
 drivers/irqchip/irq-gic-v5.c:579:3: error: call to
 '__compiletime_assert_856' declared with 'error' attribute: BUILD_BUG_ON
 failed: 1
Message-ID: <202505151028.rhsZZosm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>

Hi Lorenzo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git irqchip/gicv5-v4
head:   cd304ff823baeeee513b2fb4e4447c5fcf1f48c3
commit: cd304ff823baeeee513b2fb4e4447c5fcf1f48c3 [27/27] arm64: Kconfig: Enable GICv5
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-002-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151028.rhsZZosm-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151028.rhsZZosm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505151028.rhsZZosm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v5.c:579:3: error: call to '__compiletime_assert_856' declared with 'error' attribute: BUILD_BUG_ON failed: 1
     579 |                 BUILD_BUG_ON(1);
         |                 ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:38:1: note: expanded from here
      38 | __compiletime_assert_856
         | ^
   1 error generated.


vim +579 drivers/irqchip/irq-gic-v5.c

6a16ac1c3b46f4 Lorenzo Pieralisi 2025-04-30  548  
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  549  static int gicv5_irq_domain_translate(struct irq_domain *d,
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  550  				      struct irq_fwspec *fwspec,
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  551  				      irq_hw_number_t *hwirq,
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  552  				      unsigned int *type,
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  553  				      u8 hwirq_type)
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  554  {
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  555  	if (!is_of_node(fwspec->fwnode))
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  556  		return -EINVAL;
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  557  
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  558  	if (fwspec->param_count < 3)
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  559  		return -EINVAL;
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  560  
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  561  	if (fwspec->param[0] != hwirq_type)
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  562  		return -EINVAL;
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  563  
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  564  	*hwirq = fwspec->param[1];
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  565  
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  566  	switch (hwirq_type) {
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  567  	case GICV5_HWIRQ_TYPE_PPI:
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  568  		/*
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  569  		 * Handling mode is hardcoded for PPIs, set the type using
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  570  		 * HW reported value.
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  571  		 */
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  572  		*type = gicv5_ppi_irq_is_level(*hwirq) ? IRQ_TYPE_LEVEL_LOW :
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  573  							 IRQ_TYPE_EDGE_RISING;
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  574  		break;
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  575  	case GICV5_HWIRQ_TYPE_SPI:
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  576  		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  577  		break;
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  578  	default:
1f4e106e116371 Lorenzo Pieralisi 2025-04-30 @579  		BUILD_BUG_ON(1);
1f4e106e116371 Lorenzo Pieralisi 2025-04-30  580  	}
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  581  
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  582  	return 0;
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  583  }
66367ffdb3e6d2 Lorenzo Pieralisi 2025-04-30  584  

:::::: The code at line 579 was first introduced by commit
:::::: 1f4e106e11637124f5e51b06da2900b966f01b69 irqchip/gic-v5: Add GICv5 IRS/SPI support

:::::: TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
:::::: CC: Lorenzo Pieralisi <lpieralisi@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
