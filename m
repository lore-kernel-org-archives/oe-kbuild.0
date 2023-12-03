Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A991815BF
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnyW5gPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701583670; x=1733119670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s89ImYgciyLQoQiiObXiTFyBwHTrrhTsvI8c8ZfEHb0=;
  b=EnyW5gPteu9/hzLTrZPnLW9pov3SJMCIgBzCseYd0c9YHlQDs2rahXYI
   tIzDGQvpihUaqLyD9pq9Esu5nRcQKVP1nmm5rWKJ99LDtEJeSk3UePCCj
   JE3QC+zg1qP6UI28uSCiY8HjUub79x+XRBnSX+PbDQJblYVbJnAZGbIAy
   MHvpv92HwkvJS7EV+pp77Y6azETzpIVhNpsLP4BGkIb3PaKj8Sg5CrehB
   x/ggBKLvUqaiNazXBBOfTciqn5mBvXEcYmH+kmJW0Hw/j/WABlBNLXNVc
   GwMkr16ZE61y7CWlkd8P4ip1Le5Ea8hSjfcy9SlDnUNm4e3AP7cDro8Cr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="373049288"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="373049288"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770187884"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770187884"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:07:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9fdl-0006IF-09;
	Sun, 03 Dec 2023 06:07:41 +0000
Date: Sun, 3 Dec 2023 14:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nouveau_dp.c:237 nouveau_dp_irq() warn:
 variable dereferenced before check 'outp' (see line 232)
Message-ID: <202312021916.U9nxtVaD-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@redhat.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 773eb04d14a11552b2c3953097ed09cde2ab4831 drm/nouveau/disp: expose conn event class
date:   1 year, 1 month ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231202/202312021916.U9nxtVaD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312021916.U9nxtVaD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312021916.U9nxtVaD-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nouveau_dp.c:237 nouveau_dp_irq() warn: variable dereferenced before check 'outp' (see line 232)

vim +/outp +237 drivers/gpu/drm/nouveau/nouveau_dp.c

8bb30c882334c0 Ben Skeggs 2022-06-01  224  
773eb04d14a115 Ben Skeggs 2022-06-01  225  void
773eb04d14a115 Ben Skeggs 2022-06-01  226  nouveau_dp_irq(struct work_struct *work)
a0922278f83eae Lyude Paul 2020-08-26  227  {
773eb04d14a115 Ben Skeggs 2022-06-01  228  	struct nouveau_connector *nv_connector =
773eb04d14a115 Ben Skeggs 2022-06-01  229  		container_of(work, typeof(*nv_connector), irq_work);
a0922278f83eae Lyude Paul 2020-08-26  230  	struct drm_connector *connector = &nv_connector->base;
a0922278f83eae Lyude Paul 2020-08-26  231  	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
773eb04d14a115 Ben Skeggs 2022-06-01 @232  	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
a0922278f83eae Lyude Paul 2020-08-26  233  	struct nv50_mstm *mstm;
016dacb60e6d4b Ben Skeggs 2022-06-01  234  	u64 hpd = 0;
a4efad354cf1b9 Lyude Paul 2020-08-26  235  	int ret;
a0922278f83eae Lyude Paul 2020-08-26  236  
a0922278f83eae Lyude Paul 2020-08-26 @237  	if (!outp)
a0922278f83eae Lyude Paul 2020-08-26  238  		return;
a0922278f83eae Lyude Paul 2020-08-26  239  
a0922278f83eae Lyude Paul 2020-08-26  240  	mstm = outp->dp.mstm;
a0922278f83eae Lyude Paul 2020-08-26  241  	NV_DEBUG(drm, "service %s\n", connector->name);
a0922278f83eae Lyude Paul 2020-08-26  242  
a0922278f83eae Lyude Paul 2020-08-26  243  	mutex_lock(&outp->dp.hpd_irq_lock);
a0922278f83eae Lyude Paul 2020-08-26  244  
a0922278f83eae Lyude Paul 2020-08-26  245  	if (mstm && mstm->is_mst) {
a0922278f83eae Lyude Paul 2020-08-26  246  		if (!nv50_mstm_service(drm, nv_connector, mstm))
773eb04d14a115 Ben Skeggs 2022-06-01  247  			hpd |= NVIF_CONN_EVENT_V0_UNPLUG;
a0922278f83eae Lyude Paul 2020-08-26  248  	} else {
a0922278f83eae Lyude Paul 2020-08-26  249  		drm_dp_cec_irq(&nv_connector->aux);
a4efad354cf1b9 Lyude Paul 2020-08-26  250  
a4efad354cf1b9 Lyude Paul 2020-08-26  251  		if (nouveau_dp_has_sink_count(connector, outp)) {
a4efad354cf1b9 Lyude Paul 2020-08-26  252  			ret = drm_dp_read_sink_count(&nv_connector->aux);
a4efad354cf1b9 Lyude Paul 2020-08-26  253  			if (ret != outp->dp.sink_count)
773eb04d14a115 Ben Skeggs 2022-06-01  254  				hpd |= NVIF_CONN_EVENT_V0_PLUG;
a4efad354cf1b9 Lyude Paul 2020-08-26  255  			if (ret >= 0)
a4efad354cf1b9 Lyude Paul 2020-08-26  256  				outp->dp.sink_count = ret;
a4efad354cf1b9 Lyude Paul 2020-08-26  257  		}
a0922278f83eae Lyude Paul 2020-08-26  258  	}
a0922278f83eae Lyude Paul 2020-08-26  259  
a0922278f83eae Lyude Paul 2020-08-26  260  	mutex_unlock(&outp->dp.hpd_irq_lock);
a4efad354cf1b9 Lyude Paul 2020-08-26  261  
773eb04d14a115 Ben Skeggs 2022-06-01  262  	nouveau_connector_hpd(nv_connector, NVIF_CONN_EVENT_V0_IRQ | hpd);
a0922278f83eae Lyude Paul 2020-08-26  263  }
a0922278f83eae Lyude Paul 2020-08-26  264  

:::::: The code at line 237 was first introduced by commit
:::::: a0922278f83eae085fdf73d06f71bbdfb9d6789e drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Lyude Paul <lyude@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
