Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66381D358B
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424054; cv=none; b=skBbig7vVCNCrNWFcT9m1sHr0R8ljztsp/Da2GvB/aoskqCKssvh8ArenLI5uT3fWp5A74bYr9NE+yntguzeht2jzfo2ycs+voVyZRnx2n2GdNaRkmnOlWrwHyAmC23wV0r6E9RjE30u5JM8L2rBBHgMT8siWNnTKDKvJvsHsGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424054; c=relaxed/simple;
	bh=dbY8Ygqxkpm37Akf4GKztZRr6ojlea5QbqTYz2joweM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ma7bNgau0nHLGMN6ozsUQtL3NvM7u9uUeWNcAOonA8DmKgfO5Xr6WE1DEwvVEPEmcQad4jL6+pyjw4nbyOx9818RfmtH5+tjyCyTrSjRTUYKhJh8+0XTqYMNJ1m+XzisZ861h6SKOsi7aUGqDcRY3RjeM3ig08uhf78ugTRI8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxEWi0yy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxEWi0yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734424053; x=1765960053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dbY8Ygqxkpm37Akf4GKztZRr6ojlea5QbqTYz2joweM=;
  b=fxEWi0yyDMlJbO72x/SLTNSd+S4Jmei1p811smtjRDo4UZRGtNwmk4cM
   lVAYOnLgE9eBCe9WxDF1XYdNynKrvRay5Y/T2SNjGMuHcaGzP0v1NkxZh
   aCSOZJ/CIxZYhhXEWpX/0ltHipG5cmm5ZJ4ZKbidmnCgkUxkBG/qhRQIQ
   +YwQIx6OnoTa+sdKqiZWyB853nI6jrOxKMayf1q2s39SpNgIyRfB0K/Lb
   NClNQzIqrzRum3e3ATC4Rj4zv/9qqBqnV8Em3HsOp8i3ce6LBqFxxFZgH
   DOO2Xx8sas3Mw9VUA8ywI1ZHy64CLUcfMfHK6B1q2BYS9xT2AqcHzb111
   w==;
X-CSE-ConnectionGUID: lz2NG9j/TKWZ3tgvmFbmIw==
X-CSE-MsgGUID: azPiJKDZT2yKL7rpmEh2Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45322376"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45322376"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:27:33 -0800
X-CSE-ConnectionGUID: 2mRf4OWJSWqBF5Fi1TAtAw==
X-CSE-MsgGUID: KckeUTkURDeR1bBvU5Hmgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98259364"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Dec 2024 00:27:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNSvQ-000Eq4-33;
	Tue, 17 Dec 2024 08:27:28 +0000
Date: Tue, 17 Dec 2024 16:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/thunderbolt/debugfs.c:532:5-33: opportunity for
 str_yes_no(supports_software ( margining ))
Message-ID: <202412171648.LGwq0U3d-lkp@intel.com>
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
TO: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f44d154d6e3d633d4c49a5d6aed8a0e4684ae25e
commit: ec6f888ed08aeceaebfdd7d344ae0cd91a1b9a1b thunderbolt: Split out margining from USB4 port
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r061-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171648.LGwq0U3d-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412171648.LGwq0U3d-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/thunderbolt/debugfs.c:544:4-25: opportunity for str_yes_no(both_lanes ( margining ))
>> drivers/thunderbolt/debugfs.c:532:5-33: opportunity for str_yes_no(supports_software ( margining ))
   drivers/thunderbolt/debugfs.c:565:6-41: opportunity for str_yes_no(cap1 & USB4_MARGIN_CAP_1_TIME_DESTR)

vim +532 drivers/thunderbolt/debugfs.c

d0f1e0c2a699092 Mika Westerberg 2022-02-22  515  
d0f1e0c2a699092 Mika Westerberg 2022-02-22  516  static int margining_caps_show(struct seq_file *s, void *not_used)
d0f1e0c2a699092 Mika Westerberg 2022-02-22  517  {
ec6f888ed08aece Mika Westerberg 2023-03-14  518  	struct tb_margining *margining = s->private;
ec6f888ed08aece Mika Westerberg 2023-03-14  519  	struct tb *tb = margining->port->sw->tb;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  520  	u32 cap0, cap1;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  521  
d0f1e0c2a699092 Mika Westerberg 2022-02-22  522  	if (mutex_lock_interruptible(&tb->lock))
d0f1e0c2a699092 Mika Westerberg 2022-02-22  523  		return -ERESTARTSYS;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  524  
d0f1e0c2a699092 Mika Westerberg 2022-02-22  525  	/* Dump the raw caps first */
ec6f888ed08aece Mika Westerberg 2023-03-14  526  	cap0 = margining->caps[0];
d0f1e0c2a699092 Mika Westerberg 2022-02-22  527  	seq_printf(s, "0x%08x\n", cap0);
ec6f888ed08aece Mika Westerberg 2023-03-14  528  	cap1 = margining->caps[1];
d0f1e0c2a699092 Mika Westerberg 2022-02-22  529  	seq_printf(s, "0x%08x\n", cap1);
d0f1e0c2a699092 Mika Westerberg 2022-02-22  530  
d0f1e0c2a699092 Mika Westerberg 2022-02-22  531  	seq_printf(s, "# software margining: %s\n",
ec6f888ed08aece Mika Westerberg 2023-03-14 @532  		   supports_software(margining) ? "yes" : "no");
ec6f888ed08aece Mika Westerberg 2023-03-14  533  	if (supports_hardware(margining)) {
d0f1e0c2a699092 Mika Westerberg 2022-02-22  534  		seq_puts(s, "# hardware margining: yes\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  535  		seq_puts(s, "# minimum BER level contour: ");
ec6f888ed08aece Mika Westerberg 2023-03-14  536  		ber_level_show(s, margining->min_ber_level);
d0f1e0c2a699092 Mika Westerberg 2022-02-22  537  		seq_puts(s, "# maximum BER level contour: ");
ec6f888ed08aece Mika Westerberg 2023-03-14  538  		ber_level_show(s, margining->max_ber_level);
d0f1e0c2a699092 Mika Westerberg 2022-02-22  539  	} else {
d0f1e0c2a699092 Mika Westerberg 2022-02-22  540  		seq_puts(s, "# hardware margining: no\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  541  	}
d0f1e0c2a699092 Mika Westerberg 2022-02-22  542  
706d73836481cce Colin Ian King  2022-09-06  543  	seq_printf(s, "# both lanes simultaneously: %s\n",
ec6f888ed08aece Mika Westerberg 2023-03-14  544  		  both_lanes(margining) ? "yes" : "no");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  545  	seq_printf(s, "# voltage margin steps: %u\n",
ec6f888ed08aece Mika Westerberg 2023-03-14  546  		   margining->voltage_steps);
d0f1e0c2a699092 Mika Westerberg 2022-02-22  547  	seq_printf(s, "# maximum voltage offset: %u mV\n",
ec6f888ed08aece Mika Westerberg 2023-03-14  548  		   margining->max_voltage_offset);
d0f1e0c2a699092 Mika Westerberg 2022-02-22  549  
ec6f888ed08aece Mika Westerberg 2023-03-14  550  	switch (independent_voltage_margins(margining)) {
d0f1e0c2a699092 Mika Westerberg 2022-02-22  551  	case USB4_MARGIN_CAP_0_VOLTAGE_MIN:
d0f1e0c2a699092 Mika Westerberg 2022-02-22  552  		seq_puts(s, "# returns minimum between high and low voltage margins\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  553  		break;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  554  	case USB4_MARGIN_CAP_0_VOLTAGE_HL:
d0f1e0c2a699092 Mika Westerberg 2022-02-22  555  		seq_puts(s, "# returns high or low voltage margin\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  556  		break;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  557  	case USB4_MARGIN_CAP_0_VOLTAGE_BOTH:
706d73836481cce Colin Ian King  2022-09-06  558  		seq_puts(s, "# returns both high and low margins\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  559  		break;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  560  	}
d0f1e0c2a699092 Mika Westerberg 2022-02-22  561  
ec6f888ed08aece Mika Westerberg 2023-03-14  562  	if (supports_time(margining)) {
d0f1e0c2a699092 Mika Westerberg 2022-02-22  563  		seq_puts(s, "# time margining: yes\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  564  		seq_printf(s, "# time margining is destructive: %s\n",
d0f1e0c2a699092 Mika Westerberg 2022-02-22  565  			   cap1 & USB4_MARGIN_CAP_1_TIME_DESTR ? "yes" : "no");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  566  
ec6f888ed08aece Mika Westerberg 2023-03-14  567  		switch (independent_time_margins(margining)) {
d0f1e0c2a699092 Mika Westerberg 2022-02-22  568  		case USB4_MARGIN_CAP_1_TIME_MIN:
d0f1e0c2a699092 Mika Westerberg 2022-02-22  569  			seq_puts(s, "# returns minimum between left and right time margins\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  570  			break;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  571  		case USB4_MARGIN_CAP_1_TIME_LR:
d0f1e0c2a699092 Mika Westerberg 2022-02-22  572  			seq_puts(s, "# returns left or right margin\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  573  			break;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  574  		case USB4_MARGIN_CAP_1_TIME_BOTH:
d0f1e0c2a699092 Mika Westerberg 2022-02-22  575  			seq_puts(s, "# returns both left and right margins\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  576  			break;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  577  		}
d0f1e0c2a699092 Mika Westerberg 2022-02-22  578  
d0f1e0c2a699092 Mika Westerberg 2022-02-22  579  		seq_printf(s, "# time margin steps: %u\n",
ec6f888ed08aece Mika Westerberg 2023-03-14  580  			   margining->time_steps);
d0f1e0c2a699092 Mika Westerberg 2022-02-22  581  		seq_printf(s, "# maximum time offset: %u mUI\n",
ec6f888ed08aece Mika Westerberg 2023-03-14  582  			   margining->max_time_offset);
d0f1e0c2a699092 Mika Westerberg 2022-02-22  583  	} else {
d0f1e0c2a699092 Mika Westerberg 2022-02-22  584  		seq_puts(s, "# time margining: no\n");
d0f1e0c2a699092 Mika Westerberg 2022-02-22  585  	}
d0f1e0c2a699092 Mika Westerberg 2022-02-22  586  
d0f1e0c2a699092 Mika Westerberg 2022-02-22  587  	mutex_unlock(&tb->lock);
d0f1e0c2a699092 Mika Westerberg 2022-02-22  588  	return 0;
d0f1e0c2a699092 Mika Westerberg 2022-02-22  589  }
d0f1e0c2a699092 Mika Westerberg 2022-02-22  590  DEBUGFS_ATTR_RO(margining_caps);
d0f1e0c2a699092 Mika Westerberg 2022-02-22  591  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
