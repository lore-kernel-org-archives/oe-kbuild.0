Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324768F6E
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Apr 2023 20:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680552520; x=1712088520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3z0IqcukKo1EwgCbAgvxCiv4CmItJKkKMnNe6ahzVI=;
  b=JB9yti1YBB+EAY+Deagx9xU4ozb2rJqqzL6r8c5iF2secxzpzLCCeTZX
   Pn1AaV0NcfON7flw6v+WRrneqPc1ckA3QPqaJOhA8/DutzZivSZsNa4z/
   bpzFKm49KMRoyFIbWIibQwhchD08v+/Jw+FtUyLON6nj4qP1/NgaSqCss
   LFl0WfbyMIaW/eOQqV23NIbd1gHZQZXa6RDhYnUFYgiM/yQloBlFkdXJa
   uYiALrgx6wA9MpTMYAPy/n+uHLR/8Sl/krUtmSR5IQuRidnJeWvvWUG7S
   dObJkfakjD/BVIk9jZCLBM6WZlRR/k4jZ/IYZFbE5xWQO8YqeEZ6nRwlz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330578442"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="330578442"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 13:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663330390"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="663330390"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Apr 2023 13:08:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjQTm-000Okx-02;
	Mon, 03 Apr 2023 20:08:38 +0000
Date: Tue, 4 Apr 2023 04:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 7/9] fuse: add fuse device
 ioctl(FUSE_DEV_IOC_REINIT)
Message-ID: <202304040303.154wTdPO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/fuse/dev.c:2412:17: sparse: sparse: typename in expression"
:::::: 

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
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: nios2-randconfig-s053-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040303.154wTdPO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/64bb2d35a39ce0b44c0154fc882ca8cd1d776bcb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexander-Mikhalitsyn/fuse-move-FUSE_DEFAULT_-defines-to-fuse-common-header/20230403-224904
        git checkout 64bb2d35a39ce0b44c0154fc882ca8cd1d776bcb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash fs/fuse/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304040303.154wTdPO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/dev.c:2412:17: sparse: sparse: typename in expression
   fs/fuse/dev.c:2412:24: sparse: sparse: Expected ; at end of statement
   fs/fuse/dev.c:2412:24: sparse: sparse: got fuse_conn
   fs/fuse/dev.c:2412:17: sparse: sparse: undefined identifier 'struct'
   fs/fuse/dev.c:2426:25: sparse: sparse: undefined identifier 'fc'
   fs/fuse/dev.c:2427:29: sparse: sparse: undefined identifier 'fc'
   fs/fuse/dev.c:2428:33: sparse: sparse: undefined identifier 'fc'
   fs/fuse/dev.c:2428:52: sparse: sparse: undefined identifier 'fc'
   fs/fuse/dev.c:2431:29: sparse: sparse: undefined identifier 'fc'
   fs/fuse/dev.c:2432:56: sparse: sparse: undefined identifier 'fc'
   fs/fuse/dev.c:2433:47: sparse: sparse: undefined identifier 'fc'

vim +2412 fs/fuse/dev.c

00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2379  
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2380  static long fuse_dev_ioctl(struct file *file, unsigned int cmd,
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2381  			   unsigned long arg)
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2382  {
f8425c9396639cc Alessio Balsini       2021-01-25  2383  	int res;
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2384  	int oldfd;
f8425c9396639cc Alessio Balsini       2021-01-25  2385  	struct fuse_dev *fud = NULL;
f8425c9396639cc Alessio Balsini       2021-01-25  2386  
6076f5f341e6121 Alessio Balsini       2021-03-19  2387  	switch (cmd) {
6076f5f341e6121 Alessio Balsini       2021-03-19  2388  	case FUSE_DEV_IOC_CLONE:
f8425c9396639cc Alessio Balsini       2021-01-25  2389  		res = -EFAULT;
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2390  		if (!get_user(oldfd, (__u32 __user *)arg)) {
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2391  			struct file *old = fget(oldfd);
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2392  
f8425c9396639cc Alessio Balsini       2021-01-25  2393  			res = -EINVAL;
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2394  			if (old) {
8ed1f0e22f49ef4 Jann Horn             2015-08-16  2395  				/*
8ed1f0e22f49ef4 Jann Horn             2015-08-16  2396  				 * Check against file->f_op because CUSE
8ed1f0e22f49ef4 Jann Horn             2015-08-16  2397  				 * uses the same ioctl handler.
8ed1f0e22f49ef4 Jann Horn             2015-08-16  2398  				 */
0618021e34c6b1e Jann Horn             2022-09-14  2399  				if (old->f_op == file->f_op)
8ed1f0e22f49ef4 Jann Horn             2015-08-16  2400  					fud = fuse_get_dev(old);
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2401  
cc080e9e9be16cc Miklos Szeredi        2015-07-01  2402  				if (fud) {
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2403  					mutex_lock(&fuse_mutex);
f8425c9396639cc Alessio Balsini       2021-01-25  2404  					res = fuse_device_clone(fud->fc, file);
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2405  					mutex_unlock(&fuse_mutex);
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2406  				}
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2407  				fput(old);
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2408  			}
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2409  		}
f8425c9396639cc Alessio Balsini       2021-01-25  2410  		break;
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2411  	case FUSE_DEV_IOC_REINIT:
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03 @2412  		struct fuse_conn *fc;
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2413  
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2414  		if (!checkpoint_restore_ns_capable(file->f_cred->user_ns))
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2415  			return -EPERM;
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2416  
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2417  		res = -EINVAL;
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2418  		fud = fuse_get_dev(file);
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2419  
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2420  		/*
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2421  		 * Only fuse mounts with an already initialized fuse
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2422  		 * connection are supported
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2423  		 */
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2424  		if (file->f_op == &fuse_dev_operations && fud) {
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2425  			mutex_lock(&fuse_mutex);
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2426  			fc = fud->fc;
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2427  			if (fc)
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2428  				fc = fuse_conn_get(fc);
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2429  			mutex_unlock(&fuse_mutex);
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2430  
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2431  			if (fc) {
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2432  				res = fuse_reinit_conn(fc);
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2433  				fuse_conn_put(fc);
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2434  			}
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2435  		}
64bb2d35a39ce0b Alexander Mikhalitsyn 2023-04-03  2436  		break;
f8425c9396639cc Alessio Balsini       2021-01-25  2437  	default:
f8425c9396639cc Alessio Balsini       2021-01-25  2438  		res = -ENOTTY;
f8425c9396639cc Alessio Balsini       2021-01-25  2439  		break;
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2440  	}
f8425c9396639cc Alessio Balsini       2021-01-25  2441  	return res;
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2442  }
00c570f4ba43ae7 Miklos Szeredi        2015-07-01  2443  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
