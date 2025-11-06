Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAE632BF41
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Nov 2025 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434508; cv=none; b=SAC0zH5w+vj2XrFJGLW9x5OKVrd+Gl2pUhLfq6Du8//jUI/TpeFTg4Gvaax/Ju3DknypEZEyULk28H+kzqJepkIVicZ889neysauh0Qtk1xTpU2lWVnHFdjLnX60t8EE05rKxH9Id9hSKX3BdQjgzTZihbObCTipK3ySCbadBag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434508; c=relaxed/simple;
	bh=8wi8v4pafiCAVW0LlbviwrSq4+RD7ApxtwSAV0zAito=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ny6CJYar3jpneHLnGGpDn0VBUnsaYLGXHm6nYUzuqoMj5xGqVbeNQafTB5j3Gz9/gCXksX6yiExMX7yIJQreoxA/rbGn5cOPie5yUdYVIFhL3GupTl86E+uus7rQJFZjJWfqL4N+q3TXhsdp/SA/tpIwLAqGqIzI857TucxDYYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/aGCYY/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/aGCYY/"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so1369997a12.2
        for <oe-kbuild@lists.linux.dev>; Thu, 06 Nov 2025 05:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434504; x=1763039304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enqwyA/A3yCA7Wm2D9J7INIOgAB6+/16vEu7wgpBUcE=;
        b=V/aGCYY/74dhSsIAE2erN91on+nO603tCLpsULyGOjkMerBp9Mb4z7HopfIavZSOUr
         Wha+ZiFvYdZhFAKZsWD1KOn8vcK9bCEmPqUBNV1wIS8hWjAqtdUO/qPIlHaTVZf8DCBB
         Pcxdeq7XwXx9JuMbCfIga8/5X3CeWeoV1NiJCV/WcipuuGXX2isUa/0czezkbKvrRikr
         61G1mAtdN0TJY0UVq0f44VgO6mfhV6TAufVeJZb7vaJ/5gibpsNLIlkyvf5GO7+TpaY6
         lwbf0+3uORzLhPHTk9jDg+e7+uyNgEOM2d+ke9Av7khrIwtydKvmumY15add/rZeEk9+
         fqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434504; x=1763039304;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enqwyA/A3yCA7Wm2D9J7INIOgAB6+/16vEu7wgpBUcE=;
        b=mpe5TU8Ys9A9u/4ec6Ol1NoD4Jybe36B3+bUZhI1u/lyxrSd6UewfL3yT6D6XT9mei
         877UPLRd4xCYp/Y3MXFn2aT3O35m8K6DXQuTe04vu2/F9HKvtS8FNsPS7tDZYdAF/HnR
         sr3iOq/p3G3xMiTur2T3i0pswVH6R49td+fTeBu+FSBXJlWGyl76rzeOTGav1Z+30xyl
         +TDf/rLVj+RfQ8o6TKGkgPW/C+E4ORXOk6sTWS4TdaURGCSK9IJOZekJMcWnr9C+trdW
         qWh04ormdjx4kgGlYy6iA+Y4Ma8UgD9CJCZeuRdn3eRY4VgbPoWB34XbrpNFesQc820Z
         pWdQ==
X-Gm-Message-State: AOJu0YwLaVck5zJtEUkLUG4qy5dKWjFArzask+Ng9Kf6swX5EfYLfkgw
	dYNUb897FIPPAbDGbW2Skf7agk9qHI8gnOtOVPEQ38R9KQ7mknMm2k9+vjn4lGlE9/7ni3qquv3
	cbFhU
X-Gm-Gg: ASbGnctFGuEwyZvFv1/ATIjw9KTzt1E5FIJY0W8OhErs95eFmpwe91DhCGD7LhWnhGa
	i8u6ta3+W0j0OQzlRlq3j6OlNERNW+LSQOTsLtiVI4g7RrItp/2rULuQSCcFIuw0cY6UMbOW4Em
	f4AwnnP6F0WoziXrFhc9MZFkzpd15kF+5T44NypYthDMailC9i+JUvhDqnLQloAwqrQ2jkdDX4y
	ch3I8gOS7X0FL3fjGB7MQROk6KAsg5pF6HEp+O2gpOs+HIhIe71VN7R+9rmUALK/h4vYEiQW7ts
	68cBTVK8Uq3LAOfwB1pRTVx1cOLFt0X0+5A+kbqnNb6TkcWTsdCFzWacvZsE33bWulzQ7G/ipvl
	ufcSxS/4pGCVleppGUQFY1WPn6Z6FqXySnbejpQX6iouRMA0S6oTKHEvwHegWRmeFBeeLQgBmxx
	3G1RdyUGBbDzSo
X-Google-Smtp-Source: AGHT+IFDbNceai8kygqAPsrd4nZO/xDH+qcQBTNTFiNY8JYz+2UNeSt3srq3B3R4fGOrxSuhtxFg2Q==
X-Received: by 2002:a17:906:c103:b0:b70:7d61:b8a5 with SMTP id a640c23a62f3a-b7265603d1cmr729211766b.62.1762434504394;
        Thu, 06 Nov 2025 05:08:24 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72896c8e29sm208344066b.74.2025.11.06.05.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:08:23 -0800 (PST)
Date: Thu, 6 Nov 2025 16:08:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Francesco Pompo <francescopompo2@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Pompo <francescopompo2@gmail.com>
Subject: Re: [PATCH] efistub/smbios: Add fallback for SMBIOS record lookup
Message-ID: <68a428fd-aad8-4540-a509-d33ba116b5b9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102001411.108385-1-francescopompo2@gmail.com>

Hi Francesco,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Pompo/efistub-smbios-Add-fallback-for-SMBIOS-record-lookup/20251102-081803
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20251102001411.108385-1-francescopompo2%40gmail.com
patch subject: [PATCH] efistub/smbios: Add fallback for SMBIOS record lookup
config: i386-randconfig-141-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040131.8yGeRa6u-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511040131.8yGeRa6u-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/smbios.c:55 verify_ep_int_checksum() error: buffer overflow 'ptr' 5 <= 14

vim +/ptr +55 drivers/firmware/efi/libstub/smbios.c

d45578057224c4 Francesco Pompo 2025-11-02  48  static bool verify_ep_int_checksum(const struct smbios_entry_point *ep)
d45578057224c4 Francesco Pompo 2025-11-02  49  {
d45578057224c4 Francesco Pompo 2025-11-02  50  	const u8 *ptr = (u8 *)&ep->int_anchor;
d45578057224c4 Francesco Pompo 2025-11-02  51  	u8 sum = 0;
d45578057224c4 Francesco Pompo 2025-11-02  52  	int i;
d45578057224c4 Francesco Pompo 2025-11-02  53  
d45578057224c4 Francesco Pompo 2025-11-02  54  	for (i = 0; i < 15; i++)
d45578057224c4 Francesco Pompo 2025-11-02 @55  		sum += ptr[i];

This loop reads across a bunch of struct members.  We would normally
use a struct_group() to say that all the struct members are grouped
together.

d45578057224c4 Francesco Pompo 2025-11-02  56  
d45578057224c4 Francesco Pompo 2025-11-02  57  	return sum == 0;
d45578057224c4 Francesco Pompo 2025-11-02  58  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

