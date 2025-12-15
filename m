Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B743147
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 18:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765824064; cv=none; b=P3KV1aaxTcklLxyI9pXLGt5t3PJYSeFd9Kml/OShjw7de0Lq3J6MV0BkYdahWv5uKUr0yqEBN/HhkwKeWN4XPkeITPkq/CAc2fji4AoOoruqz/6FXiblQZZRZCbM8TAmgyCH8Fr7ySKHvd5xBZDHrn7JUMr103oHfUUiMa6a2uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765824064; c=relaxed/simple;
	bh=49SfR5hss5wb+F9idCBmxJvGud84UKnNKpiXT9Hger0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VKRC0dchGdg4jgO+KPD8G2Pz6cOWC0q/sYxvPSOTLkM/8ZtidW8bRfnapI//UdQyYu+k+/uAZhnxy8+/UtzYpiYkcybebAstgjmf9+yWLRh+9B1K+PUwmzYwdknTbSFaunzFwmTgo7hoI1Ij8fpAMe9vU4dHi/hw596GZhSB4GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnieNBhg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnieNBhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765824063; x=1797360063;
  h=date:from:to:subject:message-id:mime-version;
  bh=49SfR5hss5wb+F9idCBmxJvGud84UKnNKpiXT9Hger0=;
  b=jnieNBhg9RuxcO2ckOaqiVJ1F4dKvdkSqan210TruHATP4VeC0RWH3K5
   ET2ImlGGPqEaKIv6hftEpPwKnJDyNYjIkT/CcD3V5akSUODsuWjMqPBgR
   DyA9OMoKa7aMqxnVAoK9eNfmLv8/e9fI/fCsfodg7e8+GjPQ9GQZwfNax
   KPCGHtVDDzsgHxAarCF7+u5JolzDoxZWMge3kEunfdJWMrq3a1M9vuOnK
   GGaqVrxM4691JF6fbbvw8o2E2P3sSUSKxyk9x7LC1x7x4oKwifWpYuBn2
   I5GWLk+6CU0I6ZyKuF7/3oWRVoHXzIhQ2xSX3EpiCNsNctLnPubGUZCAn
   g==;
X-CSE-ConnectionGUID: 1cdGzULJTWm6iTSCWTa+LA==
X-CSE-MsgGUID: PA0+2cUZRn+oFCAwD3HudQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67612251"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67612251"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 10:41:02 -0800
X-CSE-ConnectionGUID: nq8spb7STCaDHU6gdvCK6Q==
X-CSE-MsgGUID: 23ZDcBq4R9ussYFMomOhPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197790179"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2025 10:41:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVDVC-000000002jk-3595
	for oe-kbuild@lists.linux.dev;
	Mon, 15 Dec 2025 18:40:58 +0000
Date: Mon, 15 Dec 2025 19:40:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [melver:ctx-analysis/dev 9/35] checkpatch: ERROR:SPACING: space
 required before that '-' (ctx:OxV)
Message-ID: <202512151917.eqRDiePT-lkp@intel.com>
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
TO: elver@google.com

Hi Marco,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   982f41984aa2e06402a8080e95499ae6c10a4e74
commit: 053a4fe6338195347b02bea35afd3e0612007a1f [9/35] compiler-context-analysis: Change __cond_acquires to take return value
:::::: branch date: 86 minutes ago
:::::: commit date: 86 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512151917.eqRDiePT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before that '-' (ctx:OxV)
#64: FILE: include/linux/compiler-context-analysis.h:274:
+# define __cond_acquires(ret, x) __attribute__((context(x,0,-1)))
                                                             ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
