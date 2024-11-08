Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958F81F5822
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731078732; cv=none; b=jj0/ermlbm+9DaLFvyTE4+knU06f/FWoA2IVZnuNCN1X+E1gRPadBRffxfcGmSxtfYGyQC3Nl3q4kb6EAWXufIe9t/fH9ayDfZL00146+thEXVuTB6uXWytEQYDBB69qaXzYHz0kNDVl3cL0P4sFp+R9bdj2Cdl2mKxNsx8cuP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731078732; c=relaxed/simple;
	bh=Ari8A1KhBihfLBV8g+EKOW7mNkocSN0BsshjDZnkJA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qn87ojFPPpugSSrC+EHpI+x5eiqMBOUTdLFdZKwcf6iFsT0mrZ3r+K06S3ih3WYt7VQTR7hVdP5jeQFE70jWBoEB+boJDBaHpfp6Y/Ux+Mp6vxgcBWQOHbtEsERwXBYAqYZKjigZLEGbAf5LG2qRUSHuzFdnUIt6of6Ctj4HN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l741hoyU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l741hoyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731078731; x=1762614731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ari8A1KhBihfLBV8g+EKOW7mNkocSN0BsshjDZnkJA8=;
  b=l741hoyUkC/TYiVKD96q/+cxA5/99c38MjQZOaDCh2Xy2v2FDUssobvm
   8jQRoS8VgrGRZIMeuLy7SefHl04rd1SaXhDFOhjiufJHPpNWwPgbwDUfb
   mdiCD+JCR/SU8hfVN+yjuqLE5gS9aQQBltBACjEbF5fj0mMf+Q7UdG8Jg
   Pl0vzzSLHU+hheT/zJpcgxqtSnBtiGSAI59zHrYoIGDmDFzqKqKBzQhfy
   hvHGi0m1WZy2WkE0tGLPkPZLGKK/BRUqJMyq/AH4kkvBEEZJgUitGMv1R
   aR5a5inHlnlH7js7AtbPaErBBypgpNEavMJD9lijcSZUJWzGqWAdRYg55
   w==;
X-CSE-ConnectionGUID: AkKReNG9Sku//kfbWeUEHA==
X-CSE-MsgGUID: tBjx2vWEREC9xmFCA7mNmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30734867"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30734867"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 07:12:11 -0800
X-CSE-ConnectionGUID: Lp0Pqm+DQqyhk+5Bsbx3eA==
X-CSE-MsgGUID: kpK80P8OSBStjRUt7CfJmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="116473376"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Nov 2024 07:12:07 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Qeb-000rXJ-1j;
	Fri, 08 Nov 2024 15:12:05 +0000
Date: Fri, 8 Nov 2024 23:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] Fix: Ensure auth_data and ap_addr are properly set
 before marking STA as authenticated
Message-ID: <202411082330.Lvi2renZ-lkp@intel.com>
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
In-Reply-To: <20241108022828.6571-1-sarvesh20123@gmail.com>
References: <20241108022828.6571-1-sarvesh20123@gmail.com>
TO: Saru2003 <sarvesh20123@gmail.com>
TO: johannes@sipsolutions.net
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: linux-wireless@vger.kernel.org
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Saru2003 <sarvesh20123@gmail.com>

Hi Saru2003,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Saru2003/Fix-Ensure-auth_data-and-ap_addr-are-properly-set-before-marking-STA-as-authenticated/20241108-103338
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20241108022828.6571-1-sarvesh20123%40gmail.com
patch subject: [PATCH] Fix: Ensure auth_data and ap_addr are properly set before marking STA as authenticated
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20241108 (https://download.01.org/0day-ci/archive/20241108/202411082330.Lvi2renZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411082330.Lvi2renZ-lkp@intel.com/

smatch warnings:
net/mac80211/mlme.c:4341 ieee80211_mark_sta_auth() warn: this array is probably non-NULL. 'ifmgd->auth_data->ap_addr'

vim +4341 net/mac80211/mlme.c

66e67e41890844 Johannes Berg 2012-01-20  4334  
a857c21eaf3988 Johannes Berg 2022-07-12  4335  static bool ieee80211_mark_sta_auth(struct ieee80211_sub_if_data *sdata)
fc107a93307165 Jouni Malinen 2018-10-11  4336  {
efb543e61cc3a2 Jouni Malinen 2018-10-11  4337  	struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
8bade8abd8cde5 Saru2003      2024-11-08  4338  	const u8 *ap_addr;
fc107a93307165 Jouni Malinen 2018-10-11  4339  	struct sta_info *sta;
fc107a93307165 Jouni Malinen 2018-10-11  4340  	
8bade8abd8cde5 Saru2003      2024-11-08 @4341  	if (!ifmgd->auth_data || !ifmgd->auth_data->ap_addr) {
8bade8abd8cde5 Saru2003      2024-11-08  4342  		sdata_info(sdata, "auth_data not set or ap_addr missing\n");
8bade8abd8cde5 Saru2003      2024-11-08  4343  		return false;
8bade8abd8cde5 Saru2003      2024-11-08  4344  	}
8bade8abd8cde5 Saru2003      2024-11-08  4345  
8bade8abd8cde5 Saru2003      2024-11-08  4346  	ap_addr = ifmgd->auth_data->ap_addr;
8bade8abd8cde5 Saru2003      2024-11-08  4347  
5435af6e6ac013 Johannes Berg 2023-08-28  4348  	lockdep_assert_wiphy(sdata->local->hw.wiphy);
5435af6e6ac013 Johannes Berg 2023-08-28  4349  
efb543e61cc3a2 Jouni Malinen 2018-10-11  4350  	sdata_info(sdata, "authenticated\n");
efb543e61cc3a2 Jouni Malinen 2018-10-11  4351  	ifmgd->auth_data->done = true;
efb543e61cc3a2 Jouni Malinen 2018-10-11  4352  	ifmgd->auth_data->timeout = jiffies + IEEE80211_AUTH_WAIT_ASSOC;
efb543e61cc3a2 Jouni Malinen 2018-10-11  4353  	ifmgd->auth_data->timeout_started = true;
efb543e61cc3a2 Jouni Malinen 2018-10-11  4354  	run_again(sdata, ifmgd->auth_data->timeout);
efb543e61cc3a2 Jouni Malinen 2018-10-11  4355  
fc107a93307165 Jouni Malinen 2018-10-11  4356  	/* move station state to auth */
b65567b03c9502 Johannes Berg 2022-06-24  4357  	sta = sta_info_get(sdata, ap_addr);
fc107a93307165 Jouni Malinen 2018-10-11  4358  	if (!sta) {
8bade8abd8cde5 Saru2003      2024-11-08  4359  	        sdata_info(sdata, "STA %pM not found, skipping authentication mark\n", ap_addr);
4d3acf4311a040 Johannes Berg 2023-08-28  4360  		return false;
fc107a93307165 Jouni Malinen 2018-10-11  4361  	}
fc107a93307165 Jouni Malinen 2018-10-11  4362  	if (sta_info_move_state(sta, IEEE80211_STA_AUTH)) {
b65567b03c9502 Johannes Berg 2022-06-24  4363  		sdata_info(sdata, "failed moving %pM to auth\n", ap_addr);
4d3acf4311a040 Johannes Berg 2023-08-28  4364  		return false;
fc107a93307165 Jouni Malinen 2018-10-11  4365  	}
fc107a93307165 Jouni Malinen 2018-10-11  4366  
4d3acf4311a040 Johannes Berg 2023-08-28  4367  	return true;
fc107a93307165 Jouni Malinen 2018-10-11  4368  }
fc107a93307165 Jouni Malinen 2018-10-11  4369  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
