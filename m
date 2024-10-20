Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9E126BF0
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729416696; cv=none; b=S26Rlu5Oj++SpbBO/GUvFkmI8KXXSH+fSlEEp/2z/j12qhJ1RxFj5jIQ7/DMQHuRZ9UqWH4Z0+W14/6bb9j/xinzRwpIMKvf0Wj8a3rQHhZnOtPyQ1ugeX7e/q9Ccwq0DNK8B6n6AqiAqFav4ECAlMnMf0H56AEbqbgk1J3kFWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729416696; c=relaxed/simple;
	bh=RWjuNfqtgkUJc7oWBnjeYVJ9Qtv1srh27/jx1cONtt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YUVFe1crHEkzmN0gVOtTVRFIkoES5ZJ9lF2ygYhrRY9rM8SIV9SuBAmv8S7LqNz9gas4Uwn9h7DMZ+wjb8XdsBG3gbBTl5QwmAxrHIzmRhcC0bsG3EfNkzK7e4Lgt1CCc+Ajj6qFOr+fc4wdlPMylAcJcis9BEQPsGmLQagWuQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egdgjwx/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egdgjwx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729416694; x=1760952694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWjuNfqtgkUJc7oWBnjeYVJ9Qtv1srh27/jx1cONtt8=;
  b=egdgjwx/9+oA5N7mbbnK0YFvHNsmW7x4JBx5Mz59b2d33BtcKgV11atS
   lC6uS7MFWMHx27qIHa02hVTJwrcBDgtjjlHFPu5p0XBhbijhoEAMHz+Td
   GYkc1kxd5s744lDvaVO/+GPq+9a3HKW+sY8hV/CCMZS1Db34OaoBQ6crr
   26ypobP8KE8pb8AYtXMKOfLbbz2sdbWu04HGQfe0rmx0xMoqHWlOGgKS0
   2Vaa90/ZEZyGAQpUV4vWe6HqpId9TbXr6ppT2i4ZGQgYdlv1wkm2aicQ1
   N0u3/XuKEd8uYEHogpH8C3PtJjueoSzf5A83gfXBehZ1nxqPaYoZUlLb/
   A==;
X-CSE-ConnectionGUID: obH99ayeSQeUCEJw4UJTYg==
X-CSE-MsgGUID: Q7udH5WqSPmG+u/g8KHSKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28694908"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28694908"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 02:31:31 -0700
X-CSE-ConnectionGUID: 4qLi+aiHTmeQT3RVbV5rUw==
X-CSE-MsgGUID: YRkWyOc2R4aBVgoXMGIC6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="83834933"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Oct 2024 02:31:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2SHY-000Q9a-0G;
	Sun, 20 Oct 2024 09:31:28 +0000
Date: Sun, 20 Oct 2024 17:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dtor-input:next 104/120] drivers/input/serio/serio_raw.c:204
 serio_raw_write() error: uninitialized symbol 'written'.
Message-ID: <202410201759.qnyACw46-lkp@intel.com>
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
CC: linux-input@vger.kernel.org
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   00850d7b542aa4a8240cf977d43dc6d2158e48d7
commit: 5b53a9d40c4f83b44de8da06af9a9c9b3fb14988 [104/120] Input: serio_raw - use guard notation for locks and other resources
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: alpha-randconfig-r072-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201759.qnyACw46-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410201759.qnyACw46-lkp@intel.com/

New smatch warnings:
drivers/input/serio/serio_raw.c:204 serio_raw_write() error: uninitialized symbol 'written'.

Old smatch warnings:
drivers/input/serio/serio_raw.c:207 serio_raw_write() error: uninitialized symbol 'written'.
drivers/input/serio/serio_raw.c:210 serio_raw_write() error: uninitialized symbol 'written'.

vim +/written +204 drivers/input/serio/serio_raw.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  182  
15a564d8dbfc94 Dmitry Torokhov 2011-10-10  183  static ssize_t serio_raw_write(struct file *file, const char __user *buffer,
15a564d8dbfc94 Dmitry Torokhov 2011-10-10  184  			       size_t count, loff_t *ppos)
^1da177e4c3f41 Linus Torvalds  2005-04-16  185  {
7c5bbb2eb7ad04 Dmitry Torokhov 2011-10-10  186  	struct serio_raw_client *client = file->private_data;
7c5bbb2eb7ad04 Dmitry Torokhov 2011-10-10  187  	struct serio_raw *serio_raw = client->serio_raw;
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  188  	int written;
^1da177e4c3f41 Linus Torvalds  2005-04-16  189  	unsigned char c;
^1da177e4c3f41 Linus Torvalds  2005-04-16  190  
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  191  	scoped_guard(mutex_intr, &serio_raw_mutex) {
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  192  		if (serio_raw->dead)
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  193  			return -ENODEV;
^1da177e4c3f41 Linus Torvalds  2005-04-16  194  
^1da177e4c3f41 Linus Torvalds  2005-04-16  195  		if (count > 32)
^1da177e4c3f41 Linus Torvalds  2005-04-16  196  			count = 32;
^1da177e4c3f41 Linus Torvalds  2005-04-16  197  
^1da177e4c3f41 Linus Torvalds  2005-04-16  198  		while (count--) {
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  199  			if (get_user(c, buffer++))
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  200  				return -EFAULT;
46f49b7a223ac7 Dmitry Torokhov 2012-05-02  201  
7c5bbb2eb7ad04 Dmitry Torokhov 2011-10-10  202  			if (serio_write(serio_raw->serio, c)) {
46f49b7a223ac7 Dmitry Torokhov 2012-05-02  203  				/* Either signal error or partial write */
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04 @204  				return written ?: -EIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  205  			}
46f49b7a223ac7 Dmitry Torokhov 2012-05-02  206  
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  207  			written++;
d89c9bcb339095 Che-Liang Chiou 2012-01-10  208  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  209  
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  210  		return written;
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  211  	}
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  212  
5b53a9d40c4f83 Dmitry Torokhov 2024-09-04  213  	return -EINTR;
^1da177e4c3f41 Linus Torvalds  2005-04-16  214  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
