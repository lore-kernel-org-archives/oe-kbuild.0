Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A24273ED
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NeE6MkG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697233676; x=1728769676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B6gz+Yo21hQEEMJ4+JYw1PXg07SU0L/XrtGnt0Q4Nqw=;
  b=NeE6MkG9B0TzKh/8UidQCMGOpnT3DcQdagnEq3x/IjhOm0OuU0Jse+TH
   mDKR8m3GgNxqk/Fymu82lihroGHJVv2cFvfB7OgThx6ksP0O8drnD754G
   HgC6a5h2xD7Fc0DK+zGsiy7uVb+qcrL3hzymIqBov4/zH3KfAxZxNKPiK
   Vwkrx/RlvJ/KflXcJ3PqqjnAMc+zSCv9Gwl9E9rTd5oOHf2Nor/zY2M0J
   bd15zmHUz+/n0rJREa7ORim4hCHHFUj6rZl9h6kBLnHypAaCVSevugWcS
   P/IMsLsqtssUO/oWH1ePdBOVrfSwwpa6lcd7tBoWrH4kEpQvwLx9ldQCd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="382500720"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="382500720"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 14:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086300155"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="1086300155"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 14:47:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrQ0b-0005R1-2T;
	Fri, 13 Oct 2023 21:47:49 +0000
Date: Sat, 14 Oct 2023 05:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/080-wifi 30/32]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3971
 brcmf_get_netinfo_array() error: uninitialized symbol 'netinfo'.
Message-ID: <202310140546.cCy7xVip-lkp@intel.com>
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
TO: Daniel Berlin <dberlin@dberlin.org>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   2fac67e22f6cf7c8b1261e1bc9a33de738859b89
commit: 3952a7bc01860b0efa4efc162197fc0ddafe7187 [30/32] Finish 6G support by supporting new scan structures
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140546.cCy7xVip-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140546.cCy7xVip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310140546.cCy7xVip-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3971 brcmf_get_netinfo_array() error: uninitialized symbol 'netinfo'.
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3995 brcmf_get_netinfo_v3_array() error: uninitialized symbol 'netinfo'.

Old smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:5357 brcmf_cfg80211_start_ap() warn: inconsistent indenting
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7959 brcmf_setup_wiphy() warn: inconsistent indenting

vim +/netinfo +3971 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

fa85b30a908455 Arend Van Spriel    2016-11-23  3947  
53e3a80d80c80b Arend Van Spriel    2016-11-23  3948  static struct brcmf_pno_net_info_le *
53e3a80d80c80b Arend Van Spriel    2016-11-23  3949  brcmf_get_netinfo_array(struct brcmf_pno_scanresults_le *pfn_v1)
53e3a80d80c80b Arend Van Spriel    2016-11-23  3950  {
53e3a80d80c80b Arend Van Spriel    2016-11-23  3951  	struct brcmf_pno_scanresults_v2_le *pfn_v2;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3952  	struct brcmf_pno_net_info_le *netinfo;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3953  
53e3a80d80c80b Arend Van Spriel    2016-11-23  3954  	switch (pfn_v1->version) {
53e3a80d80c80b Arend Van Spriel    2016-11-23  3955  	default:
53e3a80d80c80b Arend Van Spriel    2016-11-23  3956  		WARN_ON(1);
0bde10dc553d27 Gustavo A. R. Silva 2020-08-21  3957  		fallthrough;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3958  	case cpu_to_le32(1):
53e3a80d80c80b Arend Van Spriel    2016-11-23  3959  		netinfo = (struct brcmf_pno_net_info_le *)(pfn_v1 + 1);
53e3a80d80c80b Arend Van Spriel    2016-11-23  3960  		break;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3961  	case cpu_to_le32(2):
53e3a80d80c80b Arend Van Spriel    2016-11-23  3962  		pfn_v2 = (struct brcmf_pno_scanresults_v2_le *)pfn_v1;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3963  		netinfo = (struct brcmf_pno_net_info_le *)(pfn_v2 + 1);
53e3a80d80c80b Arend Van Spriel    2016-11-23  3964  		break;
3952a7bc01860b Daniel Berlin       2023-10-05  3965  	case cpu_to_le32(3):
3952a7bc01860b Daniel Berlin       2023-10-05  3966  		brcmf_err(
3952a7bc01860b Daniel Berlin       2023-10-05  3967  			"This should use the brcmf_get_netinfo_v3_array function to retrieve the array\n");
3952a7bc01860b Daniel Berlin       2023-10-05  3968  		break;
3952a7bc01860b Daniel Berlin       2023-10-05  3969  	}
3952a7bc01860b Daniel Berlin       2023-10-05  3970  
3952a7bc01860b Daniel Berlin       2023-10-05 @3971  	return netinfo;
3952a7bc01860b Daniel Berlin       2023-10-05  3972  }
3952a7bc01860b Daniel Berlin       2023-10-05  3973  
3952a7bc01860b Daniel Berlin       2023-10-05  3974  static struct brcmf_pno_net_info_v3_le *
3952a7bc01860b Daniel Berlin       2023-10-05  3975  brcmf_get_netinfo_v3_array(struct brcmf_pno_scanresults_le *pfn_v1)
3952a7bc01860b Daniel Berlin       2023-10-05  3976  {
3952a7bc01860b Daniel Berlin       2023-10-05  3977  	struct brcmf_pno_scanresults_v2_le *pfn_v2;
3952a7bc01860b Daniel Berlin       2023-10-05  3978  	struct brcmf_pno_net_info_v3_le *netinfo;
3952a7bc01860b Daniel Berlin       2023-10-05  3979  
3952a7bc01860b Daniel Berlin       2023-10-05  3980  	switch (pfn_v1->version) {
3952a7bc01860b Daniel Berlin       2023-10-05  3981  	default:
3952a7bc01860b Daniel Berlin       2023-10-05  3982  		WARN_ON(1);
3952a7bc01860b Daniel Berlin       2023-10-05  3983  		fallthrough;
3952a7bc01860b Daniel Berlin       2023-10-05  3984  	case cpu_to_le32(1):
3952a7bc01860b Daniel Berlin       2023-10-05  3985  	case cpu_to_le32(2):
3952a7bc01860b Daniel Berlin       2023-10-05  3986  		brcmf_err(
3952a7bc01860b Daniel Berlin       2023-10-05  3987  			"This should use the brcmf_get_netinfo_array function to retrieve the array\n");
3952a7bc01860b Daniel Berlin       2023-10-05  3988  		break;
3952a7bc01860b Daniel Berlin       2023-10-05  3989  	case cpu_to_le32(3):
3952a7bc01860b Daniel Berlin       2023-10-05  3990  		pfn_v2 = (struct brcmf_pno_scanresults_v2_le *)pfn_v1;
3952a7bc01860b Daniel Berlin       2023-10-05  3991  		netinfo = (struct brcmf_pno_net_info_v3_le *)(pfn_v2 + 1);
3952a7bc01860b Daniel Berlin       2023-10-05  3992  		break;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3993  	}
53e3a80d80c80b Arend Van Spriel    2016-11-23  3994  
53e3a80d80c80b Arend Van Spriel    2016-11-23 @3995  	return netinfo;
53e3a80d80c80b Arend Van Spriel    2016-11-23  3996  }
53e3a80d80c80b Arend Van Spriel    2016-11-23  3997  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
