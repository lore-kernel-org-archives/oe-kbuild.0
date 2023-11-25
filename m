Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF620E7
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 21:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBmIrLCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700947626; x=1732483626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r54fkDj8FPADmoE6hjArOqddAtTqwPjFxfXO1jFeBcc=;
  b=dBmIrLCeywSYqqoVRAZm26UH/bZ97GnhYtGv6mOG3cbNEo5orHAHQ/lw
   y7AXh1FgM3cmO9yuWc31Nou+J2s8abrodFcT5Z8ASsQUrO5M/dZawTe0f
   sDXpjV399bwUoKqs46wJgkzRwoiuuBeUVTJMTQ2aNvFnggJNO5uW2nkrY
   QgTVzZce7r1VO4GVrjppbhp9xDxvDY/MbklQrzsm8s2PiYfxqYOZ3lCZa
   loBC3cEvf5691RypBdlcQ7OiCvxBxDU2TWXOzj+UTvDPa++hUBeBB2j8+
   u4YcScfCHQ66ca4fFZyRT/yfJ2Xbj6znsvjLIaY3cHgKlgu9t5ae7pE+t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="459031625"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="459031625"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 13:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="1099391698"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="1099391698"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2023 13:27:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r70B4-0004RN-0H;
	Sat, 25 Nov 2023 21:27:02 +0000
Date: Sun, 26 Nov 2023 05:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] prctl: Get private anonymous memory region name
Message-ID: <202311260555.H8SrEcwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/sys.c:2371:17: sparse: sparse: typename in expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <tencent_977CBF8E8CA6234A1B740A35655D5D7EAA0A@qq.com>
References: <tencent_977CBF8E8CA6234A1B740A35655D5D7EAA0A@qq.com>
TO: Rong Tao <rtoax@foxmail.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Florent Revest <revest@chromium.org>
TO: Kees Cook <keescook@chromium.org>
TO: David Hildenbrand <david@redhat.com>
TO: Stefan Roesch <shr@devkernel.io>
TO: Andy Chiu <andy.chiu@sifive.com>
TO: Josh Triplett <josh@joshtriplett.org>
TO: Joey Gouly <joey.gouly@arm.com>
TO: Oleg Nesterov <oleg@redhat.com>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Ondrej Mosnacek <omosnace@redhat.com>
TO: linux-kernel@vger.kernel.org
CC: rtoax@foxmail.com
CC: rongtao@cestc.cn

Hi Rong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Tao/prctl-Get-private-anonymous-memory-region-name/20231125-220925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/tencent_977CBF8E8CA6234A1B740A35655D5D7EAA0A%40qq.com
patch subject: [PATCH] prctl: Get private anonymous memory region name
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-r133-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260555.H8SrEcwc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311260555.H8SrEcwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311260555.H8SrEcwc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sys.c:2371:17: sparse: sparse: typename in expression
   kernel/sys.c:2371:23: sparse: sparse: Expected ; at end of statement
   kernel/sys.c:2371:23: sparse: sparse: got struct
   kernel/sys.c:2371:17: sparse: sparse: undefined identifier 'const'
   kernel/sys.c:2377:17: sparse: sparse: undefined identifier 'anon_name'
   kernel/sys.c:2378:22: sparse: sparse: undefined identifier 'anon_name'
   kernel/sys.c:2384:56: sparse: sparse: undefined identifier 'anon_name'
   kernel/sys.c:2389:35: sparse: sparse: undefined identifier 'anon_name'

vim +2371 kernel/sys.c

9a10064f5625d5 Colin Cross 2022-01-14  2361  
e5c636bb5ceadb Rong Tao    2023-11-25  2362  static int prctl_get_vma(unsigned long opt, unsigned long addr,
e5c636bb5ceadb Rong Tao    2023-11-25  2363  			 unsigned long buf, unsigned long arg)
e5c636bb5ceadb Rong Tao    2023-11-25  2364  {
e5c636bb5ceadb Rong Tao    2023-11-25  2365  	struct mm_struct *mm = current->mm;
e5c636bb5ceadb Rong Tao    2023-11-25  2366  	const char __user *u_buf;
e5c636bb5ceadb Rong Tao    2023-11-25  2367  	int error;
e5c636bb5ceadb Rong Tao    2023-11-25  2368  
e5c636bb5ceadb Rong Tao    2023-11-25  2369  	switch (opt) {
e5c636bb5ceadb Rong Tao    2023-11-25  2370  	case PR_GET_VMA_ANON_NAME:
e5c636bb5ceadb Rong Tao    2023-11-25 @2371  		const struct anon_vma_name *anon_name = NULL;
e5c636bb5ceadb Rong Tao    2023-11-25  2372  
e5c636bb5ceadb Rong Tao    2023-11-25  2373  		u_buf = (const char __user *)buf;
e5c636bb5ceadb Rong Tao    2023-11-25  2374  		error = 0;
e5c636bb5ceadb Rong Tao    2023-11-25  2375  
e5c636bb5ceadb Rong Tao    2023-11-25  2376  		mmap_read_lock(mm);
e5c636bb5ceadb Rong Tao    2023-11-25  2377  		anon_name = madvise_get_anon_name(mm, addr);
e5c636bb5ceadb Rong Tao    2023-11-25  2378  		if (!anon_name) {
e5c636bb5ceadb Rong Tao    2023-11-25  2379  			mmap_read_unlock(mm);
e5c636bb5ceadb Rong Tao    2023-11-25  2380  			error = -EFAULT;
e5c636bb5ceadb Rong Tao    2023-11-25  2381  			break;
e5c636bb5ceadb Rong Tao    2023-11-25  2382  		}
e5c636bb5ceadb Rong Tao    2023-11-25  2383  
e5c636bb5ceadb Rong Tao    2023-11-25  2384  		if (copy_to_user((char __user *)u_buf, anon_name->name,
e5c636bb5ceadb Rong Tao    2023-11-25  2385  				 strlen(anon_name->name) + 1))
e5c636bb5ceadb Rong Tao    2023-11-25  2386  			error = -EFAULT;
e5c636bb5ceadb Rong Tao    2023-11-25  2387  
e5c636bb5ceadb Rong Tao    2023-11-25  2388  		mmap_read_unlock(mm);
e5c636bb5ceadb Rong Tao    2023-11-25  2389  		anon_vma_name_put(anon_name);
e5c636bb5ceadb Rong Tao    2023-11-25  2390  		break;
e5c636bb5ceadb Rong Tao    2023-11-25  2391  	default:
e5c636bb5ceadb Rong Tao    2023-11-25  2392  		error = -EINVAL;
e5c636bb5ceadb Rong Tao    2023-11-25  2393  	}
e5c636bb5ceadb Rong Tao    2023-11-25  2394  	return error;
e5c636bb5ceadb Rong Tao    2023-11-25  2395  }
e5c636bb5ceadb Rong Tao    2023-11-25  2396  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
