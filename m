Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23C363
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Nov 2023 00:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJy+BnaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700266826; x=1731802826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imyFCtx1DnlMVvxphhcvlAbzS67ZH/Ct0XKzz8/EMmw=;
  b=cJy+BnaT0l4ULxeyYD/YrZ8el/6hSWUHKviaoU9IW9usgZ8+QD5h6xTn
   7ks8VeG39u5VGctnVuDCsfXJ8pASNXykE+n/jboiR314BXcdGWJGj6T7e
   98Sdv+7xrMFLjJTg9H4+jrgUvS3T+Go6GVfND8cxphmSiE4iGeNT6ycTe
   chemi3OoHzclWPWsP5aLimV1SYYRY854qg+GszQbsrXpTzWuJ8EuQfZwW
   z9YoZcEljs/8OFxwIt/7bWHj/idsPrmQjLkY0riYewrM77IytJtdeAytT
   gM6S3GJYd9HCJfhcj1vPL7taDpdr+TkT6hB1oEQroDmP3/KBG7Xt4r769
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="370739092"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="370739092"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 16:20:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="765752728"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="765752728"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Nov 2023 16:20:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r494G-0003L9-27;
	Sat, 18 Nov 2023 00:20:19 +0000
Date: Sat, 18 Nov 2023 08:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-misc:clone3-shadow-stack 3/6] diff -u
 tools/include/uapi/linux/sched.h include/uapi/linux/sched.h
Message-ID: <202311180812.KIm69ZZa-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git clone3-shadow-stack
head:   055035db5a0227331cf8d237a17a84f81ed76087
commit: d3b6df51d1271581c4aaf5f9a686279c2f753b58 [3/6] fork: Add shadow stack support to clone3()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180812.KIm69ZZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311180812.KIm69ZZa-lkp@intel.com/

All errors (new ones prefixed by >>):

     diff -u tools/include/uapi/drm/drm.h include/uapi/drm/drm.h
     diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
     diff -u tools/include/uapi/linux/fscrypt.h include/uapi/linux/fscrypt.h
     diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
     diff -u tools/include/uapi/linux/mount.h include/uapi/linux/mount.h
>>   diff -u tools/include/uapi/linux/sched.h include/uapi/linux/sched.h
     diff -u tools/include/uapi/linux/vhost.h include/uapi/linux/vhost.h
     diff -u tools/arch/x86/include/asm/disabled-features.h arch/x86/include/asm/disabled-features.h
     diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
     diff -u tools/arch/x86/include/asm/msr-index.h arch/x86/include/asm/msr-index.h
     diff -u tools/arch/x86/include/uapi/asm/prctl.h arch/x86/include/uapi/asm/prctl.h
     diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
     diff -u tools/arch/s390/include/uapi/asm/kvm.h arch/s390/include/uapi/asm/kvm.h
     diff -u tools/arch/arm64/include/uapi/asm/kvm.h arch/arm64/include/uapi/asm/kvm.h
     diff -u tools/include/uapi/asm-generic/unistd.h include/uapi/asm-generic/unistd.h
     diff -u tools/arch/x86/lib/memcpy_64.S arch/x86/lib/memcpy_64.S
     diff -u tools/arch/x86/lib/memset_64.S arch/x86/lib/memset_64.S
     diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h
     diff -u tools/perf/arch/x86/entry/syscalls/syscall_64.tbl arch/x86/entry/syscalls/syscall_64.tbl
     diff -u tools/perf/arch/powerpc/entry/syscalls/syscall.tbl arch/powerpc/kernel/syscalls/syscall.tbl
     diff -u tools/perf/arch/s390/entry/syscalls/syscall.tbl arch/s390/kernel/syscalls/syscall.tbl
     diff -u tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl arch/mips/kernel/syscalls/syscall_n64.tbl
     diff -u tools/perf/trace/beauty/include/linux/socket.h include/linux/socket.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
