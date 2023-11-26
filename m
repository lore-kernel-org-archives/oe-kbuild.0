Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CECDD26E
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIocNhOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701017297; x=1732553297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Aj6g1qtt4NlGPqFayJ832BIf2GwSijQocFN4wd6UQ0=;
  b=IIocNhOVoTt45FSmArXXjZCUxMIFzmF9AFloC8KerXGZnhCVTkc7I48Y
   Gw8Ck/Ds6q4ze5GY3uEo0t3yj1TQFK8f8AzDqVvzqzuzwd88fNIoYa5sT
   cS1mrnZJazgcbUW49q42Cg2xvFMiW0AR4MqugNLeF6StacKsSvET+n3/S
   LGvTaNEx4qNGqm3KQttq/WN/k/W6PTifUrB7L11F9IOa8nK6rq3aQHpMz
   X/nJZKqcO0/Su1jLChT8b1Kfb+chV0RT2vUmJ9LsCSR9m5EEC5LBEzP9Z
   ewiDczNlz95g8niXFc6d2kh056KXLHrasTqrwqNsLfGb0Lq6kv0rvel1q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="395407047"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="395407047"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 08:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="16082231"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2023 08:48:16 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7IIm-0005Je-2w;
	Sun, 26 Nov 2023 16:48:12 +0000
Date: Mon, 27 Nov 2023 00:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1919/2998] fs/bcachefs/journal.c:784:18: sparse:
 sparse: invalid access past the end of 's' (4 8)
Message-ID: <202311262337.32js6yfG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/journal.c:784:18: sparse: sparse: invalid access past the end of 's' (4 8)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8c9660f6515396aba78d1168d2e17951d653ebf2
commit: e6d7833cd9e3b7778099c4aaafe100e149de364a [1919/2998] bcachefs: bch2_journal_block_reservations()
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-061-20231126 (https://download.01.org/0day-ci/archive/20231126/202311262337.32js6yfG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311262337.32js6yfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311262337.32js6yfG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/journal.c: note: in included file:
   fs/bcachefs/bcachefs.h:964:9: sparse: sparse: array of flexible structures
   fs/bcachefs/journal.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:2251:38: sparse: sparse: array of flexible structures
   fs/bcachefs/journal.c: note: in included file (through fs/bcachefs/btree_update.h):
   fs/bcachefs/journal.h:264:58: sparse: sparse: invalid access past the end of '<noident>' (4 8)
   fs/bcachefs/journal.h:153:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:154:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:155:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:153:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:154:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:155:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:163:9: sparse: sparse: invalid access past the end of 'new' (4 8)
   fs/bcachefs/journal.h:163:9: sparse: sparse: invalid access past the end of 'new' (4 8)
   fs/bcachefs/journal.h:153:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:154:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:155:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:163:9: sparse: sparse: invalid access past the end of 'new' (4 8)
   fs/bcachefs/journal.h:153:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:154:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:155:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:163:9: sparse: sparse: invalid access past the end of 'new' (4 8)
   fs/bcachefs/journal.h:153:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:154:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:155:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:264:58: sparse: sparse: invalid access past the end of '<noident>' (4 8)
   fs/bcachefs/journal.h:153:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:154:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:155:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:163:9: sparse: sparse: invalid access past the end of 'new' (4 8)
   fs/bcachefs/journal.h:153:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:154:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:155:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:264:58: sparse: sparse: invalid access past the end of '<noident>' (4 8)
   fs/bcachefs/journal.h:153:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:154:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:155:25: sparse: sparse: invalid access past the end of 's' (4 8)
>> fs/bcachefs/journal.c:784:18: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.c:909:9: sparse: sparse: context imbalance in '__bch2_set_nr_journal_buckets' - different lock contexts for basic block
   fs/bcachefs/journal.h:153:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:154:25: sparse: sparse: invalid access past the end of 's' (4 8)
   fs/bcachefs/journal.h:155:25: sparse: sparse: invalid access past the end of 's' (4 8)

vim +/s +784 fs/bcachefs/journal.c

768ac63924775d Kent Overstreet 2019-02-14  769  
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  770  /*
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  771   * XXX: ideally this would not be closing the current journal entry, but
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  772   * otherwise we do not have a way to avoid racing with res_get() - j->blocked
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  773   * will race.
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  774   */
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  775  static bool journal_reservations_stopped(struct journal *j)
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  776  {
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  777  	union journal_res_state s;
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  778  
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  779  	journal_entry_close(j);
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  780  
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  781  	s.v = atomic64_read_acquire(&j->reservations.counter);
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  782  
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  783  	return  s.buf0_count == 0 &&
e6d7833cd9e3b7 Kent Overstreet 2023-11-02 @784  		s.buf1_count == 0 &&
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  785  		s.buf2_count == 0 &&
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  786  		s.buf3_count == 0;
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  787  }
e6d7833cd9e3b7 Kent Overstreet 2023-11-02  788  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
