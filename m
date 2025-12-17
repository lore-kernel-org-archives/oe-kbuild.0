Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD470287276;
	Wed, 17 Dec 2025 22:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766010155; cv=none; b=pguFJVPh2f5Xwbcy7Pd5aAhoWtZFocEVPlc0S0C0M3WEHS7tcVtozlcSU7aXZzXEn5XxrhJ15Su4QCEGRRqYpCYvEDz/IPjY5DGKBUvjOZkJ/UW/KZFxQUGaepMQCPN3Of0AVdueLEDJw92MS3xm1ZHI3iM5QoNCCv3Rs6MDtII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766010155; c=relaxed/simple;
	bh=7eL1qkwDiS8+URLPuArYTaJEq1bltmjz2Es0TSkL1Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Asljp0hx62OZ54yZ0+qEVMBmX0NCdTgB1vXcJ+DhglnnakEiZpoM7+040DeiYTShqsfdTS0ozXNksi8xfaWVpBg3GEb3jG4N6m2CRGWLNH1pwWzGS4w1+FLQg3j7zySbaVgC+mdVvgRowYEKToES7+n4z4Y6mRvRE2+qOEa/kLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OE/Nx4JU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OE/Nx4JU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EBCC113D0;
	Wed, 17 Dec 2025 22:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766010154;
	bh=7eL1qkwDiS8+URLPuArYTaJEq1bltmjz2Es0TSkL1Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OE/Nx4JU44XpLz5ohJEIcpt2EYJxuOl4XuJmaoSHUgAl0TTMnwMp6nshh0rw+e+fY
	 /g4G06tV3PcBRrPWh7ziWWLXmaXMONK5Rh+1dl5g45DLtBze95P6hgkQFxFOvxbdtM
	 qknZqtIZVUuL2FV8NOBZoEHR7IV4aZE3Gl1abh7aqyvjjE2zRHKgVz25I6amoHrbAQ
	 CJqnMYYzthKlyxvopkkuHT6kYQl9lLBYB4O30pw/LPcs2xmeTogHQsyDwkXLNqfVE/
	 G0iv/I5GtusOLE3fCMfaPVgX2vRdgZTtYE5JdcSXsVBdyA5HKgoUhLKzg8QYY0oYJJ
	 Vp7Us69pUQm+w==
From: SeongJae Park <sj@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild@lists.linux.dev,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 44/115] mm/damon/sysfs.c:920 damon_sysfs_sample_add_dirs() warn: missing unwind goto?
Date: Wed, 17 Dec 2025 14:22:30 -0800
Message-ID: <20251217222230.3221-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202512141528.AD9GSzHJ-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 17 Dec 2025 19:03:40 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   4daf22e4c21ef13ee2779580295eb0073dc3163b
> commit: f4df9946a1d00c8aa6326f28807efec79af1c2ea [44/115] mm/damon/sysfs: implement sample/filters/ directory
> config: i386-randconfig-141-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141528.AD9GSzHJ-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512141528.AD9GSzHJ-lkp@intel.com/
> 
> smatch warnings:
> mm/damon/sysfs.c:920 damon_sysfs_sample_add_dirs() warn: missing unwind goto?
> 
> vim +920 mm/damon/sysfs.c
> 
> 4242d70b872082 SeongJae Park 2025-12-02  901  static int damon_sysfs_sample_add_dirs(
> 4242d70b872082 SeongJae Park 2025-12-02  902  		struct damon_sysfs_sample *sample)
> 4242d70b872082 SeongJae Park 2025-12-02  903  {
> 4242d70b872082 SeongJae Park 2025-12-02  904  	struct damon_sysfs_primitives *primitives;
> f4df9946a1d00c SeongJae Park 2025-12-02  905  	struct damon_sysfs_sample_filters *filters;
> 4242d70b872082 SeongJae Park 2025-12-02  906  	int err;
> 4242d70b872082 SeongJae Park 2025-12-02  907  
> 4242d70b872082 SeongJae Park 2025-12-02  908  	primitives = damon_sysfs_primitives_alloc(true, false);
> 4242d70b872082 SeongJae Park 2025-12-02  909  	if (!primitives)
> 4242d70b872082 SeongJae Park 2025-12-02  910  		return -ENOMEM;
> 4242d70b872082 SeongJae Park 2025-12-02  911  	err = kobject_init_and_add(&primitives->kobj,
> 4242d70b872082 SeongJae Park 2025-12-02  912  			&damon_sysfs_primitives_ktype, &sample->kobj,
> 4242d70b872082 SeongJae Park 2025-12-02  913  			"primitives");
> 4242d70b872082 SeongJae Park 2025-12-02  914  	if (err)
> 4242d70b872082 SeongJae Park 2025-12-02  915  		goto put_primitives_out;
> 4242d70b872082 SeongJae Park 2025-12-02  916  	sample->primitives = primitives;
> 4242d70b872082 SeongJae Park 2025-12-02  917  
> f4df9946a1d00c SeongJae Park 2025-12-02  918  	filters = damon_sysfs_sample_filters_alloc();
> f4df9946a1d00c SeongJae Park 2025-12-02  919  	if (!filters)
> f4df9946a1d00c SeongJae Park 2025-12-02 @920  		return -ENOMEM;
> 
> goto put_primitives_out;?
> 
> f4df9946a1d00c SeongJae Park 2025-12-02  921  	err = kobject_init_and_add(&filters->kobj,
> f4df9946a1d00c SeongJae Park 2025-12-02  922  			&damon_sysfs_sample_filters_ktype, &sample->kobj,
> f4df9946a1d00c SeongJae Park 2025-12-02  923  			"filters");
> f4df9946a1d00c SeongJae Park 2025-12-02  924  	if (err)
> f4df9946a1d00c SeongJae Park 2025-12-02  925  		goto put_filters_out;
> f4df9946a1d00c SeongJae Park 2025-12-02  926  	sample->filters = filters;
> f4df9946a1d00c SeongJae Park 2025-12-02  927  	return 0;
> f4df9946a1d00c SeongJae Park 2025-12-02  928  put_filters_out:
> f4df9946a1d00c SeongJae Park 2025-12-02  929  	kobject_put(&filters->kobj);
> f4df9946a1d00c SeongJae Park 2025-12-02  930  	sample->filters = NULL;
> 4242d70b872082 SeongJae Park 2025-12-02  931  put_primitives_out:
> 4242d70b872082 SeongJae Park 2025-12-02  932  	kobject_put(&primitives->kobj);
> 4242d70b872082 SeongJae Park 2025-12-02  933  	sample->primitives = NULL;
> 4242d70b872082 SeongJae Park 2025-12-02  934  	return err;
> 4242d70b872082 SeongJae Park 2025-12-02  935  }

Thank you for catching this and sharing with me, Dan!  Just pushed a fix that
simply following your suggestion, to damon/next tree.


Thanks,
SJ

[...]
