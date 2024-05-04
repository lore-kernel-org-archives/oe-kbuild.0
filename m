Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA557CAE
	for <oe-kbuild@lists.linux.dev>; Sat,  4 May 2024 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714830635; cv=none; b=pSutHpz6dEETkfOk/vjEKbifpUlOxTjQCyjsAlGL63MN9NSa8NzowqMYxaKcBAOp0VBMhvADTBvlwd+wQ10MYljTv/2FuKBKqJVyYPVymnGUYshdQduizN1Bl0JRNVcQfRQp9ObEAPAd56ICbcboA/c3GHGOjl4k21hUY2M6lAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714830635; c=relaxed/simple;
	bh=WCN2HN5hDpmkHKwBhmkzirJw+YhT6lnswBa3XPe9+l4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=htG9FRf5Xp3SFaL8U42EcwcJrIrr/l4gPWRsAiC2CfpwK3wfWLIKax2oWpnnLjxBtJFph4IWgFu/xdtzPIRmSj831VprCbxXs3KGCfGg43Zf1pjlINWta1YzoV64pP9dtjsVUx/VtScLm807aBVfhBxHj0ChPqEKS0zJ7WU72nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIwJGcRB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIwJGcRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714830634; x=1746366634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WCN2HN5hDpmkHKwBhmkzirJw+YhT6lnswBa3XPe9+l4=;
  b=BIwJGcRBHFabs85rxiih0k9sI2rhjD46KVfrhnXo4g2n8T/FnNxFRR+x
   zCHXZboEMHOFxKu8hzpCzWqKymottepJ/ae7UiuQiCkJ34/xzUu9mEXSy
   feCOboiIX3+u1hPzBWSbxOQcCr85MltgbZ5WEQ8mtnpiJ1q67TYJ2v5+K
   03/H9J7lkVmsm6yxa4LIY0vrDOOOx1Yza3hU3JeeOeBEIlNpTpn50u2bJ
   VEvn89fgmsIT0RJ3Nk3APu2z3HB+CzFKUX246086MGKDAc9mqFpsDgqj2
   bmonDG8Ne7ZosvKwzW/11J5ib8D/bnrlvZGINRHjoF5TTY4b1NGJtgMBG
   A==;
X-CSE-ConnectionGUID: CzwWfGt3Qpao45SP91Rhtg==
X-CSE-MsgGUID: Ze62ZtvTRdWWC5ouLE2gDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10784006"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="10784006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 06:50:33 -0700
X-CSE-ConnectionGUID: p0TFCVHcSiubXkA4Uuxs1w==
X-CSE-MsgGUID: vrKhrC/qRum1zeBsX8ZXBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="27605469"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 May 2024 06:50:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3FmY-000Cpg-0W;
	Sat, 04 May 2024 13:50:30 +0000
Date: Sat, 4 May 2024 21:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/8] selftests: x86: Remove dependence of headers file
Message-ID: <202405042136.6JepEDCv-lkp@intel.com>
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
In-Reply-To: <20240501122918.3831734-2-usama.anjum@collabora.com>
References: <20240501122918.3831734-2-usama.anjum@collabora.com>
TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <ndesaulniers@google.com>
TO: Bill Wendling <morbo@google.com>
TO: Justin Stitt <justinstitt@google.com>
TO: Muhammad Usama Anjum <usama.anjum@collabora.com>
TO: Rick Edgecombe <rick.p.edgecombe@intel.com>
TO: "Mike Rapoport (IBM)" <rppt@kernel.org>
TO: Ingo Molnar <mingo@kernel.org>
TO: Dave Hansen <dave.hansen@linux.intel.com>
TO: Alexey Dobriyan <adobriyan@gmail.com>
TO: Binbin Wu <binbin.wu@linux.intel.com>
TO: "Chang S. Bae" <chang.seok.bae@intel.com>
TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
TO: linux-kselftest@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: llvm@lists.linux.dev
CC: kernel@collabora.com

Hi Muhammad,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes linus/master v6.9-rc6 next-20240503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/selftests-x86-Remove-dependence-of-headers-file/20240501-203158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240501122918.3831734-2-usama.anjum%40collabora.com
patch subject: [PATCH 1/8] selftests: x86: Remove dependence of headers file
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405042136.6JepEDCv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405042136.6JepEDCv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <inline asm>:7:8: error: expected absolute expression
       7 |         .ifne . - test_page - 4096
         |               ^
>> <inline asm>:8:2: error: test page is not one page long
       8 |         .error "test page is not one page long"
         |         ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
