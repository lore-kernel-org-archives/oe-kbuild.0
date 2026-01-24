Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88EF3EBF0C
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769254677; cv=none; b=e23XKn8ibBIBo/NJPfMqS4++3XSo5agzS/2btsWJ0HqGB5ZoYJEyOsoKUeGtK6Kzk9/SGjstgHR6jGNoZ4LnCXnmcBDGXzDMHRG5tAXblejc5c2beQnLPkmjPWFxxjCYi/rhe8Ro3/x9u0D+5VgZIMFmc8XruuhMtAnEz4DxJvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769254677; c=relaxed/simple;
	bh=ycSY/g+LEB5EtYCitUFXiEnRLhwlNKM3Zmgf7TF4Ius=;
	h=Date:From:To:Subject:Message-ID; b=jvWvutTPwywUDbzDC2IjJUs9n83Jdez8+NWR7jnYWsYYRNFOyg4yhKLQv9OJUJEc8+GcGfBEogNATlCS6h1pyMyx7CrKykgtjjNA9gPQpPh55gKRklBg8YRefEYZoV0BdBijzHCNnAeR3OeIjDlBPsl7DvIrvj97Yc3xxhQCPWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQG8E6a1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQG8E6a1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769254676; x=1800790676;
  h=date:from:to:subject:message-id;
  bh=ycSY/g+LEB5EtYCitUFXiEnRLhwlNKM3Zmgf7TF4Ius=;
  b=hQG8E6a1KSFu4PVwkr/2uEJmIbklAgnQLja1dgFONj1ZGGrQlI9Qv5x7
   7TkTmdX5vKTYJdDlJmpyV5Kx/3Tg8mp8UvT9ivxMdqVIxRHcrveX8ctUy
   WDHKvUgvQDeUczncRfLCnduWZ0v4igB3ouDOu3PBo5627FMknYtCx5Doa
   m+EGzj0EzjIiEm62KqGCxZ69cyMlxOx3pprJeXhQnvXL6ybarP3oM0i1U
   MuFTv2Qk6QbRXVtaGjRG8YY4MxfgPQcYyBQ2+3dCNhH+6JWcxVHGRwiUp
   EfghQCAsuUrxWA3RJg8JY77885Y1wpn5ptHvHKMS+2nrjX7VoCggcAmbO
   g==;
X-CSE-ConnectionGUID: vnAwJwHPRhSD3xOJNpBWHQ==
X-CSE-MsgGUID: +wje9Sq7TMmaSZjhpRBa6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70210343"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="70210343"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 03:37:55 -0800
X-CSE-ConnectionGUID: MsNGBq+YRAiYPCw9QBlmuw==
X-CSE-MsgGUID: 3x1xM4c8Snq/TIDyQz6sXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="238503806"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jan 2026 03:37:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjbxg-000000000xl-33lS
	for oe-kbuild@lists.linux.dev;
	Sat, 24 Jan 2026 11:37:52 +0000
Date: Sat, 24 Jan 2026 12:37:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 23/47] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'as'
Message-ID: <202601241259.xBFvEr2i-lkp@intel.com>
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

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   4277c23972d92102c257f4d22acd908a47c0d69e
commit: 69bc938b97bd23e69419624503e7290ba5902c19 [23/47] x86/virt/tdx: Add tdx_alloc/free_control_page() helpers
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601241259.xBFvEr2i-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'as'
#358: FILE: arch/x86/virt/vmx/tdx/tdx.c:2226:
+		 * tdh_phymem_pamt_remove() fails.  Don't panic/BUG_ON(), as
+		 * as there is no risk of data corruption, but yell loudly as

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
