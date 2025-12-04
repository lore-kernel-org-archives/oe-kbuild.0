Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA42D4816
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764867289; cv=none; b=QrAWbAS5XECX3OlKyqn8KZA+nW9PTxToaDf4IFjXTZ3xqKha/uBgc2Iym31+xzXovtWPcQBE9uhvvItQ1Kbm1qDVB579EwM7bjeCUzWcpl05ZyCgSROF8lMp2HkG0y2+F8Bw22BMqukJBfB8M6KRCXChQDc7iprtGpOJ4IUFiOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764867289; c=relaxed/simple;
	bh=NzHTSO6DxCMczAsXWKFNl8d9R6Jbokml2Q07X6yCXnM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YeDleIkE1E7J2fzVsuz0Gqx/CNit/qSg3K1s2vYdhAC/iWXH7Axfd61MezKpVXQxPWP6aqE97TgzoIE4vd0txkgl1FtlxdDzcuzYXJVrFkL4isaI+LfbWfZa0XNLuTYwr/kZmnRuFKwyGyxBXOB9Fr0g8a69t2gjrRQAVZMH8qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jk98+ylR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jk98+ylR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764867287; x=1796403287;
  h=date:from:to:subject:message-id:mime-version;
  bh=NzHTSO6DxCMczAsXWKFNl8d9R6Jbokml2Q07X6yCXnM=;
  b=Jk98+ylRv9AKr0edpdsrpB3esmlQ+URIc5dqRYtWnEZGTJJJROv1jvI/
   cTiDL553pTyB4PPXEaf0zi3mEglTHpg4smXitGTiNmN903gxwr6asKjz6
   eFtsJFvuPnnyxE+hWuRFPv3Uz44o7lIfRer4r1SmdUc2ZDxgZRIYCdeFu
   jYANATa7gPKzlv3rfd7kRzNIQBdjRNFlhN2fdQ6W71nnXjIBuZ2sEfYQg
   TPOllWW+oEXpfk4Lot1LdVKuz6pQt1ExE5QRCTNXcPvw4GG7C5PUX3//q
   xS4QufvbJksnFWe4RvwHtE9CVqgJoq48YL0FnK2cN6GY6mVaGf8Jxsj7I
   w==;
X-CSE-ConnectionGUID: 1N1RUK7LTia4nN6tWId3jg==
X-CSE-MsgGUID: DX2sSntZTxORNnGDLtF0lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70512793"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="70512793"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 08:54:46 -0800
X-CSE-ConnectionGUID: Otq8hCHxQsaFxFN0MmwKJA==
X-CSE-MsgGUID: ILIUu8YeRJSfXYO3qOJ0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="195069971"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Dec 2025 08:54:46 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRCbL-000000000nT-30Rk
	for oe-kbuild@lists.linux.dev;
	Thu, 04 Dec 2025 16:54:43 +0000
Date: Thu, 4 Dec 2025 17:54:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/feat_idst 9/12] checkpatch: ERROR:SPACING:
 space required before the open parenthesis '('
Message-ID: <202512041734.taJl59Rm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/feat_idst
head:   92bd1b758cb4081fc067949c3b20fd3fb5378e9c
commit: 4928f3e0c432730e686f68af26de25ae183c2c81 [9/12] KVM: arm64: selftests: Add a test for FEAT_IDST
:::::: branch date: 4 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251204/202512041734.taJl59Rm-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#64: FILE: tools/testing/selftests/kvm/arm64/idreg-idst.c:31:
+	} while(0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
