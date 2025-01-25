Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8396F1D9A54
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737810492; cv=none; b=qbYGU3/cIS5uiXOur/glf5mCCCUWaNVec9AzX9VyqHhG5/7odwlwRniUDt+HkHIoqrXoKSvNEFIdKdYfC/iazHDMiyn5twzkl4DVOSJF0jRrYekpGo3O8xGuy7ZDxauu8akdZvKopr/0uMF/Yrx8F0WoB+ovxWzqyF9KJc/UV24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737810492; c=relaxed/simple;
	bh=6sY5cyJc0jnNRiM4MzMSW3soHKIy9kpUlZWYU96xtCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btls+dKjl2V3aBACIViH2QCfpfTVa0euO+3QPq/tkpLqtU6fTyT6PkXG34HeWV/3ydCeKBIh6HAXUOkPjwL5dg8ktQibGPJpOcbaz+drS/vvhhpCt56slU9ENPugVCNxrj2hxpQmWkUVYIOdRyrWb75cq0r95PjmezodREm+AR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QYYFlF7h; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYYFlF7h"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43618283dedso30985455e9.3
        for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 05:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737810487; x=1738415287; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAGvgsOljIxqqUnQeHNI81x7TBIIT9NusLAHj9xrSY8=;
        b=QYYFlF7hapet1qsVL39NxLDh2Rh/l7Czzq0ecPvtCTaqr7sGseYnA24pyVGlNOjeKg
         S/MtJjty8vKHfuwULUIhFVbR6tr7P+ek5t23ls0MD2LgvDoc/gv2mXjAAmogm0otqKZK
         6GcfHKcbdplqnoIeAQok7NEJKvZieB++O15StZbUtgxd7Ocm3QVRhGVsoDfChtVXZfd7
         6Jj4To8ViCUeXwC/M2jf95QTdaFaBcOU0seQKI1NINhJSaUIL3WRE/qBhwgDX4PeamS8
         I1Q3XlG1Tg5bqOwziL+Nmu4a1rHX8QjKbAeeMUL+VTedniyTbl6TWvqFqZHw3E/hx6Sq
         Ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737810487; x=1738415287;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAGvgsOljIxqqUnQeHNI81x7TBIIT9NusLAHj9xrSY8=;
        b=O+fBbd152uAf0yCQOaJLXa/JGWhZ9zU0qPE/JlAvxASETmfjut0HJl1uXbRVQjVyvA
         LKum5TbIv08kyfsHuoKnILNbGXXJ0HlT1+r88s7nrFYQLGvgoIHQsBO7BOPVZ7fF9OLu
         hWWKW+idxVD35NWZiFmPKznm+YY6itYtNt+26sfRR0QGKdIsJeIIl31mBJE3czWzY35H
         p6MHFYdT3EBVyV6YVsRFgfWeGe+qVYE0wX9pL0CrZIsaqGO6NQBlF+HRFuwbZVcaa8U1
         SV/GGE7VPKVHxfwoMxBo0HkqsbJpGUaDEabzCfyge8ir0hy5s/eCF89sP1kTFCSw/GZB
         Ajhg==
X-Gm-Message-State: AOJu0Yx6+5jCIUWjW/HYpxqp28O0TT33oDaYUTCHBRYQDc0/suNFP9kV
	avF5Yt/OJq1n+C+GtA6dDLEGc67UGSApRMI1PHul+mMEdrpyW9dVBoSY6P3NeUedN2Z1jjDTNcP
	w
X-Gm-Gg: ASbGncsx7T0qrBaWml0lRcVg2zx6u8NOFw4Aq4AOUhFAbOJUf5mW5Q82cTlTiQFK/Vz
	9X0/5cMA5mk2SSFQDh2h5NJjAwcxBA73sq7lwQGziTiJOF6k7CLZkJS9BVjr3DOO2zokH8GiA90
	5lLnwUxGfyk4s31qK5/HTk2jSB8uxP/ODCIyAF8ftgpa3LDYtY80xA3CE/L0SwgQTsSGnDfbTD1
	UEseVk8sywGIq3z3Tx0eQ4qADudEUYR7syf5o0OGd7ICVWvVmudO6pKC5tZblri7q2BH01RNwUt
	ishDr0+Zp3wl2fH09NIT
X-Google-Smtp-Source: AGHT+IFTbsOp9MXX2tvYNoeS6Ugr0YQflFcdLIe/WGLt6GMkazpITSyAtQNNs6vdpz37fDwN6p7W9w==
X-Received: by 2002:a05:600c:3544:b0:434:a781:f5e2 with SMTP id 5b1f17b1804b1-438913cabedmr287954845e9.8.1737810487227;
        Sat, 25 Jan 2025 05:08:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f0fdsm61254465e9.5.2025.01.25.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 05:08:06 -0800 (PST)
Date: Sat, 25 Jan 2025 16:08:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jsarha:capture-hw-mute-indicator 7/9]
 sound/soc/sof/ipc4-control.c:868 sof_scomp_get_card() warn: variable
 dereferenced before check 'scomp' (see line 866)
Message-ID: <1f3e7076-28e3-49c4-a552-42d674bfaa21@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux capture-hw-mute-indicator
head:   34df55e2634f610fc34f29047badf07ddf41ba2e
commit: 1569062204a940115428cee1c098cc286c23f43a [7/9] ASoC: sof: global-capture-hw-mute-indicattor; Mixer created
config: csky-randconfig-r072-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251110.vdLQOt9D-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501251110.vdLQOt9D-lkp@intel.com/

New smatch warnings:
sound/soc/sof/ipc4-control.c:868 sof_scomp_get_card() warn: variable dereferenced before check 'scomp' (see line 866)

Old smatch warnings:
sound/soc/sof/ipc4-control.c:519 sof_ipc4_bytes_ext_put() warn: potential user controlled sizeof overflow 'header.length + 8' '0-u32max + 8'

vim +/scomp +868 sound/soc/sof/ipc4-control.c

1569062204a940 Jyri Sarha 2025-01-20  864  static struct snd_card *sof_scomp_get_card( struct snd_soc_component *scomp)
23f60efe259d22 Jyri Sarha 2025-01-20  865  {
1569062204a940 Jyri Sarha 2025-01-20 @866  	struct device *dev = scomp->dev;
                                                                     ^^^^^^^^^^
Dereference

23f60efe259d22 Jyri Sarha 2025-01-20  867  
1569062204a940 Jyri Sarha 2025-01-20 @868  	if (!scomp) {
                                                     ^^^^^
Checked too late

1569062204a940 Jyri Sarha 2025-01-20  869  		dev_err(dev, "%s: scomp == NULL", __func__);
23f60efe259d22 Jyri Sarha 2025-01-20  870  		return NULL;
1569062204a940 Jyri Sarha 2025-01-20  871  	}
23f60efe259d22 Jyri Sarha 2025-01-20  872  
1569062204a940 Jyri Sarha 2025-01-20  873  	if (!scomp->card) {
1569062204a940 Jyri Sarha 2025-01-20  874  		dev_err(dev, "%s: No snd_soc_card", __func__);
23f60efe259d22 Jyri Sarha 2025-01-20  875  		return NULL;
1569062204a940 Jyri Sarha 2025-01-20  876  	}
23f60efe259d22 Jyri Sarha 2025-01-20  877  
1569062204a940 Jyri Sarha 2025-01-20  878  	return scomp->card->snd_card;
23f60efe259d22 Jyri Sarha 2025-01-20  879  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

