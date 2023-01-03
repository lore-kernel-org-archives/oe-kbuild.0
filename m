Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84CC160
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Jan 2023 22:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672785222; x=1704321222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ten0bKFPaOLCCfCZTaa8MGHgh1vM9n0+aSFVxwkGHug=;
  b=Bn9GZsdoK/ZmBCDG13UvbnWT5oXycUqO8d7NTFsggDWrmNySKIEhvKQx
   IMySV3mysKY7MDADBmzJpfM0xylCjAegHs84euUPJbAhCrnhSoVDTRuCB
   vVXqcHin/SDmOWfgeWqQ68nxMlm0EHC6XPBVKE/p2wT8XZGpHMvmXU5UR
   VnFAfB3EaqI9JSouB+O/sb4I3NKjSuqAUvIjv5EbNxOTrz5kC/ylQFh9M
   mVdToHRpMdCng8mf5VD7IEXgpXnfQs8ldr71tiUyh0l9qt/1WNWID8bIs
   JN5pm7gkVGBjZFJ4VVSxTsaXkJ74npqvCUVnb9fbyf0uoFPKZ7iDgM6UZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="384063577"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="384063577"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 14:33:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="743644924"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="743644924"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Jan 2023 14:33:41 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCpqm-000Sqf-1Y;
	Tue, 03 Jan 2023 22:33:40 +0000
Date: Wed, 4 Jan 2023 06:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/spi/spidev.c:577:13: warning: Uninitialized variable:
 iter->devt [uninitvar]
Message-ID: <202301040637.xTKDGSbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/spi/spidev.c:577:13: warning: Uninitialized variable: iter->devt [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69b41ac87e4a664de78a395ff97166f0b2943210
commit: d50d7e91c6e5ccd71f21ba1aec3fef7ee4229fd6 spi: spidev: replace usage of found with dedicated list iterator variable
date:   9 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 months ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d50d7e91c6e5ccd71f21ba1aec3fef7ee4229fd6
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> fs/btrfs/inode.c:1005:13: warning: Local variable 'start' shadows outer variable [shadowVariable]
     const u64 start = async_extent->start;
               ^
   fs/btrfs/inode.c:927:6: note: Shadowed declaration
    u64 start = async_extent->start;
        ^
   fs/btrfs/inode.c:1005:13: note: Shadow variable
     const u64 start = async_extent->start;
               ^
>> fs/btrfs/inode.c:1006:13: warning: Local variable 'end' shadows outer variable [shadowVariable]
     const u64 end = start + async_extent->ram_size - 1;
               ^
   fs/btrfs/inode.c:928:6: note: Shadowed declaration
    u64 end = async_extent->start + async_extent->ram_size - 1;
        ^
   fs/btrfs/inode.c:1006:13: note: Shadow variable
     const u64 end = start + async_extent->ram_size - 1;
               ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/spi/spidev.c:577:13: warning: Uninitialized variable: iter->devt [uninitvar]
     if (iter->devt == inode->i_rdev) {
               ^
--
>> drivers/usb/class/cdc-acm.c:259:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    return sprintf(buf, "%d", acm->ctrl_caps);
           ^
   drivers/usb/class/cdc-acm.c:281:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    return sprintf(buf, "%d", acm->country_rel_date);
           ^
>> drivers/tty/serial/max310x.c:573:23: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
       pllcfg = (0 << 6) | div;
                         ^
>> drivers/usb/serial/quatech2.c:229:2: warning: Assignment of function parameter has no effect outside the function. [uselessAssignmentArg]
    clear &= ~set; /* 'set' takes precedence over 'clear' */
    ^
   fs/btrfs/inode.c:2020:3: warning: Redundant condition: zoned. '!zoned || (zoned && btrfs_is_data_reloc_root(inode->root))' is equivalent to '!zoned || btrfs_is_data_reloc_root(inode->root)' [redundantCondition]
     ASSERT(!zoned ||
     ^
   fs/btrfs/inode.c:2190:21: warning: Parameter 'bits' can be declared as pointer to const [constParameter]
             unsigned *bits)
                       ^
   fs/btrfs/inode.c:2241:44: warning: Parameter 'bits' can be declared as pointer to const [constParameter]
        struct extent_state *state, unsigned *bits)
                                              ^
>> fs/btrfs/inode.c:5956:70: warning: Parameter 'now' can be declared as pointer to const [constParameter]
   static int btrfs_update_time(struct inode *inode, struct timespec64 *now,
                                                                        ^
>> fs/btrfs/tree-log.h:52:28: warning: Uninitialized variables: ordered.file_offset, ordered.num_bytes, ordered.ram_bytes, ordered.disk_bytenr, ordered.disk_num_bytes, ordered.offset, ordered.bytes_left, ordered.outstanding_isize, ordered.truncated_len, ordered.flags, ordered.compress_type, ordered.qgroup_rsv, ordered.refs, ordered.inode, ordered.list, ordered.wait, ordered.rb_node, ordered.root_extent_list, ordered.work, ordered.completion, ordered.flush_work, ordered.work_list, ordered.physical, ordered.bdev [uninitvar]
     btrfs_put_ordered_extent(ordered);
                              ^
>> fs/btrfs/inode.c:2607:16: warning: Uninitialized variable: sum->bytenr [uninitvar]
             sum->bytenr);
                  ^

vim +577 drivers/spi/spidev.c

7d48ec3698e7b7 Bernhard Walle    2011-02-03  568  
814a8d50eb1d88 Andrea Paterniani 2007-05-08  569  static int spidev_open(struct inode *inode, struct file *filp)
814a8d50eb1d88 Andrea Paterniani 2007-05-08  570  {
d50d7e91c6e5cc Jakob Koschel     2022-03-24  571  	struct spidev_data	*spidev = NULL, *iter;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  572  	int			status = -ENXIO;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  573  
814a8d50eb1d88 Andrea Paterniani 2007-05-08  574  	mutex_lock(&device_list_lock);
814a8d50eb1d88 Andrea Paterniani 2007-05-08  575  
d50d7e91c6e5cc Jakob Koschel     2022-03-24  576  	list_for_each_entry(iter, &device_list, device_entry) {
d50d7e91c6e5cc Jakob Koschel     2022-03-24 @577  		if (iter->devt == inode->i_rdev) {
814a8d50eb1d88 Andrea Paterniani 2007-05-08  578  			status = 0;
d50d7e91c6e5cc Jakob Koschel     2022-03-24  579  			spidev = iter;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  580  			break;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  581  		}
814a8d50eb1d88 Andrea Paterniani 2007-05-08  582  	}
865f6d1974ddd9 Ray Jui           2014-10-09  583  
d50d7e91c6e5cc Jakob Koschel     2022-03-24  584  	if (!spidev) {
865f6d1974ddd9 Ray Jui           2014-10-09  585  		pr_debug("spidev: nothing for minor %d\n", iminor(inode));
865f6d1974ddd9 Ray Jui           2014-10-09  586  		goto err_find_dev;
865f6d1974ddd9 Ray Jui           2014-10-09  587  	}
865f6d1974ddd9 Ray Jui           2014-10-09  588  
865f6d1974ddd9 Ray Jui           2014-10-09  589  	if (!spidev->tx_buffer) {
865f6d1974ddd9 Ray Jui           2014-10-09  590  		spidev->tx_buffer = kmalloc(bufsiz, GFP_KERNEL);
865f6d1974ddd9 Ray Jui           2014-10-09  591  		if (!spidev->tx_buffer) {
814a8d50eb1d88 Andrea Paterniani 2007-05-08  592  			dev_dbg(&spidev->spi->dev, "open/ENOMEM\n");
814a8d50eb1d88 Andrea Paterniani 2007-05-08  593  			status = -ENOMEM;
865f6d1974ddd9 Ray Jui           2014-10-09  594  			goto err_find_dev;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  595  		}
814a8d50eb1d88 Andrea Paterniani 2007-05-08  596  	}
865f6d1974ddd9 Ray Jui           2014-10-09  597  
865f6d1974ddd9 Ray Jui           2014-10-09  598  	if (!spidev->rx_buffer) {
865f6d1974ddd9 Ray Jui           2014-10-09  599  		spidev->rx_buffer = kmalloc(bufsiz, GFP_KERNEL);
865f6d1974ddd9 Ray Jui           2014-10-09  600  		if (!spidev->rx_buffer) {
865f6d1974ddd9 Ray Jui           2014-10-09  601  			dev_dbg(&spidev->spi->dev, "open/ENOMEM\n");
865f6d1974ddd9 Ray Jui           2014-10-09  602  			status = -ENOMEM;
865f6d1974ddd9 Ray Jui           2014-10-09  603  			goto err_alloc_rx_buf;
865f6d1974ddd9 Ray Jui           2014-10-09  604  		}
865f6d1974ddd9 Ray Jui           2014-10-09  605  	}
865f6d1974ddd9 Ray Jui           2014-10-09  606  
814a8d50eb1d88 Andrea Paterniani 2007-05-08  607  	spidev->users++;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  608  	filp->private_data = spidev;
c5bf68fe0c86a5 Kirill Smelkov    2019-03-26  609  	stream_open(inode, filp);
814a8d50eb1d88 Andrea Paterniani 2007-05-08  610  
865f6d1974ddd9 Ray Jui           2014-10-09  611  	mutex_unlock(&device_list_lock);
865f6d1974ddd9 Ray Jui           2014-10-09  612  	return 0;
865f6d1974ddd9 Ray Jui           2014-10-09  613  
865f6d1974ddd9 Ray Jui           2014-10-09  614  err_alloc_rx_buf:
865f6d1974ddd9 Ray Jui           2014-10-09  615  	kfree(spidev->tx_buffer);
865f6d1974ddd9 Ray Jui           2014-10-09  616  	spidev->tx_buffer = NULL;
865f6d1974ddd9 Ray Jui           2014-10-09  617  err_find_dev:
814a8d50eb1d88 Andrea Paterniani 2007-05-08  618  	mutex_unlock(&device_list_lock);
814a8d50eb1d88 Andrea Paterniani 2007-05-08  619  	return status;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  620  }
814a8d50eb1d88 Andrea Paterniani 2007-05-08  621  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
