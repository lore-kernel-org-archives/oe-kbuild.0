Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71E941C63
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 01:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769217037; cv=none; b=ue4D084i/BloZ9kcaQ7NHfQNdhAlYwuzNtBGjZtQ+8XbQ61AgH+pifzZUOkxvq/Azab0YV0EAHhxpXiqPEQY55+FX5XjR4GFoJCiutmUUDWWWtJyTmLeY0rvcvMuXjWFUbI7I03yA80mcThRqxSA8K1daIXj+/7x8vZoRg+yGH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769217037; c=relaxed/simple;
	bh=MST/Af+lggYP9+3nVN3nsNiAe3PGsDWDsYAfZHiqHtQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RgItqUeSX2CNs5kOsdEZoEsb798sNd8h++4SslpNW8FUeWgm0LkmirUUc4lJLtTYGe2PqsJkLs8qB40wSp2Qvu8cyyN6EoRvQN8nAEFfXREjwn4tn4t8W24qK6bWG+VFdoOpb/mQTku5Z2EP8ZN8H4W/FLSEYp6GoIQaWYRL3bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TruhZ03U; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TruhZ03U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769217035; x=1800753035;
  h=date:from:to:cc:subject:message-id;
  bh=MST/Af+lggYP9+3nVN3nsNiAe3PGsDWDsYAfZHiqHtQ=;
  b=TruhZ03UKT0KA5MN7DZVpiz1uei2OYJZF4BcSscbmuVBiMQqOPUJaNqp
   O+XsWdOIH9BoWJ1hOOCnnidE2zlD9A5AWVU9h2lRUjNf1GmvN0Nsee3pu
   +7z3dxflk0vqy34OwE4oRqEu5pAAZTC+7bKT25UGBEI7TR/MV/OfLO8OE
   CQSsWGAWkNVuW/EFUeAL8H9q2RZ5CAUh+A5LR16Pbd3EVkk1QUNvMGfi6
   DhYRB0g+tFRpayL110B1rhxCpm4lbB9GjPIQQWWFKZ4A/N1x/WXpyBV7H
   KPsZWN/ezZh33p3RY+6NtIPFbTZVdH3T77q0mBnoP89JxV9/MJv90PD5o
   A==;
X-CSE-ConnectionGUID: 48mgeCYgTvizPqU3z3zCGg==
X-CSE-MsgGUID: 3PvjADBpSdu9ykWkSQnNig==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74103945"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="74103945"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 17:10:35 -0800
X-CSE-ConnectionGUID: RU8qY6waRI2eh3cZ4svcaA==
X-CSE-MsgGUID: 4MvYY/D1SQmQmm919sv7AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207073671"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2026 17:10:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjSAZ-00000000Udu-3PMl;
	Sat, 24 Jan 2026 01:10:31 +0000
Date: Sat, 24 Jan 2026 09:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:scrub-syzbot-fixes-7.0 11/44]
 include/net/sock.h:1918:2: error: missing initializer for field 'dmabuf_id'
 of 'struct sockcm_cookie'
Message-ID: <202601240921.UDfaOg45-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git scrub-syzbot-fixes-7.0
head:   2d76e519f5fa0d3323cdd2ce3404fc19e6c23f3d
commit: c45a0220071a896d5492a1b839c518327df54f9f [11/44] fs: turn on more warnings for the filesystem code we modify most
:::::: branch date: 8 hours ago
:::::: commit date: 5 days ago
config: xtensa-randconfig-r073-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240921.UDfaOg45-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240921.UDfaOg45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240921.UDfaOg45-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/net/inet_sock.h:23,
                    from include/net/ip.h:29,
                    from include/net/busy_poll.h:18,
                    from fs/select.c:33:
   include/net/sock.h: In function 'sockcm_init':
>> include/net/sock.h:1918:2: error: missing initializer for field 'dmabuf_id' of 'struct sockcm_cookie' [-Werror=missing-field-initializers]
     };
     ^
   include/net/sock.h:1908:6: note: 'dmabuf_id' declared here
     u32 dmabuf_id;
         ^~~~~~~~~
   In file included from include/net/inetpeer.h:16,
                    from include/net/route.h:24,
                    from include/net/ip.h:30,
                    from include/net/busy_poll.h:18,
                    from fs/select.c:33:
   include/net/ipv6.h: In function 'ipcm6_init_sk':
>> include/net/ipv6.h:376:2: error: missing initializer for field 'opt' of 'struct ipcm6_cookie' [-Werror=missing-field-initializers]
     };
     ^
   include/net/ipv6.h:366:25: note: 'opt' declared here
     struct ipv6_txoptions *opt;
                            ^~~
   In file included from include/net/busy_poll.h:18,
                    from fs/select.c:33:
   include/net/ip.h: In function 'ipcm_init_sk':
>> include/net/ip.h:98:2: error: missing initializer for field 'gso_size' of 'struct ipcm_cookie' [-Werror=missing-field-initializers]
     };
     ^
   include/net/ip.h:85:10: note: 'gso_size' declared here
     __u16   gso_size;
             ^~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from fs/file.c:24:
   include/net/sock.h: In function 'sockcm_init':
>> include/net/sock.h:1918:2: error: missing initializer for field 'dmabuf_id' of 'struct sockcm_cookie' [-Werror=missing-field-initializers]
     };
     ^
   include/net/sock.h:1908:6: note: 'dmabuf_id' declared here
     u32 dmabuf_id;
         ^~~~~~~~~
   cc1: all warnings being treated as errors
--
>> fs/namespace.c:5967:2: error: missing initializer for field 'mnt_last_node' of 'struct <anonymous>' [-Werror=missing-field-initializers]
     .poll  = __WAIT_QUEUE_HEAD_INITIALIZER(init_mnt_ns.poll),
     ^
   In file included from fs/pnode.h:11,
                    from fs/namespace.c:38:
   fs/mount.h:15:19: note: 'mnt_last_node' declared here
      struct rb_node *mnt_last_node;  /* last (rightmost) mount in the rbtree */
                      ^~~~~~~~~~~~~
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/xtensa/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:85,
                    from fs/namespace.c:11:
   fs/namespace.c: In function 'do_mount_setattr':
   include/linux/compiler.h:69:32: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
      (__if_trace.miss_hit[1]++,1) :  \
                                   ^
   fs/namespace.c:4683:6: note: 'err' was declared here
     int err;
         ^~~
   cc1: all warnings being treated as errors
--
   fs/kernel_read_file.c: In function 'kernel_read_file':
>> fs/kernel_read_file.c:123:27: warning: 'copied' may be used uninitialized in this function [-Wmaybe-uninitialized]
     return ret == 0 ? copied : ret;
            ~~~~~~~~~~~~~~~~~~^~~~~
--
   fs/mpage.c: In function 'mpage_write_folio':
>> fs/mpage.c:601:40: warning: 'first_block' may be used uninitialized in this function [-Wmaybe-uninitialized]
      bio->bi_iter.bi_sector = first_block << (blkbits - 9);
                               ~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   fs/mpage.c: In function 'do_mpage_readpage':
   fs/mpage.c:306:60: warning: 'first_block' may be used uninitialized in this function [-Wmaybe-uninitialized]
      args->last_block_in_bio = first_block + blocks_per_folio - 1;
                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
--
   fs/binfmt_misc.c: In function 'bm_fill_super':
>> fs/binfmt_misc.c:934:18: error: missing initializer for field 'ops' of 'const struct tree_descr' [-Werror=missing-field-initializers]
      /* last one */ {""}
                     ^
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1268,
                    from include/linux/pagemap.h:8,
                    from fs/binfmt_misc.c:23:
   include/linux/fs.h:3228:69: note: 'ops' declared here
    struct tree_descr { const char *name; const struct file_operations *ops; int mode; };
                                                                        ^~~
   cc1: all warnings being treated as errors
--
   mm/vmscan.c: In function '__remove_mapping':
>> mm/vmscan.c:761:3: warning: 'ci' may be used uninitialized in this function [-Wmaybe-uninitialized]
      __swap_cache_del_folio(ci, folio, swap, shadow);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   mm/memory.c: In function 'do_swap_page':
>> mm/memory.c:4985:2: warning: 'nr_pages' may be used uninitialized in this function [-Wmaybe-uninitialized]
     folio_ref_add(folio, nr_pages - 1);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/pgtable-generic.c:16:
   include/linux/iommu.h: In function 'iommu_iotlb_gather_init':
>> include/linux/iommu.h:897:2: error: missing initializer for field 'queued' of 'struct iommu_iotlb_gather' [-Werror=missing-field-initializers]
     };
     ^
   include/linux/iommu.h:363:9: note: 'queued' declared here
     bool   queued;
            ^~~~~~
   cc1: all warnings being treated as errors
--
   In file included from mm/init-mm.c:13:
   include/linux/iommu.h: In function 'iommu_iotlb_gather_init':
>> include/linux/iommu.h:897:2: error: missing initializer for field 'queued' of 'struct iommu_iotlb_gather' [-Werror=missing-field-initializers]
     };
     ^
   include/linux/iommu.h:363:9: note: 'queued' declared here
     bool   queued;
            ^~~~~~
   mm/init-mm.c: At top level:
>> mm/init-mm.c:40:2: error: missing initializer for field 'start_code' of 'struct <anonymous>' [-Werror=missing-field-initializers]
     .arg_lock =  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
     ^
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1207:17: note: 'start_code' declared here
      unsigned long start_code, end_code, start_data, end_data;
                    ^~~~~~~~~~
   mm/init-mm.c:41:2: error: missing initializer for field 'start_code' of 'struct <anonymous>' [-Werror=missing-field-initializers]
     .mmlist  = LIST_HEAD_INIT(init_mm.mmlist),
     ^
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1207:17: note: 'start_code' declared here
      unsigned long start_code, end_code, start_data, end_data;
                    ^~~~~~~~~~
   cc1: all warnings being treated as errors
--
   mm/memblock.c: In function 'memblock_add_range.isra.19':
>> mm/memblock.c:709:3: warning: 'end_rgn' may be used uninitialized in this function [-Wmaybe-uninitialized]
      memblock_merge_regions(type, start_rgn, end_rgn);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +1918 include/net/sock.h

f28ea365cdefc3 Edward Jee       2015-10-08  1910  
657a0667025e77 Willem de Bruijn 2018-07-06  1911  static inline void sockcm_init(struct sockcm_cookie *sockc,
657a0667025e77 Willem de Bruijn 2018-07-06  1912  			       const struct sock *sk)
657a0667025e77 Willem de Bruijn 2018-07-06  1913  {
e3390b30a5dfb1 Eric Dumazet     2023-08-31  1914  	*sockc = (struct sockcm_cookie) {
6ad861519a69ec Willem de Bruijn 2025-02-14  1915  		.mark = READ_ONCE(sk->sk_mark),
a32f3e9d1ed146 Anna Emese Nyiri 2024-12-13  1916  		.tsflags = READ_ONCE(sk->sk_tsflags),
a32f3e9d1ed146 Anna Emese Nyiri 2024-12-13  1917  		.priority = READ_ONCE(sk->sk_priority),
e3390b30a5dfb1 Eric Dumazet     2023-08-31 @1918  	};
657a0667025e77 Willem de Bruijn 2018-07-06  1919  }
657a0667025e77 Willem de Bruijn 2018-07-06  1920  

:::::: The code at line 1918 was first introduced by commit
:::::: e3390b30a5dfb112e8e802a59c0f68f947b638b2 net: annotate data-races around sk->sk_tsflags

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
