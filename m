Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B547428EF
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Nov 2022 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669298419; x=1700834419;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pdjy9kEs1o0xSwtcx5Dk4HQQpslDpjt5Q6zYOXdsA9s=;
  b=L/gum1pVTz2+m+GRy9wO0mX3YzY0pAkG+XUVFMeFl4Pp13h/SNhUDgMA
   xEhTtJp/P6sTDydu+0jSLStR5I8rl3HNsXQ2bI8l3CUfaiGLlLdTBeDv+
   hbGziE/UWrzV1rkbRhbbQ54hkG+h/9I3YzR7j7vM1iTGKXYhCPol5uNCj
   uD0jG++SLK1SLT13a1HPmdVyyBgoZj1XNLEBo/Rc4Ova817y0+e79I2N5
   OKMWeOO+pLXWJ1lA3oPZh2IBh6lliiLrPmU2/7DQZ9mRIV+X3TgQhBmq5
   5II65bQo1bLU4oY1ca02v7BtSbB+SRg05BjIvvubtQduTZUMsxuJ2ey8x
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="301869005"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="301869005"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 06:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="644501885"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="644501885"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Nov 2022 06:00:17 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyCm0-0003xp-20;
	Thu, 24 Nov 2022 14:00:16 +0000
Date: Thu, 24 Nov 2022 22:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/kernel/return_address.c:44:1: warning: Label 'here' is not
 used. There is #if in function body so the label might be used in code that
 is removed by the preprocessor. [unusedLabelConfiguration]
Message-ID: <202211242153.PUWD8Mwu-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: arch/arm/kernel/return_address.c:44:1: warning: Label 'here' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c3eb11fbb826879be773c137f281569efce67aa8
commit: c46c2c9b43f4f08f20dc06417fbf7091e4ca6d34 ARM: unwind: set frame.pc correctly for current-thread unwinding
date:   9 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c46c2c9b43f4f08f20dc06417fbf7091e4ca6d34
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm/kernel/return_address.c:44:1: warning: Label 'here' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
   here:
   ^

vim +/here +44 arch/arm/kernel/return_address.c

4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  32  
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  33  void *return_address(unsigned int level)
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  34  {
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  35  	struct return_address_data data;
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  36  	struct stackframe frame;
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  37  
01223f365074d6 Keun-O Park           2013-03-18  38  	data.level = level + 2;
01223f365074d6 Keun-O Park           2013-03-18  39  	data.addr = NULL;
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  40  
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  41  	frame.fp = (unsigned long)__builtin_frame_address(0);
a556ee1247b997 Behan Webster         2014-09-27  42  	frame.sp = current_stack_pointer;
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  43  	frame.lr = (unsigned long)__builtin_return_address(0);
c46c2c9b43f4f0 Russell King (Oracle  2022-03-09 @44) here:
c46c2c9b43f4f0 Russell King (Oracle  2022-03-09  45) 	frame.pc = (unsigned long)&&here;
fed240d9c97438 Masami Hiramatsu      2021-10-21  46  #ifdef CONFIG_KRETPROBES
fed240d9c97438 Masami Hiramatsu      2021-10-21  47  	frame.kr_cur = NULL;
fed240d9c97438 Masami Hiramatsu      2021-10-21  48  	frame.tsk = current;
fed240d9c97438 Masami Hiramatsu      2021-10-21  49  #endif
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  50  
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  51  	walk_stackframe(&frame, save_return_addr, &data);
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  52  
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  53  	if (!data.level)
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  54  		return data.addr;
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  55  	else
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  56  		return NULL;
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  57  }
4bf1fa5a34aa2d Uwe Kleine-König      2009-07-21  58  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
