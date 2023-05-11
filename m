Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AFB2F2D
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 02:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683771533; x=1715307533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Pcl85N0w58wZrSTFDPpRB33q8Iuxxb0E40n5g+Dibs=;
  b=MKc9rlTrpfXsDE3NhvWaRf0fMhw74y4aF+ARFGh6iXyomvlquhvREQMI
   uTniZvW04fuprth+xHX+fzIXf12B6ny0M0k587cvEYSTzj2rf+m2kHuWU
   K6cyB0HPqttHveFWpGBhzZODoKRUJq0OVSmPJJhcrhVp7ZfNm4W7Z0amY
   TfEUH1ENWzQPPnAL5o02s+5U1XvVGgemjBzrmLcJC7HcqO0gaibldK6Md
   XHmhxHoUpYbvXW4cfaEY2+D/Tbj9cxDvsFWo7+lq74uqlbVdAjqKQH1B7
   APbXyRi3DkZ55xepZ4Q6C2Z7+X0LzyyELT2HEix+uGk19HIj9JmDEqPjx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339637100"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="339637100"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 19:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="693610585"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="693610585"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 May 2023 19:18:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwvtK-0003i4-1t;
	Thu, 11 May 2023 02:18:50 +0000
Date: Thu, 11 May 2023 10:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/6] scsi:scsi_debug: Add interface to manage single
 device's error inject
Message-ID: <202305110949.SGOuSCr6-lkp@intel.com>
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
In-Reply-To: <20230428013320.347050-3-haowenchao2@huawei.com>
References: <20230428013320.347050-3-haowenchao2@huawei.com>
TO: Wenchao Hao <haowenchao2@huawei.com>
TO: "James E . J . Bottomley" <jejb@linux.ibm.com>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
TO: Douglas Gilbert <dgilbert@interlog.com>
TO: linux-scsi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: linfeilong@huawei.com
CC: louhongxiang@huawei.com
CC: Wenchao Hao <haowenchao2@huawei.com>

Hi Wenchao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenchao-Hao/scsi-scsi_debug-create-scsi_debug-directory-in-the-debugfs-filesystem/20230427-201534
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230428013320.347050-3-haowenchao2%40huawei.com
patch subject: [PATCH v2 2/6] scsi:scsi_debug: Add interface to manage single device's error inject
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110949.SGOuSCr6-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305110949.SGOuSCr6-lkp@intel.com/

smatch warnings:
drivers/scsi/scsi_debug.c:5359 scsi_debug_slave_destroy() warn: variable dereferenced before check 'devip' (see line 5358)

vim +/devip +5359 drivers/scsi/scsi_debug.c

8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5348  
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5349  static void scsi_debug_slave_destroy(struct scsi_device *sdp)
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5350  {
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5351  	struct sdebug_dev_info *devip =
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5352  		(struct sdebug_dev_info *)sdp->hostdata;
a34c4e98367965 FUJITA Tomonori 2008-03-25  5353  
773642d95b8220 Douglas Gilbert 2016-04-25  5354  	if (sdebug_verbose)
c1287970f4847a Tomas Winkler   2015-07-28  5355  		pr_info("slave_destroy <%u %u %u %llu>\n",
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5356  		       sdp->host->host_no, sdp->channel, sdp->id, sdp->lun);
46ab9018f5b07d Wenchao Hao     2023-04-28  5357  
46ab9018f5b07d Wenchao Hao     2023-04-28 @5358  	debugfs_remove(devip->debugfs_entry);
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30 @5359  	if (devip) {
25985edcedea63 Lucas De Marchi 2011-03-30  5360  		/* make this slot available for re-use */
c2248fc974df7b Douglas Gilbert 2014-11-24  5361  		devip->used = false;
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5362  		sdp->hostdata = NULL;
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5363  	}
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5364  }
8dea0d02f8bb71 FUJITA Tomonori 2008-03-30  5365  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
