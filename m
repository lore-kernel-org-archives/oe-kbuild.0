Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D672C236B
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 22:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765317977; cv=none; b=qHg8f4sNTCRJrILw44Ycwn61YVK9K0qbduFhLMMWZD0nLKgtMEcwVWrHrBSSrb4vMGhj8mCHaxla7hIT7hv0iVcixLyhwOd6v3rFdROChBldMryvcPgzcYEQB1uNSEHNPAxc0cKz4DEo9RczfVImBlWUtXqr1hFTDc+wqwTIrFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765317977; c=relaxed/simple;
	bh=sKMPgpnTo0Glttqjcxo9l9Tg6ctwa7BSlD6XOPUhvIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WtKtsZzTdkX7lBPsf0A+UeLNLdJWkJzka44OQpZUlbJlN63KUBeeoqNfjwJ6qPYcEZq3PjWBhahFqQm2qx46cJVKSUGcKcDOV/mxhIf8RwGVgY+nHQs74gsDXfADqFywcJ9f9tlMANft7afkMPh94Y/gqMi/GyjuBwsmZx+45UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CU8gDPvV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CU8gDPvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765317976; x=1796853976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sKMPgpnTo0Glttqjcxo9l9Tg6ctwa7BSlD6XOPUhvIU=;
  b=CU8gDPvVcmn+uC7hVmYI4G7GKNhUEOiDfe9JJdu6PRC2vr6TsxTw4SD9
   xwdnOYYsKL/ZJTYOgnB417a38ICY5nfpFu7A+sD38GEoiXNKcPLgnAKU/
   kTyoZjjezznAn5zSmwied9HXW4+yomkqme96HUFYib7WdY5xGshu7nHEx
   6otquy2XC597t/KthVDaORTXwDSEqUMjfhYYim8sVzey7Q+m39c19xoUI
   l66fuSSgti6kydadF1dgeC4qZHriVNXwOs5fdFRirA9YrqYmPa9cmyf+5
   T2UeOkZWnHKg2oI+rK+eDNImAZCxL8cgkO1OqaCT5jECTppphQT1aBeOd
   A==;
X-CSE-ConnectionGUID: +FvrL22/QUu1vfmYLrE+sA==
X-CSE-MsgGUID: QCBmsxtARj+A3YAdcyJULw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69874186"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="69874186"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:06:15 -0800
X-CSE-ConnectionGUID: wEFx03zGRTernnuWBVgT0g==
X-CSE-MsgGUID: 2OXX325hTqS1/HI4+4oF6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="201268387"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Dec 2025 14:06:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT5qV-000000002JJ-1wd6;
	Tue, 09 Dec 2025 22:06:11 +0000
Date: Wed, 10 Dec 2025 06:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/resctrl/mpam_devices.c:1112 __ris_msmon_read() error:
 uninitialized symbol 'overflow'.
Message-ID: <202512100547.N7QPYgfb-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Rohit Mathew <rohit.mathew@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: James Morse <james.morse@arm.com>
CC: Ben Horgan <ben.horgan@arm.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: Fenghua Yu <fenghuay@nvidia.com>
CC: Gavin Shan <gshan@redhat.com>
CC: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: 9e5afb7c32830bcd123976a7729ef4e2dff0cd77 arm_mpam: Use long MBWU counters if supported
date:   3 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r072-20251208 (https://download.01.org/0day-ci/archive/20251210/202512100547.N7QPYgfb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512100547.N7QPYgfb-lkp@intel.com/

New smatch warnings:
drivers/resctrl/mpam_devices.c:1112 __ris_msmon_read() error: uninitialized symbol 'overflow'.

Old smatch warnings:
drivers/resctrl/mpam_devices.c:1169 __ris_msmon_read() error: uninitialized symbol 'now'.

vim +/overflow +1112 drivers/resctrl/mpam_devices.c

b35363793291e3 Ben Horgan   2025-11-19  1069  
823e7c3712c584 James Morse  2025-11-19  1070  static void __ris_msmon_read(void *arg)
823e7c3712c584 James Morse  2025-11-19  1071  {
823e7c3712c584 James Morse  2025-11-19  1072  	u64 now;
823e7c3712c584 James Morse  2025-11-19  1073  	bool nrdy = false;
823e7c3712c584 James Morse  2025-11-19  1074  	bool config_mismatch;
b35363793291e3 Ben Horgan   2025-11-19  1075  	bool overflow;
823e7c3712c584 James Morse  2025-11-19  1076  	struct mon_read *m = arg;
823e7c3712c584 James Morse  2025-11-19  1077  	struct mon_cfg *ctx = m->ctx;
823e7c3712c584 James Morse  2025-11-19  1078  	struct mpam_msc_ris *ris = m->ris;
41e8a14950e173 James Morse  2025-11-19  1079  	struct msmon_mbwu_state *mbwu_state;
823e7c3712c584 James Morse  2025-11-19  1080  	struct mpam_props *rprops = &ris->props;
823e7c3712c584 James Morse  2025-11-19  1081  	struct mpam_msc *msc = m->ris->vmsc->msc;
823e7c3712c584 James Morse  2025-11-19  1082  	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
823e7c3712c584 James Morse  2025-11-19  1083  
823e7c3712c584 James Morse  2025-11-19  1084  	if (!mpam_mon_sel_lock(msc)) {
823e7c3712c584 James Morse  2025-11-19  1085  		m->err = -EIO;
823e7c3712c584 James Morse  2025-11-19  1086  		return;
823e7c3712c584 James Morse  2025-11-19  1087  	}
823e7c3712c584 James Morse  2025-11-19  1088  	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
823e7c3712c584 James Morse  2025-11-19  1089  		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
823e7c3712c584 James Morse  2025-11-19  1090  	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
823e7c3712c584 James Morse  2025-11-19  1091  
823e7c3712c584 James Morse  2025-11-19  1092  	/*
823e7c3712c584 James Morse  2025-11-19  1093  	 * Read the existing configuration to avoid re-writing the same values.
823e7c3712c584 James Morse  2025-11-19  1094  	 * This saves waiting for 'nrdy' on subsequent reads.
823e7c3712c584 James Morse  2025-11-19  1095  	 */
823e7c3712c584 James Morse  2025-11-19  1096  	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
9e5afb7c32830b Rohit Mathew 2025-11-19  1097  
9e5afb7c32830b Rohit Mathew 2025-11-19  1098  	if (mpam_feat_msmon_mbwu_31counter == m->type)
b35363793291e3 Ben Horgan   2025-11-19  1099  		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
9e5afb7c32830b Rohit Mathew 2025-11-19  1100  	else if (mpam_feat_msmon_mbwu_44counter == m->type ||
9e5afb7c32830b Rohit Mathew 2025-11-19  1101  		 mpam_feat_msmon_mbwu_63counter == m->type)
9e5afb7c32830b Rohit Mathew 2025-11-19  1102  		overflow = cur_ctl & MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;
b35363793291e3 Ben Horgan   2025-11-19  1103  
823e7c3712c584 James Morse  2025-11-19  1104  	clean_msmon_ctl_val(&cur_ctl);
823e7c3712c584 James Morse  2025-11-19  1105  	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
823e7c3712c584 James Morse  2025-11-19  1106  	config_mismatch = cur_flt != flt_val ||
823e7c3712c584 James Morse  2025-11-19  1107  			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
823e7c3712c584 James Morse  2025-11-19  1108  
b35363793291e3 Ben Horgan   2025-11-19  1109  	if (config_mismatch) {
823e7c3712c584 James Morse  2025-11-19  1110  		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
b35363793291e3 Ben Horgan   2025-11-19  1111  		overflow = false;
b35363793291e3 Ben Horgan   2025-11-19 @1112  	} else if (overflow) {
b35363793291e3 Ben Horgan   2025-11-19  1113  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
9e5afb7c32830b Rohit Mathew 2025-11-19  1114  				      cur_ctl &
9e5afb7c32830b Rohit Mathew 2025-11-19  1115  				      ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
9e5afb7c32830b Rohit Mathew 2025-11-19  1116  					MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
b35363793291e3 Ben Horgan   2025-11-19  1117  	}
823e7c3712c584 James Morse  2025-11-19  1118  
823e7c3712c584 James Morse  2025-11-19  1119  	switch (m->type) {
823e7c3712c584 James Morse  2025-11-19  1120  	case mpam_feat_msmon_csu:
823e7c3712c584 James Morse  2025-11-19  1121  		now = mpam_read_monsel_reg(msc, CSU);
823e7c3712c584 James Morse  2025-11-19  1122  		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, rprops))
823e7c3712c584 James Morse  2025-11-19  1123  			nrdy = now & MSMON___NRDY;
41e8a14950e173 James Morse  2025-11-19  1124  		now = FIELD_GET(MSMON___VALUE, now);
823e7c3712c584 James Morse  2025-11-19  1125  		break;
9e5afb7c32830b Rohit Mathew 2025-11-19  1126  	case mpam_feat_msmon_mbwu_31counter:
9e5afb7c32830b Rohit Mathew 2025-11-19  1127  	case mpam_feat_msmon_mbwu_44counter:
9e5afb7c32830b Rohit Mathew 2025-11-19  1128  	case mpam_feat_msmon_mbwu_63counter:
9e5afb7c32830b Rohit Mathew 2025-11-19  1129  		if (m->type != mpam_feat_msmon_mbwu_31counter) {
9e5afb7c32830b Rohit Mathew 2025-11-19  1130  			now = mpam_msc_read_mbwu_l(msc);
9e5afb7c32830b Rohit Mathew 2025-11-19  1131  			if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
9e5afb7c32830b Rohit Mathew 2025-11-19  1132  				nrdy = now & MSMON___L_NRDY;
9e5afb7c32830b Rohit Mathew 2025-11-19  1133  
9e5afb7c32830b Rohit Mathew 2025-11-19  1134  			if (m->type == mpam_feat_msmon_mbwu_63counter)
9e5afb7c32830b Rohit Mathew 2025-11-19  1135  				now = FIELD_GET(MSMON___LWD_VALUE, now);
9e5afb7c32830b Rohit Mathew 2025-11-19  1136  			else
9e5afb7c32830b Rohit Mathew 2025-11-19  1137  				now = FIELD_GET(MSMON___L_VALUE, now);
9e5afb7c32830b Rohit Mathew 2025-11-19  1138  		} else {
823e7c3712c584 James Morse  2025-11-19  1139  			now = mpam_read_monsel_reg(msc, MBWU);
823e7c3712c584 James Morse  2025-11-19  1140  			if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
823e7c3712c584 James Morse  2025-11-19  1141  				nrdy = now & MSMON___NRDY;
41e8a14950e173 James Morse  2025-11-19  1142  			now = FIELD_GET(MSMON___VALUE, now);
9e5afb7c32830b Rohit Mathew 2025-11-19  1143  		}
41e8a14950e173 James Morse  2025-11-19  1144  
41e8a14950e173 James Morse  2025-11-19  1145  		if (nrdy)
41e8a14950e173 James Morse  2025-11-19  1146  			break;
41e8a14950e173 James Morse  2025-11-19  1147  
41e8a14950e173 James Morse  2025-11-19  1148  		mbwu_state = &ris->mbwu_state[ctx->mon];
41e8a14950e173 James Morse  2025-11-19  1149  
b35363793291e3 Ben Horgan   2025-11-19  1150  		if (overflow)
b35363793291e3 Ben Horgan   2025-11-19  1151  			mbwu_state->correction += mpam_msmon_overflow_val(m->type);
b35363793291e3 Ben Horgan   2025-11-19  1152  
b35363793291e3 Ben Horgan   2025-11-19  1153  		/*
b35363793291e3 Ben Horgan   2025-11-19  1154  		 * Include bandwidth consumed before the last hardware reset and
b35363793291e3 Ben Horgan   2025-11-19  1155  		 * a counter size increment for each overflow.
b35363793291e3 Ben Horgan   2025-11-19  1156  		 */
41e8a14950e173 James Morse  2025-11-19  1157  		now += mbwu_state->correction;
823e7c3712c584 James Morse  2025-11-19  1158  		break;
823e7c3712c584 James Morse  2025-11-19  1159  	default:
823e7c3712c584 James Morse  2025-11-19  1160  		m->err = -EINVAL;
823e7c3712c584 James Morse  2025-11-19  1161  	}
823e7c3712c584 James Morse  2025-11-19  1162  	mpam_mon_sel_unlock(msc);
823e7c3712c584 James Morse  2025-11-19  1163  
823e7c3712c584 James Morse  2025-11-19  1164  	if (nrdy) {
823e7c3712c584 James Morse  2025-11-19  1165  		m->err = -EBUSY;
823e7c3712c584 James Morse  2025-11-19  1166  		return;
823e7c3712c584 James Morse  2025-11-19  1167  	}
823e7c3712c584 James Morse  2025-11-19  1168  
823e7c3712c584 James Morse  2025-11-19  1169  	*m->val += now;
823e7c3712c584 James Morse  2025-11-19  1170  }
823e7c3712c584 James Morse  2025-11-19  1171  

:::::: The code at line 1112 was first introduced by commit
:::::: b35363793291e36c91d4a5b62d7ae7079c70d826 arm_mpam: Consider overflow in bandwidth counter state

:::::: TO: Ben Horgan <ben.horgan@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
