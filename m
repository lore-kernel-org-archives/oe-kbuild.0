Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B429417
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Obxh3f4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699293187; x=1730829187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJSYPYS441pVgH8+cpoYIT0pJ1Iba8AsISWl6WLws5Y=;
  b=Obxh3f4uQdYRupRfbriRBBapNTNzTMLX9R89GbtCclmXlhA8KGh2nv1F
   vrgD2O3Tou7gQUfd3Lmc2jHy/dietkd+b8m4wa07h0UxHmgfqo5KECpw3
   sDLFJ9PPbgU0XmJrHRZbF6tp6knDELiNaIahh+oPk3KLsUtRc3vfPEJF2
   chZReqMBNlh+HtwJkJ7h87RzEclrirV1vQgctgsD8xdxoXeL87e6qhnsN
   BWGEgWI4BeARnJ6tq+UjlPScNL5+B4VvvCRbbYrTB1CiBkanWVJk0h6Qr
   Mam/ltOfF2ehZvhosOCRBDCn8pwL8rpDVO6XYh1uHvLdAPohNOmX/WJbA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="10875928"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="10875928"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 09:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="797383276"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="797383276"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Nov 2023 09:53:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r03mY-0006ce-2S;
	Mon, 06 Nov 2023 17:53:02 +0000
Date: Tue, 7 Nov 2023 01:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/shmem.c:3611 shmem_xattr_handler_set() warn: passing zero to
 'PTR_ERR'
Message-ID: <202311070157.46XcY9EL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hugh Dickins <hughd@google.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Carlos Maiolino <cmaiolino@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 5de75970c9fd7220e394b76e6d20fbafa1369b5a xattr: simple_xattr_set() return old_xattr to be freed
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231107/202311070157.46XcY9EL-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070157.46XcY9EL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311070157.46XcY9EL-lkp@intel.com/

smatch warnings:
mm/shmem.c:3611 shmem_xattr_handler_set() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +3611 mm/shmem.c

b09e0fa4b4ea66 Eric Paris          2011-05-24  3593  
aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3594  static int shmem_xattr_handler_set(const struct xattr_handler *handler,
39f60c1ccee72c Christian Brauner   2023-01-13  3595  				   struct mnt_idmap *idmap,
5930122683dff5 Al Viro             2016-05-27  3596  				   struct dentry *unused, struct inode *inode,
5930122683dff5 Al Viro             2016-05-27  3597  				   const char *name, const void *value,
5930122683dff5 Al Viro             2016-05-27  3598  				   size_t size, int flags)
b09e0fa4b4ea66 Eric Paris          2011-05-24  3599  {
5930122683dff5 Al Viro             2016-05-27  3600  	struct shmem_inode_info *info = SHMEM_I(inode);
5de75970c9fd72 Hugh Dickins        2023-08-08  3601  	struct simple_xattr *old_xattr;
b09e0fa4b4ea66 Eric Paris          2011-05-24  3602  
aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3603  	name = xattr_full_name(handler, name);
5de75970c9fd72 Hugh Dickins        2023-08-08  3604  	old_xattr = simple_xattr_set(&info->xattrs, name, value, size, flags);
5de75970c9fd72 Hugh Dickins        2023-08-08  3605  	if (!IS_ERR(old_xattr)) {
5de75970c9fd72 Hugh Dickins        2023-08-08  3606  		simple_xattr_free(old_xattr);
5de75970c9fd72 Hugh Dickins        2023-08-08  3607  		old_xattr = NULL;
36f05cab0a2c97 Jeff Layton         2022-09-09  3608  		inode->i_ctime = current_time(inode);
36f05cab0a2c97 Jeff Layton         2022-09-09  3609  		inode_inc_iversion(inode);
36f05cab0a2c97 Jeff Layton         2022-09-09  3610  	}
5de75970c9fd72 Hugh Dickins        2023-08-08 @3611  	return PTR_ERR(old_xattr);
b09e0fa4b4ea66 Eric Paris          2011-05-24  3612  }
b09e0fa4b4ea66 Eric Paris          2011-05-24  3613  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
