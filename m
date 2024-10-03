Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50641A265E
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727969380; cv=none; b=ZfOP0hvPci71UuDhKlluNq7hwvmsUxeR/rKwR+9ykdm0FL6ZcM08x5im4WeNhl6UoIXuRzBQag9cMLOggxGZuJTVXLT+8DYYiaBDfVDz3LbTX/09XVE0clLYJ8HfQsWWXhXZW6OE6Km5+DVQhDQ0qrLjvwCn+1Zd1g1nxaPVVV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727969380; c=relaxed/simple;
	bh=ozw8kFX1KurIzATp2OQjYcUSw8a7dvupxT+tgsEYEc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVUOgAsWMQHs/jXCi2KnuD4q1k3AiDGStSUdzReKBIZAvMPorHeFkLZ5qu9LmdBNy+A0xHJxf3tJAea38mLKuj4dpRxkAoqrer8zsS/KIcc2vwou6zqMmRq/qgHRtPMC0PyYlZZSk9JRfo+OAJrOH8xD7uvM3bmeBWU9kefhRio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hm1tysx3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hm1tysx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727969379; x=1759505379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ozw8kFX1KurIzATp2OQjYcUSw8a7dvupxT+tgsEYEc0=;
  b=hm1tysx3eqVJsscNlYQ4iY+b0nxah2SjlLq1vtZtF5H5nSEOwmHWVYy7
   TWY6OFnYgIZU9L8/XUdsZRA8mT3IensfUCbH0Dv9S/wUJFjQicdKoQP8W
   qCPAhdrufCcKRLPMBhBO2wXm/Oex9Sey2gLlAgAaiMJpOMVROogvbXGYy
   q2iK0wLWYRwzQlaflF9kLRd1/tBrGqj7Vr4S9p9Tq1GrTQ5brq4dWLIsT
   5xulWRAJtqAEUVcAPDo7W2/V2EJxwTjjT0Kssj4TMgsDHDyKM4g6zvlXa
   GvWi964vI82tTHfLW98hVd0tuT8Fi9ipGSXz5786O/BDi81KRWJiFbTT1
   w==;
X-CSE-ConnectionGUID: qhcGruHgR3WrfF1FivwtmQ==
X-CSE-MsgGUID: jtAe70z8RxqF9UAZFNKiIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="30047389"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="30047389"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 08:29:38 -0700
X-CSE-ConnectionGUID: KdEMoCDXSeyesHsbiPmHtA==
X-CSE-MsgGUID: El7CimNERkGnGec+8EsZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="78797664"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Oct 2024 08:29:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swNln-0000ZA-05;
	Thu, 03 Oct 2024 15:29:35 +0000
Date: Thu, 3 Oct 2024 23:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/tpm/tpm2-sessions.o: warning: objtool:
 sg_set_buf.constprop.0+0x4c: unreachable instruction
Message-ID: <202410032344.1vDa0nU6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: James Bottomley <James.Bottomley@HansenPartnership.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>
CC: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi James,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ec462100ef9142344ddbf86f2c3008b97acddbe
commit: 699e3efd6c645c741ea4d6d58282c56b6d108cf7 tpm: Add HMAC session start and end functions
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241003/202410032344.1vDa0nU6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410032344.1vDa0nU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410032344.1vDa0nU6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm2-sessions.o: warning: objtool: sg_set_buf.constprop.0+0x4c: unreachable instruction


objdump-func vmlinux.o sg_set_buf.constprop.0:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
