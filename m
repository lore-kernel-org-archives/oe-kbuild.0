Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB8C301015
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761419969; cv=none; b=qZZc9oRklL3z4iKiCH2+WJPEexDxQ0xlINe923ddI8iY2gJ9Kl+M+qhoz6z0n4W2f6EVG1Wtf9Csi1z93GWc7GsveMTKBJ8eW5HIvlxazh6+hNffScYMEtRSUhelShZO/+oDRp7Tb9Pz6X9HT1pBcai81sw1NnNRYxTRILdd3sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761419969; c=relaxed/simple;
	bh=WDdOjHZh9xgAL86ybjLl2tIE+vY11gqlQXgUuRudoMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUNXmMxfKHoC+2uLUXaJSWY9MJBdaMy6n1v/Wgi3lK7yEe2rYceNSSS7QocadDd+hO2sYQb+ssT7rZuF+gNSV8cGUB0gk/ZFypKMJfOLwktdNo9jV4NyCRE61j3yQjRWQnlshKai9eAm7CjPeYDrmsoRjsqlQztdnH9pyVoL6ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5lpfE0I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5lpfE0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761419967; x=1792955967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDdOjHZh9xgAL86ybjLl2tIE+vY11gqlQXgUuRudoMk=;
  b=N5lpfE0Ic7/RK3FuOMHyEnLXu2uCEDPwSh310S0j2Zc+A3bu7SD+YFwc
   W4Rc4XGwuC9IxxDPrDDgEiD+p9bDjneERIaFTqfCLiGXg7PP0TPzhBym6
   M3AgNZNh48hEACaZrpyEJJgKLg1GGn3eu5O9zvorVkL+kDAejVVKXT0PH
   5DfRicm6YnhKMLTTts0RnQMrlnHYjIEaP6MzIN8CmMdSy3tF0Fcieiil+
   IHT9d8f023qmqtK7VwfJT0yO+vWhJgep/5pZ4VZQ/aBsLSmht+k02RfbP
   3KDk5m80OfKwcvLqbKofmIM0Z7T8ozqzEdRBzWUCzg+qLT77y54GrTLHn
   Q==;
X-CSE-ConnectionGUID: T7+MxjtGTxezD4n8hIDBoQ==
X-CSE-MsgGUID: y0fwDm2mS5uJb1wDsjnyDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51137371"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="51137371"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 12:19:27 -0700
X-CSE-ConnectionGUID: akJcDS2lRn+HIcQmmHmtAg==
X-CSE-MsgGUID: 7nTxFlXsRL2wdfhEjw0eqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184765911"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2025 12:19:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCjmk-000FXU-1n;
	Sat, 25 Oct 2025 19:18:50 +0000
Date: Sun, 26 Oct 2025 03:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: file_stressor.c:5:10: fatal error: fcntl.h: No such file or directory
Message-ID: <202510260349.tkX3fc9v-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bb956508c9d94935bedba4f13901fb2b7468e91
commit: aab154a442f9ba2a08fc130dbc8d178a33e10345 selftests: add file SLAB_TYPESAFE_BY_RCU recycling stressor
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510260349.tkX3fc9v-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260349.tkX3fc9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510260349.tkX3fc9v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> file_stressor.c:5:10: fatal error: fcntl.h: No such file or directory
       5 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
