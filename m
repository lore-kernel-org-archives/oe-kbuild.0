Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B26AA5
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688489163; x=1720025163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0YyvOHzi19tl1UwxsQt+B3hEQjPmZ4S/Mts5UuY3Gi8=;
  b=cRzwlAUNY7o94SC/nmV4aRTDFGjkLpjUHzVFLbn1C4uypMtf7MjQObKo
   Jd/JMCVXiM3AxRldiPmkH9TBNflipEUw2HiaNK7V7cRPlBwQdI9IpVnai
   KiEi4AMp5AiGRT+4Vw5Pk2UZc6SvngUDZX7YrNt2xtGI676xi1ShWJGTW
   leU+98E5L8YsQ5A2ICW3L4Gb+Gngo/pkHhsPZDP0xCu3F8DlB6datQdeX
   3Gsk/woh+IQkM1FG2QUQz2AWgbpMNazM/cDKFvxQZNh41A/Msx3hNYrGX
   5IqU9oPYwRfIzc/CGQZwDfXwbPvCWxC1JmM5h3hyGQVvF9ViJlAY4jWJd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="343492203"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="343492203"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 09:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="808984371"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="808984371"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2023 09:46:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGjA8-000IOJ-12;
	Tue, 04 Jul 2023 16:46:00 +0000
Date: Wed, 5 Jul 2023 00:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12225/12997] drivers/vhost/vhost.c:763
 vhost_worker_ioctl() error: uninitialized symbol 'vq'.
Message-ID: <202307050047.wJaHhDot-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mike Christie <michael.christie@oracle.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1
commit: 98778ac3488200b21dc19bbefddaea8e3d89824f [12225/12997] vhost: allow userspace to create workers
:::::: branch date: 13 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050047.wJaHhDot-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050047.wJaHhDot-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307050047.wJaHhDot-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:763 vhost_worker_ioctl() error: uninitialized symbol 'vq'.
drivers/vhost/vhost.c:774 vhost_worker_ioctl() error: uninitialized symbol 'idx'.

Old smatch warnings:
drivers/vhost/vhost.c:1826 vhost_vring_ioctl() error: uninitialized symbol 'vq'.
drivers/vhost/vhost.c:1829 vhost_vring_ioctl() error: uninitialized symbol 'vq'.
drivers/vhost/vhost.c:1857 vhost_vring_ioctl() error: uninitialized symbol 'idx'.
drivers/vhost/vhost.c:1910 vhost_vring_ioctl() error: uninitialized symbol 'idx'.
drivers/vhost/vhost.c:1920 vhost_vring_ioctl() error: uninitialized symbol 'idx'.

vim +/vq +763 drivers/vhost/vhost.c

8e355b19cf9c52 Mike Christie 2023-06-26  719  
98778ac3488200 Mike Christie 2023-06-26  720  /* Caller must have device mutex */
98778ac3488200 Mike Christie 2023-06-26  721  long vhost_worker_ioctl(struct vhost_dev *dev, unsigned int ioctl,
98778ac3488200 Mike Christie 2023-06-26  722  			void __user *argp)
98778ac3488200 Mike Christie 2023-06-26  723  {
98778ac3488200 Mike Christie 2023-06-26  724  	struct vhost_vring_worker ring_worker;
98778ac3488200 Mike Christie 2023-06-26  725  	struct vhost_worker_state state;
98778ac3488200 Mike Christie 2023-06-26  726  	struct vhost_virtqueue *vq;
98778ac3488200 Mike Christie 2023-06-26  727  	long ret;
98778ac3488200 Mike Christie 2023-06-26  728  	u32 idx;
98778ac3488200 Mike Christie 2023-06-26  729  
98778ac3488200 Mike Christie 2023-06-26  730  	if (!dev->use_worker)
98778ac3488200 Mike Christie 2023-06-26  731  		return -EINVAL;
98778ac3488200 Mike Christie 2023-06-26  732  
98778ac3488200 Mike Christie 2023-06-26  733  	if (!vhost_dev_has_owner(dev))
98778ac3488200 Mike Christie 2023-06-26  734  		return -EINVAL;
98778ac3488200 Mike Christie 2023-06-26  735  
98778ac3488200 Mike Christie 2023-06-26  736  	ret = vhost_dev_check_owner(dev);
98778ac3488200 Mike Christie 2023-06-26  737  	if (ret)
98778ac3488200 Mike Christie 2023-06-26  738  		return ret;
98778ac3488200 Mike Christie 2023-06-26  739  
98778ac3488200 Mike Christie 2023-06-26  740  	switch (ioctl) {
98778ac3488200 Mike Christie 2023-06-26  741  	/* dev worker ioctls */
98778ac3488200 Mike Christie 2023-06-26  742  	case VHOST_NEW_WORKER:
98778ac3488200 Mike Christie 2023-06-26  743  		ret = vhost_new_worker(dev, &state);
98778ac3488200 Mike Christie 2023-06-26  744  		if (!ret && copy_to_user(argp, &state, sizeof(state)))
98778ac3488200 Mike Christie 2023-06-26  745  			ret = -EFAULT;
98778ac3488200 Mike Christie 2023-06-26  746  		return ret;
98778ac3488200 Mike Christie 2023-06-26  747  	case VHOST_FREE_WORKER:
98778ac3488200 Mike Christie 2023-06-26  748  		if (copy_from_user(&state, argp, sizeof(state)))
98778ac3488200 Mike Christie 2023-06-26  749  			return -EFAULT;
98778ac3488200 Mike Christie 2023-06-26  750  		return vhost_free_worker(dev, &state);
98778ac3488200 Mike Christie 2023-06-26  751  	/* vring worker ioctls */
98778ac3488200 Mike Christie 2023-06-26  752  	case VHOST_ATTACH_VRING_WORKER:
98778ac3488200 Mike Christie 2023-06-26  753  	case VHOST_GET_VRING_WORKER:
98778ac3488200 Mike Christie 2023-06-26  754  		break;
98778ac3488200 Mike Christie 2023-06-26  755  	default:
98778ac3488200 Mike Christie 2023-06-26  756  		return -ENOIOCTLCMD;
98778ac3488200 Mike Christie 2023-06-26  757  	}
98778ac3488200 Mike Christie 2023-06-26  758  
98778ac3488200 Mike Christie 2023-06-26  759  	ret = vhost_get_vq_from_user(dev, argp, &vq, &idx);
98778ac3488200 Mike Christie 2023-06-26  760  	if (ret)
98778ac3488200 Mike Christie 2023-06-26  761  		return ret;
98778ac3488200 Mike Christie 2023-06-26  762  
98778ac3488200 Mike Christie 2023-06-26 @763  	mutex_lock(&vq->mutex);
98778ac3488200 Mike Christie 2023-06-26  764  	switch (ioctl) {
98778ac3488200 Mike Christie 2023-06-26  765  	case VHOST_ATTACH_VRING_WORKER:
98778ac3488200 Mike Christie 2023-06-26  766  		if (copy_from_user(&ring_worker, argp, sizeof(ring_worker))) {
98778ac3488200 Mike Christie 2023-06-26  767  			ret = -EFAULT;
98778ac3488200 Mike Christie 2023-06-26  768  			break;
98778ac3488200 Mike Christie 2023-06-26  769  		}
98778ac3488200 Mike Christie 2023-06-26  770  
98778ac3488200 Mike Christie 2023-06-26  771  		ret = vhost_vq_attach_worker(vq, &ring_worker);
98778ac3488200 Mike Christie 2023-06-26  772  		break;
98778ac3488200 Mike Christie 2023-06-26  773  	case VHOST_GET_VRING_WORKER:
98778ac3488200 Mike Christie 2023-06-26 @774  		ring_worker.index = idx;
98778ac3488200 Mike Christie 2023-06-26  775  		ring_worker.worker_id = vq->worker->id;
98778ac3488200 Mike Christie 2023-06-26  776  
98778ac3488200 Mike Christie 2023-06-26  777  		if (copy_to_user(argp, &ring_worker, sizeof(ring_worker)))
98778ac3488200 Mike Christie 2023-06-26  778  			ret = -EFAULT;
98778ac3488200 Mike Christie 2023-06-26  779  		break;
98778ac3488200 Mike Christie 2023-06-26  780  	default:
98778ac3488200 Mike Christie 2023-06-26  781  		ret = -ENOIOCTLCMD;
98778ac3488200 Mike Christie 2023-06-26  782  		break;
98778ac3488200 Mike Christie 2023-06-26  783  	}
98778ac3488200 Mike Christie 2023-06-26  784  
98778ac3488200 Mike Christie 2023-06-26  785  	mutex_unlock(&vq->mutex);
98778ac3488200 Mike Christie 2023-06-26  786  	return ret;
98778ac3488200 Mike Christie 2023-06-26  787  }
98778ac3488200 Mike Christie 2023-06-26  788  EXPORT_SYMBOL_GPL(vhost_worker_ioctl);
98778ac3488200 Mike Christie 2023-06-26  789  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
