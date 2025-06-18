Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D677F1B78F3
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280124; cv=none; b=Lg7ZNf5j/OyLaWD2GCR5k1+U014ikG8rDUoa6tH5J8to6Y/dDIQLOyNJWJocn2VgcSdvZmXUTACcgMdi0Qzmen2cV5GZNuP0hkLF2DjIgs6qzemWiojF3K15cV/ac6qSeInHU811D5hhQnzYUKyi+qVq9uYekcH+Sm2p3IiH0sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280124; c=relaxed/simple;
	bh=+NpVQGFhmS4rPioi85uTEcjg6f+US4Dhi7gtR3weyBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLKmVY/mr5QB0ll1TjRUk4VdpvOGIl9v1tf0IAa/wey3rtGd9VEGh3xzshuGA7RmLRw6CPtxkLJEp4EADUzCuJVb8ACut2b6+G6dOTCzKLUG/TgaWF+YPGy74OV9tQuzsXsaScl/UzdfKlApTn3MsMsOtlOGkCgnyguVmIi87QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ABeOLaYh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ABeOLaYh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a36748920cso133228f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 13:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750280119; x=1750884919; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nRRhMFjufeLbp9SWZPabXIdBXStp8C4hFpfOMJXdYoA=;
        b=ABeOLaYhno+s5k2AVq5ty40+tUw6Guf2Ix+tgmb65ZOpbFwiXmz5K72z+YUvy9RsVQ
         whuDXyi9Ys8E8NcQ/ElgL1tOjjpxZqJ24el80gz5sxQuFbtdgOfqc/eQjsJjFKjDsr94
         a1IBrYZxI9PoamVEPZMD+V+9rPtlFCNTKRQzndXHtN7ChBGRSvAGw6f9kR8f5B5DJwPx
         uR/dIBwNVPbp+bGWyoInWM6mrIzdVC+vHeLfsiXZ0YZDLbZHhVqeDwNfa1ofhzRdDJBr
         JkjfqklOQCj7FV6YASwh3IPbYU2qAE+K9lfkPDA/FAKqeXsHUF3qD78YxQW3CdHxjgDQ
         7y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280119; x=1750884919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRRhMFjufeLbp9SWZPabXIdBXStp8C4hFpfOMJXdYoA=;
        b=L5u/vQjjEHgnB/updcpplzri5J/h6b3SDpZ2zfWxkHaNkAWj17Ac87mOnNARDjRiqd
         +lbVfKecYvnyTmq25hRiUnXYmyrhEtCTC58mrRvaXs1+QVK0jHH6DHaME6bjKZOcsjpx
         O3MZ4low1l7bT13sOCSdJ/Mmk69LBe5BCL+/rjvtC9onO8PwZTMqpVkDK4A0GusLsyAQ
         Gl/1c+D+aX+o/PY/AGZHcqDlnXdFcgInrFPELZpFCYo5LNfzqCbY8szKZmTvX6/hE3PM
         1yFQ/Gr+gadrSFM4j3pgP3aHdnyHNxK/f3Pyea1IHIHnTR0UXu1WdvoWQNiQOl7Mtd/e
         2t3g==
X-Forwarded-Encrypted: i=1; AJvYcCXfEgnLbGSHFiRIM+tC6oMNoK7j9WYhuoabic7awiyrrbdq8Au8RJJ0r0SNKVZ21yDkI21B4SnVNo8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuPCIb02NoiuewIf3EzmWxEYRURL3CTSgkaTyxLuGpIs2X8zjV
	eRsoGBgauda3EWFhgpPxUUuNZg0GacYFGawrDCRdbSDdpkT+hwOZI0KZSXz8QU8kEkM=
X-Gm-Gg: ASbGncv38/kbKUM9NJQj/PtcnfRxWZKWG40UtwVy8cWl70AKO7oX9NSyCffhdGcqQ3c
	VAjTV2z934ROPKKAvB8Dir9jXDEPL4eXbglKqIx6V87pVUrdJqResbpedmzTSBy+/H4nzeGMKix
	zoQ9KGYYmue1tKH3IC2O3AOCmjSxSdpl0+H1QN8uEg5IDvKY/7JhXFAmBvZ8iNJwOrMt8Ca2ykJ
	8cS1idclaiuYK0aCrXrOnoN1NFjTU1Wzp27WYYNs6XXz6m8732A9A2CXq40V9G6+M/dgCQHrEwH
	4bBCO1ACaNYk4G+jJ/PDZ85kXaiA+0gx21aWcuJALvQ1mILZSptq9K8Ef7kWWgPEXEBK4NxibbR
	ljZ3i2KVYkcCNlIk5yp8jXrHh
X-Google-Smtp-Source: AGHT+IGDSkKjEo5evK2cdRF7Dfkyixu/R8GRzZkXd330C6ZVRH56En8ZvkkHo05zOMDMsOa/udBO5w==
X-Received: by 2002:a05:6000:26c3:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3a5723aed82mr15789002f8f.40.1750280118863;
        Wed, 18 Jun 2025 13:55:18 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe16803c3sm11488101a12.41.2025.06.18.13.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 13:55:18 -0700 (PDT)
Message-ID: <ab681f30-1afb-47f7-afaa-6209fe56d4b3@suse.com>
Date: Thu, 19 Jun 2025 06:25:14 +0930
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [btrfs:pr/1157 1/1] fs/btrfs/qgroup.c:359
 qgroup_mark_inconsistent() warn: maybe use && instead of &
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Filipe Manana <fdmanana@suse.com>
References: <9ebc0142-96b2-45a4-94d2-5e3100c599f2@suswa.mountain>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <9ebc0142-96b2-45a4-94d2-5e3100c599f2@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/6/19 03:26, Dan Carpenter 写道:
> tree:   https://github.com/btrfs/linux.git pr/1157
> head:   b9b695688148bd512273989145bc6ca0e272a53c
> commit: b9b695688148bd512273989145bc6ca0e272a53c [1/1] btrfs: add extra warning when qgroup is marked inconsistent
> config: i386-randconfig-141-20250616 (https://download.01.org/0day-ci/archive/20250616/202506160432.y5tEff7D-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202506160432.y5tEff7D-lkp@intel.com/
> 
> smatch warnings:
> fs/btrfs/qgroup.c:359 qgroup_mark_inconsistent() warn: maybe use && instead of &
> 
> vim +359 fs/btrfs/qgroup.c
> 
> b9b695688148bd Qu Wenruo    2025-06-11  349  __printf(2, 3)
> b9b695688148bd Qu Wenruo    2025-06-11  350  static void qgroup_mark_inconsistent(struct btrfs_fs_info *fs_info, const char *fmt, ...)
> e562a8bdf652b0 Qu Wenruo    2022-08-24  351  {
> b9b695688148bd Qu Wenruo    2025-06-11  352  	bool old_flags = fs_info->qgroup_flags;
> 
> old_flags should be u64 type.
> 
> b9b695688148bd Qu Wenruo    2025-06-11  353
> 182940f4f4dbd9 Boris Burkov 2023-05-16  354  	if (btrfs_qgroup_mode(fs_info) == BTRFS_QGROUP_MODE_SIMPLE)
> 182940f4f4dbd9 Boris Burkov 2023-05-16  355  		return;
> e562a8bdf652b0 Qu Wenruo    2022-08-24  356  	fs_info->qgroup_flags |= (BTRFS_QGROUP_STATUS_FLAG_INCONSISTENT |
> e15e9f43c7ca25 Qu Wenruo    2022-08-24  357  				  BTRFS_QGROUP_RUNTIME_FLAG_CANCEL_RESCAN |
> e15e9f43c7ca25 Qu Wenruo    2022-08-24  358  				  BTRFS_QGROUP_RUNTIME_FLAG_NO_ACCOUNTING);
> b9b695688148bd Qu Wenruo    2025-06-11 @359  	if (!(old_flags & BTRFS_QGROUP_STATUS_FLAG_INCONSISTENT)) {
> 
> This can never be true.

Already fixed in that tree.

Thanks,
Qu>
> b9b695688148bd Qu Wenruo    2025-06-11  360  		struct va_format vaf;
> b9b695688148bd Qu Wenruo    2025-06-11  361  		va_list args;
> b9b695688148bd Qu Wenruo    2025-06-11  362
> b9b695688148bd Qu Wenruo    2025-06-11  363  		va_start(args, fmt);
> b9b695688148bd Qu Wenruo    2025-06-11  364  		vaf.fmt = fmt;
> b9b695688148bd Qu Wenruo    2025-06-11  365  		vaf.va = &args;
> b9b695688148bd Qu Wenruo    2025-06-11  366
> b9b695688148bd Qu Wenruo    2025-06-11  367  		btrfs_warn_rl(fs_info, "qgroup marked inconsistent, %pV", &vaf);
> b9b695688148bd Qu Wenruo    2025-06-11  368  		va_end(args);
> b9b695688148bd Qu Wenruo    2025-06-11  369  	}
> e562a8bdf652b0 Qu Wenruo    2022-08-24  370  }
> 

