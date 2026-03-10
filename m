Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8CD3B47EE
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149083; cv=none; b=SCwLWgqOBycyVja5VftkN5GtuBx8HvxNyp42A82JhIAB2a0yd7L/jQnoUKHbpB+kIsEk0oZ7zso94YIOjIK+/sxgivRJL3NsX1WDlEdFKh52QNRA0ea921gDPQDAzsKOBOmsFz//REAtxH90MLZfJYVa9N0h1HJxKHmhT5NLB2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149083; c=relaxed/simple;
	bh=EHz7gmv78bogvqjz1IugrsBQ8OdgA9Mmvwe5uF2TcKU=;
	h=Date:From:To:Subject:Message-ID; b=YtCi79fH4oodm1ZRqZsNk6HCEdRa7To7YMIZg6QhKvq5trKdwBYSFUlqEkYyUWUxpR7PrAm4QZ31Jl1fBVGTV5VW4Ft9+HaBEF6t1TfCLkNdEXqZf8zn3UCzynscfq2WoY66zN2M44rEh2tSJejbkBaVSQtaoHN4lB5dddN6Pok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWx4F/K4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWx4F/K4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773149080; x=1804685080;
  h=date:from:to:subject:message-id;
  bh=EHz7gmv78bogvqjz1IugrsBQ8OdgA9Mmvwe5uF2TcKU=;
  b=JWx4F/K4HwRKS5zvgY9hvJzRq76tTu5zYojKbAE2jakzYYmFmPUpLJcs
   mpGEY/yr2RAQ4zBI/Ay4ilEBYwAq3GukIjcQUzuwRXlQGrSQ5HIQ0sudl
   /VhHE6wm/B6l0UmliWQEX+dhi1mFqOuuBuHL0B/6JJTyXFflsoSmbtHll
   CqkiBKQUcAHKG8bSDZJy1sGbMyp7nHH5dgeYvY/VGQlgaobub2+RAWIKj
   Nu9wsTdEnx9DWjGey1F0obUmfZa2pZZK0WKqNQZV9gb934sC/EfVB51cJ
   5dCA+MQ15tG6mfLc6iAFaKWwp2wBBKlOKGO0N0Jv85TulgssQkwDQPuwn
   w==;
X-CSE-ConnectionGUID: rjX44+C7SwqwwOEg0ovnsQ==
X-CSE-MsgGUID: fUJo3x9MTV+5oHAqvR6EiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73216862"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73216862"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:24:40 -0700
X-CSE-ConnectionGUID: orDv8R4TSsSMdDjqhcHRdQ==
X-CSE-MsgGUID: xTTStGzETm6E/2BRgjmEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="218081595"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2026 06:24:40 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzx4g-0000000034r-1SX0
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Mar 2026 13:24:38 +0000
Date: Tue, 10 Mar 2026 14:24:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [wsa:renesas/x5h/mfis-single-driver 6/10] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'for'
Message-ID: <202603101447.qFAWbot0-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/mfis-single-driver
head:   058134387629d86ce6e47eb91c9fd3b630e83110
commit: 9132921cb2a98356098027a4ecab0eaab66b14f2 [6/10] dt-bindings: soc: renesas: add MFIS binding documentation
:::::: branch date: 18 minutes ago
:::::: commit date: 18 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260310/202603101447.qFAWbot0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'for'
#196: FILE: include/dt-bindings/mailbox/renesas,r8a78000-mfis.h:3:
+ * Constants for for the mailbox part of the Renesas MFIS IP core.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
