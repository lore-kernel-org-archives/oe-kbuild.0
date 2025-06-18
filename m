Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44122EF29C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269373; cv=none; b=eMJUNuTG7u+LNKQ5iTrHcowc+X7or+AvTJdUwV7mDfP8EoopZKodHyeJkONlcNpgJSEpcHI0Wd7cdlsCaJIMV/wq4ySDfrvAFMMDzqt6W5T8DPhczRMPaM3t+eqL3dr+WgsvV5tGI4O6oWszqgrzS+eDQPvMKx9CBp/aGOsg2lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269373; c=relaxed/simple;
	bh=fdeGnDy5vpzn3RuKTaxCNjRf02O3Qfcwavi+aZaoNE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VlXkX71Z822ktWPdiENOsEORg6n2Y+RmymzPEz6I9ZYnvQswejsm3nxLz6afhG1lYBrmm1y0/++2e+kfAmK9k5Eyir22R6UMtJ2adf0PoBy+p/iTt4ZGw4zIR3GjlfVfWRcpgosDneNYkcqrp06wpulCE8CeixNdFS/+s8yDS5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MISBlLyO; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MISBlLyO"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c13802133so2513289a34.3
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 10:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750269369; x=1750874169; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nDxAIuh4le4P8G41oVoXdzWOeBgcCDEMHyqW+lO4Cg=;
        b=MISBlLyOO+/h+HI4v+By5aq5qqg77uhrIVjagyPXahizx8ib6OWDQt0aRAZE4cvM66
         hhg6zzvC4q3sPkXfCN4FQRKfvBFvueRJM3tdAOyWddcHw9JVFDcjWrKBZuWYpFVYv+eV
         LU+Ym2PRwgFfUpZXSA+xxLsbpSKyIBmELoR1q3inaulB4VNNyOoWf3wrcyjNenWLYeUY
         Xm/v5/Ui5fpECHqPU6LXf35LlumE6y8zrHmTPoCtYrzHDxAjsppFhyH/yTHlumbMexaW
         51qE+QFvAWRip1eEGgw0n77KW0gbLwavKO3/hv2F/1eo7IMQvubMPh76rTRP47zZNME6
         Hdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750269369; x=1750874169;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nDxAIuh4le4P8G41oVoXdzWOeBgcCDEMHyqW+lO4Cg=;
        b=InclJWsSru23jUDVSlLmGSH5mhPMpw+QL4n00SJYXiHGG5YY4vA/q3Ku/gPUkJ9gwY
         EPNaQAv1llHNNTtezqqMiML6wxaGiStQQ0yUgkvoclIszI7llxbCSLm7QjGstLrc5Ohk
         E7h8Xk5uENbW8tpd2zSgDmIov6F9DMotPWUzsbHxLYQtFUZBo8gYfrzwQx3aZOGaRdZh
         4SfcX753/gHCnh+wC15uiCqSYMe52BLtQqwR1Afy6nk7HT52eF1TPB//LmFZnpVXPrRj
         ZkGlwfw4K8cEH4WmvgJTraLWECoDmBZwlFsm+1zVoiVb6VOsvgS+7/uW6axi+rDJ7/vh
         1gQw==
X-Gm-Message-State: AOJu0YwTg9uWVQnhw5dsStG49Eyk4woxYJio96chjeAgFR6OaNxor475
	/ZXRfKwNGULvh9aZSZ1TYGOaAitg7qZ7ij08oQpVy9eELiFtVs0asl6MC5PDecAqTqgunNmvj65
	/2HNM
X-Gm-Gg: ASbGncuO6SIktTbW/ZD8OpZSnloMPU3HwFerhIav6CC9PCvmSSqJ6m+qtuDzYioxBNg
	Ssjkggq+tG/I9iC1gf4FRaDqcjqZu8TFdfPmTm4LsP3Otw51BTjDZrELsh4WnlswyM0D2UGi61d
	0ChYMIV5tm1VRLQll7Rmt1DidYN7rGVvM9kqTzujQM5fETMCAm4lGoTDUlwReDJepY5AZPrIq+2
	uPnNA79ybSuYb6+nly6Fgh1b4BzCa5TZFflHFzsiQEBEgIbPDQeXrkKH3+bHtGLLktLMU0ctzX8
	iTGxwqzRPIUHOy+lfneJ5DIO43iVFM8FFUnZdjzVm9aCHUq3uR8rDz48Am9S+NIAt5tT/LjZMBU
	WgyUs
X-Google-Smtp-Source: AGHT+IExwjL5VgU1mVPYBX2AAa5v1KmLZNpSEvOeH4O966iEHrbOX2XCETO++jGNvLD4sx+bxAkggg==
X-Received: by 2002:a05:6830:2c0d:b0:727:423c:95d5 with SMTP id 46e09a7af769-73a3625e00amr10579124a34.3.1750269369369;
        Wed, 18 Jun 2025 10:56:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a284039bdsm2046723a34.22.2025.06.18.10.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:56:09 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:56:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Qu Wenruo <wqu@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Filipe Manana <fdmanana@suse.com>
Subject: [btrfs:pr/1157 1/1] fs/btrfs/qgroup.c:359 qgroup_mark_inconsistent()
 warn: maybe use && instead of &
Message-ID: <9ebc0142-96b2-45a4-94d2-5e3100c599f2@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git pr/1157
head:   b9b695688148bd512273989145bc6ca0e272a53c
commit: b9b695688148bd512273989145bc6ca0e272a53c [1/1] btrfs: add extra warning when qgroup is marked inconsistent
config: i386-randconfig-141-20250616 (https://download.01.org/0day-ci/archive/20250616/202506160432.y5tEff7D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506160432.y5tEff7D-lkp@intel.com/

smatch warnings:
fs/btrfs/qgroup.c:359 qgroup_mark_inconsistent() warn: maybe use && instead of &

vim +359 fs/btrfs/qgroup.c

b9b695688148bd Qu Wenruo    2025-06-11  349  __printf(2, 3)
b9b695688148bd Qu Wenruo    2025-06-11  350  static void qgroup_mark_inconsistent(struct btrfs_fs_info *fs_info, const char *fmt, ...)
e562a8bdf652b0 Qu Wenruo    2022-08-24  351  {
b9b695688148bd Qu Wenruo    2025-06-11  352  	bool old_flags = fs_info->qgroup_flags;

old_flags should be u64 type.

b9b695688148bd Qu Wenruo    2025-06-11  353  
182940f4f4dbd9 Boris Burkov 2023-05-16  354  	if (btrfs_qgroup_mode(fs_info) == BTRFS_QGROUP_MODE_SIMPLE)
182940f4f4dbd9 Boris Burkov 2023-05-16  355  		return;
e562a8bdf652b0 Qu Wenruo    2022-08-24  356  	fs_info->qgroup_flags |= (BTRFS_QGROUP_STATUS_FLAG_INCONSISTENT |
e15e9f43c7ca25 Qu Wenruo    2022-08-24  357  				  BTRFS_QGROUP_RUNTIME_FLAG_CANCEL_RESCAN |
e15e9f43c7ca25 Qu Wenruo    2022-08-24  358  				  BTRFS_QGROUP_RUNTIME_FLAG_NO_ACCOUNTING);
b9b695688148bd Qu Wenruo    2025-06-11 @359  	if (!(old_flags & BTRFS_QGROUP_STATUS_FLAG_INCONSISTENT)) {

This can never be true.

b9b695688148bd Qu Wenruo    2025-06-11  360  		struct va_format vaf;
b9b695688148bd Qu Wenruo    2025-06-11  361  		va_list args;
b9b695688148bd Qu Wenruo    2025-06-11  362  
b9b695688148bd Qu Wenruo    2025-06-11  363  		va_start(args, fmt);
b9b695688148bd Qu Wenruo    2025-06-11  364  		vaf.fmt = fmt;
b9b695688148bd Qu Wenruo    2025-06-11  365  		vaf.va = &args;
b9b695688148bd Qu Wenruo    2025-06-11  366  
b9b695688148bd Qu Wenruo    2025-06-11  367  		btrfs_warn_rl(fs_info, "qgroup marked inconsistent, %pV", &vaf);
b9b695688148bd Qu Wenruo    2025-06-11  368  		va_end(args);
b9b695688148bd Qu Wenruo    2025-06-11  369  	}
e562a8bdf652b0 Qu Wenruo    2022-08-24  370  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

