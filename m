Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE2E38DEA
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708357586; cv=none; b=Pg2cI2T+CSQwsUmBTdf2F0He5MdtVttGK/MvRoPrCXrHqVkOP8qmsys8jvg1IwRDi1/Pp87RscQ6mmiEls2/agaPvlChcXlAcwS6MqmNGyOzO/yvIMBnBFcufFrJtt4jnRgg2M/Yd4VYVIeg5bMpN5LqfXjzu9joDcDR3Wi3LGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708357586; c=relaxed/simple;
	bh=9VNWoL+YDu2xUz3ukqVRJGDWcrzt+9abQAt0CRaCLA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qVINWyKL2+cJWv79Z6KMOKzF1ajdcQF2sjluUNluzTkPhA/hjiiYUKLGmI2WP1cFEvWA9iZ3epqYd++TrCtbq38TW4dA5nTHgpObK6aVHtdBtv6GXXAZWdNOuPa8fUJHpfOTnMTaofs1cgV9J4axGtts0EV+SZ7V9mHuAMaKpDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaSY4fWC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaSY4fWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708357584; x=1739893584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9VNWoL+YDu2xUz3ukqVRJGDWcrzt+9abQAt0CRaCLA0=;
  b=aaSY4fWCG5cLXeUoLqayu0jcshVySNBr543u9B6ft4h2j9RNG+a89IxQ
   jZLAMzRuBWS18fl8nPDjWyafTbtgiupOcrFNqMuN4TRkx/KjZM1Oz+v3C
   g/dKK1QlWpEklLmgNUYa7fAxhMp007oA574MV4yXSlHwBfsjHtWE0nyV8
   9CkcnJ8Ih4foMSmZTrLu2cukkQWUkhgV69aYrbIS+HqN/aMHMeY6U5CTY
   Kyn18VpDAkSh1SpR1Ph88GwJcN0XDygkRLBh4zZxpoT1ho1bDX+7w6ps2
   5xqsISQKDlAHFfESKOFmdDjqZKyzyrSGOJgPXJWWcOWiKxONMtLMPnLdH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="5403048"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="5403048"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 07:46:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4882621"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Feb 2024 07:46:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rc5qV-0003t8-23;
	Mon, 19 Feb 2024 15:46:19 +0000
Date: Mon, 19 Feb 2024 23:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hverkuil-media-tree:outreachy-vivid-v6.7 12/12]
 drivers/media/test-drivers/vivid/vivid-core.c:2200 vivid_init() error:
 uninitialized symbol 'ret'.
Message-ID: <202402192316.fyBF9GDv-lkp@intel.com>
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
TO: Dorcas Anono Litunya <anonolitunya@gmail.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git outreachy-vivid-v6.7
head:   4bc7849217d6c105cb59d78e9995b8e129f0deaf
commit: 4bc7849217d6c105cb59d78e9995b8e129f0deaf [12/12] media: vivid: Update menu controls for HDMI in multiple instance
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: nios2-randconfig-r071-20240219 (https://download.01.org/0day-ci/archive/20240219/202402192316.fyBF9GDv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402192316.fyBF9GDv-lkp@intel.com/

New smatch warnings:
drivers/media/test-drivers/vivid/vivid-core.c:2200 vivid_init() error: uninitialized symbol 'ret'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/ret +2200 drivers/media/test-drivers/vivid/vivid-core.c

f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2158  
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2159  static int __init vivid_init(void)
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2160  {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2161  	int count = FIXED_MENU_ITEMS;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2162  	int ret;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2163  
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2164  	for (int i = 0; i < n_devs; i++) {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2165  		if (!(node_types[i] & (1 << 8)))
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2166  			continue;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2167  		for (int j = 0, k = 0; j < num_outputs[i] &&
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2168  		     count < MAX_MENU_ITEMS; ++j) {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2169  			if (!(output_types[i] & BIT(j)))
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2170  				continue;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2171  			vivid_ctrl_hdmi_to_output_strings[count] =
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2172  				kmalloc(MAX_STRING_LENGTH, GFP_KERNEL);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2173  			if (!vivid_ctrl_hdmi_to_output_strings[count])
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2174  				goto cleanup;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2175  			if (n_devs == 1) {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2176  				snprintf(vivid_ctrl_hdmi_to_output_strings[count],
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2177  					 MAX_STRING_LENGTH, "HDMI %d", k);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2178  			} else {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2179  				snprintf(vivid_ctrl_hdmi_to_output_strings[count],
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2180  					 MAX_STRING_LENGTH, "HDMI %03d-%d", i, k);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2181  			}
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2182  			k++;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2183  			count++;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2184  		}
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2185  	}
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2186  	ret = platform_device_register(&vivid_pdev);
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2187  	if (ret)
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2188  		goto cleanup;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2189  	ret = platform_driver_register(&vivid_pdrv);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2190  	if (ret) {
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2191  		platform_device_unregister(&vivid_pdev);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2192  		goto cleanup;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2193  	}
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2194  	return ret;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2195  
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2196  cleanup:
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2197  	for (int i = FIXED_MENU_ITEMS; i < MAX_MENU_ITEMS; i++)
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2198  		kfree(vivid_ctrl_hdmi_to_output_strings[i]);
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2199  
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13 @2200  	return ret;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2201  }
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2202  

:::::: The code at line 2200 was first introduced by commit
:::::: f46d740fb0258982f00ffdbddc6486e674edafb5 [media] vivid: turn this into a platform_device

:::::: TO: Hans Verkuil <hans.verkuil@cisco.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
