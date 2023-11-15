Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46CF3C494
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 22:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K995/vD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700087320; x=1731623320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+JUYecw/KmVM7xdT+5+4SONF79LVcAqHqAOniZgtVQ=;
  b=K995/vD54llBLFsLr9VMsfEVTQz1a80a/2jQNyu6WlXyrvIow8ngOAR6
   6ADtRlB5vvxsOKb3TNHvdLb/llto0ciWAsVpkUrzJHTXI209dM31fVqlg
   QLi6MFJ3hC0+dOpyBGqqWpIOnjUdmm0FQ9MccKaID/iT+tikyDsBA6U86
   W88V2sP3UB7G2QSSBO96QVD9dVoWUoJwUTmlNkZ8gxU+yqLwR6WEjcude
   6i93s1M8Pr1WASsEgTMsaQYVyUnuEefYMul2VjKOTK4wefuc5oIHEp2Y/
   jVq3jnU9/HjlNqnXZy1RBSZX6GS26VbGc4tmJKeTQ4qdAMe/2/P26LjYm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388131852"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="388131852"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="794294524"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="794294524"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Nov 2023 14:28:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3ON9-0000uf-1n;
	Wed, 15 Nov 2023 22:28:35 +0000
Date: Thu, 16 Nov 2023 06:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
Message-ID: <202311160656.PhNYs20U-lkp@intel.com>
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

Hi Daniele,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: b76c14c8fb2af1e481d51a4eeab8e0c0594824c0 drm/i915/huc: better define HuC status getparam possible return values.
date:   1 year, 1 month ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160656.PhNYs20U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160656.PhNYs20U-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differs from latest version at 'include/uapi/drm/i915_drm.h'
>> diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
   Warning: Kernel ABI header at 'tools/include/uapi/linux/perf_event.h' differs from latest version at 'include/uapi/linux/perf_event.h'
   diff -u tools/include/uapi/linux/perf_event.h include/uapi/linux/perf_event.h
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
   diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h'
   diff -u tools/arch/arm64/include/uapi/asm/kvm.h arch/arm64/include/uapi/asm/kvm.h
     PERF_VERSION = 6.0.rc2.gb76c14c8fb2a
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
