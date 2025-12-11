Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C288B156C6A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 15:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765468191; cv=none; b=joK3uGnrTZvlKsWP3/uCVwuzu3GEAE5klFAcnrWI7Mtt6kxQApQWLHrPw5Y8ZU/czXxw6G/gfnb4Yh7TITKRRYYH4k3SQIPw42d73Pg54StDW/nIfbnobk10Cb27tU9/PCo1ek1kMTUHpvJ7P7amV9Wp4LjCREKenio3g5Ekrhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765468191; c=relaxed/simple;
	bh=NyVDMTxcshyhjCC2CRzkN20yxTtLKZJDeaDFJEuX6Gc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qRnclo8QvVFQzQKVj5jll4tx/LfQnjKTimbkhGZCkS/MvcJ/i+3AbgKoGmrrk37JObXKB5isUtFw76lRxpkdDvu/Wj8NKJ4Z6RgjPdPCu54wO/7Ys2/UnqS7/lnlG3GasFUAVwGTVQ7STd42g5Jb0qQDxRItXBUY8NcGd8xuo9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/ttwKnt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/ttwKnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765468190; x=1797004190;
  h=date:from:to:subject:message-id:mime-version;
  bh=NyVDMTxcshyhjCC2CRzkN20yxTtLKZJDeaDFJEuX6Gc=;
  b=F/ttwKntq7e6ka8malJF39Yk+gXwSofhTSxgCTq1XdB2gTviXuYq10ln
   UD2o0YToEngnOgZzEZLZ3bjL+p51UVdKawI7djqTEsaVvp9Z4zQctOzvX
   T3aWnsf0lztxuutp8OLjbipoNrBdKYMC1Esa3suSFtGx59rayxekYvDv9
   2894TcgZIQrUfPHMta/TxFdhrR0KD3fl/LwzK+/uQKSxGLMmDivbWsU7K
   rhc/LJUqtAcBk2I5UlcPfDaLqZIvvvpSNuEFl7fm+KqJ4Fvlvm6Zg2Hjx
   v/3o2PTEgaL7qS4UJYUOZdpmEIUSBx0ihUWO+vTA0MGlyRfFiNA7pKc0J
   w==;
X-CSE-ConnectionGUID: 5L2r4sMaRFef9mJQJqsFcw==
X-CSE-MsgGUID: YPD/eLmiS7udLLrGjznKTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78158138"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78158138"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 07:49:49 -0800
X-CSE-ConnectionGUID: gWJxWh2TTW6KkSICiw5QZw==
X-CSE-MsgGUID: 4A16Gcp+RL6DsSUbIstQtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197645671"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 07:49:49 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTivK-0000000018O-2prq
	for oe-kbuild@lists.linux.dev;
	Thu, 11 Dec 2025 15:49:46 +0000
Date: Thu, 11 Dec 2025 16:48:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mptcp:export-net 6/12] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'Bochs'
Message-ID: <202512111628.ep8jgfnh-lkp@intel.com>
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

tree:   https://github.com/multipath-tcp/mptcp_net-next.git export-net
head:   23daa82f5b2568972bafb68e93c00d6c6815e9ae
commit: 81a2ae4ea09de9b68363289ddbc953d8f7ddac2e [6/12] mptcp: ensure context reset on disconnect()
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512111628.ep8jgfnh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Bochs'
#18: 
  Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
