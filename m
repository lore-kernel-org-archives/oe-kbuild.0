Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677917F2
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Sep 2023 05:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695966445; x=1727502445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jm4hqK7t1DOlY278uUHuasjk8KEaYfFjdAloRV0b4EY=;
  b=eKVqCUYMZDKCQgqIFey8EYAgxZcXi+RN5P3bAtBVX9ZXyROdtW0CJbA3
   7qaVkn6z60KQPgJBJym/kkds5WgpBWiKTHzx5hzrOjzZt14Z9imP/5tRj
   QQ7tRvs6/SEgBHQGkR3Y2FxO55vb09mMe4YUc2uD2NhVf6uEkDdrrC5b6
   5drIzwafpGqGeoZO/cnffZp/R/iv90q6YZaVi/JZgMbef0Z3QFr9RWN2f
   HrMgsnFSdB/awL9K9hNJxhZ1RrtI1q5r8wb0iMks9zo7p2zhLKEGy0Yrj
   K8MnKXqAsSXNXGzfpgWcSUmdE4YU3VdkdE0xqBJIwbWX62C08Mx2tSa4i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3811043"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="3811043"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 22:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873560139"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="873560139"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Sep 2023 22:47:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm6LO-0002WY-0L;
	Fri, 29 Sep 2023 05:47:18 +0000
Date: Fri, 29 Sep 2023 13:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/hda/cs35l41_hda.c:304 cs35l41_request_firmware_files()
 error: double free of '*wmfw_filename'
Message-ID: <202309291331.0JUUQnPT-lkp@intel.com>
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
TO: Stefan Binding <sbinding@opensource.cirrus.com>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9ed22ae6be817d7a3f5c15ca22cbc9d3963b481d
commit: cd40dad2ca9196631dcd48e1b991244ab3940d83 ALSA: hda: cs35l41: Ensure firmware/tuning pairs are always loaded
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291331.0JUUQnPT-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291331.0JUUQnPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309291331.0JUUQnPT-lkp@intel.com/

smatch warnings:
sound/pci/hda/cs35l41_hda.c:304 cs35l41_request_firmware_files() error: double free of '*wmfw_filename'

vim +304 sound/pci/hda/cs35l41_hda.c

63f4b99f0089a9 Stefan Binding  2022-06-30  237  
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  238  static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  239  					  const struct firmware **wmfw_firmware,
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  240  					  char **wmfw_filename,
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  241  					  const struct firmware **coeff_firmware,
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  242  					  char **coeff_filename)
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  243  {
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  244  	int ret;
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  245  
cd40dad2ca9196 Stefan Binding  2023-02-13  246  	if (cs35l41->speaker_id > -1) {
cd40dad2ca9196 Stefan Binding  2023-02-13  247  		ret = cs35l41_request_firmware_files_spkid(cs35l41, wmfw_firmware, wmfw_filename,
63f4b99f0089a9 Stefan Binding  2022-06-30  248  							   coeff_firmware, coeff_filename);
cd40dad2ca9196 Stefan Binding  2023-02-13  249  		goto out;
cd40dad2ca9196 Stefan Binding  2023-02-13  250  
cd40dad2ca9196 Stefan Binding  2023-02-13  251  	}
63f4b99f0089a9 Stefan Binding  2022-06-30  252  
bb6eb621f522d1 Stefan Binding  2022-06-30  253  	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  254  	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
bb6eb621f522d1 Stefan Binding  2022-06-30  255  					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
63f4b99f0089a9 Stefan Binding  2022-06-30  256  					    cs35l41->amp_name, -1, "wmfw");
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  257  	if (!ret) {
bb6eb621f522d1 Stefan Binding  2022-06-30  258  		/* try cirrus/part-dspN-fwtype-sub<-ampname>.bin */
cd40dad2ca9196 Stefan Binding  2023-02-13  259  		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
cd40dad2ca9196 Stefan Binding  2023-02-13  260  						    CS35L41_FIRMWARE_ROOT,
cd40dad2ca9196 Stefan Binding  2023-02-13  261  						    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
cd40dad2ca9196 Stefan Binding  2023-02-13  262  						    -1, "bin");
cd40dad2ca9196 Stefan Binding  2023-02-13  263  		goto out;
bb6eb621f522d1 Stefan Binding  2022-06-30  264  	}
bb6eb621f522d1 Stefan Binding  2022-06-30  265  
bb6eb621f522d1 Stefan Binding  2022-06-30  266  	/* try cirrus/part-dspN-fwtype-sub.wmfw */
bb6eb621f522d1 Stefan Binding  2022-06-30  267  	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
bb6eb621f522d1 Stefan Binding  2022-06-30  268  					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
63f4b99f0089a9 Stefan Binding  2022-06-30  269  					    NULL, -1, "wmfw");
bb6eb621f522d1 Stefan Binding  2022-06-30  270  	if (!ret) {
bb6eb621f522d1 Stefan Binding  2022-06-30  271  		/* try cirrus/part-dspN-fwtype-sub<-ampname>.bin */
bb6eb621f522d1 Stefan Binding  2022-06-30  272  		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
bb6eb621f522d1 Stefan Binding  2022-06-30  273  						    CS35L41_FIRMWARE_ROOT,
bb6eb621f522d1 Stefan Binding  2022-06-30  274  						    cs35l41->acpi_subsystem_id,
63f4b99f0089a9 Stefan Binding  2022-06-30  275  						    cs35l41->amp_name, -1, "bin");
bb6eb621f522d1 Stefan Binding  2022-06-30  276  		if (ret)
bb6eb621f522d1 Stefan Binding  2022-06-30  277  			/* try cirrus/part-dspN-fwtype-sub.bin */
cd40dad2ca9196 Stefan Binding  2023-02-13  278  			ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
bb6eb621f522d1 Stefan Binding  2022-06-30  279  							    CS35L41_FIRMWARE_ROOT,
cd40dad2ca9196 Stefan Binding  2023-02-13  280  							    cs35l41->acpi_subsystem_id, NULL, -1,
cd40dad2ca9196 Stefan Binding  2023-02-13  281  							    "bin");
bb6eb621f522d1 Stefan Binding  2022-06-30  282  	}
bb6eb621f522d1 Stefan Binding  2022-06-30  283  
cd40dad2ca9196 Stefan Binding  2023-02-13  284  out:
cd40dad2ca9196 Stefan Binding  2023-02-13  285  	if (!ret)
cd40dad2ca9196 Stefan Binding  2023-02-13  286  		return 0;
cd40dad2ca9196 Stefan Binding  2023-02-13  287  
cd40dad2ca9196 Stefan Binding  2023-02-13  288  	/* Handle fallback */
cd40dad2ca9196 Stefan Binding  2023-02-13  289  	dev_warn(cs35l41->dev, "Falling back to default firmware.\n");
cd40dad2ca9196 Stefan Binding  2023-02-13  290  
cd40dad2ca9196 Stefan Binding  2023-02-13  291  	release_firmware(*wmfw_firmware);
cd40dad2ca9196 Stefan Binding  2023-02-13  292  	kfree(*wmfw_filename);
cd40dad2ca9196 Stefan Binding  2023-02-13  293  
bb6eb621f522d1 Stefan Binding  2022-06-30  294  	/* fallback try cirrus/part-dspN-fwtype.wmfw */
bb6eb621f522d1 Stefan Binding  2022-06-30  295  	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
63f4b99f0089a9 Stefan Binding  2022-06-30  296  					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");
cd40dad2ca9196 Stefan Binding  2023-02-13  297  	if (!ret)
bb6eb621f522d1 Stefan Binding  2022-06-30  298  		/* fallback try cirrus/part-dspN-fwtype.bin */
cd40dad2ca9196 Stefan Binding  2023-02-13  299  		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
63f4b99f0089a9 Stefan Binding  2022-06-30  300  						    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  301  
cd40dad2ca9196 Stefan Binding  2023-02-13  302  	if (ret) {
cd40dad2ca9196 Stefan Binding  2023-02-13  303  		release_firmware(*wmfw_firmware);
cd40dad2ca9196 Stefan Binding  2023-02-13 @304  		kfree(*wmfw_filename);
cd40dad2ca9196 Stefan Binding  2023-02-13  305  		dev_warn(cs35l41->dev, "Unable to find firmware and tuning\n");
cd40dad2ca9196 Stefan Binding  2023-02-13  306  	}
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  307  	return ret;
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  308  }
2e81e1fffd53ba Vitaly Rodionov 2022-06-30  309  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
