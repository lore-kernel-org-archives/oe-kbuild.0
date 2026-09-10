Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF349DB9E
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050017; cv=none; b=i2xSgoQP3ZBrVL3CIjpbWe8AJnAV5ZWTl5+HRea00lzVPFGqJ5XCx1SI37dXTNRpDESOhiucvFqL2PWV8iOLZDfH7lQcOoCnY1L7Bct2UflLreM14LxxLwCYDkZ+7yini8Ki22N+ucWhocc3UkTNbbE7wyJYbf1/wMkGqBa5es4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050017; c=relaxed/simple;
	bh=sxif0wyfcq8H412Y4yshHq0FWsb1CQN9/MCMEpTGBR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Guim5ddgt+9hYq2AYbdW/S7pNsy5gfZ1sKW9gHdWEme3frQHheAvFxDxxOfCm+bTW5jFyYgk1uGcISOwIKXLYBM6Sk+kcRMT8ZFE/FxYFALVRzldjbYdYp7ykSXFtSzh7IdzKrqsDsX2O+peGPi14epZdbLC8ARXIQ/iE3BV114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn++zxOl; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn++zxOl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso9906007a12.0
        for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050012; x=1789654812; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ps82SqA662Agvdiz6i2Ym/UD36gHnRMXTJ78ECl6KLc=;
        b=Jn++zxOlWS4C/qLqd6IsoKMrjDVFw74fUpaiVD2ZRE95pQ1u/hg7nbOL2qZNtuKxHS
         UGvG9Pgu6EMYBv5qRtz68/E4VSF86lfAzkjQSO9e7pD2uP1PO/ZFzrxkTW5dNalLCuSE
         aesh/h/3B6ftxiGgknrJquK+hZJM/P7BvfzJJttfF3NMzwVwN3eTFLgSnxhUN7Nadugc
         V9hUtjezau2Dj0R1Os4iMeWATcJP2bnASMlCf/PGKnbTwIs/R7bd9n5cCqigStGZKFFK
         2oX5hfvlNerZpkAWtQgNvCYU3ngxX8hGxqn6anAyo266/b0yJgxbZsRro6/JHOM3skvZ
         jIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050012; x=1789654812;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ps82SqA662Agvdiz6i2Ym/UD36gHnRMXTJ78ECl6KLc=;
        b=l7dWfVjs8mQZ0/CWV6fk5A/HpHaHwKK52dueolHIuf9wEHSUnmRzgBhs+cTg9e86VR
         C7fJ/o6MpZO+1AmBvNmoZbwbbhu9mv1Q8xaogedDh5jw6C+fUmKDnDx3g4ddDJ2132CP
         Mg78D9swGq86xPt7YDxVOJlzOp9C6kno6pVMaG6TRKprmXhOOJsoW1b9z5Rdw7oq7cuJ
         qPzgvV+3UGzUGvFkQa1WhWv0zx6p7McbtgTSrL9Q0Q0XOVvVxbJqPcWQMVTCIQeCSq8+
         2LnyDFZWqoayyEFZvYyTfCRGB1QLphcaMmauLC5105ZwkJCPRa6fXJKwC98uKs22kUgU
         QViw==
X-Gm-Message-State: AFuF++lO3gsksBoh6UsWg/IOBPosO5287ZX9Jj5Up/mJyK/AFdVWh0Xd
	uRAVe2xFvYc/9VIV/R4i8tpjwQagmm8NmLOX/0KsaApvUai4AQYlPrUsyKu0sdMurR+2ag==
X-Gm-Gg: AYBFou0D7zxFVmM1sq/mvzfVrFLRzJX/NiLROazFGhfF67Up0m0i161Lhd4X0NmKRVY
	2k31ifCp0sfsX1yZgygfBWQ04cNNq9lg3Itcat40jJpY+2FLI9c1FYKCCSyAyPOdA5zhwE/AafK
	5hhq5SKZK0cIJq3hHEYGWgfY53/kO7O7WV8DcHn+ioLFd++10k2m6eTZMKR0+gQitLuBNGx3qQ2
	BpdYPFSVLfx3psoA2Z1FVKhKrVO+pRLF4hqpKZEhGcOAoPV0RNXIA1QyO2HevaL8CPVUTUQ6fZT
	AjKbdm0HxxAESEk4vS6BHVzxiphE0q/8PP1YK9Huc2cPqdpMqiDLQb9nOdNVDfrXu63vUk/CjrV
	2WOKz7bMcLNY+SCfbEOY4rHEs/3zcvuRgaIiB99bYrpnL2HqcK+OyRAul8tXte3Z7+cKSv6rXBC
	mIIL6fcTJ1fN7igKX1iNadz4gz51YpG5d4dc6ywx07dF/r3HOGH5C3VTT0lQaBUvgXSGA=
X-Received: by 2002:a05:6402:2350:b0:6a6:37a3:2b0f with SMTP id 4fb4d7f45d1cf-6a7e8d6e0cfmr14523801a12.8.1789050011642;
        Thu, 10 Sep 2026 07:20:11 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9857ce120sm3083667a12.4.2026.09.10.07.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:20:10 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:20:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Neo Chang <YLCHANG2@nuvoton.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1145/4316] sound/soc/codecs/nau8360-dsp.c:214
 nau8360_message_to_dsp() warn: missing error code? 'ret'
Message-ID: <202609081933.K4tVJnyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260910142007.Z8C9NWP-H15d1kNoMklRu7GjfSH0oE8B201Sexg5SrI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   944a035ecca915ae947905dcfb03f2b9dc6d032c
commit: be88847a8bb1a14194cf50116f8909d127861318 [1145/4316] ASoC: codecs: nau8360: Add support for NAU83G60 amplifier
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

vim +/ret +214 sound/soc/codecs/nau8360-dsp.c

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

Please either change this to "return 0;" or "return -ERROR;"

be88847a8bb1a1 Neo Chang 2026-08-25  215  
be88847a8bb1a1 Neo Chang 2026-08-25  216  	/* sending payload + padding */
be88847a8bb1a1 Neo Chang 2026-08-25  217  	payload = nau8360_pack_param(param_offset, param_size);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

