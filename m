Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF61272E6D
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804758; cv=none; b=UuepgeBNoDm4tuIgRMrGqtVkw/ZxulLjzhMF66nNifArJsqGkmrtqCHSiMdUp7Dnw4SZiwPvC0yqdSeK90yRyHMlMaFMUvwZL4cLpcN2KhP9pc71CDFEVHc3shlqtXzSaf8phe+Zo9hgrx5XVqSPP8LzISotKXqL1PLEpeIQJXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804758; c=relaxed/simple;
	bh=CMzqvC4vFjv53KzEn6Dr+7lxzGvaqSADz8/9RDdZ8R4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Xjw/1/z6g5mseaB8PN3y1q01OOhVNAfusa2BwetqMxJ0Ft8y9tWTZzE/aKxTlti8tFPyR4JakBfG7nIzHWYkvZFq0u/kVX1t85WR3O4FQqgXlOR/V2GLnXYd52aVLoat8GZLqM5ROND+KcKIq0ZNkW3nSb1T1B9QlD8GVE7hAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHP455hM; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHP455hM"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ee07570deso25646595e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 22:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768804748; x=1769409548; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGAwzvV5LHsn7JHpK3LYmhe0GdKjE3ya26PmaPpWPzo=;
        b=wHP455hM5CwlKFUA5d7PLXrAWarWwbWn+gozZ1jfu2CQq5m/9/d+OJfr6R4/buGl+c
         fANI1HcY0vMvXhGd7rg5FbnydaSxWlSOsdoOBssAOEjpn1D6G3HoLPrBMi/7/Pw7CH49
         bXFK8esgI1yyrIi6YqXQSKVd3RbpfpBLXqxwgSyqQy6GyV12QIIos8yO7GwRGRDWoalW
         5GQys2YPop2rNOQPx55Ai2G1S9PSukm1nB/BVHtcw3NXvxlxwi6+UotnuRfYXSIH/zoP
         yiuNfr2ZDd3dDjAzQnNgaw0Ts8JSAiylo/dw07Hq5Eaqe4XLu4jExf7fPLSt0NY/WaFs
         An1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804748; x=1769409548;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGAwzvV5LHsn7JHpK3LYmhe0GdKjE3ya26PmaPpWPzo=;
        b=TaJojoOkWqSa2EqdR6pNmi+/l5vRvgfTLvJC62ZytMLzBSyMFac7FsfVfJGK9plJ4L
         aZtwlMdUZU6wCnyAb8g93tHlxJUYQoyVDsNOZE97xW4LbGJLw0Q0eoODZqaHBvlssBvg
         IYhRgHRNnC+mJNl+0UfGpJxT7xHYqiYgInUifKvDNGIwRD9R70aMhbG/7LKxDKuqEn++
         SB4I02GZBQQD+WcNKdyrcVaXDQn+zLm54abbKcXpAkVNA5lm/SY/1Mu2K1cBMN8GN47V
         58uBmLfByLyOz741zJXGKhgB3CxAgyEvV8Wg4J7NeKWy1j35S2raRzKVzt2b9WyR3FII
         o6Hw==
X-Gm-Message-State: AOJu0YyKrnexjo/duBYdn4GmRSfjdmjl5Zsv5tzeAoX4bIHoWzp/VUU/
	tmlEh1dk6Qz2NHuMHsiok2q9272X2wS48Hx0UYGgzsRSgC+M7jFL5n2I0SpUy5vFtnrY1ZgfD45
	krFFW700=
X-Gm-Gg: AY/fxX7CWWdGSbh+6vOeYOm3p8mssgpeWicaXFFMfka2Z+m3rVccRhSrG/viiHrncQa
	a1BM3AkxKNhz1yW4Kh4qUblZUNmgeGqPRALsmtNjiSlLIV6PABZTT78hg871YiNx3k+bS9ZshR6
	5ijiIRUWR6+h3/mqIsdzyOlzqcq5WA2OEWXmkkU/WoPqxHOFlT3RmZVB26jS1oyr/9i4QLW8heH
	hVPy0B0qgThn2mSLWUVvi38sz2ZZJLmq58pOlHJ54FlFuHGdWcCLgbb9v9kTQgy5vwecw57zzgY
	eSO2CqZ7OMMDAzV+d0DA2jChDSbYG3LNoARGE0ifD1wO564W9yagy4sy06ZoxE2sbfD+T8xm1fk
	SFLgzKPIJ0q41vPTuxTzvyND062jRWBe2PRU8rh55Ht6Fe0Z6epskL2T2/wdPKtdEIEALU05RYY
	V2Qxd/TGmlH7KXY4kz
X-Received: by 2002:a05:600c:8710:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-4801eb17b45mr93501175e9.33.1768804748329;
        Sun, 18 Jan 2026 22:39:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569922032sm21909378f8f.8.2026.01.18.22.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:39:07 -0800 (PST)
Date: Mon, 19 Jan 2026 09:39:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 12/17] firmware: arm_scmi: Add Telemetry components
 view
Message-ID: <202601170503.pgixUrV3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114114638.2290765-13-cristian.marussi@arm.com>
Message-ID: <20260119063905.G3NvmQX4_USjKDLYgsEL7bS2YpSObDfowbE2h4SrOnw@z>

Hi Cristian,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Define-a-common-SCMI_MAX_PROTOCOLS-value/20260114-195913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260114114638.2290765-13-cristian.marussi%40arm.com
patch subject: [PATCH v2 12/17] firmware: arm_scmi: Add Telemetry components view
config: sparc-randconfig-r073-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170503.pgixUrV3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601170503.pgixUrV3-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/scmi_system_telemetry.c:2238 scmi_telemetry_de_subdir_symlink() error: uninitialized symbol 'ret'.

vim +/ret +2238 drivers/firmware/arm_scmi/scmi_system_telemetry.c

289dce6d3bc91dc Cristian Marussi 2026-01-14  2196  static int scmi_telemetry_de_subdir_symlink(struct super_block *sb,
289dce6d3bc91dc Cristian Marussi 2026-01-14  2197  					    struct scmi_tlm_setup *tsp,
289dce6d3bc91dc Cristian Marussi 2026-01-14  2198  					    const struct scmi_telemetry_de *de,
289dce6d3bc91dc Cristian Marussi 2026-01-14  2199  					    struct dentry *parent)
289dce6d3bc91dc Cristian Marussi 2026-01-14  2200  {
289dce6d3bc91dc Cristian Marussi 2026-01-14  2201  	struct dentry *dentry;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2202  	struct inode *inode;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2203  	int ret;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2204  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2205  	if (IS_ERR(parent))
289dce6d3bc91dc Cristian Marussi 2026-01-14  2206  		return 0;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2207  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2208  	char *name __free(kfree) = kasprintf(GFP_KERNEL, "0x%08X", de->info->id);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2209  	if (!name)
289dce6d3bc91dc Cristian Marussi 2026-01-14  2210  		return -ENOMEM;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2211  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2212  	char *link __free(kfree) =
289dce6d3bc91dc Cristian Marussi 2026-01-14  2213  		kasprintf(GFP_KERNEL, "../../../../../des/0x%08X", de->info->id);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2214  	if (!link)
289dce6d3bc91dc Cristian Marussi 2026-01-14  2215  		return -ENOMEM;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2216  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2217  	dentry = simple_start_creating(parent, name);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2218  	if (IS_ERR(dentry))
289dce6d3bc91dc Cristian Marussi 2026-01-14  2219  		return PTR_ERR(dentry);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2220  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2221  	inode = stlmfs_get_inode(sb);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2222  	if (unlikely(!inode)) {
289dce6d3bc91dc Cristian Marussi 2026-01-14  2223  		dev_err(tsp->dev,
289dce6d3bc91dc Cristian Marussi 2026-01-14  2224  			"out of free dentries, cannot create '%s'", name);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2225  		return stlmfs_failed_creating(dentry);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2226  	}
289dce6d3bc91dc Cristian Marussi 2026-01-14  2227  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2228  	inode->i_mode = S_IFLNK | 0777;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2229  	inode->i_op = &simple_symlink_inode_operations;
289dce6d3bc91dc Cristian Marussi 2026-01-14  2230  	inode_init_owner(&nop_mnt_idmap, inode, NULL, inode->i_mode);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2231  	inode->i_link = no_free_ptr(link);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2232  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2233  	//d_add(dentry, inode);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2234  	d_make_persistent(dentry, inode);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2235  
289dce6d3bc91dc Cristian Marussi 2026-01-14  2236  	simple_done_creating(dentry);
289dce6d3bc91dc Cristian Marussi 2026-01-14  2237  
289dce6d3bc91dc Cristian Marussi 2026-01-14 @2238  	return ret;

s/ret/0/;

289dce6d3bc91dc Cristian Marussi 2026-01-14  2239  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

