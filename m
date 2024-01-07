Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9887613AD5
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jan 2024 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBK9dP24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704648215; x=1736184215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q/P8zD3iyZXtc4dl5jVFyAypYqqm3j2wDzSVXZLQHIU=;
  b=nBK9dP24tBfzC4lJigoYF+JKDUBpQmNL6ZlUMamlWAeNlLLowGOANTwk
   VcJWACVBzKStZ2vW+cTuR3RXeRmRVcxoveFqKlQfqDAELJYETDNF2dWpu
   HYZKGLHTqbV9EYicV4bRvQs9oToHnk2RXIlZMhpxKTrx2gFxySRhuPY1m
   hNnEsJQTDGqnGav/2OwnCRe3Ce4FmPnfwOzOsxGy23Jq2SenfrZl0Y8T6
   vip1kImqW3EPcg9q+f//MsQAxpX1C0BUyac65cySvO0uaodXQimLPwYcw
   qWvTTjjJDS0ay1uyTi9r7SAu8pTjp8r86TGiyDZTLfNcbxoeT0yj4K4OL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="19247972"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="19247972"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 09:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="900150121"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="900150121"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2024 09:23:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMWry-0003xo-1Y;
	Sun, 07 Jan 2024 17:23:30 +0000
Date: Mon, 8 Jan 2024 01:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/orangefs/super.c:403:9: warning: 'strncpy' output may be
 truncated copying 255 bytes from a string of length 255
Message-ID: <202401080141.9S4e21oc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/orangefs/super.c:403:9: warning: 'strncpy' output may be truncated copying 255 bytes from a string of length 255 [-Wstringop-truncation]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: WANG Xuerui <git@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   52b1853b080a082ec3749c3a9577f6c71b1d4a90
commit: 3f301dc292eb122eff61b8b2906e519154b0327f LoongArch: Replace -ffreestanding with finer-grained -fno-builtin's
date:   5 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r064-20240107 (https://download.01.org/0day-ci/archive/20240108/202401080141.9S4e21oc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401080141.9S4e21oc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401080141.9S4e21oc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/super.c:8:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'orangefs_unmount',
       inlined from 'orangefs_kill_sb' at fs/orangefs/super.c:616:6:
>> fs/orangefs/super.c:403:9: warning: 'strncpy' output may be truncated copying 255 bytes from a string of length 255 [-Wstringop-truncation]
     403 |         strncpy(op->upcall.req.fs_umount.orangefs_config_server,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     404 |             devname, ORANGEFS_MAX_SERVER_ADDR_LEN - 1);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/acpi/acpica/tbfind.c: In function 'acpi_tb_find_table':
>> drivers/acpi/acpica/tbfind.c:60:9: warning: 'strncpy' specified bound 6 equals destination size [-Wstringop-truncation]
      60 |         strncpy(header.oem_id, oem_id, ACPI_OEM_ID_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/tbfind.c:61:9: warning: 'strncpy' specified bound 8 equals destination size [-Wstringop-truncation]
      61 |         strncpy(header.oem_table_id, oem_table_id, ACPI_OEM_TABLE_ID_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/pci/controller/pcie-mt7621.c: In function 'mt7621_pcie_parse_dt':
>> drivers/pci/controller/pcie-mt7621.c:228:49: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |                                                 ^
   In function 'mt7621_pcie_parse_port',
       inlined from 'mt7621_pcie_parse_dt' at drivers/pci/controller/pcie-mt7621.c:280:9:
   drivers/pci/controller/pcie-mt7621.c:228:9: note: 'snprintf' output between 10 and 11 bytes into a destination of size 10
     228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function 'imx_ldb_probe':
>> drivers/gpu/drm/imx/ipuv3/imx-ldb.c:659:39: warning: '_sel' directive writing 4 bytes into a region of size between 3 and 13 [-Wformat-overflow=]
     659 |                 sprintf(clkname, "di%d_sel", i);
         |                                       ^~~~
   drivers/gpu/drm/imx/ipuv3/imx-ldb.c:659:17: note: 'sprintf' output between 8 and 18 bytes into a destination of size 16
     659 |                 sprintf(clkname, "di%d_sel", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +403 fs/orangefs/super.c

1182fca3bc0044 Mike Marshall      2015-07-17  393  
9d286b0d8207a7 Martin Brandenburg 2017-04-25  394  static int orangefs_unmount(int id, __s32 fs_id, const char *devname)
9d286b0d8207a7 Martin Brandenburg 2017-04-25  395  {
9d286b0d8207a7 Martin Brandenburg 2017-04-25  396  	struct orangefs_kernel_op_s *op;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  397  	int r;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  398  	op = op_alloc(ORANGEFS_VFS_OP_FS_UMOUNT);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  399  	if (!op)
9d286b0d8207a7 Martin Brandenburg 2017-04-25  400  		return -ENOMEM;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  401  	op->upcall.req.fs_umount.id = id;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  402  	op->upcall.req.fs_umount.fs_id = fs_id;
9d286b0d8207a7 Martin Brandenburg 2017-04-25 @403  	strncpy(op->upcall.req.fs_umount.orangefs_config_server,
6bdfb48dae8e1b Xiongfeng Wang     2018-01-08  404  	    devname, ORANGEFS_MAX_SERVER_ADDR_LEN - 1);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  405  	r = service_operation(op, "orangefs_fs_umount", 0);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  406  	/* Not much to do about an error here. */
9d286b0d8207a7 Martin Brandenburg 2017-04-25  407  	if (r)
9d286b0d8207a7 Martin Brandenburg 2017-04-25  408  		gossip_err("orangefs_unmount: service_operation %d\n", r);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  409  	op_release(op);
9d286b0d8207a7 Martin Brandenburg 2017-04-25  410  	return r;
9d286b0d8207a7 Martin Brandenburg 2017-04-25  411  }
9d286b0d8207a7 Martin Brandenburg 2017-04-25  412  

:::::: The code at line 403 was first introduced by commit
:::::: 9d286b0d8207a70d7e0ffbd5be864ff7a62de05a orangefs: ensure the userspace component is unmounted if mount fails

:::::: TO: Martin Brandenburg <martin@omnibond.com>
:::::: CC: Mike Marshall <hubcap@omnibond.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
