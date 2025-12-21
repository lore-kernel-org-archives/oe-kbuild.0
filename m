Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39EB249EB
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331006; cv=none; b=TXdcf8O9FqsLemfGpREt3raiFEyKh2LPRIlU6UK7J99RX7BdXpE4o9gRutVlP7cirBaZisvXTzfpbYC/7CU+Oa9AyKWOwWhXV459bc0dFEYc0Wv6MiTxMD/FPrv1XTvCKtalLH2m7U0IDb8qLDky/fXp+cPl/gc6BYiHYaL9nWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331006; c=relaxed/simple;
	bh=rrNzhDdr78m1fi6VKi062vMXJRr3qKZMoUPRH/alAy0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oz9mEYGgSMGSkswYoCiSxRD1FUrDmsbLlZeKEPvli4+JCveOwVo12Bj1YKKNv/2ZEuVUtystsMSBiccwJ6mkr7zo01evKERStCA8lm+3u3qtyb+gPARQaCiA313UKxQ0l52kNJ91KY2ux73tQQk1EFg4hPb1JzLWZZUkEkDUQAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZgGDIBx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZgGDIBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331005; x=1797867005;
  h=date:from:to:subject:message-id:mime-version;
  bh=rrNzhDdr78m1fi6VKi062vMXJRr3qKZMoUPRH/alAy0=;
  b=EZgGDIBx9svwm49qmEi/9R6LsNY1djzAJUxlUUHqVkkwph7uJIzZuqtq
   SDV6nCBkW7SAL17RcNLNhxku9GM1bz2s3x7+SRq62HwELwzYMVrE8tRSS
   uHsnLpDye59h8lwiqScJNIMGhG0aoJpVRCrWHpjGmNn4tRHJ7TBc+qL2f
   7EjaHwEX4BHdl5tc57j2etP/7nMurV2P40UkeJpJ2WRvgkluKv6B3dnHQ
   fbu+TuQeHsmvWAnRWBCQUy6YyH62ZYH1SurBx7ot4QJdY9AgBHZK2SIAs
   T+U8ffoZvCEpHIMDq0LarCtWRBcshVpflaLS9TtWlL8BCSG93QzFoJ+XN
   w==;
X-CSE-ConnectionGUID: 6TqSeiL7RP2yY6fJnkCKUg==
X-CSE-MsgGUID: N4HSczofT9yfQIyFgb0njg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72058558"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="72058558"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:30:03 -0800
X-CSE-ConnectionGUID: PPR8LRIJR024ojKO5OhOcQ==
X-CSE-MsgGUID: v6vbTYcvRw21QyeBZakqwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199836863"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 07:30:02 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLNg-0000000056s-0viE
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:30:00 +0000
Date: Sun, 21 Dec 2025 16:29:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 16/246] checkpatch: ERROR:POINTER_LOCATION:
 "foo * bar" should be "foo *bar"
Message-ID: <202512211658.rswoOGcT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: dbab7a0d5d9788e6f3f163fdb9f539abc7e56231 [16/246] drm/apple: Add t600x support
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211658.rswoOGcT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#165: FILE: drivers/gpu/drm/apple/dcp.c:845:
+	struct dcp_wait_cookie * cookie;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
