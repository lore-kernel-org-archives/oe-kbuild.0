Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD6C1878
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jun 2023 04:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687928389; x=1719464389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vfw985xXguC37y6bqNDCZYtvzhfm3a8Ue//dXiZkqSo=;
  b=L7Y48XK8Bdfq4e9V/67o0ylgxnXceb1RIYqtT2QNXvAt4cK+SeuKfJh8
   rg3lsEtS0sc+VE4K6v9Yteewi9mVpN+1Hj3KK+6HJw42j7kIJ6giMuneh
   rMLMdMtFBFuJrimND3kS4xXWY+vnFcJx8hfB1a2QStao9EZzN3/IwnUCr
   axwgHYu3j4NW08Olg+mp5eudba+fHMTkJzl2kGy0fwzYDLkgWNpR8Rgr5
   RdEIcCwh7D87cD4C7tnupqzZcdTWKHfbR6ukZDgfGNo7PONmCTsNJjaCd
   NKSoIZrtvlUgv0UdBhkxrk8G2p20Uj+aVo8FVtZ8FSf6r5UqBeZ8hEDJs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="342089693"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="342089693"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 21:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="666954392"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="666954392"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Jun 2023 21:59:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qENHO-000Com-1M;
	Wed, 28 Jun 2023 04:59:46 +0000
Date: Wed, 28 Jun 2023 12:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/acbel-fsg032) Add firmware version debugfs
 attribute
Message-ID: <202306281205.NFXmu7xb-lkp@intel.com>
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
In-Reply-To: <20230627184027.16343-1-eajames@linux.ibm.com>
References: <20230627184027.16343-1-eajames@linux.ibm.com>
TO: Eddie James <eajames@linux.ibm.com>
TO: linux-hwmon@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux@roeck-us.net
CC: jdelvare@suse.com
CC: lakshmiy@us.ibm.com
CC: Eddie James <eajames@linux.ibm.com>

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.4 next-20230627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/hwmon-pmbus-acbel-fsg032-Add-firmware-version-debugfs-attribute/20230628-030615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230627184027.16343-1-eajames%40linux.ibm.com
patch subject: [PATCH] hwmon: (pmbus/acbel-fsg032) Add firmware version debugfs attribute
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-m001-20230627 (https://download.01.org/0day-ci/archive/20230628/202306281205.NFXmu7xb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281205.NFXmu7xb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306281205.NFXmu7xb-lkp@intel.com/

smatch warnings:
drivers/hwmon/pmbus/acbel-fsg032.c:36 acbel_fsg032_debugfs_read() warn: argument 4 to %02X specifier has type 'char'

vim +/char +36 drivers/hwmon/pmbus/acbel-fsg032.c

d2c6444389b625 Eddie James 2023-06-27  16  
d2c6444389b625 Eddie James 2023-06-27  17  static ssize_t acbel_fsg032_debugfs_read(struct file *file, char __user *buf, size_t count,
d2c6444389b625 Eddie James 2023-06-27  18  					 loff_t *ppos)
d2c6444389b625 Eddie James 2023-06-27  19  {
d2c6444389b625 Eddie James 2023-06-27  20  	struct i2c_client *client = file->private_data;
d2c6444389b625 Eddie James 2023-06-27  21  	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
d2c6444389b625 Eddie James 2023-06-27  22  	char out[8];
d2c6444389b625 Eddie James 2023-06-27  23  	int rc;
d2c6444389b625 Eddie James 2023-06-27  24  	int i;
d2c6444389b625 Eddie James 2023-06-27  25  
d2c6444389b625 Eddie James 2023-06-27  26  	rc = pmbus_lock_interruptible(client);
d2c6444389b625 Eddie James 2023-06-27  27  	if (rc)
d2c6444389b625 Eddie James 2023-06-27  28  		return rc;
d2c6444389b625 Eddie James 2023-06-27  29  
d2c6444389b625 Eddie James 2023-06-27  30  	rc = i2c_smbus_read_block_data(client, ACBEL_MFR_FW_REVISION, data);
d2c6444389b625 Eddie James 2023-06-27  31  	pmbus_unlock(client);
d2c6444389b625 Eddie James 2023-06-27  32  	if (rc < 0)
d2c6444389b625 Eddie James 2023-06-27  33  		return rc;
d2c6444389b625 Eddie James 2023-06-27  34  
d2c6444389b625 Eddie James 2023-06-27  35  	for (i = 0; i < rc && i < 3; ++i)
d2c6444389b625 Eddie James 2023-06-27 @36  		snprintf(&out[i * 2], 3, "%02X", data[i]);
d2c6444389b625 Eddie James 2023-06-27  37  
d2c6444389b625 Eddie James 2023-06-27  38  	rc = i * 2;
d2c6444389b625 Eddie James 2023-06-27  39  	out[rc++] = '\n';
d2c6444389b625 Eddie James 2023-06-27  40  	out[rc++] = 0;
d2c6444389b625 Eddie James 2023-06-27  41  	return simple_read_from_buffer(buf, count, ppos, out, rc);
d2c6444389b625 Eddie James 2023-06-27  42  }
d2c6444389b625 Eddie James 2023-06-27  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
