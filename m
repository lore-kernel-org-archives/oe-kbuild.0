Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24218BC3F
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 15:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931877; cv=none; b=mbGayvRFIzgBpUWs9OzkjBT34/K3LqeztXeNYuONpubdI7Epdx1L925tPOkHGJHytPNb4BD+FvT/AYJirEfBdf2E+piX0DDmsX54UEqd5MSm3wodDjJUWnh4ET4nOG3ggrabfqFbxPIdJsS0EPo6hjy5RUCryam1sF6gO1Nre4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931877; c=relaxed/simple;
	bh=loRCIDbkMNvgV6wsOzNB9X4kzQW+KAxfwOL+q4r910Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RmBd+xrG3kMPCZSoTi2ymRCDUJTnjFE6DLW7Gp/kM9IgmqrKizpenmG8pHNuRDJ70piTY7oIWF5Jweog8irIIFjzCpeEkNrOuwQz59utts+Bvb2TfaBQ8elZv3q0q+LRcGvpg27cCk39sB0CeMIe1CG3mUNY5ZQpGo7bDDu8UCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxdgKebz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxdgKebz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733931875; x=1765467875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=loRCIDbkMNvgV6wsOzNB9X4kzQW+KAxfwOL+q4r910Q=;
  b=YxdgKebziu6QyZ/pcBk+CnOFkYvOLfb+m4+IB3Id3kZMQD1CxJu90TfL
   +5VXquPlrJW8NqjlK9JFV1Dd9wIjBgfy4D5yBgOpij+1rJs9Qc6He9U6U
   qxj2PrZD2cbTFeuHgOFZ1TKOQkvznmG5Rz9qa6NDGb29SLmv6eny5p5B5
   1fOwZefL9asMAX920tsqCaLqyB9Ka/nqMWBXBtsifgO+Gm1EG9g8F1mOY
   0xL53a6rai9jXKrwsRZa+e4kC+tpkAWHjTjq05CoObShAfAI5QhIVN07u
   DjIlm996Os9C9CwuxSacCM4C//k2tr45dVV/y1m7A09unha99Jq9jtAe7
   Q==;
X-CSE-ConnectionGUID: xOTtUqnJREmhNpswGs3NKQ==
X-CSE-MsgGUID: sa3VKAH2Q2Wktp6tt5nSFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="44928569"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="44928569"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 07:44:34 -0800
X-CSE-ConnectionGUID: 4DtL0k72ScOrPUpe4rWW8Q==
X-CSE-MsgGUID: 6XTLZNLARziShHrVNkKAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126794384"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2024 07:44:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLOt4-0006pD-1N;
	Wed, 11 Dec 2024 15:44:30 +0000
Date: Wed, 11 Dec 2024 23:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/mediatek/mtk_drm_drv.c:1016
 mtk_drm_of_ddp_path_build() error: uninitialized symbol 'ret'.
Message-ID: <202412112300.L1cv0fpw-lkp@intel.com>
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
TO: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: Dave Airlie <airlied@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f92f4749861b06fed908d336b4dee1326003291b
commit: 9bed494cd627cecab1114ce0416c9ddb3ad66064 Merge tag 'mediatek-drm-next-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-next
date:   5 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
config: microblaze-randconfig-r073-20241210 (https://download.01.org/0day-ci/archive/20241211/202412112300.L1cv0fpw-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412112300.L1cv0fpw-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/mediatek/mtk_drm_drv.c:1016 mtk_drm_of_ddp_path_build() error: uninitialized symbol 'ret'.

vim +/ret +1016 drivers/gpu/drm/mediatek/mtk_drm_drv.c

4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17   991  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17   992  static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_node *node,
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17   993  				     struct mtk_mmsys_driver_data *data)
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17   994  {
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17   995  	struct device_node *ep_node;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17   996  	struct of_endpoint of_ep;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17   997  	bool output_present[MAX_CRTC] = { false };
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17   998  	int ret;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17   999  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1000  	for_each_endpoint_of_node(node, ep_node) {
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1001  		ret = of_graph_parse_endpoint(ep_node, &of_ep);
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1002  		if (ret) {
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1003  			dev_err_probe(dev, ret, "Cannot parse endpoint\n");
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1004  			break;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1005  		}
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1006  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1007  		if (of_ep.id >= MAX_CRTC) {
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1008  			ret = dev_err_probe(dev, -EINVAL,
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1009  					    "Invalid endpoint%u number\n", of_ep.port);
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1010  			break;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1011  		}
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1012  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1013  		output_present[of_ep.id] = true;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1014  	}
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1015  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17 @1016  	if (ret) {
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1017  		of_node_put(ep_node);
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1018  		return ret;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1019  	}
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1020  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1021  	if (output_present[CRTC_MAIN]) {
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1022  		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_MAIN,
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1023  						    &data->main_path, &data->main_len);
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1024  		if (ret && ret != -ENODEV)
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1025  			return ret;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1026  	}
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1027  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1028  	if (output_present[CRTC_EXT]) {
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1029  		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_EXT,
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1030  						    &data->ext_path, &data->ext_len);
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1031  		if (ret && ret != -ENODEV)
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1032  			return ret;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1033  	}
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1034  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1035  	if (output_present[CRTC_THIRD]) {
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1036  		ret = mtk_drm_of_ddp_path_build_one(dev, CRTC_THIRD,
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1037  						    &data->third_path, &data->third_len);
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1038  		if (ret && ret != -ENODEV)
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1039  			return ret;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1040  	}
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1041  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1042  	return 0;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1043  }
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  1044  

:::::: The code at line 1016 was first introduced by commit
:::::: 4c932840db1de4ea9639eceaaf6d59415b8a7d59 drm/mediatek: Implement OF graphs support for display paths

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
