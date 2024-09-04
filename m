Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C029219A280;
	Wed,  4 Sep 2024 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442138; cv=none; b=Ux8tzNtc/J5p7ACBkFp5y+yxAMrFjLBHyjrHd+RlI81vvWKXXiMg1q5cW3pVh3gfKY1YhPe1S4RJdz4PihBcV7idm/NlxxH9a2qnU8Mor369DLlFMJzrNs/q63MD0KjGE7KTQvsKG978ozGBkAS95Nx69C+HUeQqcp/RDwK8nVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442138; c=relaxed/simple;
	bh=VKg9mKgBYMwhDs+A2oTYbvccBnIx0QnT6iCmKpuMO68=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tw0e0xZe/VSqR5QaU3oOyeMRuk53ihHCD8kTjXaqbGvOmqHc6WaYLBGrvNoFzoq2Q++raHngW5Dv6BUjsxwmhMCkAByQSpaUqY95ANVNCBcrq4xc3tjr3xRQnhMyew9wuGD4KvElF+/c1I4UjCVhFa3Sl6Q+5hjd4q7WSrtGWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WzHCG3Fv5z6K8s3;
	Wed,  4 Sep 2024 17:25:14 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 35E7F140B2F;
	Wed,  4 Sep 2024 17:28:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 4 Sep
 2024 10:28:45 +0100
Date: Wed, 4 Sep 2024 10:28:45 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <oe-kbuild@lists.linux.dev>, shuaijie wang <wangshuaijie@awinic.com>,
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [jic23-iio:testing 268/269] drivers/iio/proximity/aw96103.c:475
 aw96103_reg_version_comp() warn: iterator 'i' not incremented
Message-ID: <20240904102845.00002fbf@Huawei.com>
In-Reply-To: <97914f05-0881-4c33-9acb-117f89dba35c@stanley.mountain>
References: <97914f05-0881-4c33-9acb-117f89dba35c@stanley.mountain>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Tue, 3 Sep 2024 22:31:59 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   fa533227a89a1d8509a1ad4e93a35d683a77aa23
> commit: a369e1d1a10790f63b4b858dc74b53730146754f [268/269] iio: proximity: aw96103: Add support for aw96103/aw96105 proximity sensor
> config: riscv-randconfig-r072-20240901 (https://download.01.org/0day-ci/archive/20240904/202409040114.Rpkwt3gm-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202409040114.Rpkwt3gm-lkp@intel.com/
> 
> smatch warnings:
> drivers/iio/proximity/aw96103.c:475 aw96103_reg_version_comp() warn: iterator 'i' not incremented

True enough.  Odd code structure.
There shouldn't be an early return in the good path.

I'll fix up or Shuajie, if you want to send a patch that's fine too.

Jonathan


> 
> vim +/i +475 drivers/iio/proximity/aw96103.c
> 
> a369e1d1a10790f shuaijie wang 2024-08-27  457  static int aw96103_reg_version_comp(struct aw96103 *aw96103,
> a369e1d1a10790f shuaijie wang 2024-08-27  458  				    struct aw_bin *aw_bin)
> a369e1d1a10790f shuaijie wang 2024-08-27  459  {
> a369e1d1a10790f shuaijie wang 2024-08-27  460  	u32 blfilt1_data, fw_ver;
> a369e1d1a10790f shuaijie wang 2024-08-27  461  	unsigned char i;
> a369e1d1a10790f shuaijie wang 2024-08-27  462  	int ret;
> a369e1d1a10790f shuaijie wang 2024-08-27  463  
> a369e1d1a10790f shuaijie wang 2024-08-27  464  	ret = regmap_read(aw96103->regmap, AW96103_REG_FWVER2, &fw_ver);
> a369e1d1a10790f shuaijie wang 2024-08-27  465  	if (ret)
> a369e1d1a10790f shuaijie wang 2024-08-27  466  		return ret;
> a369e1d1a10790f shuaijie wang 2024-08-27  467  	/*
> a369e1d1a10790f shuaijie wang 2024-08-27  468  	 * If the chip version is AW96103A and the loaded register
> a369e1d1a10790f shuaijie wang 2024-08-27  469  	 * configuration file is for AW96103, special handling of the
> a369e1d1a10790f shuaijie wang 2024-08-27  470  	 * AW96103_REG_BLRSTRNG_CH0 register is required.
> a369e1d1a10790f shuaijie wang 2024-08-27  471  	 */
> a369e1d1a10790f shuaijie wang 2024-08-27  472  	if ((fw_ver != AW96103A) || (aw_bin->chip_type[7] != '\0'))
> a369e1d1a10790f shuaijie wang 2024-08-27  473  		return 0;
> a369e1d1a10790f shuaijie wang 2024-08-27  474  
> a369e1d1a10790f shuaijie wang 2024-08-27 @475  	for (i = 0; i < aw96103->max_channels; i++) {
> 
> This loop only iterates one time.
> 
> a369e1d1a10790f shuaijie wang 2024-08-27  476  		ret = regmap_read(aw96103->regmap,
> a369e1d1a10790f shuaijie wang 2024-08-27  477  			AW96103_REG_BLFILT_CH0 + (AW96103_BLFILT_CH_STEP * i),
> a369e1d1a10790f shuaijie wang 2024-08-27  478  			&blfilt1_data);
> a369e1d1a10790f shuaijie wang 2024-08-27  479  		if (ret)
> a369e1d1a10790f shuaijie wang 2024-08-27  480  			return ret;
> a369e1d1a10790f shuaijie wang 2024-08-27  481  		if (FIELD_GET(AW96103_BLERRTRIG_MASK, blfilt1_data) != 1)
> a369e1d1a10790f shuaijie wang 2024-08-27  482  			return 0;
> a369e1d1a10790f shuaijie wang 2024-08-27  483  
> a369e1d1a10790f shuaijie wang 2024-08-27  484  		return regmap_update_bits(aw96103->regmap,
> a369e1d1a10790f shuaijie wang 2024-08-27  485  			AW96103_REG_BLRSTRNG_CH0 + (AW96103_BLFILT_CH_STEP * i),
> a369e1d1a10790f shuaijie wang 2024-08-27  486  			AW96103_BLRSTRNG_MASK, 1 << i);
> a369e1d1a10790f shuaijie wang 2024-08-27  487  	}
> a369e1d1a10790f shuaijie wang 2024-08-27  488  
> a369e1d1a10790f shuaijie wang 2024-08-27  489  	return 0;
> a369e1d1a10790f shuaijie wang 2024-08-27  490  }
> 

