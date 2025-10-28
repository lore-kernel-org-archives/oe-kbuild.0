Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68342F50F
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 00:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761610200; cv=none; b=XaQOdZzcH7Ix+U4X4jxBm0wCvTJPWGGw4S73jLoFuxl3gB7l0uKl5e2PiQSkCCBqCuAlUD1t92PAi69ujV0y9Ow3hu7V5MD9k+Jn32E/Ogih0UmZ80/EFbYVP/9CHHLYMabrWueEPy2X5o2AizX8Yj8pmL1QgFvzk1Zw1R2n3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761610200; c=relaxed/simple;
	bh=7XwDiC8TzyJnla4uP9cfCjYfSCId2ghfgQGEpTVvElI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwVxHjGwIAESXm3qQzjJwMLCuWd7Rxo4OgBSOJZct4b0x5VBzD5dN1Hlku0yOPwdcNIzONQDhPKzEbChB7RmBdlgq1flfZJI/K/nWH30Vd4k2GLDqSYNga8Vg0xbsPWC4VVt6qOmWk+GVrcMUvEGvew9SEFlCD9/OajHIQQC1N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoZayeqb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoZayeqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761610198; x=1793146198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XwDiC8TzyJnla4uP9cfCjYfSCId2ghfgQGEpTVvElI=;
  b=eoZayeqbbGXKdIQsmoif6orAAET9hhxdqByZLDCiLNBeSlvhJek/+sNE
   hyZI6VPIlxnV6zfcGfvhckZrhMwu6u2B9JsxrKtktPDxdVc817mhWdN2i
   hoUxNW39jw2Jf1heXVcHCtUaDbT77ocB/QOK63pBKOoTeQZ+aNe7OMt4w
   qMB/mCAPt4v3/UIQ6gOtHxTIChblq0VE6rFhYEqRmhypsYAXPx0B9L8UT
   y0dZtkD0BiQtXmcT4FtEmccgACmvfn9EpfnoaZBmTxRaJEicQsid2qk+s
   BoeZzcVxtknhXe0trPlyQPeHdTj1MqF1+5WKckGysLx3dislwpEKFngmQ
   w==;
X-CSE-ConnectionGUID: FL2cBzUERzeDB9RYC1M/+w==
X-CSE-MsgGUID: CUZArEyxRbueysj7BiXwmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74377792"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="74377792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:09:57 -0700
X-CSE-ConnectionGUID: o7yW/4baTqSi9iRARcr/yg==
X-CSE-MsgGUID: t9x4qPVhQ8GlAxkRdCMjsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185277906"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2025 17:09:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDXHZ-000Iab-0f;
	Tue, 28 Oct 2025 00:09:50 +0000
Date: Tue, 28 Oct 2025 08:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] accel/qaic: Add support for PM callbacks
Message-ID: <202510280738.gGmJs0WE-lkp@intel.com>
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
In-Reply-To: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
TO: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
TO: jeff.hugo@oss.qualcomm.com
TO: carl.vanderlip@oss.qualcomm.com
TO: troy.hanson@oss.qualcomm.com
TO: zachary.mckevitt@oss.qualcomm.com
CC: ogabbay@kernel.org
CC: lizhi.hou@amd.com
CC: karol.wachowski@linux.intel.com
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org

Hi Youssef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youssef-Samir/accel-qaic-Add-support-for-PM-callbacks/20251025-003501
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251024162916.801196-1-youssef.abdulrahman%40oss.qualcomm.com
patch subject: [PATCH v2] accel/qaic: Add support for PM callbacks
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251026 (https://download.01.org/0day-ci/archive/20251028/202510280738.gGmJs0WE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510280738.gGmJs0WE-lkp@intel.com/

smatch warnings:
drivers/accel/qaic/qaic_drv.c:700 qaic_data_path_busy() error: uninitialized symbol 'ret'.

vim +/ret +700 drivers/accel/qaic/qaic_drv.c

41074b262e7e90 Youssef Samir 2025-10-24  670  
41074b262e7e90 Youssef Samir 2025-10-24  671  static bool __maybe_unused qaic_data_path_busy(struct qaic_device *qdev)
41074b262e7e90 Youssef Samir 2025-10-24  672  {
41074b262e7e90 Youssef Samir 2025-10-24  673  	int dev_rcu_id;
41074b262e7e90 Youssef Samir 2025-10-24  674  	bool ret;
41074b262e7e90 Youssef Samir 2025-10-24  675  	int i;
41074b262e7e90 Youssef Samir 2025-10-24  676  
41074b262e7e90 Youssef Samir 2025-10-24  677  	dev_rcu_id = srcu_read_lock(&qdev->dev_lock);
41074b262e7e90 Youssef Samir 2025-10-24  678  	if (qdev->dev_state != QAIC_ONLINE) {
41074b262e7e90 Youssef Samir 2025-10-24  679  		srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
41074b262e7e90 Youssef Samir 2025-10-24  680  		return false;
41074b262e7e90 Youssef Samir 2025-10-24  681  	}
41074b262e7e90 Youssef Samir 2025-10-24  682  	for (i = 0; i < qdev->num_dbc; i++) {
41074b262e7e90 Youssef Samir 2025-10-24  683  		struct dma_bridge_chan *dbc = &qdev->dbc[i];
41074b262e7e90 Youssef Samir 2025-10-24  684  		unsigned long flags;
41074b262e7e90 Youssef Samir 2025-10-24  685  		int ch_rcu_id;
41074b262e7e90 Youssef Samir 2025-10-24  686  
41074b262e7e90 Youssef Samir 2025-10-24  687  		ch_rcu_id = srcu_read_lock(&dbc->ch_lock);
41074b262e7e90 Youssef Samir 2025-10-24  688  		if (!dbc->usr || !dbc->in_use) {
41074b262e7e90 Youssef Samir 2025-10-24  689  			srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
41074b262e7e90 Youssef Samir 2025-10-24  690  			continue;
41074b262e7e90 Youssef Samir 2025-10-24  691  		}
41074b262e7e90 Youssef Samir 2025-10-24  692  		spin_lock_irqsave(&dbc->xfer_lock, flags);
41074b262e7e90 Youssef Samir 2025-10-24  693  		ret = !list_empty(&dbc->xfer_list);
41074b262e7e90 Youssef Samir 2025-10-24  694  		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
41074b262e7e90 Youssef Samir 2025-10-24  695  		srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
41074b262e7e90 Youssef Samir 2025-10-24  696  		if (ret)
41074b262e7e90 Youssef Samir 2025-10-24  697  			break;
41074b262e7e90 Youssef Samir 2025-10-24  698  	}
41074b262e7e90 Youssef Samir 2025-10-24  699  	srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
41074b262e7e90 Youssef Samir 2025-10-24 @700  	return ret;
41074b262e7e90 Youssef Samir 2025-10-24  701  }
41074b262e7e90 Youssef Samir 2025-10-24  702  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
