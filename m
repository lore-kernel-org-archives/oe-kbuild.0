Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E41386
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Sep 2023 04:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693542926; x=1725078926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwhTnvzyhbmwCupC58k/lOkFhMZFCNdrz62xetX3S/E=;
  b=aLuWMkeO2sy3LmFjpXW82utuJcw5r2gmTdwRLUAMYFVjQ1Y47I8RTJm0
   w/tKcIN0vFkKf5gB2/oDAgjp/iWFTCXxDPpcfRnWSwTDpELaIlB/Mu1GP
   i8nCPCG+ooW/nqR1S2mBPMleJ5wkJmS+BKDL22TJcPQ2JzPP1SYxqcZw+
   xPyjw+raSTLf+AhruVcbSnMXM704BjmhJSrRdxDTQKIfrEavy+UBEVSIa
   m8IxnZ6anjRyelZU/twsJZ1+x2OFjI4mlukfozLhjfIxih6wi/Lq2ofMn
   KW1VfGYy3CPt/eb7sgum8hcpoIeB5dEwQxtNzGiuZqSsTtPP9Ig/74gtw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375036994"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="375036994"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 21:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863416045"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="863416045"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2023 21:35:22 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbvsN-0000sO-37;
	Fri, 01 Sep 2023 04:35:19 +0000
Date: Fri, 1 Sep 2023 12:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] tty: Serialise racing tiocspgrp() callers
Message-ID: <202309011252.ItlD27Mg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230901015030.2469062-3-earl.chew@yahoo.ca>
References: <20230901015030.2469062-3-earl.chew@yahoo.ca>
TO: Earl Chew <earl.chew@yahoo.ca>
TO: linux-kernel@vger.kernel.org
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
CC: peter@hurleysoftware.com
CC: earl.chew@yahoo.ca

Hi Earl,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Earl-Chew/tty-Serialise-racing-tiocspgrp-callers/20230901-095411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230901015030.2469062-3-earl.chew%40yahoo.ca
patch subject: [PATCH 2/3] tty: Serialise racing tiocspgrp() callers
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230901/202309011252.ItlD27Mg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309011252.ItlD27Mg-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 47f86834bbd4 ("redo locking of tty->pgrp")'
#8: 
the introduction of tty->ctrl.lock in commit 47f86834bbd4
(redo locking of tty->pgrp), tiocspgrp() has acquired the

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#36: drivers/tty/tty_jobctrl.c:40:
+	BUG_ON(ctrl_lock && (

WARNING: Where possible, use lockdep_assert_held instead of assertions based on spin_is_locked
#37: drivers/tty/tty_jobctrl.c:41:
+	       ctrl_lock != &tty->ctrl.lock || !spin_is_locked(ctrl_lock)));

ERROR: code indent should use tabs where possible
#105: drivers/tty/tty_jobctrl.c:521:
+        }$

WARNING: please, no spaces at the start of a line
#105: drivers/tty/tty_jobctrl.c:521:
+        }$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
