Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA67EAF9
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 02:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727402713; cv=none; b=kiTgARl7sLdSNPxtK/ddTmzJRWTJUz/u7P0xDCeIdGCZZHKEKbCn/FHoKcaXfQk5c3O6ID1RGEEhgjHiyEEjfH+zoL77kpxTOeFMiJsZPSZNI+dK7vlNXIcafVu8v1c1m0Q86vlnFbx8vjrXvvrnvH/KHg3bgJyXa3dPRMWle2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727402713; c=relaxed/simple;
	bh=RXXPOqTdqrJiUtygP6XKuD+jxbG5CJGY+U1xWLkkIT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDQfmYFalFTConPvtPatLH86JtqhiDXZXL8KtOIwxt8+iU28u0qIuANzoJ7sYjRPeT8lp9yPL1ISMHRU91vA26DS9RuQQ1QBxYQaTprI4X2VHXRIVlXhfEK4VJnM1HG1a6nO41T+xf9884qhxovbKzQFMtKsCxa5ZCgyS0aKTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Us+QgxFY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Us+QgxFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727402711; x=1758938711;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RXXPOqTdqrJiUtygP6XKuD+jxbG5CJGY+U1xWLkkIT0=;
  b=Us+QgxFYLarG40hO5gvK2NdBHFPaxDep8bfduJBsVzhYeSgB7bHRRN76
   +vVIrTzg5pyePrTCTzYhQiHa+mx2MKn0IWAWZjVvB0aQ6zxwftJ28Lo7E
   wQyHLLIUw8TgTeWRbaQj9HPfQxGVwu4ts/27IKn4tmJPPmxzsrEl6LujE
   8/P1r9ifApWx3wchUtQoWDsEekm8tuQi0/y87plVRYKwdV5rbud4gS0S6
   LS2RjS92U4C15CEUcpEhmVrvlhyE1l4VeX/9WkzwTTlHjNlZD1UuUL2lz
   lTRaJN7UE++xve4sNcVWfttwI+EC/Y1lzgIpk7m7bqQcuh0BeuffmvnXU
   Q==;
X-CSE-ConnectionGUID: JvkzdSRPQwSXsvHQUglKKw==
X-CSE-MsgGUID: 7c/J0U/VTKGeYqN04Ipiag==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26702764"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26702764"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 19:05:09 -0700
X-CSE-ConnectionGUID: q+J+E9nTQsi9vzgM+klq+Q==
X-CSE-MsgGUID: E79llm+uR/iVVHGQpXcAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="76726812"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2024 19:01:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su0Im-000LNL-36;
	Fri, 27 Sep 2024 02:01:48 +0000
Date: Fri, 27 Sep 2024 10:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] Kunit to check the longest symbol length
Message-ID: <202409270943.rjCFHFqt-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: lib/longest_symbol_kunit.c:33:14: sparse: sparse: '##' failed: concatenation is not a valid token"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240924172351.23225-1-sergio.collado@gmail.com>
References: <20240924172351.23225-1-sergio.collado@gmail.com>
TO: "Sergio González Collado" <sergio.collado@gmail.com>
TO: Brendan Higgins <brendan.higgins@linux.dev>
TO: David Gow <davidgow@google.com>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Alex Gaynor <alex.gaynor@gmail.com>
TO: linux-kselftest@vger.kernel.org
TO: kunit-dev@googlegroups.com
TO: sergio.collado@gmail.com
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Ingo Molnar <mingo@redhat.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Dave Hansen <dave.hansen@linux.intel.com>
TO: "H. Peter Anvin" <hpa@zytor.com>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Gary Guo <gary@garyguo.net>
CC: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
CC: Benno Lossin <benno.lossin@proton.me>
CC: Andreas Hindborg <a.hindborg@samsung.com>
CC: Alice Ryhl <aliceryhl@google.com>
CC: David Rheinsberg <david@readahead.eu>
CC: rust-for-linux@vger.kernel.org
CC: linux-kernel-mentees@lists.linuxfoundation.org
CC: skhan@linuxfoundation.org
CC: ricardo.marliere@suse.com
CC: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

Hi Sergio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abf2050f51fdca0fd146388f83cddd95a57a008d]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Gonz-lez-Collado/Kunit-to-check-the-longest-symbol-length/20240925-012449
base:   abf2050f51fdca0fd146388f83cddd95a57a008d
patch link:    https://lore.kernel.org/r/20240924172351.23225-1-sergio.collado%40gmail.com
patch subject: [PATCH v4] Kunit to check the longest symbol length
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-122-20240927 (https://download.01.org/0day-ci/archive/20240927/202409270943.rjCFHFqt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270943.rjCFHFqt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409270943.rjCFHFqt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/longest_symbol_kunit.c:33:14: sparse: sparse: '##' failed: concatenation is not a valid token
>> lib/longest_symbol_kunit.c:33:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:34:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:34:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:39:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:39:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:39:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:40:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:40:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:40:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:45:23: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:45:23: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:48:1: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:48:1: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:52:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:52:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:75:47: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:75:47: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:104:47: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:104:47: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:104:47: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:33:14: sparse: sparse: Expected ; at end of declaration
   lib/longest_symbol_kunit.c:33:14: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:34:14: sparse: sparse: Expected ; at end of declaration
   lib/longest_symbol_kunit.c:34:14: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:37:1: sparse: sparse: Expected ; at the end of type declaration
   lib/longest_symbol_kunit.c:37:1: sparse: sparse: got }
   lib/longest_symbol_kunit.c:40:14: sparse: sparse: Expected ; at end of declaration
   lib/longest_symbol_kunit.c:40:14: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:43:1: sparse: sparse: Expected ; at the end of type declaration
   lib/longest_symbol_kunit.c:43:1: sparse: sparse: got }
   lib/longest_symbol_kunit.c:52:9: sparse: sparse: Expected ) after typeof
   lib/longest_symbol_kunit.c:52:9: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: Expected ) after typeof
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:52:9: sparse: sparse: undefined identifier '__right'
   lib/longest_symbol_kunit.c:52:9: sparse: sparse: undefined identifier '__right'
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: undefined identifier '__right'
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: undefined identifier '__right'

vim +33 lib/longest_symbol_kunit.c

3c0b3c3b68592b Sergio González Collado 2024-09-24  32  
3c0b3c3b68592b Sergio González Collado 2024-09-24 @33  noinline int LONGEST_SYM_NAME(void);
3c0b3c3b68592b Sergio González Collado 2024-09-24  34  noinline int LONGEST_SYM_NAME(void)
3c0b3c3b68592b Sergio González Collado 2024-09-24  35  {
3c0b3c3b68592b Sergio González Collado 2024-09-24  36  	return RETURN_LONGEST_SYM;
3c0b3c3b68592b Sergio González Collado 2024-09-24  37  }
3c0b3c3b68592b Sergio González Collado 2024-09-24  38  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
