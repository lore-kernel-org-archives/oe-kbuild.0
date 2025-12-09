Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EDFDF76
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 07:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765264582; cv=none; b=sWcxJR79hUl6yFwIItZFuhT6ejpy6iiROwbCcXxlT4qZneyjsLg0TVhzv5yrf0xVGD7P3vDGOtbkTM4vJG1dv7/ahxXA41bkhhIhU2D4tlgfIHcqGhGF+EsBbpEzq0VHD5UcxKWP1u/GWs2HDzZLjO/5t041UIkant/OyIWWZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765264582; c=relaxed/simple;
	bh=U9x/RlU6qmjJqHVb+Wet1kPXRuA2ZHLTUWW7vmE2GTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7U1p6E0Z6Bps+QShwPM9eXVxlcvHekbd1st09Xtrn0KJ3MsQQPufadtf5S4EzBgXhM8aIjtfNfSC7NkBtMjOJdMNzAAhkGsaLbK+dCjApfQ3iOZkXhgD5psdSPyjnUJhEFiin5viYErH3Sx6gqepQQdeHBwlQFHCaXKZpxKDvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b10Ahteh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b10Ahteh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765264580; x=1796800580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9x/RlU6qmjJqHVb+Wet1kPXRuA2ZHLTUWW7vmE2GTI=;
  b=b10AhtehrD7P3cFkSTJV0KkEmPQD/ythiDtcfXlsy3MhOuc3KgXZtXh9
   qqfWRpDvkZA5n3wHMu8fTHIzUCFHLv1VVwbHLvmVVmzZRZAbwWGFMtWT/
   rBJbkLSJXspteNw6LmaWTmiZ+vDv19f7/kCrS6JhxqGzpgDYSEw3Ku2QM
   IDyoT3+XLW5ue/iXaQJhjDxrpE4j0/+9y1quZPkbNbiiYGckW6XkexGsG
   d1aY4K9+UTvyckgHKMrihZQKEQzP+agU7OmiwaQwsTgU/HLm5+dJZGDNs
   j616fmHu1oKagfY0buvOekJ6Bc6p4T53Vr2FWF5qNJ7BoD9HiKXIjud32
   w==;
X-CSE-ConnectionGUID: Ru57dy+rRue9mUsWLthGtw==
X-CSE-MsgGUID: uc+jGCF3QWidh3rZdxeo4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="92691821"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="92691821"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:16:18 -0800
X-CSE-ConnectionGUID: yFfy3qaiTVO3fqjmh7yX7Q==
X-CSE-MsgGUID: 2oh6b8l5S4SeqXvuoBMNTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="201075731"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Dec 2025 23:16:17 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSrxH-000000001Rp-1FVs;
	Tue, 09 Dec 2025 07:16:15 +0000
Date: Tue, 9 Dec 2025 15:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/resctrl/mpam_devices.c:1042 __ris_msmon_read() error:
 uninitialized symbol 'now'.
Message-ID: <202512091519.RBwiJcSq-lkp@intel.com>
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
TO: James Morse <james.morse@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: Gavin Shan <gshan@redhat.com>
CC: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
CC: Fenghua Yu <fenghuay@nvidia.com>
CC: Ben Horgan <ben.horgan@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cfd4039213e7b5a828c5b78e1b5235cac91af53d
commit: 823e7c3712c584641b4ef890a8af34884c677197 arm_mpam: Add mpam_msmon_read() to read monitor value
date:   3 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r072-20251208 (https://download.01.org/0day-ci/archive/20251209/202512091519.RBwiJcSq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512091519.RBwiJcSq-lkp@intel.com/

smatch warnings:
drivers/resctrl/mpam_devices.c:1042 __ris_msmon_read() error: uninitialized symbol 'now'.

vim +/now +1042 drivers/resctrl/mpam_devices.c

823e7c3712c5846 James Morse 2025-11-19   987  
823e7c3712c5846 James Morse 2025-11-19   988  static void __ris_msmon_read(void *arg)
823e7c3712c5846 James Morse 2025-11-19   989  {
823e7c3712c5846 James Morse 2025-11-19   990  	u64 now;
823e7c3712c5846 James Morse 2025-11-19   991  	bool nrdy = false;
823e7c3712c5846 James Morse 2025-11-19   992  	bool config_mismatch;
823e7c3712c5846 James Morse 2025-11-19   993  	struct mon_read *m = arg;
823e7c3712c5846 James Morse 2025-11-19   994  	struct mon_cfg *ctx = m->ctx;
823e7c3712c5846 James Morse 2025-11-19   995  	struct mpam_msc_ris *ris = m->ris;
823e7c3712c5846 James Morse 2025-11-19   996  	struct mpam_props *rprops = &ris->props;
823e7c3712c5846 James Morse 2025-11-19   997  	struct mpam_msc *msc = m->ris->vmsc->msc;
823e7c3712c5846 James Morse 2025-11-19   998  	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
823e7c3712c5846 James Morse 2025-11-19   999  
823e7c3712c5846 James Morse 2025-11-19  1000  	if (!mpam_mon_sel_lock(msc)) {
823e7c3712c5846 James Morse 2025-11-19  1001  		m->err = -EIO;
823e7c3712c5846 James Morse 2025-11-19  1002  		return;
823e7c3712c5846 James Morse 2025-11-19  1003  	}
823e7c3712c5846 James Morse 2025-11-19  1004  	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
823e7c3712c5846 James Morse 2025-11-19  1005  		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
823e7c3712c5846 James Morse 2025-11-19  1006  	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
823e7c3712c5846 James Morse 2025-11-19  1007  
823e7c3712c5846 James Morse 2025-11-19  1008  	/*
823e7c3712c5846 James Morse 2025-11-19  1009  	 * Read the existing configuration to avoid re-writing the same values.
823e7c3712c5846 James Morse 2025-11-19  1010  	 * This saves waiting for 'nrdy' on subsequent reads.
823e7c3712c5846 James Morse 2025-11-19  1011  	 */
823e7c3712c5846 James Morse 2025-11-19  1012  	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
823e7c3712c5846 James Morse 2025-11-19  1013  	clean_msmon_ctl_val(&cur_ctl);
823e7c3712c5846 James Morse 2025-11-19  1014  	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
823e7c3712c5846 James Morse 2025-11-19  1015  	config_mismatch = cur_flt != flt_val ||
823e7c3712c5846 James Morse 2025-11-19  1016  			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
823e7c3712c5846 James Morse 2025-11-19  1017  
823e7c3712c5846 James Morse 2025-11-19  1018  	if (config_mismatch)
823e7c3712c5846 James Morse 2025-11-19  1019  		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
823e7c3712c5846 James Morse 2025-11-19  1020  
823e7c3712c5846 James Morse 2025-11-19  1021  	switch (m->type) {
823e7c3712c5846 James Morse 2025-11-19  1022  	case mpam_feat_msmon_csu:
823e7c3712c5846 James Morse 2025-11-19  1023  		now = mpam_read_monsel_reg(msc, CSU);
823e7c3712c5846 James Morse 2025-11-19  1024  		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, rprops))
823e7c3712c5846 James Morse 2025-11-19  1025  			nrdy = now & MSMON___NRDY;
823e7c3712c5846 James Morse 2025-11-19  1026  		break;
823e7c3712c5846 James Morse 2025-11-19  1027  	case mpam_feat_msmon_mbwu:
823e7c3712c5846 James Morse 2025-11-19  1028  		now = mpam_read_monsel_reg(msc, MBWU);
823e7c3712c5846 James Morse 2025-11-19  1029  		if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
823e7c3712c5846 James Morse 2025-11-19  1030  			nrdy = now & MSMON___NRDY;
823e7c3712c5846 James Morse 2025-11-19  1031  		break;
823e7c3712c5846 James Morse 2025-11-19  1032  	default:
823e7c3712c5846 James Morse 2025-11-19  1033  		m->err = -EINVAL;
823e7c3712c5846 James Morse 2025-11-19  1034  	}
823e7c3712c5846 James Morse 2025-11-19  1035  	mpam_mon_sel_unlock(msc);
823e7c3712c5846 James Morse 2025-11-19  1036  
823e7c3712c5846 James Morse 2025-11-19  1037  	if (nrdy) {
823e7c3712c5846 James Morse 2025-11-19  1038  		m->err = -EBUSY;
823e7c3712c5846 James Morse 2025-11-19  1039  		return;
823e7c3712c5846 James Morse 2025-11-19  1040  	}
823e7c3712c5846 James Morse 2025-11-19  1041  
823e7c3712c5846 James Morse 2025-11-19 @1042  	now = FIELD_GET(MSMON___VALUE, now);
823e7c3712c5846 James Morse 2025-11-19  1043  	*m->val += now;
823e7c3712c5846 James Morse 2025-11-19  1044  }
823e7c3712c5846 James Morse 2025-11-19  1045  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
