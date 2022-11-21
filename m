Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD6D63CA
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Nov 2022 15:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669044989; x=1700580989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLc8WX8P0j91q2aZFhf0naMYNX3aEbyr6WqQJI1JCP8=;
  b=crN/ygGtDzoMimtqYEjP8AEoAJN9UGZkq8tZRQWDWhqJviKkJpZ4joD9
   6zTER4VZ8AYurcP7pFHkwgnbGRX0HTVHTtmS1JIdnZ5FdhOTdfimQJhrN
   vwv/+BlvLaf+sMtD4M1XT/haFsQZBHidcNA6Nq23AM8l/UXo8nC4ETWJN
   kfCMkpp904g9YXs+qaikjl1Dm5PYzPsjLId+85mHv55en6DQULcqjYSkx
   bJPlFNlVmL+z+OGakH6r1K+vL5SajsEJvBFDhxq+99aHDKWxpyKG8mNH4
   OTxuKqOF6mYuH+zELI+me3+K0xOBuUjROBusE/BXja8OFMd9sFtqzwKA/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="399875353"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="399875353"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 07:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="643360309"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="643360309"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Nov 2022 07:36:27 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ox8qR-0000Xx-0B;
	Mon, 21 Nov 2022 15:36:27 +0000
Date: Mon, 21 Nov 2022 23:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/cxl/core/hdm.c:65:2: warning: Statements following return,
 break, continue, goto or throw will never be executed. [unreachableCode]
Message-ID: <202211212320.h1MxIrPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/cxl/core/hdm.c:65:2: warning: Statements following return, break, continue, goto or throw will never be executed. [unreachableCode]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
commit: 391785859e7e6521f622ad8c965c9792767023bc cxl/port: Move dport tracking to an xarray
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 391785859e7e6521f622ad8c965c9792767023bc
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/cxl/core/hdm.c:65:2: warning: Statements following return, break, continue, goto or throw will never be executed. [unreachableCode]
    single_port_map[0] = dport->port_id;
    ^

vim +65 drivers/cxl/core/hdm.c

d17d0540a0dbf1 Dan Williams 2022-02-01  42  
d17d0540a0dbf1 Dan Williams 2022-02-01  43  /*
d17d0540a0dbf1 Dan Williams 2022-02-01  44   * Per the CXL specification (8.2.5.12 CXL HDM Decoder Capability Structure)
d17d0540a0dbf1 Dan Williams 2022-02-01  45   * single ported host-bridges need not publish a decoder capability when a
d17d0540a0dbf1 Dan Williams 2022-02-01  46   * passthrough decode can be assumed, i.e. all transactions that the uport sees
d17d0540a0dbf1 Dan Williams 2022-02-01  47   * are claimed and passed to the single dport. Disable the range until the first
d17d0540a0dbf1 Dan Williams 2022-02-01  48   * CXL region is enumerated / activated.
d17d0540a0dbf1 Dan Williams 2022-02-01  49   */
664bf115833c2d Dan Williams 2022-02-01  50  int devm_cxl_add_passthrough_decoder(struct cxl_port *port)
d17d0540a0dbf1 Dan Williams 2022-02-01  51  {
e636479e2f1b61 Dan Williams 2022-05-18  52  	struct cxl_switch_decoder *cxlsd;
391785859e7e65 Dan Williams 2022-05-27  53  	struct cxl_dport *dport = NULL;
d17d0540a0dbf1 Dan Williams 2022-02-01  54  	int single_port_map[1];
391785859e7e65 Dan Williams 2022-05-27  55  	unsigned long index;
d17d0540a0dbf1 Dan Williams 2022-02-01  56  
e636479e2f1b61 Dan Williams 2022-05-18  57  	cxlsd = cxl_switch_decoder_alloc(port, 1);
e636479e2f1b61 Dan Williams 2022-05-18  58  	if (IS_ERR(cxlsd))
e636479e2f1b61 Dan Williams 2022-05-18  59  		return PTR_ERR(cxlsd);
d17d0540a0dbf1 Dan Williams 2022-02-01  60  
d17d0540a0dbf1 Dan Williams 2022-02-01  61  	device_lock_assert(&port->dev);
d17d0540a0dbf1 Dan Williams 2022-02-01  62  
391785859e7e65 Dan Williams 2022-05-27  63  	xa_for_each(&port->dports, index, dport)
391785859e7e65 Dan Williams 2022-05-27  64  		break;
d17d0540a0dbf1 Dan Williams 2022-02-01 @65  	single_port_map[0] = dport->port_id;
d17d0540a0dbf1 Dan Williams 2022-02-01  66  
e636479e2f1b61 Dan Williams 2022-05-18  67  	return add_hdm_decoder(port, &cxlsd->cxld, single_port_map);
d17d0540a0dbf1 Dan Williams 2022-02-01  68  }
d17d0540a0dbf1 Dan Williams 2022-02-01  69  EXPORT_SYMBOL_NS_GPL(devm_cxl_add_passthrough_decoder, CXL);
d17d0540a0dbf1 Dan Williams 2022-02-01  70  

:::::: The code at line 65 was first introduced by commit
:::::: d17d0540a0dbf109210f7b57a37571e2978da0fa cxl/core/hdm: Add CXL standard decoder enumeration to the core

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
