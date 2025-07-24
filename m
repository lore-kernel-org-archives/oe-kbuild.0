Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBCE22083
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 01:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753322358; cv=none; b=tDn9SoPlE3pK/fMJ73Fo7os5IOBJ68idZTUvS8imA8BWuAUrMlQOAqy9wYtzQXDFjZZMaBAaGyyBWclK4HQj2mmtYr8IwnU2jp0VUmSFRbZPxQiIVmn2Uyz9nUJvEPSqkz9fAvQGLqWS8aCAulCqw9bVSPpa3QmacBoa7kS/vJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753322358; c=relaxed/simple;
	bh=NW0ovnIJywC+HJgjT1q/wYIoWqaDFK8JUWEq+XfSn/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yyu53so/CdfTgmEFzJOt4IuUqkh9oxxVPFuJkwiF6fQYOi2tBfQEFIs/xdJCvROnF/vXX/aTnjPj5RYLomgHqdGnJhuNiKKZSOdEt1qC+PpQ9+heil4iygDJF2nq2HIAg/5uankMgtxkEXfRxjIGqzZEfPAwHqtFfo1KC+nJmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbu5x6l1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbu5x6l1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753322356; x=1784858356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NW0ovnIJywC+HJgjT1q/wYIoWqaDFK8JUWEq+XfSn/c=;
  b=Gbu5x6l1smxUrAKaLTQpf7qzDj0dEG4A/bLt35gd9Y9V3a2VMwcq2ftm
   G2aQTPRlCCgts1qUB82+tuyDbxIiBnxpsO8g9C0KQ1QvYGyRs/7RfrY3O
   134om6poTim6Ooc9Ebdtx44zr6Kyn4fAo7VQwTTZnwXEJR3AB5Lv26AmN
   oG3OmNRNZuO7oRd5hZxrL/k5Qh60sRoAakV9H6x7Yinsx1XeNVyoIPVLs
   lnYCQvVeAKgbsSzapbD1VoJwQPvw8i3PYJ6vsXUqn0n0J1OlPz32lfE84
   OVpgsqrdD7BFE/4t5KwcRWAUn1PVXjnbAb+ZU/mTqD6O0ToXXDL/0r9ER
   w==;
X-CSE-ConnectionGUID: VHRVVVoNTo6v2i3bHPC39w==
X-CSE-MsgGUID: swviHho3QYG1ixxinjQA0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66693254"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="66693254"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 18:59:16 -0700
X-CSE-ConnectionGUID: K19KT2J9Tj+7/2jbZ0y/KA==
X-CSE-MsgGUID: ipttTk5WTCaEzbGbYsFDTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="164128631"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jul 2025 18:59:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uelEn-000Jzv-0R;
	Thu, 24 Jul 2025 01:59:13 +0000
Date: Thu, 24 Jul 2025 09:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next v13 2/3] cfi: Move BPF CFI types and helpers to
 generic code
Message-ID: <202507240958.BwbAkPr0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '\%'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250722205357.3347626-7-samitolvanen@google.com>
References: <20250722205357.3347626-7-samitolvanen@google.com>
TO: Sami Tolvanen <samitolvanen@google.com>
TO: bpf@vger.kernel.org
TO: Puranjay Mohan <puranjay@kernel.org>
TO: Alexei Starovoitov <ast@kernel.org>
TO: Daniel Borkmann <daniel@iogearbox.net>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Will Deacon <will@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Maxwell Bland <mbland@motorola.com>
CC: Sami Tolvanen <samitolvanen@google.com>

Hi Sami,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 95993dc3039e29dabb9a50d074145d4cb757b08b]

url:    https://github.com/intel-lab-lkp/linux/commits/Sami-Tolvanen/cfi-add-C-CFI-type-macro/20250723-045632
base:   95993dc3039e29dabb9a50d074145d4cb757b08b
patch link:    https://lore.kernel.org/r/20250722205357.3347626-7-samitolvanen%40google.com
patch subject: [PATCH bpf-next v13 2/3] cfi: Move BPF CFI types and helpers to generic code
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-122-20250723 (https://download.01.org/0day-ci/archive/20250724/202507240958.BwbAkPr0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240958.BwbAkPr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507240958.BwbAkPr0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '%'
>> kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '%'
   kernel/cfi.c:43:1: sparse: sparse: unknown escape sequence: '%'
   kernel/cfi.c:43:1: sparse: sparse: unknown escape sequence: '%'

vim +40 kernel/cfi.c

cf68fffb66d60d9 Sami Tolvanen 2021-04-08  31  
751cc3ba839275a Sami Tolvanen 2025-07-22  32  /*
751cc3ba839275a Sami Tolvanen 2025-07-22  33   * Declare two non-existent functions with types that match bpf_func_t and
751cc3ba839275a Sami Tolvanen 2025-07-22  34   * bpf_callback_t pointers, and use DEFINE_CFI_TYPE to define type hash
751cc3ba839275a Sami Tolvanen 2025-07-22  35   * variables for each function type. The cfi_bpf_* variables are used by
751cc3ba839275a Sami Tolvanen 2025-07-22  36   * arch-specific BPF JIT implementations to ensure indirectly callable JIT
751cc3ba839275a Sami Tolvanen 2025-07-22  37   * code has matching CFI type hashes.
751cc3ba839275a Sami Tolvanen 2025-07-22  38   */
751cc3ba839275a Sami Tolvanen 2025-07-22  39  extern typeof(*(bpf_func_t)0) __bpf_prog_runX;
751cc3ba839275a Sami Tolvanen 2025-07-22 @40  DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
751cc3ba839275a Sami Tolvanen 2025-07-22  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
