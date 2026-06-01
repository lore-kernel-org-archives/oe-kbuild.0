Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122DAB640
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 03:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780285679; cv=none; b=LSpQ9D4MxMH1nR2GTZSD3j9l/jSgH+GDTGHFjvIU6ZDT3rK4RLE1P0rUPVK41JvKRHKsqV6pxQbhzcMSSKqeB8PfYjs82aGamkcotfMwHtTO0Gn0Uor/25wSRk1g/QBt6Bc0siS2PXrQkfnSCorEwJzJ0/3v2gpPlEQTKOdLsoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780285679; c=relaxed/simple;
	bh=4XBZsgJr5Ys4pacl8k2vk0bt2/jhj237YO4i/p8QmLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OPq8DQ1l5C7E4YfjgOWdAI78rftzHZlmzgvDZ261S/gYwqCMwwb9+SNDNXP+3W7+AhuYRDq5nWtP3BTLXoI1+v1Hjx0BGei7DmmTEjOAyTgDe0upzPZqqH3BN1fftrK3AkZ61q8sr+SCfifZSH8MePgxAGK+TsIozk5Wdpo7KH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPKNVNT7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPKNVNT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780285676; x=1811821676;
  h=date:from:to:cc:subject:message-id;
  bh=4XBZsgJr5Ys4pacl8k2vk0bt2/jhj237YO4i/p8QmLw=;
  b=ZPKNVNT7tp7LzyoY3ZxJoSoZyvceiQiPUyrvHXTODTgKJywhhmcDpUtF
   hI6+f+9H0lmXrp3PvgadbDq1qsyv78+JOxPez3Jqqin9HUShmbX32gyIm
   IghCvXj1myhYE44d29X4lmThiZ8mHmrdhySCVrEjCi2Ox8RQnXQbFf4hz
   kH4hOvzaCvWeqCvYKcdivOS//5QakkFwDiHgJRIrTFzQVsxJU88d7iW56
   NPPrCQMXBGAVifW5cNxdsjU9eKPYzFJvQQ1f1ScK0bE+0/DGkHhcKnntG
   jKPq4hgibogL7q8GxeMIHh0uldjsy6SClEkdC6uafKaBIbgKdXDjX62MU
   w==;
X-CSE-ConnectionGUID: ttDpwHb0R/yEXH/QxER+qw==
X-CSE-MsgGUID: 4Lf1Y8tCQlmYHAjTSfHKxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="68571296"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="68571296"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 20:47:55 -0700
X-CSE-ConnectionGUID: QoJPTh0/SzmnkEbyv77F/Q==
X-CSE-MsgGUID: wkh3GN3ZT+qSG3NIGNDB8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="243567982"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 May 2026 20:47:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTtd1-00000000A1O-3sRx;
	Mon, 01 Jun 2026 03:47:51 +0000
Date: Mon, 01 Jun 2026 11:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7021/9870]
 include/linux/kasan-checks.h:38:27: warning: 'args' may be used uninitialized
Message-ID: <202606011125.SbcePutL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Harmstone <mark@harmstone.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 3af8c1874c4203ff8a960333e871df58255e6c37 [7021/9870] btrfs: add ioctl GET_CSUMS to read raw checksums from file range
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-004-20260601 (https://download.01.org/0day-ci/archive/20260601/202606011125.SbcePutL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011125.SbcePutL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606011125.SbcePutL-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:81,
                    from include/linux/compiler.h:369,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from fs/btrfs/ioctl.c:6:
   In function 'instrument_copy_from_user_before',
       inlined from '_inline_copy_from_user' at include/linux/uaccess.h:184:2,
       inlined from 'copy_from_user' at include/linux/uaccess.h:221:9,
       inlined from 'btrfs_ioctl_get_csums.isra' at fs/btrfs/ioctl.c:5140:6:
>> include/linux/kasan-checks.h:38:27: warning: 'args' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
   include/linux/instrumented.h:146:9: note: in expansion of macro 'kasan_check_write'
     146 |         kasan_check_write(to, n);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_get_csums.isra':
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:5121:43: note: 'args' declared here
    5121 |         struct btrfs_ioctl_get_csums_args args;
         |                                           ^~~~


vim +/args +38 include/linux/kasan-checks.h

7d8ad890dad00f6 Marco Elver     2019-07-11  31  
7d8ad890dad00f6 Marco Elver     2019-07-11  32  /*
7d8ad890dad00f6 Marco Elver     2019-07-11  33   * kasan_check_*: Only available when the particular compilation unit has KASAN
7d8ad890dad00f6 Marco Elver     2019-07-11  34   * instrumentation enabled. May be used in header files.
7d8ad890dad00f6 Marco Elver     2019-07-11  35   */
7d8ad890dad00f6 Marco Elver     2019-07-11  36  #ifdef __SANITIZE_ADDRESS__
7d8ad890dad00f6 Marco Elver     2019-07-11  37  #define kasan_check_read __kasan_check_read
7d8ad890dad00f6 Marco Elver     2019-07-11 @38  #define kasan_check_write __kasan_check_write
64f8ebaf115bcdd Andrey Ryabinin 2016-05-20  39  #else
b5f6e0fc7d60e02 Marco Elver     2019-07-11  40  static inline bool kasan_check_read(const volatile void *p, unsigned int size)
b5f6e0fc7d60e02 Marco Elver     2019-07-11  41  {
b5f6e0fc7d60e02 Marco Elver     2019-07-11  42  	return true;
b5f6e0fc7d60e02 Marco Elver     2019-07-11  43  }
b5f6e0fc7d60e02 Marco Elver     2019-07-11  44  static inline bool kasan_check_write(const volatile void *p, unsigned int size)
b5f6e0fc7d60e02 Marco Elver     2019-07-11  45  {
b5f6e0fc7d60e02 Marco Elver     2019-07-11  46  	return true;
b5f6e0fc7d60e02 Marco Elver     2019-07-11  47  }
64f8ebaf115bcdd Andrey Ryabinin 2016-05-20  48  #endif
64f8ebaf115bcdd Andrey Ryabinin 2016-05-20  49  

:::::: The code at line 38 was first introduced by commit
:::::: 7d8ad890dad00f6cd64bfb44d9be4fceb10cf819 mm/kasan: introduce __kasan_check_{read,write}

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
