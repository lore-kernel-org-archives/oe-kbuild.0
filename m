Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E9C13CA8A
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735204376; cv=none; b=sqGR9HjdF6nz565CquvGQfinvNvyQHdS0DhvnH8BeOD9voQ4cJbuUpQcNMkkY+d1IgeOg4PLPXubYorI9TV4JenrPksj03N3Mx/SGA6efCXbFR1g06Oy303aWN3vxthg9yw8yd+xS1r+QDiR5WQr/LxOciK4TbZZdq0foF/hRc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735204376; c=relaxed/simple;
	bh=mUu8obxB0ERXio43za0RbRbslE6MU38LXtUdlStF3NE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q14jK694CR0coxFnXMu15xdZgeuDLVrcSisY5zW9aAfeC8q6vsBj8OCG8yQfATKIqRZSP+q9lyhEolG8sAql3+iEKeNdzQ83iVuBDVXBjct0fpnfL4Klf2NXPO051cUxSYpDsHVczL1FuPFXCWwmfqLIfDXk8cwQ19YBPgGVKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHTsVzXm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHTsVzXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735204374; x=1766740374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mUu8obxB0ERXio43za0RbRbslE6MU38LXtUdlStF3NE=;
  b=GHTsVzXmdnWoVo+C3e1UYEgN0kZ5i7ECEjY9sndNhVwWULIzwlRk1KPF
   ZcjOuBZC223Dz0lD3ksbk4jbTGGPbzT5jp0lUl7HI+CwLf1dQNRgsTKWE
   JDW2iR4k+JJvjPpv68DRmF8hA54jzBxlHTbOqtfELa3eV2/Ed2WgItQFJ
   e3wh4JoasgudEFPV4C0S4fWiCUlbUuiVVtq+43sjB6pxAcdDE4qp8scOC
   Q/NrFNFGHSVsc98TUItaTSnIaewuizeabDQXFv1XVDaOV8MHS1DgXNNS5
   32dW41hRsxUa9i2A++bfugeo3Dc7JHpny+OaUdCRCeZi4tKmKElNyfT1E
   Q==;
X-CSE-ConnectionGUID: CBgL+Ih1SnCM1HP2CTxbqw==
X-CSE-MsgGUID: J6M7x3lESS6igYH9Y1Qtlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46997735"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="46997735"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 01:12:53 -0800
X-CSE-ConnectionGUID: LZfHNPp2Qju0ehh8XGKSnA==
X-CSE-MsgGUID: 9NHoKyQfSi6ujI8GUi8ZSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99742460"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Dec 2024 01:12:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQjvF-0002Qo-2G;
	Thu, 26 Dec 2024 09:12:49 +0000
Date: Thu, 26 Dec 2024 17:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:6.12/linux 1/1] net/core/rtnetlink.c:1593 rtnl_xdp_fill()
 warn: missing error code 'err'
Message-ID: <202412261741.KiMk9t5S-lkp@intel.com>
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
TO: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
CC: Kishor408 <kishorx.buchi@intel.com>
CC: Aravindhan Gunasekaran <aravindhan.gunasekaran@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   af28adffb0fe876a7f6b55f145e6cae4861209a9
commit: d422faba40f2b00b944ed5ffa9c365bf904c950b [1/1] rtnetlink: Fix unchecked return value of dev_xdp_query_md_btf()
:::::: branch date: 6 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261741.KiMk9t5S-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412261741.KiMk9t5S-lkp@intel.com/

New smatch warnings:
net/core/rtnetlink.c:1593 rtnl_xdp_fill() warn: missing error code 'err'

Old smatch warnings:
net/core/rtnetlink.c:402 __rtnl_register_many() error: uninitialized symbol 'err'.

vim +/err +1593 net/core/rtnetlink.c

d67b9cd28c1d7f Daniel Borkmann           2017-05-12  1553  
d1fdd9138682e0 Brenden Blanco            2016-07-19  1554  static int rtnl_xdp_fill(struct sk_buff *skb, struct net_device *dev)
d1fdd9138682e0 Brenden Blanco            2016-07-19  1555  {
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1556  	u32 prog_id, md_btf_id;
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1557  	u8 md_btf_enabled = 0;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1558  	struct nlattr *xdp;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1559  	int err;
4f91da26c81145 Jakub Kicinski            2018-07-11  1560  	u8 mode;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1561  
ae0be8de9a53cd Michal Kubecek            2019-04-26  1562  	xdp = nla_nest_start_noflag(skb, IFLA_XDP);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1563  	if (!xdp)
d1fdd9138682e0 Brenden Blanco            2016-07-19  1564  		return -EMSGSIZE;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1565  
a25717d2b60434 Jakub Kicinski            2018-07-11  1566  	prog_id = 0;
a25717d2b60434 Jakub Kicinski            2018-07-11  1567  	mode = XDP_ATTACHED_NONE;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1568  	err = rtnl_xdp_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_SKB,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1569  				  IFLA_XDP_SKB_PROG_ID, rtnl_xdp_prog_skb);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1570  	if (err)
b5cdae3291f7be David S. Miller           2017-04-18  1571  		goto err_cancel;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1572  	err = rtnl_xdp_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_DRV,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1573  				  IFLA_XDP_DRV_PROG_ID, rtnl_xdp_prog_drv);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1574  	if (err)
a25717d2b60434 Jakub Kicinski            2018-07-11  1575  		goto err_cancel;
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1576  	err = rtnl_xdp_report_one(skb, dev, &prog_id, &mode, XDP_ATTACHED_HW,
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1577  				  IFLA_XDP_HW_PROG_ID, rtnl_xdp_prog_hw);
202aabe84a8fd8 Jakub Kicinski            2018-07-16  1578  	if (err)
58038695e62b44 Martin KaFai Lau          2017-06-15  1579  		goto err_cancel;
4f91da26c81145 Jakub Kicinski            2018-07-11  1580  
a25717d2b60434 Jakub Kicinski            2018-07-11  1581  	err = nla_put_u8(skb, IFLA_XDP_ATTACHED, mode);
b5cdae3291f7be David S. Miller           2017-04-18  1582  	if (err)
b5cdae3291f7be David S. Miller           2017-04-18  1583  		goto err_cancel;
d67b9cd28c1d7f Daniel Borkmann           2017-05-12  1584  
a25717d2b60434 Jakub Kicinski            2018-07-11  1585  	if (prog_id && mode != XDP_ATTACHED_MULTI) {
58038695e62b44 Martin KaFai Lau          2017-06-15  1586  		err = nla_put_u32(skb, IFLA_XDP_PROG_ID, prog_id);
58038695e62b44 Martin KaFai Lau          2017-06-15  1587  		if (err)
58038695e62b44 Martin KaFai Lau          2017-06-15  1588  			goto err_cancel;
58038695e62b44 Martin KaFai Lau          2017-06-15  1589  	}
58038695e62b44 Martin KaFai Lau          2017-06-15  1590  
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1591  	md_btf_id = dev_xdp_query_md_btf(dev, &md_btf_enabled);
d422faba40f2b0 Muhammad Husaini Zulkifli 2021-07-30  1592  	if (!md_btf_id)
d422faba40f2b0 Muhammad Husaini Zulkifli 2021-07-30 @1593  		goto err_cancel;
d422faba40f2b0 Muhammad Husaini Zulkifli 2021-07-30  1594  
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1595  	nla_put_u32(skb, IFLA_XDP_MD_BTF_ID, md_btf_id);
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1596  	nla_put_u8(skb, IFLA_XDP_MD_BTF_STATE, md_btf_enabled);
32bb8f64a1a821 Muhammad Husaini Zulkifli 2021-06-14  1597  
d1fdd9138682e0 Brenden Blanco            2016-07-19  1598  	nla_nest_end(skb, xdp);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1599  	return 0;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1600  
d1fdd9138682e0 Brenden Blanco            2016-07-19  1601  err_cancel:
d1fdd9138682e0 Brenden Blanco            2016-07-19  1602  	nla_nest_cancel(skb, xdp);
d1fdd9138682e0 Brenden Blanco            2016-07-19  1603  	return err;
d1fdd9138682e0 Brenden Blanco            2016-07-19  1604  }
d1fdd9138682e0 Brenden Blanco            2016-07-19  1605  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
