Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF831591EA
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 08:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512130; cv=none; b=UHBAfKx93I4PZI8WX7RFdv4M2oXFE2y3DyUJr4FtMdFtmKBkyJGkggALymKUNTDsbxh5/ucbM7xi3sSb7qeUeUwiYBacZiNlcS/Y3O3Qx+Z7u9e4jQdzjekr4oS8IohxgOXkBFyMA3vtu8DEwUM2cmCuSf4y9kG9kVQhIpRWOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512130; c=relaxed/simple;
	bh=NXgE8znWRXMLg8Bn40rn0/ZUv8ugdp3hCF4xmY+jIfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QWhrFpaC+kpsnA4zkw9wg5CqKgY6YZkrz1dw/52jJj4CrgbFU2F+Ze0CKUdiOCaCAZn/VBVAeE6+EPebJyqMhQu2NznOzK9hknRLUX9kTYf+AWg7Yvsko52/9J3lwaZ9YSyJTWx7AZi7HhflvmiZv7V86NeCK7QEzjz3fpy18yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpT2I4mF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpT2I4mF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734512128; x=1766048128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NXgE8znWRXMLg8Bn40rn0/ZUv8ugdp3hCF4xmY+jIfE=;
  b=HpT2I4mFFRFS/FQmD0INBhXugwaPSbF1w897Rkqak5qG2Yo7jiNu8iUW
   GRR1KCBryFY8JzJzPsghnLisVr9AxQggxEs8raU39dpNWQC71HAojHDuf
   RyEI+bIYrCsOK243ac6mo+VQnjI3Yfd/28QfjA1Ci9Fnr8/THhmQITJY3
   t+UeGteJbSDq0gtnHw9VXlntHKXMYk3V30WL8Ylbd5vPgEvxeQxRrs/yT
   Z04ZGG6vwHjN497eDdeUfK6AlKQ7wf9cu84S1cllhfi96kkdR45SSE6UN
   XcU154aqHxXAE6i543Rznn7KTsjCcYBg4mxHBKyT4wk5VReh0lGueCU6+
   g==;
X-CSE-ConnectionGUID: OYffg8y0SjmEa6LGNrQsBw==
X-CSE-MsgGUID: zGpUq10ATiSec5vZq/g88g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35131934"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35131934"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:55:27 -0800
X-CSE-ConnectionGUID: MCnLxZu3QSe8yTccwgvRlQ==
X-CSE-MsgGUID: 0Yizpye8R0WdqxzoR5VU9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="102796495"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2024 00:55:27 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNpq0-000GDs-0i;
	Wed, 18 Dec 2024 08:55:24 +0000
Date: Wed, 18 Dec 2024 16:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: llvm-objcopy: error: Link field value 83 in section .rela.plt is not
 a symbol table
Message-ID: <202412181651.ZY2nZCnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aef25be35d23ec768eed08bfcf7ca3cf9685bc28
commit: 397586506c3da005b9333ce5947ad01e8018a3be modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: um-randconfig-r133-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181651.ZY2nZCnO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181651.ZY2nZCnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412181651.ZY2nZCnO-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux.btf has a LOAD segment with RWX permissions
>> llvm-objcopy: error: Link field value 83 in section .rela.plt is not a symbol table
   btf_encoder__write_elf: failed to add .BTF section to '.tmp_vmlinux.btf': 2!
   Failed to encode BTF
   .btf.vmlinux.bin.o: file not recognized: file format not recognized
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
