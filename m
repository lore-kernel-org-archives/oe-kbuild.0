Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133271B78F3
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 01:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769997094; cv=none; b=K1Ih0SS9+K4KSc+1ozoG4FxPz86MsuGQKgL7nGKY3ncfvWwh8WAXEGgkuz9L34BaVRAD9LKCqwvfMJKXo455woL9sLyli23dnSWVA9PtgZpM6TL2ON+CUbFgXfjB6rZ/7Oso6OBVlhLbvnyXg9887RrkXGQ+W7kjVrbDHIgFyN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769997094; c=relaxed/simple;
	bh=ruDoyAPbeoZTQA8yWVgVwNvlbz5mpFbu2mFsgvxp+/Q=;
	h=Date:From:To:Subject:Message-ID; b=s7/f+aEW3mm4kRfCnJ7aQpBd8XvLOPdyfpfo7iVm02HigR4aFtZCVcQespe8XsxV3EDfY98L0LFDHG0UzU+bvb8UM4jzCwXtp2KwryurOLkKI84x93rmRfmqnBvMnXBp7dh9+570A+CZcPeNuAtOTN3nmePOjbFeBaW2MKOjwoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNAOhEFp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNAOhEFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769997092; x=1801533092;
  h=date:from:to:subject:message-id;
  bh=ruDoyAPbeoZTQA8yWVgVwNvlbz5mpFbu2mFsgvxp+/Q=;
  b=XNAOhEFpy2xLfHn/RFaglelnlfA8X72XrpkSA+pK9tWDAlnYeGejb9Fs
   A4v8q8SVCCEp4EYwevHbHXEK0cekS43Df6XscLsIHpGyp/ryRQgaGS3r1
   8JDoKB0gdwum/bLor5VJL7Q0z+QspdI21QgnafFonSSxuw1eWhVhU8VcV
   O9u0KLmsmqulQWtM22RUosxcSuX8TuV9VLk2JI095bVJTnm8cprFmzqyi
   BeZT0bXa+LFxgKdMFjejCUn4ZqtqO64J+ywMuCW8td7QQYbAuK8JVDbOa
   KHsTkvVkeVwrcWMtmdjYbluBb6hChzffOZkfCIb3X8y3Pvpx9/bw/8ngQ
   Q==;
X-CSE-ConnectionGUID: Ll4jYV4iT/SKHGHQSH/Kvg==
X-CSE-MsgGUID: DgqcSrxfTZSvLptafy5oDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="88576139"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="88576139"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 17:51:31 -0800
X-CSE-ConnectionGUID: Tpb5eHzyQFagA0lQmEn3pQ==
X-CSE-MsgGUID: t6EtR6iJTGyyWCSvO6WpOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="209177749"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2026 17:51:31 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmj69-00000000313-07Cg
	for oe-kbuild@lists.linux.dev;
	Mon, 02 Feb 2026 01:51:29 +0000
Date: Mon, 02 Feb 2026 02:50:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 309/312] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202602020206.6kOrHsL7-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   8120907bb9d05d3886c8fb1c72e0e986d388c818
commit: 7cf869ef9cf8fe1bd368aea1e36c62fc5eb1ba71 [309/312] bcachefs: bch2_stripe_repair()
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260202/202602020206.6kOrHsL7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#162: FILE: fs/bcachefs/data/ec/create.c:1507:
+			bch2_bkey_val_to_text(&msg.m, c, bkey_i_to_s_c(&new_s->old_stripe.key.k_i));;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#164: FILE: fs/bcachefs/data/ec/create.c:1509:
+			bch2_bkey_val_to_text(&msg.m, c, bkey_i_to_s_c(&new_s->new_stripe.key.k_i));;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
