Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D8E138C
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aY6QQw1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701583666; x=1733119666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++C1ew9MDealMfthjWNnhztJt8XvoVL/d80qJ8kzxF4=;
  b=aY6QQw1pibgQREgKeNxJoeUAgobqP+fP1M2njArc5WS79TK2tspIcNoF
   C2RaNeqGM/OiXXXEuXNu6Hdh6l4yvV+55YPq/w5839M7Xn8IeZL62nxTj
   zVBbLbWQ0IchIMblBVjtsQhmY47v/Zgk8IpmW04ndmy1lxcjewiSwGzfY
   WXwjdp3HZbRI6kBVos5Fg7t4ofx3DqDGfh8AdlkkrMZmlUIzd/P3DmV8s
   Pw65HnF9V+Tfm6AQT1BMhk5acJ7Ca1iybjlpQ6IhHGv0kuCAiNTptLQdD
   Hb9EtPP6Uf0yDPZEiEPQ5h2CtwfXAC7K1+och2E7b5nUw/8QiUW4dsQ0R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="373049273"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="373049273"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:07:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770187880"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770187880"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:07:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9fdk-0006I6-2w;
	Sun, 03 Dec 2023 06:07:40 +0000
Date: Sun, 3 Dec 2023 14:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:205
 nvkm_uoutp_mthd_acquire() error: we previously assumed 'outp->ior' could be
 null (see line 172)
Message-ID: <202312021459.DJ3hDnu1-lkp@intel.com>
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
commit: 8134437213316a58d1844b87e2042ebf1fd9962c drm/nouveau/disp: move DP link config into acquire
date:   1 year, 1 month ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231202/202312021459.DJ3hDnu1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312021459.DJ3hDnu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312021459.DJ3hDnu1-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:205 nvkm_uoutp_mthd_acquire() error: we previously assumed 'outp->ior' could be null (see line 172)

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:71 nvkm_uoutp_mthd_infoframe() error: we previously assumed 'ior->func->hdmi' could be null (see line 69)

vim +205 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c

9793083f1dd9da Ben Skeggs 2022-06-01  163  
ea6143a86c6711 Ben Skeggs 2022-06-01  164  static int
ea6143a86c6711 Ben Skeggs 2022-06-01  165  nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
ea6143a86c6711 Ben Skeggs 2022-06-01  166  {
ea6143a86c6711 Ben Skeggs 2022-06-01  167  	union nvif_outp_acquire_args *args = argv;
ea6143a86c6711 Ben Skeggs 2022-06-01  168  	int ret;
ea6143a86c6711 Ben Skeggs 2022-06-01  169  
ea6143a86c6711 Ben Skeggs 2022-06-01  170  	if (argc != sizeof(args->v0) || args->v0.version != 0)
ea6143a86c6711 Ben Skeggs 2022-06-01  171  		return -ENOSYS;
8134437213316a Ben Skeggs 2022-06-01 @172  	if (outp->ior)
8134437213316a Ben Skeggs 2022-06-01  173  		return -EBUSY;
ea6143a86c6711 Ben Skeggs 2022-06-01  174  
ea6143a86c6711 Ben Skeggs 2022-06-01  175  	switch (args->v0.proto) {
ea6143a86c6711 Ben Skeggs 2022-06-01  176  	case NVIF_OUTP_ACQUIRE_V0_RGB_CRT:
ea6143a86c6711 Ben Skeggs 2022-06-01  177  		ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, false);
ea6143a86c6711 Ben Skeggs 2022-06-01  178  		break;
ea6143a86c6711 Ben Skeggs 2022-06-01  179  	case NVIF_OUTP_ACQUIRE_V0_TMDS:
f530bc60a30bee Ben Skeggs 2022-06-01  180  		ret = nvkm_uoutp_mthd_acquire_tmds(outp, args->v0.tmds.head,
f530bc60a30bee Ben Skeggs 2022-06-01  181  							 args->v0.tmds.hdmi,
f530bc60a30bee Ben Skeggs 2022-06-01  182  							 args->v0.tmds.hdmi_max_ac_packet,
f530bc60a30bee Ben Skeggs 2022-06-01  183  							 args->v0.tmds.hdmi_rekey,
f530bc60a30bee Ben Skeggs 2022-06-01  184  							 args->v0.tmds.hdmi_scdc,
f530bc60a30bee Ben Skeggs 2022-06-01  185  							 args->v0.tmds.hdmi_hda);
f530bc60a30bee Ben Skeggs 2022-06-01  186  		break;
9793083f1dd9da Ben Skeggs 2022-06-01  187  	case NVIF_OUTP_ACQUIRE_V0_LVDS:
9793083f1dd9da Ben Skeggs 2022-06-01  188  		ret = nvkm_uoutp_mthd_acquire_lvds(outp, args->v0.lvds.dual, args->v0.lvds.bpc8);
9793083f1dd9da Ben Skeggs 2022-06-01  189  		break;
8134437213316a Ben Skeggs 2022-06-01  190  	case NVIF_OUTP_ACQUIRE_V0_DP:
8134437213316a Ben Skeggs 2022-06-01  191  		ret = nvkm_uoutp_mthd_acquire_dp(outp, args->v0.dp.dpcd,
8134437213316a Ben Skeggs 2022-06-01  192  						       args->v0.dp.link_nr,
8134437213316a Ben Skeggs 2022-06-01  193  						       args->v0.dp.link_bw,
8134437213316a Ben Skeggs 2022-06-01  194  						       args->v0.dp.hda != 0,
8134437213316a Ben Skeggs 2022-06-01  195  						       args->v0.dp.mst != 0);
8134437213316a Ben Skeggs 2022-06-01  196  		break;
ea6143a86c6711 Ben Skeggs 2022-06-01  197  	default:
ea6143a86c6711 Ben Skeggs 2022-06-01  198  		ret = -EINVAL;
ea6143a86c6711 Ben Skeggs 2022-06-01  199  		break;
ea6143a86c6711 Ben Skeggs 2022-06-01  200  	}
ea6143a86c6711 Ben Skeggs 2022-06-01  201  
ea6143a86c6711 Ben Skeggs 2022-06-01  202  	if (ret)
ea6143a86c6711 Ben Skeggs 2022-06-01  203  		return ret;
ea6143a86c6711 Ben Skeggs 2022-06-01  204  
ea6143a86c6711 Ben Skeggs 2022-06-01 @205  	args->v0.or = outp->ior->id;
ea6143a86c6711 Ben Skeggs 2022-06-01  206  	args->v0.link = outp->ior->asy.link;
ea6143a86c6711 Ben Skeggs 2022-06-01  207  	return 0;
ea6143a86c6711 Ben Skeggs 2022-06-01  208  }
ea6143a86c6711 Ben Skeggs 2022-06-01  209  

:::::: The code at line 205 was first introduced by commit
:::::: ea6143a86c67110a2c62deaf70d0b7b92e4f865f drm/nouveau/disp: move and extend the role of outp acquire/release methods

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
