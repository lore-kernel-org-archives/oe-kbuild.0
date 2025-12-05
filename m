Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A83832C305
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764941216; cv=none; b=pwqRPXtCfEhzV/AoLZAhaxC0okRCX0F82rx/QGbUnzdkJ96seZUU85Fu1fe0jcagIcjr5jgSM89KqXDKp0YN7StOhUd0xqkVT50fEyROQhq9bgnZjO+lE+qW3jTBTs5y3d0VWgmErWgiH6knzy32K75JCNHKmcqhQl+UDHspVk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764941216; c=relaxed/simple;
	bh=yo0/5QjBGqvPvWL/RZQbK0PY6X47tyLlNxZhn1ElgEM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IVUOvPawAnNylY1FvJebMDBhsTI+FlZ1EOmVdIqlKZ9Kb2+VbEFrVupN1QkcZfGw4Um7PwXPkiRqR01mWiGTipozL7mNb4JlT5evqlBMjoUm4Cdnk5BL2ylGbEWi7ipXEu9SWe/fwx4oGgEmP9w6bU/fIhs89hEhkcYrpzcZTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxDBLaa4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxDBLaa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764941214; x=1796477214;
  h=date:from:to:subject:message-id:mime-version;
  bh=yo0/5QjBGqvPvWL/RZQbK0PY6X47tyLlNxZhn1ElgEM=;
  b=hxDBLaa4RTV76nJzjo7237kpNyLeKbaEWaFU+XIsuNOePpIf6fn3NJK/
   Lh8l3JTvaw5kKvxo6/KN3O6BlM2BvElpcrVVv/H0onf8Wr+ZHlHQjNXDK
   zmC4x0k0eOqblvfIgoBwLkrIo39bOq7IXFN5w9MZSNTshStGjHXSSbAAi
   Yh2GvwOlJBKtic5i+NHmgJuuB1DYzbq1OuFw59XxQKE19Fog/H5YdmlE/
   Ss0Wn2MeRu6lehJV7AefZ1lgYRYFka63lEuuYP2yHIpN8++76AF0uicrW
   cORlnXfI7P2y72lIFM9RUpk+JgQs6xVWe+VvdGN1mG2QqKEaN1P9GgY4q
   w==;
X-CSE-ConnectionGUID: AqEYJhfSTGKPRmFosKIvhg==
X-CSE-MsgGUID: MSsaixgPQa2c0triKKeclQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77660133"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="77660133"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:26:53 -0800
X-CSE-ConnectionGUID: aLHvc8ouTEO7Fy+0mfvWyw==
X-CSE-MsgGUID: uh7aDugsTVmgngvcsndNXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="194947148"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 05:26:52 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRVpi-000000000wP-0yfU
	for oe-kbuild@lists.linux.dev;
	Fri, 05 Dec 2025 13:26:50 +0000
Date: Fri, 5 Dec 2025 14:26:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 14/15] checkpatch: ERROR:POINTER_LOCATION:
 "foo * bar" should be "foo *bar"
Message-ID: <202512051426.5dh8vPbc-lkp@intel.com>
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
TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   296c02a312917e381bdb9ff6b3d0364b8074e529
commit: 1dd639447c68ec3020e36c7ea1fa5f74284cffef [14/15] LiteX: driver for MMCM
:::::: branch date: 71 minutes ago
:::::: commit date: 71 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251205/202512051426.5dh8vPbc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1223: FILE: drivers/clk/clk-litex.c:925:
+				synthetic_phase = (d_t * global_period) +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
