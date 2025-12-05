Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E560346E60
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919345; cv=none; b=aZ2bR62wRKozEDbNi0AFsZ/loBx1/ffEJF8liuCR7FztSPMhppV7fQ3N8Sbca1ta+ks8IrFhGvdTrl9nIFP3TcrR7QQPBB0w1RPvAjjdBfqNKMNSSAb1ZT2hzT4tAwUfCrSX2Gd59BL3UmypEY7RWoLEJNgr/Ib3PHGEharZpQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919345; c=relaxed/simple;
	bh=zO4HfYHyG77lligX58GcpeUsXfmoKe4bOSQJtnv2qnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XD4c0s5rRS9zHbyXkJCMqMmoxHBKhb5tj7H1DjZZAqJq7zOQVRCEKg5ECP/kT8oe5ehRbLNv02N9M2Jlv4RFFftWAhxiNcGnOKg1dzlJTf9K6em19pc97K+zZUfPJnohQrX/AqnZmbHCB1YGhVUncNkZIwIdivQmVcK1/ckHelo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YB3O3Lrd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YB3O3Lrd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47774d3536dso16515205e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Dec 2025 23:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764919320; x=1765524120; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzxFs8LzMrONfI1Cn6UlkRiahNYd5MhF609UmLpQAXo=;
        b=YB3O3Lrd0Ajn34FUZE8slDe6Bssm4I+cBGuTOOTtp/kEaXtBhUc+85zwEDfpDlvePT
         4o2Z4VmXupUsYkuSPImwZlqDrfI20aiEXu1HrnU97r0k1wL28iMpNk3R6TJnd+ZX9dMB
         wemQ4uCx3awts82n4PzsFcOjz6lLNZFjJhQiSYps3Dp9xbAZZmZq1+dOms5ADO1MR7Cx
         rrn/PRu784nLZDA2F5SriqAiiqZyZSRtVeraQmFedrH1BHtWlRNL3PbVPIhUyoU07qwi
         LKR2kwljl1XdgdbJO5xZhpCTx4+pSdY/+tLIlMp+JZ9g3JD0crwXFHRhZcjNmQpKVmRc
         oInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919320; x=1765524120;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzxFs8LzMrONfI1Cn6UlkRiahNYd5MhF609UmLpQAXo=;
        b=OMf8Cqr8iBEvzST58PQj8N7DuOQnEO0O5Do2kL/jlOekOJQkGQqFTlTKl43nTCGdWY
         3YMyj+jBnkQATkH/G/zRpf6Tyk3Evz7eKBG9BspYhnHEDIiE7Oq3MOg3fBl0zdETOFGx
         Jvlzzd/fbetyyew5bVDowcCh6HncOEiKL7mDwbhwlQzhmlXafPj3UoOg6u9fSDy5Rxua
         vHFrl3qPGdTZi5eehxGmtRamCCA2dirIimaLvuvbPle9lnlH250etq0z2mL466FGP2II
         ZFz+N/ylv3wI9BNSPCetMw3n+5BbZt9EpEXFyutcREYMWj9N79bX0a8LQLe5snCWjDq3
         C5YA==
X-Gm-Message-State: AOJu0YycL0BgGtd7At+0Bwhjds8Fw+/hVkuMyXiX3vXigvjbmVP7m163
	6fgSUUjHa2DSiRRCk2bP++vB7YpSwjbs3QBwcqF1GwrQeNcgy+TObZX9ZkICbsE1tJb6NlxN9yQ
	tJS3l
X-Gm-Gg: ASbGnctAYxK1KYtZJQGr+qqsGQHFpLvkuC5r9qB38JT7zo7FN2R87YjsmoDuXFGHSIZ
	wkl40qWxaqG4dOEJeN1u5/WoXoU68/4V/UmqjmWhl+znDG+K36o9cbyISqYTsc/Pw2i9cDeBLdx
	K1A+dD3BMHM6qtaYHGS84GPcSI52LMai2vO54S3WWtJ/MXNybXcpThrpf0JqmIIxIIWkYEbONtH
	rdUEKVB1cRn23fKQQomTGAzOO+YbFaJKK3mQClhaM954atCwGfZJjEMKEVlRscaOMPYeCFU3cNa
	IHH9zEbOcK7vvBUO4mZJpaunCkJaZSyKjCLQSFZvER52mLMIKjsKYBBlETYSOlfImkrOyxY8ogV
	gJyixtTj1gMasI5ACFvg0L5Pf8MuuJG0msqXcKIwFkEg/d8xXzTi0yJn827mtXnSlyMKneqh+1p
	nwRnO9PpLPE/ODwA2f
X-Google-Smtp-Source: AGHT+IGY46mYanaDcTERQwYze8S9vgpM9dAzNgia/FegejO4LmlZHO08fLRhzsVOYwX0bqvVtCm5lQ==
X-Received: by 2002:a05:600c:1f90:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-4792eb12478mr66048795e9.2.1764919319970;
        Thu, 04 Dec 2025 23:21:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792b12411fsm65146265e9.3.2025.12.04.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:21:59 -0800 (PST)
Date: Fri, 5 Dec 2025 10:21:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202512050233.R9hAWsJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>
Message-ID: <20251205072155.StU0BnhaZt8rw49JpJjYmBnQ2XVVeG7ScOYwb4uP8sw@z>

Hi Brian,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251202-060924
base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
patch link:    https://lore.kernel.org/r/20251201-clk-microchip-fixes-v2-3-9d5a0daadd98%40redhat.com
patch subject: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: arm-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251205/202512050233.R9hAWsJN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512050233.R9hAWsJN-lkp@intel.com/

smatch warnings:
drivers/clk/microchip/clk-core.c:300 roclk_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/microchip/clk-core.c:833 sclk_get_parent() warn: signedness bug returning '(-22)'

vim +300 drivers/clk/microchip/clk-core.c

ce6e11884659988 Purna Chandra Mandal 2016-05-13  286  static u8 roclk_get_parent(struct clk_hw *hw)
                                                             ^^
returns a u8.

ce6e11884659988 Purna Chandra Mandal 2016-05-13  287  {
ce6e11884659988 Purna Chandra Mandal 2016-05-13  288  	struct pic32_ref_osc *refo = clkhw_to_refosc(hw);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  289  	u32 v, i;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  290  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  291  	v = (readl(refo->ctrl_reg) >> REFO_SEL_SHIFT) & REFO_SEL_MASK;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  292  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  293  	if (!refo->parent_map)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  294  		return v;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  295  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  296  	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  297  		if (refo->parent_map[i] == v)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  298  			return i;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  299  
ce6e11884659988 Purna Chandra Mandal 2016-05-13 @300  	return -EINVAL;
                                                        ^^^^^^^^^^^^^^^
So it can't return negative error codes.

ce6e11884659988 Purna Chandra Mandal 2016-05-13  301  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

