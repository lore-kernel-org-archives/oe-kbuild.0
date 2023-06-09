Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56D71800E
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jun 2023 19:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686340067; x=1717876067;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ivmec4Dp03d2UCjhsy/I0sYJ3qPcYiYa9/K2LHyJ2Rk=;
  b=TiJbovM6qMb3JTG7bkGpIR7ofn9hBJwIdlgRT4FuJNWNMGlYvntXBmAf
   mdFaJnGM9cH1CnY8zesPrVuc/kqlRNPkdRvCl0z53vgmr3lNK8IfQ13AJ
   D0bgXpa1kaXGo0tNmTQyDneQ0wafxDb0dDQHLihkjh1CRaShtsUFnHO7w
   rZLMqRO2axptEAXHn/Gv+edqf4VhxxLNFQXhq3IVkkfUCPQF/FnA9E7+7
   MFrfqiKjyuIAzLwPWTPT9fkQbchhoU9sFyP2f4iBgxiyk4GH3WRk76C+u
   FZ6/Of+GteOOhLvjMjhCluUYxdyULXBWnJHXnFM1/ikzwRdzXXHjg8Qfi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361035378"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="361035378"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 12:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854847683"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="854847683"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 12:47:43 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7i5G-0009LO-2I;
	Fri, 09 Jun 2023 19:47:42 +0000
Date: Sat, 10 Jun 2023 03:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] Input: synaptics-rmi4 - retry reading SMBus version
 on resume
Message-ID: <202306100350.ck6PwGko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230608210404.722123-1-jefferymiller@google.com>
References: <20230608210404.722123-1-jefferymiller@google.com>
TO: Jeffery Miller <jefferymiller@google.com>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Jonathan Denose <jdenose@chromium.org>
CC: jdenose@google.com
CC: Lyude Paul <lyude@redhat.com>
CC: benjamin.tissoires@redhat.com
CC: Andrew Duggan <andrew@duggan.us>
CC: loic.poulain@linaro.org
CC: Jeffery Miller <jefferymiller@google.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Jeremy Kerr <jk@codeconstruct.com.au>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
CC: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Jeffery,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus linus/master v6.4-rc5 next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffery-Miller/Input-synaptics-rmi4-retry-reading-SMBus-version-on-resume/20230609-050652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20230608210404.722123-1-jefferymiller%40google.com
patch subject: [PATCH v3] Input: synaptics-rmi4 - retry reading SMBus version on resume
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230610/202306100350.ck6PwGko-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306100350.ck6PwGko-lkp@intel.com/

smatch warnings:
drivers/input/rmi4/rmi_smbus.c:66 rmi_smb_get_version() error: uninitialized symbol 'retval'.

vim +/retval +66 drivers/input/rmi4/rmi_smbus.c

82264d0cf7aef2 Benjamin Tissoires 2016-11-08  41  
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  42  static int rmi_smb_get_version(struct rmi_smb_xport *rmi_smb)
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  43  {
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  44  	struct i2c_client *client = rmi_smb->client;
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  45  	int retval;
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  46  
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  47  	/* Check if for SMBus new version device by reading version byte. */
0fe13a588e68ca Jeffery Miller     2023-06-08  48  	for (int i = 0; i < 2; i++) {
0fe13a588e68ca Jeffery Miller     2023-06-08  49  		if (i > 0) {
0fe13a588e68ca Jeffery Miller     2023-06-08  50  			dev_warn(&client->dev, "sleeping to retry getting the SMBus version number\n");
0fe13a588e68ca Jeffery Miller     2023-06-08  51  			fsleep(30000);
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  52  		}
0fe13a588e68ca Jeffery Miller     2023-06-08  53  		retval = i2c_smbus_read_byte_data(client,
0fe13a588e68ca Jeffery Miller     2023-06-08  54  				SMB_PROTOCOL_VERSION_ADDRESS);
0fe13a588e68ca Jeffery Miller     2023-06-08  55  		if (retval >= 0)
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  56  			return retval + 1;
0fe13a588e68ca Jeffery Miller     2023-06-08  57  
0fe13a588e68ca Jeffery Miller     2023-06-08  58  		dev_err(&client->dev, "failed to get SMBus version number!\n");
0fe13a588e68ca Jeffery Miller     2023-06-08  59  		/* There can be a delay on resume where the read returns
0fe13a588e68ca Jeffery Miller     2023-06-08  60  		 * -ENXIO. Retry to allow additional time for the read
0fe13a588e68ca Jeffery Miller     2023-06-08  61  		 *  to become responsive.
0fe13a588e68ca Jeffery Miller     2023-06-08  62  		 */
0fe13a588e68ca Jeffery Miller     2023-06-08  63  		if (retval != -ENXIO)
0fe13a588e68ca Jeffery Miller     2023-06-08  64  			break;
0fe13a588e68ca Jeffery Miller     2023-06-08  65  	}
0fe13a588e68ca Jeffery Miller     2023-06-08 @66  	return retval;
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  67  }
82264d0cf7aef2 Benjamin Tissoires 2016-11-08  68  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
