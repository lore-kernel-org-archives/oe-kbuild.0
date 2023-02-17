Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3E9376
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Feb 2023 04:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676607061; x=1708143061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sxMXhj4BGIAJyee+9hMucuIyqcBIeYLMwM4D9wTFR4Q=;
  b=ULCPDniX8ljMfm6i4Bt/wHLka9bf7VZe6FHreDjb+ZqFtBdPQ+xli1Hh
   jPkunB9Hy2IlyfHVbuEQHfki/BJaSutrsiKZEjUUJvJwS1zRwFnq/5Z2C
   Dhs+QGVWNkNycgaX5QBll+97TJuSb6ZVtCt9AKaD1RaTRuJ3BUV5Ly9rI
   QMYenHwZOcbv8iSlYq5aodnY3O/tkQqF0ZJ1Xi4ELWN/iBoGRBazuN/I9
   qOqWVuRA6rnTp17OKYugeT3ByHxKHPHN5L4nUD9XNFp7TEPC5RLL36yjO
   +vMgWYcAQHf0whGq4k8YVU99MgzERicXmG4O3WNrvWUik6F1YUeydz1gr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331907420"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="331907420"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 20:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="739124763"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="739124763"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Feb 2023 20:10:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSs5K-000B6T-1l;
	Fri, 17 Feb 2023 04:10:58 +0000
Date: Fri, 17 Feb 2023 12:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/opp/debugfs.c:212:8: warning: Null pointer dereference:
 new_dev [nullPointer]
Message-ID: <202302171233.0TWZISa1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/opp/debugfs.c:212:8: warning: Null pointer dereference: new_dev [nullPointer]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Xiaomeng Tong <xiam0nd.tong@gmail.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ac88fa4605ec98e545fb3ad0154f575fda2de5f
commit: c14faabf5364c5b1be115bbc660310966ca7371f opp: use list iterator only inside the loop
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c14faabf5364c5b1be115bbc660310966ca7371f
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302171233.0TWZISa1-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/opp/debugfs.c:212:8: warning: Null pointer dereference: new_dev [nullPointer]
    dev = new_dev->dev;
          ^
   drivers/opp/debugfs.c:198:31: note: Assignment 'new_dev=NULL', assigned value is 0
    struct opp_device *new_dev = NULL, *iter;
                                 ^
   drivers/opp/debugfs.c:204:12: note: Assuming condition is false
     if (iter != opp_dev) {
              ^
   drivers/opp/debugfs.c:212:8: note: Null pointer dereference
    dev = new_dev->dev;
          ^
   drivers/opp/debugfs.c:213:27: warning: Null pointer dereference: new_dev [nullPointer]
    debugfs_remove_recursive(new_dev->dentry);
                             ^
   drivers/opp/debugfs.c:198:31: note: Assignment 'new_dev=NULL', assigned value is 0
    struct opp_device *new_dev = NULL, *iter;
                                 ^
   drivers/opp/debugfs.c:204:12: note: Assuming condition is false
     if (iter != opp_dev) {
              ^
   drivers/opp/debugfs.c:213:27: note: Null pointer dereference
    debugfs_remove_recursive(new_dev->dentry);
                             ^

vim +212 drivers/opp/debugfs.c

deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  194  
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  195  static void opp_migrate_dentry(struct opp_device *opp_dev,
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  196  			       struct opp_table *opp_table)
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  197  {
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  198  	struct opp_device *new_dev = NULL, *iter;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  199  	const struct device *dev;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  200  	struct dentry *dentry;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  201  
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  202  	/* Look for next opp-dev */
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  203  	list_for_each_entry(iter, &opp_table->dev_list, node)
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  204  		if (iter != opp_dev) {
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  205  			new_dev = iter;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  206  			break;
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  207  		}
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  208  
c14faabf5364c5 drivers/opp/debugfs.c            Xiaomeng Tong 2022-03-31  209  	BUG_ON(!new_dev);
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  210  
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  211  	/* new_dev is guaranteed to be valid here */
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11 @212  	dev = new_dev->dev;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  213  	debugfs_remove_recursive(new_dev->dentry);
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  214  
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  215  	opp_set_dev_name(dev, opp_table->dentry_name);
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  216  
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  217  	dentry = debugfs_rename(rootdir, opp_dev->dentry, rootdir,
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  218  				opp_table->dentry_name);
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  219  	if (!dentry) {
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  220  		dev_err(dev, "%s: Failed to rename link from: %s to %s\n",
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  221  			__func__, dev_name(opp_dev->dev), dev_name(dev));
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  222  		return;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  223  	}
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  224  
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  225  	new_dev->dentry = dentry;
2c2709dc6921c5 drivers/base/power/opp/debugfs.c Viresh Kumar  2016-02-16  226  	opp_table->dentry = dentry;
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  227  }
deaa51465105a7 drivers/base/power/opp/debugfs.c Viresh Kumar  2015-11-11  228  

:::::: The code at line 212 was first introduced by commit
:::::: deaa51465105a7eda19a627b10372f4f7c51a4df PM / OPP: Add debugfs support

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
