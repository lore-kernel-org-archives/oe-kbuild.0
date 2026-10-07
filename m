Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839A3806AD
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 05:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352171; cv=none; b=QXlLF4dLHaxWUW/2VeCgyJJ2has85YMk1CTFoijLkHejyDAoI3VwrRvxxgSfv1zXKsf902E8jVAr1LbaDCDKJvqOYcLJQd/KeAN6gUDxPtQqMaVAkZS5Tf1tNlsBeTFsA3xek1gpw9fKO8lFZw3yh5JbUt4QMLfNRF/pi1yWFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352171; c=relaxed/simple;
	bh=vfUZTcwSDs3F3EjVHwvyLhZbhOn0GuQCHkh11D3fGZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=an2QhWeQ1wHs6/L2+1rs8JsPawq5vPWjFc0ERdmAjnQ0ZIC9dpoYkRFez5/KLsFa0czMVRQTzuA/nMCcLfHPsyokNPD9FiYOVjBZAChzl2Ley17g6shVLOeeBND1kT6e71X8wobqN0butdV/+v0oFD3U/Tt/T+khmKPGIzcsmKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0IxKiDM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0IxKiDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791352170; x=1822888170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vfUZTcwSDs3F3EjVHwvyLhZbhOn0GuQCHkh11D3fGZo=;
  b=N0IxKiDMO02BF6Y/GDcTIOCWrw12Gs3vDmPpt//DzhefUYMmlDrqNsaa
   a7xncAkdg2cojVWvq64l0iFN85t9EdTsJiCk5Xx293pvYpg5Knl9rLNQC
   1pQ5VCp2fsz1gO8eqMy82gL9KToULcURU+miVZRYH6UZIcuSaX2UYs94G
   +O4uwxfVeOOELMXId8yKNSM58yCzvK+efp93ootCc9RRYul97Bs9hHeqW
   /RPvK4snSb9kytsC6Bh/wO+RpHf2i9RC1wulvmvn2r/f1s927FeIbCI4s
   iIWEDGwl77a15yREcFtZDCxM2l/0pTK1II99W/nYW0AJ44sfuADWfBDvr
   A==;
X-CSE-ConnectionGUID: 9sljGx7jTDa1b1YtUNLC0w==
X-CSE-MsgGUID: O0zaXJM2T26Ko/BhP6LsIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="110060"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="110060"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 22:49:29 -0700
X-CSE-ConnectionGUID: 4dL57VlZSLyj2zo9GoKvVA==
X-CSE-MsgGUID: 7Fp3N9GyTCeqTs/SKGM5Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285275125"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 06 Oct 2026 22:49:28 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEKWs-000000002ZH-1yQu;
	Wed, 07 Oct 2026 05:49:26 +0000
Date: Wed, 7 Oct 2026 07:48:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: rust: serdev: use Delta<Jiffy> for timeouts
Message-ID: <202610070719.BsMyboYg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <202610070719.BsMyboYg-lkp@intel.com>
References: <202610070719.BsMyboYg-lkp@intel.com>

Hi FUJITA,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/FUJITA-Tomonori/rust-serdev-use-Delta-Jiffy-for-timeouts/20260930-131339
base:   
patch link:    https://lore.kernel.org/r/202610070719.BsMyboYg-lkp%40intel.com
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261007/202610070719.BsMyboYg-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070719.BsMyboYg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610070719.BsMyboYg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:19491:37
   |
   19491 |          sdev.write_all(b"Hello\n", 0)?;
   |               ---------             ^ expected `Delta<Jiffy>`, found integer
   |               |
   |               arguments to this method are incorrect
   |
   = note: expected struct `Delta<Jiffy>`
   found type `{integer}`
   note: method defined here
   --> rust/kernel/serdev.rs:487:12
   |
   487 |     pub fn write_all(&self, data: &[u8], timeout: Delta<Jiffy>) -> Result<usize> {
   |            ^^^^^^^^^

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
