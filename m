Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B7F3AF675
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773307525; cv=none; b=VBV6USvr3baTHy+EBUcaDGItfsTHN9mKnBWK6n0MvgHGcFqLnNZ1ELEC+wxFAgwbOaMmwaek6xrpvsTNBL1IX/FhHXQHP7jNGJ1pmspzcnfOYp3dpEaT1sliSZ7QyhzdbXFqJC1vRjuuLbhdY7ZYfOcOgrVb8Z2M2QVU76x9TWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773307525; c=relaxed/simple;
	bh=bW6de7IUvkpz1h5C4o7QRA2clXi/yZdYigfbznscBQw=;
	h=Date:From:To:Subject:Message-ID; b=NlZu/rbLjRZ7o783RPSa/rH+V+A6LrFID3MQIUKOAln7M0K0OCFqjpdQtpKDDd7hOc1RMd4xTXEKH+W0bBTCY8GG1/uo7slsU359eVYpUIueKolSlO+PnWeCTsOjq77mgUI/jT+l5nrU6eYvTNqLvRLv6ZbGwMD1sjDQpCMudUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4x9+aWN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4x9+aWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773307524; x=1804843524;
  h=date:from:to:subject:message-id;
  bh=bW6de7IUvkpz1h5C4o7QRA2clXi/yZdYigfbznscBQw=;
  b=f4x9+aWNMv1zeuKjjUzxee4Z0ejkCAzBY99ZhnCIhzp+j0s18JCaeiTH
   LdyFQThUEL90wEcwlNmRrJ2hsi0jl6+JUUe8VGjSVdU/M/MbKKyaFKDFK
   nOwVuspNnbIv02mQWSjZPoepNHlC8Rb+3nf+9ftx7nnXzEkg0I13H97KN
   6nxBLSrT1MMsVj0wRSvKeFid37mk/dxnh/i/XQ7p16/VzOgENjWLtOmti
   CEA/SssQnsGBRgIuaDWcvbv876tHlysxf97j6/5S+yvqAXOtS9lEVi9sq
   UUav9ZA2Kb7s5wVrV+fkGhvkbIwpE1aO3+coZznkOjNrjlT7cr4LNP6tH
   A==;
X-CSE-ConnectionGUID: hXMKX7DIS2u5PsnBt+z/PQ==
X-CSE-MsgGUID: 7MLPG6/QRti7wbxqFZwVOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85020842"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="85020842"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:25:03 -0700
X-CSE-ConnectionGUID: 43ZxcSd2QPyf42qeHDw8Lg==
X-CSE-MsgGUID: h2BGwZoYTLebINolK7SUDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220710968"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 02:25:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0cHs-000000003U7-21OZ
	for oe-kbuild@lists.linux.dev;
	Thu, 12 Mar 2026 09:25:00 +0000
Date: Thu, 12 Mar 2026 10:24:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
 10/13] checkpatch: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603121034.bZ136GCa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
head:   3ea8b0381a0759fa0c71abae5274db2414b58e78
commit: 1600e98f37d45061fe97b1975306401c69498e9e [10/13] fork: fallback to global store of stack pages
:::::: branch date: 28 minutes ago
:::::: commit date: 28 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260312/202603121034.bZ136GCa-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#78: FILE: kernel/fork.c:393:
+static struct page * noinstr dynamic_page_pick(struct page **pages, int no_pages)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#95: FILE: kernel/fork.c:410:
+static struct page * noinstr dynamic_stack_get_page(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
