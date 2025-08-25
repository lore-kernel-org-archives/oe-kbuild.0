Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF3E22B8BD
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106792; cv=none; b=tKCZ+c66J6KffSmPQcJIp4HGArmXbVbA7SPJVt9WG09s23haJyEWQqVhdRXXOCAPZN33NR/oUCvJFKwMMBXKX4yEgOWUYa4Tjc2MMCdPig8jHlbcvXWLN31dFh8zpAdgNuCxODxLUYuTGTHBuraUPM71fXB3zrdYAtFSJAL8alk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106792; c=relaxed/simple;
	bh=XcfUHZbpminC1LjKkK7GBwQm3RDpQBVIen2tXQ3GtPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HvbgbwMnphKXe3m15V9e/u2zbk0ukmcTwJ7bIukbicMEKLH5TcfIm+ZSe+fcT/RGHAoU47mqezVLruNPVfcu1QaMQi8ccMYACXlf51nJonFiTos9TLgxgEaDlLmVT7hYKjl8sShJ4tzaDZUq2CbNSwiSk+bmQDTjY3xypwgHKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bc7FhKWX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bc7FhKWX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b627ea5f3so975875e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756106789; x=1756711589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YXW4WXdZbpuVMj+45X2QEx8cTs8sv2KAIiv17RXifaI=;
        b=bc7FhKWXwEHIieef3kFe3QU4Sim8F8W70wwY4gLvT9BTDR5PNvqBBUZLMFpbkBMKf/
         UXCZJB9ntuMPKt1tC1lDoIQF/AvLsbsdTw0M5i/qNCS6JzZICvf7e7SLAUYD+VCoipX1
         1oVWY9NrJuHraafBDs2yLoOJpOGqB4N0TGiQvaQ+0t6daqoYzh/0vMiSirFHpYj5WH+R
         1r466B9vw0MzUhdrltsgxWJ7FPFWeB124q7anHaz47m2c8lmj/uad5DwzhSMYXP1Wwes
         w9sbOj7YE3DzEvI6pHmhinW7RvZtrm9jW7AowRA200INZ09a4PNVMfbJ2KddrOgITmSM
         Kx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756106789; x=1756711589;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXW4WXdZbpuVMj+45X2QEx8cTs8sv2KAIiv17RXifaI=;
        b=hals/HyDwOi4caBdSX8rkFQb+svNCRyPLdiBGwqoSIE472yta32aDvjpRJ/0PHMxL+
         +9+PZp4wuG/clNwX4rJcBdq5gjCfU/FDWwZTq2uAW/2eSm+oR39E9qwRBx4BYWjRqodK
         SLGKKJ7Xt4myWDM/pzWD6xG9i4QhjJ7QtGKIhwGs5q2d1DhQeA+3XcpS3kg7Jp1vCilV
         RlL0mhU8fU0DVmua7dY1vd8sh4Da63ctgdMEplgm3K7+1ui7+kqpd3CDjv1HtVlkQX87
         Uc40KLzDTRvnZAuyrbVnyFhXHEBY50PxyWW9hgcauQQCbaD4USP0JLGtZnwTc2DEj1HX
         d27w==
X-Gm-Message-State: AOJu0YytfOsra6arSuSCaOIuAMo/SGV76HrN6szFvSTrEJDHFCAJ5aI9
	IF8ldBh70VgaCiApibN92JvPXqPm5X8xmpkX40pdSUi2CKyOtuwqAbHBDhLH2otAMTJL+HWo6RO
	nY9hv
X-Gm-Gg: ASbGnctG+WPetRvYvZk6rZraVnuFqXtI+Y1jjVSTemaGNyeX3juAK5cZkzPO9oKGGXe
	gh44jWFo4dxm+AJsKC/sS/QFQbSOAqdGq4cufyeVya7LNvtZn5p+rdVZTxKprsr+gBTJr1tK4fH
	gTGOk4a6h3z9q6ooGXuJtsM3bsczdqTOqAdq2NbUZN+sUSn4bqjgwsuiYIK8dcZrTZvPD+BdWmN
	fhrXT9r6mBGrrzZZQzS03H/HTEyTG9Am8Ludil5PHMfUT79I51iAFNNJxGuHbpyFy58szLgzKAT
	5GmwLQXu+7qPCiYxCMH4eTD6/Fv+vfSU7kixt8xKrWXUpLw10g0uuIXaV/RuqppbP3WU8JMIlNz
	xCEpvwi3A4GUjyl2V3vN58pXLw+4=
X-Google-Smtp-Source: AGHT+IHr3tXyCt5Yvc6g17pBN46i+4YotNdNbVGbK4q48niWSb9xQKqdHzzLOgg+Scq9+9QVsNBEzw==
X-Received: by 2002:a05:6000:24c7:b0:3c8:1df2:540c with SMTP id ffacd0b85a97d-3c81df25723mr3798109f8f.43.1756106788624;
        Mon, 25 Aug 2025 00:26:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c7116e1478sm10327401f8f.46.2025.08.25.00.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 00:26:28 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:26:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	jfalempe@redhat.com, airlied@redhat.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum
 ast_dram_layout
Message-ID: <202508240748.TUAvbluX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822132846.25376-7-tzimmermann@suse.de>
Message-ID: <20250825072624.1R1lyOb2oolmzD6cFhTTE54d6zU8pQgJQaD41G9K2Dg@z>

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-ast-Do-not-print-DRAM-info/20250822-213333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250822132846.25376-7-tzimmermann%40suse.de
patch subject: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout
config: i386-randconfig-141-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240748.TUAvbluX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508240748.TUAvbluX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ast/ast_2100.c:63 ast_2100_get_dram_layout_p2a() error: uninitialized symbol 'dram_layout'.

vim +/dram_layout +63 drivers/gpu/drm/ast/ast_2100.c

334d62edac4c5b Thomas Zimmermann 2025-08-22  38  static enum ast_dram_layout ast_2100_get_dram_layout_p2a(struct ast_device *ast)
b59465efc7cb88 Thomas Zimmermann 2025-08-22  39  {
b59465efc7cb88 Thomas Zimmermann 2025-08-22  40  	u32 mcr_cfg;
334d62edac4c5b Thomas Zimmermann 2025-08-22  41  	enum ast_dram_layout dram_layout;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  42  
b59465efc7cb88 Thomas Zimmermann 2025-08-22  43  	ast_write32(ast, 0xf004, 0x1e6e0000);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  44  	ast_write32(ast, 0xf000, 0x1);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  45  	mcr_cfg = ast_read32(ast, 0x10004);
b59465efc7cb88 Thomas Zimmermann 2025-08-22  46  
b59465efc7cb88 Thomas Zimmermann 2025-08-22  47  	switch (mcr_cfg & 0x0c) {
b59465efc7cb88 Thomas Zimmermann 2025-08-22  48  	case 0:
b59465efc7cb88 Thomas Zimmermann 2025-08-22  49  	case 4:
334d62edac4c5b Thomas Zimmermann 2025-08-22  50  		dram_layout = AST_DRAM_512Mx16;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  51  		break;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  52  	case 8:
b59465efc7cb88 Thomas Zimmermann 2025-08-22  53  		if (mcr_cfg & 0x40)
334d62edac4c5b Thomas Zimmermann 2025-08-22  54  			dram_layout = AST_DRAM_1Gx16;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  55  		else
334d62edac4c5b Thomas Zimmermann 2025-08-22  56  			dram_layout = AST_DRAM_512Mx32;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  57  		break;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  58  	case 0xc:
334d62edac4c5b Thomas Zimmermann 2025-08-22  59  		dram_layout = AST_DRAM_1Gx32;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  60  		break;

Should there be a default case?

b59465efc7cb88 Thomas Zimmermann 2025-08-22  61  	}
b59465efc7cb88 Thomas Zimmermann 2025-08-22  62  
334d62edac4c5b Thomas Zimmermann 2025-08-22 @63  	return dram_layout;
b59465efc7cb88 Thomas Zimmermann 2025-08-22  64  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

