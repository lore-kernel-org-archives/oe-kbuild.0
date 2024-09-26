Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D3320B22
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Sep 2024 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335874; cv=none; b=es/o/oeLIyL8WbA2QT7hHiU2+GVEm+EIPkG1DPou52mwEn9L6AE5K8OgFOFf9Ix0og1oQI4F8edjkabYafiQQqtiNYfTyNqK7XQXDpda9wcRJBZLWt/g4BUOI7BdjC+V6xGGs1456ISi4muCqhJ/VyUzfD3a+u3gkd8fAbHHKPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335874; c=relaxed/simple;
	bh=5mPNdSB+/QJ69r06r+r2I8Zmpw36wKj9yzXjCKIYNco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7AeLUFUaGJEbh5JFpJRJW+o9nP0lQrVT56dBjh1ckk15mFT5zPn8Q89VBsA3a3k/+h6c3X7Q1dwCUiGqnGHW2fjBIzu7mMh4bcVd2R3xpMX/LmOAwomz9NLNlw2vg1IfNL9CIDTQgAaUxKCgjxlSg3Zj+hD+qqdlHC9A4KUd4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9+Gjghd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9+Gjghd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727335873; x=1758871873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5mPNdSB+/QJ69r06r+r2I8Zmpw36wKj9yzXjCKIYNco=;
  b=b9+Gjghd9FiqusPMrIJ+yhtcX0jydp067VZy7aj1PLfTibIeUM8t1JKQ
   4wt0kDUQjGjBIv+9DtrKhzFZs6Xpucprg9Wetv3gc0InDgLwf9tVk5QGZ
   ERHLTw4yi3C30tMZlKVtYRBYxbTzZMnhz91iqGdbQDRS94S8ftW5VhfII
   QzOF1+/JnTpApQVTs3MNTyaKuHVUN3hWTlRdQw6eesNiWJf8mYDMTI/ew
   UHJUwWG9d++3XjGZLhoQI194mOKN9Oec1PsN+D1EpwXXFK6MBM1gBdl1e
   D0OoQBb/Mw74J+bvoVAtnGLLp/tSaIzUZTpLKzmmF6Ky4ExAsYjKOEXwB
   Q==;
X-CSE-ConnectionGUID: 6pgf1mIVTaOwQu02azD3Rg==
X-CSE-MsgGUID: xmnbBXFBR5uZSBpcl5KMJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37086362"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="37086362"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 00:31:06 -0700
X-CSE-ConnectionGUID: P7lNGEKMSTOsgQ05fK84WQ==
X-CSE-MsgGUID: hIgScD08QY+sHoJbRfmkRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="71925883"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Sep 2024 00:31:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stixn-000KOj-1O;
	Thu, 26 Sep 2024 07:30:59 +0000
Date: Thu, 26 Sep 2024 15:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip-rt 143/30000] mm/page_alloc.c:295:30: warning:
 'pa_lock' defined but not used
Message-ID: <202409261542.9A2DlXpU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 6229d1db10c8d1a57b0a927e996b78bc9dcb7bd3 [143/30000] mm: page_alloc: rt-friendly per-cpu pages
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409261542.9A2DlXpU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261542.9A2DlXpU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409261542.9A2DlXpU-lkp@intel.com/

All warnings (new ones prefixed by >>):

    7148 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7150:9: note: in expansion of macro 'adj_init_size'
    7150 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7150:9: note: in expansion of macro 'adj_init_size'
    7150 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7150:9: note: in expansion of macro 'adj_init_size'
    7150 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7150:9: note: in expansion of macro 'adj_init_size'
    7150 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7151:9: note: in expansion of macro 'adj_init_size'
    7151 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7151:9: note: in expansion of macro 'adj_init_size'
    7151 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7151:9: note: in expansion of macro 'adj_init_size'
    7151 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7151:9: note: in expansion of macro 'adj_init_size'
    7151 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7152:9: note: in expansion of macro 'adj_init_size'
    7152 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7152:9: note: in expansion of macro 'adj_init_size'
    7152 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7152:9: note: in expansion of macro 'adj_init_size'
    7152 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7152:9: note: in expansion of macro 'adj_init_size'
    7152 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7153:9: note: in expansion of macro 'adj_init_size'
    7153 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: note: use '&_sdata[0] <= &__start_rodata[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7153:9: note: in expansion of macro 'adj_init_size'
    7153 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7153:9: note: in expansion of macro 'adj_init_size'
    7153 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: note: use '&__start_rodata[0] < &_edata[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7153:9: note: in expansion of macro 'adj_init_size'
    7153 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   In file included from mm/page_alloc.c:63:
   mm/page_alloc.c: At top level:
>> mm/page_alloc.c:295:30: warning: 'pa_lock' defined but not used [-Wunused-const-variable=]
     295 | static DEFINE_LOCAL_IRQ_LOCK(pa_lock);
         |                              ^~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/pa_lock +295 mm/page_alloc.c

418508c13222dd Miklos Szeredi 2007-05-23  294  
6229d1db10c8d1 Ingo Molnar    2009-07-03 @295  static DEFINE_LOCAL_IRQ_LOCK(pa_lock);
6229d1db10c8d1 Ingo Molnar    2009-07-03  296  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
