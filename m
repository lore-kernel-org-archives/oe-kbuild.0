Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304573EBF09
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769375357; cv=none; b=mnkbDbtQUZlXPjsFttEJMianpp4hi4j454mfgoiTjGC4SwnD9x+1fXcJ2wECHGe2W4AjnmEa+i34an3wIGUkqZIdPga4L+lb+f5ykawwDZGtuUpd624jUiPj/RzWDhvPgLxPUBD8a1ZmJJl5JHOZAB/rH3ejRGeOhQ8KQGdc+b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769375357; c=relaxed/simple;
	bh=XWJCXRNcZjJDxCWdOKoM3bqv9wiswnJ7O+QOwcyN/+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NfvYvNnw4UfljbZ0dTrqTKjS8ZUpQRnoc0mLduPCYlbxsViDsOum4wsRvvRlvQHOVeBz++TPOxvbkBZFo2rWMSKtimO00PcZTDRBxVPrnNfE2d54Y946upGIMYFP6+CRtbvS8Y1pT2sWpp8IWXrLArjAQFAFR0GAm2MTuhlQL94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DH4yQRCx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DH4yQRCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769375355; x=1800911355;
  h=date:from:to:cc:subject:message-id;
  bh=XWJCXRNcZjJDxCWdOKoM3bqv9wiswnJ7O+QOwcyN/+M=;
  b=DH4yQRCxr4ScbANbL5//UmG0jRxnWedTrLnfoA5JDd88lx/LjDxGLFc3
   uIGyZwov1X4AVGvGUNQyFJbr295JtVq6RWZT490kr4bAfYLMVukklxG4n
   lu0fWV0/KLlShSBRmwyF9GN5sFGIc5dPdSenclZVDTDuvnQ/7IBQJ9v/t
   nWqfhe6ZK/bgsMDEL6dVGS0VUiHQxEu3NGlmmiOunrBhWXkazzp2goqoP
   FE0UVQQnILdP7SIHM7OfZU9BG9kOgLCUy7bwemqkJICID6/mFkg7CGUtJ
   80dl6ZabIA67s0P5Z1UGI2O6+HVKv5cR8lat617nIh3KaVNY3E/bpgrQW
   g==;
X-CSE-ConnectionGUID: ZwyRpNpHRFic6kvWZrCSAA==
X-CSE-MsgGUID: MrdbUTcQRReczh8TK8nE+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70466803"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70466803"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 13:09:14 -0800
X-CSE-ConnectionGUID: QtjwFSFeQ/uTObHen+xlOA==
X-CSE-MsgGUID: PMcGzgjESKiQ0sNJtIg3Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="212507885"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2026 13:09:14 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk7M7-000000001Mf-0gff;
	Sun, 25 Jan 2026 21:09:11 +0000
Date: Sun, 25 Jan 2026 22:09:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb:
 spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed
 ('interrupts' was unexpected)
Message-ID: <202601252231.eA6enYpy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d91a46d6805af41e7f2286e0fc22d498f45a682b
commit: 57ac6f86ee9ab446e49d7c72eef10b2b44d58f9e arm64: dts: mediatek: mt8186: Merge Voltorb device trees
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260125/202601252231.eA6enYpy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252231.eA6enYpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601252231.eA6enYpy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
