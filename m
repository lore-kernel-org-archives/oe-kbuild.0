Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247E364C1
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jan 2024 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IWw7SIN8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e461c1f5bso20412735e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 09 Jan 2024 01:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704791869; x=1705396669; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVkEFOHlWwhz7Duf5BVOmjNadYwqkcetos6KSo/cdnI=;
        b=IWw7SIN8RX6sqdEzOiHZFIuX7SLCP2JIKvGmjKrArc/laiwFptzhz0qAN9juKmMr9+
         f+Sk/0EbZs0hH0mgPeA+VhxrnIFA/c0ykkvd3oF8N9UA5abdmXVw9TEmMLqGV8wxndZg
         Gr17jGTRANjHeE+PEBMMATzKHLBNnqlUbw/M642PmfUyBFmlvJ1bsIMm5I/tRdK5RosR
         qKeMBqz6TapfQ8yhy2I2DxNt1n2OtiUM2Dncz6oQdCjzX9j4qyYyRMc12vIcZ0NztDF7
         Ofu7o3KadJPWmUwvpyMfAul0DheQ6GCfLfL0CllheKzJCy7FOM6LEQA80bd40V6g5qxG
         QiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704791869; x=1705396669;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVkEFOHlWwhz7Duf5BVOmjNadYwqkcetos6KSo/cdnI=;
        b=In/vyP9Nt75Pbemc5etmUk+oK+VGRigdp/SyKcZ/C+M1Hf/fqXnBOFJFcFRtLMKpbN
         Lvxg8YIpgBEEiJLV2jfhyB12i+uFlhZHalBDyLZguW4aMPf+O9Kv+bPvfwTq2rQtspsM
         v+jaiPvWL3RKUvStP06OwxfVosip/atEA9Wv5QcWM+OvMjh4X2/uXaUsLT7KDyvXQk/K
         ROh+OcPMSNSPlUwM3+XG1KbXZR6+D+80nTO8rUv4+Ikdzq/4aFXLj2dfr2Tq/b37VHOt
         1NBbvdch1bpyhZ0vcKe7QxTIDbkFU4CI88pUTUqeZmHxPGo0aMrBMpmmYel8w3pNJX+B
         b2cQ==
X-Gm-Message-State: AOJu0YwFESXo1Iq+2h4rR41SjGE6ZB7aHY1L0dm7463zq0wYyjjklpuV
	2HuAFhdppKiDK1pW7EKSzMR5bhV0VBlpFh4mfiMQLYpsM2U=
X-Google-Smtp-Source: AGHT+IHYDtHCq2FubxD8DvGMVoVJReXJUMNuiPN38ZL3R7ASH6fd/DpawvPETlmROnrMCjzV/bj0UQ==
X-Received: by 2002:a05:600c:470a:b0:40d:3864:a2af with SMTP id v10-20020a05600c470a00b0040d3864a2afmr2589128wmo.82.1704791869219;
        Tue, 09 Jan 2024 01:17:49 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c351100b0040d839e7bb3sm13920978wmq.19.2024.01.09.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 01:17:48 -0800 (PST)
Date: Tue, 9 Jan 2024 12:17:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: fs/ntfs3/fsntfs.c:2661 ntfs_set_label() error: __builtin_memcpy()
 'uni->name' too small (20 vs 256)
Message-ID: <70b13673-23ce-4bb9-9842-65828650e563@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f8413c4a66f2fb776d3dc3c9ed20bf435eb305e
commit: 7832e123490ac39f85ab5befc2ceee7b25b03acb fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label
config: i386-randconfig-141-20240107 (https://download.01.org/0day-ci/archive/20240109/202401091421.3RJ24Mn3-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401091421.3RJ24Mn3-lkp@intel.com/

New smatch warnings:
fs/ntfs3/fsntfs.c:2661 ntfs_set_label() error: __builtin_memcpy() 'uni->name' too small (20 vs 256)

vim +2661 fs/ntfs3/fsntfs.c

7832e123490ac3 Konstantin Komarov 2023-05-08  2627  int ntfs_set_label(struct ntfs_sb_info *sbi, u8 *label, int len)
7832e123490ac3 Konstantin Komarov 2023-05-08  2628  {
7832e123490ac3 Konstantin Komarov 2023-05-08  2629  	int err;
7832e123490ac3 Konstantin Komarov 2023-05-08  2630  	struct ATTRIB *attr;
7832e123490ac3 Konstantin Komarov 2023-05-08  2631  	struct ntfs_inode *ni = sbi->volume.ni;
7832e123490ac3 Konstantin Komarov 2023-05-08  2632  	const u8 max_ulen = 0x80; /* TODO: use attrdef to get maximum length */
7832e123490ac3 Konstantin Komarov 2023-05-08  2633  	/* Allocate PATH_MAX bytes. */
7832e123490ac3 Konstantin Komarov 2023-05-08  2634  	struct cpu_str *uni = __getname();
7832e123490ac3 Konstantin Komarov 2023-05-08  2635  
7832e123490ac3 Konstantin Komarov 2023-05-08  2636  	if (!uni)
7832e123490ac3 Konstantin Komarov 2023-05-08  2637  		return -ENOMEM;
7832e123490ac3 Konstantin Komarov 2023-05-08  2638  
7832e123490ac3 Konstantin Komarov 2023-05-08  2639  	err = ntfs_nls_to_utf16(sbi, label, len, uni, (PATH_MAX - 2) / 2,
7832e123490ac3 Konstantin Komarov 2023-05-08  2640  				UTF16_LITTLE_ENDIAN);
7832e123490ac3 Konstantin Komarov 2023-05-08  2641  	if (err < 0)
7832e123490ac3 Konstantin Komarov 2023-05-08  2642  		goto out;
7832e123490ac3 Konstantin Komarov 2023-05-08  2643  
7832e123490ac3 Konstantin Komarov 2023-05-08  2644  	if (uni->len > max_ulen) {

uni->name is defined as 10 elements long.  So allowing PATH_MAX is
weird.

7832e123490ac3 Konstantin Komarov 2023-05-08  2645  		ntfs_warn(sbi->sb, "new label is too long");
7832e123490ac3 Konstantin Komarov 2023-05-08  2646  		err = -EFBIG;
7832e123490ac3 Konstantin Komarov 2023-05-08  2647  		goto out;
7832e123490ac3 Konstantin Komarov 2023-05-08  2648  	}
7832e123490ac3 Konstantin Komarov 2023-05-08  2649  
7832e123490ac3 Konstantin Komarov 2023-05-08  2650  	ni_lock(ni);
7832e123490ac3 Konstantin Komarov 2023-05-08  2651  
7832e123490ac3 Konstantin Komarov 2023-05-08  2652  	/* Ignore any errors. */
7832e123490ac3 Konstantin Komarov 2023-05-08  2653  	ni_remove_attr(ni, ATTR_LABEL, NULL, 0, false, NULL);
7832e123490ac3 Konstantin Komarov 2023-05-08  2654  
7832e123490ac3 Konstantin Komarov 2023-05-08  2655  	err = ni_insert_resident(ni, uni->len * sizeof(u16), ATTR_LABEL, NULL,
7832e123490ac3 Konstantin Komarov 2023-05-08  2656  				 0, &attr, NULL, NULL);
7832e123490ac3 Konstantin Komarov 2023-05-08  2657  	if (err < 0)
7832e123490ac3 Konstantin Komarov 2023-05-08  2658  		goto unlock_out;
7832e123490ac3 Konstantin Komarov 2023-05-08  2659  
7832e123490ac3 Konstantin Komarov 2023-05-08  2660  	/* write new label in on-disk struct. */
7832e123490ac3 Konstantin Komarov 2023-05-08 @2661  	memcpy(resident_data(attr), uni->name, uni->len * sizeof(u16));
                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Btw, I feel like if CONFIG_FORTIFY_SOURCE is enabled this will be a
runtime issue but I don't know for sure.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

