Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A07C332EB1
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 04:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787028349; cv=none; b=PeOS+GLpfM7Giimo6IWo+y3tedRkjW4SM8WxfI80bVOD1zDaFQjEPrQtZaSYoxl8pJN4PxHFjKGTH2kJYMpGHTQ2SkLfnDoaF3KGeP3Za/RT9nbjypQexHACW2GpE4ZM/4yZJan2jw8J3uDIpo9I6x8Sb7HRVeqiYpZulNsWps8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787028349; c=relaxed/simple;
	bh=JSh3tOpeiGwkZreQ+9+Cx4EhxMF/55j35F14ochvAFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GL7Vo6HBNBiSdiX9M3YCtQzUd/dUEuCRcLo648Lz+G1veKr7baOM0MaY+KhkOw4VKhAlYGpcGhtmviKoVrN8Z/OKhv2hGuenEuCDxikxpZZSoxXkO19siPzD2TGnaepJeeCkTtC2jJOo0gac3mcYcq5FsmLhkgZBk98dLHpAZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7WQT8vi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7WQT8vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787028348; x=1818564348;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JSh3tOpeiGwkZreQ+9+Cx4EhxMF/55j35F14ochvAFk=;
  b=P7WQT8viuBUTUwT6LuTcwjASTvnT/tWl8Aft6M5Lx0RPFPIkv4mxvG0z
   rzZPr6UPYCjJ9whrMlZb9OPPY3IoobZcrLE2Q1mgQHBjWGQzTgaEknNfS
   /fp9tyRrwhFpAl6JLOq/UgyCb1vCJMRQp+ND/qfsf+PuDqTXVfKcCFbIA
   LWrP4M7Ji8TIKfKLkFvsw2fFOW7NtS0k3uf+xjtQHMOmJ29i8SN80YhCn
   vn6SEpO2PeVV0TuCcBSA4UAvqVhwBBwRpqlGq3z+WCW0A676zYefCj8bm
   qWGNJ6mlvjkGo6TNZ2jSB4+UcCDZlUBW+f6mZZkqQsTGMZafqTuMBUdnC
   A==;
X-CSE-ConnectionGUID: UzqShEfxRreIejL9TyJtdg==
X-CSE-MsgGUID: 6cYtU2MMSmmazEO4l344Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98102494"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98102494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:45:47 -0700
X-CSE-ConnectionGUID: aKjPHRM6QnOQVMzCeXTWZA==
X-CSE-MsgGUID: aChHsV4BRDKPHu4+6kSiMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="303340749"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 17 Aug 2026 21:45:45 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwBhn-0000000072r-3CUD;
	Tue, 18 Aug 2026 04:45:43 +0000
Date: Tue, 18 Aug 2026 06:45:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] tools/nolibc: add err.h
Message-ID: <202608180604.3dLenuJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260313-nolibc-err-h-v2-2-f4481053b07a@weissschuh.net>
References: <20260313-nolibc-err-h-v2-2-f4481053b07a@weissschuh.net>
TO: "Thomas Weiﬂschuh" <linux@weissschuh.net>
TO: Willy Tarreau <w@1wt.eu>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: linux-kselftest@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Thomas Weiﬂschuh" <linux@weissschuh.net>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 745dadd6d3d984feafb96f27b60d74b29ade4957]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/tools-nolibc-add-support-for-program_invocation_-short_-name/20260814-021623
base:   745dadd6d3d984feafb96f27b60d74b29ade4957
patch link:    https://lore.kernel.org/r/20260313-nolibc-err-h-v2-2-f4481053b07a%40weissschuh.net
patch subject: [PATCH v2 2/2] tools/nolibc: add err.h
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260818/202608180604.3dLenuJN-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180604.3dLenuJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608180604.3dLenuJN-lkp@intel.com/

All errors (new ones prefixed by >>):

   nolibc-test.c: In function 'run_startup':
>> nolibc-test.c:750:9: error: unknown type name 'bool'
     750 |         bool proc = access("/proc", R_OK) == 0;
         |         ^~~~
   nolibc-test.c:49:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
      48 | #include "nolibc-test-linkage.h"
     +++ |+#include <stdbool.h>
      49 | 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
