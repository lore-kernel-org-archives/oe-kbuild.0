Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9651F495E5
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Apr 2026 01:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776993539; cv=none; b=baHfZmR9Jrm19q0YIlrSadC/1Efy6bdhouXKljbvtvYH+ZZNFx+II7064o+jQbzCfSilMhx20+IJEpMbM1uk09EBNFv/CKnjyMq0KTLhk2MYMuWORv1AB8s4zSvgelHfrcF8+d8VvJ6krTPpB1vgUTfD7IhaTE9mjfG0CTpj77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776993539; c=relaxed/simple;
	bh=HS4gkUM2TabsgJtz/99ZL4zt6I7rd+JSh2+uK5szUpE=;
	h=Date:From:To:Subject:Message-ID; b=MZB+gC38rn8ISbo7/y9+9hxA/1Qi8wD/EbE08sMzNrLffaMycVjBdMRG/O0ZrguoHjoggdgPc9lP2JhZsTzfoYQfjzdyVx4LbSDI1tsXGdJ45BNxbUDQtoVMt9Yz58pIjUMIXEnzn8MQTirdQsw9ptzU/CitRHocZVlCZQGwWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8qlmFNM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8qlmFNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776993537; x=1808529537;
  h=date:from:to:subject:message-id;
  bh=HS4gkUM2TabsgJtz/99ZL4zt6I7rd+JSh2+uK5szUpE=;
  b=m8qlmFNMNkiXUbiwVSXxx4PJVtcNDCF/AkUeXqS27LTSXG/Ppu/gkN/D
   r4UbpwwxrC241vLV0/yk4PxVce1oqudI2RrVC3ju/qomZyPzsN8ip7yav
   NPl/i3GKXx5zTXQTbdCZqje1p+UoLdwx0cjtS1h5vSzIdHQk2MZ2abMcw
   ALMfpaiD8KFwlhz8zNqT5+wvjyaeGuFmSSlxFQGvMPiDSn9wUrZXhrHiv
   OjqYgFO8CKKZ9vB52U/UeYlGkRcJCYsg7hmIQ8l/nLXIppzzEWqjvZI/5
   yNhRt7WkT+DTb9T+HoY/I7Re6LVJjIm4gyTCoVmPfY+hZ/aA43oaR9Cjn
   A==;
X-CSE-ConnectionGUID: UCaeKJaXQWK5F4gWF6fWjA==
X-CSE-MsgGUID: mbgimoIyRsmHTgs2jKVOdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89355050"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="89355050"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 18:18:57 -0700
X-CSE-ConnectionGUID: 1vOXcuVKTnmxRJoBMEsF/Q==
X-CSE-MsgGUID: P5ElArWuQfqfprBsE9DUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="236795890"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 23 Apr 2026 18:18:57 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wG5C2-0000000039Z-1y8P
	for oe-kbuild@lists.linux.dev;
	Fri, 24 Apr 2026 01:18:54 +0000
Date: Fri, 24 Apr 2026 03:18:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 33/38] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202604240331.gFi878yC-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   1a109da5277330884ac98b001574ea9909c6b2d6
commit: 2524b46b2df6f10873cf695a81e6bad65376090e [33/38] bcachefs: alloc: convert alloc_request.trace to DARRAY_PREALLOCATED
:::::: branch date: 61 minutes ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260424/202604240331.gFi878yC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#317: FILE: fs/bcachefs/data/ec/create.c:1759:
+		bch2_bkey_val_to_text(&msg.m, c, bkey_i_to_s_c(&new_s->old_stripe.key.k_i));;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#319: FILE: fs/bcachefs/data/ec/create.c:1761:
+		bch2_bkey_val_to_text(&msg.m, c, bkey_i_to_s_c(&new_s->new_stripe.key.k_i));;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
