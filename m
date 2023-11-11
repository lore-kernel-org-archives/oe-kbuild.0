Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384411FB3
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3bmpkyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699665418; x=1731201418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6C21rWLVmXF4LN76g5GK1ABd8i+Xe20b9dxocGeOkOY=;
  b=f3bmpkyzuCfilagGD+0ar3vPTlye+E6/4dQAj80m5QczoRnt3UbtMcJD
   1UDvhldGSVbD0+zzyuUl2rn6XjLAttA1JRZOZ1btiaM4MhoKJSoTnGsxK
   gbPb7k69jgeSp5HC4ayF9bKcu6rNt8xIUmJHqljj85RyXsIX8i/ymX+72
   UiIf5mjz3uC5UN8S6Rzr+g9ca7XPsD2EIo24V54SWRdIu5Jvxk3QSsgkO
   qRBLo4CCuhbnwFS8ThYMUIGn5U1hpw3yMYZPfgHOhWTdMKDQ63foZhvls
   Ld12FBnvKsflykWfiOokltXYWoPGVr3OtkU8oJVrauEaAbFwhGziKpC4n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="370451458"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="370451458"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 17:16:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="887464274"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="887464274"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Nov 2023 17:16:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ccH-000A79-1u;
	Sat, 11 Nov 2023 01:16:53 +0000
Date: Sat, 11 Nov 2023 09:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:sframe 10/10] kernel/unwind/sframe.c:94:15: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202311110900.lQTbNjdT-lkp@intel.com>
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
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   ec004e900e02c9c85cf8c89d4c26d4168a6c5d18
commit: ec004e900e02c9c85cf8c89d4c26d4168a6c5d18 [10/10] unwind/x86/64: Add HAVE_USER_UNWIND_SFRAME
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-121-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110900.lQTbNjdT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110900.lQTbNjdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311110900.lQTbNjdT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/unwind/sframe.c:94:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sframe_fde [noderef] __user *first @@     got void * @@
   kernel/unwind/sframe.c:94:15: sparse:     expected struct sframe_fde [noderef] __user *first
   kernel/unwind/sframe.c:94:15: sparse:     got void *
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got signed int [usertype] * @@
   kernel/unwind/sframe.c:98:21: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:98:21: sparse:     got signed int [usertype] *
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:134:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *f @@     got void * @@
   kernel/unwind/sframe.c:134:11: sparse:     expected void [noderef] __user *f
   kernel/unwind/sframe.c:134:11: sparse:     got void *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:138:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned char [usertype] * @@
   kernel/unwind/sframe.c:138:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:138:17: sparse:     got unsigned char [usertype] *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:138:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] * @@
   kernel/unwind/sframe.c:138:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:138:17: sparse:     got unsigned short [usertype] *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:138:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] * @@
   kernel/unwind/sframe.c:138:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:138:17: sparse:     got unsigned int [usertype] *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned char [usertype] * @@
   kernel/unwind/sframe.c:151:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:151:17: sparse:     got unsigned char [usertype] *
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] * @@
   kernel/unwind/sframe.c:151:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:151:17: sparse:     got unsigned short [usertype] *
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] * @@
   kernel/unwind/sframe.c:151:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:151:17: sparse:     got unsigned int [usertype] *
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:151:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned char [usertype] * @@
   kernel/unwind/sframe.c:168:9: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:168:9: sparse:     got unsigned char [usertype] *
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] * @@
   kernel/unwind/sframe.c:168:9: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:168:9: sparse:     got unsigned short [usertype] *
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] * @@
   kernel/unwind/sframe.c:168:9: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:168:9: sparse:     got unsigned int [usertype] *
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:168:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:175:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got signed char [usertype] * @@
   kernel/unwind/sframe.c:175:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:175:17: sparse:     got signed char [usertype] *
   kernel/unwind/sframe.c:175:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:175:17: sparse: sparse: too many warnings

vim +94 kernel/unwind/sframe.c

09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   85  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   86  static int find_fde(struct sframe_section *sec, unsigned long ip,
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   87  		    struct sframe_fde *fde)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   88  {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   89  	s32 func_off, ip_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   90  	struct sframe_fde __user *first, *last, *mid, *found;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   91  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   92  	ip_off = ip - sec->sframe_addr;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   93  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  @94  	first = (void *)sec->fdes_addr;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   95  	last = first + sec->fdes_num;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   96  	while (first <= last) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   97  		mid = first + ((last - first) / 2);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  @98  		if (get_user(func_off, (s32 *)mid))
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08   99  			return -EFAULT;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  100  		if (ip_off >= func_off) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  101  			found = mid;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  102  			first = mid + 1;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  103  		} else
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  104  			last = mid - 1;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  105  	}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  106  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  107  	if (!found)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  108  		return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  109  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  110  	if (copy_from_user(fde, found, sizeof(*fde)))
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  111  		return -EFAULT;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  112  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  113  	return 0;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  114  }
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  115  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  116  static int find_fre(struct sframe_section *sec, struct sframe_fde *fde,
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  117  		    unsigned long ip, struct user_unwind_frame *frame)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  118  {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  119  	unsigned char fde_type = SFRAME_FUNC_FDE_TYPE(fde->info);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  120  	unsigned char fre_type = SFRAME_FUNC_FRE_TYPE(fde->info);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  121  	s32 fre_ip_off, cfa_off, ra_off, fp_off, ip_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  122  	unsigned char offset_count, offset_size;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  123  	unsigned char addr_size;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  124  	void __user *f, *last_f;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  125  	u8 fre_info;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  126  	int i;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  127  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  128  	addr_size = fre_type_to_size(fre_type);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  129  	if (!addr_size)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  130  		return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  131  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  132  	ip_off = ip - sec->sframe_addr - fde->start_addr;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  133  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08 @134  	f = (void *)sec->fres_addr + fde->fres_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  135  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  136  	for (i = 0; i < fde->fres_num; i++) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  137  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08 @138  		SFRAME_GET_USER_UNSIGNED(fre_ip_off, f, addr_size);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  139  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  140  		if (fde_type == SFRAME_FDE_TYPE_PCINC) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  141  			if (fre_ip_off > ip_off)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  142  				break;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  143  		} else {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  144  			/* SFRAME_FDE_TYPE_PCMASK */
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  145  #if 0 /* sframe v2 */
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  146  			if (ip_off % fde->rep_size < fre_ip_off)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  147  				break;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  148  #endif
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  149  		}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  150  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  151  		SFRAME_GET_USER_UNSIGNED(fre_info, f, 1);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  152  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  153  		offset_count = SFRAME_FRE_OFFSET_COUNT(fre_info);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  154  		offset_size  = offset_size_enum_to_size(SFRAME_FRE_OFFSET_SIZE(fre_info));
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  155  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  156  		if (!offset_count || !offset_size)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  157  			return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  158  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  159  		last_f = f;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  160  		f += offset_count * offset_size;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  161  	}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  162  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  163  	if (!last_f)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  164  		return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  165  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  166  	f = last_f;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  167  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  168  	SFRAME_GET_USER_UNSIGNED(cfa_off, f, offset_size);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  169  	offset_count--;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  170  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  171  	ra_off = sec->ra_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  172  	if (!ra_off) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  173  		if (!offset_count--)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  174  			return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08 @175  		SFRAME_GET_USER_SIGNED(ra_off, f, offset_size);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  176  	}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  177  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  178  	fp_off = sec->fp_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  179  	if (!fp_off && offset_count) {
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  180  		offset_count--;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  181  		SFRAME_GET_USER_SIGNED(fp_off, f, offset_size);
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  182  	}
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  183  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  184  	if (offset_count)
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  185  		return -EINVAL;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  186  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  187  	frame->cfa_off = cfa_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  188  	frame->ra_off = ra_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  189  	frame->fp_off = fp_off;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  190  	frame->use_fp = SFRAME_FRE_CFA_BASE_REG_ID(fre_info) == SFRAME_BASE_REG_FP;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  191  
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  192  	return 0;
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  193  }
09460e60dd1c2f8 Josh Poimboeuf 2023-11-08  194  

:::::: The code at line 94 was first introduced by commit
:::::: 09460e60dd1c2f8ea1abb8d9188195db699ce76f unwind: Introduce SFrame user space unwinding

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
