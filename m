Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D823271F5
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635553; cv=none; b=eh3lYPM8nBcm/OAqz5s5/bxKOIl2Cz89xyxAjUjhfMYFUdkG3DbPTw1c+2DKltWNL87/GPAxbVjY5Vxk8scVxQImd2sDvgDOSofZQ4o2KVhGkvnoy68vGa47HwNjxBRSc9C9IxmE6K7Rr9j6B1oycVxRhvQEz6ZonpTHBzm8Scs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635553; c=relaxed/simple;
	bh=d21B1HuVuPueEzL7D9VjU1EKpw+GocL1myuHb4EzHJI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TjoiUu34ymDVpqjvHAA1hcBD+Nm3RXSQ5QTXp4ruhh4qr0fL9pxqOyD3cJSwAaq7TyHMWEaL4I4iKBbZEv2Sm9FpBQsyNG3CYH4nxQlWahzc2VWu8+75/NRAT8yEBCs8955Wi90vXJI7aBixVT1NL2A1XBU0pbiWwyZK5O5LFTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMNgSD33; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMNgSD33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763635551; x=1795171551;
  h=date:from:to:subject:message-id:mime-version;
  bh=d21B1HuVuPueEzL7D9VjU1EKpw+GocL1myuHb4EzHJI=;
  b=NMNgSD33gP837pv6jMpYhurT5t+qG0SQ5zYt5qfN6JfLAc8JD5bOY686
   7qEHyP73DKd7Ej4p32CijkiINeSfetx6uEVkO9eegqnpMrxP8Gr9VedE1
   l0XJcJyWEDv0o57zYfm4vm7BFuh1P7MXtFXUNFOxsIKh5HRZQQwkGqucf
   +tEmC3VE3GT9IKwPtO7x7eCHTqLwRfsVa+DdCxvIRvko4bqpyatRespBi
   YCBgxZw0a7D4bQzN55MyXnn2y9maMhf8Obj+Y6GBGs6IHQ8N7dHMIlBCw
   FuTuojrcg5iIJ+428uVXEVXAX9n6PwE0xA0Hgap1ctnrXsDsIIer7TBTt
   w==;
X-CSE-ConnectionGUID: hHM3tMHcSl62tMMz1qdwkA==
X-CSE-MsgGUID: OJKtd3QOTJyo83CHGayJLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="64706875"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="64706875"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:45:51 -0800
X-CSE-ConnectionGUID: 7rfLRMv4T1S2rbedaetyuQ==
X-CSE-MsgGUID: JUfL9kB3T0KlnBLwgHPpgg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2025 02:45:50 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM2Ae-000000001Qd-0HMG
	for oe-kbuild@lists.linux.dev;
	Thu, 20 Nov 2025 10:45:48 +0000
Date: Thu, 20 Nov 2025 11:45:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [devsec-tsm:staging 28/31] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'and'
Message-ID: <202511201152.keeyZQLI-lkp@intel.com>
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
TO: Dan Williams <dan.j.williams@intel.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm staging
head:   19ea5389dbbba1608d60fda34512a5e75857a4bb
commit: edb446730116e76068c616167a81ffe43d0a463e [28/31] samples/devsec: Add sample TSM bind and guest_request flows
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511201152.keeyZQLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511201152.keeyZQLI-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#8: 
Arrange for pci_tsm_bind() and and pci_tsm_guest_req() to be invoked via

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
