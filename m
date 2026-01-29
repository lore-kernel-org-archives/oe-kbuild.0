Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D12BF3E2
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 04:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769661536; cv=none; b=JzKoOaQryuHucGZi3hIzQVtyACNqb9w6IoYQkfVu5GchsqcIf+e7eudBKD5jglsHVKYZuqjAeMP5M/m87BV+ORJSEhqvjmkd7xIXCEjqbw6HWcE4IFYIYDH2frHF2+J81Do5mvqjD/Wm2m7bVX2qLDAkYFb+Vhv/Q9Cxm2yQrjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769661536; c=relaxed/simple;
	bh=gxpRJLipXD5yO1F2OaqGQyFQn4PuL8en0Lf1Rti6A4g=;
	h=Date:From:To:Subject:Message-ID; b=H2iEyKKfAHwJXuqX36ENqInMz6jUpk4LT/dIcjepABc7kddy2MdLReDzNykdJRmm0ImEbaO07BvtRDDro5QK1wxt0TUau69nRd1NTdzDzUxiwZxqJHs8/JEawa40ISZk9xHlEZ6S+8Gt0Qed2FW2dXTR5A7h55HSaaEyubf2uME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbP1Byoy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbP1Byoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769661535; x=1801197535;
  h=date:from:to:subject:message-id;
  bh=gxpRJLipXD5yO1F2OaqGQyFQn4PuL8en0Lf1Rti6A4g=;
  b=lbP1ByoyZV8E/IweGOIus0tCO9P2mvDsNCw4ilG/ZN/7Qcgm71Rzc4rf
   9V3+dX9hT4oAX6K20geDr++PrgUTUW3IZIoyAEOKgYipW84gXtWp3tqLy
   kzRHJSkJMiSux+wu26bRBWjbU688Jdmqbl9KedVC1CNN+jfTXj/6tV6N0
   OeWCpc7xpw/jvfU+TWSaVHfAyofSUEZIjaVqlkCq9jSif/GaljV+FWeMY
   UazSJSA2qAjS1CV/Qofn8qTVbpn/EFPxEP4w6wSZxg5KhMskTNtR8au+F
   GKZHJpn1zNx0hcra/h4dg+mSmYOjztY0vmup9wbk9p2UqNZmIu/e4OibA
   Q==;
X-CSE-ConnectionGUID: XdlE9MqHRW+9Q2uDKPV5Hg==
X-CSE-MsgGUID: kvyH6GWiS2Wxm8JTASn0iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70792435"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70792435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:38:53 -0800
X-CSE-ConnectionGUID: 2KQ2mMwySWKdr1PG8lwqag==
X-CSE-MsgGUID: 2a1Glo+ySA+cr1CXXjp0qg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2026 20:38:52 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJnu-000000002CV-3Oyg
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 04:38:50 +0000
Date: Thu, 29 Jan 2026 05:38:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 27/39] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202601290528.i8ePIkMQ-lkp@intel.com>
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
TO: Richard Kuo <rkuo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   64417972b86f5eb0d4a466436b1fb43da5692dd6
commit: 777ab20a32cc0979882c4bb9f92b462743c71902 [27/39] hexagon: add SM8150 platform support
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290528.i8ePIkMQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#164: FILE: arch/hexagon/boot/dts/sm8150.dts:126:
+ * each time we hit a key.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
