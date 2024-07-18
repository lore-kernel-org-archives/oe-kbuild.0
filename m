Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE9612C474
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jul 2024 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721316481; cv=none; b=t6iblHXbs0E18NCyDPFlAX8VxWfwEehRdfMLc4OlPl9BoF8BzEglKHAfF5kyCzNociLjwg0mDzVWoT5j3NlvusTESn07TiaN37w+6eSBQUTFzG0vNDTg16v7/RZjY4L3KGVYH0w47GPwg+CjukEkN2/2m73Jvk7WpS/PcaDRXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721316481; c=relaxed/simple;
	bh=7cZHQP8fAzCKT+FJhLCwqT+lLrJaF8iBu/6hNmogy3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pDimQ5v1/Cl3TgMe/6juK0ZeNxF2+wqMXYtlXOXtkj6nFCD0zSj90Y+o2VyxmZGY3Wbm/GIfBCoeCJvNc6Tft6/HZk42aefDDqnml0tVTYHE3xI06v2LChkXuGzQ2usQmDF/xNt4nQDhsX2Qqm4/vSbVJL+iapLF4z+EJSjFcAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STJA0d0m; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STJA0d0m"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-706dea920f3so406417a34.1
        for <oe-kbuild@lists.linux.dev>; Thu, 18 Jul 2024 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721316478; x=1721921278; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFuoeTzLjl2+sNJgRuxCQvYdNiIGR6RuZRBzqWfCJQQ=;
        b=STJA0d0mG33Naw7wE6CDT8ef+pxvMX3nVuSqf9XsVVkZnWeGWlXgpvj05k7jKqy592
         1NtwoASS3qaJxVEsCUAK56OzOrp7oEbHAMRkwaUx6Zkidaihk/RWUKHw+etEgutxm7pa
         NR+fCoSpwnRH2kpGfsYXtoMixjpitfiEXiwH+F7tzwjgzOpAnDG7NBStUFwHvGCgVRnP
         pP5lfqdHKewhsVbiWXNwxmfXGdhR9lOxQ/HZxx34orjETTJDAysDkihWx79tZYWrfnKm
         usMnv2hBXIG6Vgxe7STFHKLgxw3gFyiTxxYXSKggQ/dZD62cgVvCU4Bz33fpVfqt44aN
         /qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721316478; x=1721921278;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFuoeTzLjl2+sNJgRuxCQvYdNiIGR6RuZRBzqWfCJQQ=;
        b=O6AQDrcUkC5M80l5HtDEKodG1gbeTn5F4Ew7JnsbSVjNJIF1XImU4ch6Bp2HpXBjSx
         YJRAuSFs5BV4ws1ZbgBpeQfnIiC0qLkRc6S/GLOdrfZy1OyIddA0zHRq1ZxPx12KJtTL
         5tL4onz9Y7CGjuwA0MThtxWLksv9f1KoWltCcqbLlVD4RGYTGEQigRLlp3G1mnMbxjkY
         kRLHP6hpOUTbLkDQ+9WoCCr5/9IQ9ffyetdagG/BE55obEiscnm9bZj0W6MB4sE4ixf9
         COWtCa5DMeoJL6pd5Dju9kc6AzV3HYi6Zp0VDsXeJKlgQfwa3Qu/mrueEB+jBBdkw3FN
         rpGw==
X-Gm-Message-State: AOJu0Yw9WaWnk8Rxj0pPzUGy2kB+SCEfgXnaxuBVw07ssLyTRElOCJMe
	Un7HngueITfWFK7sA/MCFUBKTIzq2fFPLrY1FKU9eVnRJygq2NJeer+Mv1GG6oofUAshvQa3/8O
	Y
X-Google-Smtp-Source: AGHT+IECRzrkp2OK2/9kQbAk6sEa0OvgiXvImrg/fRA1kUBl73W5L+d6uMpxtPD+FT6kVOA+0ts7iw==
X-Received: by 2002:a05:6830:610f:b0:703:59e5:b083 with SMTP id 46e09a7af769-708ea0ed71dmr2005019a34.17.1721316477806;
        Thu, 18 Jul 2024 08:27:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1a6d:d3d6:98e4:34e1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708e79013absm471194a34.73.2024.07.18.08.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 08:27:57 -0700 (PDT)
Date: Thu, 18 Jul 2024 10:27:55 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mike Snitzer <snitzer@kernel.org>
Subject: [linux-next:master 12153/13432] drivers/md/dm-integrity.c:4559
 dm_integrity_ctr() warn: impossible condition '(bi->tuple_size > ((1) << 12)
 / 2) => (0-255 > 2048)'
Message-ID: <70e61f94-d4c6-4ef6-9e72-d65017a745bd@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73399b58e5e5a1b28a04baf42e321cfcfc663c2f
commit: b40cdccafe29f2192807b44130cf5099337ebf8f [12153/13432] dm-integrity: introduce the Inline mode
config: i386-randconfig-141-20240718 (https://download.01.org/0day-ci/archive/20240718/202407182211.faX85HCP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407182211.faX85HCP-lkp@intel.com/

New smatch warnings:
drivers/md/dm-integrity.c:4559 dm_integrity_ctr() warn: impossible condition '(bi->tuple_size > ((1) << 12) / 2) => (0-255 > 2048)'

vim +4559 drivers/md/dm-integrity.c

b40cdccafe29f2 Mikulas Patocka    2024-07-10  4525  	if (ic->mode == 'I') {
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4526  		struct blk_integrity *bi;

bi->tuple_size is a u8

b40cdccafe29f2 Mikulas Patocka    2024-07-10  4527  		if (ic->meta_dev) {
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4528  			r = -EINVAL;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4529  			ti->error = "Metadata device not supported in inline mode";
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4530  			goto bad;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4531  		}
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4532  		if (!ic->internal_hash_alg.alg_string) {
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4533  			r = -EINVAL;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4534  			ti->error = "Internal hash not set in inline mode";
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4535  			goto bad;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4536  		}
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4537  		if (ic->journal_crypt_alg.alg_string || ic->journal_mac_alg.alg_string) {
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4538  			r = -EINVAL;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4539  			ti->error = "Journal crypt not supported in inline mode";
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4540  			goto bad;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4541  		}
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4542  		if (ic->discard) {
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4543  			r = -EINVAL;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4544  			ti->error = "Discards not supported in inline mode";
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4545  			goto bad;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4546  		}
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4547  		bi = blk_get_integrity(ic->dev->bdev->bd_disk);
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4548  		if (!bi || bi->csum_type != BLK_INTEGRITY_CSUM_NONE) {
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4549  			r = -EINVAL;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4550  			ti->error = "Integrity profile not supported";
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4551  			goto bad;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4552  		}
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4553  		/*printk("tag_size: %u, tuple_size: %u\n", bi->tag_size, bi->tuple_size);*/
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4554  		if (bi->tuple_size < ic->tag_size) {
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4555  			r = -EINVAL;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4556  			ti->error = "The integrity profile is smaller than tag size";
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4557  			goto bad;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4558  		}
b40cdccafe29f2 Mikulas Patocka    2024-07-10 @4559  		if (bi->tuple_size > PAGE_SIZE / 2) {
                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
PAGE_SIZE is never going to be less than 4k and 255 is lot less than
PAGE_SIZE / 2.  Was something else intended here?

b40cdccafe29f2 Mikulas Patocka    2024-07-10  4560  			r = -EINVAL;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4561  			ti->error = "Too big tuple size";
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4562  			goto bad;
b40cdccafe29f2 Mikulas Patocka    2024-07-10  4563  		}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

