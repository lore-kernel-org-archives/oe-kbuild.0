Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754AA18787A
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766644671; cv=none; b=PFRaqA8Z0duw717PV277A3p5IQP42MJQFbvB8Mx6qCyqaCBflXUIjBzc60J8LvLWz3MRY3cq1gsEn0XZtQ1ginqMeRLjMdspAVbl/aBpy4Tt1TvUszkZ0HGhbKQ8NrAME4kZSPTLpudW3q8VPdbRp5qizzku9xy8W8A4mQRJT+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766644671; c=relaxed/simple;
	bh=QtGKtszqtvHHJBsDsu9SOkDqC5XSFXho5QhIyYp6L8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B564YEOjixBMH8x6t93ZW0VpYHWxZCydVQQfp6+SuRtDMpKQo8aaAONITLXVymQGX7LZ/uQwHEz4IlQfh0eK35JA4XMf70WMJAsR2crY9IlApl7IJhkeaqZ4jywRzE2xAusY75VC2MN/JBf2oakBU6x3yXy0GAo68BGV88mK5sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbJkFQV5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbJkFQV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766644668; x=1798180668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QtGKtszqtvHHJBsDsu9SOkDqC5XSFXho5QhIyYp6L8g=;
  b=FbJkFQV5fUKXnc7K47evkyqjhpgf0g8Hy+8lD2z+CZk5YV94VZ5yKxuD
   bysBW+rWcmJynPzckgEVMm/HQucQIaExrUnL2ror38yQuYIp8yrmBpw/q
   Y8HD8v8Yuqm41N13T3zIxgMk2Inq2ITYUnljzxR+kmlqZgcPT4oClVfOm
   d/EJ7rnIaB7AOPtmPv5QYcIlPGe+utPgmWbYpylsvRMW/0J24MWeIWT3e
   zuCUv0C36xwjdFiijuWg1AJCa8QT3Fb6yr2nbfqK8tIIktwB3ytSGFYYB
   iEW7TqpLzyMsNy5wLm3DnDa3VDQTBSMTbRAJmBQJfYa2I7/mBfKFqk/Sx
   Q==;
X-CSE-ConnectionGUID: ovKI5idFRQyIVAPTUE9xGQ==
X-CSE-MsgGUID: pVPv4J3kS+m02jtfAdTo2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68505447"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68505447"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:37:48 -0800
X-CSE-ConnectionGUID: +TWcV9/jQReW0RSxYrRURQ==
X-CSE-MsgGUID: 1JiCsAw+QBujggoSsH9xxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="204669265"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Dec 2025 22:37:48 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYeym-000000003q9-2RiF;
	Thu, 25 Dec 2025 06:37:44 +0000
Date: Thu, 25 Dec 2025 14:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] x86/boot: replace FS/GS inline asm with
 segment-qualified accesses
Message-ID: <202512251407.KKf2uHJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/boot/boot.h:80:16: sparse: sparse: cannot dereference this type"
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
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-121-20251224 (https://download.01.org/0day-ci/archive/20251225/202512251407.KKf2uHJN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251407.KKf2uHJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512251407.KKf2uHJN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/boot/cmdline.c: note: in included file:
   arch/x86/boot/boot.h:80:27: sparse: sparse: Expected ) in expression
   arch/x86/boot/boot.h:80:27: sparse: sparse: got u8
   arch/x86/boot/boot.h:80:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:80:48: sparse: sparse: got )
   arch/x86/boot/boot.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:81:1: sparse: sparse: got }
   arch/x86/boot/boot.h:84:49: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:84:49: sparse: sparse: got (
   arch/x86/boot/boot.h:84:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
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
   arch/x86/boot/boot.h:137:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/boot/boot.h:137:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/boot/boot.h:137:16: sparse: sparse: got diff
   arch/x86/boot/boot.h:138:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:138:1: sparse: sparse: got }
   arch/x86/boot/boot.h:145:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/boot/boot.h:145:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/boot/boot.h:145:16: sparse: sparse: got diff
   arch/x86/boot/boot.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:146:1: sparse: sparse: got }
   arch/x86/boot/boot.h:80:18: sparse: sparse: undefined identifier '__seg_fs'
   arch/x86/boot/boot.h:80:48: sparse: sparse: undefined identifier '__ptr'
   arch/x86/boot/boot.h:80:48: sparse: sparse: undefined identifier '__ptr'
   arch/x86/boot/boot.h:80:48: sparse: sparse: cast from unknown type
>> arch/x86/boot/boot.h:80:16: sparse: sparse: cannot dereference this type
--
   arch/x86/boot/video-mode.c: note: in included file:
   arch/x86/boot/boot.h:80:27: sparse: sparse: Expected ) in expression
   arch/x86/boot/boot.h:80:27: sparse: sparse: got u8
   arch/x86/boot/boot.h:80:48: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:80:48: sparse: sparse: got )
   arch/x86/boot/boot.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:81:1: sparse: sparse: got }
   arch/x86/boot/boot.h:84:49: sparse: sparse: Expected ) in function declarator
   arch/x86/boot/boot.h:84:49: sparse: sparse: got (
   arch/x86/boot/boot.h:84:49: sparse: sparse: Trying to use reserved word 'typeof' as identifier
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
   arch/x86/boot/boot.h:137:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/boot/boot.h:137:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/boot/boot.h:137:16: sparse: sparse: got diff
   arch/x86/boot/boot.h:138:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:138:1: sparse: sparse: got }
   arch/x86/boot/boot.h:145:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/x86/boot/boot.h:145:16: sparse: sparse: Expected ; at end of declaration
   arch/x86/boot/boot.h:145:16: sparse: sparse: got diff
   arch/x86/boot/boot.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   arch/x86/boot/boot.h:146:1: sparse: sparse: got }
   arch/x86/boot/boot.h:80:18: sparse: sparse: undefined identifier '__seg_fs'
   arch/x86/boot/boot.h:80:48: sparse: sparse: undefined identifier '__ptr'
   arch/x86/boot/boot.h:80:48: sparse: sparse: undefined identifier '__ptr'
   arch/x86/boot/boot.h:80:48: sparse: sparse: cast from unknown type
>> arch/x86/boot/boot.h:80:16: sparse: sparse: cannot dereference this type

vim +80 arch/x86/boot/boot.h

62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  77  
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  78  static inline u8 rdfs8(addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  79  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23 @80  	return *(__seg_fs u8 *)(__force addr_t)absolute_pointer(addr);
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  81  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  82  static inline u16 rdfs16(addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  83  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  84  	return *(__seg_fs u16 *)(__force addr_t)absolute_pointer(addr);
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  85  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  86  static inline u32 rdfs32(addr_t addr)
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  87  {
e620b34a0c8be7 arch/x86/boot/boot.h  Uros Bizjak    2025-12-23  88  	return *(__seg_fs u32 *)(__force addr_t)absolute_pointer(addr);
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  89  }
62bd0337d0c4a7 arch/i386/boot/boot.h H. Peter Anvin 2007-07-11  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
