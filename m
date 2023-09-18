Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9851C2BF
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Sep 2023 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695032352; x=1726568352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xyXA5FV9WIZzVnjhT5PtlluW89+HgTNn6N7QhN6cwoA=;
  b=LTFZy/GrIWGpfPXpKl0Gij2goDLTRIEYX6V7TUUzMNbz3N+sL8MB4GiF
   b2yZFqGTXqwJzDY7WduVnjDk9GIhXGXYJIrPDLX69jxSHV0vXf1FakqaJ
   aEJmjQ8v1u9qGvpzUSZ8I6yCnwvf0uZq/QGMqmtMAYV6JUmns+5IAK2eb
   yPagY/5rFrUwxX/hDOFVuX7+FA3Cp5mZRnv/tbe2wCBeDOKQINCvIpaqx
   Bs0DfbrWx9svblCX7IiVEe8bjRi4ELjZY9qnHC0DdxpPLbVevKmm2fsaA
   8XNK4OlhB188Xk/K6odsf50OkmjXlCUBE0GMmzCx6jY0JP3MQMo4dAup3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="379526510"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="379526510"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 03:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="869499681"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="869499681"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Sep 2023 03:19:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiBLP-00061M-0u;
	Mon, 18 Sep 2023 10:19:07 +0000
Date: Mon, 18 Sep 2023 18:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/fsi/i2cr-scom.c:50 i2cr_scom_read() warn: maybe return
 -EFAULT instead of the bytes remaining?
Message-ID: <202309181824.bTzfxPjm-lkp@intel.com>
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
head:   ce9ecca0238b140b88f43859b211c9fdfd8e5b70
commit: c0b34bed0bbf7a058dab52d45e9aeb92bbe4c637 fsi: Add I2C Responder SCOM driver
date:   5 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230918/202309181824.bTzfxPjm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230918/202309181824.bTzfxPjm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309181824.bTzfxPjm-lkp@intel.com/

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
