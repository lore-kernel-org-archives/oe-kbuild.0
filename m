Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885709;
	b=MR1cPcBuWqeT3/SYQSy7tGAq7zXJqRk2V+xqMRHmcqttfiEmzu8rcF5Q1pt/D6FBhnGK
	 RUBKBRp0fgKcU1TO+yXq8yA0/+TmYmSis+xVgh4QmvfA9wjxJaVqNQBDpNV211nZTeu4y
	 gDCGHJnmeKI3RRHHyzdLuN3jQs1NUkGh2wnzyLNWPgzxXKYrQmQaA956OuHRCcgZ2hiBZ
	 BI1cqfc7Us7gV9xTu4Te22JrXZarXtncJvhP0U/ZQCM+yzZr+I4JbYj9Jz3EXgP/vRaSC
	 rIc42oe3WKk/3NvnDSWFoMhs+pUr6TcDO3zZcmXA4VP+qYjY9b84aP/9EhweqmUF8jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885709;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pc91cf5s1jtUTybf+t7w2BSbB180S5oniHpaCpc/oHY=;
	b=kv304pGttZyu80n1KyrslCrXE2/9+eColonNl9oxHE5a5BagJY7bim9Pcy21k9Uh8gL9
	 KSGteS1jJ4eEjpd59P0hvpleYopOLgwFGB1cyrBeuKGDR5+Lcc3gUtNsbxCeEvygRVUnd
	 QxUIyNiaNpBIZ1nAluK1+yrIAMusQWBjD/0UcjG9XU/pq5VBhuJAnt/kzc6oN1IG84cQ8
	 /QhIV0St+1dDutmsiG6i8yQUTAwaYKn0SpcAT1t90ZtMU7tipF8R417CrOsD+Yjsw3Fox
	 dmXf1KfTBcYOoi7jbcIhFJ25yv5Z0NJc6D5s3rYNVmMtmBzvwQoEcOmt+A5TT+t7bbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0josadj;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A32606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 03:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0josadj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794885708; x=1826421708;
  h=date:from:to:cc:subject:message-id;
  bh=NdNYg59rIF9mOzrVrYgg/gV8b59bLH6w5R6wrBfWOUM=;
  b=U0josadjtOSJXSQ+DNOe9xL8n4GYnVqUw9mpzmcoLiPHEjQ4QhzDpcwE
   HY2GvlioEZdatb6pe63mAAl+AnXFdt492yZmd1BgEnXGswSNP9T/g9II3
   uqvO2mb98/XuXECvRZ+yHy4H3nNwFwlHD/8EX9uIeg3F7Tbh7+tughjs9
   7diJEPIAkgM2S7guBG2jLDKj72CnFT2JmmWXYkSuagi8g5GJCw+AM9UaB
   o1P3PPuRmKzh8S7kXGiGdRTND8kzOkMUItFEzv6HmJUWEG51aNuQqVG9T
   dIJCmjk4INPweTpRWSskyJlgF71c+lHlaVq1ye57WCXwkiysKKPRDbbS5
   w==;
X-CSE-ConnectionGUID: JDB6+WS9QEmBFvrbuDujKg==
X-CSE-MsgGUID: VZyMqv6uTluw3iQsFr3DYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3633424"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3633424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 19:21:47 -0800
X-CSE-ConnectionGUID: pn+LWgoxSNmMI8Jmxa8KBw==
X-CSE-MsgGUID: qxHShHhDTcmNb1M8EN23/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9885931"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2026 19:21:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT9lP-000000002ws-2kBS;
	Tue, 17 Nov 2026 03:21:43 +0000
Date: Tue, 17 Nov 2026 04:21:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-5.15-lts 2/2]
 check_ksm_options.c:39:1: warning: control reaches end of non-void function
Message-ID: <202611170354.InpndTgz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15-lts
head:   941c2964a5c9c836e8db51429081fa86ba4b141b
commit: 4c72cd58608ddfe87ceae98a25300505d44d1cb2 [2/2] selftests/arm64: Treat KSM merge_across_nodes as optional
:::::: branch date: 21 hours ago
:::::: commit date: 9 weeks ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261117/202611170354.InpndTgz-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170354.InpndTgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611170354.InpndTgz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   check_ksm_options.c: In function 'merge_across_nodes_available':
>> check_ksm_options.c:39:1: warning: control reaches end of non-void function [-Wreturn-type]
      39 | }
         | ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
