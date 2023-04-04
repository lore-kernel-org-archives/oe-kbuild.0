Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDA0648
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Apr 2023 05:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680586228; x=1712122228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WEKr1Zz2eM9Vxb0mF8jVm6aJohkQi9KaonkpKX31Dy4=;
  b=UJaNrw6VnvHUWV5N2VWqhUahHvalZQ0KF3uqiAi3QHNFOr/H369aNKbE
   n5cSIxQt1ZBN5b564OZs012fJL3tBhyoKiszulSYvkrG3xivJ51ATHWvs
   lhOOWuIPWPala8OfUad+mv/4VeXAVbXCUM9WEWpkq7hTZ5mi9szUIr2uv
   L7ysbqPjnram+8QXofGzlHAPBsN5r/IIR/KldP0FtxREjFzTzX1UDY6sZ
   mzxFfVdnWh29d+QDkz6Hpezq4UHWbAbh1ASugYxSpOnYosRdoNLwYoZQE
   AyxT5m9bHICv+rVEYIjcNZR9wXuv9wXJRi90ahbfwocDO6YSykOyCXyUD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428377398"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="428377398"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 22:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="686242078"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="686242078"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Apr 2023 22:30:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjZF8-000PEi-1E;
	Tue, 04 Apr 2023 05:30:06 +0000
Date: Tue, 4 Apr 2023 13:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH v2 7/9] fuse: add fuse device
 ioctl(FUSE_DEV_IOC_REINIT)
Message-ID: <202304041325.cDq5RlHR-lkp@intel.com>
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
In-Reply-To: <20230403144517.347517-8-aleksandr.mikhalitsyn@canonical.com>
References: <20230403144517.347517-8-aleksandr.mikhalitsyn@canonical.com>
TO: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on c68ea140050e631d24d61b6e399ca8224a4a2219]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Mikhalitsyn/fuse-move-FUSE_DEFAULT_-defines-to-fuse-common-header/20230403-224904
base:   c68ea140050e631d24d61b6e399ca8224a4a2219
patch link:    https://lore.kernel.org/r/20230403144517.347517-8-aleksandr.mikhalitsyn%40canonical.com
patch subject: [RFC PATCH v2 7/9] fuse: add fuse device ioctl(FUSE_DEV_IOC_REINIT)
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: openrisc-randconfig-m031-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041325.cDq5RlHR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304041325.cDq5RlHR-lkp@intel.com/

New smatch warnings:
fs/fuse/dev.c:2412 fuse_dev_ioctl() warn: statement has no effect 3

Old smatch warnings:
fs/fuse/dev.c:1339 fuse_dev_do_read() warn: inconsistent returns '&fiq->lock'.

vim +2412 fs/fuse/dev.c

00c570f4ba43ae Miklos Szeredi        2015-07-01  2379  
00c570f4ba43ae Miklos Szeredi        2015-07-01  2380  static long fuse_dev_ioctl(struct file *file, unsigned int cmd,
00c570f4ba43ae Miklos Szeredi        2015-07-01  2381  			   unsigned long arg)
00c570f4ba43ae Miklos Szeredi        2015-07-01  2382  {
f8425c9396639c Alessio Balsini       2021-01-25  2383  	int res;
00c570f4ba43ae Miklos Szeredi        2015-07-01  2384  	int oldfd;
f8425c9396639c Alessio Balsini       2021-01-25  2385  	struct fuse_dev *fud = NULL;
f8425c9396639c Alessio Balsini       2021-01-25  2386  
6076f5f341e612 Alessio Balsini       2021-03-19  2387  	switch (cmd) {
6076f5f341e612 Alessio Balsini       2021-03-19  2388  	case FUSE_DEV_IOC_CLONE:
f8425c9396639c Alessio Balsini       2021-01-25  2389  		res = -EFAULT;
00c570f4ba43ae Miklos Szeredi        2015-07-01  2390  		if (!get_user(oldfd, (__u32 __user *)arg)) {
00c570f4ba43ae Miklos Szeredi        2015-07-01  2391  			struct file *old = fget(oldfd);
00c570f4ba43ae Miklos Szeredi        2015-07-01  2392  
f8425c9396639c Alessio Balsini       2021-01-25  2393  			res = -EINVAL;
00c570f4ba43ae Miklos Szeredi        2015-07-01  2394  			if (old) {
8ed1f0e22f49ef Jann Horn             2015-08-16  2395  				/*
8ed1f0e22f49ef Jann Horn             2015-08-16  2396  				 * Check against file->f_op because CUSE
8ed1f0e22f49ef Jann Horn             2015-08-16  2397  				 * uses the same ioctl handler.
8ed1f0e22f49ef Jann Horn             2015-08-16  2398  				 */
0618021e34c6b1 Jann Horn             2022-09-14  2399  				if (old->f_op == file->f_op)
8ed1f0e22f49ef Jann Horn             2015-08-16  2400  					fud = fuse_get_dev(old);
00c570f4ba43ae Miklos Szeredi        2015-07-01  2401  
cc080e9e9be16c Miklos Szeredi        2015-07-01  2402  				if (fud) {
00c570f4ba43ae Miklos Szeredi        2015-07-01  2403  					mutex_lock(&fuse_mutex);
f8425c9396639c Alessio Balsini       2021-01-25  2404  					res = fuse_device_clone(fud->fc, file);
00c570f4ba43ae Miklos Szeredi        2015-07-01  2405  					mutex_unlock(&fuse_mutex);
00c570f4ba43ae Miklos Szeredi        2015-07-01  2406  				}
00c570f4ba43ae Miklos Szeredi        2015-07-01  2407  				fput(old);
00c570f4ba43ae Miklos Szeredi        2015-07-01  2408  			}
00c570f4ba43ae Miklos Szeredi        2015-07-01  2409  		}
f8425c9396639c Alessio Balsini       2021-01-25  2410  		break;
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2411  	case FUSE_DEV_IOC_REINIT:
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03 @2412  		struct fuse_conn *fc;
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2413  
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2414  		if (!checkpoint_restore_ns_capable(file->f_cred->user_ns))
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2415  			return -EPERM;
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2416  
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2417  		res = -EINVAL;
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2418  		fud = fuse_get_dev(file);
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2419  
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2420  		/*
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2421  		 * Only fuse mounts with an already initialized fuse
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2422  		 * connection are supported
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2423  		 */
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2424  		if (file->f_op == &fuse_dev_operations && fud) {
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2425  			mutex_lock(&fuse_mutex);
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2426  			fc = fud->fc;
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2427  			if (fc)
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2428  				fc = fuse_conn_get(fc);
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2429  			mutex_unlock(&fuse_mutex);
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2430  
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2431  			if (fc) {
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2432  				res = fuse_reinit_conn(fc);
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2433  				fuse_conn_put(fc);
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2434  			}
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2435  		}
64bb2d35a39ce0 Alexander Mikhalitsyn 2023-04-03  2436  		break;
f8425c9396639c Alessio Balsini       2021-01-25  2437  	default:
f8425c9396639c Alessio Balsini       2021-01-25  2438  		res = -ENOTTY;
f8425c9396639c Alessio Balsini       2021-01-25  2439  		break;
00c570f4ba43ae Miklos Szeredi        2015-07-01  2440  	}
f8425c9396639c Alessio Balsini       2021-01-25  2441  	return res;
00c570f4ba43ae Miklos Szeredi        2015-07-01  2442  }
00c570f4ba43ae Miklos Szeredi        2015-07-01  2443  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
