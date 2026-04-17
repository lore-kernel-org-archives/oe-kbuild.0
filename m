Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E125783C
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 07:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409792; cv=none; b=eP+aMAcDRVRgs5sH32ypg+WIzFPf5yovszeTQJV6q4LGdFGrliJnZXy2BQkzp0j9A/3eSiZIVqKF1P9WCEf7Lm04jEnyF6L+3phszS8p97ke4KLXwQFf1qJ2ke9N7cvL33/9/MKMh/N0qDZYhrtNOCyENgox9WNP1sN2C68aYH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409792; c=relaxed/simple;
	bh=nSK5PgfQdffgLtmLnw3zYljvDPm18vyPJoadLQF8pIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z/HlbbaZfMKjYhZ2caO9rudFbBErJ2m+u12iEu7ao407+yEJlBT5GTMOtNFlBR8iOMY/cKpLFrte9tH/dpZ5xl4lnVDc2angVqTgmqxDqYWhvZoLeP5ZsQLwy12/CdmjjsbImiTLZHxSrKrZnZK+T3o0ult8IEk1nhovq3vUBS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5msPAai; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5msPAai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776409791; x=1807945791;
  h=date:from:to:cc:subject:message-id;
  bh=nSK5PgfQdffgLtmLnw3zYljvDPm18vyPJoadLQF8pIQ=;
  b=Z5msPAaioluMRjOkTdCGmPCKeWMd7saus4IINYweMzD4xKU2JudhTLHX
   jt86h6xg0xbKXFxuQM1YorZpbgFlbGd33JdUfkfQR4rChm8qEKwFWVvw9
   R6xsG7cdTSbUh/K6b98YxdTE+kCT+r1k3skNV4TFlysyhssgjGEDXkniw
   OFERSEWWgBYMBzzRhMfQr553NbbPnHD2cfnd0Camuzb0JRNHhk1vnqtob
   hqCH1frz1qcpIawKGrsVtNpbd0+EKeJDy4maXafnF3Tg1Mx+tKdJFfFRF
   IiZlXs80yXefg0LnypxdWbK25QLMdd/51Du6wUIVPLUVrk8BRlzlaJW7Q
   Q==;
X-CSE-ConnectionGUID: S1wNuJHSQDmWaUGauRnDYw==
X-CSE-MsgGUID: 6gjOx3mlSkuKL0nK0Lvi0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88041380"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="88041380"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:09:50 -0700
X-CSE-ConnectionGUID: XcxQNcynRYCXb41Bc6grlw==
X-CSE-MsgGUID: UskVsgvxTHmEkeHc/ygk6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="261364259"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Apr 2026 00:09:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDdKk-000000001G9-3aXA;
	Fri, 17 Apr 2026 07:09:46 +0000
Date: Fri, 17 Apr 2026 09:09:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dhowells-fs:netfs-fixes 16/17]
 ./include/linux/netfs.h:672:16: error: 'return' with a value, in function
 returning void
Message-ID: <202604170912.M1MOxC0W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   4c19270470672503e0afd6a22670101e996dcfef
commit: 3d901ae326a1f6bede82f322bcfce2dda4ef8564 [16/17] netfs: Fix potential for tearing in ->remote_i_size and ->zero_point
:::::: branch date: 10 hours ago
:::::: commit date: 15 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260417/202604170912.M1MOxC0W-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170912.M1MOxC0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604170912.M1MOxC0W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/fscache.h:18,
                    from ./include/linux/fscache-cache.h:17,
                    from lib/debug_info.c:13:
   ./include/linux/netfs.h: In function 'netfs_read_sizes':
>> ./include/linux/netfs.h:672:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     672 |         return zero_point;
         |                ^~~~~~~~~~
   ./include/linux/netfs.h:659:20: note: declared here
     659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
         |                    ^~~~~~~~~~~~~~~~
--
   In file included from ./include/linux/fscache.h:18,
                    from fs/nfs/fscache.h:15,
                    from fs/nfs/nfs4proc.c:69:
   ./include/linux/netfs.h: In function 'netfs_read_sizes':
>> ./include/linux/netfs.h:672:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     672 |         return zero_point;
         |                ^~~~~~~~~~
   ./include/linux/netfs.h:659:20: note: declared here
     659 | static inline void netfs_read_sizes(const struct netfs_inode *ictx,
         |                    ^~~~~~~~~~~~~~~~
   fs/nfs/nfs4proc.c: In function 'nfs4_proc_create_session':
   fs/nfs/nfs4proc.c:9244:19: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    9244 |         unsigned *ptr;
         |                   ^~~


vim +/return +672 ./include/linux/netfs.h

3d901ae326a1f6 David Howells 2026-04-16  641  
3d901ae326a1f6 David Howells 2026-04-16  642  /**
3d901ae326a1f6 David Howells 2026-04-16  643   * netfs_read_sizes - Read remote_i_size and zero_point safely
3d901ae326a1f6 David Howells 2026-04-16  644   * @ictx: The inode context to access
3d901ae326a1f6 David Howells 2026-04-16  645   * @remote_i_size: Where to return the size of the file on the server
3d901ae326a1f6 David Howells 2026-04-16  646   * @zero_point: Where to return the the point beyond which the server has no data
3d901ae326a1f6 David Howells 2026-04-16  647   *
3d901ae326a1f6 David Howells 2026-04-16  648   * Read remote_i_size and zero_point safely without the potential for tearing
3d901ae326a1f6 David Howells 2026-04-16  649   * on 32-bit arches.
3d901ae326a1f6 David Howells 2026-04-16  650   *
3d901ae326a1f6 David Howells 2026-04-16  651   * NOTE: in a 32bit arch with a preemptable kernel and an UP compile the
3d901ae326a1f6 David Howells 2026-04-16  652   * i_size_read/write must be atomic with respect to the local cpu (unlike with
3d901ae326a1f6 David Howells 2026-04-16  653   * preempt disabled), but they don't need to be atomic with respect to other
3d901ae326a1f6 David Howells 2026-04-16  654   * cpus like in true SMP (so they need either to either locally disable irq
3d901ae326a1f6 David Howells 2026-04-16  655   * around the read or for example on x86 they can be still implemented as a
3d901ae326a1f6 David Howells 2026-04-16  656   * cmpxchg8b without the need of the lock prefix).  For SMP compiles and 64bit
3d901ae326a1f6 David Howells 2026-04-16  657   * archs it makes no difference if preempt is enabled or not.
3d901ae326a1f6 David Howells 2026-04-16  658   */
3d901ae326a1f6 David Howells 2026-04-16  659  static inline void netfs_read_sizes(const struct netfs_inode *ictx,
3d901ae326a1f6 David Howells 2026-04-16  660  				    unsigned long long *remote_i_size,
3d901ae326a1f6 David Howells 2026-04-16  661  				    unsigned long long *zero_point)
3d901ae326a1f6 David Howells 2026-04-16  662  {
3d901ae326a1f6 David Howells 2026-04-16  663  #if BITS_PER_LONG==32 && defined(CONFIG_SMP)
3d901ae326a1f6 David Howells 2026-04-16  664  	const struct inode *inode = &ictx->inode;
3d901ae326a1f6 David Howells 2026-04-16  665  	unsigned int seq;
3d901ae326a1f6 David Howells 2026-04-16  666  
3d901ae326a1f6 David Howells 2026-04-16  667  	do {
3d901ae326a1f6 David Howells 2026-04-16  668  		seq = read_seqcount_begin(&inode->i_size_seqcount);
3d901ae326a1f6 David Howells 2026-04-16  669  		*remote_i_size = ictx->_remote_i_size;
3d901ae326a1f6 David Howells 2026-04-16  670  		*zero_point = ictx->_zero_point;
3d901ae326a1f6 David Howells 2026-04-16  671  	} while (read_seqcount_retry(&inode->i_size_seqcount, seq));
3d901ae326a1f6 David Howells 2026-04-16 @672  	return zero_point;
3d901ae326a1f6 David Howells 2026-04-16  673  #elif BITS_PER_LONG==32 && defined(CONFIG_PREEMPTION)
3d901ae326a1f6 David Howells 2026-04-16  674  	unsigned long long zero_point;
3d901ae326a1f6 David Howells 2026-04-16  675  
3d901ae326a1f6 David Howells 2026-04-16  676  	preempt_disable();
3d901ae326a1f6 David Howells 2026-04-16  677  	*remote_i_size = ictx->_remote_i_size;
3d901ae326a1f6 David Howells 2026-04-16  678  	*zero_point = ictx->_zero_point;
3d901ae326a1f6 David Howells 2026-04-16  679  	preempt_enable();
3d901ae326a1f6 David Howells 2026-04-16  680  #else
3d901ae326a1f6 David Howells 2026-04-16  681  	/* Pairs with smp_store_release() in netfs_write_zero_point() */
3d901ae326a1f6 David Howells 2026-04-16  682  	*remote_i_size = smp_load_acquire(&ictx->_remote_i_size);
3d901ae326a1f6 David Howells 2026-04-16  683  	*zero_point = smp_load_acquire(&ictx->_zero_point);
3d901ae326a1f6 David Howells 2026-04-16  684  #endif
3d901ae326a1f6 David Howells 2026-04-16  685  }
3d901ae326a1f6 David Howells 2026-04-16  686  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
