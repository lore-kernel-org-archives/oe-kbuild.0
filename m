Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5A1E835B
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 05:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755064267; cv=none; b=sbMK+qsMdLiCl0g+gzLsxI64iqXNu9kE6qUXTi1vTmZ2cd4fEo8Xl6wV30Yy2gNUulRuZaA7VohLuJbZ9bSETjmlynbZtgbDLzcfr01Ek6Je0PAKnLemMDdbAXl1AC7Ax7wkh0kxGiAsze4cTE3vP9l0WAKSnWSw3RhDkHqR79Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755064267; c=relaxed/simple;
	bh=/gzqnPEiXo9Si6dLaggUUK2u2i9L/GQSOAHijA5lV5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XK6kw/Xm70PA0GO7AeCRZ6wlb+gvcY3KRXjxkVS9r3Lkb9Ljir91hQGCxuzoN5CEMLXREbRi6gU906sPZb9FGEQl3cX4XzsDDPN2LM98zx7vVkv339WWVDCEAQUxayC8oP1mGR+yyDW6FlclbZYWAFQOKmCVLfw66xDTOBk1yac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBQgcyV5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBQgcyV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755064266; x=1786600266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/gzqnPEiXo9Si6dLaggUUK2u2i9L/GQSOAHijA5lV5k=;
  b=fBQgcyV5m9F6ZrCIqbtU7f0Z5bhxFlN/kCJZE95GTQCIlP2UeyVkOCO/
   snasgJnNOtZTPi3JJgEtz8ifoXZpgIi2jf3BxnDVW3VDg+WjuUgeV+F06
   ju0A1I0YHxuSRw2w+7etfaDlr5btsfK4HGQoNuAVDJf1uAvf2a65j0fZZ
   wG0LnxgiSADHzVra58t/8lKdAQEEAI692ICUsqsa82keh08FAVZS7b0Bs
   hkZ/Lkd06NWLJAPc5lxTWDFgtwY+DvBJvrKOA3dUTMTQ67F/F4qo/8Irc
   vvc1zu55QfBuZFCEbQSyAu96GxzZejuGs3vVHrvFw1wS+RRGfgf2l3JkR
   A==;
X-CSE-ConnectionGUID: luqtkEjpTgqI+i83y3ZEdg==
X-CSE-MsgGUID: r/dh6LLISN6lO7yuknIu0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57307630"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57307630"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 22:51:05 -0700
X-CSE-ConnectionGUID: ek1xQ3DbS0emNHoN5k3/Yg==
X-CSE-MsgGUID: YpWyJKmeT3uRrzsW82cgaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="190084806"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2025 22:51:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um4O5-0009Zn-1s;
	Wed, 13 Aug 2025 05:51:01 +0000
Date: Wed, 13 Aug 2025 13:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 70/103]
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: camera@10
 (ovti,ov8856): 'clock-frequency' is a required property
Message-ID: <202508131309.WKiwe9kz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   77abf70ee126d40dba9ada0a4ccb4c7743f6a3e6
commit: 5433560caa5e7e677a8d4310bbec08312be765b4 [70/103] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
:::::: branch date: 13 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-051-20250812 (https://download.01.org/0day-ci/archive/20250813/202508131309.WKiwe9kz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131309.WKiwe9kz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508131309.WKiwe9kz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: camera@10 (ovti,ov8856): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
