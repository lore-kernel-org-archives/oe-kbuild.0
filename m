Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A491397
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764953282; cv=none; b=kbQcc+M+1rt40J+gSacF6KIFO9x1Y13TnUSeETFeuI3V0aQjOguSs0gZateQrZKI0MqTayOGujpd9vL3CgbkTioStf3feGO979I2F4iOmC0FHLTtJfVIP6HoXbnNFY5FCgpR5dp9IkrwlTKaJWElz+R2d7v8Y9aky0h5usE/k/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764953282; c=relaxed/simple;
	bh=9FNFj3IcR062MHRF3KLOihJQ5V7zmTQQGKz4n4quhIo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcANLsmvj61S8UeY056qsiakTy8MOTVxYdmixe0xdGFsMCgCg7a739P8WJWy1RzvLd9zRwzN1xaftcHZJn9BdWLzg0ERgh0iKADLgcLlcsxd62MbXjCtL1Zy/phBzGdBQjPQdnXe/YvCktlnivQeEcGq24zEYHsKBB//dPaL7/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3WnaL7V; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3WnaL7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764953277; x=1796489277;
  h=date:from:to:subject:message-id:mime-version;
  bh=9FNFj3IcR062MHRF3KLOihJQ5V7zmTQQGKz4n4quhIo=;
  b=K3WnaL7V6vEPXbMkvj2UE4qYeqI28PuTMkFRLJBOXIx2lFOyhTgflcoR
   WqsSKergbxVb+l/solNr/yWQyu5hEp/8WVKYHTp8YDpZLsP3rglsKYz4H
   jDKbdfBI3dCJnzXiPDzGvYfZHaprsFqB4MA/Qlag1JfTsf0uDs1p7wy1Z
   0Q7HCEgywSPzuT3fYymU4ktcRyo3pjTsf0v5KQJbXkMhCOQ6I7w4nlrOw
   iW4PYQxUa1+BP+gm0TGRC1X1ZlLzoaOW9Hb8Jd32aWodXLtsnjOsHnrrW
   2jARP0w3SLE5zjsfN0+X5mZNn6v2LeT+tINYpDmohdGyj/kEt7nPwWKcK
   Q==;
X-CSE-ConnectionGUID: w5keKbyTRGS1+DtL3KpiVA==
X-CSE-MsgGUID: HfAKVvYAQB2KPI9jCecbLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="65989744"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="65989744"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 08:47:54 -0800
X-CSE-ConnectionGUID: bcKAh2OdQRSBI3TqtBZVqQ==
X-CSE-MsgGUID: plnKl7bkRe+3Fo0Do7r7Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195356264"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 05 Dec 2025 08:47:53 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRYyF-000000000xh-1qD9
	for oe-kbuild@lists.linux.dev;
	Fri, 05 Dec 2025 16:47:51 +0000
Date: Fri, 5 Dec 2025 17:46:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [matttbe-net-next:master 7/8] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'Bochs'
Message-ID: <202512051725.hZJ0C3U5-lkp@intel.com>
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
TO: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matttbe/net-next.git master
head:   1429691abba81af7681010e1efc623784394bea3
commit: af026b652e69bef5fc3e8433edf4af55dcf4688c [7/8] mptcp: ensure context reset on disconnect()
:::::: branch date: 32 minutes ago
:::::: commit date: 32 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251205/202512051725.hZJ0C3U5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Bochs'
#18: 
  Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
