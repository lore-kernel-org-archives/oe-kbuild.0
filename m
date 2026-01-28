Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D823EAB3
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590010; cv=none; b=V+tOR8uugLqB6SKI8uS0khEhQvCnvhZETg36c69Y2z1VlZnRyyTcgcbn0SrBBN1VxxmZ2GVyK3ggBusuaJH29M7F1HBEaKprZDkcVmRY7641guCVj7c3FDeD5/cn7GGOtVVV/1lCsqYRKGmXwwlJna5+Z2wNdfGejkvQdQ5/o9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590010; c=relaxed/simple;
	bh=1WHFo30bkW7a7WHXRVWgAYRXfvkfz4xuS7jEzJIr8FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T+XvfVyc9jSvKzucMebvRaPqjc9wBTt1DHUY3Ou0gRb2stQiYfF+96cBpw87sG7psBF+j2VYPdXxLLlV3jQwRH2VfAFg7UeXl0GZT6P48hiYkGw4WVarQ6iysverTGFWFbzSpbyMfJ9iHMyNZGuEDRLjR6Xp8/d9cKDi7nvAQkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBjIU6tT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBjIU6tT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769590009; x=1801126009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1WHFo30bkW7a7WHXRVWgAYRXfvkfz4xuS7jEzJIr8FU=;
  b=cBjIU6tTav2w+8108k9dWgz19G4Qpcj9em83M7nO318jX+8KMjNfJG51
   +3q6Kd6jbtmPTUlYfd8sFgm0qctHTW76eRlhFMmTx2pi29VnGNGqq45N1
   +KO/S1by8+aCeVhjxRV9op4WSohqW+zHjEH4/uvX/TybXXmuyEWWtItGV
   VGtu/HWdcAY9ANcZZ/nV63vgG4KaGzqevBAZQxHWyBq8YxJosav6CTS6z
   5H3zO24XLS0CyhBvZ/nF/dWnBpAdMpVd5j6tRrgUnq3YM/jZ4HA0MxICr
   +SWaJK6MOqEETSjoSxZVSkgPswejqbsYTZLkDDYHYn9Lakn1/GTL3hcru
   A==;
X-CSE-ConnectionGUID: aFeMYStZSMaXAFQavUVWwg==
X-CSE-MsgGUID: 7VgfkgwtTT6LB+JbwCZ8iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88372238"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88372238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:46:49 -0800
X-CSE-ConnectionGUID: s4wQVVYHRwujfEDgoCIAkA==
X-CSE-MsgGUID: HZ7SjTUAQTG9fkr2eCj50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="213077175"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2026 00:46:45 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl1CE-00000000225-2F8n;
	Wed, 28 Jan 2026 08:46:42 +0000
Date: Wed, 28 Jan 2026 09:46:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 2/2] kbuild: rust: use klint to provide
 CONFIG_FRAME_WARN
Message-ID: <202601280904.5vrBKxEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260127172330.1492107-3-gary@kernel.org>
References: <20260127172330.1492107-3-gary@kernel.org>
TO: Gary Guo <gary@kernel.org>

Hi Gary,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 615aad0f61e0c7a898184a394dc895c610100d4f]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/kbuild-rust-register-klint-as-a-tool/20260128-012616
base:   615aad0f61e0c7a898184a394dc895c610100d4f
patch link:    https://lore.kernel.org/r/20260127172330.1492107-3-gary%40kernel.org
patch subject: [RFC PATCH 2/2] kbuild: rust: use klint to provide CONFIG_FRAME_WARN
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260128/202601280904.5vrBKxEk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280904.5vrBKxEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601280904.5vrBKxEk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0602]: unknown lint tool: `klint`
   |
   = note: requested on the command line with `-W klint::stack_frame_too_large`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
