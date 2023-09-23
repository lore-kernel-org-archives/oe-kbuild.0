Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2B6208BF
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 20:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695499729; x=1727035729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RlzztZTzmMxR1DJL8T23i5gnwJe+v/Z7TOFb+J5VC3Q=;
  b=IXHdXZKJ+bJIuzX1JPuunAqMvoJ4sufzi9efKWyIxWE4mTa+3plgz47Y
   Mc7+BxFi2niAEmfN64KN2Wo994TXTHTc66aCYvOowt71w9m/iIRyHlp/o
   DaGrnyBs/BXQugxDEPF0+qL5nkkRbff8J26OGgkxwNfmsyRd2FvwcMYUo
   SQl92NkSqR5KmLWswMQEM4M+YkX4BMhCeQk9OgZLs/MFiPHtDknXTsIrP
   4Sxsy2KfQ7jludhrYm6Sv0aez90xhVPBUTOxGh5WlOu0OrAKNcZ2c6VmI
   /4ux1z9JcW5jVPFo7mUuU+nRh5j1SaDrklSB2Di8f63PUloAW7RteMbhP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="383810309"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="383810309"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 13:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="994914844"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="994914844"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2023 13:08:47 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk8vl-0002nJ-1U;
	Sat, 23 Sep 2023 20:08:45 +0000
Date: Sun, 24 Sep 2023 04:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/fsi/i2cr-scom.c:50 i2cr_scom_read() warn: maybe return
 -EFAULT instead of the bytes remaining?
Message-ID: <202309240413.DL08aSAL-lkp@intel.com>
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
TO: Eddie James <eajames@linux.ibm.com>
CC: Joel Stanley <joel@jms.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a4de7dc9e77ca914bb050e6d661624a43db794c
commit: c0b34bed0bbf7a058dab52d45e9aeb92bbe4c637 fsi: Add I2C Responder SCOM driver
date:   6 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 weeks ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230924/202309240413.DL08aSAL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309240413.DL08aSAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309240413.DL08aSAL-lkp@intel.com/

smatch warnings:
drivers/fsi/i2cr-scom.c:50 i2cr_scom_read() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/fsi/i2cr-scom.c:67 i2cr_scom_write() warn: maybe return -EFAULT instead of the bytes remaining?

vim +50 drivers/fsi/i2cr-scom.c

c0b34bed0bbf7a Eddie James 2023-06-12  34  
c0b34bed0bbf7a Eddie James 2023-06-12  35  static ssize_t i2cr_scom_read(struct file *filep, char __user *buf, size_t len, loff_t *offset)
c0b34bed0bbf7a Eddie James 2023-06-12  36  {
c0b34bed0bbf7a Eddie James 2023-06-12  37  	struct i2cr_scom *scom = filep->private_data;
c0b34bed0bbf7a Eddie James 2023-06-12  38  	u64 data;
c0b34bed0bbf7a Eddie James 2023-06-12  39  	int ret;
c0b34bed0bbf7a Eddie James 2023-06-12  40  
c0b34bed0bbf7a Eddie James 2023-06-12  41  	if (len != sizeof(data))
c0b34bed0bbf7a Eddie James 2023-06-12  42  		return -EINVAL;
c0b34bed0bbf7a Eddie James 2023-06-12  43  
c0b34bed0bbf7a Eddie James 2023-06-12  44  	ret = fsi_master_i2cr_read(scom->i2cr, (u32)*offset, &data);
c0b34bed0bbf7a Eddie James 2023-06-12  45  	if (ret)
c0b34bed0bbf7a Eddie James 2023-06-12  46  		return ret;
c0b34bed0bbf7a Eddie James 2023-06-12  47  
c0b34bed0bbf7a Eddie James 2023-06-12  48  	ret = copy_to_user(buf, &data, len);
c0b34bed0bbf7a Eddie James 2023-06-12  49  	if (ret)
c0b34bed0bbf7a Eddie James 2023-06-12 @50  		return ret;
c0b34bed0bbf7a Eddie James 2023-06-12  51  
c0b34bed0bbf7a Eddie James 2023-06-12  52  	return len;
c0b34bed0bbf7a Eddie James 2023-06-12  53  }
c0b34bed0bbf7a Eddie James 2023-06-12  54  
c0b34bed0bbf7a Eddie James 2023-06-12  55  static ssize_t i2cr_scom_write(struct file *filep, const char __user *buf, size_t len,
c0b34bed0bbf7a Eddie James 2023-06-12  56  			       loff_t *offset)
c0b34bed0bbf7a Eddie James 2023-06-12  57  {
c0b34bed0bbf7a Eddie James 2023-06-12  58  	struct i2cr_scom *scom = filep->private_data;
c0b34bed0bbf7a Eddie James 2023-06-12  59  	u64 data;
c0b34bed0bbf7a Eddie James 2023-06-12  60  	int ret;
c0b34bed0bbf7a Eddie James 2023-06-12  61  
c0b34bed0bbf7a Eddie James 2023-06-12  62  	if (len != sizeof(data))
c0b34bed0bbf7a Eddie James 2023-06-12  63  		return -EINVAL;
c0b34bed0bbf7a Eddie James 2023-06-12  64  
c0b34bed0bbf7a Eddie James 2023-06-12  65  	ret = copy_from_user(&data, buf, len);
c0b34bed0bbf7a Eddie James 2023-06-12  66  	if (ret)
c0b34bed0bbf7a Eddie James 2023-06-12 @67  		return ret;
c0b34bed0bbf7a Eddie James 2023-06-12  68  
c0b34bed0bbf7a Eddie James 2023-06-12  69  	ret = fsi_master_i2cr_write(scom->i2cr, (u32)*offset, data);
c0b34bed0bbf7a Eddie James 2023-06-12  70  	if (ret)
c0b34bed0bbf7a Eddie James 2023-06-12  71  		return ret;
c0b34bed0bbf7a Eddie James 2023-06-12  72  
c0b34bed0bbf7a Eddie James 2023-06-12  73  	return len;
c0b34bed0bbf7a Eddie James 2023-06-12  74  }
c0b34bed0bbf7a Eddie James 2023-06-12  75  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
