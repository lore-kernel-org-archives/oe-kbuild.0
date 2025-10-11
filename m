Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574DF193077
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Oct 2025 23:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760225808; cv=none; b=gks9tP3nwshzuUeh7EUsNVYnXSr3yhl4qi1BvpjL8wc1s5B/LskgIgC7kmRu7V7YfMWTbKtzizE+tavAAeh3nsb2xRNnx6xtBw1nFgMaDK/KvILcPVLhxRbxbjNipJ8pe1l9i0uw5uEbQP56Fe/Amc/vJsC6SHEH35fOYqAo2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760225808; c=relaxed/simple;
	bh=mmFz+0qGUfTEsRxa7V3TjQraleKfg9IyLgROVo0sFeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1+tphigeZk9a/BIS3DcKeLRSWMLwvMAiYdYaIgJaus/73IOtFbY/HVeBOLmZnovp3syqlBa03nbdlxp3P66j5egariTIfgUFc/AV/qs4RXZGvAcldWRjYHrysnek4Kpm0ixNu3WIxA8clcdemyQ8s4u/7J3gU4X9d0kFzi7peM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbeCPaeE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbeCPaeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760225806; x=1791761806;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mmFz+0qGUfTEsRxa7V3TjQraleKfg9IyLgROVo0sFeE=;
  b=CbeCPaeEwcAcm6jWcmPrHXbg70r+qP3Jwaw7Av/gUCbTSvXyRB00stDl
   1ttlu+niEwbOCdRdZomkX3Ut94lavVojyViAjFwC/efYzi/3C9gT8nfVv
   0BfqCMnIv0jAtYbLlmKBBUXxYiV1pqgsJOGUTPJPj8xuEHhnBzOKU65dp
   kPGY6vqTvfptZu5LJcJIhI9UdnyvBayMwX1WhVzt7Hsx9lygBELG0Nv42
   hJ3rwH6mlu1VeBbHn4PiuWjxRNvMDHalFdmmm6Vjg77tGPXcBt5O6YKdg
   ERoQmTRAMdWWgLesqwYvUJ5D+oDr88jO6x3QAH/zKKGn8d3ZU76k4udCN
   w==;
X-CSE-ConnectionGUID: 1ODmf59sSHSnCM6Kfvn95A==
X-CSE-MsgGUID: MPoxvD2oSeS2AhkdGZQOIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="61613611"
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="61613611"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 16:36:45 -0700
X-CSE-ConnectionGUID: MvuRKu4JQsWxRLHP9ddzgw==
X-CSE-MsgGUID: Q0i/h3eDQCKwj7EtecUpYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="211913207"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Oct 2025 16:36:44 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7j8k-00042p-08;
	Sat, 11 Oct 2025 23:36:42 +0000
Date: Sun, 12 Oct 2025 07:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
Message-ID: <202510120709.Wx3q4Ppg-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251010210134.2066321-2-xur@google.com>
References: <20251010210134.2066321-2-xur@google.com>
TO: xur@google.com
TO: Alexey Gladkov <legion@kernel.org>
TO: Alice Ryhl <aliceryhl@google.com>
TO: Ard Biesheuvel <ardb@kernel.org>
TO: Bill Wendling <morbo@google.com>
TO: Han Shen <shenhan@google.com>
TO: Ingo Molnar <mingo@kernel.org>
TO: Josh Poimboeuf <jpoimboe@kernel.org>
TO: Justin Stitt <justinstitt@google.com>
TO: Kees Cook <kees@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
TO: Nicolas Schier <nicolas.schier@linux.dev>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Tamir Duberstein <tamird@gmail.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
TO: Yabin Cui <yabinc@google.com>
TO: Sriraman Tallam <tmsriram@google.com>
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
CC: Rong Xu <xur@google.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/kspp]
[also build test ERROR on linus/master kees/for-next/pstore v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-Disable-AutoFDO-and-Propeller-flags-for-kernel-modules/20251011-050345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20251010210134.2066321-2-xur%40google.com
patch subject: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for kernel modules
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251012/202510120709.Wx3q4Ppg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120709.Wx3q4Ppg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510120709.Wx3q4Ppg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: -r and -pie may not be used together

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
