Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC42E62C
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 20:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZd7WUs8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699302263; x=1730838263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tg0dpKKnW7cydaXpJmWwPZ43RLaJ3tZaE9J6Ku4XtFs=;
  b=jZd7WUs8Mhhnrtu2HsvAyaiHCYPM+TorVILNoF6gJqrvNv+qg3XdWFx8
   O3xVgCBeYY7S24/eIS77L1BFK6v/AdxrSTbBZ55INMJBVSyDNvO4Afnyd
   FO7hUySR9GABZD0IFBE1bXSlRgDfCu+py1gZS/N6zwnyGmjfGPzbQ2szn
   udtW/gT2RLgsQI3B3Nq+/jyKjdtGucyAYGVbdm7kesr3347rMkQy5srWi
   AK5Odv4e4EITqSWZLOe4QtTE3npC857Gk3O8LmRYdqtkOZvFE3pitNvLd
   FhD/bd45WrrX5vkgpnhphGEOZojt+JzUrPOQKZl612vRq6A36IZUyMkhk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="475601493"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="475601493"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 12:24:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="712316212"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="712316212"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Nov 2023 12:24:20 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r068w-0006iB-0F;
	Mon, 06 Nov 2023 20:24:18 +0000
Date: Tue, 7 Nov 2023 04:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] fuse: Track process write operations in both direct and
 writethrough modes
Message-ID: <202311070338.uJNMq6Sh-lkp@intel.com>
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
In-Reply-To: <20231028065912.6084-1-zhoujifeng@kylinos.com.cn>
References: <20231028065912.6084-1-zhoujifeng@kylinos.com.cn>
TO: Zhou Jifeng <zhoujifeng@kylinos.com.cn>
TO: miklos@szeredi.hu
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Zhou Jifeng <zhoujifeng@kylinos.com.cn>

Hi Zhou,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mszeredi-fuse/for-next]
[also build test WARNING on linus/master v6.6 next-20231106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhou-Jifeng/fuse-Track-process-write-operations-in-both-direct-and-writethrough-modes/20231028-150119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/20231028065912.6084-1-zhoujifeng%40kylinos.com.cn
patch subject: [PATCH] fuse: Track process write operations in both direct and writethrough modes
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-161-20231103 (https://download.01.org/0day-ci/archive/20231107/202311070338.uJNMq6Sh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070338.uJNMq6Sh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311070338.uJNMq6Sh-lkp@intel.com/

smatch warnings:
fs/fuse/file.c:1359 fuse_cache_write_iter() error: uninitialized symbol 'err'.

vim +/err +1359 fs/fuse/file.c

ea9b9907b82a09 Nicholas Piggin   2008-04-30  1301  
55752a3aba1387 Miklos Szeredi    2019-01-24  1302  static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1303  {
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1304  	struct file *file = iocb->ki_filp;
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1305  	struct address_space *mapping = file->f_mapping;
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1306  	ssize_t written = 0;
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1307  	struct inode *inode = mapping->host;
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1308  	ssize_t err;
56597c4ddc107c Zhou Jifeng       2023-10-28  1309  	ssize_t count;
8981bdfda7445a Vivek Goyal       2020-10-09  1310  	struct fuse_conn *fc = get_fuse_conn(inode);
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1311  
8981bdfda7445a Vivek Goyal       2020-10-09  1312  	if (fc->writeback_cache) {
4d99ff8f12eb20 Pavel Emelyanov   2013-10-10  1313  		/* Update size (EOF optimization) and mode (SUID clearing) */
c6c745b81033a4 Miklos Szeredi    2021-10-22  1314  		err = fuse_update_attributes(mapping->host, file,
c6c745b81033a4 Miklos Szeredi    2021-10-22  1315  					     STATX_SIZE | STATX_MODE);
4d99ff8f12eb20 Pavel Emelyanov   2013-10-10  1316  		if (err)
4d99ff8f12eb20 Pavel Emelyanov   2013-10-10  1317  			return err;
4d99ff8f12eb20 Pavel Emelyanov   2013-10-10  1318  
8981bdfda7445a Vivek Goyal       2020-10-09  1319  		if (fc->handle_killpriv_v2 &&
9452e93e6dae86 Christian Brauner 2023-01-13  1320  		    setattr_should_drop_suidgid(&nop_mnt_idmap,
9452e93e6dae86 Christian Brauner 2023-01-13  1321  						file_inode(file))) {
8981bdfda7445a Vivek Goyal       2020-10-09  1322  			goto writethrough;
8981bdfda7445a Vivek Goyal       2020-10-09  1323  		}
8981bdfda7445a Vivek Goyal       2020-10-09  1324  
84c3d55cc474f9 Al Viro           2014-04-03  1325  		return generic_file_write_iter(iocb, from);
4d99ff8f12eb20 Pavel Emelyanov   2013-10-10  1326  	}
4d99ff8f12eb20 Pavel Emelyanov   2013-10-10  1327  
8981bdfda7445a Vivek Goyal       2020-10-09  1328  writethrough:
5955102c9984fa Al Viro           2016-01-22  1329  	inode_lock(inode);
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1330  
56597c4ddc107c Zhou Jifeng       2023-10-28  1331  	count = generic_write_checks(iocb, from);
56597c4ddc107c Zhou Jifeng       2023-10-28  1332  	if (count <= 0)
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1333  		goto out;
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1334  
56597c4ddc107c Zhou Jifeng       2023-10-28  1335  	task_io_account_write(count);
56597c4ddc107c Zhou Jifeng       2023-10-28  1336  
5fa8e0a1c6a762 Jan Kara          2015-05-21  1337  	err = file_remove_privs(file);
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1338  	if (err)
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1339  		goto out;
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1340  
c3b2da31483449 Josef Bacik       2012-03-26  1341  	err = file_update_time(file);
c3b2da31483449 Josef Bacik       2012-03-26  1342  	if (err)
c3b2da31483449 Josef Bacik       2012-03-26  1343  		goto out;
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1344  
2ba48ce513c4e5 Al Viro           2015-04-09  1345  	if (iocb->ki_flags & IOCB_DIRECT) {
1af5bb491fbb41 Christoph Hellwig 2016-04-07  1346  		written = generic_file_direct_write(iocb, from);
84c3d55cc474f9 Al Viro           2014-04-03  1347  		if (written < 0 || !iov_iter_count(from))
4273b793ec6875 Anand Avati       2012-02-17  1348  			goto out;
64d1b4dd826d88 Christoph Hellwig 2023-06-01  1349  		written = direct_write_fallback(iocb, from, written,
64d1b4dd826d88 Christoph Hellwig 2023-06-01  1350  				fuse_perform_write(iocb, from));
4273b793ec6875 Anand Avati       2012-02-17  1351  	} else {
596df33d673d9d Christoph Hellwig 2023-06-01  1352  		written = fuse_perform_write(iocb, from);
4273b793ec6875 Anand Avati       2012-02-17  1353  	}
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1354  out:
5955102c9984fa Al Viro           2016-01-22  1355  	inode_unlock(inode);
e1c0eecba1a415 Miklos Szeredi    2017-09-12  1356  	if (written > 0)
e1c0eecba1a415 Miklos Szeredi    2017-09-12  1357  		written = generic_write_sync(iocb, written);
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1358  
ea9b9907b82a09 Nicholas Piggin   2008-04-30 @1359  	return written ? written : err;
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1360  }
ea9b9907b82a09 Nicholas Piggin   2008-04-30  1361  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
