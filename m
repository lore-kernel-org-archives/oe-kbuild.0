Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D135F513
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732596830; cv=none; b=kaQYROaMk4re7snad7zV8iHYej0RjD9q5RqXjAmLTO98zE2t6uQ4q592gE9UtAI+vV30v50DywkLo0458WsbWB2JClBMCt31t9A4t0DfR/PeFUi0KY+Pg/LehiVKr4Ka1TWGbcWIjdDAngvHF27Qv3JKMUWcofRwJ+aNhcNh1kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732596830; c=relaxed/simple;
	bh=wRJFwv2bEyFQfw2yckjXvQf+3s2xErquXk27gjJDjw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFjN9nvCZuuxAFdU4YWI4QXmUeLcUpWWOVzXmzwRl5i0hBMsb8InXE4YPoSfAjOqd3+OLR20uWCn52KefWNH8UZscG8Wxksgxk9e/brdq8rrT5A9y/GVQoJZFF+JOVovCkaazHlWEEVObWx2uqh/yfl7ilanUBE2rUJLSXWNNAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8wLWLJs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8wLWLJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732596828; x=1764132828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wRJFwv2bEyFQfw2yckjXvQf+3s2xErquXk27gjJDjw0=;
  b=U8wLWLJsk/KxbxR79HI2Rpoz9ojQG2x4rWkZN+IYfod9mOvUH6rLPrs1
   psXLiANU1dXh80gge6idZM9uw7ioCPv9RQGu3DQaqZ4PM+tnkFHyM6btr
   1Bk5Or9GcuW3Sy26N00O/tjam4dpdTbLz3guNSbw4rRBciUk08gS/4F8n
   +OcS2McHlSNtOZyGH2GkbZ7HElxQhvyWPa7AafmRnLqZa6pr3480xXUIV
   iAUOp/zKJdtP9OZ9QXAIw3WH+htzT3TOTEV/AljlcdcTBnJ4WufyEg5Gn
   Elnv3YCsQmt0Y9esTjmzuuUuC0ZvwX1226rm9Lvm3rj6+uuzcKD5Igt3F
   g==;
X-CSE-ConnectionGUID: xUozyN3gQhqTb/JXqp38sw==
X-CSE-MsgGUID: zfHzeQ68Tt+3NnazPvZj2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43397309"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="43397309"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 20:53:47 -0800
X-CSE-ConnectionGUID: 3lIgoFJLQgSTatuP3qZz7g==
X-CSE-MsgGUID: S/dAN9vLTvqWRvD3OK9CIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="95909607"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2024 20:53:47 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFna4-000757-1x;
	Tue, 26 Nov 2024 04:53:44 +0000
Date: Tue, 26 Nov 2024 12:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/thunderbolt/debugfs.c:532:5-33: opportunity for
 str_yes_no(supports_software ( margining ))
Message-ID: <202411261228.hEXH4xCe-lkp@intel.com>
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
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: ec6f888ed08aeceaebfdd7d344ae0cd91a1b9a1b thunderbolt: Split out margining from USB4 port
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r053-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261228.hEXH4xCe-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411261228.hEXH4xCe-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/thunderbolt/debugfs.c:544:4-25: opportunity for str_yes_no(both_lanes ( margining ))
>> drivers/thunderbolt/debugfs.c:532:5-33: opportunity for str_yes_no(supports_software ( margining ))
   drivers/thunderbolt/debugfs.c:565:6-41: opportunity for str_yes_no(cap1 & USB4_MARGIN_CAP_1_TIME_DESTR)

vim +532 drivers/thunderbolt/debugfs.c

d0f1e0c2a69909 Mika Westerberg 2022-02-22  515  
d0f1e0c2a69909 Mika Westerberg 2022-02-22  516  static int margining_caps_show(struct seq_file *s, void *not_used)
d0f1e0c2a69909 Mika Westerberg 2022-02-22  517  {
ec6f888ed08aec Mika Westerberg 2023-03-14  518  	struct tb_margining *margining = s->private;
ec6f888ed08aec Mika Westerberg 2023-03-14  519  	struct tb *tb = margining->port->sw->tb;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  520  	u32 cap0, cap1;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  521  
d0f1e0c2a69909 Mika Westerberg 2022-02-22  522  	if (mutex_lock_interruptible(&tb->lock))
d0f1e0c2a69909 Mika Westerberg 2022-02-22  523  		return -ERESTARTSYS;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  524  
d0f1e0c2a69909 Mika Westerberg 2022-02-22  525  	/* Dump the raw caps first */
ec6f888ed08aec Mika Westerberg 2023-03-14  526  	cap0 = margining->caps[0];
d0f1e0c2a69909 Mika Westerberg 2022-02-22  527  	seq_printf(s, "0x%08x\n", cap0);
ec6f888ed08aec Mika Westerberg 2023-03-14  528  	cap1 = margining->caps[1];
d0f1e0c2a69909 Mika Westerberg 2022-02-22  529  	seq_printf(s, "0x%08x\n", cap1);
d0f1e0c2a69909 Mika Westerberg 2022-02-22  530  
d0f1e0c2a69909 Mika Westerberg 2022-02-22  531  	seq_printf(s, "# software margining: %s\n",
ec6f888ed08aec Mika Westerberg 2023-03-14 @532  		   supports_software(margining) ? "yes" : "no");
ec6f888ed08aec Mika Westerberg 2023-03-14  533  	if (supports_hardware(margining)) {
d0f1e0c2a69909 Mika Westerberg 2022-02-22  534  		seq_puts(s, "# hardware margining: yes\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  535  		seq_puts(s, "# minimum BER level contour: ");
ec6f888ed08aec Mika Westerberg 2023-03-14  536  		ber_level_show(s, margining->min_ber_level);
d0f1e0c2a69909 Mika Westerberg 2022-02-22  537  		seq_puts(s, "# maximum BER level contour: ");
ec6f888ed08aec Mika Westerberg 2023-03-14  538  		ber_level_show(s, margining->max_ber_level);
d0f1e0c2a69909 Mika Westerberg 2022-02-22  539  	} else {
d0f1e0c2a69909 Mika Westerberg 2022-02-22  540  		seq_puts(s, "# hardware margining: no\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  541  	}
d0f1e0c2a69909 Mika Westerberg 2022-02-22  542  
706d73836481cc Colin Ian King  2022-09-06  543  	seq_printf(s, "# both lanes simultaneously: %s\n",
ec6f888ed08aec Mika Westerberg 2023-03-14  544  		  both_lanes(margining) ? "yes" : "no");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  545  	seq_printf(s, "# voltage margin steps: %u\n",
ec6f888ed08aec Mika Westerberg 2023-03-14  546  		   margining->voltage_steps);
d0f1e0c2a69909 Mika Westerberg 2022-02-22  547  	seq_printf(s, "# maximum voltage offset: %u mV\n",
ec6f888ed08aec Mika Westerberg 2023-03-14  548  		   margining->max_voltage_offset);
d0f1e0c2a69909 Mika Westerberg 2022-02-22  549  
ec6f888ed08aec Mika Westerberg 2023-03-14  550  	switch (independent_voltage_margins(margining)) {
d0f1e0c2a69909 Mika Westerberg 2022-02-22  551  	case USB4_MARGIN_CAP_0_VOLTAGE_MIN:
d0f1e0c2a69909 Mika Westerberg 2022-02-22  552  		seq_puts(s, "# returns minimum between high and low voltage margins\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  553  		break;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  554  	case USB4_MARGIN_CAP_0_VOLTAGE_HL:
d0f1e0c2a69909 Mika Westerberg 2022-02-22  555  		seq_puts(s, "# returns high or low voltage margin\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  556  		break;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  557  	case USB4_MARGIN_CAP_0_VOLTAGE_BOTH:
706d73836481cc Colin Ian King  2022-09-06  558  		seq_puts(s, "# returns both high and low margins\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  559  		break;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  560  	}
d0f1e0c2a69909 Mika Westerberg 2022-02-22  561  
ec6f888ed08aec Mika Westerberg 2023-03-14  562  	if (supports_time(margining)) {
d0f1e0c2a69909 Mika Westerberg 2022-02-22  563  		seq_puts(s, "# time margining: yes\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  564  		seq_printf(s, "# time margining is destructive: %s\n",
d0f1e0c2a69909 Mika Westerberg 2022-02-22  565  			   cap1 & USB4_MARGIN_CAP_1_TIME_DESTR ? "yes" : "no");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  566  
ec6f888ed08aec Mika Westerberg 2023-03-14  567  		switch (independent_time_margins(margining)) {
d0f1e0c2a69909 Mika Westerberg 2022-02-22  568  		case USB4_MARGIN_CAP_1_TIME_MIN:
d0f1e0c2a69909 Mika Westerberg 2022-02-22  569  			seq_puts(s, "# returns minimum between left and right time margins\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  570  			break;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  571  		case USB4_MARGIN_CAP_1_TIME_LR:
d0f1e0c2a69909 Mika Westerberg 2022-02-22  572  			seq_puts(s, "# returns left or right margin\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  573  			break;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  574  		case USB4_MARGIN_CAP_1_TIME_BOTH:
d0f1e0c2a69909 Mika Westerberg 2022-02-22  575  			seq_puts(s, "# returns both left and right margins\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  576  			break;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  577  		}
d0f1e0c2a69909 Mika Westerberg 2022-02-22  578  
d0f1e0c2a69909 Mika Westerberg 2022-02-22  579  		seq_printf(s, "# time margin steps: %u\n",
ec6f888ed08aec Mika Westerberg 2023-03-14  580  			   margining->time_steps);
d0f1e0c2a69909 Mika Westerberg 2022-02-22  581  		seq_printf(s, "# maximum time offset: %u mUI\n",
ec6f888ed08aec Mika Westerberg 2023-03-14  582  			   margining->max_time_offset);
d0f1e0c2a69909 Mika Westerberg 2022-02-22  583  	} else {
d0f1e0c2a69909 Mika Westerberg 2022-02-22  584  		seq_puts(s, "# time margining: no\n");
d0f1e0c2a69909 Mika Westerberg 2022-02-22  585  	}
d0f1e0c2a69909 Mika Westerberg 2022-02-22  586  
d0f1e0c2a69909 Mika Westerberg 2022-02-22  587  	mutex_unlock(&tb->lock);
d0f1e0c2a69909 Mika Westerberg 2022-02-22  588  	return 0;
d0f1e0c2a69909 Mika Westerberg 2022-02-22  589  }
d0f1e0c2a69909 Mika Westerberg 2022-02-22  590  DEBUGFS_ATTR_RO(margining_caps);
d0f1e0c2a69909 Mika Westerberg 2022-02-22  591  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
