Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2B193436
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Oct 2024 21:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728682663; cv=none; b=Sx7tWtCzvN2MfnITz/a08htm/61xGeT2V/ToX2ByIFZu6aAwcu8B3EZLzCU+M2K8BSe+i3aUnI9RGQ7lIYdUx6CPAbsjymC7oXg0UophCaPSB/HpZDJMoeDsqbs9jHvQ0y5jcIzMUSGQXUNbi2Qdq8IvqKmWS3TTVbSBAnRhMM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728682663; c=relaxed/simple;
	bh=+APCiJF5emWKla+HOMGkHRJOBeYB1unbn8X95QjeE6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJVKJtJDOtHjivG4Op8yC3sS3XIC77qwWftWi11CXFPHLwt5htY+WznJy0Je1tAr1q5m0lOAyS6uwF2wWd+XIaO5oKPUq1O6SokVo87wACK0XPrJK7yPlGqhd3yWNy00986aN5qWp9xi7Dhb7UcM6GV/pfC54JSSfDCX/VURt68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldmrkrG7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldmrkrG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728682661; x=1760218661;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+APCiJF5emWKla+HOMGkHRJOBeYB1unbn8X95QjeE6U=;
  b=ldmrkrG7vgY7yt5oRt9sygG+9tFK1LHxbRsITPnJBEliHkdafy6UuAPz
   F7Z6LrZiZfTUQnboZJHJGf+DmzQ6UEHYVxWgFyPrG12wY+Vitvdn7HX3Y
   aKgt2lIk2nSxbVd557zgmXVylLMDg7i2VXh1PRITafSB7GGTdtoxyyAfa
   Z36OPwM2zVZPxzKRLs24drkA6R3HTzMrqKf5uNl28uWLc69w/XJZuUR1r
   TvEoTT3Pke53vG6/QBNbj3m5d7rtZBsOB15kS3eBFOooeiLpRRcGLUcMf
   88lomnOXod8qe/aJShxydGB6E4zxGQjqNFoH+/ePmr/wKQGkRYnAtbPuy
   A==;
X-CSE-ConnectionGUID: cZkpibdgQ5m/mBk+O+u7+w==
X-CSE-MsgGUID: 0qNewHpWRnmyxoMufFctXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38741636"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="38741636"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 14:37:41 -0700
X-CSE-ConnectionGUID: zgmpudRdQkqIZQGa0SbzMA==
X-CSE-MsgGUID: 6SyN7y+DQCWa6cuC98AArQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="76646784"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Oct 2024 14:37:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szNKL-000Cld-22;
	Fri, 11 Oct 2024 21:37:37 +0000
Date: Sat, 12 Oct 2024 05:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] selftests/futex: Create test for robust list
Message-ID: <202410120549.1KpTVqTu-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241010011142.905297-3-andrealmeid@igalia.com>
References: <20241010011142.905297-3-andrealmeid@igalia.com>
TO: "André Almeida" <andrealmeid@igalia.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Darren Hart <dvhart@infradead.org>
TO: Davidlohr Bueso <dave@stgolabs.net>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: kernel-dev@igalia.com
CC: "André Almeida" <andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/selftests-futex-Add-ASSERT_-macros/20241010-091311
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20241010011142.905297-3-andrealmeid%40igalia.com
patch subject: [PATCH v3 2/2] selftests/futex: Create test for robust list
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120549.1KpTVqTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410120549.1KpTVqTu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> robust_list.c:121:44: warning: passing 'int *' to parameter of type 'unsigned int *' converts between pointers to integer types with different sign [-Wpointer-sign]
     121 |         if (atomic_compare_exchange_strong(futex, &zero, tid)) {
         |                                                   ^~~~~
   /opt/cross/clang-3b5b5c1ec4/lib/clang/18/include/stdatomic.h:144:112: note: expanded from macro 'atomic_compare_exchange_strong'
     144 | #define atomic_compare_exchange_strong(object, expected, desired) __c11_atomic_compare_exchange_strong(object, expected, desired, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST)
         |                                                                                                                ^~~~~~~~
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
