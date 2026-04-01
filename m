Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742E7364939
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 02:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011876; cv=none; b=WtpXvUeG+WjOOFn4X9LxmdS8qgq8+iANm8H5uLzCbO3oavEJTzSGyvc9/BLdRz4l/zDJc9jOs1WPrfv7RkR0FA7EmmqC/r6VlDWEitP8xSJhtmK/xoozp8KawHn8pIb7p63uriuvYcS+J/g8f0rzx3OWqYSqA+HXYhYTIWiraME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011876; c=relaxed/simple;
	bh=C80/x05OjfWQgsWyQn7s8bdZOj4AnDnb6Ky/ffFPrGc=;
	h=Date:From:To:Subject:Message-ID; b=LtJquKK9lMH/8x9qp+rqjTzh6lVfE1tW0s7bKU0+VUmudZypzeVE+YMVY6VpEnNRGxbvsN6ycggF22UBxL5Fyb6NwEPW0ZZ0AiAKt2QQKKOnNx/cOSkzw9GRFa25CtFkb8Ux4aLAWmhzVyDLh6ms1Oqems/wpYtX6zcPejpKJWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfBVTTfG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfBVTTfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775011869; x=1806547869;
  h=date:from:to:subject:message-id;
  bh=C80/x05OjfWQgsWyQn7s8bdZOj4AnDnb6Ky/ffFPrGc=;
  b=HfBVTTfG0g+uXJk/16+fcDq6W/96uqAXF8UqZB9yJv+xihmq3xncvnzd
   riNEThLqJDQ5NdAs3/CfWK4OKrWPHkBs/etzLtq50PT9/MNkulox1vLuk
   jluC96CiufyMfjUFoUxEACiDfNx1df3yg+Nl+zMNYQhOixXJryUE/89Le
   qCq0Z1ZmTeZrAGluzwhuka5xvcssyjYPFNCj5u+TqBVU94urcmh8j2bs4
   L3XRhW8siqgn2cXpDDVU8hijRGL6bqeXuLXMvfw4AVjwQdaNpEtiSzR4x
   O9kNNj+pqupeZAo6VUt5Wh6kZuF+vwzm71hXPC3fK9p+YGMabaRLXk4AH
   g==;
X-CSE-ConnectionGUID: jvNT3ujvR92qduCgOcOsRA==
X-CSE-MsgGUID: AMWYtiftTyigg7/pnq+lDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87432740"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87432740"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 19:50:57 -0700
X-CSE-ConnectionGUID: l/KqtPYaTraLIzVVqW7EPQ==
X-CSE-MsgGUID: PdUAaLgWRxyq47JSW49I+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="230963930"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 31 Mar 2026 19:50:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7lfS-000000008cn-0ZFT
	for oe-kbuild@lists.linux.dev;
	Wed, 01 Apr 2026 02:50:54 +0000
Date: Wed, 01 Apr 2026 04:50:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sunxi:rk3566-fixes 23/45] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202604010447.smEp18W2-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wens@kernel.org>

Hi Chen-Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git rk3566-fixes
head:   88c30b25038ab72d9c90ad65bd86013033ef0fa4
commit: dac475740a70ed80592ecf403edefe57195f7955 [23/45] ASoC: sun4i-codec: Sort sound related #include statements
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260401/202604010447.smEp18W2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#6: 
Some the the sound related #include statements are not ordered in

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
