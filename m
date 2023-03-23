Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C9717CE
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 03:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679543409; x=1711079409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNWV+D+3Vt8N1snvdjxrJDioHwUhsQQcZESTrTKlDOs=;
  b=WeSHCTvzNVRu0f7nxavib2bFCuKEKcPWTU5dtosZb62fqF1sJFH535oQ
   VlMc7Wra+sFlCxy17Fm1o0BcJrYOCUNB5q7YN8muQxPCS9ehOqo0xbk36
   krh9xYaVA+PE0uZbQXnTnQqVC71BpUk/tM8GVV09hWnlTvOdbFWoBIXsX
   eQ1da+IVdD3GYgR97SIG6X29zqcPPIkZuA9I2CT+rNu7ICHiWz3gUE3vH
   E3jNUT+y6kY32A2hfSXsf4EXm/h9iQbQji5UJvOdZuSo8+ddGGjcMg74e
   WNNkFpoHLdYNRt1BgI3yvG12G3lC9PkVOebctT4ah42eoJ5Q7dHKHrzmc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339424959"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="339424959"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 20:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="825663866"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="825663866"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2023 20:50:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfBxn-000DvU-0N;
	Thu, 23 Mar 2023 03:50:07 +0000
Date: Thu, 23 Mar 2023 11:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/sof/ipc4-mtrace.c:359 sof_ipc4_priority_mask_dfs_write()
 warn: potential spectre issue 'priv->state_info.logs_priorities_mask' [w]
 (local cap)
Message-ID: <202303231129.YxVuUvO2-lkp@intel.com>
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
TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rander Wang <rander.wang@intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fff5a5e7f528b2ed2c335991399a766c2cf01103
commit: f4ea22f7aa7536560097d765be56445933d07e0d ASoC: SOF: ipc4: Add support for mtrace log extraction
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/archive/20230323/202303231129.YxVuUvO2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303231129.YxVuUvO2-lkp@intel.com/

smatch warnings:
sound/soc/sof/ipc4-mtrace.c:359 sof_ipc4_priority_mask_dfs_write() warn: potential spectre issue 'priv->state_info.logs_priorities_mask' [w] (local cap)

vim +359 sound/soc/sof/ipc4-mtrace.c

f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  326  
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  327  static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  328  						const char __user *from,
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  329  						size_t count, loff_t *ppos)
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  330  {
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  331  	struct sof_mtrace_priv *priv = file->private_data;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  332  	int id, ret;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  333  	char *buf;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  334  	u32 mask;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  335  
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  336  	/*
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  337  	 * To update Nth mask entry, write:
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  338  	 * "N,0x1234" or "N,1234" to the debugfs file
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  339  	 * The mask will be interpreted as hexadecimal number
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  340  	 */
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  341  	buf = memdup_user_nul(from, count);
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  342  	if (IS_ERR(buf))
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  343  		return PTR_ERR(buf);
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  344  
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  345  	ret = sscanf(buf, "%d,0x%x", &id, &mask);
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  346  	if (ret != 2) {
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  347  		ret = sscanf(buf, "%d,%x", &id, &mask);
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  348  		if (ret != 2) {
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  349  			ret = -EINVAL;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  350  			goto out;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  351  		}
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  352  	}
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  353  
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  354  	if (id >= MAX_ALLOWED_LIBRARIES) {
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  355  		ret = -EINVAL;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  356  		goto out;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  357  	}
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  358  
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09 @359  	priv->state_info.logs_priorities_mask[id] = mask;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  360  	ret = count;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  361  
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  362  out:
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  363  	kfree(buf);
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  364  	return ret;
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  365  }
f4ea22f7aa7536 Peter Ujfalusi 2022-09-09  366  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
