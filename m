Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BDB4436A
	for <oe-kbuild@lists.linux.dev>; Thu, 30 May 2024 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088501; cv=none; b=c228wR6vPda1RxbfMsoK4HtfHCyJ4/tx1rEhRrT5gN1QUWAaOGWYvOKWhzKZ/PYQEST0DWRZtME71hcJQbF4NeTIJIJVj4gz0/HOdK+0XyyVh+hkVYYqwzZZHFfoTIo/Avsor6BAqQW66EtsbrWe1P+ldf8C5Qusbt6xx2ByurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088501; c=relaxed/simple;
	bh=kTIL89C8WiyXJr2dtajN73t4RLCLdwWnr7vzjNQiPfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lef8qJHim9oI51eC9NVtb1DgzzyZ2XuFXKAKmw04R8XXQG4NO716YMZqi0DP48JV7ywcVGF6IZYYrvDRhVHSNSpxcqVwXyekbqcB7b9jz3WHDchOAzzTCRHTqqvFiLfghZ6mnJwx1B5WHn5u2Z9IezHX1Kl7s98GvwJ7PegvOG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsr8wbNu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsr8wbNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717088499; x=1748624499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTIL89C8WiyXJr2dtajN73t4RLCLdwWnr7vzjNQiPfw=;
  b=jsr8wbNuaqeSJUKK6Ot2FLt7H9o8vn8pw3rW2sefPDgsg2Hndyy0sF9y
   iOtmpQJB7ngl9ItkfO0RpeIMRdBP0awwsC7vtrbIDJwDc0U7pZ3qGFmlN
   i4FnDXNOhcsVYI3t3KEOuwiIqTXrpC98Px6hJsuSuApnkdMlVXwSYZJxW
   911ZhsLzyltUG7aTis98Mpge8hC7ig3sewhKoL7sFN9PvLACOaDeJ4pyJ
   m9ONl8Xxu2SKuAY9q+Ewztb2wzl4wtXrakKTluT74ZDbvFtU3rZu1DVV+
   8LyBFmFtAjFgnlapF+z+hBEvaQJfApjOLGQ+vUAPnB/PDwLPHg77ctSBD
   g==;
X-CSE-ConnectionGUID: BLI7SLLmTCeCHnyDy+Qc3A==
X-CSE-MsgGUID: rOCV9Ju/Q6mpusWHFUaL5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13781400"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13781400"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 10:01:11 -0700
X-CSE-ConnectionGUID: 6bZbDrzcSd63EM9B1B/ufA==
X-CSE-MsgGUID: LSce6ri8S52nOVxDH5FlvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="59048757"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2024 10:01:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCj8h-000Fjs-1k;
	Thu, 30 May 2024 17:00:41 +0000
Date: Fri, 31 May 2024 00:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 33/35] dtbs_check: make[3]: ***
 [scripts/Makefile.lib:374:
 arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dt.yaml] Error
 1
Message-ID: <202405310047.zOpfBzu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dt.yaml] Error 1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   ba80c93b803cb643c2d5cd37308bdbe2182a6750
commit: ee0feabd93481116c036bded03c205d56dbff6fc [33/35] CHROMIUM: arm64: dts: mt8186: Disable typec c1 port for SKUs of Veluza
:::::: branch date: 3 hours ago
:::::: commit date: 35 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240531/202405310047.zOpfBzu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405310047.zOpfBzu6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131074.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131075.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku65536.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku1.dt.yaml] Error 1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
