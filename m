Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452401;
	b=KrM/Pye16886jBhiRdec77qfS5eyenHFxumwvriPnyzzALpJNkZ70DwyiwDNiH4LWbED
	 tEWhQiQu45ZG7Avvh8dwv1kle/Eed3k1BqhnB2PcRrfQs5Au0Pt/7GDJ3aDGzhhU06eBc
	 jlJGibXkaaLO+4P2oeKjf3mxmuGKOIx/zy/DPa2J3jPrcLPe9GfXKcR/GiUw2SYiNSGVV
	 +8er8PeDMGfZkST1XiNaOND77lF7bnsdZoMFqzLha7aV5qDYAyNIgrrmoEMzTJPXqDyWH
	 dbows4fs68Q9G+r1XkEiG15qAqzg9UlPEEMoZR6HUghEc1X1IY47QWzHJpdfDc5aRtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452401;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3Ua5dgY7KhWLBcUTsX9kaPAUVc0ujSrVSAqI7KKlWVM=;
	b=s/TvEcvN3TfdpQqEJni5dwAFVkeeslQSPZjTglsKSJAIe2JHZ0wvTVCIeLcs+tfIhsAR
	 fR/qfbTT23RIAojMeZZT8IEfcPMSPFhUpotKccKUpwyBC9jFmSOP7tYNzVwUuIkojTcva
	 CLS+4/sp5ylbqf/KaE/bTHxSd8exunK1AhCktkKdo+QkSGTA87kCv0oL308NiyplCXTBH
	 UX7Hko1ybLe91+SRMnik2UhUpZnrLa3vrnmivNDgF4ZEHbmUchpO2KW0tjkL0Gbnso0vS
	 GfdWIGQRausR/260XSwVmXmdttK5Hiv7HjjocFeN9QDhxC74KTT4D3qwD+CIQ7oVmnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYP6wX21;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A6606A31F
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 13:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 409A6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYP6wX21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793452399; x=1824988399;
  h=date:from:to:cc:subject:message-id;
  bh=sxi3koR0MOE21CrwcKAiaSWPEgEcdh5iOpA6Hu0NAc8=;
  b=ZYP6wX21hEwtdrXeJnqzfS/q3w5m8oOc61S0bRenQozWKIEBKTgJv5Xj
   x9Tdg8PQF85dFY9+9zItyiuvCJ5kXe8qy5P7RiDOjR0WZDjBtGtwRL4eB
   LJ8013IN2Sf1UBDiExBCCzO/Eqnvk1AYWl9mVZOR8TfOSRWiSRva+jTIf
   vGTaXVxeC44OT4XR+EyZ1XfA9H6S7d+QDP1UGDMe1w4R5UmAYaQAxTs7c
   Nn/oBi4ByTKlEBDAXFKYCv/tq0lhQbnyAYvxTJ2yk5mL0WUJOIoSNNILi
   5LK5sZ7md7VJbwA23/7CG34wVQ94g7IvJcAR1IdPX+YE04yj1s7vBqrFB
   A==;
X-CSE-ConnectionGUID: pSFmpRwaRAim39rdBBcm/g==
X-CSE-MsgGUID: xDFv0XxwR6iwhO5YeyH7FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2080445"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2080445"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 06:13:18 -0700
X-CSE-ConnectionGUID: vCFA9WE3RTei13FPSSYI2w==
X-CSE-MsgGUID: EmRxZsXhT1GQ/LgHlPauxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="6002486"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2026 06:13:16 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN8tW-0000000061b-0WY5;
	Sat, 31 Oct 2026 13:13:14 +0000
Date: Sat, 31 Oct 2026 14:12:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:sound-cleanup-2026-10-30 221/343]
 sound/soc/codecs/sn624x-sdca-sdw.c:884 sn624x_jack_rpm_put() warn: variable
 dereferenced before check 'sn624x' (see line 882)
Message-ID: <202610311423.8OfajSb6-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-30
head:   09f1a103b1f1ef745ade1826d62438261db56245
commit: 29e4cb0a2a9fbfe750da9e9f826e5273b2795f96 [221/343] dai
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: csky-randconfig-r2201-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311423.8OfajSb6-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610311423.8OfajSb6-lkp@intel.com/

smatch warnings:
sound/soc/codecs/sn624x-sdca-sdw.c:884 sn624x_jack_rpm_put() warn: variable dereferenced before check 'sn624x' (see line 882)

vim +/sn624x +884 sound/soc/codecs/sn624x-sdca-sdw.c

12d9c9f8679c56 Qianghua Wang     2026-09-01  879  
12d9c9f8679c56 Qianghua Wang     2026-09-01  880  static void sn624x_jack_rpm_put(struct sn624x_sdca_priv *sn624x)
12d9c9f8679c56 Qianghua Wang     2026-09-01  881  {
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27 @882  	struct device *dev = snd_soc_component_to_dev(sn624x->component);
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27  883  
12d9c9f8679c56 Qianghua Wang     2026-09-01 @884  	if (!sn624x || !sn624x->jack_rpm || !sn624x->component)
12d9c9f8679c56 Qianghua Wang     2026-09-01  885  		return;
12d9c9f8679c56 Qianghua Wang     2026-09-01  886  
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27  887  	pm_runtime_mark_last_busy(dev);
29e4cb0a2a9fbf Kuninori Morimoto 2026-10-27  888  	pm_runtime_put_autosuspend(dev);
12d9c9f8679c56 Qianghua Wang     2026-09-01  889  	sn624x->jack_rpm = false;
12d9c9f8679c56 Qianghua Wang     2026-09-01  890  }
12d9c9f8679c56 Qianghua Wang     2026-09-01  891  

:::::: The code at line 884 was first introduced by commit
:::::: 12d9c9f8679c56e8c131dc2d8985c350ece7c4c3 ASoC: codecs: add SN624x SDCA SoundWire driver

:::::: TO: Qianghua Wang <qianghua.wang@senarytech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
