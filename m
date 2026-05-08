Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604582E7F0A
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778263763; cv=none; b=DxvJn7jj0PUOAul2X/SXBkoN6hXjyl/QjK17AZ9PD7dSv4XqX+nW9Th6yjjFT3mJq3SxTMX2xGMJ/spUinWeYuKVT0gM7ImXKtfGUow0spr5DhTsK4ogf+MLXHozQfC3JHlF2iMA9vuv9mfem8mMWTD2ymHCI1Nm+NJwMlPBEzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778263763; c=relaxed/simple;
	bh=kAk1Ea+9xO/G+q7CeGD8XB3KdpldO2Do7sL6F10bSPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IKVZBgZXSAPZnK0HsiLafFbI74+PmSqLbAxSMdK6frC345EMjRtMT3lulc+gQOQfFyOeYqgmx3e6Ae/UiBc7W4CcjV5u6kp46pYLrKaA+zT0MTDCUB3zp6w3/Wjju2h/FSNLqEz6+zsNVKMQuPw2WRktY+xITHfvIWA5DVubFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMC2Tqha; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMC2Tqha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778263763; x=1809799763;
  h=date:from:to:cc:subject:message-id;
  bh=kAk1Ea+9xO/G+q7CeGD8XB3KdpldO2Do7sL6F10bSPY=;
  b=cMC2TqhaKKrwIzncmF1LAhxD1xCrZdlx09Bcjt+/HJKsNYiVS9hCjsmx
   38u3mRXjARz3c+wj/tqKvChQ8EXiQw07ys81WI92+8OnPXuRQb3qR15D6
   OD74ETC1gnPMN32qbG9IoYJ7/xNPC5BmTARfafFbPTj2GNPYacc/zCCOr
   qb/QGxWUBe5qNOUP06idIaOMbJtp6HrOZoL8Wx/gmV5d+rnZ3MqNAfCxY
   OMeIC+c7UdrhlBbgHfk9QMIAVrFozn25Eu6YIK8PtqTMcBeiICId0ceOc
   nO//eQxGYd4gIbl0+q0rPF0QbtkaGRXnn+LWpaAW9rY6TciABgn10wNrR
   g==;
X-CSE-ConnectionGUID: K9/YYCfrRaiOmZHKNX8oYQ==
X-CSE-MsgGUID: LXTcoXRKTzyFYhm4MD812w==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79094827"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79094827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:09:22 -0700
X-CSE-ConnectionGUID: Th2V+Z+GSEG001hwau5eYg==
X-CSE-MsgGUID: aiwDn2wBRQOG9JJN99WRYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236770175"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2026 11:09:21 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLPdW-000000000L9-2A1f;
	Fri, 08 May 2026 18:09:18 +0000
Date: Sat, 09 May 2026 02:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [melver:alloc-token 20/23] page-writeback.c:(.text+0x1d5e):
 dangerous relocation: call0: misaligned call target
Message-ID: <202605090248.Uae2igEv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   60ba32992f2b8fe14ebfd2b719ac54d8dfda000e
commit: f7c64996bf9babb01873974c5c49d16544db23e2 [20/23] xtensa: Implement _THIS_IP_ using inline asm
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20260509/202605090248.Uae2igEv-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090248.Uae2igEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605090248.Uae2igEv-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page-writeback.o: in function `bdi_set_min_ratio':
>> page-writeback.c:(.text+0x1d5e): dangerous relocation: call0: misaligned call target
   mm/page-writeback.o: in function `bdi_set_strict_limit':
   page-writeback.c:(.text+0x1fd2): dangerous relocation: call0: misaligned call target
   mm/vmscan.o: in function `balance_pgdat':
>> vmscan.c:(.text+0x240a): dangerous relocation: call0: misaligned call target
   vmscan.c:(.text+0x25c7): dangerous relocation: call0: misaligned call target
   lib/xarray.o: in function `__xas_nomem':
>> xarray.c:(.text+0xdfe): dangerous relocation: call0: misaligned call target
   xarray.c:(.text+0xe22): dangerous relocation: call0: misaligned call target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
