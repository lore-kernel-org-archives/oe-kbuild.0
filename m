Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EEC267738
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Mar 2025 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741875710; cv=none; b=PfXnKdZmgfTNqwvnKbQuOJudqup6Gaffjmr29w8QaRl9okWFzUxO3KmHwYjayura0kl4H5Od5KeQlv5kaw7FN6dRJRzHZgfynQyo11W2Hx5NLDLrwDIccLVhm5BicMVBgL57Y2ZQtpgEqFiXEQlDI95ih+Tu5v2eAvnN6345xRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741875710; c=relaxed/simple;
	bh=xO8CxGRVuXKq1UPP5amXTtEFj4tqxmGWP7jRp8tFto8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8+54wLi261DXwBKEmGzk8GiBJm14Yr0xG0uJGpH6+LocnoUZFKhcLVQbjKJ5QKEfl3cq0ut3FvfQn4CZv/Xi9mJRx14rMsHwqa6i7/jXlx/zi6tvERzQnjy4y//VgvYkVYs7qgO/GI4H7UpUNv9Hi4Bnsuishc0ilC5Md8pyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h609wxUc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h609wxUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741875708; x=1773411708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xO8CxGRVuXKq1UPP5amXTtEFj4tqxmGWP7jRp8tFto8=;
  b=h609wxUcAPLaTM7XGwz4K0bs1lGAgzPhmF5z758PS0eaZR+KiB2DOD9M
   0xZ9rDtqUKHX4EHvZbyvIXMVZnpHcn+iOxUD7gpo2LO7V3OlAE7ETkdxg
   N9QwAayVr0uGibI04/NGw+cE7CDshJla6arAyioNtDHXx51rYtv97PJWB
   CL+8i+IN3IjyLZQO65vkRqfzjlMuWD3LIu/UBau7UnsA7j5k2kqX2alg8
   6RTyGf/g55eyhYC6yjmb8FgQ3QzIPFi5n1dLZE4XJBSMB1QXU4U0lN8wh
   fKzhz2hi4iW7KRKPjj0vteteQxCBRaDGULU8A9WfmCT1EO2myNEmu0i9K
   Q==;
X-CSE-ConnectionGUID: xeo6vxCST8+zHTOHcyGt3w==
X-CSE-MsgGUID: Xdz/lKwbSd+idkNt8AkYHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46780903"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="46780903"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:21:48 -0700
X-CSE-ConnectionGUID: 4lEXQK/hTxa7EcIdR51Hbw==
X-CSE-MsgGUID: gu7EMdGPTFyMWq+G5oNiHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121176805"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Mar 2025 07:21:47 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsjRR-0009Vl-04;
	Thu, 13 Mar 2025 14:21:45 +0000
Date: Thu, 13 Mar 2025 22:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_dl_pfs_parent_v2 1/3] error[E0061]: this function
 takes 4 arguments but 3 arguments were supplied
Message-ID: <202503132249.hd1b9k8P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_pfs_parent_v2
head:   1fdd8341aac55462589828d0fed5b7d375cbfb0b
commit: 92dddc55f6a92701975cc749a90f9b33f0964f4d [1/3] faux: extend the creation function for module namespace
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250313/202503132249.hd1b9k8P-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503132249.hd1b9k8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503132249.hd1b9k8P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0061]: this function takes 4 arguments but 3 arguments were supplied
   --> rust/kernel/faux.rs:31:28
   |
   31    |         let dev = unsafe { bindings::faux_device_create(name.as_char_ptr(), null_mut(), null()) };
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^----------------------------------------
   |                                                        ||
   |                                                        |unexpected argument of type `*const u8`
   |                                                        two arguments of type `*mut bindings::device` and `*const bindings::faux_device_ops` are missing
   |
   note: function defined here
   --> rust/bindings/bindings_generated.rs:59032:12
   |
   59032 |     pub fn faux_device_create(
   |            ^^^^^^^^^^^^^^^^^^
   help: did you mean
   |
   31    |         let dev = unsafe { bindings::faux_device_create(null(), null_mut(), /* *mut bindings::device */, /* *const bindings::faux_device_ops */) };
   |                                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
