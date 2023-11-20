Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6681DDD1
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMidxqq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700496800; x=1732032800;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lWldyZKqZGK2j/qIYw4OxB7k7GsHyDbhlVwKDsAV0L8=;
  b=HMidxqq2/Qwv0iwXEfTS7VMvo4zUIAwqRfn/2yTCYQBYKnp97J2rJPUI
   hkfDDgyIcGWqvffaW6mD+fQmvzKBKZPRRTQxvFUg/pu+EEPk6Skl4wHRj
   /yeSrI7+APsGoh8gmF6zwAn8JsaXLT3Iqx3AFFv3IcaHimgGWfvGJfAk/
   TEFB6ckoUOb5eK+LaNCKHeP9nBWLiV4ISZOw69oKy/q6yBQHFJ9fbbKLy
   0DsdIAnoI6OPG0tWaAVuKq53HQrzFvrGeI9uIEFVxI4OBhLQDkEZjTBi6
   1KqJ6XbtextoadFmAs9cxID5yTV+KltEs0b6PZy9bJ9hXz+6C7CTXXsYZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477853659"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="477853659"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 08:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="769947532"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="769947532"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Nov 2023 08:13:18 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r56tb-0006dR-1a;
	Mon, 20 Nov 2023 16:13:13 +0000
Date: Tue, 21 Nov 2023 00:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] Kunit to check the longest symbol length
Message-ID: <202311202346.WKlRyA4y-lkp@intel.com>
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
In-Reply-To: <20231119180145.157455-1-sergio.collado@gmail.com>
References: <20231119180145.157455-1-sergio.collado@gmail.com>
TO: "Sergio González Collado" <sergio.collado@gmail.com>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Alex Gaynor <alex.gaynor@gmail.com>
TO: Wedson Almeida Filho <wedsonaf@gmail.com>
TO: Brendan Higgins <brendan.higgins@linux.dev>
TO: David Gow <davidgow@google.com>
TO: linux-kselftest@vger.kernel.org
TO: kunit-dev@googlegroups.com
TO: sergio.collado@gmail.com
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Gary Guo <gary@garyguo.net>
CC: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
CC: Benno Lossin <benno.lossin@proton.me>
CC: Andreas Hindborg <a.hindborg@samsung.com>
CC: Alice Ryhl <aliceryhl@google.com>
CC: David Rheinsberg <david@readahead.eu>
CC: rust-for-linux@vger.kernel.org
CC: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

Hi Sergio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 037266a5f7239ead1530266f7d7af153d2a867fa]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Gonz-lez-Collado/Kunit-to-check-the-longest-symbol-length/20231120-020401
base:   037266a5f7239ead1530266f7d7af153d2a867fa
patch link:    https://lore.kernel.org/r/20231119180145.157455-1-sergio.collado%40gmail.com
patch subject: [PATCH v2] Kunit to check the longest symbol length
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-r111-20231120 (https://download.01.org/0day-ci/archive/20231120/202311202346.WKlRyA4y-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202346.WKlRyA4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311202346.WKlRyA4y-lkp@intel.com/

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
   lib/longest_symbol_kunit.c:75:43: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:75:43: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:81:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:104:43: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:104:43: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/longest_symbol_kunit.c:104:43: sparse: sparse: '##' failed: concatenation is not a valid token
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

ccf8b63c82d23d Sergio González Collado 2023-11-19  32  
ccf8b63c82d23d Sergio González Collado 2023-11-19 @33  noinline int LONGEST_SYM_NAME(void);
ccf8b63c82d23d Sergio González Collado 2023-11-19  34  noinline int LONGEST_SYM_NAME(void)
ccf8b63c82d23d Sergio González Collado 2023-11-19  35  {
ccf8b63c82d23d Sergio González Collado 2023-11-19  36  	return RETURN_LONGEST_SYM;
ccf8b63c82d23d Sergio González Collado 2023-11-19  37  }
ccf8b63c82d23d Sergio González Collado 2023-11-19  38  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
