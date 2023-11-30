Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7BA59144
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqNXnYmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701380478; x=1732916478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0PTAyabGLQ7HsCCCRpJNu5IVTLe1K6MZGEcJCsUufz0=;
  b=NqNXnYmAxEbhlj3wgWV/P4kNCBHbQ3Yod/03gvDDOLkUjgwCLHNUvwGH
   QtKbVX1w/CxFuQLECFNg1BkloqZdDzzu/w7H3/4AIACoEWb+nniPq39hF
   ZEjQJ72Vv81WdBmoiVXfWh39z5ZWH3T1YFiYZK686yw1zWoUdeSChG89j
   q8XcWxhMPe3TRUvJweLA/QRWVe9jQT0ewNsIXvugxSV5YiMQpub13bIqW
   EevTiXCqgpw9VYDMTYrkikiq7eGAuRIywe9n8jqa9Jg6W3O0apGE+pg4/
   VwP3XZJFUdvWt5JRr1T92LuFhQl/NgtWt1IgAoSGOfOrQ9Kh+mRYnC+nI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="396200078"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="396200078"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 13:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="762886334"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="762886334"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Nov 2023 13:41:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8ol2-0002g3-1f;
	Thu, 30 Nov 2023 21:40:04 +0000
Date: Fri, 1 Dec 2023 05:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 1/2] exfat: change to get file size from DataLength
Message-ID: <202312010428.73gtRyvj-lkp@intel.com>
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
In-Reply-To: <PUZPR04MB6316F0640983B00CC55D903F8182A@PUZPR04MB6316.apcprd04.prod.outlook.com>
References: <PUZPR04MB6316F0640983B00CC55D903F8182A@PUZPR04MB6316.apcprd04.prod.outlook.com>
TO: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>
TO: "linkinjeon@kernel.org" <linkinjeon@kernel.org>
TO: "sj1557.seo@samsung.com" <sj1557.seo@samsung.com>
CC: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
CC: "Andy.Wu@sony.com" <Andy.Wu@sony.com>
CC: "Wataru.Aoyama@sony.com" <Wataru.Aoyama@sony.com>
CC: "cpgs@samsung.com" <cpgs@samsung.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc3 next-20231130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuezhang-Mo-sony-com/exfat-do-not-zero-the-extended-part/20231130-164222
base:   linus/master
patch link:    https://lore.kernel.org/r/PUZPR04MB6316F0640983B00CC55D903F8182A%40PUZPR04MB6316.apcprd04.prod.outlook.com
patch subject: [PATCH v5 1/2] exfat: change to get file size from DataLength
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-r081-20231130 (https://download.01.org/0day-ci/archive/20231201/202312010428.73gtRyvj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010428.73gtRyvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312010428.73gtRyvj-lkp@intel.com/

smatch warnings:
fs/exfat/inode.c:525 exfat_direct_IO() warn: bitwise AND condition is false here

vim +525 fs/exfat/inode.c

5f2aa075070cf5b Namjae Jeon          2020-03-02  485  
5f2aa075070cf5b Namjae Jeon          2020-03-02  486  static ssize_t exfat_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
5f2aa075070cf5b Namjae Jeon          2020-03-02  487  {
5f2aa075070cf5b Namjae Jeon          2020-03-02  488  	struct address_space *mapping = iocb->ki_filp->f_mapping;
5f2aa075070cf5b Namjae Jeon          2020-03-02  489  	struct inode *inode = mapping->host;
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  490  	struct exfat_inode_info *ei = EXFAT_I(inode);
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  491  	loff_t pos = iocb->ki_pos;
5f2aa075070cf5b Namjae Jeon          2020-03-02  492  	loff_t size = iocb->ki_pos + iov_iter_count(iter);
5f2aa075070cf5b Namjae Jeon          2020-03-02  493  	int rw = iov_iter_rw(iter);
5f2aa075070cf5b Namjae Jeon          2020-03-02  494  	ssize_t ret;
5f2aa075070cf5b Namjae Jeon          2020-03-02  495  
5f2aa075070cf5b Namjae Jeon          2020-03-02  496  	if (rw == WRITE) {
5f2aa075070cf5b Namjae Jeon          2020-03-02  497  		/*
5f2aa075070cf5b Namjae Jeon          2020-03-02  498  		 * FIXME: blockdev_direct_IO() doesn't use ->write_begin(),
5f2aa075070cf5b Namjae Jeon          2020-03-02  499  		 * so we need to update the ->i_size_aligned to block boundary.
5f2aa075070cf5b Namjae Jeon          2020-03-02  500  		 *
5f2aa075070cf5b Namjae Jeon          2020-03-02  501  		 * But we must fill the remaining area or hole by nul for
5f2aa075070cf5b Namjae Jeon          2020-03-02  502  		 * updating ->i_size_aligned
5f2aa075070cf5b Namjae Jeon          2020-03-02  503  		 *
5f2aa075070cf5b Namjae Jeon          2020-03-02  504  		 * Return 0, and fallback to normal buffered write.
5f2aa075070cf5b Namjae Jeon          2020-03-02  505  		 */
5f2aa075070cf5b Namjae Jeon          2020-03-02  506  		if (EXFAT_I(inode)->i_size_aligned < size)
5f2aa075070cf5b Namjae Jeon          2020-03-02  507  			return 0;
5f2aa075070cf5b Namjae Jeon          2020-03-02  508  	}
5f2aa075070cf5b Namjae Jeon          2020-03-02  509  
5f2aa075070cf5b Namjae Jeon          2020-03-02  510  	/*
5f2aa075070cf5b Namjae Jeon          2020-03-02  511  	 * Need to use the DIO_LOCKING for avoiding the race
5f2aa075070cf5b Namjae Jeon          2020-03-02  512  	 * condition of exfat_get_block() and ->truncate().
5f2aa075070cf5b Namjae Jeon          2020-03-02  513  	 */
5f2aa075070cf5b Namjae Jeon          2020-03-02  514  	ret = blockdev_direct_IO(iocb, inode, iter, exfat_get_block);
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  515  	if (ret < 0) {
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  516  		if (rw & WRITE)
5f2aa075070cf5b Namjae Jeon          2020-03-02  517  			exfat_write_failed(mapping, size);
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  518  
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  519  		if (ret != -EIOCBQUEUED)
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  520  			return ret;
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  521  	} else
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  522  		size = pos + ret;
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  523  
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  524  	/* zero the unwritten part in the partially written block */
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30 @525  	if ((rw & READ) && pos < ei->valid_size && ei->valid_size < size) {
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  526  		iov_iter_revert(iter, size - ei->valid_size);
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  527  		iov_iter_zero(size - ei->valid_size, iter);
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  528  	}
6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  529  
5f2aa075070cf5b Namjae Jeon          2020-03-02  530  	return ret;
5f2aa075070cf5b Namjae Jeon          2020-03-02  531  }
5f2aa075070cf5b Namjae Jeon          2020-03-02  532  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
