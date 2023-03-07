Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B09321D
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Mar 2023 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678200431; x=1709736431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e64gOmHxq7m5KbCB9lWOHAlwePJK5yPWdjLU4t5dinQ=;
  b=jaZhsJui0prXNjPEprlCE5Py8s9Cj6u/BvH0v1Nm5l+/ku9Sj1topSOw
   9N/hLUhjdivdkwyrIO7Qx0xaazh5sYhILsQV82IdrPxMHwD0/b5EcSBFT
   POBomO4pKLaD/GWKJ5gy4jzRTN6sCIK00PPBr/GO8wqdPz4LwdJnbxW1Z
   YcEaGLaMVMT6DVyj8IIQixTrIP+Soqw7uS+MJ+lemvpVbaXlU1IV2ySA9
   wfgVv/q6cGBd8SiPQnzUHZGPXvn8ks5+0UkXVpTT5xkFjrumRklPeS8lm
   WSshxJ3nSmGWXLJej88oZvUAkFSHJvsoqJMUXzZktFXOLgSxon/UH6ubl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333334307"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="333334307"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 06:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="709082256"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="709082256"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Mar 2023 06:47:09 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZYaq-0001Oh-28;
	Tue, 07 Mar 2023 14:47:08 +0000
Date: Tue, 7 Mar 2023 22:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 06/34] md: move trailing statements to next line [ERROR]
Message-ID: <202303072237.2TbxkCkN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/md/md.c:7534:9: sparse: sparse: statement expected after case label"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <12a6970ce1bf7489aa67a3c6d70438a48b8f8987.1678136717.git.heinzm@redhat.com>
References: <12a6970ce1bf7489aa67a3c6d70438a48b8f8987.1678136717.git.heinzm@redhat.com>
TO: heinzm@redhat.com
TO: linux-raid@vger.kernel.org
CC: ncroxon@redhat.com
CC: xni@redhat.com
CC: dkeefe@redhat.com

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on song-md/md-next]
[also build test WARNING on linus/master v6.3-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/heinzm-redhat-com/md-fix-required-prohibited-spaces-ERROR/20230307-053327
base:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
patch link:    https://lore.kernel.org/r/12a6970ce1bf7489aa67a3c6d70438a48b8f8987.1678136717.git.heinzm%40redhat.com
patch subject: [PATCH 06/34] md: move trailing statements to next line [ERROR]
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230307/202303072237.2TbxkCkN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/0ad2607399ded916c63c96e5e3ac18f74e8a74d2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review heinzm-redhat-com/md-fix-required-prohibited-spaces-ERROR/20230307-053327
        git checkout 0ad2607399ded916c63c96e5e3ac18f74e8a74d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303072237.2TbxkCkN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/md.c:7534:9: sparse: sparse: statement expected after case label

vim +7534 drivers/md/md.c

2f6d261e15e8d0 Ye Bin            2022-09-20  7503  
a39907fa2fdb73 Al Viro           2008-03-02  7504  static int md_ioctl(struct block_device *bdev, fmode_t mode,
^1da177e4c3f41 Linus Torvalds    2005-04-16  7505  			unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds    2005-04-16  7506  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7507  	int err = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7508  	void __user *argp = (void __user *)arg;
fd01b88c75a718 NeilBrown         2011-10-11  7509  	struct mddev *mddev = NULL;
065e519e71b2c1 NeilBrown         2017-04-06  7510  	bool did_set_md_closing = false;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7511  
cb335f88eb35af Nicolas Schichan  2014-01-15  7512  	if (!md_ioctl_valid(cmd))
cb335f88eb35af Nicolas Schichan  2014-01-15  7513  		return -ENOTTY;
cb335f88eb35af Nicolas Schichan  2014-01-15  7514  
506c9e44a85f6a NeilBrown         2011-12-23  7515  	switch (cmd) {
506c9e44a85f6a NeilBrown         2011-12-23  7516  	case RAID_VERSION:
506c9e44a85f6a NeilBrown         2011-12-23  7517  	case GET_ARRAY_INFO:
506c9e44a85f6a NeilBrown         2011-12-23  7518  	case GET_DISK_INFO:
506c9e44a85f6a NeilBrown         2011-12-23  7519  		break;
506c9e44a85f6a NeilBrown         2011-12-23  7520  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7521  		if (!capable(CAP_SYS_ADMIN))
^1da177e4c3f41 Linus Torvalds    2005-04-16  7522  			return -EACCES;
506c9e44a85f6a NeilBrown         2011-12-23  7523  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7524  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7525  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  7526  	 * Commands dealing with the RAID driver but not any
^1da177e4c3f41 Linus Torvalds    2005-04-16  7527  	 * particular array:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7528  	 */
c02c0aeb6c728e NeilBrown         2012-12-11  7529  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7530  	case RAID_VERSION:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7531  		err = get_version(argp);
3adc28d85f18ae NeilBrown         2014-09-30  7532  		goto out;
0ad2607399ded9 Heinz Mauelshagen 2023-03-06  7533  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16 @7534  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7535  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7536  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  7537  	 * Commands creating/starting a new array:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7538  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  7539  
a39907fa2fdb73 Al Viro           2008-03-02  7540  	mddev = bdev->bd_disk->private_data;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7541  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7542  	if (!mddev) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7543  		BUG();
3adc28d85f18ae NeilBrown         2014-09-30  7544  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7545  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7546  
1ca69c4bc4b1ef NeilBrown         2012-10-11  7547  	/* Some actions do not requires the mutex */
1ca69c4bc4b1ef NeilBrown         2012-10-11  7548  	switch (cmd) {
1ca69c4bc4b1ef NeilBrown         2012-10-11  7549  	case GET_ARRAY_INFO:
1ca69c4bc4b1ef NeilBrown         2012-10-11  7550  		if (!mddev->raid_disks && !mddev->external)
1ca69c4bc4b1ef NeilBrown         2012-10-11  7551  			err = -ENODEV;
1ca69c4bc4b1ef NeilBrown         2012-10-11  7552  		else
1ca69c4bc4b1ef NeilBrown         2012-10-11  7553  			err = get_array_info(mddev, argp);
3adc28d85f18ae NeilBrown         2014-09-30  7554  		goto out;
1ca69c4bc4b1ef NeilBrown         2012-10-11  7555  
1ca69c4bc4b1ef NeilBrown         2012-10-11  7556  	case GET_DISK_INFO:
1ca69c4bc4b1ef NeilBrown         2012-10-11  7557  		if (!mddev->raid_disks && !mddev->external)
1ca69c4bc4b1ef NeilBrown         2012-10-11  7558  			err = -ENODEV;
1ca69c4bc4b1ef NeilBrown         2012-10-11  7559  		else
1ca69c4bc4b1ef NeilBrown         2012-10-11  7560  			err = get_disk_info(mddev, argp);
3adc28d85f18ae NeilBrown         2014-09-30  7561  		goto out;
1ca69c4bc4b1ef NeilBrown         2012-10-11  7562  
1ca69c4bc4b1ef NeilBrown         2012-10-11  7563  	case SET_DISK_FAULTY:
1ca69c4bc4b1ef NeilBrown         2012-10-11  7564  		err = set_disk_faulty(mddev, new_decode_dev(arg));
3adc28d85f18ae NeilBrown         2014-09-30  7565  		goto out;
4af1a04176bdb4 NeilBrown         2014-12-15  7566  
4af1a04176bdb4 NeilBrown         2014-12-15  7567  	case GET_BITMAP_FILE:
4af1a04176bdb4 NeilBrown         2014-12-15  7568  		err = get_bitmap_file(mddev, argp);
4af1a04176bdb4 NeilBrown         2014-12-15  7569  		goto out;
4af1a04176bdb4 NeilBrown         2014-12-15  7570  
1ca69c4bc4b1ef NeilBrown         2012-10-11  7571  	}
1ca69c4bc4b1ef NeilBrown         2012-10-11  7572  
78b990cf2822d1 Guoqing Jiang     2020-04-04  7573  	if (cmd == ADD_NEW_DISK || cmd == HOT_ADD_DISK)
cc1ffe61c026e2 Guoqing Jiang     2020-04-04  7574  		flush_rdev_wq(mddev);
a7a3f08dc24690 NeilBrown         2012-12-11  7575  
90f5f7ad4f38d6 Hannes Reinecke   2013-04-02  7576  	if (cmd == HOT_REMOVE_DISK)
90f5f7ad4f38d6 Hannes Reinecke   2013-04-02  7577  		/* need to ensure recovery thread has run */
90f5f7ad4f38d6 Hannes Reinecke   2013-04-02  7578  		wait_event_interruptible_timeout(mddev->sb_wait,
90f5f7ad4f38d6 Hannes Reinecke   2013-04-02  7579  						 !test_bit(MD_RECOVERY_NEEDED,
82a301cb0ea2df Shaohua Li        2016-12-08  7580  							   &mddev->recovery),
90f5f7ad4f38d6 Hannes Reinecke   2013-04-02  7581  						 msecs_to_jiffies(5000));
260fa034ef7a4f NeilBrown         2013-08-27  7582  	if (cmd == STOP_ARRAY || cmd == STOP_ARRAY_RO) {
260fa034ef7a4f NeilBrown         2013-08-27  7583  		/* Need to flush page cache, and ensure no-one else opens
260fa034ef7a4f NeilBrown         2013-08-27  7584  		 * and writes
260fa034ef7a4f NeilBrown         2013-08-27  7585  		 */
260fa034ef7a4f NeilBrown         2013-08-27  7586  		mutex_lock(&mddev->open_mutex);
9ba3b7f5d02591 NeilBrown         2014-09-09  7587  		if (mddev->pers && atomic_read(&mddev->openers) > 1) {
260fa034ef7a4f NeilBrown         2013-08-27  7588  			mutex_unlock(&mddev->open_mutex);
260fa034ef7a4f NeilBrown         2013-08-27  7589  			err = -EBUSY;
3adc28d85f18ae NeilBrown         2014-09-30  7590  			goto out;
260fa034ef7a4f NeilBrown         2013-08-27  7591  		}
c731b84b51bf7f Dae R. Jeong      2020-10-22  7592  		if (test_and_set_bit(MD_CLOSING, &mddev->flags)) {
c731b84b51bf7f Dae R. Jeong      2020-10-22  7593  			mutex_unlock(&mddev->open_mutex);
c731b84b51bf7f Dae R. Jeong      2020-10-22  7594  			err = -EBUSY;
c731b84b51bf7f Dae R. Jeong      2020-10-22  7595  			goto out;
c731b84b51bf7f Dae R. Jeong      2020-10-22  7596  		}
065e519e71b2c1 NeilBrown         2017-04-06  7597  		did_set_md_closing = true;
260fa034ef7a4f NeilBrown         2013-08-27  7598  		mutex_unlock(&mddev->open_mutex);
260fa034ef7a4f NeilBrown         2013-08-27  7599  		sync_blockdev(bdev);
260fa034ef7a4f NeilBrown         2013-08-27  7600  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7601  	err = mddev_lock(mddev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  7602  	if (err) {
9d48739ef19aa8 NeilBrown         2016-11-02  7603  		pr_debug("md: ioctl lock interrupted, reason %d, cmd %d\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  7604  			 err, cmd);
3adc28d85f18ae NeilBrown         2014-09-30  7605  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7606  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7607  
c02c0aeb6c728e NeilBrown         2012-12-11  7608  	if (cmd == SET_ARRAY_INFO) {
2f6d261e15e8d0 Ye Bin            2022-09-20  7609  		err = __md_set_array_info(mddev, argp);
3adc28d85f18ae NeilBrown         2014-09-30  7610  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7611  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7612  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7613  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  7614  	 * Commands querying/configuring an existing array:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7615  	 */
32a7627cf3a353 NeilBrown         2005-06-21  7616  	/* if we are not initialised yet, only ADD_NEW_DISK, STOP_ARRAY,
3f9d7b0d810f9f NeilBrown         2006-12-22  7617  	 * RUN_ARRAY, and GET_ and SET_BITMAP_FILE are allowed */
a17184a911195c NeilBrown         2008-02-06  7618  	if ((!mddev->raid_disks && !mddev->external)
a17184a911195c NeilBrown         2008-02-06  7619  	    && cmd != ADD_NEW_DISK && cmd != STOP_ARRAY
3f9d7b0d810f9f NeilBrown         2006-12-22  7620  	    && cmd != RUN_ARRAY && cmd != SET_BITMAP_FILE
3f9d7b0d810f9f NeilBrown         2006-12-22  7621  	    && cmd != GET_BITMAP_FILE) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7622  		err = -ENODEV;
3adc28d85f18ae NeilBrown         2014-09-30  7623  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7624  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7625  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7626  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  7627  	 * Commands even a read-only array can execute:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7628  	 */
c02c0aeb6c728e NeilBrown         2012-12-11  7629  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7630  	case RESTART_ARRAY_RW:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7631  		err = restart_array(mddev);
3adc28d85f18ae NeilBrown         2014-09-30  7632  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7633  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7634  	case STOP_ARRAY:
a05b7ea03d72f3 NeilBrown         2012-07-19  7635  		err = do_md_stop(mddev, 0, bdev);
3adc28d85f18ae NeilBrown         2014-09-30  7636  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7637  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7638  	case STOP_ARRAY_RO:
a05b7ea03d72f3 NeilBrown         2012-07-19  7639  		err = md_set_readonly(mddev, bdev);
3adc28d85f18ae NeilBrown         2014-09-30  7640  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7641  
3ea8929da3e61b NeilBrown         2013-04-24  7642  	case HOT_REMOVE_DISK:
3ea8929da3e61b NeilBrown         2013-04-24  7643  		err = hot_remove_disk(mddev, new_decode_dev(arg));
3adc28d85f18ae NeilBrown         2014-09-30  7644  		goto unlock;
3ea8929da3e61b NeilBrown         2013-04-24  7645  
7ceb17e87bde79 NeilBrown         2013-04-24  7646  	case ADD_NEW_DISK:
7ceb17e87bde79 NeilBrown         2013-04-24  7647  		/* We can support ADD_NEW_DISK on read-only arrays
466ad292235bd7 Wei Fang          2016-03-21  7648  		 * only if we are re-adding a preexisting device.
7ceb17e87bde79 NeilBrown         2013-04-24  7649  		 * So require mddev->pers and MD_DISK_SYNC.
7ceb17e87bde79 NeilBrown         2013-04-24  7650  		 */
7ceb17e87bde79 NeilBrown         2013-04-24  7651  		if (mddev->pers) {
7ceb17e87bde79 NeilBrown         2013-04-24  7652  			mdu_disk_info_t info;
7ceb17e87bde79 NeilBrown         2013-04-24  7653  			if (copy_from_user(&info, argp, sizeof(info)))
7ceb17e87bde79 NeilBrown         2013-04-24  7654  				err = -EFAULT;
7ceb17e87bde79 NeilBrown         2013-04-24  7655  			else if (!(info.state & (1<<MD_DISK_SYNC)))
7ceb17e87bde79 NeilBrown         2013-04-24  7656  				/* Need to clear read-only for this */
7ceb17e87bde79 NeilBrown         2013-04-24  7657  				break;
7ceb17e87bde79 NeilBrown         2013-04-24  7658  			else
7e0adbfc20c50b Christoph Hellwig 2020-06-07  7659  				err = md_add_new_disk(mddev, &info);
3adc28d85f18ae NeilBrown         2014-09-30  7660  			goto unlock;
7ceb17e87bde79 NeilBrown         2013-04-24  7661  		}
7ceb17e87bde79 NeilBrown         2013-04-24  7662  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7663  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7664  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7665  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  7666  	 * The remaining ioctls are changing the state of the
f91de92ed6bfb7 NeilBrown         2005-11-08  7667  	 * superblock, so we do not allow them on read-only arrays.
^1da177e4c3f41 Linus Torvalds    2005-04-16  7668  	 */
f97a5528b21eb1 Ye Bin            2022-09-20  7669  	if (!md_is_rdwr(mddev) && mddev->pers) {
f97a5528b21eb1 Ye Bin            2022-09-20  7670  		if (mddev->ro != MD_AUTO_READ) {
f97a5528b21eb1 Ye Bin            2022-09-20  7671  			err = -EROFS;
f97a5528b21eb1 Ye Bin            2022-09-20  7672  			goto unlock;
f97a5528b21eb1 Ye Bin            2022-09-20  7673  		}
f97a5528b21eb1 Ye Bin            2022-09-20  7674  		mddev->ro = MD_RDWR;
00bcb4ac7ee7e5 NeilBrown         2010-06-01  7675  		sysfs_notify_dirent_safe(mddev->sysfs_state);
f91de92ed6bfb7 NeilBrown         2005-11-08  7676  		set_bit(MD_RECOVERY_NEEDED, &mddev->recovery);
f3378b48705154 NeilBrown         2013-02-28  7677  		/* mddev_unlock will wake thread */
f3378b48705154 NeilBrown         2013-02-28  7678  		/* If a device failed while we were read-only, we
f3378b48705154 NeilBrown         2013-02-28  7679  		 * need to make sure the metadata is updated now.
f3378b48705154 NeilBrown         2013-02-28  7680  		 */
2953079c692da0 Shaohua Li        2016-12-08  7681  		if (test_bit(MD_SB_CHANGE_DEVS, &mddev->sb_flags)) {
f3378b48705154 NeilBrown         2013-02-28  7682  			mddev_unlock(mddev);
f3378b48705154 NeilBrown         2013-02-28  7683  			wait_event(mddev->sb_wait,
2953079c692da0 Shaohua Li        2016-12-08  7684  				   !test_bit(MD_SB_CHANGE_DEVS, &mddev->sb_flags) &&
2953079c692da0 Shaohua Li        2016-12-08  7685  				   !test_bit(MD_SB_CHANGE_PENDING, &mddev->sb_flags));
29f097c4d96802 NeilBrown         2013-11-14  7686  			mddev_lock_nointr(mddev);
f3378b48705154 NeilBrown         2013-02-28  7687  		}
f91de92ed6bfb7 NeilBrown         2005-11-08  7688  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7689  
c02c0aeb6c728e NeilBrown         2012-12-11  7690  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7691  	case ADD_NEW_DISK:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7692  	{
^1da177e4c3f41 Linus Torvalds    2005-04-16  7693  		mdu_disk_info_t info;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7694  		if (copy_from_user(&info, argp, sizeof(info)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  7695  			err = -EFAULT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7696  		else
7e0adbfc20c50b Christoph Hellwig 2020-06-07  7697  			err = md_add_new_disk(mddev, &info);
3adc28d85f18ae NeilBrown         2014-09-30  7698  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7699  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7700  
1aee41f637694d Goldwyn Rodrigues 2014-10-29  7701  	case CLUSTERED_DISK_NACK:
1aee41f637694d Goldwyn Rodrigues 2014-10-29  7702  		if (mddev_is_clustered(mddev))
1aee41f637694d Goldwyn Rodrigues 2014-10-29  7703  			md_cluster_ops->new_disk_ack(mddev, false);
1aee41f637694d Goldwyn Rodrigues 2014-10-29  7704  		else
1aee41f637694d Goldwyn Rodrigues 2014-10-29  7705  			err = -EINVAL;
1aee41f637694d Goldwyn Rodrigues 2014-10-29  7706  		goto unlock;
1aee41f637694d Goldwyn Rodrigues 2014-10-29  7707  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7708  	case HOT_ADD_DISK:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7709  		err = hot_add_disk(mddev, new_decode_dev(arg));
3adc28d85f18ae NeilBrown         2014-09-30  7710  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7711  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7712  	case RUN_ARRAY:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7713  		err = do_md_run(mddev);
3adc28d85f18ae NeilBrown         2014-09-30  7714  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7715  
32a7627cf3a353 NeilBrown         2005-06-21  7716  	case SET_BITMAP_FILE:
32a7627cf3a353 NeilBrown         2005-06-21  7717  		err = set_bitmap_file(mddev, (int)arg);
3adc28d85f18ae NeilBrown         2014-09-30  7718  		goto unlock;
32a7627cf3a353 NeilBrown         2005-06-21  7719  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7720  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  7721  		err = -EINVAL;
3adc28d85f18ae NeilBrown         2014-09-30  7722  		goto unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7723  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7724  
3adc28d85f18ae NeilBrown         2014-09-30  7725  unlock:
d3374825ce57ba NeilBrown         2009-01-09  7726  	if (mddev->hold_active == UNTIL_IOCTL &&
d3374825ce57ba NeilBrown         2009-01-09  7727  	    err != -EINVAL)
d3374825ce57ba NeilBrown         2009-01-09  7728  		mddev->hold_active = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7729  	mddev_unlock(mddev);
3adc28d85f18ae NeilBrown         2014-09-30  7730  out:
065e519e71b2c1 NeilBrown         2017-04-06  7731  	if (did_set_md_closing)
065e519e71b2c1 NeilBrown         2017-04-06  7732  		clear_bit(MD_CLOSING, &mddev->flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  7733  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7734  }
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7735  #ifdef CONFIG_COMPAT
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7736  static int md_compat_ioctl(struct block_device *bdev, fmode_t mode,
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7737  		    unsigned int cmd, unsigned long arg)
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7738  {
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7739  	switch (cmd) {
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7740  	case HOT_REMOVE_DISK:
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7741  	case HOT_ADD_DISK:
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7742  	case SET_DISK_FAULTY:
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7743  	case SET_BITMAP_FILE:
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7744  		/* These take in integer arg, do not convert */
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7745  		break;
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7746  	default:
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7747  		arg = (unsigned long)compat_ptr(arg);
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7748  		break;
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7749  	}
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7750  
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7751  	return md_ioctl(bdev, mode, cmd, arg);
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7752  }
aa98aa31987ad9 Arnd Bergmann     2009-12-14  7753  #endif /* CONFIG_COMPAT */
^1da177e4c3f41 Linus Torvalds    2005-04-16  7754  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
