Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E613D244
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728824902; cv=none; b=TaTWBJ0jyOK5HSh+k1nXaxmRnTgUTpgCVpAWp7LTnHnweyBXsjWg/zNexKhCMfmWO3rAiDH349zKZgU+87C/TqEnhEUwUahy9OqW6GxKulPDebCEfGaGrjSdx8tT5zTdKh5szuwL5ek+G2DV8TcCDBiHl9De5Pp9OETrYsntGcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728824902; c=relaxed/simple;
	bh=UzwP+v7wSYe0vRug8F7Q/yE+ZrNVEpXmHSGfLFKU8vM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rrw/MYG1aBvqkU8Gg+5Mhhgt7PaBFsKMW2vHiiialk5lGleImYugMbb0yDYJZ/Akubvwjl0mf3WODUWhxmOj772qqaDkxy9Vl2t5PEyAdKNeMfIwCD4/D3FOtCP2EaYwsN6+x85dYm9V06a4FDHcCOzDBvmdew1XgJNU9+YF9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlV6C547; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlV6C547"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c97cc837c3so195218a12.0
        for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728824898; x=1729429698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgHxcpCnt1m28Spmy794S8e8vo0cvEqjskS68PjwE4k=;
        b=jlV6C547rFf2PfxIgIy1GCmLAyaD3sZmX/qY4QTPqX7NmRXYgUhN1Met6RxjAem+Wu
         0vdegraNpiqBbA1ft/WPSo7iiNyPdjrIzB2dVgnxwLFMN3tfACywYLPJKRWDisDxgkO+
         qqQ3EwD4j3tddGhOjcvDFDDd5oRO4J7APC76RQNP1Nna+726f+SndiCZoViFRFGiG/CY
         Zsu0cpESffeRbGzvvgOA6G6/7DCcL1toDtjmReVgK/mt69HoHnXl4RKwcMolZjj3tvEI
         QChoxhVUOzCkZELW5tfaI7PtS2Rtqvw1QIlofT5UwN2Eq4P2+LCfNomb7kMOBJ2PxNky
         E9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728824898; x=1729429698;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgHxcpCnt1m28Spmy794S8e8vo0cvEqjskS68PjwE4k=;
        b=h9m1g36pAzd95sjFWT43mefjuqc1iDJnaT+YTmw2pcD0lbiqtoiWEu255adwAeMgMq
         NBU7TGAlD/Ip2CAOjfuf8deH+5rcGGGv1rS5be40p/B1Lv6kB/SWgBRyLhJwWFiCMq9k
         1iNsSi+/Z36ZRAPnyDRIIW3eONorZtKpR14rK4W4viRIzwH5mMhPwHQ4NhPFisuDFxVb
         fHH8x6JgHB2sGYiBu4cgya1agssuLSXx6MBBVtLc6va/b39vjIrN+FU4a43tv5AxmxLe
         LaCxjPx4vTKaBmp+XVX+h1vkSmhjUXpwZMbyVs2hpXd/FdK/KjP4wtNeRnH9icD8vTiI
         YaiQ==
X-Gm-Message-State: AOJu0YwkVscoGJw0+A5IeAgzF6Qmw/x9hBSGJyt8cfSRgkGQuP0cbsvJ
	BKHMG+R6rHeiDKrDx6AorOdSYzbJJc/GaABqz7HCh7DX50XU6IrdBsv8DuJTN+TiJnj6hg4G9Vl
	p
X-Google-Smtp-Source: AGHT+IGwEWE371TARzktggzetrHDP4kTrhJ9brqkPyC9v+9STeYVdsEo8EWbdpgQCfEd+yto1WG10A==
X-Received: by 2002:a17:907:9489:b0:a99:e98f:e73d with SMTP id a640c23a62f3a-a99e9900010mr296287666b.37.1728824898043;
        Sun, 13 Oct 2024 06:08:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937298cc5sm3745677a12.93.2024.10.13.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 06:08:17 -0700 (PDT)
Date: Sun, 13 Oct 2024 16:08:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hou Tao <houtao@huaweicloud.com>,
	bpf@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Daniel Borkmann <daniel@iogearbox.net>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, houtao1@huawei.com,
	xukuohai@huawei.com
Subject: Re: [PATCH bpf-next 08/16] bpf: Handle bpf_dynptr_user in bpf
 syscall when it is used as input
Message-ID: <47cda1ac-3d40-415a-a36c-833efbbfa19c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008091501.8302-9-houtao@huaweicloud.com>

Hi Hou,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/bpf-Introduce-map-flag-BPF_F_DYNPTR_IN_KEY/20241008-171136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241008091501.8302-9-houtao%40huaweicloud.com
patch subject: [PATCH bpf-next 08/16] bpf: Handle bpf_dynptr_user in bpf syscall when it is used as input
config: x86_64-randconfig-161-20241011 (https://download.01.org/0day-ci/archive/20241012/202410120530.zUoa1scp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410120530.zUoa1scp-lkp@intel.com/

smatch warnings:
kernel/bpf/syscall.c:1557 bpf_copy_from_dynptr_ukey() warn: 'key' is an error pointer or valid

vim +/key +1557 kernel/bpf/syscall.c

e1883aa78ac1fe9 Hou Tao            2024-10-08  1543  static void *bpf_copy_from_dynptr_ukey(const struct bpf_map *map, bpfptr_t ukey)
e1883aa78ac1fe9 Hou Tao            2024-10-08  1544  {
e1883aa78ac1fe9 Hou Tao            2024-10-08  1545  	const struct btf_record *record;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1546  	const struct btf_field *field;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1547  	struct bpf_dynptr_user *uptr;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1548  	struct bpf_dynptr_kern *kptr;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1549  	void *key, *new_key, *kdata;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1550  	unsigned int key_size, size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1551  	bpfptr_t udata;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1552  	unsigned int i;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1553  	int err;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1554  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1555  	key_size = map->key_size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1556  	key = kvmemdup_bpfptr(ukey, key_size);
e1883aa78ac1fe9 Hou Tao            2024-10-08 @1557  	if (!key)

This should be if (IS_ERR(key))

e1883aa78ac1fe9 Hou Tao            2024-10-08  1558  		return ERR_PTR(-ENOMEM);
e1883aa78ac1fe9 Hou Tao            2024-10-08  1559  
e1883aa78ac1fe9 Hou Tao            2024-10-08  1560  	size = key_size;
e1883aa78ac1fe9 Hou Tao            2024-10-08  1561  	record = map->key_record;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

