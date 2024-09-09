Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14FB12E48
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 15:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894031; cv=none; b=hrWTt5XDRZgD3ia6Ok/hH09K8daP6Xpd6p8e3KFqvop8Hn5eUOL/r8mHhXyj3a/eIneLJKW9AgZU+3kVvtnMkaDtS7upQmUI9jNrsfk1JKXswUz3IjtyiET9Pn2gGCFmm4f55Cu5wIfd8+q6PvPPbMf5n7bROlFU7CZbTKEBTS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894031; c=relaxed/simple;
	bh=SXeB3etdz3MYa/THewmKzZNQ2+fwy3xf0LzdOLbHZ+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C4fUZbcYAnZdJergiykp8XGOS4JMSOmBJaZ3/xWb+LaQSedeBWjVCuTKSa3zk+mmTiejF+6W+udX5CgwhsSrqnwd0S4IxUHK5KID7Ayx67hLV7uwMiHXyE5oWH8ZveilEBgQsaBUFO6Mfo3iTYMWfC2MX4cbhvuyx+Y05t/yVF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+0hoQeI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+0hoQeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725894029; x=1757430029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXeB3etdz3MYa/THewmKzZNQ2+fwy3xf0LzdOLbHZ+0=;
  b=E+0hoQeIO0X0YIu3Tl+g0dWcv7orIZqlRA9TimTptiDDVvAbzhnuMInn
   HMkz84o4siXGsvHONRw6vdikTVaPDVPRwCoXiFKqEeNnlDSZ4c8uE/lt7
   78+MdS9RLoIFgp9tqhUI3Xm/0IMpsp/ldmPfRuWzxKsDpeYXd9a8TRd0H
   WPlk7d1NftCDQ0w3HxGhpnq2tuC1Xv7VTqYVfZpk2X4hgu9UrD+9aQ4F8
   gVqcpp6kZJL9vCA1akgfB+b+7YXh87L9qMOBm2OQw6xkQMMes42N1WlsY
   M4378h20tDKvYByIrO8SZZhVmqu2q/Nxk98Ix7i9Gyl+bQRAnFbcyRfig
   w==;
X-CSE-ConnectionGUID: 9/JjG362SFWcxg7KTJEcjA==
X-CSE-MsgGUID: exnuxW6hT36xNhWoHL9zDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="27518191"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="27518191"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:00:26 -0700
X-CSE-ConnectionGUID: WsjMKsGvT2aUollOh9AS1Q==
X-CSE-MsgGUID: e5DZiz1rQxmQa4k7L1biEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66666124"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Sep 2024 08:00:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snfsN-000Erc-1d;
	Mon, 09 Sep 2024 15:00:23 +0000
Date: Mon, 9 Sep 2024 22:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpirko-mlxsw:combined_queue 23/39] net/ethtool/cmis_cdb.c:574
 ethtool_cmis_cdb_execute_epl_cmd() error: uninitialized symbol
 'bytes_written'.
Message-ID: <202409092231.q9mkFnpQ-lkp@intel.com>
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
TO: Danielle Ratson <danieller@nvidia.com>
CC: Petr Machata <petrm@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   5ce465ef86193169b9fa00b26806a05ad7a49b87
commit: 74c5ee4c97461509353a6a12028906809fe2c208 [23/39] net: ethtool: Add support for writing firmware blocks using EPL payload
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240909 (https://download.01.org/0day-ci/archive/20240909/202409092231.q9mkFnpQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409092231.q9mkFnpQ-lkp@intel.com/

smatch warnings:
net/ethtool/cmis_cdb.c:574 ethtool_cmis_cdb_execute_epl_cmd() error: uninitialized symbol 'bytes_written'.

vim +/bytes_written +574 net/ethtool/cmis_cdb.c

74c5ee4c974615 Danielle Ratson 2024-09-04  562  
74c5ee4c974615 Danielle Ratson 2024-09-04  563  static int
74c5ee4c974615 Danielle Ratson 2024-09-04  564  ethtool_cmis_cdb_execute_epl_cmd(struct net_device *dev,
74c5ee4c974615 Danielle Ratson 2024-09-04  565  				 struct ethtool_cmis_cdb_cmd_args *args,
74c5ee4c974615 Danielle Ratson 2024-09-04  566  				 struct ethtool_module_eeprom *page_data)
74c5ee4c974615 Danielle Ratson 2024-09-04  567  {
74c5ee4c974615 Danielle Ratson 2024-09-04  568  	u16 epl_len = be16_to_cpu(args->req.epl_len);
74c5ee4c974615 Danielle Ratson 2024-09-04  569  	u32 bytes_written;
74c5ee4c974615 Danielle Ratson 2024-09-04  570  	u8 page;
74c5ee4c974615 Danielle Ratson 2024-09-04  571  	int err;
74c5ee4c974615 Danielle Ratson 2024-09-04  572  
74c5ee4c974615 Danielle Ratson 2024-09-04  573  	for (page = CMIS_CDB_EPL_PAGE_START;
74c5ee4c974615 Danielle Ratson 2024-09-04 @574  	     page <= CMIS_CDB_EPL_PAGE_END && bytes_written < epl_len; page++) {
74c5ee4c974615 Danielle Ratson 2024-09-04  575  		u16 offset = CMIS_CDB_EPL_FW_BLOCK_OFFSET_START;
74c5ee4c974615 Danielle Ratson 2024-09-04  576  
74c5ee4c974615 Danielle Ratson 2024-09-04  577  		while (offset <= CMIS_CDB_EPL_FW_BLOCK_OFFSET_END &&
74c5ee4c974615 Danielle Ratson 2024-09-04  578  		       bytes_written < epl_len) {
74c5ee4c974615 Danielle Ratson 2024-09-04  579  			u32 bytes_left = epl_len - bytes_written;
74c5ee4c974615 Danielle Ratson 2024-09-04  580  			u16 space_left, bytes_to_write;
74c5ee4c974615 Danielle Ratson 2024-09-04  581  
74c5ee4c974615 Danielle Ratson 2024-09-04  582  			space_left = CMIS_CDB_EPL_FW_BLOCK_OFFSET_END - offset + 1;
74c5ee4c974615 Danielle Ratson 2024-09-04  583  			bytes_to_write = min_t(u16, bytes_left,
74c5ee4c974615 Danielle Ratson 2024-09-04  584  					       min_t(u16, space_left,
74c5ee4c974615 Danielle Ratson 2024-09-04  585  						     args->read_write_len_ext));
74c5ee4c974615 Danielle Ratson 2024-09-04  586  
74c5ee4c974615 Danielle Ratson 2024-09-04  587  			err = __ethtool_cmis_cdb_execute_cmd(dev, page_data,
74c5ee4c974615 Danielle Ratson 2024-09-04  588  							     page, offset,
74c5ee4c974615 Danielle Ratson 2024-09-04  589  							     bytes_to_write,
74c5ee4c974615 Danielle Ratson 2024-09-04  590  							     args->req.epl + bytes_written);
74c5ee4c974615 Danielle Ratson 2024-09-04  591  			if (err < 0)
74c5ee4c974615 Danielle Ratson 2024-09-04  592  				return err;
74c5ee4c974615 Danielle Ratson 2024-09-04  593  
74c5ee4c974615 Danielle Ratson 2024-09-04  594  			offset += bytes_to_write;
74c5ee4c974615 Danielle Ratson 2024-09-04  595  			bytes_written += bytes_to_write;
74c5ee4c974615 Danielle Ratson 2024-09-04  596  		}
74c5ee4c974615 Danielle Ratson 2024-09-04  597  	}
74c5ee4c974615 Danielle Ratson 2024-09-04  598  	return 0;
74c5ee4c974615 Danielle Ratson 2024-09-04  599  }
74c5ee4c974615 Danielle Ratson 2024-09-04  600  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
