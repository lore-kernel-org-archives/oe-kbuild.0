Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDA0211A14
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784962066; cv=none; b=FyDz9i3C4D38wyu+WY3q7s0ILaZq5Hpf6Sia04n/se/6ICIa4arHSnYrxLO27piQtsocqitQnQgcTklvSxBCRgT6XVJPzjhICjqAoIHzR3dedKUpSv6blWBOeEKCdbCjxvet2/ryI6puRg0723bWWRYoC+igz0BoqlYPBLa++As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784962066; c=relaxed/simple;
	bh=BrRu97Z9H81hxOezrzjoCzpo8aXRD33/0jsbVOOMcQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ldvcc28zJR4EzvxPeKqEZH9xfYt/4jkLysMyNS5ELFS2oG15qnSxNVajDEq34TImusRydyAPtEMGe4w4jtgdanE7ePhyx4wHcwnjH2vkxLGzz8ZvW1pA7o0tf8wnXzEfZN3kBguw/JtgUxLb8onqr2bFlxON0sOLKqHvwo13pxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ek1EXqSU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ek1EXqSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784962064; x=1816498064;
  h=date:from:to:cc:subject:message-id;
  bh=BrRu97Z9H81hxOezrzjoCzpo8aXRD33/0jsbVOOMcQ0=;
  b=Ek1EXqSUaQqfHWUt7+wFrlW8+wXMZMKVXBVeDGn8475yHDClp1VoGYW0
   hie7Je+yr0hRyHRzic+lKLI/4yQ+A4CZrmQvS7a+RXH7Z3+y3lL3UoCs2
   bJSnQk8I+ju5ucO39ViY4+dNw3q2ZbVzuNUK31gC7FV+R/WlAgEp8y0hK
   BPQYp1djA/b6RaEcJHxxOYNmLRfw8MbLfcbVjhs7YTl/aqs7cUhiBTbUZ
   HIL7W8AXKB9md7RD3b7Qgn9J9VsLLLodJ/H3PRIP6YedTYiis9eiQ7SWj
   /h/4vaeLmtUFLK9aK9glW6AEqlpfES5DgzR7FgQE/EuyK7+HSSjsAWyby
   w==;
X-CSE-ConnectionGUID: Gq6+fChLTL2HxxOnOZUoGA==
X-CSE-MsgGUID: DSNdADYcTumdcMRlCkzMYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="96211256"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="96211256"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 23:47:44 -0700
X-CSE-ConnectionGUID: M9KIJwLWTq6+J//FmvYOuA==
X-CSE-MsgGUID: LXL51MW2SpCHrpJ7aXK8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="254980889"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jul 2026 23:47:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnWAe-0000000017S-3cxO;
	Sat, 25 Jul 2026 06:47:40 +0000
Date: Sat, 25 Jul 2026 08:46:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:7.2-rc 39/164]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202607250803.tAotjeCI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   23918d7eab97daf57988a8a538a870c4e862b525
commit: b4f36e791b05f368a838ea83b520a8d881bc6b63 [39/164] firmware: add r3mini phy firmware
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260725/202607250803.tAotjeCI-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607250803.tAotjeCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607250803.tAotjeCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
