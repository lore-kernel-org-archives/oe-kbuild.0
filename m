Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1864230E83A
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325232; cv=none; b=ToqduE6Y0/UYEpaFqMLNPRJbb9PpvDbkzHHzsJVxiEWSrSqxG1fsU4vAF6FgqAB58gTfnQwh4qsceDiB3+i+zQ7ucOuUD1+GF/VyiGOgsAfKWccr2Ij7ufkm3/ggZdYjJrHQpIbIrSE4wCCU2NZhe1MvcY7ix7gD2nutv0FvxOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325232; c=relaxed/simple;
	bh=fUGRQvjv/BLI1eYBFswOvQce4f86a/NcJP9glSOgO3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R6LHPKSzqGalSGMuyCj2sZJ0cEbxKu0WoQm9/oVBdiXFHCWWTbyui5nD02Cf1zeMVf5x+ZaIxO6g4FcGUgDheoAhBXJkUFKzQmq9ET99UxuXSe81+MHXTCgO83LYMG7XI6TNCKur13BrXFMTbcyEDtxGpoE/Dd1Ew7FY7YKNy7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlL7DArO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlL7DArO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787325230; x=1818861230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fUGRQvjv/BLI1eYBFswOvQce4f86a/NcJP9glSOgO3I=;
  b=TlL7DArOOv/4fdYN8i0idhQDapd8P0vcsX4Oy63NHNfTVWJUU5AHPt72
   WCdSKKcSSqn6krx5FXXT6V9xB/Et+Erb9lXGLhmKLYdCrHksHaHT9Uq0j
   oh9Ml+EzrbBUDKRHH0gLCJ0JtGq805c4fDKJkzBfxrMLhAly9wYkiy2/p
   6YDLxvvFZbbwvAjm8tDTJzG33fGZlR2gmkEtceALrcfutR09UwLyC0mH8
   RIjiLgTLyRj0Zgh44Z2k8S+QyeLKxatTXEec90WKGY1Tfg9fiBF9h+kPM
   e7UnFb2psaNhUVQMCOoFi2/EstOybrrUYi8mIvYRsdhhB48Pxfgcr5OJ3
   w==;
X-CSE-ConnectionGUID: fbf4E2x9SBSyZUdCFNQjyg==
X-CSE-MsgGUID: W0jIIhQXTS2Ad4XN0Gcaaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="105413230"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="105413230"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 08:13:50 -0700
X-CSE-ConnectionGUID: 15BDB+P9R5Kncg+pi7B75A==
X-CSE-MsgGUID: q6RYk+4PQw2x9vuS6fTp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291223610"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 08:13:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxQwE-00000000q4v-1hOo;
	Fri, 21 Aug 2026 15:13:46 +0000
Date: Fri, 21 Aug 2026 23:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] gpu: nova-core: populate GSP_VF_INFO when vGPU is
 enabled
Message-ID: <202608212302.i87Txgpq-lkp@intel.com>
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
In-Reply-To: <20260804170045.902069-2-zhiw@nvidia.com>
References: <20260804170045.902069-2-zhiw@nvidia.com>
TO: Zhi Wang <zhiw@nvidia.com>
TO: dakr@kernel.org
TO: acourbot@nvidia.com
CC: airlied@gmail.com
CC: simona@ffwll.ch
CC: ojeda@kernel.org
CC: alex.gaynor@gmail.com
CC: boqun.feng@gmail.com
CC: gary@garyguo.net
CC: bjorn3_gh@protonmail.com
CC: lossin@kernel.org
CC: a.hindborg@kernel.org
CC: aliceryhl@google.com
CC: tmgross@umich.edu
CC: jhubbard@nvidia.com
CC: ecourtney@nvidia.com
CC: joelagnelf@nvidia.com
CC: apopple@nvidia.com
CC: cjia@nvidia.com
CC: smitra@nvidia.com
CC: kjaju@nvidia.com
CC: alkumar@nvidia.com
CC: ankita@nvidia.com
CC: aniketa@nvidia.com
CC: kwankhede@nvidia.com
CC: targupta@nvidia.com
CC: nova-gpu@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: zhiwang@kernel.org
CC: Zhi Wang <zhiw@nvidia.com>

Hi Zhi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-rust/drm-rust-next]
[also build test ERROR on next-20260820]
[cannot apply to linus/master v7.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhi-Wang/gpu-nova-core-populate-GSP_VF_INFO-when-vGPU-is-enabled/20260804-200045
base:   https://gitlab.freedesktop.org/drm/rust/kernel.git drm-rust-next
patch link:    https://lore.kernel.org/r/20260804170045.902069-2-zhiw%40nvidia.com
patch subject: [PATCH v2 1/1] gpu: nova-core: populate GSP_VF_INFO when vGPU is enabled
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-012-20260821 (https://download.01.org/0day-ci/archive/20260821/202608212302.i87Txgpq-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212302.i87Txgpq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608212302.i87Txgpq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find type `ExtSriovRegs` in module `pci`
   --> drivers/gpu/nova-core/gsp/fw/commands.rs:44:41
   |
   44 |             .find_ext_capability::<pci::ExtSriovRegs>()?
   |                                         ^^^^^^^^^^^^ not found in `pci`
--
>> error[E0599]: no method named `find_ext_capability` found for struct `ConfigSpace<'a, T>` in the current scope
   --> drivers/gpu/nova-core/gsp/fw/commands.rs:44:14
   |
   42 |           let sriov = dev
   |  _____________________-
   43 | |             .config_space_extended()?
   44 | |             .find_ext_capability::<pci::ExtSriovRegs>()?
   | |             -^^^^^^^^^^^^^^^^^^^ method not found in `ConfigSpace<'_>`
   | |_____________|
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
