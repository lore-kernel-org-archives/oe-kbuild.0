Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB5320A02
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770070063; cv=none; b=rI3Vhmjbg96wE2hcw//+r86FmMQYoz5ZnP/i2ygbCRdachiftf1pTTKV2r2MNhsiLVOIVP8uuUa/4sfXiC0sZfAqtSlvx1XZ8AAECL3o7rMQv8lATeuiJS225cGxrF7y1F3oF404awIBq2Si+Fnyv8h1X1UOru/69IX+52Jek6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770070063; c=relaxed/simple;
	bh=FfsM64vu5YRKJJ4r2tvCEZaLCwLuRaI0DgA6fkW/s+w=;
	h=Date:From:To:Subject:Message-ID; b=a0+PgTThZ3l+A8RZGOI/3UTCl3b8QNL3K5Ibi62ChP2dp4kQruEvClI0GIAVTbfUWYUMZlG504TXJ+GaTgp0x8G6Dx3IHJXoTVxqEX+5RvP7rYiFrz+xIUNorXGyOOACqc/aw5laTue2pPkuk1nASSADVpVzBvOppCHAP9NqDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYiJB1dn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYiJB1dn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770070062; x=1801606062;
  h=date:from:to:subject:message-id;
  bh=FfsM64vu5YRKJJ4r2tvCEZaLCwLuRaI0DgA6fkW/s+w=;
  b=GYiJB1dnpKW9W8yV5D6j2pXtANZWkF/ebr8PXU6Z+NzgLebQWwZNJfhU
   NSzG1FtNG5u7LvVCa582dYOafEv5Nj1GIJgDXcVI2OhSExE4KqfooDvPT
   hRvlqQ9YR7cbe39QlymNFvEgP1m1KKMy/cO52L4npmw9VOc8NBGExGeTI
   C3aFelndJisvHjUL3wHl/ml5MhsWuCh34vj1yiWdMZsof2zN8X8Yl3BLt
   PsATLp+lG6MOKPQVkmWlt2sZvovUXpnu6Bx7G2ShFmgQKHs1CKih289rn
   7jlCPC5eh5tJFD2AAqKpl+CvlwGD+RaU+Vb5UZqLk+fKPfuoEJsCCG4jU
   A==;
X-CSE-ConnectionGUID: X249oenZQaq+efoEac1riw==
X-CSE-MsgGUID: KbBLFN1tR3KwyejGyGjsYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81975373"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="81975373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 14:07:41 -0800
X-CSE-ConnectionGUID: YAwfCrk+Si6PDnFMKgUlCQ==
X-CSE-MsgGUID: UwYX/IhURPe0Mh/irCoCxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="240323822"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 Feb 2026 14:07:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn253-000000003D3-2jS3
	for oe-kbuild@lists.linux.dev;
	Mon, 02 Feb 2026 22:07:37 +0000
Date: Mon, 02 Feb 2026 23:06:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/pmos-fosdem26
 8/23] checkpatch: ERROR:SPACING: space required before the open parenthesis
 '('
Message-ID: <202602022315.glAVk8rW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: KancyJoe <kancy2333@outlook.com>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/pmos-fosdem26
head:   5120936633b5138a0543b06adff90d3c8312b965
commit: 7b10393571cd5423d6db9fef7d89da43a8f0d331 [8/23] audioreach: Add dedicated WSA2 support.
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260202/202602022315.glAVk8rW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#31: FILE: sound/soc/qcom/qdsp6/audioreach.c:719:
+	if((intf_cfg->cfg.lpaif_type == 7 && cfg->num_channels <= 2 && intf_cfg->cfg.intf_index == 1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
