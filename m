Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0240E241F8
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 22:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSywerVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699048927; x=1730584927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mm8SFN76u1978ib8mqmAWaoXMBcdQHzmaTvMGo8U+V0=;
  b=bSywerVPEqwrsTLJBi2S5hx85aCCq9WAc6pqmNr4odav7m1H2cQH6JPz
   j2c/SZ0AgCuJMqNmJY0CxyyNfBCRxKig5SHJ11mDO/twyqf9FNQXAbzIH
   jRwySU1ylurt19AUSsHephayRyoULTSCs4EGRfINkhfdMkCAgUEoXh+ND
   qKFYwXwM7jvq+CgPZAGAhFmlW5HucO+ju6yyfoFvexB/XOFHReL9W/l8w
   EtgHPwpSlqJoEBaFMyGxOGXhuNK37viLKGVH35NxegGTxm8qQ71wwSQZ7
   t9WXoIvcZ1BdeasPiBYJqKi6rKR4XJ4yvrhI9OP2s5+TomBoctAyV4R/A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="10566659"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="10566659"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852400509"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="852400509"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2023 15:02:05 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz2Es-0002z6-2s;
	Fri, 03 Nov 2023 22:02:02 +0000
Date: Sat, 4 Nov 2023 06:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 1/3] fs/fuse/readdir.c:593
 fuse_readdir() warn: passing zero to 'PTR_ERR'
Message-ID: <202311040539.D6EkNTrt-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   85ccc4a25c6007d2ac4284565b1864f9abd44808
commit: f5f4199c102aa676998b42abff60d071385c1c0c [1/3] ANDROID: fuse-bpf v1.1
:::::: branch date: 10 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20231103 (https://download.01.org/0day-ci/archive/20231104/202311040539.D6EkNTrt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311040539.D6EkNTrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311040539.D6EkNTrt-lkp@intel.com/

smatch warnings:
fs/fuse/readdir.c:593 fuse_readdir() warn: passing zero to 'PTR_ERR'
fs/fuse/backing.c:1169 fuse_handle_backing() error: we previously assumed 'backing_inode' could be null (see line 1167)
fs/fuse/backing.c:1287 fuse_revalidate_backing() warn: inconsistent indenting
fs/fuse/backing.c:1935 fuse_getattr_finalize() warn: passing zero to 'ERR_PTR'

vim +/PTR_ERR +593 fs/fuse/readdir.c

5d7bc7e8680c7ca Miklos Szeredi   2018-10-01  569  
5d7bc7e8680c7ca Miklos Szeredi   2018-10-01  570  int fuse_readdir(struct file *file, struct dir_context *ctx)
5d7bc7e8680c7ca Miklos Szeredi   2018-10-01  571  {
5d7bc7e8680c7ca Miklos Szeredi   2018-10-01  572  	struct fuse_file *ff = file->private_data;
5d7bc7e8680c7ca Miklos Szeredi   2018-10-01  573  	struct inode *inode = file_inode(file);
5d7bc7e8680c7ca Miklos Szeredi   2018-10-01  574  	int err;
5d7bc7e8680c7ca Miklos Szeredi   2018-10-01  575  
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  576  #ifdef CONFIG_FUSE_BPF
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  577  	struct fuse_err_ret fer;
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  578  	bool allow_force;
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  579  	bool force_again = false;
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  580  	bool is_continued = false;
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  581  
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  582  again:
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  583  	fer = fuse_bpf_backing(inode, struct fuse_read_io,
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  584  			       fuse_readdir_initialize, fuse_readdir_backing,
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  585  			       fuse_readdir_finalize,
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  586  			       file, ctx, &force_again, &allow_force, is_continued);
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  587  	if (force_again && !IS_ERR(fer.result)) {
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  588  		is_continued = true;
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  589  		goto again;
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  590  	}
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  591  
f5f4199c102aa67 Daniel Rosenberg 2021-12-02  592  	if (fer.ret)
f5f4199c102aa67 Daniel Rosenberg 2021-12-02 @593  		return PTR_ERR(fer.result);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
