Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DEB26CE2B
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 21:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766612648; cv=none; b=ZiEdjaWn3Iii5WMGldB+bFMjfGTZ/Hfic5rCAMghsXzV7pWb6vVqjPvjA2NfapCY3otrFS8B6XuzE5F8vz/yuXg5ymLgs7BHELXyjtN3Ra2a3QGKahhsUOKUJkfORl6Y8V4N5Rf+zeBOXXdqUQISz/wC9eQ5zuleCCmhZP6vkvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766612648; c=relaxed/simple;
	bh=PL6lPx0yjWJppH1MmYRQzZ8KQ3S32QaH0RfoulOxHVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5qKJjnIpNyqGGkpWMXJNEaz7YFP6tqTakZczQzcyB6SqOG30Itcpg6DqHUy23nNcB4NfS0U/s+Ws1zG0jJVi3yckcoErxRUgJiJEFl3zTSsHGejmjwXDCq9J9h0y2TCcxTe09LZOI+Npt6iBVNhYCRQ07Cw07KYfbd5EK6vZBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZ4biFED; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZ4biFED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766612644; x=1798148644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PL6lPx0yjWJppH1MmYRQzZ8KQ3S32QaH0RfoulOxHVg=;
  b=BZ4biFEDrZpOZjEBdI8+76SOwj9GmmNcx6qYGhUfPZCxNHksItEp35Rp
   JQTONX0AqvcdW8riP5G8yvA4cSJjG442Cg+Rg8Vr7FXUM3SZdiwTSqTlD
   X3Zdup5FTZSxDZwoaN9IPUoo/b7Q0x0B5HI3N7LklrdFJRq0kAzYHM7pm
   4V5t6KW7HFcM1l+5RefmAYEo1KkhP20bYT0X1wewjgK8OHq0q7+o+LXOr
   MIf+/9kGhjHffr9SEvskQAS0a9GmqIhNYOzpLN/Fe+I7J0xwk93OoPYlb
   P78MzhNbnUzlwYUsoOexlIzkhhStvo7xd4p9af5oP+B1O4J0XdHekkNo4
   g==;
X-CSE-ConnectionGUID: R72kPVi4RwKmznnGLzUwnQ==
X-CSE-MsgGUID: CB3Aca2vRAKQ7aclR8Trmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71021202"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="71021202"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 13:44:01 -0800
X-CSE-ConnectionGUID: 2MMx6/sNQF6LszHiQ4gl8A==
X-CSE-MsgGUID: iLEAC5VtSqWhiNtsHh0RoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="204597071"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Dec 2025 13:44:01 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYWeD-000000003Th-32Rw;
	Wed, 24 Dec 2025 21:43:57 +0000
Date: Thu, 25 Dec 2025 05:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] x86/boot: replace FS/GS inline asm with
 segment-qualified accesses
Message-ID: <202512250513.AOgurzxD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/boot/boot.h:84:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251223202038.91200-2-ubizjak@gmail.com>
References: <20251223202038.91200-2-ubizjak@gmail.com>
TO: Uros Bizjak <ubizjak@gmail.com>
TO: x86@kernel.org
TO: linux-kernel@vger.kernel.org
CC: Uros Bizjak <ubizjak@gmail.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: "H. Peter Anvin" <hpa@zytor.com>

Hi Uros,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master v6.19-rc2 next-20251219]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/x86-boot-replace-FS-GS-inline-asm-with-segment-qualified-accesses/20251224-050410
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20251223202038.91200-2-ubizjak%40gmail.com
patch subject: [PATCH 1/3] x86/boot: replace FS/GS inline asm with segment-qualified accesses
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-121-20251224 (https://download.01.org/0day-ci/archive/20251225/202512250513.AOgurzxD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250513.AOgurzxD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512250513.AOgurzxD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/realmode/rm/wakemain.c: note: in included file:
   arch/x86/boot/boot.h:80:27: sparse: sparse: Expected ) in expression
   arch/x86/boot/boot.h:80:27: sparse: sparse: got u8
   arch/x86/boot/boot.h:80:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:80:48: sparse: sparse: got )
   arch/x86/boot/boot.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:81:1: sparse: sparse: got }
   arch/x86/boot/boot.h:84:49: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:84:49: sparse: sparse: got (
>> arch/x86/boot/boot.h:84:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:84:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:84:49: sparse: sparse: got }
   arch/x86/boot/boot.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:85:1: sparse: sparse: got }
   arch/x86/boot/boot.h:88:49: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:88:49: sparse: sparse: got (
   arch/x86/boot/boot.h:88:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:88:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:88:49: sparse: sparse: got }
   arch/x86/boot/boot.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:89:1: sparse: sparse: got }
   arch/x86/boot/boot.h:93:41: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:93:41: sparse: sparse: got (
   arch/x86/boot/boot.h:93:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:93:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:93:41: sparse: sparse: got }
   arch/x86/boot/boot.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:94:1: sparse: sparse: got }
   arch/x86/boot/boot.h:97:42: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:97:42: sparse: sparse: got (
   arch/x86/boot/boot.h:97:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:97:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:97:42: sparse: sparse: got }
   arch/x86/boot/boot.h:98:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:98:1: sparse: sparse: got }
   arch/x86/boot/boot.h:101:42: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:101:42: sparse: sparse: got (
   arch/x86/boot/boot.h:101:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:101:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:101:42: sparse: sparse: got }
   arch/x86/boot/boot.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:102:1: sparse: sparse: got }
   arch/x86/boot/boot.h:106:48: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:106:48: sparse: sparse: got (
   arch/x86/boot/boot.h:106:48: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:106:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:106:48: sparse: sparse: got }
   arch/x86/boot/boot.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:107:1: sparse: sparse: got }
   arch/x86/boot/boot.h:110:49: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:110:49: sparse: sparse: got (
   arch/x86/boot/boot.h:110:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:110:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:110:49: sparse: sparse: got }
   arch/x86/boot/boot.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:111:1: sparse: sparse: got }
   arch/x86/boot/boot.h:114:49: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:114:49: sparse: sparse: got (
   arch/x86/boot/boot.h:114:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:114:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:114:49: sparse: sparse: got }
   arch/x86/boot/boot.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:115:1: sparse: sparse: got }
   arch/x86/boot/boot.h:119:41: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:119:41: sparse: sparse: got (
   arch/x86/boot/boot.h:119:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:119:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:119:41: sparse: sparse: got }
   arch/x86/boot/boot.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:120:1: sparse: sparse: got }
   arch/x86/boot/boot.h:123:42: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:123:42: sparse: sparse: got (
   arch/x86/boot/boot.h:123:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:123:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:123:42: sparse: sparse: got }
   arch/x86/boot/boot.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:124:1: sparse: sparse: got }
   arch/x86/boot/boot.h:127:42: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:127:42: sparse: sparse: got (
   arch/x86/boot/boot.h:127:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/boot/boot.h:127:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:127:42: sparse: sparse: got }
   arch/x86/boot/boot.h:128:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:128:1: sparse: sparse: got }
>> arch/x86/boot/boot.h:137:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/boot/boot.h:137:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/boot/boot.h:137:16: sparse: sparse: got diff
   arch/x86/boot/boot.h:138:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:138:1: sparse: sparse: got }
   arch/x86/boot/boot.h:145:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/boot/boot.h:145:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/boot/boot.h:145:16: sparse: sparse: got diff
   arch/x86/boot/boot.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:146:1: sparse: sparse: got }
--
   arch/x86/realmode/rm/video-mode.c: note: in included file (through arch/x86/realmode/rm/../../boot/video-mode.c):
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: Expected ) in expression
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: got u8
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: got )
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got (
>> arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: got }
>> arch/x86/realmode/rm/../../boot/boot.h:137:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:145:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:80:18: sparse: sparse: undefined identifier '__seg_fs'
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: undefined identifier '__ptr'
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: undefined identifier '__ptr'
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: cast from unknown type
>> arch/x86/realmode/rm/../../boot/boot.h:80:16: sparse: sparse: cannot dereference this type
--
   arch/x86/realmode/rm/regs.c: note: in included file (through arch/x86/realmode/rm/../../boot/regs.c):
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: Expected ) in expression
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: got u8
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: got )
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got (
>> arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: got }
>> arch/x86/realmode/rm/../../boot/boot.h:137:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:145:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: got }
--
   arch/x86/realmode/rm/video-vga.c: note: in included file (through arch/x86/realmode/rm/../../boot/video-vga.c):
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: Expected ) in expression
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: got u8
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: got )
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got (
>> arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: got }
>> arch/x86/realmode/rm/../../boot/boot.h:137:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:145:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: got }
--
   arch/x86/realmode/rm/video-vesa.c: note: in included file (through arch/x86/realmode/rm/../../boot/video-vesa.c):
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: Expected ) in expression
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: got u8
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: got )
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got (
>> arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: got }
>> arch/x86/realmode/rm/../../boot/boot.h:137:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:145:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: got }
   arch/x86/realmode/rm/video-vesa.c: note: in included file:
   arch/x86/realmode/rm/../../boot/video-vesa.c:54:24: sparse: sparse: undefined identifier 'rdfs16'
--
   arch/x86/realmode/rm/video-bios.c: note: in included file (through arch/x86/realmode/rm/../../boot/video-bios.c):
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: Expected ) in expression
   arch/x86/realmode/rm/../../boot/boot.h:80:27: sparse: sparse: got u8
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: got )
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:81:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got (
>> arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:84:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:85:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:88:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:89:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:93:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:94:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:97:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:98:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:101:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:102:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:106:48: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:107:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:110:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:111:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:114:49: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:115:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:119:41: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:120:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:123:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:124:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ) in function declarator
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got (
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:127:42: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:128:1: sparse: sparse: got }
>> arch/x86/realmode/rm/../../boot/boot.h:137:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:137:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:138:1: sparse: sparse: got }
   arch/x86/realmode/rm/../../boot/boot.h:145:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/realmode/rm/../../boot/boot.h:145:16: sparse: sparse: got diff
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/realmode/rm/../../boot/boot.h:146:1: sparse: sparse: got }
   arch/x86/realmode/rm/video-bios.c: note: in included file:
   arch/x86/realmode/rm/../../boot/video-bios.c:108:25: sparse: sparse: undefined identifier 'rdfs16'
   arch/x86/realmode/rm/video-bios.c: note: in included file (through arch/x86/realmode/rm/../../boot/video-bios.c):
   arch/x86/realmode/rm/../../boot/boot.h:80:18: sparse: sparse: undefined identifier '__seg_fs'
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: undefined identifier '__ptr'
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: undefined identifier '__ptr'
   arch/x86/realmode/rm/../../boot/boot.h:80:48: sparse: sparse: cast from unknown type

vim +/typeof +84 arch/x86/boot/boot.h

62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   77  
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   78  static inline u8 rdfs8(addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   79  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23   80  	return *(__seg_fs u8 *)(__force addr_t)absolute_pointer(addr);
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   81  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   82  static inline u16 rdfs16(addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   83  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  @84  	return *(__seg_fs u16 *)(__force addr_t)absolute_pointer(addr);
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   85  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   86  static inline u32 rdfs32(addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   87  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23   88  	return *(__seg_fs u32 *)(__force addr_t)absolute_pointer(addr);
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   89  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   90  
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   91  static inline void wrfs8(u8 v, addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   92  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23   93  	*(__seg_fs u8 *)(__force addr_t)absolute_pointer(addr) = v;
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   94  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   95  static inline void wrfs16(u16 v, addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   96  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23   97  	*(__seg_fs u16 *)(__force addr_t)absolute_pointer(addr) = v;
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   98  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11   99  static inline void wrfs32(u32 v, addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  100  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  101  	*(__seg_fs u32 *)(__force addr_t)absolute_pointer(addr) = v;
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  102  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  103  
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  104  static inline u8 rdgs8(addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  105  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  106  	return *(__seg_gs u8 *)(__force addr_t)absolute_pointer(addr);
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  107  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  108  static inline u16 rdgs16(addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  109  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  110  	return *(__seg_gs u16 *)(__force addr_t)absolute_pointer(addr);
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  111  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  112  static inline u32 rdgs32(addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  113  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  114  	return *(__seg_gs u32 *)(__force addr_t)absolute_pointer(addr);
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  115  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  116  
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  117  static inline void wrgs8(u8 v, addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  118  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  119  	*(__seg_gs u8 *)(__force addr_t)absolute_pointer(addr) = v;
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  120  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  121  static inline void wrgs16(u16 v, addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  122  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  123  	*(__seg_gs u16 *)(__force addr_t)absolute_pointer(addr) = v;
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  124  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  125  static inline void wrgs32(u32 v, addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  126  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  127  	*(__seg_gs u32 *)(__force addr_t)absolute_pointer(addr) = v;
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  128  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  129  
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  130  /* Note: these only return true/false, not a signed return value! */
117780eef77407 arch/x86/boot/boot.h  H. Peter Anvin 2016-06-08  131  static inline bool memcmp_fs(const void *s1, addr_t s2, size_t len)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  132  {
117780eef77407 arch/x86/boot/boot.h  H. Peter Anvin 2016-06-08  133  	bool diff;
c6c973dbfa5e34 arch/x86/boot/boot.h  Uros Bizjak    2025-09-07  134  	asm volatile("fs repe cmpsb"
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  135  		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  136  		     : : "memory");
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11 @137  	return diff;
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  138  }
117780eef77407 arch/x86/boot/boot.h  H. Peter Anvin 2016-06-08  139  static inline bool memcmp_gs(const void *s1, addr_t s2, size_t len)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  140  {
117780eef77407 arch/x86/boot/boot.h  H. Peter Anvin 2016-06-08  141  	bool diff;
c6c973dbfa5e34 arch/x86/boot/boot.h  Uros Bizjak    2025-09-07  142  	asm volatile("gs repe cmpsb"
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  143  		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  144  		     : : "memory");
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  145  	return diff;
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  146  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  147  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
