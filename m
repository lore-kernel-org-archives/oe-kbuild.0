Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447FC18CC1C
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742029445; cv=none; b=CXhSSUc1sky5PY+svp3MW+m1twY72zvenaycM664eqzhIBOaSD/KsmZb8T9LuRMVcIwYh19oS3TY/yYLoQd9QSQZgJulYSufTo5UREOoXX40r4nSlQ9n32jw6NnEnBsYmi+VcMcVlqb9FpuWmFPT9MGG0TWRUKmWgKhown1ABaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742029445; c=relaxed/simple;
	bh=ZqzLxLBEb6qG7zJa7wfGi8kV1SqoGMh6nz0KTQTE/fE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/ErxRmNFDtUl0YxFQmw6GsNSLFNtzUbBNzdSnXgomST1CBtfSh/fLa4dCveUp5tiKSQ2NHQSzsF/wjsukrCryZUhjJY0DC+++9y5gLMqXuDxmHsBOjgmSXqpyf0i9fxYCpmGxthDq2JDfVIcrQc+F3XVaGY+h9F8B9VOZk7VP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O/7/xwtX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O/7/xwtX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0618746bso3152155e9.2
        for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742029441; x=1742634241; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3dbB/ofNXxxiysUhxY/Xsfai0QWByWlEWQ0X0rHDeUs=;
        b=O/7/xwtXBQghDqxEub/rzkG4yMw4tujAPQQ0L5/9rD9f/1Km3C3ksofH2FzBKC7S4K
         TZBY1RGFLCqazhCghwZ06Nz/0HPFxa1DDMg4OJ2+2g04l7aWEqP4r/PqxmzSPZkxN6VG
         lUi30HAR9yEtFTvcwlmcp1s58jleBwz875LTd77rtR57ZqGr+tj8eShEf2BlJLVxmh/B
         dSb9WiEq94pp3MuKxRDGAEYWMIlm1ryfyMQ2t6WzXCtXhBp4MBMDVRt+Py8KmQzCE8FF
         VqBLkNWSUKkwaQ+zI7Lf2+kBdxY0iSCZBP7i6ICuoCKwVpolILpsytFy1Qa4rbMDkNjE
         5Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742029441; x=1742634241;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dbB/ofNXxxiysUhxY/Xsfai0QWByWlEWQ0X0rHDeUs=;
        b=E7h2K/lyI1TD7z8Q9nBtTarOoxJU328Q0GISuunQ/SDbZUv0KlNrUuP1MCtzqy8Fcm
         Q1i/G3Cp4reYl949Abi03IfkZsqg+aC0DLm7cw/JT838EP0pASvoeYviw+ox+8voJP1V
         6fE9iZoPVGdml67FCD9F3UDGfG5UC4HrO9RZXmWfg8G0PnudiWxXQ06mhrun4F3TJb7B
         Acg3HsT8gYNFODGvgQUm7C19k+tVI//b53lGSdm/WpGCoFUtG+WkJdKVd9u7s8K3tbHr
         0+tc2uOtSmtxzjzJnL0HbW/gqw7VSqimof7Z36+EeqS9qklDWRVVettKb+ZVM05c8O8Y
         OB3A==
X-Gm-Message-State: AOJu0YzwBe+1Dr88R7Ff+sdD6ChjHIn4bm1a7Bnz9tzp6DCjVec2ORTC
	w/a5k8sjSRRlXzAG2TLJYab1Mtl4f6G6AE3mG9xl0qKaRWiQPqVWf6EFXgw0YlEuAD76wAdqUWw
	Z
X-Gm-Gg: ASbGncsMMoZX3zCV9k/w4nF68sh3gsbGHwRsuZEqUXfk7c0XErpWc6Znuiqbfk3Rjuv
	NJJtGj+WqX70lIWAgNh+hJT57UPVA76XsLdjSIbaat6EfJGLrp2755gLaVsoLxFF84yyF/jBTcm
	m7gsi+nVrpszQ5L+AE4yJ0erdYGmrzQOP2pEWjE2ME6ZNhoh6LxgguSAd8GAqs5D5LlYuhRqs0Q
	JUizEWco5chhXl/91xFkw45UMSVmTIDMQBXWU1UVsXniCYDoElKIQN9uXY9VYisKwjoFiX0n0JU
	7QndvR/sJ5eTiQny8mcc7ybyRprIGoxIqsHHRa34Y94A94NamQ==
X-Google-Smtp-Source: AGHT+IGELyqbGxiKZpcd1sas1GGAA6ZYHKglj2RXbO764sDWPILYXArG7iWbnRkdJpvjqkTSDdACDA==
X-Received: by 2002:a05:600c:3c8b:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-43d1ecc7b28mr76592925e9.16.1742029441292;
        Sat, 15 Mar 2025 02:04:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1ffbfa90sm42856785e9.16.2025.03.15.02.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 02:04:00 -0700 (PDT)
Date: Sat, 15 Mar 2025 12:03:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.idmapped.squash 9/10] fs/mnt_idmapping.c:384
 alloc_mnt_idmap() error: 'idmap' dereferencing possible ERR_PTR()
Message-ID: <74e7922d-d803-4b67-9411-dc5aa7f5e2f1@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.idmapped.squash
head:   97968d12e00d95bcc960a4fbd00fdb3ceb7e0c29
commit: 27ead64a2c3d23b290e9cbff36f10b9fe9fe71f8 [9/10] mnt: add VFS {g,u}id squashing
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150052.sDyHku8X-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503150052.sDyHku8X-lkp@intel.com/

smatch warnings:
fs/mnt_idmapping.c:384 alloc_mnt_idmap() error: 'idmap' dereferencing possible ERR_PTR()

vim +/idmap +384 fs/mnt_idmapping.c

3707d84c13670bf Christian Brauner 2023-01-13  367  struct mnt_idmap *alloc_mnt_idmap(struct user_namespace *mnt_userns)
3707d84c13670bf Christian Brauner 2023-01-13  368  {
3707d84c13670bf Christian Brauner 2023-01-13  369  	struct mnt_idmap *idmap;
783822e44594639 Christian Brauner 2023-11-22  370  	int ret;
3707d84c13670bf Christian Brauner 2023-01-13  371  
3707d84c13670bf Christian Brauner 2023-01-13  372  	idmap = kzalloc(sizeof(struct mnt_idmap), GFP_KERNEL_ACCOUNT);
3707d84c13670bf Christian Brauner 2023-01-13  373  	if (!idmap)
3707d84c13670bf Christian Brauner 2023-01-13  374  		return ERR_PTR(-ENOMEM);
3707d84c13670bf Christian Brauner 2023-01-13  375  
3707d84c13670bf Christian Brauner 2023-01-13  376  	refcount_set(&idmap->count, 1);
783822e44594639 Christian Brauner 2023-11-22  377  	ret = copy_mnt_idmap(&mnt_userns->uid_map, &idmap->uid_map);
783822e44594639 Christian Brauner 2023-11-22  378  	if (!ret)
783822e44594639 Christian Brauner 2023-11-22  379  		ret = copy_mnt_idmap(&mnt_userns->gid_map, &idmap->gid_map);
783822e44594639 Christian Brauner 2023-11-22  380  	if (ret) {
783822e44594639 Christian Brauner 2023-11-22  381  		free_mnt_idmap(idmap);
783822e44594639 Christian Brauner 2023-11-22  382  		idmap = ERR_PTR(ret);

return ERR_PTR(ret);

783822e44594639 Christian Brauner 2023-11-22  383  	}
27ead64a2c3d23b Christian Brauner 2025-03-11 @384  	idmap->vfsuid_squash = INVALID_VFSUID;
27ead64a2c3d23b Christian Brauner 2025-03-11  385  	idmap->vfsgid_squash = INVALID_VFSGID;
27ead64a2c3d23b Christian Brauner 2025-03-11  386  	return idmap;
27ead64a2c3d23b Christian Brauner 2025-03-11  387  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

