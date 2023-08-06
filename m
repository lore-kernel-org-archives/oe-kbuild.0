Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350F5669
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Aug 2023 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691337915; x=1722873915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hIDsloYtOiDjN3mKS3iN7idDPa06TJuzNAA1Rpd0Xm0=;
  b=a20euOCyhyIQ7ITkQ7C/n3JwPTTjgUfl5zIXf3gS9t6Rq2vce0YfM8uY
   uwltBX5ff5Z6W7dIo9nNLSGld4K0bOUK8xSzzl+ANRvOeZcVxso3IEBlZ
   PPFceVqzH6wtiTB3T95P4IatAYPO8rlf9xIW1uPLG4lItLQsdkekZORYK
   r4Hs7ONb5E0MzmgNWnzMLTbS05nm0Olp3TzarGXbQCXD7n8OBCsxU550Y
   C7J7PHnpBWlHf2DzZZCWbhhQJccChYWx4KkVCD5tvBW4VloMUE+1bBav9
   sU5UndnMBpZwPBHEr1nPM6OiGnYYBXBBz9TnJjLjs4fyNqM4XaQbuZNTT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="436729121"
X-IronPort-AV: E=Sophos;i="6.01,260,1684825200"; 
   d="scan'208";a="436729121"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 09:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="904449817"
X-IronPort-AV: E=Sophos;i="6.01,260,1684825200"; 
   d="scan'208";a="904449817"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Aug 2023 09:05:13 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSgFk-0004IR-21;
	Sun, 06 Aug 2023 16:05:12 +0000
Date: Mon, 7 Aug 2023 00:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_acpi_b2_v1 80/91] drivers/base/swnode.c:744
 software_node_find_by_name() warn: iterator used outside loop: 'swnode'
Message-ID: <202308070005.kyNkYpSW-lkp@intel.com>
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
TO: Anup Patel <apatel@ventanamicro.com>
CC: Sunil V L <sunilvl@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v1
head:   b09364548457cec51680b8f8b1a5e917b5e74cf5
commit: 29c6edbe9ecad42c8e227ecbcbd656d357729a32 [80/91] swnode: Add support to create early during boot
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-m031-20230806 (https://download.01.org/0day-ci/archive/20230807/202308070005.kyNkYpSW-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308070005.kyNkYpSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308070005.kyNkYpSW-lkp@intel.com/

smatch warnings:
drivers/base/swnode.c:744 software_node_find_by_name() warn: iterator used outside loop: 'swnode'

vim +/swnode +744 drivers/base/swnode.c

59abd83672f70c Heikki Krogerus 2018-11-09  697  
1666faedb567d0 Heikki Krogerus 2019-08-19  698  /**
1666faedb567d0 Heikki Krogerus 2019-08-19  699   * software_node_find_by_name - Find software node by name
1666faedb567d0 Heikki Krogerus 2019-08-19  700   * @parent: Parent of the software node
1666faedb567d0 Heikki Krogerus 2019-08-19  701   * @name: Name of the software node
1666faedb567d0 Heikki Krogerus 2019-08-19  702   *
1666faedb567d0 Heikki Krogerus 2019-08-19  703   * The function will find a node that is child of @parent and that is named
1666faedb567d0 Heikki Krogerus 2019-08-19  704   * @name. If no node is found, the function returns NULL.
1666faedb567d0 Heikki Krogerus 2019-08-19  705   *
1666faedb567d0 Heikki Krogerus 2019-08-19  706   * NOTE: you will need to drop the reference with fwnode_handle_put() after use.
1666faedb567d0 Heikki Krogerus 2019-08-19  707   */
1666faedb567d0 Heikki Krogerus 2019-08-19  708  const struct software_node *
1666faedb567d0 Heikki Krogerus 2019-08-19  709  software_node_find_by_name(const struct software_node *parent, const char *name)
1666faedb567d0 Heikki Krogerus 2019-08-19  710  {
016049a816774e Heikki Krogerus 2019-08-30  711  	struct swnode *swnode = NULL;
1666faedb567d0 Heikki Krogerus 2019-08-19  712  	struct kobject *k;
1666faedb567d0 Heikki Krogerus 2019-08-19  713  
1666faedb567d0 Heikki Krogerus 2019-08-19  714  	if (!name)
1666faedb567d0 Heikki Krogerus 2019-08-19  715  		return NULL;
1666faedb567d0 Heikki Krogerus 2019-08-19  716  
29c6edbe9ecad4 Anup Patel      2023-04-25  717  	spin_lock(&swnode_early_lock);
29c6edbe9ecad4 Anup Patel      2023-04-25  718  
29c6edbe9ecad4 Anup Patel      2023-04-25  719  	list_for_each_entry(swnode, &swnode_early_list, early) {
29c6edbe9ecad4 Anup Patel      2023-04-25  720  		if (parent == swnode->node->parent && swnode->node->name &&
29c6edbe9ecad4 Anup Patel      2023-04-25  721  		    !strcmp(name, swnode->node->name)) {
29c6edbe9ecad4 Anup Patel      2023-04-25  722  			kobject_get(&swnode->kobj);
29c6edbe9ecad4 Anup Patel      2023-04-25  723  			spin_unlock(&swnode_early_lock);
29c6edbe9ecad4 Anup Patel      2023-04-25  724  			return swnode->node;
29c6edbe9ecad4 Anup Patel      2023-04-25  725  		}
29c6edbe9ecad4 Anup Patel      2023-04-25  726  	}
29c6edbe9ecad4 Anup Patel      2023-04-25  727  
29c6edbe9ecad4 Anup Patel      2023-04-25  728  	spin_unlock(&swnode_early_lock);
29c6edbe9ecad4 Anup Patel      2023-04-25  729  
1666faedb567d0 Heikki Krogerus 2019-08-19  730  	spin_lock(&swnode_kset->list_lock);
1666faedb567d0 Heikki Krogerus 2019-08-19  731  
1666faedb567d0 Heikki Krogerus 2019-08-19  732  	list_for_each_entry(k, &swnode_kset->list, entry) {
1666faedb567d0 Heikki Krogerus 2019-08-19  733  		swnode = kobj_to_swnode(k);
1666faedb567d0 Heikki Krogerus 2019-08-19  734  		if (parent == swnode->node->parent && swnode->node->name &&
1666faedb567d0 Heikki Krogerus 2019-08-19  735  		    !strcmp(name, swnode->node->name)) {
1666faedb567d0 Heikki Krogerus 2019-08-19  736  			kobject_get(&swnode->kobj);
1666faedb567d0 Heikki Krogerus 2019-08-19  737  			break;
1666faedb567d0 Heikki Krogerus 2019-08-19  738  		}
1666faedb567d0 Heikki Krogerus 2019-08-19  739  		swnode = NULL;
1666faedb567d0 Heikki Krogerus 2019-08-19  740  	}
1666faedb567d0 Heikki Krogerus 2019-08-19  741  
1666faedb567d0 Heikki Krogerus 2019-08-19  742  	spin_unlock(&swnode_kset->list_lock);
1666faedb567d0 Heikki Krogerus 2019-08-19  743  
1666faedb567d0 Heikki Krogerus 2019-08-19 @744  	return swnode ? swnode->node : NULL;
1666faedb567d0 Heikki Krogerus 2019-08-19  745  }
1666faedb567d0 Heikki Krogerus 2019-08-19  746  EXPORT_SYMBOL_GPL(software_node_find_by_name);
1666faedb567d0 Heikki Krogerus 2019-08-19  747  

:::::: The code at line 744 was first introduced by commit
:::::: 1666faedb567d03cde1d656ae24c6cc253e67373 software node: Add software_node_find_by_name()

:::::: TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
