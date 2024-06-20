Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD5454FA2
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718870026; cv=none; b=Ma1tR6Flfe7JJvlM/4vvOOQyX0RBZK8S/PEThNSYlGanZRX7GUqPZwy+lhaFjj5MLiEbeXs1upgpZpyR2+pjQJENTSJX+DfFvEeSyRKHHHZGSXf5vHweGiRvPHiS2RapuxSNES7Kpylt/z+BkbteXzMLMDyZWbrrUUuwm+eb2L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718870026; c=relaxed/simple;
	bh=EK0pR92J9t2V3jzfKSr3uAidgnYOgLkTR2DTtyT5ldk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOn8JrmOGq1Pr8ocMUYbin2U0wOeWJh9xKCxKnepuAqf6gFPkFFZf+dlN1HiWmCplB2gI/HDl8goes/hNifcAyvkZdLrdEveIaw0NxXshlj/oDC3UfY7/O7uoWkSDP+P53VjL9aVtshT27dwt0NIBTVh5QnSWRNzIeYFEHLVpGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGaOq4oF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGaOq4oF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718870024; x=1750406024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EK0pR92J9t2V3jzfKSr3uAidgnYOgLkTR2DTtyT5ldk=;
  b=MGaOq4oFDJkbG9afZMCnd8aFTKhmAwJcXBmknHdI7bE/GDTM34lh9wdF
   qeILQPhobVKYSzHnSPdbISSrQI+J5f0DkQ9ITt9vxj/KWuM5TuPu92wWS
   D3fPCLOd4onounbjPGaFyiKXcetSAB/ht1AG7t+9x8dLPpcNE4d9MkAiM
   qRqAdQi0BTZX5nyyu30zfvyBNJ+9G7z0rNZoTbBMCBHvJPGBMT2HnB/W5
   mnwYb344sJ02kncX7LKlFHOtUkFqr4fY7HqLlXoTeaBf2oCVBWjHKjCjg
   7FsqUT1UNjyvHVBnH35Uc9OxcyJYF1GoJD84P5aXOAnLouk5bUlodL4sO
   Q==;
X-CSE-ConnectionGUID: YmzcRm2oQ5OL02xFETOZEw==
X-CSE-MsgGUID: fsuqWxdGTIOgvxh62lXT+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26421145"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="26421145"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 00:53:44 -0700
X-CSE-ConnectionGUID: 43tB0n2GTD2xvMx97Gk/NQ==
X-CSE-MsgGUID: UxwC85lpSzaUX2tdtW59tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42816025"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jun 2024 00:53:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKCc0-0007QY-28;
	Thu, 20 Jun 2024 07:53:40 +0000
Date: Thu, 20 Jun 2024 15:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpirko-mlxsw:combined_queue 30/41] net/ethtool/module.c:186
 ethnl_module_fw_flash_ntf_put_err() warn: passing zero to 'PTR_ERR'
Message-ID: <202406201539.b3yhaypM-lkp@intel.com>
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
head:   ded71079fd9b5d39c76a01fdfa82eb29e047b512
commit: c270a7d3889b3655d39165331365c2c65d41185f [30/41] ethtool: Add flashing transceiver modules' firmware notifications ability
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201539.b3yhaypM-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406201539.b3yhaypM-lkp@intel.com/

smatch warnings:
net/ethtool/module.c:186 ethnl_module_fw_flash_ntf_put_err() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +186 net/ethtool/module.c

c270a7d3889b36 Danielle Ratson 2024-06-17  164  
c270a7d3889b36 Danielle Ratson 2024-06-17  165  static int
c270a7d3889b36 Danielle Ratson 2024-06-17  166  ethnl_module_fw_flash_ntf_put_err(struct sk_buff *skb, char *err_msg,
c270a7d3889b36 Danielle Ratson 2024-06-17  167  				  char *sub_err_msg)
c270a7d3889b36 Danielle Ratson 2024-06-17  168  {
c270a7d3889b36 Danielle Ratson 2024-06-17  169  	int err_msg_len, sub_err_msg_len, total_len;
c270a7d3889b36 Danielle Ratson 2024-06-17  170  	struct nlattr *attr;
c270a7d3889b36 Danielle Ratson 2024-06-17  171  
c270a7d3889b36 Danielle Ratson 2024-06-17  172  	if (!err_msg)
c270a7d3889b36 Danielle Ratson 2024-06-17  173  		return 0;
c270a7d3889b36 Danielle Ratson 2024-06-17  174  
c270a7d3889b36 Danielle Ratson 2024-06-17  175  	err_msg_len = strlen(err_msg);
c270a7d3889b36 Danielle Ratson 2024-06-17  176  	total_len = err_msg_len + 2; /* For period and NUL. */
c270a7d3889b36 Danielle Ratson 2024-06-17  177  
c270a7d3889b36 Danielle Ratson 2024-06-17  178  	if (sub_err_msg) {
c270a7d3889b36 Danielle Ratson 2024-06-17  179  		sub_err_msg_len = strlen(sub_err_msg);
c270a7d3889b36 Danielle Ratson 2024-06-17  180  		total_len += sub_err_msg_len + 2; /* For ", ". */
c270a7d3889b36 Danielle Ratson 2024-06-17  181  	}
c270a7d3889b36 Danielle Ratson 2024-06-17  182  
c270a7d3889b36 Danielle Ratson 2024-06-17  183  	attr = nla_reserve(skb, ETHTOOL_A_MODULE_FW_FLASH_STATUS_MSG,
c270a7d3889b36 Danielle Ratson 2024-06-17  184  			   total_len);
c270a7d3889b36 Danielle Ratson 2024-06-17  185  	if (!attr)
c270a7d3889b36 Danielle Ratson 2024-06-17 @186  		return PTR_ERR(attr);
c270a7d3889b36 Danielle Ratson 2024-06-17  187  
c270a7d3889b36 Danielle Ratson 2024-06-17  188  	if (sub_err_msg)
c270a7d3889b36 Danielle Ratson 2024-06-17  189  		sprintf(nla_data(attr), "%s, %s.", err_msg, sub_err_msg);
c270a7d3889b36 Danielle Ratson 2024-06-17  190  	else
c270a7d3889b36 Danielle Ratson 2024-06-17  191  		sprintf(nla_data(attr), "%s.", err_msg);
c270a7d3889b36 Danielle Ratson 2024-06-17  192  
c270a7d3889b36 Danielle Ratson 2024-06-17  193  	return 0;
c270a7d3889b36 Danielle Ratson 2024-06-17  194  }
c270a7d3889b36 Danielle Ratson 2024-06-17  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
