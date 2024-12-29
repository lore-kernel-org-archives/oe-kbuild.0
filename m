Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4200516F288
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Dec 2024 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735514422; cv=none; b=RrbSKljoApnsTjSbwg51ApQndjQDh6F8zBZlDRBCwojPzWoSsd4E/fqcTycHdGcTfW4WoU7x2JO110nG+lf9299ycyWlxwxNcHkKZsK3H6V5Wf3BYW3f6aERnT7VnNgTQtAc4ixX94Rl4tjZ1ThXNDFWdxh6dxxldz3zglSvYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735514422; c=relaxed/simple;
	bh=E9ooWF4yCIFSXGmAyNNYdqcCGNipL+qaERT56kQzAAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QlDN6+/HH9HvGQS0t1AIGo60wzYUG7LxXRGbSSlLX4Wijs1/ZkXizdlcUEdJwXQPVvnEsdMy3y5DnbKoF9Lt5mAudrw+cX2gz0++eS3AlDTYxXZlIyVaJFwaH9EhpyxgEfCKFNd75QVC486vemt06EnK+ZkvTBQYvtdQaLFbrRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCgKelif; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCgKelif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735514420; x=1767050420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E9ooWF4yCIFSXGmAyNNYdqcCGNipL+qaERT56kQzAAY=;
  b=bCgKelifsySlQsApU1f8wOZl9VF7H7osJhiNFFYFD80o2RVaPb3cv8zV
   5fWbMUAGX+KF6AeJDQguWKbYh+fCxjytdDo1zmkaWP9Ug1fRwvm5yUHLt
   HGf3iVoT7VGTBffqtYtE1FmyjIF2rsDjv+CM/p+IXA/COSF6ZKFjVTxfZ
   nkk7uTuMws172cWEIl06hCOfb5ayFT39m9iSkSGya/m+wNfUsbHulF1n6
   MgEOS2xyA1SKh+3fVjlQjjkcRwBLb9AAK+pk2B9MomyKR8b3jdifBBMX/
   hWJALVizf07EYgUC9Lxv/a46P0qspGKbie9HR7wYsESlvV27tTwogFQNe
   g==;
X-CSE-ConnectionGUID: +/OkYPivRw+Y0OISi1i2bQ==
X-CSE-MsgGUID: Eq6eIg14SzekLPDS1Ybtxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35969178"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="35969178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 15:20:18 -0800
X-CSE-ConnectionGUID: MMZ71eoNSuOWXzAJOB/jXw==
X-CSE-MsgGUID: 9yNdfWnlSY6RzZgPvizRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="105499222"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Dec 2024 15:20:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS2Zz-0005EC-2p;
	Sun, 29 Dec 2024 23:20:15 +0000
Date: Mon, 30 Dec 2024 07:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 21/21] In file included from
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts:9:
Message-ID: <202412300710.ZnRDQNZg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: In file included from arch/arm64/boot/dts/exynos/exynos990-c1s.dts:9:"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Igor Belwon <igor.belwon@mentallysanemainliners.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   f21231ac28f44cd5daf50bc8fdae381f451b46c9
commit: f21231ac28f44cd5daf50bc8fdae381f451b46c9 [21/21] arm64: dts: exynos990: Add clock management unit nodes
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241230/202412300710.ZnRDQNZg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300710.ZnRDQNZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412300710.ZnRDQNZg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/exynos/exynos990-c1s.dts:9:
   arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error: dt-bindings/clock/samsung,exynos990.h: No such file or directory
       8 | #include <dt-bindings/clock/samsung,exynos990.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
