Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD0D427FA0
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 07:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234605; cv=none; b=EMr7PjOezHdSs61BEDyBqa/L/GKK0OXyWIGXIDqBvKR23pkRz6zQxKl042Xr5UejQwfQbJHBF6+YbVNjC3ZyvUhwQ8aK0qSECsHAI7AjsYyxfyiMiHWlkhJAnbLjAE/o38Z/VCHqoKe3/zO1fEj4aL3ukEzBgxrvuuY3lyWuOTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234605; c=relaxed/simple;
	bh=z8rv70cPDC1FGjbDXzy1MqpGJAwj1KolvFSRrW+3670=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FYFfzWQx8/MtN8QkRv0YXvF1WLVK5kbX1XplXxHof+Fr1KSlEL9vgxMrwtLdwxllB3iu1TJueSwyslXSNbO7U+4s67VyuuyHK4BMIHCWhmjd9dPnmYwt0x/HCgOvJq7gGSEOeDuBJPIHzDqig2ZrZ9tVUKQU3bRqepJ+DLzP+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gf89I50w; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gf89I50w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790234604; x=1821770604;
  h=date:from:to:cc:subject:message-id;
  bh=z8rv70cPDC1FGjbDXzy1MqpGJAwj1KolvFSRrW+3670=;
  b=Gf89I50wyikuj7CecULXQTrblYfklgbpuPgxC/Cc8pjwdw1T/5QmscsC
   0lKADdrLbMWtMca7zHfB6iMCyy1jpDylEBybxUvtj9ZBOk7ywP3BkPZQ3
   9hua3rRq+f+LvdKak/0qhXpHy6DKGrmhXPXrWG2ly+PvSceJfLNbpflax
   43yywgpHl28uVdaAwdObf5g6QpFHwP1Bh9US4qWn4OeU/4WRfDl3noFfB
   pDHdwOOyeDt2Vq2cyIrKGAdGz4IedtA1PFh/X1rPkuCbmyQAzPB09cNhH
   /3sSPj5T2IwMJK2T8GxjqpWhGHo01nhxLVEI7SWsnMP3tlslmSFFcIbkN
   g==;
X-CSE-ConnectionGUID: X0KMb8QKS2mEc0kaJFDGWg==
X-CSE-MsgGUID: 8z/+kmQDSBSNKvMD0jLiyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91013899"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91013899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:23:23 -0700
X-CSE-ConnectionGUID: oOHDxlmfRieH5QAoDEUl6A==
X-CSE-MsgGUID: RuCRDglHTo2Ad4mjaIAuYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="271781328"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2026 00:23:22 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9dnZ-000000000Fy-3iDh;
	Thu, 24 Sep 2026 07:23:17 +0000
Date: Thu, 24 Sep 2026 09:23:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5416/9480]
 drivers/memory/tegra/tegra264.c:964:7-28: opportunity for
 str_write_read(value & fault -> rw_bit)
Message-ID: <202609240937.ZhKteWVi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ketan Patil <ketanp@nvidia.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

Hi Ketan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: f4e16143420f4021431cc652ebd71e176267ecbc [5416/9480] memory: tegra: Refactor Tegra264 mc-err code
:::::: branch date: 7 hours ago
:::::: commit date: 9 days ago
config: arm64-randconfig-r2107-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240937.ZhKteWVi-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7e4b8ae111298941e0c31052a7124ab36f5365b5)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609240937.ZhKteWVi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/memory/tegra/tegra264.c:964:7-28: opportunity for str_write_read(value & fault -> rw_bit)

vim +964 drivers/memory/tegra/tegra264.c

82169065ffb075 Ketan Patil 2026-02-26  924  
f4e16143420f40 Ketan Patil 2026-09-03  925  static void tegra264_mc_report_fault(struct tegra_mc *mc, u32 channel,
f4e16143420f40 Ketan Patil 2026-09-03  926  				     unsigned int interrupt,
f4e16143420f40 Ketan Patil 2026-09-03  927  				     const struct tegra264_mc_fault *fault)
f4e16143420f40 Ketan Patil 2026-09-03  928  {
f4e16143420f40 Ketan Patil 2026-09-03  929  	const char *client = "unknown", *desc = "NA";
f4e16143420f40 Ketan Patil 2026-09-03  930  	u32 value, client_id, status1 = 0;
f4e16143420f40 Ketan Patil 2026-09-03  931  	phys_addr_t addr = 0;
f4e16143420f40 Ketan Patil 2026-09-03  932  	unsigned int i;
f4e16143420f40 Ketan Patil 2026-09-03  933  	u8 type;
82169065ffb075 Ketan Patil 2026-02-26  934  
f4e16143420f40 Ketan Patil 2026-09-03  935  	value = mc_ch_readl(mc, channel, fault->status_reg);
82169065ffb075 Ketan Patil 2026-02-26  936  
f4e16143420f40 Ketan Patil 2026-09-03  937  	if (fault->addr_hi_reg) {
f4e16143420f40 Ketan Patil 2026-09-03  938  		addr = mc_ch_readl(mc, channel, fault->addr_hi_reg);
f4e16143420f40 Ketan Patil 2026-09-03  939  	} else if (fault->status1_reg) {
f4e16143420f40 Ketan Patil 2026-09-03  940  		status1 = mc_ch_readl(mc, channel, fault->status1_reg);
f4e16143420f40 Ketan Patil 2026-09-03  941  		addr = (status1 >> fault->addr_hi_shift) & fault->addr_hi_mask;
82169065ffb075 Ketan Patil 2026-02-26  942  	} else {
f4e16143420f40 Ketan Patil 2026-09-03  943  		addr = (value >> fault->addr_hi_shift) & fault->addr_hi_mask;
82169065ffb075 Ketan Patil 2026-02-26  944  	}
82169065ffb075 Ketan Patil 2026-02-26  945  
82169065ffb075 Ketan Patil 2026-02-26  946  	addr <<= 32;
f4e16143420f40 Ketan Patil 2026-09-03  947  	addr |= mc_ch_readl(mc, channel, fault->addr_reg);
82169065ffb075 Ketan Patil 2026-02-26  948  
82169065ffb075 Ketan Patil 2026-02-26  949  	client_id = value & mc->soc->client_id_mask;
82169065ffb075 Ketan Patil 2026-02-26  950  	for (i = 0; i < mc->soc->num_clients; i++) {
82169065ffb075 Ketan Patil 2026-02-26  951  		if (mc->soc->clients[i].id == client_id) {
82169065ffb075 Ketan Patil 2026-02-26  952  			client = mc->soc->clients[i].name;
82169065ffb075 Ketan Patil 2026-02-26  953  			break;
82169065ffb075 Ketan Patil 2026-02-26  954  		}
82169065ffb075 Ketan Patil 2026-02-26  955  	}
82169065ffb075 Ketan Patil 2026-02-26  956  
f4e16143420f40 Ketan Patil 2026-09-03  957  	if (fault->type_names) {
f4e16143420f40 Ketan Patil 2026-09-03  958  		type = (value & fault->type_mask) >> fault->type_shift;
f4e16143420f40 Ketan Patil 2026-09-03  959  		desc = fault->type_names[type];
82169065ffb075 Ketan Patil 2026-02-26  960  	}
82169065ffb075 Ketan Patil 2026-02-26  961  
82169065ffb075 Ketan Patil 2026-02-26  962  	dev_err_ratelimited(mc->dev, "%s: %s %s @%pa: %s (%s)\n",
f4e16143420f40 Ketan Patil 2026-09-03  963  			    client, value & fault->sec_bit ? "secure" : "non-secure",
f4e16143420f40 Ketan Patil 2026-09-03 @964  			    value & fault->rw_bit ? "write" : "read", &addr,
f4e16143420f40 Ketan Patil 2026-09-03  965  			    tegra_mc_status_names[interrupt] ?: "unknown", desc);
f4e16143420f40 Ketan Patil 2026-09-03  966  
f4e16143420f40 Ketan Patil 2026-09-03  967  	if (fault->status1_reg)
82169065ffb075 Ketan Patil 2026-02-26  968  		dev_err_ratelimited(mc->dev, "gsc_apr_id=%u gsc_co_apr_id=%u\n",
f4e16143420f40 Ketan Patil 2026-09-03  969  				    (status1 >> ERR_GENERALIZED_APERTURE_ID_SHIFT) &
f4e16143420f40 Ketan Patil 2026-09-03  970  				    ERR_GENERALIZED_APERTURE_ID_MASK,
f4e16143420f40 Ketan Patil 2026-09-03  971  				    (status1 >> ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT) &
f4e16143420f40 Ketan Patil 2026-09-03  972  				    ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK);
f4e16143420f40 Ketan Patil 2026-09-03  973  }
f4e16143420f40 Ketan Patil 2026-09-03  974  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
