Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C896722072
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 23:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHJoA1KK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701474492; x=1733010492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ROXyIYqWFcdQX2BsXNxKcM3qwUQ/W+md4BooAtZaQ50=;
  b=CHJoA1KKqB/9onTc25wJppYKxgAZA6ItJ312enTf9fF5NOEMl7NTDH/8
   QGmtoZgQSTI8JjGb5fuxIEuqlSw7vaMh/JbBPAoZKBEK3rh22Bwba27CV
   Gf7g4tS7vN4L5LFN/pgdaGvv4H2e5iAGy86k8aCKwFw+dHgAlWsLlrCSN
   /Jg1StS+4FJbGuHpNUSyod6A0O9QJgZlswCgNjOt0YZJ9/MaSfac6KscB
   SbhEqBxDANpBsuuci7Bh+xnD4sU8vERcocxE9tOQiK9mtRAnW55QRfcGE
   ZuLZmHeDE3BG3HJOH5yzawwbptJnlKJ80MfWATzuefVOXPbXvgcL631FJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="589762"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="589762"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 15:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="860713248"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="860713248"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2023 15:48:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9DEj-0004Q0-02;
	Fri, 01 Dec 2023 23:48:04 +0000
Date: Sat, 2 Dec 2023 07:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/rbtree_augmented.h:187:25: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202312020702.TY1PRWPS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: b1fbfcb4a20949df08dd995927cdc5ad220c128d kbuild: make single target builds even faster
date:   4 years ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 years ago
config: x86_64-randconfig-122-20231101 (https://download.01.org/0day-ci/archive/20231202/202312020702.TY1PRWPS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312020702.TY1PRWPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020702.TY1PRWPS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/rbtree.c: note: in included file:
>> include/linux/rbtree_augmented.h:187:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree_augmented.h:187:25: sparse:    struct rb_node [noderef] <asn:4> *
   include/linux/rbtree_augmented.h:187:25: sparse:    struct rb_node *
   include/linux/rbtree_augmented.h:189:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree_augmented.h:189:25: sparse:    struct rb_node [noderef] <asn:4> *
   include/linux/rbtree_augmented.h:189:25: sparse:    struct rb_node *
   include/linux/rbtree_augmented.h:191:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree_augmented.h:191:17: sparse:    struct rb_node [noderef] <asn:4> *
   include/linux/rbtree_augmented.h:191:17: sparse:    struct rb_node *

vim +187 include/linux/rbtree_augmented.h

9c079add0d0f452 Michel Lespinasse 2012-10-08  180  
c1adf20052d80f7 David Howells     2016-07-01  181  static inline void
c1adf20052d80f7 David Howells     2016-07-01  182  __rb_change_child_rcu(struct rb_node *old, struct rb_node *new,
c1adf20052d80f7 David Howells     2016-07-01  183  		      struct rb_node *parent, struct rb_root *root)
c1adf20052d80f7 David Howells     2016-07-01  184  {
c1adf20052d80f7 David Howells     2016-07-01  185  	if (parent) {
c1adf20052d80f7 David Howells     2016-07-01  186  		if (parent->rb_left == old)
c1adf20052d80f7 David Howells     2016-07-01 @187  			rcu_assign_pointer(parent->rb_left, new);
c1adf20052d80f7 David Howells     2016-07-01  188  		else
c1adf20052d80f7 David Howells     2016-07-01  189  			rcu_assign_pointer(parent->rb_right, new);
c1adf20052d80f7 David Howells     2016-07-01  190  	} else
c1adf20052d80f7 David Howells     2016-07-01  191  		rcu_assign_pointer(root->rb_node, new);
c1adf20052d80f7 David Howells     2016-07-01  192  }
c1adf20052d80f7 David Howells     2016-07-01  193  

:::::: The code at line 187 was first introduced by commit
:::::: c1adf20052d80f776849fa2c1acb472cdeb7786c Introduce rb_replace_node_rcu()

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
