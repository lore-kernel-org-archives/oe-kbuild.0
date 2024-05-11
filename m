Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88438C8F3
	for <oe-kbuild@lists.linux.dev>; Sat, 11 May 2024 23:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715471853; cv=none; b=YrKzU4WVg4Ulf+UCyYd/QTkfFLFvQzAue3pTsx7X83x2BJCOIF7rxnJ1cjHrjy1Mq71U7hJvnb8NhsGLdL9EMFGlQB1P715p4lNzbBEPI1PhpC1M2aVqhJ4kq9Pfjb29yt+ReDk6KYIOCgeiIFroL7esHt8N+DxU4RXArYgjT2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715471853; c=relaxed/simple;
	bh=ZrPEFpOeCwouF8VosfSPbfIDKqBCyt0VuY6NK5ZjNXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mU4E6cj7gpBQ14VarJMwGw7FS3Nys0zV5bGZufr5sxmZm7y4lmR1R77Yi9C9OxbsH6LRXxzPK52+TaUEVzrmBRK/b+nXNUbahX8NGMWs+sdZsAS5PG+BaODcauR1a5SkgAYQLUwYcK7Fhce6KJklwulR1pL4aaUxBrozVa8k5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0t2OMiV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0t2OMiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715471852; x=1747007852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZrPEFpOeCwouF8VosfSPbfIDKqBCyt0VuY6NK5ZjNXg=;
  b=L0t2OMiV90JGhRXmE+sV4Um/2oYjNc+LFP4yr2oxQiWtFPJ5uu50JjXv
   wAsIklX/2yGnbN1I/w+07A55xnlQe8+3argj18FvQpbgkGwHoUDPsIM4n
   G0XQr9wD+fVnylpPF/bCSHiue3Wa4YvwcNH2PQabtnKFQw5lInDZGQT9w
   DB4Q2ANh3bq02cJxTOQs9G36MkfdzRMjwbCcsGKAMAmPMLK0U4lZPgy6/
   FWta0XCjS7V5nMaYDA22LC3kseINfTgQlxSJMUZ5QIYotdfF/42e0FF8c
   t9uirewZeswsrDgYc+42e66Hs2YpBG8jTahySn7qOnqpT3o4+X+21jL92
   Q==;
X-CSE-ConnectionGUID: H4bRf8TXSO+0dBW6e73JUA==
X-CSE-MsgGUID: 26TShX12QMOfBVarL9bWvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11485299"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11485299"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 16:57:31 -0700
X-CSE-ConnectionGUID: Re/jdfDNTsyx0p9Kn0uy6A==
X-CSE-MsgGUID: 4aIBj1OZS5CPu9j0Ji0kPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="53175725"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2024 16:57:29 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5wak-0007xL-1q;
	Sat, 11 May 2024 23:57:26 +0000
Date: Sun, 12 May 2024 07:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-macro: add helpers to get codec
 version
Message-ID: <202405120735.qbbiUPaX-lkp@intel.com>
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
In-Reply-To: <20240510175835.286775-2-srinivas.kandagatla@linaro.org>
References: <20240510175835.286775-2-srinivas.kandagatla@linaro.org>
TO: srinivas.kandagatla@linaro.org
TO: broonie@kernel.org
CC: perex@perex.cz
CC: tiwai@suse.com
CC: alsa-devel@alsa-project.org
CC: lgirdwood@gmail.com
CC: linux-kernel@vger.kernel.org
CC: krzysztof.kozlowski@linaro.org
CC: neil.armstrong@linaro.org
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.9-rc7 next-20240510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-linaro-org/ASoC-codecs-lpass-macro-add-helpers-to-get-codec-version/20240511-020042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240510175835.286775-2-srinivas.kandagatla%40linaro.org
patch subject: [PATCH 1/2] ASoC: codecs: lpass-macro: add helpers to get codec version
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: sparc-randconfig-r081-20240512 (https://download.01.org/0day-ci/archive/20240512/202405120735.qbbiUPaX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405120735.qbbiUPaX-lkp@intel.com/

smatch warnings:
sound/soc/codecs/lpass-va-macro.c:1485 va_macro_set_lpass_codec_version() error: uninitialized symbol 'version'.

vim +/version +1485 sound/soc/codecs/lpass-va-macro.c

908e6b1df26efc Srinivas Kandagatla 2020-11-05  1463  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1464  static void va_macro_set_lpass_codec_version(struct va_macro *va)
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1465  {
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1466  	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1467  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1468  	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1469  	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1470  	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1471  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1472  	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1473  		version = LPASS_CODEC_VERSION_2_0;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1474  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1475  		version = LPASS_CODEC_VERSION_2_1;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1476  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1477  		version = LPASS_CODEC_VERSION_2_5;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1478  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1479  		version = LPASS_CODEC_VERSION_2_6;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1480  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1481  		version = LPASS_CODEC_VERSION_2_7;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1482  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1483  		version = LPASS_CODEC_VERSION_2_8;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1484  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10 @1485  	lpass_macro_set_codec_version(version);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1486  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1487  	dev_info(va->dev, "LPASS Codec Version %s\n",
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1488  			lpass_macro_get_codec_version_string(version));
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1489  }
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1490  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
