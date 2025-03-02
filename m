Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5391D54C0
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740920014; cv=none; b=KHDvthP9+WP9aZ58Ch00kCGph2otyBD256r7ruay2LjYetlJ0+2sTcDURH9PmfNA83mo3r51+G242ipoCeY3Fz+kAH95JsleHUQKvoxhobc9LOEYsabcdtLQkzJm5DqT6Hu2ngWHUcCvfkPAcn99U5pAZ3rr08PwvTnCsVPRP2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740920014; c=relaxed/simple;
	bh=EiRFRv3GfqFE1YCKYOxLkZvz3SK5JoZjetWMTXgHw30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BEOywBNnDyz3HUr5cP3qhof5a42FrKAImbsvr8Mg0tyIi3ygMETG6X0LPWLsmaW6JsiRlKUQmzY0gn16TFEyfwxYmd7rS0dpc32c6gWah8JqgFSTnjhuFjRwNf5loi/0In8ELQCnMTvpopgQ/xJZZUCAPRXMClcORKU9u9L0KHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJCUD342; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJCUD342"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740920012; x=1772456012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EiRFRv3GfqFE1YCKYOxLkZvz3SK5JoZjetWMTXgHw30=;
  b=RJCUD3429ClZi+iRCXLfArKCR4Gi2ToFHBlOzznelZqdIGXj7n4TSP6Z
   xNLEcid1AEvDjpjE2FSQYklHvLJAUF+otgWRNH1h+Dr7LC865Cs3xIkye
   8Tg+BiuZ6rbH05CgObOmvqwvADVf6FWsBrqH3Zl9dsFAS2nV7kPzVJ8z+
   6OE+lRJ3ZUnuCHEHcdSDOceG5EnvCJdDuWJ8d0m1KRSMAdFR+1ubjOtTH
   hJ/MzMvEQNHGRBgMLg+rjBHEAEH7QxTQeWsmyLAxEu+7hcqXKXlkmfNzs
   D2cmw+WAWsGPSNIhTh4CqEiER1AI89uGukvMKunvIEAzvedk+uQrzOAxK
   g==;
X-CSE-ConnectionGUID: Ti9m1thxSUufOBDcpwIndg==
X-CSE-MsgGUID: VbYtgpmmQByXFq+wzg6FsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="64259518"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="64259518"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 04:53:31 -0800
X-CSE-ConnectionGUID: 82GaNRLjRjiR1gkv5QmXSw==
X-CSE-MsgGUID: Z26cws0hTbO7+H+Y7QxbGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123004051"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2025 04:53:30 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toioj-000HKM-1T;
	Sun, 02 Mar 2025 12:53:18 +0000
Date: Sun, 2 Mar 2025 20:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 12/14] devlink: Throw extack messages on param
 value validation error
Message-ID: <202503022006.eOu80RMF-lkp@intel.com>
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
In-Reply-To: <20250228021227.871993-13-saeed@kernel.org>
References: <20250228021227.871993-13-saeed@kernel.org>
TO: Saeed Mahameed <saeed@kernel.org>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Eric Dumazet <edumazet@google.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Tariq Toukan <tariqt@nvidia.com>
CC: Gal Pressman <gal@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Jiri Pirko <jiri@nvidia.com>

Hi Saeed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Saeed-Mahameed/devlink-define-enum-for-attr-types-of-dynamic-attributes/20250228-101818
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250228021227.871993-13-saeed%40kernel.org
patch subject: [PATCH net-next 12/14] devlink: Throw extack messages on param value validation error
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-randconfig-r071-20250302 (https://download.01.org/0day-ci/archive/20250302/202503022006.eOu80RMF-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503022006.eOu80RMF-lkp@intel.com/

smatch warnings:
net/devlink/param.c:498 devlink_param_value_validate() error: we previously assumed 'param_data' could be null (see line 475)

vim +/param_data +498 net/devlink/param.c

830c41e1e987d97 Jiri Pirko     2023-08-28  460  
ca557d9df319fed Saeed Mahameed 2025-02-27  461  static int
ca557d9df319fed Saeed Mahameed 2025-02-27  462  devlink_param_value_validate(struct genl_info *info,
ca557d9df319fed Saeed Mahameed 2025-02-27  463  			     enum devlink_param_type type)
ca557d9df319fed Saeed Mahameed 2025-02-27  464  {
ca557d9df319fed Saeed Mahameed 2025-02-27  465  	struct netlink_ext_ack *extack = info->extack;
ca557d9df319fed Saeed Mahameed 2025-02-27  466  	struct nlattr *param_data;
ca557d9df319fed Saeed Mahameed 2025-02-27  467  	int len = 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  468  
ca557d9df319fed Saeed Mahameed 2025-02-27  469  	if (type != DEVLINK_PARAM_TYPE_BOOL &&
ca557d9df319fed Saeed Mahameed 2025-02-27  470  	    GENL_REQ_ATTR_CHECK(info, DEVLINK_ATTR_PARAM_VALUE_DATA))
ca557d9df319fed Saeed Mahameed 2025-02-27  471  		return -EINVAL;
ca557d9df319fed Saeed Mahameed 2025-02-27  472  
ca557d9df319fed Saeed Mahameed 2025-02-27  473  	param_data = info->attrs[DEVLINK_ATTR_PARAM_VALUE_DATA];
ca557d9df319fed Saeed Mahameed 2025-02-27  474  
ca557d9df319fed Saeed Mahameed 2025-02-27 @475  	if (param_data)
ca557d9df319fed Saeed Mahameed 2025-02-27  476  		len = nla_len(param_data);
ca557d9df319fed Saeed Mahameed 2025-02-27  477  
ca557d9df319fed Saeed Mahameed 2025-02-27  478  	switch (type) {
ca557d9df319fed Saeed Mahameed 2025-02-27  479  	case DEVLINK_PARAM_TYPE_U8:
ca557d9df319fed Saeed Mahameed 2025-02-27  480  		if (len == sizeof(u8))
ca557d9df319fed Saeed Mahameed 2025-02-27  481  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  482  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  483  				       "Expected uint8, got %d bytes", len);
ca557d9df319fed Saeed Mahameed 2025-02-27  484  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  485  	case DEVLINK_PARAM_TYPE_U16:
ca557d9df319fed Saeed Mahameed 2025-02-27  486  		if (len == sizeof(u16))
ca557d9df319fed Saeed Mahameed 2025-02-27  487  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  488  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  489  				       "Expected uint16, got %d bytes", len);
ca557d9df319fed Saeed Mahameed 2025-02-27  490  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  491  	case DEVLINK_PARAM_TYPE_U32:
ca557d9df319fed Saeed Mahameed 2025-02-27  492  		if (len == sizeof(u32))
ca557d9df319fed Saeed Mahameed 2025-02-27  493  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  494  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  495  				       "Expected uint32, got %d bytes", len);
ca557d9df319fed Saeed Mahameed 2025-02-27  496  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  497  	case DEVLINK_PARAM_TYPE_STRING:
ca557d9df319fed Saeed Mahameed 2025-02-27 @498  		len = strnlen(nla_data(param_data), nla_len(param_data));
ca557d9df319fed Saeed Mahameed 2025-02-27  499  
ca557d9df319fed Saeed Mahameed 2025-02-27  500  		if (len < nla_len(param_data) &&
ca557d9df319fed Saeed Mahameed 2025-02-27  501  		    len < __DEVLINK_PARAM_MAX_STRING_VALUE)
ca557d9df319fed Saeed Mahameed 2025-02-27  502  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  503  		NL_SET_ERR_MSG_MOD(extack, "String too long");
ca557d9df319fed Saeed Mahameed 2025-02-27  504  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  505  	case DEVLINK_PARAM_TYPE_BOOL:
ca557d9df319fed Saeed Mahameed 2025-02-27  506  		if (!len)
ca557d9df319fed Saeed Mahameed 2025-02-27  507  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  508  		NL_SET_ERR_MSG_MOD(extack, "Expected flag, got data");
ca557d9df319fed Saeed Mahameed 2025-02-27  509  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  510  	default:
ca557d9df319fed Saeed Mahameed 2025-02-27  511  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  512  				       "Not supported value type %d", type);
ca557d9df319fed Saeed Mahameed 2025-02-27  513  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  514  	}
ca557d9df319fed Saeed Mahameed 2025-02-27  515  	return -EINVAL;
ca557d9df319fed Saeed Mahameed 2025-02-27  516  }
ca557d9df319fed Saeed Mahameed 2025-02-27  517  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
