Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1928C2D0C62
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767506367; cv=none; b=DAju8FBx26FCrYwlsaxpRvRzrZPxoSc6mZ/HghfuS2npaCcx+zuNfZqdOGV2ChLeTdo+coO2SPw5auliTv1ejYZisM/R2OlYzFOFWT4RS8h3szbZby7zIUWJOujzqcDIntAkRe0jtnruW7L1D6g+wqvZH4C4bwXiohN7r0TwNh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767506367; c=relaxed/simple;
	bh=BTH42PuURqzOtAqMpe8bJIkXrSacH3KYwXdbXbBjw0A=;
	h=Date:From:To:Subject:Message-ID; b=O5AIzEHf8GYAqRAQoZPj0cvJAiKnw9OmFlZeI1CepfrU/9P9g9wydEgbpez+1jyQG2b7dSkPfAcT16DaxfuP3iItcQF2ZC5bsCUgcCpp3RJlIC6WFz6vLCvOCzH7Gxces4ySnye+tIJpS0iRTy5X/j7z5Mnl2MyjnsFCOSkuqkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ztvn675W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ztvn675W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767506366; x=1799042366;
  h=date:from:to:subject:message-id;
  bh=BTH42PuURqzOtAqMpe8bJIkXrSacH3KYwXdbXbBjw0A=;
  b=Ztvn675WjC6RYu1eguf1HKVc3Rf3tCKdlxF4TfCOS/3YoVwveHYwOgXX
   ogrXQMLjLhl38mX8t+rzdqDFQnCsoiZUcrAXzngVPqKXUy1uO5BhdzFq0
   wzW1NDX0nMhdq+L/EQhIpqiAhhNyknqmz3bc56OVLpuOiPYZAKbYWTP1e
   i1DIfVQIwr4z1bVzr+SXw89YcnDqzQpHOQ1l+aJpyccg5DjDGwsiQAviX
   952N84k/E8yT8d5yiX3vlfr/Qp3OSz4421NxN8QWQwK2d/UToVeoKtXiv
   cx0qJshfpPXBovEa5Ieol7SRl5C135xrDI72fbsflqu+M0NFobGTXX1j5
   g==;
X-CSE-ConnectionGUID: yYZsXqsVQ06SZHZvBi/9Pg==
X-CSE-MsgGUID: LJGIT8ELQiGjIF33pe/b+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="72773409"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="72773409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 21:59:25 -0800
X-CSE-ConnectionGUID: 0WizEWi0RAy4u32KXNTvNg==
X-CSE-MsgGUID: xH85CMoXSseNIQSxmRWSBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="207157418"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2026 21:59:25 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcH98-000000000ql-33rz
	for oe-kbuild@lists.linux.dev;
	Sun, 04 Jan 2026 05:59:22 +0000
Date: Sun, 04 Jan 2026 06:59:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:wip-aes 38/50] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202601040646.UQDuYFjM-lkp@intel.com>
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
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   d267b9a1525bb945f8936382fd66bd3dc810616d
commit: 3985f6f3e538b81fe76dbc6f86288f5f4e6be660 [38/50] crypto: arm64/ghash - Use new AES library API
:::::: branch date: 69 minutes ago
:::::: commit date: 69 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260104/202601040646.UQDuYFjM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#62: FILE: arch/arm64/crypto/ghash-ce-glue.c:201:
+	aes_encrypt_new(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
