Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB123C4F3
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jun 2026 21:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782077808; cv=none; b=QyBUnr0JDU3JWuUzoTMP0Jmvw04+nP9e8I4CUX9iLtV2Xyy9xuoXXDWvjq/6n1iMldd+5VlZBUO3nbGYaenT4az9O+YVUPcBXLjL9usPQYwf26SAUUj0v0+z9b6fA0hRsOlyAnYnx+V4dejz4TbwkMp/bNmPBTc1tU+z5S9TVUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782077808; c=relaxed/simple;
	bh=5cWcfl99orNtx3QDgCk4oN/fbo8wRYqXwjgYaEIUkh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lGy794jBvS0l67V4o8t/ZANOEwSjNlSbzan9Ddsgco7MDBEhwHEhUMYujgLfdSCYUjjVNQgdAXUTCanF/vmGeTKprPukYtQEOrsmnN/Dq/kFRrJZMozKM0+TePbE8cCbwfEOCATwMx2WP8hQGuy9UWajfGjz6lQCwnXRd0t1ZRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjUbUjJH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjUbUjJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782077807; x=1813613807;
  h=date:from:to:cc:subject:message-id;
  bh=5cWcfl99orNtx3QDgCk4oN/fbo8wRYqXwjgYaEIUkh4=;
  b=fjUbUjJH3vEwj8Ew0MnbGlWCX5+P0eWcl/TrQgvp4Ffc038SUXIwNZaM
   aYnN+TDaopmuLqw9CwYh7rn/1WxfhKuEcXepiChP/S15Cu9GfH+3iH+/s
   cyvaoKKXcemCwmkcGY2zXsUMwcinmuDCPnK6eFckcybnEpwqPsWkpCd+o
   VNZ6LIfmZ6XaG/VhwWSMqLrsf4BVjwbm2RzlqEdfbYgIJ6sH1X2FVJ0+9
   YIqGZWTuXl08MDuBcbUilWpA84r4nWvtci1slsRh+QktRmGiXpyjlYLkE
   tBlFUCxtPmokvxvwWc3v9+F6qs9iLk0NYS4Xuf7kuF8KeN/H0OZqP1VeN
   Q==;
X-CSE-ConnectionGUID: vD0rhJxITF+SSrx5J49tAg==
X-CSE-MsgGUID: Zkf6osyVSzS7Gj8yCmdWCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="105609315"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="105609315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 14:36:47 -0700
X-CSE-ConnectionGUID: 59qcBu+QQ0KNjohZqXw7Mg==
X-CSE-MsgGUID: LhBkW+KGRsWl0tE9EkFI8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="273124087"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jun 2026 14:36:45 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbPqN-000000005w5-2xCp;
	Sun, 21 Jun 2026 21:36:43 +0000
Date: Sun, 21 Jun 2026 23:36:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 14242/14705]
 ../../../lib/interval_tree_test.c:7:10: fatal error: linux/printk.h: No such
 file or directory
Message-ID: <202606212349.b6LaanL6-lkp@intel.com>
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
TO: Samuel Moelius <sam.moelius@trailofbits.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ce97bd3c4f18608335e709c24d6a40e7036cab8
commit: c1fff9794a165b6b64ae4ad9b54c00bc94e7daed [14242/14705] lib: interval_tree_test: validate benchmark parameters
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260621/202606212349.b6LaanL6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260621/202606212349.b6LaanL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c1fff9794a16 ("lib: interval_tree_test: validate benchmark parameters")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606212349.b6LaanL6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from interval_tree_test.c:11:
>> ../../../lib/interval_tree_test.c:7:10: fatal error: linux/printk.h: No such file or directory
       7 | #include <linux/printk.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
