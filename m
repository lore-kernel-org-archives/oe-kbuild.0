Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA620EC08
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Nov 2022 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668017694; x=1699553694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zInS/7KzgbPcWIup7LJycHkEt0PRk1CvzCeF7gncIO0=;
  b=LJgns0lDhRQvnSpnGHNvaBdOKyALTqjzjV6KVVyNmByuSmHiU+aFOz5I
   AuxkfF6WyKQUp+Fe7UxwI9xeHvYA/KCkddnpGeJuZDJ/9ACI08SqauF4l
   ShMzSPqU048G4rsgLSYjHMNBquwxAc+t6Z6PZG3Z3QX8BMXQtTHFvmfzz
   byxkRTNlCgsIVlpPxp+JQgCClnO2IgWeDHWmiyB3tf57jXiMZaX/hpJuj
   dV9LJhU6X36GDxks1/Elq6+Tef3jchKy6Bun72Df98/0Cz++vVDTenN9q
   Sn6zanCpYZRIGxDb+rGAuAn2KS9KkwsXY9U5N8fc2jgoaWd0ml+E0w/Nd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="298583145"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; 
   d="scan'208";a="298583145"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 10:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="614784960"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; 
   d="scan'208";a="614784960"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2022 10:14:52 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ospb9-0001zE-1c;
	Wed, 09 Nov 2022 18:14:51 +0000
Date: Thu, 10 Nov 2022 02:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/sysctl.c:317:52: warning: Parameter 'ppos' can be declared as
 pointer to const [constParameter]
Message-ID: <202211100225.M5DAyGow-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/sysctl.c:317:52: warning: Parameter 'ppos' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Xiaoming Ni <nixiaoming@huawei.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f141df371335645ce29a87d9683a3f79fba7fd67
commit: 86b12b6c5d6b46e64bf2e8080528781032e4bd90 aio: move aio sysctl to aio.c
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 86b12b6c5d6b46e64bf2e8080528781032e4bd90
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/sysctl.c:317:52: warning: Parameter 'ppos' can be declared as pointer to const [constParameter]
   static bool proc_first_pos_non_zero_ignore(loff_t *ppos,
                                                      ^
>> kernel/sysctl.c:664:19: warning: Parameter 'lenp' can be declared as pointer to const [constParameter]
             size_t *lenp, loff_t *ppos,
                     ^
>> kernel/sysctl.c:880:41: warning: Parameter 'table' can be declared as pointer to const [constParameter]
   static int proc_taint(struct ctl_table *table, int write,
                                           ^
>> kernel/sysctl.c:954:20: warning: Uninitialized variable: &tmp [uninitvar]
    int *ip = write ? &tmp : valp;
                      ^
   kernel/sysctl.c:1019:29: warning: Uninitialized variable: &tmp [uninitvar]
    unsigned int *up = write ? &tmp : valp;
                               ^

vim +/ppos +317 kernel/sysctl.c

f461d2dcd511c0 Christoph Hellwig 2020-04-24  307  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  308  /**
f461d2dcd511c0 Christoph Hellwig 2020-04-24  309   * proc_first_pos_non_zero_ignore - check if first position is allowed
f461d2dcd511c0 Christoph Hellwig 2020-04-24  310   * @ppos: file position
f461d2dcd511c0 Christoph Hellwig 2020-04-24  311   * @table: the sysctl table
f461d2dcd511c0 Christoph Hellwig 2020-04-24  312   *
f461d2dcd511c0 Christoph Hellwig 2020-04-24  313   * Returns true if the first position is non-zero and the sysctl_writes_strict
f461d2dcd511c0 Christoph Hellwig 2020-04-24  314   * mode indicates this is not allowed for numeric input types. String proc
f461d2dcd511c0 Christoph Hellwig 2020-04-24  315   * handlers can ignore the return value.
f461d2dcd511c0 Christoph Hellwig 2020-04-24  316   */
f461d2dcd511c0 Christoph Hellwig 2020-04-24 @317  static bool proc_first_pos_non_zero_ignore(loff_t *ppos,
f461d2dcd511c0 Christoph Hellwig 2020-04-24  318  					   struct ctl_table *table)
^1da177e4c3f41 Linus Torvalds    2005-04-16  319  {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  320  	if (!*ppos)
f461d2dcd511c0 Christoph Hellwig 2020-04-24  321  		return false;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  322  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  323  	switch (sysctl_writes_strict) {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  324  	case SYSCTL_WRITES_STRICT:
f461d2dcd511c0 Christoph Hellwig 2020-04-24  325  		return true;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  326  	case SYSCTL_WRITES_WARN:
f461d2dcd511c0 Christoph Hellwig 2020-04-24  327  		warn_sysctl_write(table);
f461d2dcd511c0 Christoph Hellwig 2020-04-24  328  		return false;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  329  	default:
f461d2dcd511c0 Christoph Hellwig 2020-04-24  330  		return false;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  331  	}
f461d2dcd511c0 Christoph Hellwig 2020-04-24  332  }
f461d2dcd511c0 Christoph Hellwig 2020-04-24  333  

:::::: The code at line 317 was first introduced by commit
:::::: f461d2dcd511c020a26d4d791fae595c65ed09b6 sysctl: avoid forward declarations

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
