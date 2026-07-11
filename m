Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643CB3009F2
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 19:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799009; cv=none; b=R4SAJWnoLKLYWsO6KC8WWwG7BGm0hGKmRIe4Hnm9huGkjUuxcpMnKj7PywkvfA7q5HOqAdsiY6HVotiONXrV9qr7UKfF2IsuSn3e8DVOy2soo7oAAR30Kup2fcK4FGdtqFyorVMfuEu2LGzbBRzoNnT3OVu96epKu9L38iNe7E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799009; c=relaxed/simple;
	bh=Zd0U0yPpw0oLv27dt46UNU75m9urtfhFpT3sr/KQs4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ru2lKmeA6WaXgfvdluzq/PVIcHtknTGKeJEJvXx36FMfAGuTCjjUlq4cy+e16rM6Q9r29R9W1apaOOS0tYP4oCgizNRe8ihxCt5nHgp2+6LvEVxlSyNr1i+CNp1MxUPXndmgMLBP+VSqXnGF44Z6n0mkbdkl1s0P4ycx/uLajG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpNPVK0Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpNPVK0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783799007; x=1815335007;
  h=date:from:to:cc:subject:message-id;
  bh=Zd0U0yPpw0oLv27dt46UNU75m9urtfhFpT3sr/KQs4g=;
  b=GpNPVK0Zqf8fAX1Gj+nLAgbHWmBIEaJAzYW2EhLGboSSUp2kI3HYDDw5
   361Rpxxn3B/hmSI3ZLjirtJGeFTAPEsFjDiQhSEJlTu7GDlnGzAXH8nWI
   rsmHffxIVz0C/fcNxlw5zXOtPZSQO5iCQAxY6OourPHs/sDOV42mrexjH
   5Qm0fWnMf33w3IfVUzv238OxJ+ZE7MEwqxxSXJ3CNPpwGQHljyt9I6ZWh
   oHIl54dc3WfoXQtcyNmsf8AGeTutMNFn44cWpUsPG8VJjv2f9Oog8tsUe
   nKE7X5FELUsawUjpnD/bRHV5oTirWpITIE3i3m+vOMbB034Tyy5DZrIat
   g==;
X-CSE-ConnectionGUID: oI473nSTQn+jQX/7x1V2pQ==
X-CSE-MsgGUID: 4THUTJicRx6qP362jkyPfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94823358"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94823358"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 12:43:27 -0700
X-CSE-ConnectionGUID: vTbR3l8ETdufvravNTAb/w==
X-CSE-MsgGUID: QLwfRdFFRnyXgERFpf918Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251797429"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jul 2026 12:43:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1widbe-00000000KMM-3ig5;
	Sat, 11 Jul 2026 19:43:22 +0000
Date: Sun, 12 Jul 2026 03:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-xe:drm-xe-next 1/2]
 drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Trying to use
 reserved word 'struct' as identifier
Message-ID: <202607120341.jYqqcMOB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Trying to use reserved word 'struct' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: intel-xe@lists.freedesktop.org
TO: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   068388c0cd225654e7369907670d4e77b8dd3744
commit: 73c5a253068e8cdf975941a14f032e351730a396 [1/2] drm/xe/configfs: Add enable_multi_queue attribute
:::::: branch date: 5 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-r134-20260711 (https://download.01.org/0day-ci/archive/20260712/202607120341.jYqqcMOB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120341.jYqqcMOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607120341.jYqqcMOB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:393:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:393:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:397:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:401:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Trying to use reserved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got &&
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:401:13: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:411:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:411:13: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:411:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: undefined identifier 'gt'
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: undefined identifier 'gt'
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: got pci_dev
>> drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:411:49: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:415:37: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:415:37: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_ads.c:417:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:417:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:420:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:420:13: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:420:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:426:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:427:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:428:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:429:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:429:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:438:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:438:1: sparse: sparse: got }

vim +/struct +411 drivers/gpu/drm/xe/xe_guc_ads.c

c151ff5c905333 Badal Nilawar          2024-04-05  338  
d6da81a4785ca6 Badal Nilawar          2024-04-05  339  static void guc_waklv_init(struct xe_guc_ads *ads)
d6da81a4785ca6 Badal Nilawar          2024-04-05  340  {
c151ff5c905333 Badal Nilawar          2024-04-05  341  	struct xe_gt *gt = ads_to_gt(ads);
d6da81a4785ca6 Badal Nilawar          2024-04-05  342  	u64 addr_ggtt;
d6da81a4785ca6 Badal Nilawar          2024-04-05  343  	u32 offset, remain, size;
d6da81a4785ca6 Badal Nilawar          2024-04-05  344  
d6da81a4785ca6 Badal Nilawar          2024-04-05  345  	offset = guc_ads_waklv_offset(ads);
d6da81a4785ca6 Badal Nilawar          2024-04-05  346  	remain = guc_ads_waklv_size(ads);
d6da81a4785ca6 Badal Nilawar          2024-04-05  347  
83f4151787c5dd Matt Roper             2025-12-12  348  	if (XE_GT_WA(gt, 16021333562))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  349  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  350  				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
4d5c98eb77fe51 Matt Atwood            2025-08-07  351  	if (XE_GT_WA(gt, 18024947630))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  352  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  353  				 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING);
4d5c98eb77fe51 Matt Atwood            2025-08-07  354  	if (XE_GT_WA(gt, 16022287689))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  355  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  356  				 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE);
d6da81a4785ca6 Badal Nilawar          2024-04-05  357  
4d5c98eb77fe51 Matt Atwood            2025-08-07  358  	if (XE_GT_WA(gt, 14022866841))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  359  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  360  				 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO);
61ef737db9f284 Vinay Belgaumkar       2024-10-15  361  
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  362  	/*
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  363  	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  364  	 * the default value for this register is determined to be 0xC40. This could change in the
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  365  	 * future, so GuC depends on KMD to send it the correct value.
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  366  	 */
4d5c98eb77fe51 Matt Atwood            2025-08-07  367  	if (XE_GT_WA(gt, 13011645652)) {
7c9de25efa7677 Jonathan Cavitt        2025-07-28  368  		u32 data = 0xC40;
7c9de25efa7677 Jonathan Cavitt        2025-07-28  369  
19baa830fbb60d Lucas De Marchi        2025-09-12  370  		guc_waklv_enable(ads, &data, 1, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  371  				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE);
7c9de25efa7677 Jonathan Cavitt        2025-07-28  372  	}
2817a1f1bfb1a2 Vinay Belgaumkar       2024-04-16  373  
4d5c98eb77fe51 Matt Atwood            2025-08-07  374  	if (XE_GT_WA(gt, 14022293748) || XE_GT_WA(gt, 22019794406))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  375  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  376  				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
636cdf6fbddff4 Julia Filipchuk        2024-08-05  377  
09af64eba63ece Michal Wajdeczko       2025-12-16  378  	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 44) && XE_GT_WA(gt, 16026508708))
7c9de25efa7677 Jonathan Cavitt        2025-07-28  379  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  380  				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
09af64eba63ece Michal Wajdeczko       2025-12-16  381  	if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 47) && XE_GT_WA(gt, 16026007364)) {
7c9de25efa7677 Jonathan Cavitt        2025-07-28  382  		u32 data[] = {
d72779c29d82c6 Sk Anirban             2025-07-16  383  			0x0,
d72779c29d82c6 Sk Anirban             2025-07-16  384  			0xF,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  385  		};
19baa830fbb60d Lucas De Marchi        2025-09-12  386  		guc_waklv_enable(ads, data, ARRAY_SIZE(data), &offset, &remain,
7c9de25efa7677 Jonathan Cavitt        2025-07-28  387  				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
7c9de25efa7677 Jonathan Cavitt        2025-07-28  388  	}
d3e8349edf7ed9 John Harrison          2025-04-03  389  
29042df3acdc73 Badal Nilawar          2025-08-21  390  	if (XE_GT_WA(gt, 14020001231))
29042df3acdc73 Badal Nilawar          2025-08-21  391  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
29042df3acdc73 Badal Nilawar          2025-08-21  392  				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
f9a21696e37b06 Julia Filipchuk        2026-03-03  393  	if (XE_GT_WA(gt, 14025515070) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
f9a21696e37b06 Julia Filipchuk        2026-03-03  394  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
f9a21696e37b06 Julia Filipchuk        2026-03-03  395  				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
29042df3acdc73 Badal Nilawar          2025-08-21  396  
0af278683cd61b Daniele Ceraolo Spurio 2026-07-06  397  	if (XE_GT_WA(gt, 22022079272) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 62))
0af278683cd61b Daniele Ceraolo Spurio 2026-07-06  398  		guc_waklv_enable(ads, NULL, 0, &offset, &remain, GUC_WA_KLV_REMAP_RANGED_TLB_INV);
0af278683cd61b Daniele Ceraolo Spurio 2026-07-06  399  
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  400  	/* The GuC does not enable the sem_tok_64 feature on NVL-S */
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06 @401  	if (XE_GT_WA(gt, 16029897822) && gt_to_xe(gt)->info.platform != XE_NOVALAKE_S &&
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  402  	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 69))
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  403  		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  404  				 GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64);
f543084cdbd142 Daniele Ceraolo Spurio 2026-07-06  405  
73c5a253068e8c Shuicheng Lin          2026-07-09  406  	/*
73c5a253068e8c Shuicheng Lin          2026-07-09  407  	 * On GuC firmware 70.66 and above, use the Feature KLV (shared with the
73c5a253068e8c Shuicheng Lin          2026-07-09  408  	 * WA KLV buffer); older firmware uses GUC_CTL_DISABLE_MULTI_QUEUE in
73c5a253068e8c Shuicheng Lin          2026-07-09  409  	 * the init params instead.
73c5a253068e8c Shuicheng Lin          2026-07-09  410  	 */
73c5a253068e8c Shuicheng Lin          2026-07-09 @411  	if (!xe_configfs_get_enable_multi_queue(to_pci_dev(gt_to_xe(gt)->drm.dev)) &&
73c5a253068e8c Shuicheng Lin          2026-07-09  412  	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 66)) {
73c5a253068e8c Shuicheng Lin          2026-07-09  413  		u32 data = 1;
73c5a253068e8c Shuicheng Lin          2026-07-09  414  
73c5a253068e8c Shuicheng Lin          2026-07-09  415  		guc_waklv_enable(ads, &data, 1, &offset, &remain,
73c5a253068e8c Shuicheng Lin          2026-07-09  416  				 GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
73c5a253068e8c Shuicheng Lin          2026-07-09  417  	}
73c5a253068e8c Shuicheng Lin          2026-07-09  418  
d6da81a4785ca6 Badal Nilawar          2024-04-05  419  	size = guc_ads_waklv_size(ads) - remain;
d6da81a4785ca6 Badal Nilawar          2024-04-05  420  	if (!size)
d6da81a4785ca6 Badal Nilawar          2024-04-05  421  		return;
d6da81a4785ca6 Badal Nilawar          2024-04-05  422  
d6da81a4785ca6 Badal Nilawar          2024-04-05  423  	offset = guc_ads_waklv_offset(ads);
d6da81a4785ca6 Badal Nilawar          2024-04-05  424  	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
d6da81a4785ca6 Badal Nilawar          2024-04-05  425  
d6da81a4785ca6 Badal Nilawar          2024-04-05  426  	ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
d6da81a4785ca6 Badal Nilawar          2024-04-05  427  	ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
d6da81a4785ca6 Badal Nilawar          2024-04-05  428  	ads_blob_write(ads, ads.wa_klv_size, size);
d6da81a4785ca6 Badal Nilawar          2024-04-05  429  }
d6da81a4785ca6 Badal Nilawar          2024-04-05  430  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
