Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF0D635
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Nov 2022 03:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667360862; x=1698896862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPGe4CMj6WQCJMu3zqw5UIZ8nG4ZrXpDtGbu5Ve07qA=;
  b=i+32OVcsVEMfEnaqjCkodTsPyqJt6zCU8loOSYQ19lkuKt2ReKqWohEF
   +B5tpS4HMGJtB0zlF16M5k0Ny9SyqyBPcd2336S2j5nH/4rzBWWnSSDuJ
   kicqDWFWGnr1BKBFS7kTJqHZYn+vsR1XBsdOi/0Nm2Ti+i4ugFju3otHS
   djZxsT6yeSTV97NSFFG74FzkNjzEHqskpCZsHalLVDHsYfWtDKgGaLSnC
   7FfiyJAF03Icf7flnpYtIhMDPiUsy2agd0hcONFt85CdsVJCm7CDMfKKq
   SK25Q/RHq8zzhwsZlPrvaSYemk0FOOzCCWUZDivZojN1U6JWZPxR3Zk28
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310409461"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="310409461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 20:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="665397454"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="665397454"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Nov 2022 20:47:41 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oq4j6-000EPZ-2F;
	Wed, 02 Nov 2022 03:47:40 +0000
Date: Wed, 2 Nov 2022 11:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/cxl/core/hdm.c:65:2: warning: Statements following return,
 break, continue, goto or throw will never be executed. [unreachableCode]
Message-ID: <202211021150.1riqQ8GB-lkp@intel.com>
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
head:   8f71a2b3f435f29b787537d1abedaa7d8ebe6647
commit: 391785859e7e6521f622ad8c965c9792767023bc cxl/port: Move dport tracking to an xarray
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
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
