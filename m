Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4891C1FC0E5
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733137101; cv=none; b=PMFsebHu4d6A+tKyw93SVHdGooq8fr92b9C9/OZVxNLt96ds1Mdnu7mzZxSlMf02Id1UxF//nOmVX16NhzahwtYj2qdiriv05xhve8NgNR8kE7Qnsw/+vroONqFObeDv70HwyqkLghGfm3M1rWzt5Tiu6KNX6Ytjrw/mw5eoN9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733137101; c=relaxed/simple;
	bh=s4AiYgg5DhVsTTjImJqcyXdnIp1KfdpxCUz+NMkAVYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njDvTLvbWVn5ViporMXgsqaTf4UMbXBQ+KnRYQMUa3swnKiCrTsgF18EE1N1uhH5RR3xokJBmTx86UZmxDN0Qz+yCn+qIxxtUUtYvgy9YfKW9NuaSa0PJnEyhxIvqEF48dgkpQzZ5HAOYU9JHIPr48Zh45PG3IKxM5ORSbLDFD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nq3PLuxm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nq3PLuxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733137099; x=1764673099;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s4AiYgg5DhVsTTjImJqcyXdnIp1KfdpxCUz+NMkAVYE=;
  b=Nq3PLuxmKUvMd3+PSz2gE11vm1Ny0+BA3xNsH2fYPIUI+5srVY9ri/F2
   O5hQLxgMQgxdBCjZ7F9O8bNAXwY2WANsH13NocCWYRhSvfmCdzwlJiO3z
   EezjMxgXTIs4smgM8+tlEHdDfXrzhvkLv5jyNddnJwHGoZgCblg+8CnIo
   dzIEwkTpgyZOnX5peS/M0aaq2r/F5qXGRozD5b5h9e3bcqz/hA90ReTaG
   mWvxgUk6RfuFBr4xTNLqoteb/DeF0TDL8XrpVvR0nTA7P9YTj/cebYDRi
   LD5ST/XWa5U/LZ5mjg1DU0eL3qmYaVlFWkxnxp55TFFwPV3mFReVLZ/rc
   Q==;
X-CSE-ConnectionGUID: Gv+RNKOeR/SNZRybyq21Cw==
X-CSE-MsgGUID: rBtUYAXXRwCZ+m6SY1jWTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44676171"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="44676171"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 02:58:19 -0800
X-CSE-ConnectionGUID: /oT+QwyESJGRaSqZsmnchw==
X-CSE-MsgGUID: 6/mTYInkQLaeA8Ckcz1pbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93455780"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2024 02:58:17 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI487-0002LZ-02;
	Mon, 02 Dec 2024 10:58:15 +0000
Date: Mon, 2 Dec 2024 18:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/mediatek/mtk_dp.c:1234:25-31: opportunity for
 str_enable_disable(enable)
Message-ID: <202412021849.nJQI2X0D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: CK Hu <ck.hu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: d2db0b8fd70bb216eb96ad1a32c158889e247c16 drm/mediatek: Allow build with COMPILE_TEST=y
date:   5 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: nios2-randconfig-r061-20241202 (https://download.01.org/0day-ci/archive/20241202/202412021849.nJQI2X0D-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412021849.nJQI2X0D-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_dp.c:1234:25-31: opportunity for str_enable_disable(enable)

vim +1234 drivers/gpu/drm/mediatek/mtk_dp.c

f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1217  
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1218  static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1219  {
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1220  	struct arm_smccc_res res;
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1221  	u32 val = VIDEO_MUTE_SEL_DP_ENC0_P0 |
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1222  		  (enable ? VIDEO_MUTE_SW_DP_ENC0_P0 : 0);
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1223  
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1224  	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000,
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1225  			   val,
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1226  			   VIDEO_MUTE_SEL_DP_ENC0_P0 |
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1227  			   VIDEO_MUTE_SW_DP_ENC0_P0);
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1228  
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1229  	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32,
42dbe4a0a988fe Bo-Chen Chen              2022-09-01  1230  		      mtk_dp->data->smc_cmd, enable,
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1231  		      0, 0, 0, 0, 0, &res);
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1232  
1637c315282e97 Bo-Chen Chen              2022-09-16  1233  	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: %s, ret: 0x%lx-0x%lx\n",
1637c315282e97 Bo-Chen Chen              2022-09-16 @1234  		mtk_dp->data->smc_cmd, enable ? "enable" : "disable", res.a0, res.a1);
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1235  }
f70ac097a2cf5d Markus Schneider-Pargmann 2022-09-01  1236  

:::::: The code at line 1234 was first introduced by commit
:::::: 1637c315282e97efcb95cc7dfafbb15efa9fa27f drm/mediatek: dp: Fix compiler warning in mtk_dp_video_mute()

:::::: TO: Bo-Chen Chen <rex-bc.chen@mediatek.com>
:::::: CC: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
