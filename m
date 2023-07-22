Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696F762A
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Jul 2023 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690027226; x=1721563226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZEf4FPnc4cXWH3qGsa/ttIAEvcgPAeek7j5SYAn6nEU=;
  b=lRwtO7U89hfzz2+BFFXK/v4UOjgdJrj50qtP1VQ3fRujt4WX4jlzPuk7
   Y4JaiHI/eFJGwguxGAhXrC5iTEVh7URsOzq7K4JTBZ4rjXKRIh/P2EZvF
   gbpuVnIFb/+ThVYgc5z2C0ImW3xei0P2Sl3mQIhqb1ma0UnsWkCLZCHuq
   p4l/11joXgjwsOH7I1FLIWRHEODJrT38pYOh2k2iKFfzq5ZJC3F0Y6vtn
   XPdXOoJRz+CSuLhoOsvWjdv/NdUh6nShCb//mpWBLwdkF/vn3vCbhu/vH
   7kdydWtTn0FyJ/BuFBLr6q78LuLoUj6AVWcEuFz0kiaVjeOtTWiiUcJeO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="369859078"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="369859078"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 05:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838862611"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="838862611"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2023 05:00:24 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNBHb-0008IP-1f;
	Sat, 22 Jul 2023 12:00:23 +0000
Date: Sat, 22 Jul 2023 19:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [joelgranados:jag/sysctl_remove_empty_elem 61/65]
 net/ax25/sysctl_net_ax25.c:158 ax25_register_dev_sysctl() error: buffer
 overflow 'table' 13 <= 13
Message-ID: <202307221942.GeOTwYoS-lkp@intel.com>
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
TO: Joel Granados <j.granados@samsung.com>

tree:   https://github.com/Joelgranados/linux.git jag/sysctl_remove_empty_elem
head:   c09c3a77be9924c3bbab7b538a03ecd68734e799
commit: 857e2e5922b442beef8ba18fa9ff9cec659003a1 [61/65] ax.25: rm sentinel element from ctl_table array
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20230717 (https://download.01.org/0day-ci/archive/20230722/202307221942.GeOTwYoS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221942.GeOTwYoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307221942.GeOTwYoS-lkp@intel.com/

smatch warnings:
net/ax25/sysctl_net_ax25.c:158 ax25_register_dev_sysctl() error: buffer overflow 'table' 13 <= 13

vim +/table +158 net/ax25/sysctl_net_ax25.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  146  
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  147  int ax25_register_dev_sysctl(ax25_dev *ax25_dev)
^1da177e4c3f415 Linus Torvalds    2005-04-16  148  {
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  149  	char path[sizeof("net/ax25/") + IFNAMSIZ];
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  150  	int k;
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  151  	struct ctl_table *table;
^1da177e4c3f415 Linus Torvalds    2005-04-16  152  
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  153  	table = kmemdup(ax25_param_table, sizeof(ax25_param_table), GFP_KERNEL);
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  154  	if (!table)
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  155  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds    2005-04-16  156  
^1da177e4c3f415 Linus Torvalds    2005-04-16  157  	for (k = 0; k < AX25_MAX_VALUES; k++)
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19 @158  		table[k].data = &ax25_dev->values[k];
^1da177e4c3f415 Linus Torvalds    2005-04-16  159  
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  160  	snprintf(path, sizeof(path), "net/ax25/%s", ax25_dev->dev->name);
4a00c5fa7a2b9ee Joel Granados     2023-06-27  161  	ax25_dev->sysheader = register_net_sysctl_sz(&init_net, path, table,
4a00c5fa7a2b9ee Joel Granados     2023-06-27  162  						  ARRAY_SIZE(ax25_param_table));
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  163  	if (!ax25_dev->sysheader) {
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  164  		kfree(table);
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  165  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds    2005-04-16  166  	}
0ca7a4c87d27dd2 Eric W. Biederman 2012-04-19  167  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  168  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  169  

:::::: The code at line 158 was first introduced by commit
:::::: 0ca7a4c87d27dd2fde0783dec94a821d6d035696 net ax25: Simplify and cleanup the ax25 sysctl handling.

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
