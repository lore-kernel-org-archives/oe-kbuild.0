Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483357;
	b=IrNfUd4SM6bykrHIoAicwzBFG2eX5ErsJ1ZlTTtc42F7sNnr/8/1F0t44Y831BWYiHcZ
	 xojFgD/qH0u4HdWAD7mnM+WgbWjy4rSzQV+Sa1dnAymaEDmSXukRwjns9JqZ0bxOgno3O
	 clm41ExbypkOplbidpKGnLvYd3XAv2rOGD27O7rqKhs+KYQOAZE6Fnx7+W2GPqzbcdy5i
	 3ozyZqF0A0X+oodZIFXnmTcgNLs5b/05rKbBkQme/0YTdZVC6Bak1jRjTtU3Zyh7S7uc+
	 q3ayaW6HHRK7jti24AlkSWrw0a73aESWd8bQZBKx25wsqvF+B0onE6r4ga/7W/rlYuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483357;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aM2el89ioWQFvX3a+9eyJ9y9kN6dWjeRqFOhWlGwuwc=;
	b=5nBuTOdo9jsx/fw62erEbEbdjPNPP/in8BP/DyEanJIfbuBhvQywdi30DLybQ+kGS9Hf
	 f1HBsWWJ9zvV5bbVJr7AjBPitOSPHiGS6AIOiEPVArTIH2e/sz9hWrMCQLKxwQhmeZd5P
	 6tlROgviU7wvqZOTEzh7RdRn++BZDttNB9KzfDzN1j1rTtM5RjnfTIyVU2R1k3HkI/tRT
	 JDw7wYP0S/aXyNV7DX7LeNNdliEePfHtmJ65HoxesrvlWGb6qaikx9jzutFbQtCkrg5l8
	 goNr/Cq9rgUwtAblrbLBZDBdj+F5S193h5CD3K4EWf0FVsgLqjhuXAuJuuTRh88usgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fH0I8V4M;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D10606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 08:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fH0I8V4M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792483355; x=1824019355;
  h=date:from:to:cc:subject:message-id;
  bh=BAuo7Ma55W3UgJKjfpLWZrP71h9RJEKztXjCbOcFWlo=;
  b=fH0I8V4MCLRDSxuSmydqUA1A+hHrArJX5WJmxSP2D+Bd4y9rnG8y+cf0
   IxPEPVde8oH/b3N/SsXzGlPiRw17/lc4NFUyNyFrczi/o32qTUHEByVGM
   OnwT7mtYhXgTXimepCNnRHndq18zpn63vw1sTRiTAtPZ1iX2ErlpYkqOm
   DBGM5R6dhXMiNkDyiIyMoCxJ/O3icwD8SSidqXwz62QDg7pClLZrUvp5d
   PnHfczWbbhhG3P/kOwhTu4vg7y7wkrU+Z+UntcWe+MG2l65lqK7gqPiKW
   babyOcFkeWuDJD+QYAaEIlpBwXNiK7S5IZ73AeOJ0eY2iCkXXH4G4bRgF
   A==;
X-CSE-ConnectionGUID: 5KgpUbc1TTeBRGU1P6sNwg==
X-CSE-MsgGUID: p7OrcCyPRL2kESgUYdyEvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1195769"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1195769"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:02:34 -0700
X-CSE-ConnectionGUID: axzeiiybQUKrC9SB5JePbQ==
X-CSE-MsgGUID: 7GbWGzZIT7mlZVBXMqpUiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2758732"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2026 01:02:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ4nm-000000006B7-3hbF;
	Tue, 20 Oct 2026 08:02:30 +0000
Date: Tue, 20 Oct 2026 10:01:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 16319/17742]
 drivers/gpu/drm/xe/xe_hwmon.c:1344 xe_hwmon_temperature_decode() warn:
 impossible condition '(value > ((~0 >> 1))) => (s64min-s64max > s64max)'
Message-ID: <202610200910.SP0zWbkd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Karthik Poosa <karthik.poosa@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d229ce89862b8e82d71a9e11d6f840ca272a6d6
commit: 24ec15d646179a255f314e404343bf8e3200c9c0 [16319/17742] drm/xe/hwmon: Decode CRI temperature registers as IEEE-754
:::::: branch date: 14 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-r2202-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200910.SP0zWbkd-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610200910.SP0zWbkd-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_hwmon.c:1344 xe_hwmon_temperature_decode() warn: impossible condition '(value > ((~0 >> 1))) => (s64min-s64max > s64max)'

vim +1344 drivers/gpu/drm/xe/xe_hwmon.c

24ec15d646179a Karthik Poosa 2026-10-15  1296  
24ec15d646179a Karthik Poosa 2026-10-15  1297  /**
24ec15d646179a Karthik Poosa 2026-10-15  1298   * xe_hwmon_temperature_decode - Decode an IEEE-754 temperature register value
24ec15d646179a Karthik Poosa 2026-10-15  1299   * @reg_val: The raw register value to decode
24ec15d646179a Karthik Poosa 2026-10-15  1300   * @temperature: Pointer to store the decoded temperature in millidegrees Celsius.
24ec15d646179a Karthik Poosa 2026-10-15  1301   *
24ec15d646179a Karthik Poosa 2026-10-15  1302   * IEEE-754 single-precision format:
24ec15d646179a Karthik Poosa 2026-10-15  1303   *
24ec15d646179a Karthik Poosa 2026-10-15  1304   *  31 30                         23 22                         0
24ec15d646179a Karthik Poosa 2026-10-15  1305   * +--+-----------------------------+----------------------------+
24ec15d646179a Karthik Poosa 2026-10-15  1306   * | S|          exponent           |          fraction          |
24ec15d646179a Karthik Poosa 2026-10-15  1307   * +--+-----------------------------+----------------------------+
24ec15d646179a Karthik Poosa 2026-10-15  1308   *
24ec15d646179a Karthik Poosa 2026-10-15  1309   * value = (-1)^S * 1.fraction * 2^(exponent - 127)
24ec15d646179a Karthik Poosa 2026-10-15  1310   *
24ec15d646179a Karthik Poosa 2026-10-15  1311   * Return: 0 on success or an error if @reg_val is non-finite or cannot be
24ec15d646179a Karthik Poosa 2026-10-15  1312   * represented in millidegrees Celsius.
24ec15d646179a Karthik Poosa 2026-10-15  1313   */
24ec15d646179a Karthik Poosa 2026-10-15  1314  static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
24ec15d646179a Karthik Poosa 2026-10-15  1315  {
24ec15d646179a Karthik Poosa 2026-10-15  1316  	u32 exponent = REG_FIELD_GET(IEEE754_EXP_MASK, reg_val);
24ec15d646179a Karthik Poosa 2026-10-15  1317  	u32 mantissa = REG_FIELD_GET(IEEE754_MANTISSA_MASK, reg_val);
24ec15d646179a Karthik Poosa 2026-10-15  1318  	s64 value;
24ec15d646179a Karthik Poosa 2026-10-15  1319  	int shift;
24ec15d646179a Karthik Poosa 2026-10-15  1320  
24ec15d646179a Karthik Poosa 2026-10-15  1321  	/* Exponent 0xff encodes infinity or NaN. */
24ec15d646179a Karthik Poosa 2026-10-15  1322  	if (exponent == IEEE754_EXP_SPECIAL)
24ec15d646179a Karthik Poosa 2026-10-15  1323  		return -EINVAL;
24ec15d646179a Karthik Poosa 2026-10-15  1324  
24ec15d646179a Karthik Poosa 2026-10-15  1325  	/* Subnormal values are smaller than one millidegree Celsius. */
24ec15d646179a Karthik Poosa 2026-10-15  1326  	if (!exponent) {
24ec15d646179a Karthik Poosa 2026-10-15  1327  		*temperature = 0;
24ec15d646179a Karthik Poosa 2026-10-15  1328  		return 0;
24ec15d646179a Karthik Poosa 2026-10-15  1329  	}
24ec15d646179a Karthik Poosa 2026-10-15  1330  
24ec15d646179a Karthik Poosa 2026-10-15  1331  	value = (s64)(mantissa | BIT(IEEE754_MANTISSA_BITS)) * MILLIDEGREE_PER_DEGREE;
24ec15d646179a Karthik Poosa 2026-10-15  1332  	shift = exponent - (IEEE754_EXP_BIAS + IEEE754_MANTISSA_BITS);
24ec15d646179a Karthik Poosa 2026-10-15  1333  	if (shift >= 0) {
24ec15d646179a Karthik Poosa 2026-10-15  1334  		if (shift >= BITS_PER_LONG || value > (LONG_MAX >> shift))
24ec15d646179a Karthik Poosa 2026-10-15  1335  			return -ERANGE;
24ec15d646179a Karthik Poosa 2026-10-15  1336  		value <<= shift;
24ec15d646179a Karthik Poosa 2026-10-15  1337  	} else if (shift > -64) {
24ec15d646179a Karthik Poosa 2026-10-15  1338  		value >>= -shift;
24ec15d646179a Karthik Poosa 2026-10-15  1339  	} else {
24ec15d646179a Karthik Poosa 2026-10-15  1340  		value = 0;
24ec15d646179a Karthik Poosa 2026-10-15  1341  	}
24ec15d646179a Karthik Poosa 2026-10-15  1342  
24ec15d646179a Karthik Poosa 2026-10-15  1343  	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
24ec15d646179a Karthik Poosa 2026-10-15 @1344  	if (value > LONG_MAX)
24ec15d646179a Karthik Poosa 2026-10-15  1345  		return -ERANGE;
24ec15d646179a Karthik Poosa 2026-10-15  1346  
24ec15d646179a Karthik Poosa 2026-10-15  1347  	if (reg_val & IEEE754_SIGN)
24ec15d646179a Karthik Poosa 2026-10-15  1348  		value = -value;
24ec15d646179a Karthik Poosa 2026-10-15  1349  
24ec15d646179a Karthik Poosa 2026-10-15  1350  	*temperature = value;
24ec15d646179a Karthik Poosa 2026-10-15  1351  	return 0;
24ec15d646179a Karthik Poosa 2026-10-15  1352  }
24ec15d646179a Karthik Poosa 2026-10-15  1353  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
