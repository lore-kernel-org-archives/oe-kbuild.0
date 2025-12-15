Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D548321E087
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 18:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765824123; cv=none; b=Y0+NE9mQ39LiY2g/Wz/BMh4r66C5yyULI1LLZpP4UCDjdGuy2/W376sxWFWohYATOYLW+47FHakV2ISyqK2lYJFV8kh9akmgSFfeK2/Bw4PYgNgNz3S5uDNutX4dTSxDAG2zOZMUbJw5hhsryfqPhlMwjZyjsjjkkcqoRR3r8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765824123; c=relaxed/simple;
	bh=NkxRHA9P24fX1tiy9S/6qWSPGUv2PILO85tGuRox5gk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXgcqVNkc02zOB1cdjQYT7i8wZ42UVCQ0gT0iTEJfYJ/hkJQneogKKvH6V7lbbdAHE9cAr2zrw53yezY3GDqS3mpoyacatcYCcHt2hXrECnRaDSht7qhZeDQ9oelPI+1QE9XqhYn9xJiD6oslYtBSm0An7elrRkwt/OKLsDcNJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMvPg44V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMvPg44V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765824122; x=1797360122;
  h=date:from:to:subject:message-id:mime-version;
  bh=NkxRHA9P24fX1tiy9S/6qWSPGUv2PILO85tGuRox5gk=;
  b=VMvPg44V2ie2tBmfOvagGQsuaicsgt6l9d9k8EcuzPpwrrQdcckvgy+t
   xFWF+FNDRJ9Fbppeq2nQhNBA+csz3Qv4CBP1RVJsOBNC1WISPg7fZdPn1
   S/v2yLXYrCSDHJtUOPaDHX5bc2+rKQzHsBI245k7sKX167emhoE6CeXHw
   uorpALDHOK35Lk2dotvr2s0lXr85OXTvno63XzTq5CD6x22RwMMORp+Bj
   l27n4egEgC61vKWDk9TaPhrphE5qzi5sf2Vqpz5zvfziLv9MYpQ+UsPX7
   f2JXcp2dzT7uskR5rS+9UggzCdpwIpuyxl4J+yFUrfJYt/AwjA3d8TXwZ
   g==;
X-CSE-ConnectionGUID: 0ec9+Dx3RqmRxPCODGadow==
X-CSE-MsgGUID: u1uJJy26SqOR7s/0/bEEog==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78440926"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="78440926"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 10:42:02 -0800
X-CSE-ConnectionGUID: 7KTACstiTBahhfNIW1UM1Q==
X-CSE-MsgGUID: NTfhql0CRjKDrNjJYmU5bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="201974681"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Dec 2025 10:42:01 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVDWA-000000002js-3EnY
	for oe-kbuild@lists.linux.dev;
	Mon, 15 Dec 2025 18:41:58 +0000
Date: Mon, 15 Dec 2025 19:41:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [melver:ctx-analysis/dev 11/35] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'is'
Message-ID: <202512151951.a1LBZwsj-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   982f41984aa2e06402a8080e95499ae6c10a4e74
commit: 547d54b3dd290db6e8a754ca0bfc5fb294b6ca0b [11/35] locking/seqlock: Support Clang's context analysis
:::::: branch date: 86 minutes ago
:::::: commit date: 87 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512151951.a1LBZwsj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#251: FILE: include/linux/seqlock.h:1327:
+ * alias analysis of the compiler will recognize that the pointer @s is is an

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
