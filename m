Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876321D516F
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Nov 2025 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762091748; cv=none; b=Ha6cJanweJN9/ydRlDXDbzP17XrjmxXfxZqIxLDYy5cWw8dJ6nLsbyOyDTsv7KhwAZpFLiJJgSkj6oti8kQRnAwVtvQb/afpjsiO8gM1Ne8IDmxbLx9WIFgFLS2FPND2056XBOre9zLXesP4jKLQassAAnpmzVeA/tUflbI7QTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762091748; c=relaxed/simple;
	bh=xv3oM47lAmRPpwaMd0dmr3NwJHiXhIIWzUl5uehLNL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KS7YmmyVs3tiOacRa0wEx4Qte0pm2IGBMHt/QP8EBvDnu7zouSNUx+lRRMrfywVU6zLz88yfcgdhcym3IpbL/pWlcfgtZ7hlKsjiDTS3aMH3dvBUFJzcfzcBr8Vg8b7khyZRW49xRKkRmtgqVzf4jfFzkJv10y19C14gP/AQPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hb3HLH5c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hb3HLH5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762091746; x=1793627746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xv3oM47lAmRPpwaMd0dmr3NwJHiXhIIWzUl5uehLNL4=;
  b=hb3HLH5cZJbrKzp/bXCSy/jHslDpXcVBP2U4Kyn0Czf0DA5Pxd+wHboL
   Y7iU2QWge8GvvferWQ1LRX4jPAJZGedpCbfnF2mlX8xsZNtwnYZmW1lNn
   z9wOTdyxZU5VxyGOR65D0LKQ+Ut5W05QNLgG/D3npSMeQQe8416QEMwCM
   JseaaRjkYta+E8kk5aHZnZp7v8nbWBdaeUm0vwzanOv8TmvATqQuET8uX
   2zBoG8P7PWu48Q2yK9ea/9PAmY/pHclyosoU59XAA2SRNq5sdr8uaP0GB
   M0e73OqmH6yc7BgZJ/Zus/6BkoSSk6D+y75A/upEeMwSFKchTfJDVaeFX
   A==;
X-CSE-ConnectionGUID: FInpgx8TS06GHddjTLB7Pg==
X-CSE-MsgGUID: KoWH15PGRzGxEXSS7zq+xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75299687"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="75299687"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 05:55:45 -0800
X-CSE-ConnectionGUID: 5Kf+m0M0Rmmojd27NGvryg==
X-CSE-MsgGUID: TR3pQ880QLGZYAWa6hDkpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="186331063"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Nov 2025 05:55:44 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFYXW-000PHF-39;
	Sun, 02 Nov 2025 13:55:16 +0000
Date: Sun, 2 Nov 2025 21:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linkinjeon-ntfs:ntfs-next 11/11] fs/ntfsplus/layout.h:270:43:
 sparse: sparse: mixed bitwiseness
Message-ID: <202511022137.0RQ1zjOx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   823d97fda02f76457c2e14196ebe718b9601f40c
commit: 823d97fda02f76457c2e14196ebe718b9601f40c [11/11] ntfsplus: add Kconfig and Makefile
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: um-randconfig-r133-20251102 (https://download.01.org/0day-ci/archive/20251102/202511022137.0RQ1zjOx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511022137.0RQ1zjOx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511022137.0RQ1zjOx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/ntfsplus/aops.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/aops.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
   fs/ntfsplus/aops.c:44:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int opf @@
   fs/ntfsplus/aops.c:44:45: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/ntfsplus/aops.c:44:45: sparse:     got unsigned int opf
   fs/ntfsplus/aops.c:219:59: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t @@
   fs/ntfsplus/aops.c:219:59: sparse:     expected unsigned int opf
   fs/ntfsplus/aops.c:219:59: sparse:     got restricted blk_opf_t
--
   fs/ntfsplus/collate.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/collate.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/misc.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/runlist.h, fs/ntfsplus/misc.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/attrib.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h, fs/ntfsplus/attrib.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/attrib.c:5266:71: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] value_length @@     got restricted __le64 [usertype] @@
   fs/ntfsplus/attrib.c:5266:71: sparse:     expected restricted __le32 [usertype] value_length
   fs/ntfsplus/attrib.c:5266:71: sparse:     got restricted __le64 [usertype]
--
   fs/ntfsplus/file.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h, fs/ntfsplus/attrib.h, fs/ntfsplus/lcnalloc.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/dir.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/runlist.h, fs/ntfsplus/misc.h, fs/ntfsplus/inode.h, ...):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/dir.c:926:32: sparse: sparse: invalid assignment: +=
   fs/ntfsplus/dir.c:926:32: sparse:    left side has type long long
   fs/ntfsplus/dir.c:926:32: sparse:    right side has type restricted __le16
   fs/ntfsplus/dir.c:1004:24: sparse: sparse: invalid assignment: +=
   fs/ntfsplus/dir.c:1004:24: sparse:    left side has type long long
   fs/ntfsplus/dir.c:1004:24: sparse:    right side has type restricted __le16
>> fs/ntfsplus/dir.c:1065:37: sparse: sparse: restricted __le32 degrades to integer
--
   fs/ntfsplus/index.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/collate.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/index.c:57:45: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfsplus/index.c:58:23: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfsplus/index.c:59:23: sparse: sparse: restricted __le16 degrades to integer
--
   fs/ntfsplus/inode.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h, fs/ntfsplus/attrib.h, fs/ntfsplus/lcnalloc.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
   fs/ntfsplus/inode.c:3626:59: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t @@
   fs/ntfsplus/inode.c:3626:59: sparse:     expected unsigned int opf
   fs/ntfsplus/inode.c:3626:59: sparse:     got restricted blk_opf_t
   fs/ntfsplus/inode.c:392:43: sparse: sparse: context imbalance in 'ntfs_drop_big_inode' - unexpected unlock
--
   fs/ntfsplus/mft.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/aops.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
   fs/ntfsplus/mft.c:40:15: sparse: sparse: restricted __le16 degrades to integer
   fs/ntfsplus/mft.c:489:35: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t @@
   fs/ntfsplus/mft.c:489:35: sparse:     expected unsigned int opf
   fs/ntfsplus/mft.c:489:35: sparse:     got restricted blk_opf_t
   fs/ntfsplus/mft.c:626:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t @@
   fs/ntfsplus/mft.c:626:43: sparse:     expected unsigned int opf
   fs/ntfsplus/mft.c:626:43: sparse:     got restricted blk_opf_t
--
   fs/ntfsplus/mst.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/unistr.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/unistr.c:241:53: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] ucs @@
   fs/ntfsplus/unistr.c:241:53: sparse:     expected unsigned short [usertype] *pwcs
   fs/ntfsplus/unistr.c:241:53: sparse:     got restricted __le16 [usertype] *[assigned] ucs
--
   fs/ntfsplus/namei.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
   fs/ntfsplus/namei.c:688:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:688:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:688:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:948:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:948:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:948:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:992:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:992:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:992:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:1034:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:1034:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1034:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:1196:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname_new @@
   fs/ntfsplus/namei.c:1196:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1196:35: sparse:     got restricted __le16 [usertype] *[addressable] uname_new
   fs/ntfsplus/namei.c:1342:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] usrc @@
   fs/ntfsplus/namei.c:1342:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1342:35: sparse:     got restricted __le16 [usertype] *[addressable] usrc
   fs/ntfsplus/namei.c:1398:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:1398:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1398:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
--
   fs/ntfsplus/attrlist.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/runlist.h, fs/ntfsplus/misc.h, fs/ntfsplus/inode.h, ...):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/runlist.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/runlist.h, fs/ntfsplus/misc.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/runlist.c:708:63: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/ntfsplus/runlist.c:708:13: sparse: signed value source
--
   fs/ntfsplus/ea.c: note: in included file:
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/ea.c:30:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le32 [usertype] type @@     got int type @@
   fs/ntfsplus/ea.c:30:43: sparse:     expected restricted __le32 [usertype] type
   fs/ntfsplus/ea.c:30:43: sparse:     got int type
>> fs/ntfsplus/ea.c:127:24: sparse: sparse: cast to restricted __le16
>> fs/ntfsplus/ea.c:127:24: sparse: sparse: cast from restricted __le32
   fs/ntfsplus/ea.c:210:33: sparse: sparse: cast to restricted __le16
   fs/ntfsplus/ea.c:210:33: sparse: sparse: cast from restricted __le32
>> fs/ntfsplus/ea.c:261:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] ea_query_length @@     got restricted __le16 [usertype] @@
   fs/ntfsplus/ea.c:261:44: sparse:     expected restricted __le32 [usertype] ea_query_length
   fs/ntfsplus/ea.c:261:44: sparse:     got restricted __le16 [usertype]
>> fs/ntfsplus/ea.c:263:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfsplus/ea.c:263:41: sparse:     expected int type
   fs/ntfsplus/ea.c:263:41: sparse:     got restricted __le32
   fs/ntfsplus/ea.c:268:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfsplus/ea.c:268:41: sparse:     expected int type
   fs/ntfsplus/ea.c:268:41: sparse:     got restricted __le32
   fs/ntfsplus/ea.c:323:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfsplus/ea.c:323:41: sparse:     expected int type
   fs/ntfsplus/ea.c:323:41: sparse:     got restricted __le32
   fs/ntfsplus/ea.c:329:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int type @@     got restricted __le32 @@
   fs/ntfsplus/ea.c:329:33: sparse:     expected int type
   fs/ntfsplus/ea.c:329:33: sparse:     got restricted __le32
   fs/ntfsplus/ea.c:457:25: sparse: sparse: cast to restricted __le16
   fs/ntfsplus/ea.c:457:25: sparse: sparse: cast from restricted __le32
--
   fs/ntfsplus/super.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/runlist.h, fs/ntfsplus/misc.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/bitmap.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/aops.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/lcnalloc.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h, fs/ntfsplus/attrib.h, fs/ntfsplus/lcnalloc.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/logfile.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h, fs/ntfsplus/attrib.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/upcase.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/runlist.h, fs/ntfsplus/misc.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
   fs/ntfsplus/upcase.c:60:15: sparse: sparse: memset with byte count of 131072
--
   fs/ntfsplus/reparse.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/ntfs_iomap.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/aops.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
--
   fs/ntfsplus/compress.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h, fs/ntfsplus/attrib.h):
>> fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/compress.c:1426:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t @@
   fs/ntfsplus/compress.c:1426:51: sparse:     expected unsigned int opf
   fs/ntfsplus/compress.c:1426:51: sparse:     got restricted blk_opf_t

vim +270 fs/ntfsplus/layout.h

38bc68f2634dac Namjae Jeon 2025-10-17  260  
38bc68f2634dac Namjae Jeon 2025-10-17  261  /*
38bc68f2634dac Namjae Jeon 2025-10-17  262   * These are the so far known MFT_RECORD_* flags (16-bit) which contain
38bc68f2634dac Namjae Jeon 2025-10-17  263   * information about the mft record in which they are present.
38bc68f2634dac Namjae Jeon 2025-10-17  264   */
38bc68f2634dac Namjae Jeon 2025-10-17  265  enum {
38bc68f2634dac Namjae Jeon 2025-10-17  266  	MFT_RECORD_IN_USE		= cpu_to_le16(0x0001),
38bc68f2634dac Namjae Jeon 2025-10-17  267  	MFT_RECORD_IS_DIRECTORY		= cpu_to_le16(0x0002),
38bc68f2634dac Namjae Jeon 2025-10-17  268  	MFT_RECORD_IS_4			= cpu_to_le16(0x0004),
38bc68f2634dac Namjae Jeon 2025-10-17  269  	MFT_RECORD_IS_VIEW_INDEX	= cpu_to_le16(0x0008),
38bc68f2634dac Namjae Jeon 2025-10-17 @270  	MFT_REC_SPACE_FILLER		= 0xffff, /*Just to make flags 16-bit.*/
38bc68f2634dac Namjae Jeon 2025-10-17  271  } __packed;
38bc68f2634dac Namjae Jeon 2025-10-17  272  

:::::: The code at line 270 was first introduced by commit
:::::: 38bc68f2634daccb0b4884259ba52ca8b4b2c3a4 ntfsplus: in-memory, on-disk structures and headers

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
