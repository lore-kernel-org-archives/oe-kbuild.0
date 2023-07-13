Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186B55663
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jul 2023 04:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689222663; x=1720758663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ak88etTotLKAL14JX1daGN8OrcuNfpWwWbmJ1DCiKPc=;
  b=HKYtgtqsfA/m6HiHk/PVo9b06xti2mAO0XepQXYndbapg85ergaOmfkg
   Hl1tGa+er9WotOKBrZnoIUxXOVTIP5NNtazUGaHP/d6V6Pyp1xbY9wKXd
   sPYMuEvyeOFiG/MU9UvfqBPFBZuarhQT/suevrwGGeBY7tjDub72URUS+
   G3e5ZfVq/K+UYwf8rlxWQKUYRzrSY0Uxg5AVQscqHbCz1PfVM/mlZa88W
   RuUZWOssuNIKj7wHTkUOMSgL6/BxiFM7ntMsYu5WPVqwx9WhBfXjBulrO
   xrGnEGqHRsY0Bql0nXsYaqkdepSsKBo2YWopp3tT05vb7x4XAQ6jO+FOP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="365109996"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="365109996"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 21:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="835420877"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="835420877"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2023 21:30:34 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJnyL-0006DR-1J;
	Thu, 13 Jul 2023 04:30:33 +0000
Date: Thu, 13 Jul 2023 12:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [robh:dt/header-cleanups 14/15]
 drivers/hwmon/nct6775-platform.c:1075 nct6775_find() error: buffer overflow
 'nct6775_sio_names' 13 <= 13
Message-ID: <202307131212.gOOOZzf1-lkp@intel.com>
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
TO: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   523a057d90b55d2cf1144ea6a4db90a9e9fc2e4b
commit: d9dc08ca8fa334c606d77c357b180e800cb75be1 [14/15] Use of_device_get_match_data
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-m031-20230710 (https://download.01.org/0day-ci/archive/20230713/202307131212.gOOOZzf1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131212.gOOOZzf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307131212.gOOOZzf1-lkp@intel.com/

smatch warnings:
drivers/hwmon/nct6775-platform.c:1075 nct6775_find() error: buffer overflow 'nct6775_sio_names' 13 <= 13
drivers/hwmon/nct6775-core.c:3858 nct6775_probe() error: testing array offset 'data->kind' after use.

vim +/nct6775_sio_names +1075 drivers/hwmon/nct6775-platform.c

c3963bc0a0cf9e Zev Weiss     2022-04-26   983  
c3963bc0a0cf9e Zev Weiss     2022-04-26   984  /* nct6775_find() looks for a '627 in the Super-I/O config space */
c3963bc0a0cf9e Zev Weiss     2022-04-26   985  static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
c3963bc0a0cf9e Zev Weiss     2022-04-26   986  {
c3963bc0a0cf9e Zev Weiss     2022-04-26   987  	u16 val;
c3963bc0a0cf9e Zev Weiss     2022-04-26   988  	int err;
c3963bc0a0cf9e Zev Weiss     2022-04-26   989  	int addr;
c3963bc0a0cf9e Zev Weiss     2022-04-26   990  
c3963bc0a0cf9e Zev Weiss     2022-04-26   991  	sio_data->access = access_direct;
c3963bc0a0cf9e Zev Weiss     2022-04-26   992  	sio_data->sioreg = sioaddr;
c3963bc0a0cf9e Zev Weiss     2022-04-26   993  
c3963bc0a0cf9e Zev Weiss     2022-04-26   994  	err = sio_data->sio_enter(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26   995  	if (err)
c3963bc0a0cf9e Zev Weiss     2022-04-26   996  		return err;
c3963bc0a0cf9e Zev Weiss     2022-04-26   997  
c3963bc0a0cf9e Zev Weiss     2022-04-26   998  	val = (sio_data->sio_inb(sio_data, SIO_REG_DEVID) << 8) |
c3963bc0a0cf9e Zev Weiss     2022-04-26   999  		sio_data->sio_inb(sio_data, SIO_REG_DEVID + 1);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1000  	if (force_id && val != 0xffff)
c3963bc0a0cf9e Zev Weiss     2022-04-26  1001  		val = force_id;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1002  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1003  	switch (val & SIO_ID_MASK) {
c3963bc0a0cf9e Zev Weiss     2022-04-26  1004  	case SIO_NCT6106_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1005  		sio_data->kind = nct6106;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1006  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1007  	case SIO_NCT6116_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1008  		sio_data->kind = nct6116;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1009  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1010  	case SIO_NCT6775_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1011  		sio_data->kind = nct6775;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1012  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1013  	case SIO_NCT6776_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1014  		sio_data->kind = nct6776;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1015  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1016  	case SIO_NCT6779_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1017  		sio_data->kind = nct6779;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1018  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1019  	case SIO_NCT6791_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1020  		sio_data->kind = nct6791;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1021  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1022  	case SIO_NCT6792_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1023  		sio_data->kind = nct6792;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1024  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1025  	case SIO_NCT6793_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1026  		sio_data->kind = nct6793;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1027  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1028  	case SIO_NCT6795_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1029  		sio_data->kind = nct6795;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1030  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1031  	case SIO_NCT6796_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1032  		sio_data->kind = nct6796;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1033  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1034  	case SIO_NCT6797_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1035  		sio_data->kind = nct6797;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1036  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1037  	case SIO_NCT6798_ID:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1038  		sio_data->kind = nct6798;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1039  		break;
aee395bb190564 Guenter Roeck 2022-12-28  1040  	case SIO_NCT6799_ID:
aee395bb190564 Guenter Roeck 2022-12-28  1041  		sio_data->kind = nct6799;
aee395bb190564 Guenter Roeck 2022-12-28  1042  		break;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1043  	default:
c3963bc0a0cf9e Zev Weiss     2022-04-26  1044  		if (val != 0xffff)
c3963bc0a0cf9e Zev Weiss     2022-04-26  1045  			pr_debug("unsupported chip ID: 0x%04x\n", val);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1046  		sio_data->sio_exit(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1047  		return -ENODEV;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1048  	}
c3963bc0a0cf9e Zev Weiss     2022-04-26  1049  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1050  	/* We have a known chip, find the HWM I/O address */
c3963bc0a0cf9e Zev Weiss     2022-04-26  1051  	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1052  	val = (sio_data->sio_inb(sio_data, SIO_REG_ADDR) << 8)
c3963bc0a0cf9e Zev Weiss     2022-04-26  1053  	    | sio_data->sio_inb(sio_data, SIO_REG_ADDR + 1);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1054  	addr = val & IOREGION_ALIGNMENT;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1055  	if (addr == 0) {
c3963bc0a0cf9e Zev Weiss     2022-04-26  1056  		pr_err("Refusing to enable a Super-I/O device with a base I/O port 0\n");
c3963bc0a0cf9e Zev Weiss     2022-04-26  1057  		sio_data->sio_exit(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1058  		return -ENODEV;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1059  	}
c3963bc0a0cf9e Zev Weiss     2022-04-26  1060  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1061  	/* Activate logical device if needed */
c3963bc0a0cf9e Zev Weiss     2022-04-26  1062  	val = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1063  	if (!(val & 0x01)) {
c3963bc0a0cf9e Zev Weiss     2022-04-26  1064  		pr_warn("Forcibly enabling Super-I/O. Sensor is probably unusable.\n");
c3963bc0a0cf9e Zev Weiss     2022-04-26  1065  		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, val | 0x01);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1066  	}
c3963bc0a0cf9e Zev Weiss     2022-04-26  1067  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1068  	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
c3963bc0a0cf9e Zev Weiss     2022-04-26  1069  	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
c3963bc0a0cf9e Zev Weiss     2022-04-26  1070  	    sio_data->kind == nct6796 || sio_data->kind == nct6797 ||
aee395bb190564 Guenter Roeck 2022-12-28  1071  	    sio_data->kind == nct6798 || sio_data->kind == nct6799)
c3963bc0a0cf9e Zev Weiss     2022-04-26  1072  		nct6791_enable_io_mapping(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1073  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1074  	sio_data->sio_exit(sio_data);
c3963bc0a0cf9e Zev Weiss     2022-04-26 @1075  	pr_info("Found %s or compatible chip at %#x:%#x\n",
c3963bc0a0cf9e Zev Weiss     2022-04-26  1076  		nct6775_sio_names[sio_data->kind], sioaddr, addr);
c3963bc0a0cf9e Zev Weiss     2022-04-26  1077  
c3963bc0a0cf9e Zev Weiss     2022-04-26  1078  	return addr;
c3963bc0a0cf9e Zev Weiss     2022-04-26  1079  }
c3963bc0a0cf9e Zev Weiss     2022-04-26  1080  

:::::: The code at line 1075 was first introduced by commit
:::::: c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd hwmon: (nct6775) Split core and platform driver

:::::: TO: Zev Weiss <zev@bewilderbeest.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
