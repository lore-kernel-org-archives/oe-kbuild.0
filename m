Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609472080C8
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758867574; cv=none; b=sHctXjWHIGnQZ37PUuui4Et5HEhLYhbVdmzMZ0lrm8be37fCBvXuVnTm/LGEv19cLSsvGTkJ71USLI+0Z33aYpLk2sh/eo5GCJ59UVmlViX7BK547RJHJEmyZq2fVcR18wHqjMQsZD5/794l9EmVC/TDlJexFtg4/I1ZLQ9yeys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758867574; c=relaxed/simple;
	bh=decxxmUL2scu8LkTMKRX84182o6oblyQvN5h/NMp2Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqnStAMag9svTb6+5Ew0eSjqV/Khl0hh35N//qR52XYwBxf3zFXbaNjLKWd7lS5mi20mwWKOfMqXFoeBLw1ZmYGk+TAFi4i0g59eHSuA3PACrOYXWH7+eFUkhsh9LxjfjawNYasGd3f+bMr5qgXFVlAS7PLS0zUNdZ1cl+QHiTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZni7fhh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZni7fhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758867572; x=1790403572;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=decxxmUL2scu8LkTMKRX84182o6oblyQvN5h/NMp2Lw=;
  b=BZni7fhho3zgC720MoU+gcgst7Xm4wve3hSLGYPk1Syo97gC0bIv2oTg
   OOstW3m6tK2+SX/zdGVh5wgna/4CFGTnhEgOVMvhj/KczsxHHNuf+o5Tv
   liWybiDEcy2iUL8dIpOsXuzb8gNUJ7OeJu7RW8W5cMhuhMQ5kU6t+/gLp
   xQy5QnlGNHMjM/rZnN90Dh67z9glLiWrlc5lSEtmhP5iDM2hZv/pJ8irv
   kl4QbLwzEM6dDSF3cA+I4lIAwfVdktjokDlWdGMhPgEkaZtwcR0OLtHHY
   XHfHRPNdUT/m4uCdrkMWaTk2fUpOslAV2b3m7Pld3xEJRcfQqe/thEQGe
   A==;
X-CSE-ConnectionGUID: kX7blDtAQ6isAL8BHqcZHw==
X-CSE-MsgGUID: pyXwZMboR12IOgxbNpJBiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61246093"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="61246093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 23:19:32 -0700
X-CSE-ConnectionGUID: 6G61TWgNSL25Ty0UsMvb0g==
X-CSE-MsgGUID: hg3S0Rx0SGyCPO7ZfL381g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="176805854"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2025 23:19:30 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v21nj-0005y1-30;
	Fri, 26 Sep 2025 06:19:27 +0000
Date: Fri, 26 Sep 2025 14:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 09/12] um: use nolibc for the --showconfig
 implementation
Message-ID: <202509261452.g5peaXCc-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250924142059.527768-10-benjamin@sipsolutions.net>
References: <20250924142059.527768-10-benjamin@sipsolutions.net>
TO: Benjamin Berg <benjamin@sipsolutions.net>
TO: linux-um@lists.infradead.org
TO: Willy Tarreau <w@1wt.eu>
TO: "Thomas Weiﬂschuh" <linux@weissschuh.net>
TO: linux-kselftest@vger.kernel.org
TO: Arnaldo Carvalho de Melo <acme@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: Benjamin Berg <benjamin.berg@intel.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on uml/next]
[also build test WARNING on uml/fixes shuah-kselftest/next shuah-kselftest/fixes linus/master v6.17-rc7 next-20250925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Berg/tools-compiler-h-fix-__used-definition/20250924-222547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20250924142059.527768-10-benjamin%40sipsolutions.net
patch subject: [PATCH v3 09/12] um: use nolibc for the --showconfig implementation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-r111-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261452.g5peaXCc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261452.g5peaXCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509261452.g5peaXCc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file (through tools/include/nolibc/nolibc.h, tools/include/nolibc/stddef.h, arch/um/include/shared/user.h, builtin):
>> tools/include/nolibc/sys.h:109:29: sparse: sparse: Using plain integer as NULL pointer
   command-line: note: in included file (through tools/include/nolibc/nolibc.h, tools/include/nolibc/stddef.h, arch/um/include/shared/user.h, builtin):
>> tools/include/nolibc/sys/reboot.h:31:16: sparse: sparse: Using plain integer as NULL pointer
>> tools/include/nolibc/sys/reboot.h:31:16: sparse: sparse: Using plain integer as NULL pointer
   command-line: note: in included file (through tools/include/nolibc/nolibc.h, tools/include/nolibc/stddef.h, arch/um/include/shared/user.h, builtin):
>> tools/include/nolibc/unistd.h:57:27: sparse: sparse: Using plain integer as NULL pointer
   tools/include/nolibc/unistd.h:57:30: sparse: sparse: Using plain integer as NULL pointer
   tools/include/nolibc/unistd.h:57:33: sparse: sparse: Using plain integer as NULL pointer
   tools/include/nolibc/unistd.h:70:27: sparse: sparse: Using plain integer as NULL pointer
   tools/include/nolibc/unistd.h:70:30: sparse: sparse: Using plain integer as NULL pointer
   tools/include/nolibc/unistd.h:70:33: sparse: sparse: Using plain integer as NULL pointer
   tools/include/nolibc/unistd.h:81:30: sparse: sparse: Using plain integer as NULL pointer
   tools/include/nolibc/unistd.h:81:33: sparse: sparse: Using plain integer as NULL pointer
   tools/include/nolibc/unistd.h:81:36: sparse: sparse: Using plain integer as NULL pointer
   command-line: note: in included file (through tools/include/nolibc/stdio.h, tools/include/nolibc/nolibc.h, tools/include/nolibc/stddef.h, ...):
   tools/include/nolibc/stdlib.h:56:6: sparse: sparse: symbol 'abort' redeclared with different type (different modifiers):
   tools/include/nolibc/stdlib.h:56:6: sparse:    void extern [addressable] [noreturn] [toplevel] [unused] abort( ... )
   tools/include/nolibc/stdlib.h:54:6: sparse: note: previously declared as:
   tools/include/nolibc/stdlib.h:54:6: sparse:    void extern [addressable] [toplevel] abort( ... )
   command-line: note: in included file (through tools/include/nolibc/nolibc.h, tools/include/nolibc/stddef.h, arch/um/include/shared/user.h, builtin):
   tools/include/nolibc/getopt.h:19:6: sparse: sparse: symbol 'optarg' was not declared. Should it be static?
   tools/include/nolibc/getopt.h:22:5: sparse: sparse: symbol 'optind' was not declared. Should it be static?
   tools/include/nolibc/getopt.h:22:17: sparse: sparse: symbol 'opterr' was not declared. Should it be static?
   tools/include/nolibc/getopt.h:22:29: sparse: sparse: symbol 'optopt' was not declared. Should it be static?
>> tools/include/nolibc/getopt.h:81:26: sparse: sparse: Using plain integer as NULL pointer

vim +109 tools/include/nolibc/sys.h

bd8c8fbb866fe5 Willy Tarreau 2022-02-07  104  
bd8c8fbb866fe5 Willy Tarreau 2022-02-07  105  static __attribute__((unused))
bd8c8fbb866fe5 Willy Tarreau 2022-02-07  106  void *sbrk(intptr_t inc)
bd8c8fbb866fe5 Willy Tarreau 2022-02-07  107  {
bd8c8fbb866fe5 Willy Tarreau 2022-02-07  108  	/* first call to find current end */
4201cfce15fe35 Zhangjin Wu   2023-07-07 @109  	void *ret = sys_brk(0);
4201cfce15fe35 Zhangjin Wu   2023-07-07  110  
4201cfce15fe35 Zhangjin Wu   2023-07-07  111  	if (ret && sys_brk(ret + inc) == ret + inc)
bd8c8fbb866fe5 Willy Tarreau 2022-02-07  112  		return ret + inc;
bd8c8fbb866fe5 Willy Tarreau 2022-02-07  113  
fb01ff635efd0a Willy Tarreau 2023-08-15  114  	SET_ERRNO(ENOMEM);
fb01ff635efd0a Willy Tarreau 2023-08-15  115  	return (void *)-1;
bd8c8fbb866fe5 Willy Tarreau 2022-02-07  116  }
bd8c8fbb866fe5 Willy Tarreau 2022-02-07  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
