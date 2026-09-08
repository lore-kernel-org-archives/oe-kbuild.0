Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F6E52BE41
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Sep 2026 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866260; cv=none; b=eEw5yMsz+WlGBXMNwfahb+5JB2gXw616ZmH4QrsgI1dM1b9+Hdr4mJOvrOiOSWkpjrBp1WruOIWN+8zlQfj8AvYIgM7gtl2r+Zv+ZtNYhnA3R/uUiUmn74kf4pgPC4zajD3Xcq9krps76l17OhHTnKgfFmyb9SfJw8MYj/BT9qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866260; c=relaxed/simple;
	bh=qzLCdHu9/EouzCQAAjuIVE2PqclS7S8Wyu4XLlBbIGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bMYdW1lr/n5TYY+s6SuX9IznICKO1HA2HEajLQ/GXHzpWdRo/csJ4zPOcGBWviPk8ShLRZgAePlwUHMnyTbCsqkQOV/P8flHbbxhDmZzGrxPpVlbyaBIAhvPbq0PyK0Ig+2ZedG2LJ9qkCrZw8Ic3xH+FE0njTz7/9jF3QQ4eV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLJgGC/t; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLJgGC/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788866257; x=1820402257;
  h=date:from:to:cc:subject:message-id;
  bh=qzLCdHu9/EouzCQAAjuIVE2PqclS7S8Wyu4XLlBbIGY=;
  b=GLJgGC/tz3BJR3IzwaVtayFNcOch8G0Zq0cA70dYAt+/svnh0k+mercN
   hQ6QqCDokKrXH7yxsgg/WB0kQPjrEscB+J6mVKfiFBMqZXnQpR15Sjg8G
   koG3QPbTUtx/gozAms1+fll0HPQUuA/NvHT7E6AKj9MIrfhEboXn4X9EQ
   MbFZPZk9Gg8iMjBNnksPtijpSRRvmCrnA4FuWFckwAwngXK+Tyt0hXdp1
   O8EzztVT4U6McAz22Qcqp7V9wraOdQsOn5H3zjvgvlVAlKGuvfV/jUQO9
   acRj5211lHeYrm/YP33jxeCujqecTtPu4UsN3c88vlbyC/J4dvB6LUEHT
   Q==;
X-CSE-ConnectionGUID: Sz9Tb0V/THiSBrJm69QkBA==
X-CSE-MsgGUID: P+Z3LGPSQEigA+NRSbqhXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89021686"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89021686"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:17:32 -0700
X-CSE-ConnectionGUID: KwgrBGuzSX+Z6IzJYmK+Qg==
X-CSE-MsgGUID: wjQooupnQZWqBPqZwoabpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="275097946"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Sep 2026 04:17:31 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3tpQ-0000000002B-1Kq9;
	Tue, 08 Sep 2026 11:17:28 +0000
Date: Tue, 08 Sep 2026 19:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1145/4316]
 sound/soc/codecs/nau8360-dsp.c:214 nau8360_message_to_dsp() warn: missing
 error code? 'ret'
Message-ID: <202609081933.K4tVJnyh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Neo Chang <YLCHANG2@nuvoton.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   944a035ecca915ae947905dcfb03f2b9dc6d032c
commit: be88847a8bb1a14194cf50116f8909d127861318 [1145/4316] ASoC: codecs: nau8360: Add support for NAU83G60 amplifier
:::::: branch date: 20 hours ago
:::::: commit date: 9 days ago
config: arm-randconfig-r071-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081933.K4tVJnyh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2362eeb5f75560740146975e9eabe84c6bd25a0d)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609081933.K4tVJnyh-lkp@intel.com/

smatch warnings:
sound/soc/codecs/nau8360-dsp.c:214 nau8360_message_to_dsp() warn: missing error code? 'ret'
sound/soc/codecs/nau8360.c:2203 nau8360_alloc_defaults() warn: potentially one past the end of array 'dyn_defaults[idx]'
sound/soc/codecs/nau8360.c:2203 nau8360_alloc_defaults() warn: potentially one past the end of array 'dyn_defaults[idx]'

vim +/ret +214 sound/soc/codecs/nau8360-dsp.c

be88847a8bb1a1 Neo Chang 2026-08-25  197  
be88847a8bb1a1 Neo Chang 2026-08-25  198  static int nau8360_message_to_dsp(struct snd_soc_component *cp,
be88847a8bb1a1 Neo Chang 2026-08-25  199  	const struct nau8360_cmd_info *cmd_info, int frag_len, int param_offset,
be88847a8bb1a1 Neo Chang 2026-08-25  200  	int param_size, void *param_data, unsigned short dsp_addr)
be88847a8bb1a1 Neo Chang 2026-08-25  201  {
be88847a8bb1a1 Neo Chang 2026-08-25  202  	unsigned int payload;
be88847a8bb1a1 Neo Chang 2026-08-25  203  	int ret, padding = 0, frag_cnt = 0;
be88847a8bb1a1 Neo Chang 2026-08-25  204  
be88847a8bb1a1 Neo Chang 2026-08-25  205  	ret = nau8360_dsp_idle(cp, dsp_addr);
be88847a8bb1a1 Neo Chang 2026-08-25  206  	if (ret)
be88847a8bb1a1 Neo Chang 2026-08-25  207  		return ret;
be88847a8bb1a1 Neo Chang 2026-08-25  208  
be88847a8bb1a1 Neo Chang 2026-08-25  209  	/* sending preamble fragment */
be88847a8bb1a1 Neo Chang 2026-08-25  210  	payload = nau8360_pack_preamble(cmd_info->cmd_id, frag_len);
be88847a8bb1a1 Neo Chang 2026-08-25  211  	snd_soc_component_write(cp, dsp_addr, payload);
be88847a8bb1a1 Neo Chang 2026-08-25  212  
be88847a8bb1a1 Neo Chang 2026-08-25  213  	if (!cmd_info->msg_param)
be88847a8bb1a1 Neo Chang 2026-08-25 @214  		return ret;
be88847a8bb1a1 Neo Chang 2026-08-25  215  
be88847a8bb1a1 Neo Chang 2026-08-25  216  	/* sending payload + padding */
be88847a8bb1a1 Neo Chang 2026-08-25  217  	payload = nau8360_pack_param(param_offset, param_size);
be88847a8bb1a1 Neo Chang 2026-08-25  218  	snd_soc_component_write(cp, dsp_addr, payload);
be88847a8bb1a1 Neo Chang 2026-08-25  219  	frag_cnt++;
be88847a8bb1a1 Neo Chang 2026-08-25  220  
be88847a8bb1a1 Neo Chang 2026-08-25  221  	if (cmd_info->setup_data)
be88847a8bb1a1 Neo Chang 2026-08-25  222  		nau8360_send_data_payload(cp, dsp_addr, param_data, param_size,
be88847a8bb1a1 Neo Chang 2026-08-25  223  			&frag_cnt, &padding);
be88847a8bb1a1 Neo Chang 2026-08-25  224  
be88847a8bb1a1 Neo Chang 2026-08-25  225  	/* sending trailing fragment */
be88847a8bb1a1 Neo Chang 2026-08-25  226  	frag_cnt++;
be88847a8bb1a1 Neo Chang 2026-08-25  227  	payload = nau8360_pack_trailing(frag_cnt, padding);
be88847a8bb1a1 Neo Chang 2026-08-25  228  	snd_soc_component_write(cp, dsp_addr, payload);
be88847a8bb1a1 Neo Chang 2026-08-25  229  
be88847a8bb1a1 Neo Chang 2026-08-25  230  	if (frag_cnt != frag_len) {
be88847a8bb1a1 Neo Chang 2026-08-25  231  		dev_err(cp->dev, "message error (CMD_ID 0x%x, LEN 0x%x) !!!",
be88847a8bb1a1 Neo Chang 2026-08-25  232  			cmd_info->cmd_id, frag_cnt);
be88847a8bb1a1 Neo Chang 2026-08-25  233  		return -EPROTO;
be88847a8bb1a1 Neo Chang 2026-08-25  234  	}
be88847a8bb1a1 Neo Chang 2026-08-25  235  
be88847a8bb1a1 Neo Chang 2026-08-25  236  	return 0;
be88847a8bb1a1 Neo Chang 2026-08-25  237  }
be88847a8bb1a1 Neo Chang 2026-08-25  238  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
