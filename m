Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB5149C69
	for <oe-kbuild@lists.linux.dev>; Fri, 10 May 2024 03:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715311126; cv=none; b=vALrvHJc44v7hiwwIo1Yc1RaryiD8GjvXNoyXH+Y8OC8gz9+PkX0YpfNOne33TSpg951GAO1rJHqPQrk0nIoBzjyuUgy2snbHw+Jdm7PgLiSumtlc/6Jd1Or10WdexzQNB9oAcFZLfK3kbBMPdta+GlV69ad96nMQAXAQiP6laQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715311126; c=relaxed/simple;
	bh=/C/WupgD+cmfgrP1WZeBBiyQTIN5sY75xIBNW+DDKCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtY8lHlr3M+fUFz3CEanyIobGcbJyD5y/H5Xbus9gXAw5jTKfiu7vb+oVA31TlIGbtKUX9j+TNx0KogUcdNmyBCPs04agBGR8zY9cBQZeEprvg96xVfISN6QLIkMP8vMGlTNRgLYjpmdbIjkU/uMc55GM/7duFQIlNCTF4ylHEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/NjqNK/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/NjqNK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715311125; x=1746847125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/C/WupgD+cmfgrP1WZeBBiyQTIN5sY75xIBNW+DDKCQ=;
  b=a/NjqNK/SgOaLuncsbx0EeY1hQfXRznLgkjw1VBj4IT7V6SrFRggpotq
   UAv73t8v0PpVNcw0gN84fcT6J13QSkqHGYTxAwdmW9N3Zat5j9XYWX1iy
   4/yQAUJJiVrE5v/0Dm9A/GXnC6UA6DZiGRrHKo5g/2saO+GTqyVyylAyj
   ztyUXatwVy8Us7KbCN3HIQCjPGtIQZD9WgTWqvzFbiuJhr0lVVGp0oLQX
   BFA8K8TmhJ/HnxMWFoPGdJc3HxcDI5g93fQh34/CsN+yUw4NoRfu60vkJ
   R4LuBqGzzZLLqjMbEMEX4C5nhatRKq8ipoZB2ct62sdIWp9nyHezZ/P44
   g==;
X-CSE-ConnectionGUID: 7RpQIUm6QwmbLS3Bv4nHZA==
X-CSE-MsgGUID: 7YmHmBz+SWWLJ7PKZH8dxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11434579"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="11434579"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 20:18:45 -0700
X-CSE-ConnectionGUID: Z1yMCWUcTHOMmbomGMXpUw==
X-CSE-MsgGUID: f+fme1zpR0K6BR67QVdPnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="52671474"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2024 20:18:44 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5GmO-0005fL-1m;
	Fri, 10 May 2024 03:18:40 +0000
Date: Fri, 10 May 2024 11:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8029/12321]
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:44:16-17: WARNING opportunity for
 max()
Message-ID: <202405101146.5Rqgih24-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alex Deucher <alexander.deucher@amd.com>
CC: "Shaoyun.liu" <shaoyunl@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   704ba27ac55579704ba1289392448b0c66b56258
commit: eef016ba89862ba8317916269f9f369f317cd264 [8029/12321] drm/amdgpu/mes11: Use a separate fence per transaction
:::::: branch date: 21 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-102-20240509 (https://download.01.org/0day-ci/archive/20240510/202405101146.5Rqgih24-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405101146.5Rqgih24-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:44:16-17: WARNING opportunity for max()

vim +44 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c

eef016ba89862b Alex Deucher 2024-04-18  39  
eef016ba89862b Alex Deucher 2024-04-18  40  	while ((s64)(wait_seq - *fence) > 0 && timeout > 0) {
eef016ba89862b Alex Deucher 2024-04-18  41  		udelay(2);
eef016ba89862b Alex Deucher 2024-04-18  42  		timeout -= 2;
eef016ba89862b Alex Deucher 2024-04-18  43  	}
eef016ba89862b Alex Deucher 2024-04-18 @44  	return timeout > 0 ? timeout : 0;
eef016ba89862b Alex Deucher 2024-04-18  45  }
eef016ba89862b Alex Deucher 2024-04-18  46  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
