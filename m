Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4994395AFE
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742782; cv=none; b=b0gj/2qeS91waJEdID/nSGzpzJTElRci/m8E5i11hZMGO3n6sXpUrYo8MHoLIZx2zpOopru/eusq3LHRmP/JG+PtEVKJNjjx1mMZoPjigPFKXnhl+iVQ/XpI23q3q22aYf60IticvFhWEDS/i0mLwTY4HcGO/Xe2eIZ8H/n+oeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742782; c=relaxed/simple;
	bh=0XlCZcRQSsh5+jDzymXTDKp1s0byqkxo0Mm9wFS9o/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qLTrztsdBMA7nZ5q7cXry21eEaa07wklgtYLCmZExy7UEFkFySr3T5Nrrd7C4Ck6/m8Vpt9TitimXoRaILLsIBbs76aTO2aan18HvJnzzJYTtos+3Wl+MJpsucYiX6OJempPa2rFBRV6bVb55+EHm5wOw46n4T8ngxyXp2tw+Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFcFvK76; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFcFvK76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789742781; x=1821278781;
  h=date:from:to:cc:subject:message-id;
  bh=0XlCZcRQSsh5+jDzymXTDKp1s0byqkxo0Mm9wFS9o/k=;
  b=GFcFvK76m+vQvLBgJwbYzb5yLEPqpmVBfhRJ04xLUBCyxffEgYVjxKYe
   Yy7DkWoSyJVVbac27Hrgcoy9omnSjifURpv9GEp6f8lilWS1JEnQgAUJE
   uNgsAES6VXVyHWtWgwTdCvo7NbKwFQZYgxUflsPLvJxkrVlL2gaiEm2Gj
   mFglj7DrilTJhw5gQbgEBDxdT/IovOJzayeL6BwhshULVpoZKfYJgKJ6z
   n5qJ4tE4kECpUc47kS/6JttUWZcZUDTwYTY66zb4u3GF8vbRxNHD7jBsb
   aJ3pevCuLAD3iKVL7LCbTk0fYPU52G37Rc8KoGTNw4n+DLQMp6jQ3jCeF
   A==;
X-CSE-ConnectionGUID: KpLZWWdUR5W5C+6vrWpNig==
X-CSE-MsgGUID: zOqpe01YStOOwYK1KZKg6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101603271"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="101603271"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:46:20 -0700
X-CSE-ConnectionGUID: w4rp/rLUQHytJwJtc3omQg==
X-CSE-MsgGUID: lNKNsv8DRKi3ST+U/1vjBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="297893136"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Sep 2026 07:46:19 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Zqu-0000000017I-2Km3;
	Fri, 18 Sep 2026 14:46:12 +0000
Date: Fri, 18 Sep 2026 16:45:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 274/274]
 load_address.c:81:25: warning: incompatible implicit declaration of built-in
 function 'strstr'
Message-ID: <202609181621.4NlqCGqN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Kees,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   9fced71ef28951d69d24623acfa1f8db4d22c798
commit: add3a49ae91a1f6390b3fbf14a7ec9c6231bfbd6 [274/274] selftests/exec: Build both static and non-static load_address tests
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 4 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260918/202609181621.4NlqCGqN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181621.4NlqCGqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609181621.4NlqCGqN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   load_address.c: In function 'main':
   load_address.c:65:69: error: implicit declaration of function 'strerror'; did you mean 'perror'? [-Wimplicit-function-declaration]
      65 |                 ksft_exit_fail_msg("FAILED: /proc/self/maps: %s\n", strerror(errno));
         |                                                                     ^~~~~~~~
         |                                                                     perror
   load_address.c:81:25: error: implicit declaration of function 'strstr' [-Wimplicit-function-declaration]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:10:1: note: include '<string.h>' or provide a declaration of 'strstr'
       9 | #include "../kselftest.h"
     +++ |+#include <string.h>
      10 | 
>> load_address.c:81:25: warning: incompatible implicit declaration of built-in function 'strstr' [-Wbuiltin-declaration-mismatch]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:81:25: note: include '<string.h>' or provide a declaration of 'strstr'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
