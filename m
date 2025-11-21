Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD7C2DEA7E
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746521; cv=none; b=nsgecvQhaOuMmUaDt/XF3qFnPgJRFV7s3Qu1gmRoSKh3EVGwSZBSr+dGd3BDVTaV0sH5Y4moV5w37mJSAOoBtmHdG6Vby/ZAqrrNZRoBckOxjQPbK/cyH/kES5yCb9SO7JamXnf5Vu0fI4k7Xhys5BE/Z28B07L9aMMedWbXFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746521; c=relaxed/simple;
	bh=ToAKcmFeGiyjlpYhR5mj7QDlXBh4udUaoANc+FzyvrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Of3P1QVe0HbgzdSBo/84CPP1AlPR4zFHTQBjIYY4TeDS/DQ1yEZ24QkP4Vpbk0F0OyghWYc8dI8lM0FWoUqbVXWgmiBJmuV1YixuSikBLE4xw/Xob2F21d1rDHBsR1Q0qBJtjbHnzCPm79Ov/DZ2HbfXgZdDiMkYi4yW468TXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5vbyfeE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5vbyfeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763746517; x=1795282517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ToAKcmFeGiyjlpYhR5mj7QDlXBh4udUaoANc+FzyvrI=;
  b=H5vbyfeEoaWcG+EPpu27z8iPFSvSN9WTps92eeHMuxfzkmedNH1z9jK9
   QuutBYYqcNC67CEQ8sZdtQMSUduJpEH5XMbyDgOk0FPjnIF/JFHiW3QpA
   Kyy6pfaHYdaXv3M/FTd83gy68RorMdzmtJ7sinXZ//df1JfQPV7Q1xANr
   DYRUf8EgwRoORbJXcFcg9PoednWQreAJ8uwnumkoavFLInDpw6oAM2yYN
   kcbPqG32Us8klJvqKtuQTWKakRLhTSjyZtVnzB8y0B1uxOQEHS39Pof/z
   DJE19BYwBVg2yoNRpztk/ebxnn+eLLq1/SLCiMkRlqA+qMLNbL37oprXJ
   A==;
X-CSE-ConnectionGUID: cXwymymAQWe/vT+ZJfZlRQ==
X-CSE-MsgGUID: 1Pnq6q/bSgmhAubA6sikVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65928409"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65928409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:35:16 -0800
X-CSE-ConnectionGUID: rykMlhcVTeOmEyouIH8Sgw==
X-CSE-MsgGUID: 7BquOZqeTwm78x/h45bpHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="195914325"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2025 09:35:15 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMV2O-0006ex-1d;
	Fri, 21 Nov 2025 17:35:12 +0000
Date: Sat, 22 Nov 2025 01:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 5/6] rust: pci: add config space read/write support
Message-ID: <202511220121.yJFHNxd4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um-randconfig-001-20251121 results in a lot of rust failure"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251119112117.116979-6-zhiw@nvidia.com>
References: <20251119112117.116979-6-zhiw@nvidia.com>
TO: Zhi Wang <zhiw@nvidia.com>
TO: rust-for-linux@vger.kernel.org
TO: linux-pci@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: dakr@kernel.org
CC: aliceryhl@google.com
CC: bhelgaas@google.com
CC: kwilczynski@kernel.org
CC: ojeda@kernel.org
CC: alex.gaynor@gmail.com
CC: boqun.feng@gmail.com
CC: gary@garyguo.net
CC: bjorn3_gh@protonmail.com
CC: lossin@kernel.org
CC: a.hindborg@kernel.org
CC: tmgross@umich.edu
CC: markus.probst@posteo.de
CC: helgaas@kernel.org
CC: cjia@nvidia.com
CC: smitra@nvidia.com
CC: ankita@nvidia.com
CC: aniketa@nvidia.com
CC: kwankhede@nvidia.com
CC: targupta@nvidia.com
CC: acourbot@nvidia.com
CC: joelagnelf@nvidia.com
CC: jhubbard@nvidia.com
CC: zhiwang@kernel.org
CC: Zhi Wang <zhiw@nvidia.com>

Hi Zhi,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next]
[cannot apply to pci/next pci/for-linus driver-core/driver-core-linus drm-nova/nova-next linus/master v6.18-rc6 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhi-Wang/samples-rust-rust_driver_pci-use-kernel-vertical-style-for-imports/20251119-193643
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20251119112117.116979-6-zhiw%40nvidia.com
patch subject: [PATCH v7 5/6] rust: pci: add config space read/write support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220121.yJFHNxd4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220121.yJFHNxd4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220121.yJFHNxd4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `cfg_size` on type `bindings::pci_dev`
   --> rust/kernel/pci.rs:461:46
   |
   461 |         let size = unsafe { (*self.as_raw()).cfg_size };
   |                                              ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
