Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7E223DE5
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165562; cv=none; b=oUgL2evjf4rroloj9nXLyTeX4bT12kqT0PZbwtncEvWLU6Dat2pcOtRNNymUQai+ki3juBDPZatnm0fVlHdsq320vVbig4O2YynLd2s1Mlk9VJi5yceNHRnPSpwu1c8vBtkN26zFm5W3GUKD5sVZ0dHDt7GSa1Xlne82JGSP2ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165562; c=relaxed/simple;
	bh=HeMTGzmQRUm91rbTZxuNLOLoIytD1CgVlJO15TFLXD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eiXUh0E4a+tHBegb1td2ljKrU1DUfTiZnA0HLw3ZtvrZvdxeYGBG80J0InFa/Tiv8DruNEFL9tR7tO4l5I7N9a/9QDiLEVin9duY///ws2nLLENYuPSz/0p8BTB+dWNv04r2l+wkYWHnyRENV+WQefH6YbDwDqxes1r0m/8mZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkHelON+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkHelON+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768165560; x=1799701560;
  h=date:from:to:cc:subject:message-id;
  bh=HeMTGzmQRUm91rbTZxuNLOLoIytD1CgVlJO15TFLXD0=;
  b=SkHelON+mdi6dfxJelsdIUHGQjwy5nUb6Jnv5kIoeJsG9deQNCnsgRav
   TAKMtQg8JEphZpSIQbU6Drix/d123QiDaLTD9c5wbWw0avgysj6wvZLJ0
   sJclWuq4xK1DmAXHvIN09VIj0pMEtB4jngwKoGvfdTAihoEQWLJixTVlv
   JKZUvRv/y9HPy8O3vZ7S9WmM64I9HwOtElNiN3YfKLGlu30OnCBd3ivqP
   hwl8X/Zql4hXYvRl3yp/ohOyEk80XtlpPnwCETUGO8fs6MzLpALbh9SUv
   XAy2BKKapRk02nOdzazF3dXXfEa36cuT9d2aTf3FCCuWoKRWWfQu/FIFM
   w==;
X-CSE-ConnectionGUID: fEwetY0TQF+hEDT2/eZ6YQ==
X-CSE-MsgGUID: ilsaSFuVSKGX1QrFDjNHcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69349418"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69349418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 13:06:00 -0800
X-CSE-ConnectionGUID: dFXc6nEuTP6nM8xYE11iEQ==
X-CSE-MsgGUID: sLuY+f2LRKCZAnGNsrtKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204647492"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2026 13:05:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf2dI-00000000Ch6-3eus;
	Sun, 11 Jan 2026 21:05:56 +0000
Date: Mon, 12 Jan 2026 05:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linkinjeon-ntfs:ntfs-next 13/14] fs/ntfs/layout.h:271:43:
 sparse: sparse: mixed bitwiseness
Message-ID: <202601120531.87WmMDcN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   7a305a47bcefc8d9f628f92a700c741fa16e65a0
commit: d37f41f3e1352e866f9538ec5fcac9b44eae728f [13/14] ntfs: add Kconfig and Makefile
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arc-randconfig-r131-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120531.87WmMDcN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120531.87WmMDcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120531.87WmMDcN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/ntfs/collate.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/collate.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/upcase.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
   fs/ntfs/upcase.c:60:15: sparse: sparse: memset with byte count of 131072
--
   fs/ntfs/mst.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/unistr.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/unistr.c:248:53: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] ucs @@
   fs/ntfs/unistr.c:248:53: sparse:     expected unsigned short [usertype] *pwcs
   fs/ntfs/unistr.c:248:53: sparse:     got restricted __le16 [usertype] *[assigned] ucs
--
   fs/ntfs/bitmap.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/bitmap.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/attrlist.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/runlist.h, fs/ntfs/debug.h, fs/ntfs/inode.h, ...):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/aops.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/aops.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/runlist.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/file.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h, fs/ntfs/attrib.h, fs/ntfs/lcnalloc.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/super.c: note: in included file (through fs/ntfs/logfile.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/super.c:2770:1: sparse: sparse: bad integer constant expression
   fs/ntfs/super.c:2770:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   fs/ntfs/super.c:2771:1: sparse: sparse: bad integer constant expression
   fs/ntfs/super.c:2771:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   fs/ntfs/super.c:2772:1: sparse: sparse: bad integer constant expression
   fs/ntfs/super.c:2772:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   fs/ntfs/super.c:2773:1: sparse: sparse: bad integer constant expression
   fs/ntfs/super.c:2773:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   fs/ntfs/super.c:2773:1: sparse: sparse: bad integer constant expression
   fs/ntfs/super.c:2773:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   fs/ntfs/super.c:2775:1: sparse: sparse: bad integer constant expression
   fs/ntfs/super.c:2775:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   fs/ntfs/super.c:2776:1: sparse: sparse: bad integer constant expression
   fs/ntfs/super.c:2776:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
   fs/ntfs/ea.c: note: in included file:
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/ea.c:30:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le32 [usertype] type @@     got int type @@
   fs/ntfs/ea.c:30:43: sparse:     expected restricted __le32 [usertype] type
   fs/ntfs/ea.c:30:43: sparse:     got int type
>> fs/ntfs/ea.c:132:24: sparse: sparse: cast to restricted __le16
>> fs/ntfs/ea.c:132:24: sparse: sparse: cast from restricted __le32
>> fs/ntfs/ea.c:132:24: sparse: sparse: cast to restricted __le16
>> fs/ntfs/ea.c:132:24: sparse: sparse: cast from restricted __le32
>> fs/ntfs/ea.c:132:24: sparse: sparse: cast to restricted __le16
>> fs/ntfs/ea.c:132:24: sparse: sparse: cast from restricted __le32
>> fs/ntfs/ea.c:132:24: sparse: sparse: cast to restricted __le16
>> fs/ntfs/ea.c:132:24: sparse: sparse: cast from restricted __le32
>> fs/ntfs/ea.c:265:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ea_query_length @@     got restricted __le16 [usertype] @@
   fs/ntfs/ea.c:265:44: sparse:     expected restricted __le32 [usertype] ea_query_length
   fs/ntfs/ea.c:265:44: sparse:     got restricted __le16 [usertype]
>> fs/ntfs/ea.c:267:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfs/ea.c:267:41: sparse:     expected int type
   fs/ntfs/ea.c:267:41: sparse:     got restricted __le32
   fs/ntfs/ea.c:272:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfs/ea.c:272:41: sparse:     expected int type
   fs/ntfs/ea.c:272:41: sparse:     got restricted __le32
   fs/ntfs/ea.c:327:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfs/ea.c:327:41: sparse:     expected int type
   fs/ntfs/ea.c:327:41: sparse:     got restricted __le32
   fs/ntfs/ea.c:333:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfs/ea.c:333:33: sparse:     expected int type
   fs/ntfs/ea.c:333:33: sparse:     got restricted __le32
   fs/ntfs/ea.c:461:25: sparse: sparse: cast to restricted __le16
   fs/ntfs/ea.c:461:25: sparse: sparse: cast from restricted __le32
   fs/ntfs/ea.c:461:25: sparse: sparse: cast to restricted __le16
   fs/ntfs/ea.c:461:25: sparse: sparse: cast from restricted __le32
   fs/ntfs/ea.c:461:25: sparse: sparse: cast to restricted __le16
   fs/ntfs/ea.c:461:25: sparse: sparse: cast from restricted __le32
   fs/ntfs/ea.c:461:25: sparse: sparse: cast to restricted __le16
   fs/ntfs/ea.c:461:25: sparse: sparse: cast from restricted __le32
>> fs/ntfs/ea.c:536:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] @@     got restricted __le32 [usertype] flags @@
   fs/ntfs/ea.c:536:39: sparse:     expected unsigned char [usertype]
   fs/ntfs/ea.c:536:39: sparse:     got restricted __le32 [usertype] flags
--
   fs/ntfs/dir.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/runlist.h, fs/ntfs/debug.h, fs/ntfs/inode.h, ...):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/dir.c:931:32: sparse: sparse: invalid assignment: +=
   fs/ntfs/dir.c:931:32: sparse:    left side has type long long
   fs/ntfs/dir.c:931:32: sparse:    right side has type restricted __le16
   fs/ntfs/dir.c:1008:24: sparse: sparse: invalid assignment: +=
   fs/ntfs/dir.c:1008:24: sparse:    left side has type long long
   fs/ntfs/dir.c:1008:24: sparse:    right side has type restricted __le16
>> fs/ntfs/dir.c:1069:37: sparse: sparse: restricted __le32 degrades to integer
--
   fs/ntfs/reparse.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/sysctl.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/runlist.h, fs/ntfs/debug.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/namei.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/namei.c:72:32: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfs/namei.c:73:31: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfs/namei.c:76:52: sparse: sparse: restricted __le16 degrades to integer
>> fs/ntfs/namei.c:80:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfs/namei.c:80:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfs/namei.c:80:42: sparse:     got unsigned short const *wc
   fs/ntfs/namei.c:81:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfs/namei.c:81:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfs/namei.c:81:42: sparse:     got unsigned short const *wc
   fs/ntfs/namei.c:82:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfs/namei.c:82:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfs/namei.c:82:42: sparse:     got unsigned short const *wc
   fs/ntfs/namei.c:83:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfs/namei.c:83:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfs/namei.c:83:42: sparse:     got unsigned short const *wc
   fs/ntfs/namei.c:87:52: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfs/namei.c:91:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfs/namei.c:91:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfs/namei.c:91:42: sparse:     got unsigned short const *wc
   fs/ntfs/namei.c:92:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le16 const [usertype] *s1 @@     got unsigned short const *wc @@
   fs/ntfs/namei.c:92:42: sparse:     expected restricted __le16 const [usertype] *s1
   fs/ntfs/namei.c:92:42: sparse:     got unsigned short const *wc
>> fs/ntfs/namei.c:93:32: sparse: sparse: cast to restricted __le16
>> fs/ntfs/namei.c:93:32: sparse: sparse: cast to restricted __le16
>> fs/ntfs/namei.c:93:32: sparse: sparse: cast to restricted __le16
>> fs/ntfs/namei.c:93:32: sparse: sparse: cast to restricted __le16
   fs/ntfs/namei.c:651:59: sparse: sparse: restricted __le16 degrades to integer
>> fs/ntfs/namei.c:761:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfs/namei.c:761:48: sparse:     expected unsigned short const *wc
   fs/ntfs/namei.c:761:48: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfs/namei.c:1025:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfs/namei.c:1025:48: sparse:     expected unsigned short const *wc
   fs/ntfs/namei.c:1025:48: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfs/namei.c:1069:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfs/namei.c:1069:48: sparse:     expected unsigned short const *wc
   fs/ntfs/namei.c:1069:48: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfs/namei.c:1111:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfs/namei.c:1111:48: sparse:     expected unsigned short const *wc
   fs/ntfs/namei.c:1111:48: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfs/namei.c:1197:67: sparse: sparse: restricted __le16 degrades to integer
>> fs/ntfs/namei.c:1274:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname_new @@
   fs/ntfs/namei.c:1274:48: sparse:     expected unsigned short const *wc
   fs/ntfs/namei.c:1274:48: sparse:     got restricted __le16 [usertype] *[addressable] uname_new
>> fs/ntfs/namei.c:1420:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] usrc @@
   fs/ntfs/namei.c:1420:48: sparse:     expected unsigned short const *wc
   fs/ntfs/namei.c:1420:48: sparse:     got restricted __le16 [usertype] *[addressable] usrc
   fs/ntfs/namei.c:1476:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfs/namei.c:1476:48: sparse:     expected unsigned short const *wc
   fs/ntfs/namei.c:1476:48: sparse:     got restricted __le16 [usertype] *[addressable] uname
--
   fs/ntfs/debug.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/runlist.h, fs/ntfs/debug.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/logfile.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h, fs/ntfs/attrib.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/mft.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/aops.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/mft.c:40:15: sparse: sparse: restricted __le16 degrades to integer
--
   fs/ntfs/iomap.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/aops.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/iomap.c:278:30: sparse: sparse: symbol 'ntfs_zero_iomap_folio_ops' was not declared. Should it be static?
>> fs/ntfs/iomap.c:291:24: sparse: sparse: symbol 'ntfs_zero_read_iomap_ops' was not declared. Should it be static?
--
   fs/ntfs/quota.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h, fs/ntfs/attrib.h, fs/ntfs/index.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/index.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/collate.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/index.c:57:45: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfs/index.c:58:23: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfs/index.c:59:23: sparse: sparse: restricted __le16 degrades to integer
--
   fs/ntfs/lcnalloc.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h, fs/ntfs/attrib.h, fs/ntfs/lcnalloc.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/compress.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h, fs/ntfs/attrib.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfs/inode.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h, fs/ntfs/attrib.h, fs/ntfs/lcnalloc.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
   fs/ntfs/inode.c: note: in included file (through arch/arc/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/lock.h, ...):
   arch/arc/include/asm/atomic-spinlock.h:81:1: sparse: sparse: context imbalance in 'ntfs_drop_big_inode' - unexpected unlock
--
   fs/ntfs/attrib.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h, fs/ntfs/attrib.h):
>> fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/attrib.c:5281:71: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] value_length @@     got restricted __le64 [usertype] @@
   fs/ntfs/attrib.c:5281:71: sparse:     expected restricted __le32 [usertype] value_length
   fs/ntfs/attrib.c:5281:71: sparse:     got restricted __le64 [usertype]

vim +271 fs/ntfs/layout.h

2e08584e63de4c Namjae Jeon 2025-12-30  261  
2e08584e63de4c Namjae Jeon 2025-12-30  262  /*
2e08584e63de4c Namjae Jeon 2025-12-30  263   * These are the so far known MFT_RECORD_* flags (16-bit) which contain
2e08584e63de4c Namjae Jeon 2025-12-30  264   * information about the mft record in which they are present.
2e08584e63de4c Namjae Jeon 2025-12-30  265   */
2e08584e63de4c Namjae Jeon 2025-12-30  266  enum {
2e08584e63de4c Namjae Jeon 2025-12-30  267  	MFT_RECORD_IN_USE		= cpu_to_le16(0x0001),
2e08584e63de4c Namjae Jeon 2025-12-30  268  	MFT_RECORD_IS_DIRECTORY		= cpu_to_le16(0x0002),
9f7816a38c2289 Namjae Jeon 2026-01-09  269  	MFT_RECORD_IS_4			= cpu_to_le16(0x0004),
9f7816a38c2289 Namjae Jeon 2026-01-09  270  	MFT_RECORD_IS_VIEW_INDEX	= cpu_to_le16(0x0008),
9f7816a38c2289 Namjae Jeon 2026-01-09 @271  	MFT_REC_SPACE_FILLER		= 0xffff, /*Just to make flags 16-bit.*/
9f7816a38c2289 Namjae Jeon 2026-01-09  272  } __packed;
2e08584e63de4c Namjae Jeon 2025-12-30  273  

:::::: The code at line 271 was first introduced by commit
:::::: 9f7816a38c22890919742f435a4215280a12df6e ntfs: update in-memory, on-disk structures and headers

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
