Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB94118DF60
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jan 2025 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227672; cv=none; b=rk28GCWh9ATHV43hqyUPqv0Ka8lajvdJLwe0FZeHdWKog0hzIo2mu4ymtl2S6s8Woxeujx0VR1lm1jpo+fYGwlJ2Tt/TPlORA/OBMkfzk/fbCSLYwJmRlBb3q7Q5vlpGZMMCHBX+DF7BaQwjIDM1+Wj/Mr2K+h8p1JVU/4xqJKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227672; c=relaxed/simple;
	bh=zpZTR8QGgcWJaDKQxlDL8aXVl4fxO5neSzEI4lH4Xeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DExVlLX02enaF5OGWMReMhSqLBBRgIu/+LEPyMXX3z9crw8B0lZNL1+EsFo0TrSZ0M1LI3Pms4UCn6zEQvt18J+U16veBsxpBYAbG/ixXEiNtwbsprgV8/5s7WM74jWzzARfohmfzfFLiP07/JVJ1KhiMpnS1O3efAv3llN7AxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXBMTam1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXBMTam1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738227669; x=1769763669;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zpZTR8QGgcWJaDKQxlDL8aXVl4fxO5neSzEI4lH4Xeg=;
  b=JXBMTam1AwYyu79JBLgumCHN3m9FZUos3fhGQj3KXCiCxUPrrG0EHe6r
   RlvO6OHB2fW1gDiWrEFlbZ/q1EB5OBI8lwCwHjaiIEexIAHietja3zh4n
   pRU2sh0LMvsGpDFLFxFsR+b5y8G4GqV0uwHE6PKx7LXYwi4NZwGRJ/kTg
   5avdsT9hov464ivmHfWK9ktguKR1cmtLmfkJNJsFfXrY3TWckuC3kN7GN
   es4zjMUzzHFCNFlLobeLCeC1jzHGNnIiYZxBqn36K6FNFqj1DIBb/aven
   1DfDHrkcQYZy9jflcM5WmGupbAPs7aZB3HfCgLoaBQ7X4l+nLBSOIBPet
   w==;
X-CSE-ConnectionGUID: uCLG5EewS5iwzQuvyN0XRw==
X-CSE-MsgGUID: X1SYFI3yTpqW8r0rttl98Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42516910"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="42516910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 01:01:09 -0800
X-CSE-ConnectionGUID: uA+ey55VS5OXvsdkBtGStg==
X-CSE-MsgGUID: bkYuUsaFRKKMYrIrzEoE8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109864241"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jan 2025 01:01:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdQQ5-000jrn-2q;
	Thu, 30 Jan 2025 09:01:05 +0000
Date: Thu, 30 Jan 2025 17:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7] Kunit to check the longest symbol length
Message-ID: <202501301631.jRs5AR0I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/longest_symbol_kunit.c:30:14: sparse: sparse: '##' failed: concatenation is not a valid token"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250128070417.46632-1-sergio.collado@gmail.com>
References: <20250128070417.46632-1-sergio.collado@gmail.com>
TO: "Sergio González Collado" <sergio.collado@gmail.com>
TO: David Gow <davidgow@google.com>
TO: Rae Moar <rmoar@google.com>
TO: linux-kselftest@vger.kernel.org
TO: kunit-dev@googlegroups.com
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Alex Gaynor <alex.gaynor@gmail.com>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Gary Guo <gary@garyguo.net>
CC: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
CC: Benno Lossin <benno.lossin@proton.me>
CC: Andreas Hindborg <a.hindborg@samsung.com>
CC: Alice Ryhl <aliceryhl@google.com>
CC: David Rheinsberg <david@readahead.eu>
CC: rust-for-linux@vger.kernel.org
CC: x86@kernel.org
CC: "Sergio González Collado" <sergio.collado@gmail.com>
CC: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
CC: Shuah Khan <skhan@linuxfoundation.org>

Hi Sergio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Gonz-lez-Collado/Kunit-to-check-the-longest-symbol-length/20250128-150617
base:   6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
patch link:    https://lore.kernel.org/r/20250128070417.46632-1-sergio.collado%40gmail.com
patch subject: [PATCH v7] Kunit to check the longest symbol length
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-122-20250129 (https://download.01.org/0day-ci/archive/20250130/202501301631.jRs5AR0I-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301631.jRs5AR0I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501301631.jRs5AR0I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/longest_symbol_kunit.c:30:14: sparse: sparse: '##' failed: concatenation is not a valid token
>> lib/longest_symbol_kunit.c:30:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:31:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:31:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:36:23: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:36:23: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:39:1: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:39:1: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:43:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:43:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:66:47: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:66:47: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:30:14: sparse: sparse: Expected ; at end of declaration
   lib/longest_symbol_kunit.c:30:14: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:31:14: sparse: sparse: Expected ; at end of declaration
   lib/longest_symbol_kunit.c:31:14: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:34:1: sparse: sparse: Expected ; at the end of type declaration
   lib/longest_symbol_kunit.c:34:1: sparse: sparse: got }
   lib/longest_symbol_kunit.c:43:9: sparse: sparse: Expected ) after typeof
   lib/longest_symbol_kunit.c:43:9: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:43:9: sparse: sparse: undefined identifier '__right'
   lib/longest_symbol_kunit.c:43:9: sparse: sparse: undefined identifier '__right'

vim +30 lib/longest_symbol_kunit.c

81ad416fb5eccf Sergio González Collado 2025-01-28  29  
81ad416fb5eccf Sergio González Collado 2025-01-28 @30  noinline int LONGEST_SYM_NAME(void);
81ad416fb5eccf Sergio González Collado 2025-01-28  31  noinline int LONGEST_SYM_NAME(void)
81ad416fb5eccf Sergio González Collado 2025-01-28  32  {
81ad416fb5eccf Sergio González Collado 2025-01-28  33  	return RETURN_LONGEST_SYM;
81ad416fb5eccf Sergio González Collado 2025-01-28  34  }
81ad416fb5eccf Sergio González Collado 2025-01-28  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
