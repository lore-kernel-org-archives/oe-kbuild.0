Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607EE33D8
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jan 2023 21:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674510985; x=1706046985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tXUqBWSpGoQB7MJfwwyW2/pDqj1UBEWnXn6LjLmaHoU=;
  b=REYEMydYy2X1no3pbHgM22fA3G3WHC5cjD+UxsPRsR8xAbwn//Uum3l9
   9HFNl8ZVwuR++xuEWZFhaKbYDE2dmZHCqghAq27t180o3N2+m3eRHieWp
   o7PSgoo4bT0rX6DcXgn0lJDfIarGAqKgP02HR2aItmDKC+xHq3oCCnsc9
   S08ZmkqH57fEp2kB77xAOT9N1x4N+U8xfZInqgJ940b/lkMljSyhk6gl+
   RoK62NLSUtNrCPJZEqKcw4XTXKzk8xi9HSdrQluNuLaHOfm9IxP5eEk6D
   Rt1K2pjr3lITA7sg2oNZIrU64WM5EhEOcqBNPAh3jcvBpl/QfdrteDchj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309736231"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="309736231"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 13:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663839623"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="663839623"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 13:56:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK4nf-0005ua-0H;
	Mon, 23 Jan 2023 21:56:23 +0000
Date: Tue, 24 Jan 2023 05:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:x86/core 3/3] arch/x86/kernel/static_call.c:29:24:
 warning: Parameter 'insn' can be declared as pointer to const
 [constParameter]
Message-ID: <202301240528.UzEwj3HD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/kernel/static_call.c:29:24: warning: Parameter 'insn' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   55f32d4bfa88bae216895fca547df5666547e5fb
commit: 55f32d4bfa88bae216895fca547df5666547e5fb [3/3] x86/static_call: Add support for Jcc tail-calls
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 55f32d4bfa88bae216895fca547df5666547e5fb
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/kernel/static_call.c:29:24: warning: Parameter 'insn' can be declared as pointer to const [constParameter]
   static u8 __is_Jcc(u8 *insn) /* Jcc.d32 */
                          ^
   arch/x86/kernel/static_call.c:187:52: warning: Parameter 'dest' can be declared as pointer to const [constParameter]
   bool __static_call_fixup(void *tramp, u8 op, void *dest)
                                                      ^

vim +/insn +29 arch/x86/kernel/static_call.c

e463a09af2f067 Peter Zijlstra 2021-12-04  28  
55f32d4bfa88ba Peter Zijlstra 2023-01-20 @29  static u8 __is_Jcc(u8 *insn) /* Jcc.d32 */
55f32d4bfa88ba Peter Zijlstra 2023-01-20  30  {
55f32d4bfa88ba Peter Zijlstra 2023-01-20  31  	u8 ret = 0;
55f32d4bfa88ba Peter Zijlstra 2023-01-20  32  
55f32d4bfa88ba Peter Zijlstra 2023-01-20  33  	if (insn[0] == 0x0f) {
55f32d4bfa88ba Peter Zijlstra 2023-01-20  34  		u8 tmp = insn[1];
55f32d4bfa88ba Peter Zijlstra 2023-01-20  35  		if ((tmp & 0xf0) == 0x80)
55f32d4bfa88ba Peter Zijlstra 2023-01-20  36  			ret = tmp;
55f32d4bfa88ba Peter Zijlstra 2023-01-20  37  	}
55f32d4bfa88ba Peter Zijlstra 2023-01-20  38  
55f32d4bfa88ba Peter Zijlstra 2023-01-20  39  	return ret;
55f32d4bfa88ba Peter Zijlstra 2023-01-20  40  }
55f32d4bfa88ba Peter Zijlstra 2023-01-20  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
