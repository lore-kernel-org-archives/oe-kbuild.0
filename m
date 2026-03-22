Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A51FC10C
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 19:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206957; cv=none; b=px/dDVTDdgMAk99F3OPUEXRBt4boX0qCBmFIdCCVIQkM4+J7n8z1nOaZTZUpmUYj2u3slfi9BZRdOh6P7wp+/uGZI6kUoQ/17mAsTty4K1VrnYWNvnWlggvppGyjgk3wKIXn3fPJwbMSGy8xM8tXnyDmET+dQN8N7XHxYwjWP8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206957; c=relaxed/simple;
	bh=IniYCvUoi1mCqWhfujba/+8hpWB9QJVclgaEr0DJjiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i9HXmPcXx7NtFoLWtbgVz8/nhqHsQ+Gq8MVpgBdXB3bb7iBlDtIILFUyO+8Mrp97/Ke4KG2O5PHN9hZ9M3cyckRoFyMxNpkVyx7UsjVFTg4PHsNGNwK6JMhIGrvKof/iEIIIcJC9ATjeXz8qjLt2Rgv9IdXemV9wc+H3GYLd+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvfajpRr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvfajpRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774206952; x=1805742952;
  h=date:from:to:cc:subject:message-id;
  bh=IniYCvUoi1mCqWhfujba/+8hpWB9QJVclgaEr0DJjiY=;
  b=BvfajpRru89uGRvprcxIpjWamgnBaiiaAAmlsm88YC+s46YICP4/+rnZ
   Dl+xIFwOCYhVmCRN5opHsefcWPFQw5wByfw3dWaXGqk5kDXb+kv1c3Pvw
   86NPFoEmzGn728D+bh2jHOds2Wtwj6qD3OAcjkO5X4ABouTNkE9f8O0pq
   Md/HLtZlOwWUCBSekw6hHjaAEHc9CwQtsABy6gvAoFhl8h3i93mjYlWIu
   9CMuNtuzEIVdQnFCXIi058JWItwT4fzKArLyrBB08M1xId8xcN1kk23nG
   OUJNb12+z6SQZrGIg8ef9jWj5Arzs/rOM/FobrKzJl/BJpVfFS/1MTW69
   A==;
X-CSE-ConnectionGUID: MvqfksxIT/6QZGypoFD+aQ==
X-CSE-MsgGUID: fkxeuhEzTY+5GBbhrIRCkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75100499"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75100499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 12:15:52 -0700
X-CSE-ConnectionGUID: R5OPlv8fRNKBUtt9yeLDLA==
X-CSE-MsgGUID: I3nxEI2MSnWDiCzm0K3viw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="225588791"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Mar 2026 12:15:49 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4OH5-000000002YF-27QF;
	Sun, 22 Mar 2026 19:15:47 +0000
Date: Mon, 23 Mar 2026 03:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-misc:lib-raid6 29/39]
 lib/raid/raid6/powerpc/altivec1.c:60:9: sparse: sparse: Trying to use
 reserved word 'return' as identifier
Message-ID: <202603230301.fypkqcow-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: lib/raid/raid6/powerpc/altivec1.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   48e7b546787ed587595618cfc032781023f62636
commit: d5d0bf46a988bce7c7cca7e89406153cef11ac7c [29/39] raid6: move to lib/raid/
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r121-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230301.fypkqcow-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230301.fypkqcow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603230301.fypkqcow-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/raid6/powerpc/altivec1.c: note: in included file:
   ../lib/gcc/powerpc64-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/altivec1.c:37:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:37:16: sparse: sparse: got signed
   lib/raid/raid6/powerpc/altivec1.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec1.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:49:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec1.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec1.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:60:27: sparse: sparse: got __builtin_vec_cmpgt
   lib/raid/raid6/powerpc/altivec1.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec1.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:74:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec1.c:80:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:80:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec1.c:80:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec1.c:80:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:80:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec1.c:80:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:80:37: sparse: sparse: got +=
   lib/raid/raid6/powerpc/altivec1.c:82:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:82:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec1.c:82:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec1.c:82:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:82:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec1.c:82:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:82:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec1.c:90:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:90:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:92:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec1.c:92:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec1.c:93:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:93:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:98:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:98:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got 0
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:105:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:105:1: sparse: sparse: got }
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
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: symbol 'should_resched' redeclared with different type (different argument counts):
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse:    int static [signed] [toplevel] should_resched( ... )
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
   include/asm-generic/preempt.h:75:29: sparse: note: previously declared as:
   include/asm-generic/preempt.h:75:29: sparse:    bool static inline [gnu_inline] [toplevel] [unsigned] [unused] should_resched( ... )
   lib/raid/raid6/powerpc/altivec1.c:117:9: sparse: sparse: undefined identifier 'raid6_altivec1_gen_syndrome'
--
   lib/raid/raid6/powerpc/altivec2.c: note: in included file:
   ../lib/gcc/powerpc64-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/altivec2.c:37:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:37:16: sparse: sparse: got signed
   lib/raid/raid6/powerpc/altivec2.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec2.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:49:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec2.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec2.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:60:27: sparse: sparse: got __builtin_vec_cmpgt
   lib/raid/raid6/powerpc/altivec2.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec2.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:74:19: sparse: sparse: got wd1
   lib/raid/raid6/powerpc/altivec2.c:75:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:75:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec2.c:81:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:81:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec2.c:81:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec2.c:81:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:81:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec2.c:81:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:81:37: sparse: sparse: got +=
>> lib/raid/raid6/powerpc/altivec2.c:83:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec2.c:84:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:84:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec2.c:84:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec2.c:84:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:84:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec2.c:84:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:84:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec2.c:86:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec2.c:99:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:99:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:101:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec2.c:101:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c:102:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec2.c:102:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c:103:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec2.c:103:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c:104:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:104:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:109:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:109:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got 0
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:116:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:116:1: sparse: sparse: got }
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
>> lib/raid/raid6/powerpc/altivec2.c:83:29: sparse: sparse: cannot dereference this type
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
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: symbol 'should_resched' redeclared with different type (different argument counts):
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse:    int static [signed] [toplevel] should_resched( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
   include/asm-generic/preempt.h:75:29: sparse: note: previously declared as:
   include/asm-generic/preempt.h:75:29: sparse:    bool static inline [gnu_inline] [toplevel] [unsigned] [unused] should_resched( ... )
   lib/raid/raid6/powerpc/altivec2.c:128:9: sparse: sparse: undefined identifier 'raid6_altivec2_gen_syndrome'
   lib/raid/raid6/powerpc/altivec2.c:130:9: sparse: sparse: undefined identifier 'raid6_have_altivec'
--
   lib/raid/raid6/powerpc/altivec4.c: note: in included file:
   ../lib/gcc/powerpc64-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/altivec4.c:37:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:37:16: sparse: sparse: got signed
   lib/raid/raid6/powerpc/altivec4.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec4.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:49:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec4.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec4.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:60:27: sparse: sparse: got __builtin_vec_cmpgt
   lib/raid/raid6/powerpc/altivec4.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec4.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:74:19: sparse: sparse: got wd1
   lib/raid/raid6/powerpc/altivec4.c:75:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:75:19: sparse: sparse: got wd2
   lib/raid/raid6/powerpc/altivec4.c:76:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:76:19: sparse: sparse: got wd3
   lib/raid/raid6/powerpc/altivec4.c:77:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:77:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec4.c:83:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:83:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec4.c:83:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec4.c:83:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:83:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec4.c:83:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:83:37: sparse: sparse: got +=
>> lib/raid/raid6/powerpc/altivec4.c:85:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:86:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:87:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:88:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:88:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec4.c:88:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec4.c:88:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:88:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec4.c:88:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:88:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec4.c:90:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:91:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:92:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:117:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:117:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:119:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:119:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:120:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:120:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:121:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:121:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:122:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:122:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:123:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:123:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:124:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:124:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:125:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:125:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:126:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:126:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:131:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:131:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got 0
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:138:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:138:1: sparse: sparse: got }
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
>> lib/raid/raid6/powerpc/altivec4.c:85:29: sparse: sparse: cannot dereference this type
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
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:136:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:136:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: symbol 'should_resched' redeclared with different type (different argument counts):
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse:    int static [signed] [toplevel] should_resched( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
   include/asm-generic/preempt.h:75:29: sparse: note: previously declared as:
   include/asm-generic/preempt.h:75:29: sparse:    bool static inline [gnu_inline] [toplevel] [unsigned] [unused] should_resched( ... )
   lib/raid/raid6/powerpc/altivec4.c:150:9: sparse: sparse: undefined identifier 'raid6_altivec4_gen_syndrome'
   lib/raid/raid6/powerpc/altivec4.c:152:9: sparse: sparse: undefined identifier 'raid6_have_altivec'
--
   lib/raid/raid6/powerpc/altivec8.c: note: in included file:
   ../lib/gcc/powerpc64-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/altivec8.c:37:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:37:16: sparse: sparse: got signed
   lib/raid/raid6/powerpc/altivec8.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec8.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:49:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec8.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec8.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:60:27: sparse: sparse: got __builtin_vec_cmpgt
   lib/raid/raid6/powerpc/altivec8.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec8.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:74:19: sparse: sparse: got wd1
   lib/raid/raid6/powerpc/altivec8.c:75:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:75:19: sparse: sparse: got wd2
   lib/raid/raid6/powerpc/altivec8.c:76:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:76:19: sparse: sparse: got wd3
   lib/raid/raid6/powerpc/altivec8.c:77:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:77:19: sparse: sparse: got wd4
   lib/raid/raid6/powerpc/altivec8.c:78:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:78:19: sparse: sparse: got wd5
   lib/raid/raid6/powerpc/altivec8.c:79:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:79:19: sparse: sparse: got wd6
   lib/raid/raid6/powerpc/altivec8.c:80:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:80:19: sparse: sparse: got wd7
   lib/raid/raid6/powerpc/altivec8.c:81:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:81:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec8.c:87:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:87:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec8.c:87:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec8.c:87:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:87:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec8.c:87:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:87:37: sparse: sparse: got +=
>> lib/raid/raid6/powerpc/altivec8.c:89:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:90:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:91:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:92:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:93:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:94:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:95:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:96:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:96:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec8.c:96:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec8.c:96:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:96:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec8.c:96:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:96:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec8.c:98:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:99:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:100:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:101:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:102:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:103:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:104:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:153:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:153:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:155:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:155:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:156:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:156:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:157:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:157:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:158:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:158:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:159:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:159:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:160:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:160:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:161:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:161:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:162:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:162:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:163:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:163:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:164:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:164:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:165:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:165:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:166:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:166:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:167:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:167:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:168:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:168:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:169:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:169:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:170:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:170:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:175:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:175:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got 0
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:182:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:182:1: sparse: sparse: got }
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
>> lib/raid/raid6/powerpc/altivec8.c:89:29: sparse: sparse: cannot dereference this type
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
   lib/raid/raid6/powerpc/altivec8.c:137:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:121)
   lib/raid/raid6/powerpc/altivec8.c:138:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:138:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:122)
   lib/raid/raid6/powerpc/altivec8.c:139:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:139:25: sparse: sparse: symbol 'w12' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:123)
   lib/raid/raid6/powerpc/altivec8.c:140:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:140:25: sparse: sparse: symbol 'w13' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:124)
   lib/raid/raid6/powerpc/altivec8.c:141:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:141:25: sparse: sparse: symbol 'w14' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:125)
   lib/raid/raid6/powerpc/altivec8.c:142:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:142:25: sparse: sparse: symbol 'w15' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:126)
   lib/raid/raid6/powerpc/altivec8.c:143:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:143:25: sparse: sparse: symbol 'w16' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:127)
   lib/raid/raid6/powerpc/altivec8.c:144:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:144:25: sparse: sparse: symbol 'w17' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:128)
   lib/raid/raid6/powerpc/altivec8.c:145:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:146:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:146:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:89)
   lib/raid/raid6/powerpc/altivec8.c:147:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:147:25: sparse: sparse: symbol 'wq2' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:90)
   lib/raid/raid6/powerpc/altivec8.c:148:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:148:25: sparse: sparse: symbol 'wq3' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:91)
   lib/raid/raid6/powerpc/altivec8.c:149:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:149:25: sparse: sparse: symbol 'wq4' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:92)
   lib/raid/raid6/powerpc/altivec8.c:150:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/altivec8.c:150:25: sparse: sparse: symbol 'wq5' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec8.c:93)
--
   lib/raid/raid6/powerpc/vpermxor1.c: note: in included file:
   ../lib/gcc/powerpc64-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/vpermxor1.c:29:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor1.c:29:16: sparse: sparse: got unsigned
>> lib/raid/raid6/powerpc/vpermxor1.c:32:21: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor1.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor1.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor1.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor1.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor1.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor1.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor1.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor1.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor1.c:45:19: sparse: sparse: got wp0
>> lib/raid/raid6/powerpc/vpermxor1.c:52:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:55:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:63:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:64:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:45:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:52:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor1.c:52:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor1.c:52:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:52:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:55:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid/raid6/powerpc/vpermxor1.c:55:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:55:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:57:25: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor1.c:57:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor1.c:60:56: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor1.c:61:25: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor1.c:61:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor1.c:63:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:63:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:63:47: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor1.c:64:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:64:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:64:47: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor1.c:51:37: sparse: sparse: undefined identifier 'unative_t'
--
   lib/raid/raid6/powerpc/vpermxor2.c: note: in included file:
   ../lib/gcc/powerpc64-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/vpermxor2.c:29:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor2.c:29:16: sparse: sparse: got unsigned
>> lib/raid/raid6/powerpc/vpermxor2.c:32:21: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor2.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor2.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor2.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor2.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor2.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor2.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor2.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor2.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor2.c:45:19: sparse: sparse: got wp0
   lib/raid/raid6/powerpc/vpermxor2.c:46:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor2.c:46:19: sparse: sparse: got wp1
>> lib/raid/raid6/powerpc/vpermxor2.c:53:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:54:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:57:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:58:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:69:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:70:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:71:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:72:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:45:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:46:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:53:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor2.c:53:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor2.c:53:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:53:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:54:17: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/vpermxor2.c:54:23: sparse: sparse: undefined identifier 'wq1'
   lib/raid/raid6/powerpc/vpermxor2.c:54:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:54:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:57:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid/raid6/powerpc/vpermxor2.c:57:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:57:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:58:25: sparse: sparse: undefined identifier 'wd1'
   lib/raid/raid6/powerpc/vpermxor2.c:58:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:58:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:60:25: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor2.c:60:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor2.c:61:25: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/vpermxor2.c:61:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor2.c:64:56: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor2.c:65:56: sparse: sparse: undefined identifier 'wq1'
   lib/raid/raid6/powerpc/vpermxor2.c:66:25: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor2.c:66:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor2.c:67:25: sparse: sparse: undefined identifier 'wq1'
   lib/raid/raid6/powerpc/vpermxor2.c:67:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor2.c:69:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:69:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:69:47: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor2.c:70:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:70:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:70:47: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/vpermxor2.c:71:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:71:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:71:47: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor2.c:72:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:72:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor2.c:72:47: sparse: sparse: undefined identifier 'wq1'
   lib/raid/raid6/powerpc/vpermxor2.c:52:37: sparse: sparse: undefined identifier 'unative_t'
--
   lib/raid/raid6/powerpc/vpermxor4.c: note: in included file:
   ../lib/gcc/powerpc64-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/vpermxor4.c:29:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor4.c:29:16: sparse: sparse: got unsigned
>> lib/raid/raid6/powerpc/vpermxor4.c:32:21: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor4.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor4.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor4.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor4.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor4.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor4.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor4.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor4.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:45:19: sparse: sparse: got wp0
   lib/raid/raid6/powerpc/vpermxor4.c:46:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:46:19: sparse: sparse: got wp1
   lib/raid/raid6/powerpc/vpermxor4.c:47:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:47:19: sparse: sparse: got wp2
   lib/raid/raid6/powerpc/vpermxor4.c:48:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:48:19: sparse: sparse: got wp3
>> lib/raid/raid6/powerpc/vpermxor4.c:55:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:56:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:57:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:58:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:61:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:62:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:63:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:64:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:81:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:82:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:83:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:84:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:85:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:86:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:87:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:88:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:45:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:46:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:47:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:48:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:55:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor4.c:55:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor4.c:55:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:55:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:56:17: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/vpermxor4.c:56:23: sparse: sparse: undefined identifier 'wq1'
   lib/raid/raid6/powerpc/vpermxor4.c:56:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:56:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:57:17: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/vpermxor4.c:57:23: sparse: sparse: undefined identifier 'wq2'
   lib/raid/raid6/powerpc/vpermxor4.c:57:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:57:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:58:17: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/vpermxor4.c:58:23: sparse: sparse: undefined identifier 'wq3'
   lib/raid/raid6/powerpc/vpermxor4.c:58:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:58:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:61:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid/raid6/powerpc/vpermxor4.c:61:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:61:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:62:25: sparse: sparse: undefined identifier 'wd1'
   lib/raid/raid6/powerpc/vpermxor4.c:62:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:62:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:63:25: sparse: sparse: undefined identifier 'wd2'
   lib/raid/raid6/powerpc/vpermxor4.c:63:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:63:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:64:25: sparse: sparse: undefined identifier 'wd3'
   lib/raid/raid6/powerpc/vpermxor4.c:64:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:64:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:66:25: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor4.c:66:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor4.c:67:25: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/vpermxor4.c:67:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor4.c:68:25: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/vpermxor4.c:68:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor4.c:69:25: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/vpermxor4.c:69:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor4.c:72:56: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor4.c:73:56: sparse: sparse: undefined identifier 'wq1'
   lib/raid/raid6/powerpc/vpermxor4.c:74:56: sparse: sparse: undefined identifier 'wq2'
   lib/raid/raid6/powerpc/vpermxor4.c:75:56: sparse: sparse: undefined identifier 'wq3'
   lib/raid/raid6/powerpc/vpermxor4.c:76:25: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor4.c:76:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor4.c:77:25: sparse: sparse: undefined identifier 'wq1'
   lib/raid/raid6/powerpc/vpermxor4.c:77:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor4.c:78:25: sparse: sparse: undefined identifier 'wq2'
   lib/raid/raid6/powerpc/vpermxor4.c:78:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor4.c:79:25: sparse: sparse: undefined identifier 'wq3'
   lib/raid/raid6/powerpc/vpermxor4.c:79:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor4.c:81:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:81:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:81:47: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor4.c:82:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:82:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:82:47: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/vpermxor4.c:83:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:83:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:83:47: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/vpermxor4.c:84:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:84:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:84:47: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/vpermxor4.c:85:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:85:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:85:47: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor4.c:86:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:86:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:86:47: sparse: sparse: undefined identifier 'wq1'
   lib/raid/raid6/powerpc/vpermxor4.c:87:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:87:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:87:47: sparse: sparse: undefined identifier 'wq2'
   lib/raid/raid6/powerpc/vpermxor4.c:88:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:88:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor4.c:88:47: sparse: sparse: undefined identifier 'wq3'
   lib/raid/raid6/powerpc/vpermxor4.c:54:37: sparse: sparse: undefined identifier 'unative_t'
--
   lib/raid/raid6/powerpc/vpermxor8.c: note: in included file:
   ../lib/gcc/powerpc64-linux/10.5.0/include/altivec.h:34:2: sparse: sparse: Use the "-maltivec" flag to enable PowerPC AltiVec support
   lib/raid/raid6/powerpc/vpermxor8.c:29:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor8.c:29:16: sparse: sparse: got unsigned
>> lib/raid/raid6/powerpc/vpermxor8.c:32:21: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor8.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor8.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor8.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor8.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor8.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor8.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor8.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor8.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:45:19: sparse: sparse: got wp0
   lib/raid/raid6/powerpc/vpermxor8.c:46:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:46:19: sparse: sparse: got wp1
   lib/raid/raid6/powerpc/vpermxor8.c:47:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:47:19: sparse: sparse: got wp2
   lib/raid/raid6/powerpc/vpermxor8.c:48:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:48:19: sparse: sparse: got wp3
   lib/raid/raid6/powerpc/vpermxor8.c:49:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:49:19: sparse: sparse: got wp4
   lib/raid/raid6/powerpc/vpermxor8.c:50:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:50:19: sparse: sparse: got wp5
   lib/raid/raid6/powerpc/vpermxor8.c:51:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:51:19: sparse: sparse: got wp6
   lib/raid/raid6/powerpc/vpermxor8.c:52:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:52:19: sparse: sparse: got wp7
>> lib/raid/raid6/powerpc/vpermxor8.c:59:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:60:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:61:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:62:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:63:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:64:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:65:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:66:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:69:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:70:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:71:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:72:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:73:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:74:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:75:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:76:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:105:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:106:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:107:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:108:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:109:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:110:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:111:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:112:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:113:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:114:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:115:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:116:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:117:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:118:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:119:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:120:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:45:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:46:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:47:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:48:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:49:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:50:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:51:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:52:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:59:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor8.c:59:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor8.c:59:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:59:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:60:17: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/vpermxor8.c:60:23: sparse: sparse: undefined identifier 'wq1'
   lib/raid/raid6/powerpc/vpermxor8.c:60:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:60:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:61:17: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/vpermxor8.c:61:23: sparse: sparse: undefined identifier 'wq2'
   lib/raid/raid6/powerpc/vpermxor8.c:61:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:61:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:62:17: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/vpermxor8.c:62:23: sparse: sparse: undefined identifier 'wq3'
   lib/raid/raid6/powerpc/vpermxor8.c:62:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:62:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:63:17: sparse: sparse: undefined identifier 'wp4'
   lib/raid/raid6/powerpc/vpermxor8.c:63:23: sparse: sparse: undefined identifier 'wq4'
   lib/raid/raid6/powerpc/vpermxor8.c:63:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:63:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:64:17: sparse: sparse: undefined identifier 'wp5'
   lib/raid/raid6/powerpc/vpermxor8.c:64:23: sparse: sparse: undefined identifier 'wq5'
   lib/raid/raid6/powerpc/vpermxor8.c:64:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:64:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:65:17: sparse: sparse: undefined identifier 'wp6'
   lib/raid/raid6/powerpc/vpermxor8.c:65:23: sparse: sparse: undefined identifier 'wq6'
   lib/raid/raid6/powerpc/vpermxor8.c:65:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:65:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:66:17: sparse: sparse: undefined identifier 'wp7'
   lib/raid/raid6/powerpc/vpermxor8.c:66:23: sparse: sparse: undefined identifier 'wq7'
   lib/raid/raid6/powerpc/vpermxor8.c:66:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:66:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:69:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid/raid6/powerpc/vpermxor8.c:69:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:69:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:70:25: sparse: sparse: undefined identifier 'wd1'
   lib/raid/raid6/powerpc/vpermxor8.c:70:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:70:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:71:25: sparse: sparse: undefined identifier 'wd2'
   lib/raid/raid6/powerpc/vpermxor8.c:71:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:71:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:72:25: sparse: sparse: undefined identifier 'wd3'
   lib/raid/raid6/powerpc/vpermxor8.c:72:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:72:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:73:25: sparse: sparse: undefined identifier 'wd4'
   lib/raid/raid6/powerpc/vpermxor8.c:73:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:73:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:74:25: sparse: sparse: undefined identifier 'wd5'
   lib/raid/raid6/powerpc/vpermxor8.c:74:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:74:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:75:25: sparse: sparse: undefined identifier 'wd6'
   lib/raid/raid6/powerpc/vpermxor8.c:75:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:75:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:76:25: sparse: sparse: undefined identifier 'wd7'
   lib/raid/raid6/powerpc/vpermxor8.c:76:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:76:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor8.c:78:25: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor8.c:78:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor8.c:79:25: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/powerpc/vpermxor8.c:79:31: sparse: sparse: undefined identifier '__builtin_vec_xor'
   lib/raid/raid6/powerpc/vpermxor8.c:80:25: sparse: sparse: undefined identifier 'wp2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
