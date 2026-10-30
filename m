Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349516;
	b=T/fs4NHm5ykTJexRi6dGykXP3AzevySn/ymgFvm/bR/jDanFMVncmqCnMz4LzPzoun8L
	 CfeHFYVorOVdlpvhkRWdVnGrDN6puHln2xSe9AReToy98WDnW77pnhbGNPA9gsEcA6Iu4
	 RRgTifkdUrsilOdkF8cXcg0WqWJXf3qO8YvfjYe7RHfl5pnZlxBWDrVTTKFJwwa5SWUIC
	 9MIL7+/LYBtYTQkCoYO4P68ldEmdPs6P71HnB/PqGLhIvrJrpBnQtkF9jmIIKZqU1r9Vj
	 crFbJ8qba4GrscqrIn1AhHNukGcNZnQ/U8Q7JA21tiJp1ppD4366DNMORCCFOz1ig5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349516;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xPQstFzJg0XEQkQrdM05sYEz7NjQRtsxZnHbTXwBcbQ=;
	b=hwO4is1Bbd1CAlT65zwoBEW7aFthiNKf4g1dXIQrJ0xSHXSgpxUPDV2c0DQORhhju37i
	 MfyAghwEqK/Y11xIilxvSwtl8G3qgSQPNu5GteewEzcemLgNo9T4Tis25nmc1UGQkLk5r
	 mI2hCc/nmgodn8TQAif9cd8eEdkrfUvi5bhxGbPYkmShtHHGPWtsZD2PxFGIHfga9AV+A
	 DM9FlR9VL2mAWlQ2ctIYKC7vFI24Y7OFilvfsk3InAFb5jRUtFntg7Xt8o6vs7DU2dBld
	 /CsCT7eQnfVODd89YBLWy1OKbYIaYky6Vw2F6Sq/rBRUTMfoMm2cXi/GWMcIPeZ6u/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7Y2a6dl;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC6D606A33C
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Oct 2026 08:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC6D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7Y2a6dl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793349514; x=1824885514;
  h=date:from:to:cc:subject:message-id;
  bh=iWjmozEGsJTGdAhr0OlctfQIxzeG6OaFwPKZhi23J40=;
  b=I7Y2a6dlgUdrFllZYdAxCxTwv8bv5rdH1L5G703BD1YUltMf8tFkgWmP
   DN/lubZp3mnuCUM58DcuoIAlmlEteIJ5tPnNFjMi6j8yp2cwq6OrD+vJ1
   YRQm0qetI7YcxItwIyQZrPu40cfo2aCjISpzmRoXTh8cjMlsIItZuLEJO
   xlnSOB9h3AXoHTgfFbzEDH+VlEaeVZ83PwP7AGT6pHGnhNAJKB3q5RA+Z
   zVWIaO7oZPpcPaZO8TNMxK9bXD2hcCg4MSWE1Auu9xVPWahYJhwxdjm0k
   9FklEiPErMaKFzYQXhD/ZEW5fz+LaNP6ogCloJwdIAQfRRFCYQLcybCGw
   w==;
X-CSE-ConnectionGUID: l/GZjdEfQaC6X8+IJd/n4Q==
X-CSE-MsgGUID: JaPn7mgOTf2OcoG2nnvRig==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1994621"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1994621"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:38:33 -0700
X-CSE-ConnectionGUID: wwRcjRPiQD+4qlglwCzCeQ==
X-CSE-MsgGUID: 7fVQF17VSNqV1Yl1hkOTbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5263119"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2026 01:38:33 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMi86-000000005X1-0jfl;
	Fri, 30 Oct 2026 08:38:30 +0000
Date: Fri, 30 Oct 2026 09:38:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 20727/21094]
 include/linux/cpumask.h:1381:46: sparse: sparse: cannot dereference this type
Message-ID: <202610300927.kz9UOuZb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/cpumask.h:1381:46: sparse: sparse: cannot dereference this type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hungyu Lin <dennylin0707@gmail.com>
CC: Yury Norov <ynorov@nvidia.com>
CC: Tobias Klauser <tklauser@distanz.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39c950806213f6861d00f90729acaaa21f2d95a
commit: 4c9c30534d06fea3070e57b868f8b7755950824c [20727/21094] cpumask: Preserve short reads in cpumap printing helpers
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r2304-20261030 (https://download.01.org/0day-ci/archive/20261030/202610300927.kz9UOuZb-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300927.kz9UOuZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610300927.kz9UOuZb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:188:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:188:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:540:13: sparse: sparse: undefined identifier 'bitmap_weight'
   include/linux/bitmap.h:252:17: sparse: sparse: undefined identifier 'fortify_memset_chk'
   include/linux/bitmap.h:654:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:654:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:245:29: sparse: note: previously declared as:
   include/linux/bitmap.h:245:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:656:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:652:22: sparse: note: previously declared as:
   include/linux/bitmap.h:652:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:656:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:709:22: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:709:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:711:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:711:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:245:29: sparse: note: previously declared as:
   include/linux/bitmap.h:245:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:713:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:709:22: sparse: note: previously declared as:
   include/linux/bitmap.h:709:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:713:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: note: previously declared as:
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: note: previously declared as:
   include/linux/bitmap.h:713:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:773:57: sparse: sparse: symbol 'pos' has multiple initializers (originally initialized at include/linux/list.h:1264)
   include/linux/bitmap.h:852:21: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:852:25: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:852:9: sparse: sparse: symbol 'value_low' redeclared with different type (different type sizes):
   include/linux/bitmap.h:852:9: sparse:    int [addressable] [toplevel] value_low
   include/linux/bitmap.h:844:23: sparse: note: previously declared as:
   include/linux/bitmap.h:844:23: sparse:    unsigned long [addressable] [toplevel] value_low
   include/linux/bitmap.h:853:22: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:853:26: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:853:39: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:853:9: sparse: sparse: symbol 'value_high' redeclared with different type (different type sizes):
   include/linux/bitmap.h:853:9: sparse:    int [addressable] [toplevel] value_high
   include/linux/bitmap.h:844:34: sparse: note: previously declared as:
   include/linux/bitmap.h:844:34: sparse:    unsigned long [addressable] [toplevel] value_high
   include/linux/bitmap.h:880:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:880:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:885:16: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:885:9: sparse: sparse: symbol 'mask' redeclared with different type (different type sizes):
   include/linux/bitmap.h:885:9: sparse:    int [addressable] [toplevel] mask
   include/linux/bitmap.h:879:23: sparse: note: previously declared as:
   include/linux/bitmap.h:879:23: sparse:    unsigned long [addressable] [toplevel] mask
   include/linux/bitmap.h:887:9: sparse: sparse: symbol 'offset' redeclared with different type (different type sizes):
   include/linux/bitmap.h:887:9: sparse:    int [addressable] [toplevel] offset
   include/linux/bitmap.h:877:23: sparse: note: previously declared as:
   include/linux/bitmap.h:877:23: sparse:    unsigned long [addressable] [toplevel] offset
   include/linux/bitmap.h:888:9: sparse: sparse: symbol 'space' redeclared with different type (different type sizes):
   include/linux/bitmap.h:888:9: sparse:    int [addressable] [toplevel] space
   include/linux/bitmap.h:878:23: sparse: note: previously declared as:
   include/linux/bitmap.h:878:23: sparse:    unsigned long [addressable] [toplevel] space
   include/linux/bitmap.h:889:24: sparse: sparse: undefined identifier 'nbits'
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/nodemask.h, include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, ...):
   include/linux/random.h:120:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/random.h:120:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, ...):
   include/linux/nodemask.h:261:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:261:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:267:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:267:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:287:9: sparse: sparse: symbol '__node_set' redeclared with different type (different argument counts):
   include/linux/nodemask.h:287:9: sparse:    int static [signed] [toplevel] __node_set( ... )
   include/linux/nodemask.h:133:29: sparse: note: previously declared as:
   include/linux/nodemask.h:133:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] __node_set( ... )
   include/linux/nodemask.h:304:16: sparse: sparse: undefined identifier 'maskp'
   include/linux/nodemask.h:304:16: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
>> include/linux/cpumask.h:1381:46: sparse: sparse: cannot dereference this type
   include/linux/cpumask.h:1409:43: sparse: sparse: cannot dereference this type
   include/linux/cpumask.h:1409:9: sparse: sparse: symbol 'n' has multiple initializers (originally initialized at include/linux/cpumask.h:1381)
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:18:26: sparse: sparse: symbol 'entry' redeclared with different type (different base types):
   include/linux/workqueue_types.h:18:26: sparse:    struct list_head [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/list.h:567:9: sparse: note: previously declared as:
   include/linux/list.h:567:9: sparse:    int [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse: sparse: symbol 'p' redeclared with different type (different type sizes):
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:181:23: sparse: note: previously declared as:
   arch/powerpc/include/asm/bitops.h:181:23: sparse:    unsigned long *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:77:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec2.c:78:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:78:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:78:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:79:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:79:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:79:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec2.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec2.c:83:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/altivec2.c:83:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec2.c:83:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:86:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec2.c:86:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:87:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:88:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:89:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec2.c:90:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec2.c:91:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec2.c:92:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec2.c:93:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec2.c:93:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:89)
   lib/raid/raid6/powerpc/altivec2.c:94:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec2.c:94:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:90)
   lib/raid/raid6/powerpc/altivec2.c:95:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:95:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:91)
   lib/raid/raid6/powerpc/altivec2.c:96:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:96:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:92)
   lib/raid/raid6/powerpc/altivec2.c:97:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:98:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:98:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:83)
   lib/raid/raid6/powerpc/altivec2.c:101:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:101:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:102:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:102:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:103:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:103:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:114:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:114:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] disable_kernel_altivec( ... )
--
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:188:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:188:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:540:13: sparse: sparse: undefined identifier 'bitmap_weight'
   include/linux/bitmap.h:252:17: sparse: sparse: undefined identifier 'fortify_memset_chk'
   include/linux/bitmap.h:654:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:654:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:245:29: sparse: note: previously declared as:
   include/linux/bitmap.h:245:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:656:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:652:22: sparse: note: previously declared as:
   include/linux/bitmap.h:652:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:656:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:709:22: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:709:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:711:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:711:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:245:29: sparse: note: previously declared as:
   include/linux/bitmap.h:245:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:713:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:709:22: sparse: note: previously declared as:
   include/linux/bitmap.h:709:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:713:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: note: previously declared as:
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: note: previously declared as:
   include/linux/bitmap.h:713:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:773:57: sparse: sparse: symbol 'pos' has multiple initializers (originally initialized at include/linux/list.h:1264)
   include/linux/bitmap.h:852:21: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:852:25: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:852:9: sparse: sparse: symbol 'value_low' redeclared with different type (different type sizes):
   include/linux/bitmap.h:852:9: sparse:    int [addressable] [toplevel] value_low
   include/linux/bitmap.h:844:23: sparse: note: previously declared as:
   include/linux/bitmap.h:844:23: sparse:    unsigned long [addressable] [toplevel] value_low
   include/linux/bitmap.h:853:22: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:853:26: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:853:39: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:853:9: sparse: sparse: symbol 'value_high' redeclared with different type (different type sizes):
   include/linux/bitmap.h:853:9: sparse:    int [addressable] [toplevel] value_high
   include/linux/bitmap.h:844:34: sparse: note: previously declared as:
   include/linux/bitmap.h:844:34: sparse:    unsigned long [addressable] [toplevel] value_high
   include/linux/bitmap.h:880:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:880:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:885:16: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:885:9: sparse: sparse: symbol 'mask' redeclared with different type (different type sizes):
   include/linux/bitmap.h:885:9: sparse:    int [addressable] [toplevel] mask
   include/linux/bitmap.h:879:23: sparse: note: previously declared as:
   include/linux/bitmap.h:879:23: sparse:    unsigned long [addressable] [toplevel] mask
   include/linux/bitmap.h:887:9: sparse: sparse: symbol 'offset' redeclared with different type (different type sizes):
   include/linux/bitmap.h:887:9: sparse:    int [addressable] [toplevel] offset
   include/linux/bitmap.h:877:23: sparse: note: previously declared as:
   include/linux/bitmap.h:877:23: sparse:    unsigned long [addressable] [toplevel] offset
   include/linux/bitmap.h:888:9: sparse: sparse: symbol 'space' redeclared with different type (different type sizes):
   include/linux/bitmap.h:888:9: sparse:    int [addressable] [toplevel] space
   include/linux/bitmap.h:878:23: sparse: note: previously declared as:
   include/linux/bitmap.h:878:23: sparse:    unsigned long [addressable] [toplevel] space
   include/linux/bitmap.h:889:24: sparse: sparse: undefined identifier 'nbits'
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/nodemask.h, include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, ...):
   include/linux/random.h:120:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/random.h:120:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, ...):
   include/linux/nodemask.h:261:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:261:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:267:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:267:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:287:9: sparse: sparse: symbol '__node_set' redeclared with different type (different argument counts):
   include/linux/nodemask.h:287:9: sparse:    int static [signed] [toplevel] __node_set( ... )
   include/linux/nodemask.h:133:29: sparse: note: previously declared as:
   include/linux/nodemask.h:133:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] __node_set( ... )
   include/linux/nodemask.h:304:16: sparse: sparse: undefined identifier 'maskp'
   include/linux/nodemask.h:304:16: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
>> include/linux/cpumask.h:1381:46: sparse: sparse: cannot dereference this type
   include/linux/cpumask.h:1409:43: sparse: sparse: cannot dereference this type
   include/linux/cpumask.h:1409:9: sparse: sparse: symbol 'n' has multiple initializers (originally initialized at include/linux/cpumask.h:1381)
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:18:26: sparse: sparse: symbol 'entry' redeclared with different type (different base types):
   include/linux/workqueue_types.h:18:26: sparse:    struct list_head [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/list.h:567:9: sparse: note: previously declared as:
   include/linux/list.h:567:9: sparse:    int [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse: sparse: symbol 'p' redeclared with different type (different type sizes):
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:181:23: sparse: note: previously declared as:
   arch/powerpc/include/asm/bitops.h:181:23: sparse:    unsigned long *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:79:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec4.c:80:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:80:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:80:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:81:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:81:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:81:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec4.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec4.c:85:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/altivec4.c:85:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:85:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:86:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/altivec4.c:86:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:86:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:87:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/altivec4.c:87:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:87:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:90:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:90:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:91:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:91:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:92:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:92:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:93:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:94:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:95:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:96:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:97:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:98:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:99:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:100:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:101:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:102:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:103:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:104:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:105:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec4.c:105:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:97)
   lib/raid/raid6/powerpc/altivec4.c:106:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec4.c:106:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:98)
   lib/raid/raid6/powerpc/altivec4.c:107:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec4.c:107:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:99)
   lib/raid/raid6/powerpc/altivec4.c:108:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec4.c:108:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:100)
   lib/raid/raid6/powerpc/altivec4.c:109:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:109:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:101)
   lib/raid/raid6/powerpc/altivec4.c:110:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:110:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:102)
   lib/raid/raid6/powerpc/altivec4.c:111:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:111:25: sparse: sparse: symbol 'w12' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:103)
   lib/raid/raid6/powerpc/altivec4.c:112:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:112:25: sparse: sparse: symbol 'w13' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:104)
   lib/raid/raid6/powerpc/altivec4.c:113:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:114:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:114:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:85)
   lib/raid/raid6/powerpc/altivec4.c:115:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:115:25: sparse: sparse: symbol 'wq2' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:86)
   lib/raid/raid6/powerpc/altivec4.c:116:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:116:25: sparse: sparse: symbol 'wq3' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:87)
   lib/raid/raid6/powerpc/altivec4.c:119:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:119:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:120:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:120:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:121:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:121:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:122:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:122:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:123:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:123:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:124:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:124:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:125:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:125:17: sparse:    incomplete type *static [toplevel] unative_t
--
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:188:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:188:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:540:13: sparse: sparse: undefined identifier 'bitmap_weight'
   include/linux/bitmap.h:252:17: sparse: sparse: undefined identifier 'fortify_memset_chk'
   include/linux/bitmap.h:654:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:654:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:245:29: sparse: note: previously declared as:
   include/linux/bitmap.h:245:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:656:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:652:22: sparse: note: previously declared as:
   include/linux/bitmap.h:652:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:656:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:709:22: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:709:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:711:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:711:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:245:29: sparse: note: previously declared as:
   include/linux/bitmap.h:245:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:713:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:709:22: sparse: note: previously declared as:
   include/linux/bitmap.h:709:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:713:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: note: previously declared as:
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: note: previously declared as:
   include/linux/bitmap.h:713:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:773:57: sparse: sparse: symbol 'pos' has multiple initializers (originally initialized at include/linux/list.h:1264)
   include/linux/bitmap.h:852:21: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:852:25: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:852:9: sparse: sparse: symbol 'value_low' redeclared with different type (different type sizes):
   include/linux/bitmap.h:852:9: sparse:    int [addressable] [toplevel] value_low
   include/linux/bitmap.h:844:23: sparse: note: previously declared as:
   include/linux/bitmap.h:844:23: sparse:    unsigned long [addressable] [toplevel] value_low
   include/linux/bitmap.h:853:22: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:853:26: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:853:39: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:853:9: sparse: sparse: symbol 'value_high' redeclared with different type (different type sizes):
   include/linux/bitmap.h:853:9: sparse:    int [addressable] [toplevel] value_high
   include/linux/bitmap.h:844:34: sparse: note: previously declared as:
   include/linux/bitmap.h:844:34: sparse:    unsigned long [addressable] [toplevel] value_high
   include/linux/bitmap.h:880:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:880:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:885:16: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:885:9: sparse: sparse: symbol 'mask' redeclared with different type (different type sizes):
   include/linux/bitmap.h:885:9: sparse:    int [addressable] [toplevel] mask
   include/linux/bitmap.h:879:23: sparse: note: previously declared as:
   include/linux/bitmap.h:879:23: sparse:    unsigned long [addressable] [toplevel] mask
   include/linux/bitmap.h:887:9: sparse: sparse: symbol 'offset' redeclared with different type (different type sizes):
   include/linux/bitmap.h:887:9: sparse:    int [addressable] [toplevel] offset
   include/linux/bitmap.h:877:23: sparse: note: previously declared as:
   include/linux/bitmap.h:877:23: sparse:    unsigned long [addressable] [toplevel] offset
   include/linux/bitmap.h:888:9: sparse: sparse: symbol 'space' redeclared with different type (different type sizes):
   include/linux/bitmap.h:888:9: sparse:    int [addressable] [toplevel] space
   include/linux/bitmap.h:878:23: sparse: note: previously declared as:
   include/linux/bitmap.h:878:23: sparse:    unsigned long [addressable] [toplevel] space
   include/linux/bitmap.h:889:24: sparse: sparse: undefined identifier 'nbits'
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/nodemask.h, include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, ...):
   include/linux/random.h:120:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/random.h:120:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, ...):
   include/linux/nodemask.h:261:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:261:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:267:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:267:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:287:9: sparse: sparse: symbol '__node_set' redeclared with different type (different argument counts):
   include/linux/nodemask.h:287:9: sparse:    int static [signed] [toplevel] __node_set( ... )
   include/linux/nodemask.h:133:29: sparse: note: previously declared as:
   include/linux/nodemask.h:133:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] __node_set( ... )
   include/linux/nodemask.h:304:16: sparse: sparse: undefined identifier 'maskp'
   include/linux/nodemask.h:304:16: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
>> include/linux/cpumask.h:1381:46: sparse: sparse: cannot dereference this type
   include/linux/cpumask.h:1409:43: sparse: sparse: cannot dereference this type
   include/linux/cpumask.h:1409:9: sparse: sparse: symbol 'n' has multiple initializers (originally initialized at include/linux/cpumask.h:1381)
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:18:26: sparse: sparse: symbol 'entry' redeclared with different type (different base types):
   include/linux/workqueue_types.h:18:26: sparse:    struct list_head [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/list.h:567:9: sparse: note: previously declared as:
   include/linux/list.h:567:9: sparse:    int [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse: sparse: symbol 'p' redeclared with different type (different type sizes):
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:181:23: sparse: note: previously declared as:
   arch/powerpc/include/asm/bitops.h:181:23: sparse:    unsigned long *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c:76:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec1.c:77:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec1.c:77:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:77:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c:78:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec1.c:78:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:78:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec1.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec1.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec1.c:84:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec1.c:85:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec1.c:86:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec1.c:87:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec1.c:87:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec1.c:85)
   lib/raid/raid6/powerpc/altivec1.c:88:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec1.c:88:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec1.c:86)
   lib/raid/raid6/powerpc/altivec1.c:89:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec1.c:92:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:92:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec1.c:74:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec1.c:74:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec1.c:103:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:103:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] disable_kernel_altivec( ... )
--
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:188:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:188:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:540:13: sparse: sparse: undefined identifier 'bitmap_weight'
   include/linux/bitmap.h:252:17: sparse: sparse: undefined identifier 'fortify_memset_chk'
   include/linux/bitmap.h:654:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:654:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:245:29: sparse: note: previously declared as:
   include/linux/bitmap.h:245:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:656:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:652:22: sparse: note: previously declared as:
   include/linux/bitmap.h:652:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:656:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:709:22: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:709:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:656:9: sparse: note: previously declared as:
   include/linux/bitmap.h:656:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:711:9: sparse: sparse: symbol 'bitmap_zero' redeclared with different type (incompatible argument 1 (different base types)):
   include/linux/bitmap.h:711:9: sparse:    int static [signed] [toplevel] bitmap_zero( ... )
   include/linux/bitmap.h:245:29: sparse: note: previously declared as:
   include/linux/bitmap.h:245:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] bitmap_zero( ... )
   include/linux/bitmap.h:713:9: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different signedness):
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:709:22: sparse: note: previously declared as:
   include/linux/bitmap.h:709:22: sparse:    unsigned int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:713:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: note: previously declared as:
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: sparse: symbol 'bit' redeclared with different type (different base types):
   include/linux/bitmap.h:713:9: sparse:    int [addressable] [toplevel] bit
   include/linux/bitmap.h:713:9: sparse: note: previously declared as:
   include/linux/bitmap.h:713:9: sparse:    incomplete type [addressable] [toplevel] bit
   include/linux/bitmap.h:773:57: sparse: sparse: symbol 'pos' has multiple initializers (originally initialized at include/linux/list.h:1264)
   include/linux/bitmap.h:852:21: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:852:25: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:852:9: sparse: sparse: symbol 'value_low' redeclared with different type (different type sizes):
   include/linux/bitmap.h:852:9: sparse:    int [addressable] [toplevel] value_low
   include/linux/bitmap.h:844:23: sparse: note: previously declared as:
   include/linux/bitmap.h:844:23: sparse:    unsigned long [addressable] [toplevel] value_low
   include/linux/bitmap.h:853:22: sparse: sparse: undefined identifier 'map'
   include/linux/bitmap.h:853:26: sparse: sparse: undefined identifier 'index'
   include/linux/bitmap.h:853:39: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:853:9: sparse: sparse: symbol 'value_high' redeclared with different type (different type sizes):
   include/linux/bitmap.h:853:9: sparse:    int [addressable] [toplevel] value_high
   include/linux/bitmap.h:844:34: sparse: note: previously declared as:
   include/linux/bitmap.h:844:34: sparse:    unsigned long [addressable] [toplevel] value_high
   include/linux/bitmap.h:880:9: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/bitmap.h:880:9: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, ...):
   include/linux/bitmap.h:885:16: sparse: sparse: undefined identifier 'nbits'
   include/linux/bitmap.h:885:9: sparse: sparse: symbol 'mask' redeclared with different type (different type sizes):
   include/linux/bitmap.h:885:9: sparse:    int [addressable] [toplevel] mask
   include/linux/bitmap.h:879:23: sparse: note: previously declared as:
   include/linux/bitmap.h:879:23: sparse:    unsigned long [addressable] [toplevel] mask
   include/linux/bitmap.h:887:9: sparse: sparse: symbol 'offset' redeclared with different type (different type sizes):
   include/linux/bitmap.h:887:9: sparse:    int [addressable] [toplevel] offset
   include/linux/bitmap.h:877:23: sparse: note: previously declared as:
   include/linux/bitmap.h:877:23: sparse:    unsigned long [addressable] [toplevel] offset
   include/linux/bitmap.h:888:9: sparse: sparse: symbol 'space' redeclared with different type (different type sizes):
   include/linux/bitmap.h:888:9: sparse:    int [addressable] [toplevel] space
   include/linux/bitmap.h:878:23: sparse: note: previously declared as:
   include/linux/bitmap.h:878:23: sparse:    unsigned long [addressable] [toplevel] space
   include/linux/bitmap.h:889:24: sparse: sparse: undefined identifier 'nbits'
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/nodemask.h, include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, ...):
   include/linux/random.h:120:1: sparse: sparse: symbol '__bool' redeclared with different type (different modifiers):
   include/linux/random.h:120:1: sparse:    int static [toplevel] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:266:1: sparse: note: previously declared as:
   include/linux/irqflags.h:266:1: sparse:    int static const [toplevel] [unused] __bool
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/numa.h, include/linux/cpumask.h, include/linux/smp.h, include/linux/interrupt_rc.h, ...):
   include/linux/nodemask.h:261:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:261:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:267:16: sparse: sparse: undefined identifier 'srcp'
   include/linux/nodemask.h:267:16: sparse: sparse: cannot dereference this type
   include/linux/nodemask.h:287:9: sparse: sparse: symbol '__node_set' redeclared with different type (different argument counts):
   include/linux/nodemask.h:287:9: sparse:    int static [signed] [toplevel] __node_set( ... )
   include/linux/nodemask.h:133:29: sparse: note: previously declared as:
   include/linux/nodemask.h:133:29: sparse:    void static inline [gnu_inline] [toplevel] [unused] __node_set( ... )
   include/linux/nodemask.h:304:16: sparse: sparse: undefined identifier 'maskp'
   include/linux/nodemask.h:304:16: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
>> include/linux/cpumask.h:1381:46: sparse: sparse: cannot dereference this type
   include/linux/cpumask.h:1409:43: sparse: sparse: cannot dereference this type
   include/linux/cpumask.h:1409:9: sparse: sparse: symbol 'n' has multiple initializers (originally initialized at include/linux/cpumask.h:1381)
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/rseq_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/workqueue_types.h:18:26: sparse: sparse: symbol 'entry' redeclared with different type (different base types):
   include/linux/workqueue_types.h:18:26: sparse:    struct list_head [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/smp.h, include/linux/interrupt_rc.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/list.h:567:9: sparse: note: previously declared as:
   include/linux/list.h:567:9: sparse:    int [addressable] [toplevel] entry
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse: sparse: symbol 'p' redeclared with different type (different type sizes):
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
   arch/powerpc/include/asm/bitops.h:181:23: sparse: note: previously declared as:
   arch/powerpc/include/asm/bitops.h:181:23: sparse:    unsigned long *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:83:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec8.c:84:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:84:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec8.c:84:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:85:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:85:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec8.c:85:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec8.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec8.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec8.c:89:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/altivec8.c:89:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:89:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:90:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/altivec8.c:90:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:90:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:91:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/altivec8.c:91:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:91:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:92:23: sparse: sparse: undefined identifier 'wp4'
   lib/raid/raid6/powerpc/altivec8.c:92:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:92:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:93:23: sparse: sparse: undefined identifier 'wp5'
   lib/raid/raid6/powerpc/altivec8.c:93:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:93:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:94:23: sparse: sparse: undefined identifier 'wp6'
   lib/raid/raid6/powerpc/altivec8.c:94:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:94:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:95:23: sparse: sparse: undefined identifier 'wp7'
   lib/raid/raid6/powerpc/altivec8.c:95:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:95:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:98:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:98:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:99:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:99:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:100:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:100:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:101:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:101:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:102:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:102:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:103:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:103:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:104:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec8.c:104:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:105:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:106:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:107:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:108:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:109:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:110:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:111:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:112:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:113:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:114:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:115:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:116:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:117:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:118:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:119:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:120:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec8.c:121:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:122:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:123:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:124:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:125:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:126:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:127:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:128:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec8.c:129:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:129:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:113)
   lib/raid/raid6/powerpc/altivec8.c:130:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:130:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:114)
   lib/raid/raid6/powerpc/altivec8.c:131:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:131:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:115)
   lib/raid/raid6/powerpc/altivec8.c:132:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:132:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:116)
   lib/raid/raid6/powerpc/altivec8.c:133:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:133:25: sparse: sparse: symbol 'w24' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:117)
   lib/raid/raid6/powerpc/altivec8.c:134:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:134:25: sparse: sparse: symbol 'w25' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:118)
   lib/raid/raid6/powerpc/altivec8.c:135:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:135:25: sparse: sparse: symbol 'w26' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:119)
   lib/raid/raid6/powerpc/altivec8.c:136:31: sparse: sparse: undefined identifier '__builtin_vec_and'
   lib/raid/raid6/powerpc/altivec8.c:136:25: sparse: sparse: symbol 'w27' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:120)
   lib/raid/raid6/powerpc/altivec8.c:137:31: sparse: sparse: undefined identifier '__builtin_vec_xor'

vim +1381 include/linux/cpumask.h

6ba2ef7baac23a Rusty Russell  2009-09-24  1358  
1fae562983ca5c Tian Tao       2021-08-06  1359  /**
1fae562983ca5c Tian Tao       2021-08-06  1360   * cpumap_print_bitmask_to_buf  - copies the cpumask into the buffer as
1fae562983ca5c Tian Tao       2021-08-06  1361   *	hex values of cpumask
1fae562983ca5c Tian Tao       2021-08-06  1362   *
1fae562983ca5c Tian Tao       2021-08-06  1363   * @buf: the buffer to copy into
1fae562983ca5c Tian Tao       2021-08-06  1364   * @mask: the cpumask to copy
1fae562983ca5c Tian Tao       2021-08-06  1365   * @off: in the string from which we are copying, we copy to @buf
1fae562983ca5c Tian Tao       2021-08-06  1366   * @count: the maximum number of bytes to print
1fae562983ca5c Tian Tao       2021-08-06  1367   *
1fae562983ca5c Tian Tao       2021-08-06  1368   * The function prints the cpumask into the buffer as hex values of
1fae562983ca5c Tian Tao       2021-08-06  1369   * cpumask; Typically used by bin_attribute to export cpumask bitmask
1fae562983ca5c Tian Tao       2021-08-06  1370   * ABI.
1fae562983ca5c Tian Tao       2021-08-06  1371   *
57f728d59f005d Randy Dunlap   2023-07-31  1372   * Return: the length of how many bytes have been copied, excluding
c86a2d9058c5a4 Tobias Klauser 2021-09-17  1373   * terminating '\0'.
1fae562983ca5c Tian Tao       2021-08-06  1374   */
ab6b1010dab68f Brian Norris   2024-07-18  1375  static __always_inline
ab6b1010dab68f Brian Norris   2024-07-18  1376  ssize_t cpumap_print_bitmask_to_buf(char *buf, const struct cpumask *mask,
1fae562983ca5c Tian Tao       2021-08-06  1377  				    loff_t off, size_t count)
1fae562983ca5c Tian Tao       2021-08-06  1378  {
4c9c30534d06fe Hungyu Lin     2026-10-20  1379  	ssize_t n;
4c9c30534d06fe Hungyu Lin     2026-10-20  1380  
4c9c30534d06fe Hungyu Lin     2026-10-20 @1381  	n = bitmap_print_bitmask_to_buf(buf, cpumask_bits(mask),
4c9c30534d06fe Hungyu Lin     2026-10-20  1382  					nr_cpu_ids, off, count);
4c9c30534d06fe Hungyu Lin     2026-10-20  1383  	if (n > 0 && buf[n - 1] == '\0')
4c9c30534d06fe Hungyu Lin     2026-10-20  1384  		n--;
4c9c30534d06fe Hungyu Lin     2026-10-20  1385  
4c9c30534d06fe Hungyu Lin     2026-10-20  1386  	return n;
1fae562983ca5c Tian Tao       2021-08-06  1387  }
1fae562983ca5c Tian Tao       2021-08-06  1388  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
