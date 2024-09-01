Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DCE17E47A
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725199789; cv=none; b=moi8UjwMdk6R/B8AzrObNe28BFS7v9F5DfUHNC/LR9fqkRBVT93k4g2YSmahJP9qql2OnslHGKR+xUiMRv+aYXyHTA1cz8Mwa6NWpIJO0e99nJJDUivrYSMd6mSdT2SOEf+Xdy2cuS6wJTP6cRhGnd0WboFGIf2CNeucVvKoC0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725199789; c=relaxed/simple;
	bh=msu1dI0piRpgUemW18Dt4PXw35vnnh2LGA8LHf9hgNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unkH9KtPsMjSiS7gtfW6ZoYv04DRl4gfWJ0oXQ8KN4vu7pgazn62sbVgBTJTVkF5X/mlj/djvG6hM+QqPgNyCzpRo/lfmvu/96FCw08YXV4gYiemu7L81Izro5EbifT6q3BqZKpLfI5PIqkxFdcVaXmg+ovQoclOLUZajdMicA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEECW4YI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEECW4YI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725199788; x=1756735788;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=msu1dI0piRpgUemW18Dt4PXw35vnnh2LGA8LHf9hgNU=;
  b=jEECW4YIEQohj3azngcYDun5lfwrFvZDyO5UlUOtG8CKJcgV8/GP9y24
   0AmvSJ1b29YOabJLCSvNZSnbSYayqCVSJsYIv06tISGjXLJoj9v3h+508
   C2rK02S3zpVySRfV7k+XAexQf1Dpzx9G9REy+CS5T+Yqdwcl9Ngsz/vZa
   aw2xTHU1n7WJa15FbwScxYCuTgljwOzq/wcf9vzVvFERfh0XHNJWr5HSB
   MF+myeTjDIDoExOWyToDstVscP+IGp26JIpSNVX5tUSimfmQTsX7V69LN
   9F1czpwwZAwShjTPzkth643+x/D9HH7AZtJ53xtSsGb7dHK1zJzVtOr9q
   Q==;
X-CSE-ConnectionGUID: i4ZbzHbPQZu5DtUl+11PuA==
X-CSE-MsgGUID: vSOsWiz6ST+yMZFpKSlNVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23359903"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="23359903"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 07:09:47 -0700
X-CSE-ConnectionGUID: YbngaK9yT2SaM6n5tgPi/Q==
X-CSE-MsgGUID: qkhILcHFTVe0nXnGBnhrPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="69006601"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Sep 2024 07:09:46 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sklGx-0003iI-2C;
	Sun, 01 Sep 2024 14:09:43 +0000
Date: Sun, 1 Sep 2024 22:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] selftests/futex: Create test for robust list
Message-ID: <202409012132.wVaYZ660-lkp@intel.com>
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
In-Reply-To: <20240829183509.446934-1-andrealmeid@igalia.com>
References: <20240829183509.446934-1-andrealmeid@igalia.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/selftests-futex-Create-test-for-robust-list/20240830-023631
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20240829183509.446934-1-andrealmeid%40igalia.com
patch subject: [PATCH] selftests/futex: Create test for robust list
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409012132.wVaYZ660-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409012132.wVaYZ660-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   robust_list.c: In function 'futex2_wait':
>> robust_list.c:53:24: error: 'SYS_futex_wait' undeclared (first use in this function); did you mean 'SYS_futex_waitv'?
      53 |         return syscall(SYS_futex_wait, futex, val, ~0U, FUTEX2_SIZE_U32, timo, CLOCK_MONOTONIC);
         |                        ^~~~~~~~~~~~~~
         |                        SYS_futex_waitv
   robust_list.c:53:24: note: each undeclared identifier is reported only once for each function it appears in
>> robust_list.c:54:1: warning: control reaches end of non-void function [-Wreturn-type]
      54 | }
         | ^


vim +53 tools/testing/selftests/futex/functional/robust_list.c

3306ef10715f1b André Almeida 2024-08-29  50  
3306ef10715f1b André Almeida 2024-08-29  51  int futex2_wait(void *futex, int val, struct timespec *timo)
3306ef10715f1b André Almeida 2024-08-29  52  {
3306ef10715f1b André Almeida 2024-08-29 @53  	return syscall(SYS_futex_wait, futex, val, ~0U, FUTEX2_SIZE_U32, timo, CLOCK_MONOTONIC);
3306ef10715f1b André Almeida 2024-08-29  54  }
3306ef10715f1b André Almeida 2024-08-29  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
