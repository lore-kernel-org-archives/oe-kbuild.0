Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279422628D
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768076663; cv=none; b=cey0/0M+KKtF6SKBkwcNWlA3ct2jEYG8mKjriYRWA0LWmHlp4zvVoY6C9VPejdj8LpC4ius478dYYQNU7aYooiPGzrAPLIlSkOOq8r+LGSz8uUaF9C2K/TvDi741N7fqyfm/Z7RZEebx3uF5CpiKwRIcUfVHO8xX3JLAQ144/qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768076663; c=relaxed/simple;
	bh=3zPhXWS5NjOc00N2hUbiO7x+yYHbxq4gREYiS1aunUQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GDGOt3WxIcaGd110vHqY+9olFJGCn+LATazWSa2AoDZsNvQtjvRYIFXANbNHTKpGekypSWKr+f25gpt79Iky6ho3ZRAREl2ILPmarETxDnSLdvobCO6KYOOqOwsV1BjPiCrvo//KI58Cd3q/nmDtxontc+HocNOEfKk6vWIXhjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8N4dudM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8N4dudM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768076662; x=1799612662;
  h=date:from:to:cc:subject:message-id;
  bh=3zPhXWS5NjOc00N2hUbiO7x+yYHbxq4gREYiS1aunUQ=;
  b=n8N4dudM1pnIc7+dFD6PqTjpdZLk42hDSUvSgTA7hgKhclKB0UiVjwX5
   hMW72kHNbG1RAD5Guzpk25/gjDST1xz459nXiRswahqMy4k91v2qFjePh
   Wrj1YSSF3pOBdOgLVMJ9C/mjptTyuWhWDKurdPcQNgO+RmHgeKilgqK9j
   5muILmg8G6hYYqMXiFb4lkYA9M0eBLF5ZbcKt90/vkOvd05VKSv6slSBx
   QFj1mnEV82TfuLde7kuYwDqiF9xi+XEDRewJNEBsmEgCm8DbdI8ziqu8w
   /HboGxGarvZeWkCYSRhJ3/5e0zyWBBlQSuSp4dZ8mtjYgaFLvK3cl6c3D
   g==;
X-CSE-ConnectionGUID: EVv9Jq+9TtewH5n6Hx1MyQ==
X-CSE-MsgGUID: Tqv0UCP2Rh6183n/HTUr1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69466148"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69466148"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 12:24:21 -0800
X-CSE-ConnectionGUID: rrU65e2sRM27EBFXA/16DA==
X-CSE-MsgGUID: ZaFhTioOTaibhOn3PcqDew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="204171255"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2026 12:24:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vefVR-0000000098K-2Ait;
	Sat, 10 Jan 2026 20:24:17 +0000
Date: Sun, 11 Jan 2026 04:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:clk-for-6.20 39/42]
 drivers/clk/qcom/gxclkctl-kaanapali.c:75:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601110424.1qzNkIbn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/gxclkctl-kaanapali.c:75:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Taniya Das <taniya.das@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.20
head:   b2f36d675e09299d9aee395c6f83d8a95d4c9441
commit: 685ec348339b118bec728458d0bc3b3e7da1ef0d [39/42] clk: qcom: Add support for GPUCC and GXCLK for Kaanapali
:::::: branch date: 25 hours ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r132-20260110 (https://download.01.org/0day-ci/archive/20260111/202601110424.1qzNkIbn-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110424.1qzNkIbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601110424.1qzNkIbn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/gxclkctl-kaanapali.c:75:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gxclkctl-kaanapali.c:75:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/gxclkctl-kaanapali.c:76:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gxclkctl-kaanapali.c:76:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/qcom/gxclkctl-kaanapali.c:76:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gxclkctl-kaanapali.c:76:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/clk/qcom/gpucc-kaanapali.c:42:22: sparse: sparse: decimal constant 2500000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
>> drivers/clk/qcom/gpucc-kaanapali.c:481:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gpucc-kaanapali.c:481:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/gpucc-kaanapali.c:482:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gpucc-kaanapali.c:482:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/qcom/gpucc-kaanapali.c:482:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gpucc-kaanapali.c:482:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +75 drivers/clk/qcom/gxclkctl-kaanapali.c

685ec348339b11 Taniya Das 2026-01-07  74  
685ec348339b11 Taniya Das 2026-01-07 @75  MODULE_DESCRIPTION("QTI GXCLKCTL Kaanapali Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
