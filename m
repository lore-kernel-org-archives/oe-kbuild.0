Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654AC21CED
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 23:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683760431; x=1715296431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fC9rZur2No+UN2cER3CtIy3QfBD+U+MYZlntB7Co98s=;
  b=nB42RE6c0idMOx8AmQvyB93yXJ7gQg2ErE3xtQCWzqyjrZAxXjxtmMHI
   NNYNEnjeQdD+Qf7KPQ1/IFZhvYO2vJkpAhGIwm7kZw5LPQJCMeCoEHCwN
   udYbgEXFnXWMYnKURBY358VqjemdrLnq+JeC6Boxg2ffRX5onoVMqhJ1d
   94Q6JFUaVmiFam+EDiNV05hqRD0/ZKq3/MXqgXaQXnYFMK5z7UWFK9Rt/
   wmQJrHhwZ/jm7XCBmu2bfniU3H50W5NouBifK511cBvQALV+lCM9gA9wo
   O3OzIvDUFwZc9QjVKe8TyIDMApfMXBr3KsRk6gbRyTiw8PyS69pJQSVnb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436668880"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="436668880"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 16:13:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="677028383"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="677028383"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 May 2023 16:13:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwt0G-0003eK-26;
	Wed, 10 May 2023 23:13:48 +0000
Date: Thu, 11 May 2023 07:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/6] kernfs: implement readdir FMODE_NOWAIT
Message-ID: <202305110647.eSnSEulg-lkp@intel.com>
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
In-Reply-To: <20230422-uring-getdents-v2-4-2db1e37dc55e@codewreck.org>
References: <20230422-uring-getdents-v2-4-2db1e37dc55e@codewreck.org>
TO: Dominique Martinet <asmadeus@codewreck.org>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: Christian Brauner <brauner@kernel.org>
TO: Jens Axboe <axboe@kernel.dk>
TO: Pavel Begunkov <asml.silence@gmail.com>
TO: Stefan Roesch <shr@fb.com>
CC: Clay Harris <bugs@claycon.org>
CC: Dave Chinner <david@fromorbit.com>
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: io-uring@vger.kernel.org
CC: Dominique Martinet <asmadeus@codewreck.org>

Hi Dominique,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dominique-Martinet/fs-split-off-vfs_getdents-function-of-getdents64-syscall/20230510-185542
base:   58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
patch link:    https://lore.kernel.org/r/20230422-uring-getdents-v2-4-2db1e37dc55e%40codewreck.org
patch subject: [PATCH v2 4/6] kernfs: implement readdir FMODE_NOWAIT
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230511/202305110647.eSnSEulg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305110647.eSnSEulg-lkp@intel.com/

smatch warnings:
fs/kernfs/dir.c:1863 kernfs_fop_readdir() warn: inconsistent returns '&root->kernfs_rwsem'.

vim +1863 fs/kernfs/dir.c

fd7b9f7b9776b1 Tejun Heo          2013-11-28  1814  
c637b8acbe079e Tejun Heo          2013-12-11  1815  static int kernfs_fop_readdir(struct file *file, struct dir_context *ctx)
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1816  {
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1817  	struct dentry *dentry = file->f_path.dentry;
319ba91d352a74 Shaohua Li         2017-07-12  1818  	struct kernfs_node *parent = kernfs_dentry_node(dentry);
324a56e16e44ba Tejun Heo          2013-12-11  1819  	struct kernfs_node *pos = file->private_data;
393c3714081a53 Minchan Kim        2021-11-18  1820  	struct kernfs_root *root;
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1821  	const void *ns = NULL;
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1822  
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1823  	if (!dir_emit_dots(file, ctx))
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1824  		return 0;
393c3714081a53 Minchan Kim        2021-11-18  1825  
393c3714081a53 Minchan Kim        2021-11-18  1826  	root = kernfs_root(parent);
a551138c4b3b9f Dominique Martinet 2023-05-10  1827  	if (ctx->flags & DIR_CONTEXT_F_NOWAIT) {
a551138c4b3b9f Dominique Martinet 2023-05-10  1828  		if (!down_read_trylock(&root->kernfs_rwsem))
a551138c4b3b9f Dominique Martinet 2023-05-10  1829  			return -EAGAIN;
a551138c4b3b9f Dominique Martinet 2023-05-10  1830  	} else {
393c3714081a53 Minchan Kim        2021-11-18  1831  		down_read(&root->kernfs_rwsem);
a551138c4b3b9f Dominique Martinet 2023-05-10  1832  	}
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1833  
324a56e16e44ba Tejun Heo          2013-12-11  1834  	if (kernfs_ns_enabled(parent))
c525aaddc366df Tejun Heo          2013-12-11  1835  		ns = kernfs_info(dentry->d_sb)->ns;
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1836  
c637b8acbe079e Tejun Heo          2013-12-11  1837  	for (pos = kernfs_dir_pos(ns, parent, ctx->pos, pos);
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1838  	     pos;
c637b8acbe079e Tejun Heo          2013-12-11  1839  	     pos = kernfs_dir_next_pos(ns, parent, ctx->pos, pos)) {
adc5e8b58f4886 Tejun Heo          2013-12-11  1840  		const char *name = pos->name;
364595a6851bf6 Jeff Layton        2023-03-30  1841  		unsigned int type = fs_umode_to_dtype(pos->mode);
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1842  		int len = strlen(name);
67c0496e87d193 Tejun Heo          2019-11-04  1843  		ino_t ino = kernfs_ino(pos);
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1844  
adc5e8b58f4886 Tejun Heo          2013-12-11  1845  		ctx->pos = pos->hash;
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1846  		file->private_data = pos;
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1847  		kernfs_get(pos);
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1848  
393c3714081a53 Minchan Kim        2021-11-18  1849  		up_read(&root->kernfs_rwsem);
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1850  		if (!dir_emit(ctx, name, len, ino, type))
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1851  			return 0;
393c3714081a53 Minchan Kim        2021-11-18  1852  		down_read(&root->kernfs_rwsem);
a551138c4b3b9f Dominique Martinet 2023-05-10  1853  		if (ctx->flags & DIR_CONTEXT_F_NOWAIT) {
a551138c4b3b9f Dominique Martinet 2023-05-10  1854  			if (!down_read_trylock(&root->kernfs_rwsem))
a551138c4b3b9f Dominique Martinet 2023-05-10  1855  				return 0;
a551138c4b3b9f Dominique Martinet 2023-05-10  1856  		} else {
a551138c4b3b9f Dominique Martinet 2023-05-10  1857  			down_read(&root->kernfs_rwsem);
a551138c4b3b9f Dominique Martinet 2023-05-10  1858  		}
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1859  	}
393c3714081a53 Minchan Kim        2021-11-18  1860  	up_read(&root->kernfs_rwsem);
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1861  	file->private_data = NULL;
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1862  	ctx->pos = INT_MAX;
fd7b9f7b9776b1 Tejun Heo          2013-11-28 @1863  	return 0;
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1864  }
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1865  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
