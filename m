Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67F036D
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Dec 2022 05:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671947157; x=1703483157;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IK4rB0jDJ6qyssAHjrJ62YCHGCvehWYqATIRnj2vZK8=;
  b=Eatjk6FSgwqXnhfyUBRf6dHGq4830ZfaClfS+ny96itITtdmJ+42KMra
   9J/TKyzKBFlqLIZWEIn4eddkC0+dRGq5kzHyHd4qWtSK5WfipRATjffC2
   UHwz56GoxfXKTC+rXfdrqW2+hxuWN4xnQY8u/JEySGSPO9VjQicKjx4xU
   K3+FoVq10WOcz/9svZDzZnaIlyGvVAj9pjqB+jBqFknCHdm3Y+QoFJcUB
   GAuPMlYU2zE+bgxsBHv/heVHWMfCU6r6PAKDkXSm9fRWP8OmYPd/dTCrl
   jQLzRFhKHG9EWIAlH0ldnA5CZaSegADTAF/Z4qxbh/A7c9x+i6sG0F397
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="382744680"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="382744680"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 21:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="683060249"
X-IronPort-AV: E=Sophos;i="5.96,272,1665471600"; 
   d="scan'208";a="683060249"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Dec 2022 21:45:56 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p9Jpb-000Dlx-1y;
	Sun, 25 Dec 2022 05:45:55 +0000
Date: Sun, 25 Dec 2022 13:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/kernel/return_address.c:44:1: warning: Label 'here' is not
 used. There is #if in function body so the label might be used in code that
 is removed by the preprocessor. [unusedLabelConfiguration]
Message-ID: <202212251328.TJ2yOrsZ-lkp@intel.com>
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
head:   72a85e2b0a1e1e6fb4ee51ae902730212b2de25c
commit: c46c2c9b43f4f08f20dc06417fbf7091e4ca6d34 ARM: unwind: set frame.pc correctly for current-thread unwinding
date:   10 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 10 months ago
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
