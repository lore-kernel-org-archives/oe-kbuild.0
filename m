Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B6D523A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231640; cv=none; b=bnLQm4tr0fLtbtyEcE4OW5dVlHhVeTfIoPlFrzvejTWg9EYHGmj085pbiyYDCswSZ1X8vsAg9FJiUBJFgHW1zW8BYLMYdMJrXHnDnT94w0/WeM++DE2tN4/uOB9U85kFxv2R07l3ecYZQFFx9Sq4Xe4fl/TjUfIZoi25kPhGVoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231640; c=relaxed/simple;
	bh=+i3iOS72dR8JEc/Xzlhdc2TaNGNnWDdVIzzM/fa2M/s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIKYObObrccVoSz6uqXUidUjHdV2/HNuuMIKb6jrcraImPnoalBJ2dmIruc78J0cDXqsDHqjp55Yh1+CCZ1HgRa3lEQ906ktNCDJ0D19lbGt/AaMLX6qOMHTkH1xQyZkq4De1x8XjQPWNCuIRjHuzaczlumfGw6fV9uy9RPT4lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QArVxVIO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QArVxVIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764231637; x=1795767637;
  h=date:from:to:subject:message-id:mime-version;
  bh=+i3iOS72dR8JEc/Xzlhdc2TaNGNnWDdVIzzM/fa2M/s=;
  b=QArVxVIOljgoFSbIHYESrEP3EeekAWp4xDQ1DLWuhODNEDUxNktW8h8F
   aQPbiVmy84jfNaTnYtLNa1vAj9mTEaA99s9s2rQiHg1Lmt9XKEWpJxyNl
   VX0lCkfDMwzyLXVvgUlSTgUVGdvlHtlIzUji72SySTrsKU2ic1FTdNMJz
   xaO1FcZD0m5sHz+W3CaUYcmqjoqyzt4T9u1CCwnofAssOlNparAhZkX2X
   vLfKNbfYraw4hDuCTzikKe0F4//PGqoEzwWbGf7CcXZ0fpq7pVWDCbUbM
   KSf3mgUptvRxblKqzV7H5BmfMGu/mrLbrH57eYidzDgEFiPURRU+Mc1GF
   g==;
X-CSE-ConnectionGUID: 0/LxrNm9T1ykaxuyuYbBjQ==
X-CSE-MsgGUID: TbCTiTgnRXGHQIOdN6COfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66309024"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66309024"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:20:37 -0800
X-CSE-ConnectionGUID: bY6x0cbwRCu1riigGteOKw==
X-CSE-MsgGUID: +5ShDJUjRk+8/eqaWj5sSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193194106"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2025 00:20:38 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOXEx-000000001gP-0RPW
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 08:20:35 +0000
Date: Thu, 27 Nov 2025 09:20:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ebiggers:mldsa-v2 40/40] checkpatch: ERROR:SPACING: space required
 before the open brace '{'
Message-ID: <202511270952.ZbGHUW9k-lkp@intel.com>
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
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git mldsa-v2
head:   3a704d18c0f4d9e9d87fbcdc3e43ee8d1715598f
commit: 3a704d18c0f4d9e9d87fbcdc3e43ee8d1715598f [40/40] lib/crypto: tests: Add KUnit tests for ML-DSA verification
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270952.ZbGHUW9k-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#89: FILE: lib/crypto/tests/mldsa-testvecs.h:8:
+		(const u8[MLDSA44_PUBLIC_KEY_SIZE]){

ERROR:SPACING: space required before the open brace '{'
#239: FILE: lib/crypto/tests/mldsa-testvecs.h:158:
+		(const u8[64]){

ERROR:SPACING: space required before the open brace '{'
#251: FILE: lib/crypto/tests/mldsa-testvecs.h:170:
+		(const u8[MLDSA44_SIGNATURE_SIZE]){

ERROR:SPACING: space required before the open brace '{'
#528: FILE: lib/crypto/tests/mldsa-testvecs.h:447:
+		(const u8[MLDSA65_PUBLIC_KEY_SIZE]){

ERROR:SPACING: space required before the open brace '{'
#749: FILE: lib/crypto/tests/mldsa-testvecs.h:668:
+		(const u8[64]){

ERROR:SPACING: space required before the open brace '{'
#761: FILE: lib/crypto/tests/mldsa-testvecs.h:680:
+		(const u8[MLDSA65_SIGNATURE_SIZE]){

ERROR:SPACING: space required before the open brace '{'
#1137: FILE: lib/crypto/tests/mldsa-testvecs.h:1056:
+		(const u8[MLDSA87_PUBLIC_KEY_SIZE]){

ERROR:SPACING: space required before the open brace '{'
#1429: FILE: lib/crypto/tests/mldsa-testvecs.h:1348:
+		(const u8[64]){

ERROR:SPACING: space required before the open brace '{'
#1441: FILE: lib/crypto/tests/mldsa-testvecs.h:1360:
+		(const u8[MLDSA87_SIGNATURE_SIZE]){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
