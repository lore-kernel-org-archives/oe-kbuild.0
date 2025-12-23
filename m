Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D63819C54E
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766476693; cv=none; b=ohzOVh7Q6RnQPj4uMtUAsdbfQRh45v/ReMPqTnhkngYO2KxvowzzNxaUPl9ccijmDs8fDuATbrhz//zKSyUccPphTyc8uDn09yeZr64TSxv1/4C4relSsT9xbHoVo/QYx/Tn/8NHp/pBz+4S2ARkTCufjwPeKhpjoo488XpVnpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766476693; c=relaxed/simple;
	bh=8UebO+JZ+WtPNM6EBOu8n1tMCgSWhTFmvutRQ1QJgSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WelsuiJ0ZO0T2qwvSIJe5pl0rrmjdCowC5lGr84gOa+3voBsbd+nvdOuRDSfdHrkjnm8A7cBXdrYHfQuVPdhNmTACI8gmL6w63aJCa19MDfhHeFyxxqUNoW2yT/FidC85K83iTE/XN5+SEpmoXHXGiZq/PB+eO+DxV0vVmwAtC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiKcJxSa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiKcJxSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766476692; x=1798012692;
  h=date:from:to:cc:subject:message-id;
  bh=8UebO+JZ+WtPNM6EBOu8n1tMCgSWhTFmvutRQ1QJgSk=;
  b=CiKcJxSaSrJcXUUwmFMM/dBiFX2g94tfLzniCmcwDGRwydWIolpm0dw+
   f7QrMuGDI6nhgRRy8zH+f0SAe26b16ohVDAgJgvu3o8cmLFcT74ciNkMU
   iRI/Drqs5tNB2LoeznAPLJ4xtal/+wLWZ7UEySDDTCgqFkRi9FbEpcJdY
   TnXIUYXverMwI6LOtwjU6PercsAj2pEsXZ99CEwl97ZewbEO8GQR9bv9k
   q4abBvufA77xDlpFOXNLv3FQERUZdBJf5TqWbZrkAyBU4F7GxWfwHG9D3
   qmI7BFSWEY6qqfyFV2MD4pjOpbtIV96AWwhDTGnr2JMmwxExHRcXtFX8s
   Q==;
X-CSE-ConnectionGUID: 7uhLMNiHTPKd76rnU8MdsQ==
X-CSE-MsgGUID: 3EUVhiQHQRioz0GAvPpvGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78641838"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="78641838"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:58:07 -0800
X-CSE-ConnectionGUID: kNe9Z9s6Q3qv/xUIb2A3+w==
X-CSE-MsgGUID: ri3KEzcxR5Of74mNV1Klsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199751972"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 23:58:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXxHP-000000001cX-0vzu;
	Tue, 23 Dec 2025 07:58:03 +0000
Date: Tue, 23 Dec 2025 15:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/accessors.h:66:16: warning: 'inode_item' may be
 used uninitialized
Message-ID: <202512231533.cp9wEJws-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: 2ac70946621ff3d90eb84d2e3b74563f4154f24c btrfs: add current log leaf, key and slot to struct walk_control
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-r112-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231533.cp9wEJws-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231533.cp9wEJws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512231533.cp9wEJws-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/ctree.h:21,
                    from fs/btrfs/tree-log.c:12:
   In function 'btrfs_inode_mode',
       inlined from 'replay_one_buffer' at fs/btrfs/tree-log.c:2649:11:
>> fs/btrfs/accessors.h:66:16: warning: 'inode_item' may be used uninitialized [-Wmaybe-uninitialized]
      66 |         return btrfs_get_##bits(eb, s, offsetof(type, member));         \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/accessors.h:270:1: note: in expansion of macro 'BTRFS_SETGET_FUNCS'
     270 | BTRFS_SETGET_FUNCS(inode_mode, struct btrfs_inode_item, mode, 32);
         | ^~~~~~~~~~~~~~~~~~
   fs/btrfs/tree-log.c: In function 'replay_one_buffer':
   fs/btrfs/tree-log.c:2607:42: note: 'inode_item' was declared here
    2607 |                 struct btrfs_inode_item *inode_item;
         |                                          ^~~~~~~~~~


vim +/inode_item +66 fs/btrfs/accessors.h

07e81dc94474eb6 Josef Bacik  2022-10-19  60  
07e81dc94474eb6 Josef Bacik  2022-10-19  61  #define BTRFS_SETGET_FUNCS(name, type, member, bits)			\
07e81dc94474eb6 Josef Bacik  2022-10-19  62  static inline u##bits btrfs_##name(const struct extent_buffer *eb,	\
07e81dc94474eb6 Josef Bacik  2022-10-19  63  				   const type *s)			\
07e81dc94474eb6 Josef Bacik  2022-10-19  64  {									\
98efb4eb310d0d7 David Sterba 2023-07-13  65  	static_assert(sizeof(u##bits) == sizeof_field(type, member));	\
07e81dc94474eb6 Josef Bacik  2022-10-19 @66  	return btrfs_get_##bits(eb, s, offsetof(type, member));		\
07e81dc94474eb6 Josef Bacik  2022-10-19  67  }									\
07e81dc94474eb6 Josef Bacik  2022-10-19  68  static inline void btrfs_set_##name(const struct extent_buffer *eb, type *s, \
07e81dc94474eb6 Josef Bacik  2022-10-19  69  				    u##bits val)			\
07e81dc94474eb6 Josef Bacik  2022-10-19  70  {									\
98efb4eb310d0d7 David Sterba 2023-07-13  71  	static_assert(sizeof(u##bits) == sizeof_field(type, member));	\
07e81dc94474eb6 Josef Bacik  2022-10-19  72  	btrfs_set_##bits(eb, s, offsetof(type, member), val);		\
07e81dc94474eb6 Josef Bacik  2022-10-19  73  }
07e81dc94474eb6 Josef Bacik  2022-10-19  74  

:::::: The code at line 66 was first introduced by commit
:::::: 07e81dc94474eb62705c6f96d9ab1a5a797b8703 btrfs: move accessor helpers into accessors.h

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
