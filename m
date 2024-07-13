Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E86168DE
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720882891; cv=none; b=ZKVoReJFsN6Pi2UaYZRJT2C1sahdyDeu8k2QjzkZNt/g1jUE+ZG6F81+ZGrRGvclbdWC1HgJfA79cjX81+hvFNRc5MN0wDRSW1H4gmu0R0G5Bg96rIRUhmyQ+ywl9GP5YK1AgIJrHoXBjOUa1Opq+33ONBL76cQ1NoK5smlEfI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720882891; c=relaxed/simple;
	bh=1y3i0pncfY8jy3YdrvJjyFTZa+sy7ILbrxQbgcytNe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gLXPskEM6VG6TZNdMy/9/eYH1nkaZS7u5gVcJWX7av1qiKk4KFSzSDrih9D0YnKsDo66nzrm1UmNFwy0Krn7d0bUqn1MdOBxTHnrH6EqCYLVBu1OYMdn7ZtJ2IQyVEh7GXgQo18MO1dB7YEzv3Jr30bKDVvFk9Zfa8TSM6vUSmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdMP9fjR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdMP9fjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720882889; x=1752418889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1y3i0pncfY8jy3YdrvJjyFTZa+sy7ILbrxQbgcytNe0=;
  b=fdMP9fjRT7/M7aFoCX/lA/5s7JU/pdHO+E57moSRBJNrBQMRgoyHeycD
   7rgwGuo8GucfSNDzoR4TA51tLTsSRZVjebVl0Bk6JsRHJk15kw5IMWySx
   AX+lfsm4FjrrFoUYKsCaoYxYKU53RGuGHkzBiQGl0RbMpUh+YPah6TRsq
   tTFWVMOCPRMMdKiTT3NiCYKeb/zcbRi94dzamH/jyLQgcta0+MANnYOKl
   LGHERPb4Lfb4q0DtNPJavfC3I+q/FnUutBy/MJHciYmStcbfe/eHvXcIr
   eryVdADx27iC2IAGn5EkuKOJTQEo/XmVAN2tpdha/cZ/o6JfTUFUCy9B0
   g==;
X-CSE-ConnectionGUID: lUZIWX0/QRyOEDWX/T7q8g==
X-CSE-MsgGUID: Wi/bwZkEQ4KD/2QkbT7fLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="43726523"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="43726523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 08:01:28 -0700
X-CSE-ConnectionGUID: /yLp0p1vShS/X7Tu11qz2g==
X-CSE-MsgGUID: JIlBL1RkRg6s02hBGiKa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="49269764"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jul 2024 08:01:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSeFZ-000cIE-1t;
	Sat, 13 Jul 2024 15:01:25 +0000
Date: Sat, 13 Jul 2024 23:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next 1/4] selftests/bpf: Add traffic monitor
 functions.
Message-ID: <202407132213.2rer2R4r-lkp@intel.com>
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
In-Reply-To: <20240713055552.2482367-2-thinker.li@gmail.com>
References: <20240713055552.2482367-2-thinker.li@gmail.com>
TO: "Kui-Feng Lee" <thinker.li@gmail.com>
TO: bpf@vger.kernel.org
TO: ast@kernel.org
TO: martin.lau@linux.dev
TO: song@kernel.org
TO: kernel-team@meta.com
TO: andrii@kernel.org
CC: sinquersw@gmail.com
CC: kuifeng@meta.com
CC: "Kui-Feng Lee" <thinker.li@gmail.com>

Hi Kui-Feng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Kui-Feng-Lee/selftests-bpf-Add-traffic-monitor-functions/20240713-140129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240713055552.2482367-2-thinker.li%40gmail.com
patch subject: [PATCH bpf-next 1/4] selftests/bpf: Add traffic monitor functions.
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407132213.2rer2R4r-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/bpf/network_helpers.c: sys/stat.h is included more than once.

vim +13 tools/testing/selftests/bpf/network_helpers.c

    10	
    11	#include <arpa/inet.h>
    12	#include <sys/mount.h>
  > 13	#include <sys/stat.h>
    14	#include <sys/un.h>
    15	#include <sys/types.h>
  > 16	#include <sys/stat.h>
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
