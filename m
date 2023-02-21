Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E838C0B
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677006880; x=1708542880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=984oQJorbtr6oKjZTzJyGnphh8km+sIwAchJ3W32iFI=;
  b=llbsHPB895VLdbOEQTPyh8vtwWZkqcugHKQ+ZaFkP5oG0rtxCu7jIT1V
   hcUneAqLVr6yHN0LnbJO16WSNHd4JoJr1fGA8g5coEstWu45vsQgU9lFj
   SGByq9KKTxoENoawma9U/mjKzmZdr04ZpLPY77fOsHUqV3zIGydDxrHiv
   JGPesvcsij0m0Z3i9mclzjOffiFSok4ZHxBnZmDvk8DPXvWRTVrB/rRQ4
   8BgcrP2F87yL4MqrtCHKKB8F3tt1ZatY1iN/rvnhptjliqujHjj8ljkEC
   VdnoWx4iDnyH9BkVHAWanU5UleROGkJP/fa22yDv5y0KZ9rNIIRGJ9PSa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="312355023"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="312355023"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 11:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="704168015"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="704168015"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Feb 2023 11:14:38 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUY61-0000BZ-2D;
	Tue, 21 Feb 2023 19:14:37 +0000
Date: Wed, 22 Feb 2023 03:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11627/13664]
 drivers/platform/x86/mlx-platform.c:6013
 mlxplat_mlxcpld_verify_bus_topology() error: uninitialized symbol 'shift'.
Message-ID: <202302220308.baoMLKJG-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Vadim Pasternak <vadimp@nvidia.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Michael Shych <michaelsh@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   465461cf48465b8a0a54025db5ae2b3df7a04577
commit: 50b823fdd357ec0f2fd0a1a0b5104704916fd620 [11627/13664] platform: mellanox: mlx-platform: Move bus shift assignment out of the loop
:::::: branch date: 13 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230222/202302220308.baoMLKJG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302220308.baoMLKJG-lkp@intel.com/

smatch warnings:
drivers/platform/x86/mlx-platform.c:6013 mlxplat_mlxcpld_verify_bus_topology() error: uninitialized symbol 'shift'.

vim +/shift +6013 drivers/platform/x86/mlx-platform.c

580d834fe166c6 Ivan Vecera     2018-01-22  5979  
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5980  static int mlxplat_mlxcpld_verify_bus_topology(int *nr)
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5981  {
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5982  	struct i2c_adapter *search_adap;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5983  	int shift, i;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5984  
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5985  	/* Scan adapters from expected id to verify it is free. */
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5986  	*nr = MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5987  	for (i = MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR; i <
fcd50dbf306a08 Vadim Pasternak 2020-01-13  5988  	     mlxplat_max_adap_num; i++) {
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5989  		search_adap = i2c_get_adapter(i);
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5990  		if (search_adap) {
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5991  			i2c_put_adapter(search_adap);
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5992  			continue;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5993  		}
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5994  
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5995  		/* Return if expected parent adapter is free. */
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5996  		if (i == MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR)
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5997  			return 0;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5998  		break;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  5999  	}
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6000  
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6001  	/* Return with error if free id for adapter is not found. */
fcd50dbf306a08 Vadim Pasternak 2020-01-13  6002  	if (i == mlxplat_max_adap_num)
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6003  		return -ENODEV;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6004  
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6005  	/* Shift adapter ids, since expected parent adapter is not free. */
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6006  	*nr = i;
fcd50dbf306a08 Vadim Pasternak 2020-01-13  6007  	for (i = 0; i < mlxplat_mux_num; i++) {
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6008  		shift = *nr - mlxplat_mux_data[i].parent;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6009  		mlxplat_mux_data[i].parent = *nr;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6010  		mlxplat_mux_data[i].base_nr += shift;
50b823fdd357ec Vadim Pasternak 2023-02-08  6011  	}
50b823fdd357ec Vadim Pasternak 2023-02-08  6012  
ef0f62264b2a9e Vadim Pasternak 2018-02-13 @6013  	if (shift > 0)
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6014  		mlxplat_hotplug->shift_nr = shift;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6015  
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6016  	return 0;
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6017  }
ef0f62264b2a9e Vadim Pasternak 2018-02-13  6018  

:::::: The code at line 6013 was first introduced by commit
:::::: ef0f62264b2a9e6fc73476ed22ade1ff1f3ad7f3 platform/x86: mlx-platform: Add physical bus number auto detection

:::::: TO: Vadim Pasternak <vadimp@mellanox.com>
:::::: CC: Darren Hart (VMware) <dvhart@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
