Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6C2C8D2
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 05:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Igi4YDqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699422131; x=1730958131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ow0o52Gzozhqo5FwkFK5TbssfiQg3lTGXqTy2uWshzg=;
  b=Igi4YDqFOiCGEuk8R2VzG0Qu3HH4/BRt2zZQhwdwYfwDnfvIfAfRRF0N
   rpw3P2atSZ6aCE+wqCP6w2qRK5/3fx2+IWqfiJC7y2Z2yrmfXcjGgLZgl
   11VBwh5L8xh0EWfmVBIl7KdWEqs0VcULBhijFhVdLgkeyICKHfVF97jsR
   cjvC7St0rKD4Tu7yHg4+MFFQD0ADGT2u5hK3j74d7G/w76EfDVvGzf/3i
   sc0N0sFUOMdDO2QOqp/jFBhD7DGBC4iNIW6y/klb172pb5vW2tOiYcpdG
   /0wNKd1U8JM3AlwR5nvtIHW1fmpHsISd0iRe4CCGHKZ9FAcwhHsW+PjM0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475924256"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="475924256"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 21:42:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="10677878"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2023 21:42:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0bKI-0007hk-30;
	Wed, 08 Nov 2023 05:42:06 +0000
Date: Wed, 8 Nov 2023 13:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
Message-ID: <202311081100.3S8jQAFW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   305230142ae0637213bf6e04f6d9f10bbcb74af8
commit: b76c14c8fb2af1e481d51a4eeab8e0c0594824c0 drm/i915/huc: better define HuC status getparam possible return values.
date:   1 year, 1 month ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081100.3S8jQAFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311081100.3S8jQAFW-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differs from latest version at 'include/uapi/drm/i915_drm.h'
>> diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
   Warning: Kernel ABI header at 'tools/include/uapi/linux/perf_event.h' differs from latest version at 'include/uapi/linux/perf_event.h'
   diff -u tools/include/uapi/linux/perf_event.h include/uapi/linux/perf_event.h
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
   diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h'
   diff -u tools/arch/arm64/include/uapi/asm/kvm.h arch/arm64/include/uapi/asm/kvm.h
   In file included from tools/include/asm/../../arch/x86/include/asm/atomic.h:7,
                    from tools/include/asm/atomic.h:6,
                    from tools/include/linux/atomic.h:5,
                    from tools/include/linux/refcount.h:41,
                    from threadmap.c:4:
   tools/include/asm/../../arch/x86/include/asm/atomic.h: In function 'atomic_dec_and_test':
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:7:9: error: implicit declaration of function 'asm_volatile_goto' [-Werror=implicit-function-declaration]
       7 |         asm_volatile_goto (fullop "; j" cc " %l[cc_label]"              \
         |         ^~~~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:16:9: note: in expansion of macro '__GEN_RMWcc'
      16 |         __GEN_RMWcc(op " " arg0, var, cc)
         |         ^~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:65:9: note: in expansion of macro 'GEN_UNARY_RMWcc'
      65 |         GEN_UNARY_RMWcc(LOCK_PREFIX "decl", v->counter, "%0", "e");
         |         ^~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:7:9: error: nested extern declaration of 'asm_volatile_goto' [-Werror=nested-externs]
       7 |         asm_volatile_goto (fullop "; j" cc " %l[cc_label]"              \
         |         ^~~~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:16:9: note: in expansion of macro '__GEN_RMWcc'
      16 |         __GEN_RMWcc(op " " arg0, var, cc)
         |         ^~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:65:9: note: in expansion of macro 'GEN_UNARY_RMWcc'
      65 |         GEN_UNARY_RMWcc(LOCK_PREFIX "decl", v->counter, "%0", "e");
         |         ^~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:8:25: error: expected ')' before ':' token
       8 |                         : : "m" (var), ## __VA_ARGS__                   \
         |                         ^
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:16:9: note: in expansion of macro '__GEN_RMWcc'
      16 |         __GEN_RMWcc(op " " arg0, var, cc)
         |         ^~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:65:9: note: in expansion of macro 'GEN_UNARY_RMWcc'
      65 |         GEN_UNARY_RMWcc(LOCK_PREFIX "decl", v->counter, "%0", "e");
         |         ^~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:7:27: note: to match this '('
       7 |         asm_volatile_goto (fullop "; j" cc " %l[cc_label]"              \
         |                           ^
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:16:9: note: in expansion of macro '__GEN_RMWcc'
      16 |         __GEN_RMWcc(op " " arg0, var, cc)
         |         ^~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:65:9: note: in expansion of macro 'GEN_UNARY_RMWcc'
      65 |         GEN_UNARY_RMWcc(LOCK_PREFIX "decl", v->counter, "%0", "e");
         |         ^~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:11:1: error: label 'cc_label' defined but not used [-Werror=unused-label]
      11 | cc_label:                                                               \
         | ^~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:16:9: note: in expansion of macro '__GEN_RMWcc'
      16 |         __GEN_RMWcc(op " " arg0, var, cc)
         |         ^~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:65:9: note: in expansion of macro 'GEN_UNARY_RMWcc'
      65 |         GEN_UNARY_RMWcc(LOCK_PREFIX "decl", v->counter, "%0", "e");
         |         ^~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:63:49: error: unused parameter 'v' [-Werror=unused-parameter]
      63 | static inline int atomic_dec_and_test(atomic_t *v)
         |                                       ~~~~~~~~~~^
   In file included from tools/include/asm/../../arch/x86/include/asm/atomic.h:7,
                    from tools/include/asm/atomic.h:6,
                    from tools/include/linux/atomic.h:5,
                    from tools/include/linux/refcount.h:41,
                    from cpumap.c:4:
   tools/include/asm/../../arch/x86/include/asm/atomic.h: In function 'atomic_dec_and_test':
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:7:9: error: implicit declaration of function 'asm_volatile_goto' [-Werror=implicit-function-declaration]
       7 |         asm_volatile_goto (fullop "; j" cc " %l[cc_label]"              \
         |         ^~~~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:16:9: note: in expansion of macro '__GEN_RMWcc'
      16 |         __GEN_RMWcc(op " " arg0, var, cc)
         |         ^~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:65:9: note: in expansion of macro 'GEN_UNARY_RMWcc'
      65 |         GEN_UNARY_RMWcc(LOCK_PREFIX "decl", v->counter, "%0", "e");
         |         ^~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:7:9: error: nested extern declaration of 'asm_volatile_goto' [-Werror=nested-externs]
       7 |         asm_volatile_goto (fullop "; j" cc " %l[cc_label]"              \
         |         ^~~~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:16:9: note: in expansion of macro '__GEN_RMWcc'
      16 |         __GEN_RMWcc(op " " arg0, var, cc)
         |         ^~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:65:9: note: in expansion of macro 'GEN_UNARY_RMWcc'
      65 |         GEN_UNARY_RMWcc(LOCK_PREFIX "decl", v->counter, "%0", "e");
         |         ^~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:8:25: error: expected ')' before ':' token
       8 |                         : : "m" (var), ## __VA_ARGS__                   \
         |                         ^
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:16:9: note: in expansion of macro '__GEN_RMWcc'
      16 |         __GEN_RMWcc(op " " arg0, var, cc)
         |         ^~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:65:9: note: in expansion of macro 'GEN_UNARY_RMWcc'
      65 |         GEN_UNARY_RMWcc(LOCK_PREFIX "decl", v->counter, "%0", "e");
         |         ^~~~~~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:7:27: note: to match this '('
       7 |         asm_volatile_goto (fullop "; j" cc " %l[cc_label]"              \
         |                           ^
   tools/include/asm/../../arch/x86/include/asm/rmwcc.h:16:9: note: in expansion of macro '__GEN_RMWcc'
      16 |         __GEN_RMWcc(op " " arg0, var, cc)
         |         ^~~~~~~~~~~
   tools/include/asm/../../arch/x86/include/asm/atomic.h:65:9: note: in expansion of macro 'GEN_UNARY_RMWcc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
