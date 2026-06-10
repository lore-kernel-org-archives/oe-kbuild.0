Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CEB1465B4
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jun 2026 07:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075328; cv=none; b=rouHicGUaiExan6NXhXUjPfATzZbFjVJ1D3apbRSnF7USsWOBnIQRsgYbwAIbfEEr38hEzTolBEXjhgRbfabu9oxZeF3XtV9c4cqrxVhwMb3j4ys29d0/+2LFnL+YOyzW2UtZCpfT33YhYmfMOA1PFhmqfXLNTf+nOOiPNSSwhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075328; c=relaxed/simple;
	bh=z9SfO4YZfEkxFjWHtOFy237C4YuhngdvmE3eshvhIOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYV56EXsDugmvkHkLPGrSbN6waOV9TjBanwU+91bnp3Msdo4qD9JGIauyxNW+9RG+g1ZD/oywHVmOYBJOP6RtYmlj/oVaLcsM4dZ8rj6nZz3WjSA1GOj+pzI1PGW/z7sinqRIsHWekbLFeu1ONo8IeauhIpcT9rBtayR5B1heYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7QB8wU/; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7QB8wU/"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccdf8d4ac5so68242416d6.1
        for <oe-kbuild@lists.linux.dev>; Wed, 10 Jun 2026 00:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781075326; x=1781680126; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6QXmN4Nis92iygGTCnfDBrK0hXHiuDKbCiKMUYEvshY=;
        b=o7QB8wU/JXmd0MwZJWyrpiXNAefQoZHdzeWX2YoU0Xg6e5BH2X87gIeFRiqik6yTCo
         IVMH3CR3g/icV8DxHwoibzpIfTgThIvmUTcZCTL3FATQd3QKFxGRNYvZPHLiNFVUdShW
         ZAhztg1ic81pfrFwcn5cHGLdEdo0fTOo4TnnaRCLbZmYqjd4CqpdmLPExRPeq+U04ceV
         xrxsj06x0lvpcMmUYvdM+GSeUJnfd0mNttPIEWkoRSZq+079qzs77B/0LYvb8ZyLiGky
         bieMba5ijB/S9s9koCan1tZynGByWcBnsY1VQq3VNYe2/pm9YjaizVR/BIoiEKR6WlsJ
         ofaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075326; x=1781680126;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QXmN4Nis92iygGTCnfDBrK0hXHiuDKbCiKMUYEvshY=;
        b=hUl8dI4o9i0VO8tIWPR+0iO5ykvwkA4NTyVr5Cqt3SQJrdVBeMD8tEWn4rBvstOnBC
         U3XxvVgGLPUu4RQ7JW4jD+TER5V2p8emV3MEoWdSohGgJ+Bn2aMZeYsVez8FrSKGYRUJ
         5nQx84bcTibE7m9EkeMoEJWP59E4xgPL3kNwXalNuP9YkYTroaadVNIYLTNP6Y2itHJm
         OqgRqimR9y4lpRFYw0KJnTVdfTjrteECRC9VAAvZp/X9e4ImDSsTb7LiBmPceK3kwYuM
         KXcUDzlj9hCgWUwHVi+/hhyuI8yHely/oLjnVBNIBYLrTafulNzUPAeevBwoCfHP8+Wg
         S3/w==
X-Gm-Message-State: AOJu0YwqNCllkgUt+mTMLVuGMKuNojoINF9wxDjXXazttKe15HiJKRPf
	RPo8/vGAzKU1PGCJE+NqLMGQuJg+3z7fcIkjUwHW9fPZ/42tA+Wo+jqA8dG7wFy2
X-Gm-Gg: Acq92OEv6ouqrrULJvheUA6NjtMbaaUx7tHqSzPqiNv2yWluxIwi6/KsZiTjbG0Mnwo
	pLM1wENoSgpdTXm1ESERKK7zGffKCnQkvz04xryfOEam9J+PHn21ZEPZlooLkqBMvaDNeh2XpRc
	LCv+Wao2iqiRcFgOAaGDxjYKeMH6zUzvmaHxi5KTnzWIUbHckbc5A6XQhaWb+avRGH9GqAPdmB5
	bf4xuWUBW7GlPVRUAqhBFcx+xOGT2VkXY6EhV30Ad3W+CeQlvxBi4bb2F0jhySk9+qKuhm2+dtD
	CKTnAuvl/diMg7MmbWHnMA/M6PwvDp7oNXdf+imC8rJ7rTkH4IhW8MEF0mhfpdikSGYzMyB7eJK
	ASbBzXloOvCQjlSCG6cj4+SbC2yw2/cSLAUS7E2mBR1f9zeU/+obGLcP0ULrL0zzUe7H2A8lDA9
	0mKwCSV9/LN/4ED6carxOnfFQ51eLEm2pARIDg+Q==
X-Received: by 2002:a05:6214:1d2d:b0:8cc:e102:b491 with SMTP id 6a1803df08f44-8cee5f991ccmr375281166d6.4.1781075326189;
        Wed, 10 Jun 2026 00:08:46 -0700 (PDT)
Received: from localhost ([149.40.50.222])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd263003sm229607936d6.42.2026.06.10.00.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:08:45 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:08:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Reinette Chatre <reinette.chatre@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [reinette:resctrl/controls_rfc_v1 48/82] fs/resctrl/rdtgroup.c:1160
 rdt_bit_usage_show() warn: inconsistent returns 'global &rdtgroup_mutex'.
Message-ID: <202606101004.PsNAKxDj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260610070839.wcLLrAWUKkR9G2n6j1sESfKkPjCNIeqCX3V-YDT-crE@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git resctrl/controls_rfc_v1
head:   37557cac804539e802e887a320e85c7a916a0bb9
commit: a54ec3de291898407c4cf41dea220e5fe0a2c2e9 [48/82] fs/resctrl: Obtain global properties from default cache control
config: i386-randconfig-141-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101004.PsNAKxDj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606101004.PsNAKxDj-lkp@intel.com/

smatch warnings:
fs/resctrl/rdtgroup.c:1160 rdt_bit_usage_show() warn: inconsistent returns 'global &rdtgroup_mutex'.

vim +1160 fs/resctrl/rdtgroup.c

7168ae330e8105 James Morse     2025-05-15  1058  static int rdt_bit_usage_show(struct kernfs_open_file *of,
7168ae330e8105 James Morse     2025-05-15  1059  			      struct seq_file *seq, void *v)
7168ae330e8105 James Morse     2025-05-15  1060  {
cb6283f40b6a21 Reinette Chatre 2026-04-09  1061  	struct rdt_resource_final *f = rdt_kn_parent_priv(of->kn);
7168ae330e8105 James Morse     2025-05-15  1062  	/*
7168ae330e8105 James Morse     2025-05-15  1063  	 * Use unsigned long even though only 32 bits are used to ensure
7168ae330e8105 James Morse     2025-05-15  1064  	 * test_bit() is used safely.
7168ae330e8105 James Morse     2025-05-15  1065  	 */
7168ae330e8105 James Morse     2025-05-15  1066  	unsigned long sw_shareable = 0, hw_shareable = 0;
7168ae330e8105 James Morse     2025-05-15  1067  	unsigned long exclusive = 0, pseudo_locked = 0;
cb6283f40b6a21 Reinette Chatre 2026-04-09  1068  	struct rdt_resource *r = f->res;
7168ae330e8105 James Morse     2025-05-15  1069  	struct rdt_ctrl_domain *dom;
7168ae330e8105 James Morse     2025-05-15  1070  	int i, hwb, swb, excl, psl;
a54ec3de291898 Reinette Chatre 2026-04-14  1071  	struct resctrl_ctrl *ctrl;
7168ae330e8105 James Morse     2025-05-15  1072  	enum rdtgrp_mode mode;
7168ae330e8105 James Morse     2025-05-15  1073  	bool sep = false;
7168ae330e8105 James Morse     2025-05-15  1074  	u32 ctrl_val;
7168ae330e8105 James Morse     2025-05-15  1075  
7168ae330e8105 James Morse     2025-05-15  1076  	cpus_read_lock();
                                                        ^^^^^^^^^^^^^^^^^
7168ae330e8105 James Morse     2025-05-15  1077  	mutex_lock(&rdtgroup_mutex);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^
a54ec3de291898 Reinette Chatre 2026-04-14  1078  
a54ec3de291898 Reinette Chatre 2026-04-14  1079  	ctrl = resctrl_get_cache_ctrl(r);
a54ec3de291898 Reinette Chatre 2026-04-14  1080  	if (!ctrl)
a54ec3de291898 Reinette Chatre 2026-04-14  1081  		return 0;

Needs a couple unlocks.

a54ec3de291898 Reinette Chatre 2026-04-14  1082  
a54ec3de291898 Reinette Chatre 2026-04-14  1083  	list_for_each_entry(dom, &ctrl->domains, hdr.list) {
7168ae330e8105 James Morse     2025-05-15  1084  		if (sep)
7168ae330e8105 James Morse     2025-05-15  1085  			seq_putc(seq, ';');
a54ec3de291898 Reinette Chatre 2026-04-14  1086  		hw_shareable = ctrl->cache.shareable_bits;
7168ae330e8105 James Morse     2025-05-15  1087  		sw_shareable = 0;
7168ae330e8105 James Morse     2025-05-15  1088  		exclusive = 0;
7168ae330e8105 James Morse     2025-05-15  1089  		seq_printf(seq, "%d=", dom->hdr.id);
7168ae330e8105 James Morse     2025-05-15  1090  		for (i = 0; i < closids_supported(); i++) {
ac7de456a37f9b Babu Moger      2025-11-12  1091  			if (!closid_allocated(i) ||
ac7de456a37f9b Babu Moger      2025-11-12  1092  			    (resctrl_arch_get_io_alloc_enabled(r) &&
ac7de456a37f9b Babu Moger      2025-11-12  1093  			     i == resctrl_io_alloc_closid(r)))
7168ae330e8105 James Morse     2025-05-15  1094  				continue;
7168ae330e8105 James Morse     2025-05-15  1095  			ctrl_val = resctrl_arch_get_config(r, dom, i,
cb6283f40b6a21 Reinette Chatre 2026-04-09  1096  							   f->conf_type);
7168ae330e8105 James Morse     2025-05-15  1097  			mode = rdtgroup_mode_by_closid(i);
7168ae330e8105 James Morse     2025-05-15  1098  			switch (mode) {
7168ae330e8105 James Morse     2025-05-15  1099  			case RDT_MODE_SHAREABLE:
7168ae330e8105 James Morse     2025-05-15  1100  				sw_shareable |= ctrl_val;
7168ae330e8105 James Morse     2025-05-15  1101  				break;
7168ae330e8105 James Morse     2025-05-15  1102  			case RDT_MODE_EXCLUSIVE:
7168ae330e8105 James Morse     2025-05-15  1103  				exclusive |= ctrl_val;
7168ae330e8105 James Morse     2025-05-15  1104  				break;
7168ae330e8105 James Morse     2025-05-15  1105  			case RDT_MODE_PSEUDO_LOCKSETUP:
7168ae330e8105 James Morse     2025-05-15  1106  			/*
7168ae330e8105 James Morse     2025-05-15  1107  			 * RDT_MODE_PSEUDO_LOCKSETUP is possible
7168ae330e8105 James Morse     2025-05-15  1108  			 * here but not included since the CBM
7168ae330e8105 James Morse     2025-05-15  1109  			 * associated with this CLOSID in this mode
7168ae330e8105 James Morse     2025-05-15  1110  			 * is not initialized and no task or cpu can be
7168ae330e8105 James Morse     2025-05-15  1111  			 * assigned this CLOSID.
7168ae330e8105 James Morse     2025-05-15  1112  			 */
7168ae330e8105 James Morse     2025-05-15  1113  				break;
7168ae330e8105 James Morse     2025-05-15  1114  			case RDT_MODE_PSEUDO_LOCKED:
7168ae330e8105 James Morse     2025-05-15  1115  			case RDT_NUM_MODES:
7168ae330e8105 James Morse     2025-05-15  1116  				WARN(1,
7168ae330e8105 James Morse     2025-05-15  1117  				     "invalid mode for closid %d\n", i);
7168ae330e8105 James Morse     2025-05-15  1118  				break;
7168ae330e8105 James Morse     2025-05-15  1119  			}
7168ae330e8105 James Morse     2025-05-15  1120  		}
ac7de456a37f9b Babu Moger      2025-11-12  1121  
ac7de456a37f9b Babu Moger      2025-11-12  1122  		/*
ac7de456a37f9b Babu Moger      2025-11-12  1123  		 * When the "io_alloc" feature is enabled, a portion of the cache
ac7de456a37f9b Babu Moger      2025-11-12  1124  		 * is configured for shared use between hardware and software.
ac7de456a37f9b Babu Moger      2025-11-12  1125  		 * Also, when CDP is enabled the CBMs of CDP_CODE and CDP_DATA
ac7de456a37f9b Babu Moger      2025-11-12  1126  		 * resources are kept in sync. So, the CBMs for "io_alloc" can
ac7de456a37f9b Babu Moger      2025-11-12  1127  		 * be accessed through either resource.
ac7de456a37f9b Babu Moger      2025-11-12  1128  		 */
ac7de456a37f9b Babu Moger      2025-11-12  1129  		if (resctrl_arch_get_io_alloc_enabled(r)) {
ac7de456a37f9b Babu Moger      2025-11-12  1130  			ctrl_val = resctrl_arch_get_config(r, dom,
ac7de456a37f9b Babu Moger      2025-11-12  1131  							   resctrl_io_alloc_closid(r),
cb6283f40b6a21 Reinette Chatre 2026-04-09  1132  							   f->conf_type);
ac7de456a37f9b Babu Moger      2025-11-12  1133  			hw_shareable |= ctrl_val;
ac7de456a37f9b Babu Moger      2025-11-12  1134  		}
ac7de456a37f9b Babu Moger      2025-11-12  1135  
a54ec3de291898 Reinette Chatre 2026-04-14  1136  		for (i = ctrl->cache.cbm_len - 1; i >= 0; i--) {
7168ae330e8105 James Morse     2025-05-15  1137  			pseudo_locked = dom->plr ? dom->plr->cbm : 0;
7168ae330e8105 James Morse     2025-05-15  1138  			hwb = test_bit(i, &hw_shareable);
7168ae330e8105 James Morse     2025-05-15  1139  			swb = test_bit(i, &sw_shareable);
7168ae330e8105 James Morse     2025-05-15  1140  			excl = test_bit(i, &exclusive);
7168ae330e8105 James Morse     2025-05-15  1141  			psl = test_bit(i, &pseudo_locked);
7168ae330e8105 James Morse     2025-05-15  1142  			if (hwb && swb)
7168ae330e8105 James Morse     2025-05-15  1143  				seq_putc(seq, 'X');
7168ae330e8105 James Morse     2025-05-15  1144  			else if (hwb && !swb)
7168ae330e8105 James Morse     2025-05-15  1145  				seq_putc(seq, 'H');
7168ae330e8105 James Morse     2025-05-15  1146  			else if (!hwb && swb)
7168ae330e8105 James Morse     2025-05-15  1147  				seq_putc(seq, 'S');
7168ae330e8105 James Morse     2025-05-15  1148  			else if (excl)
7168ae330e8105 James Morse     2025-05-15  1149  				seq_putc(seq, 'E');
7168ae330e8105 James Morse     2025-05-15  1150  			else if (psl)
7168ae330e8105 James Morse     2025-05-15  1151  				seq_putc(seq, 'P');
7168ae330e8105 James Morse     2025-05-15  1152  			else /* Unused bits remain */
7168ae330e8105 James Morse     2025-05-15  1153  				seq_putc(seq, '0');
7168ae330e8105 James Morse     2025-05-15  1154  		}
7168ae330e8105 James Morse     2025-05-15  1155  		sep = true;
7168ae330e8105 James Morse     2025-05-15  1156  	}
7168ae330e8105 James Morse     2025-05-15  1157  	seq_putc(seq, '\n');
7168ae330e8105 James Morse     2025-05-15  1158  	mutex_unlock(&rdtgroup_mutex);
7168ae330e8105 James Morse     2025-05-15  1159  	cpus_read_unlock();
7168ae330e8105 James Morse     2025-05-15 @1160  	return 0;
7168ae330e8105 James Morse     2025-05-15  1161  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

