Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB61E834B
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307073; cv=none; b=VIbXfhc8nkPE/Npfa+0HkDOBbh8fB1gpKSl24xa9LVjBp75N8/HsUQv/09/xoIA0b+DGlppFQKbx3BWC8rp4JCQLiD78AEs1sGljiy0Tp27ZiOmkEI10qUnNxFZ2832VJxVrNDeI/NF4icytwBKRlB1ofCv0iAEqsEzpIN324cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307073; c=relaxed/simple;
	bh=3Hp0ifRD2MV4MyJOlQ7GhwcS5jBxasnkq3nTgKiOzaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YiQ1z6d06zhQShA4AZjc4n5frczmlp9m9aR6d9E3cU5HJpY7+IHE9G7qrpAIw0Id4tnghkF5BFs286uyilBqzENRMi5gQsx1KHPDn6Xdiz7p0foHGUuoXQjV49/AomVO+p0sxJHI+acbMn+lpGtSnnm70e+kT/Vg9Tiy7P3cMeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftUPOChw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftUPOChw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747307072; x=1778843072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Hp0ifRD2MV4MyJOlQ7GhwcS5jBxasnkq3nTgKiOzaM=;
  b=ftUPOChwgG5EX+PbqK8IVLyKzpi8mWWHhmYM/MtjsjhlQZmt0dfxxzTO
   rgRg97BDNeT2ex21+W/9m0k5Ei045qeHAfauZHFUT7YUQpDYEr0kZuYc6
   fntA2cpIrt/7MNbDiZiSB1Y2d5S/6NmL7C7AxL2piUHtUqwoSCsAFxZQ8
   CuEhPiqaWd7QHkIXEbYwc7vObv2lLdONmviUcuNW9XNV+BvnPzfuhIJNl
   XyzynVvBMSWgHE/+feT7IYzMXeT1SpNN1mFa0So9Ay+dg4hidQfDRqSXn
   co2neTQ+uOCKhf03Vs2jVju8DP3QePYd0rqm34/hX2s/j+X1whC8nQcLP
   A==;
X-CSE-ConnectionGUID: Jmx2Q3qiQ/OMuQJEdseEfw==
X-CSE-MsgGUID: ZMDFDb+TQLO23ctzAvw0nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60573542"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60573542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:04:31 -0700
X-CSE-ConnectionGUID: szmFVqEyQ/iWAw6WUPk4Hg==
X-CSE-MsgGUID: MVXCEHoITdixJLYTEZRYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143444363"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 04:04:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFWO3-000IIT-25;
	Thu, 15 May 2025 11:04:27 +0000
Date: Thu, 15 May 2025 19:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 190/190]
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c: asm/switch_to.h is included
 more than once.
Message-ID: <202505151953.5zyr5kIK-lkp@intel.com>
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
TO: aubrey.li@linux.intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   2c213f4cb65d94953b0c3e4120d06be77fa627ba
commit: 36ba16c179734439727d87ef31a388aa4c13784f [190/190] anolis:driver:drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505151953.5zyr5kIK-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c: asm/switch_to.h is included more than once.

vim +32 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c

    28	
    29	#if defined(CONFIG_X86)
    30	#include <asm/fpu/api.h>
    31	#elif defined(CONFIG_PPC64)
  > 32	#include <asm/switch_to.h>
    33	#include <asm/cputable.h>
    34	#elif defined(CONFIG_ARM64)
    35	#include <asm/neon.h>
    36	#elif defined(CONFIG_LOONGARCH)
    37	#include <asm/fpu.h>
    38	#elif defined(CONFIG_RISCV)
  > 39	#include <asm/switch_to.h>
    40	#endif
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
