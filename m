Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8578330F545
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624074; cv=none; b=oK2H9bTvjwM9lU247oeYHHAHPY2z7c7+QvvAhlOajCdqIMVX3ee3ndmzbDj2jBmXEm0i8OG+QYLWTIRDSPLw9KRt/Xr2XYuey+GLlJnraNZF9Wd1+zhpzM2cuRKSWbrP4CavcrtXmge10caeHf7ik7bBpigUPcuOiFdoh71V+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624074; c=relaxed/simple;
	bh=bTjLcLJHWaZgg24aCHRY8l6q1IKMHBpyyCnHckC4lVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G2oMvsNgjSQfeBMsskDDrk1oKClvUJrPOdxHLYneQCIhgXnjqJ24cQwp5qIfGO3ukFUqP+zF7nqTTGO/9qldPC9+WC7aSsGeGPrWIjfunaay2n0lMkijjYuF3rZEnNitPkFTcon/jS5JpjVUM2IRdGfsVWOtESQoJoWrM2mbWHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XEQ/qp+Y; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEQ/qp+Y"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so112674445e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 06:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767624068; x=1768228868; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88DqNfpRz47a8554GL/fZsnwwkqupd67qmhEsyeDn/M=;
        b=XEQ/qp+YTqUoJ42cceRPH2+phb/FDZZlQiakXoZPTJ5H28YINKVY7QpLPb5ZxM6wLf
         IsZ1/K/FcIBmkAQpAp0jeykA1ar2IWTCTPkJ1RSqw5k/MxWM5JJwBspxteg3OIlYE0kW
         mAi4YLI1Dx6sCCVlygkPZfqVZzu0RYmgs/Smu5nlbRPXsfgxaAQXA74wNIkzm5ro1/YQ
         0mEHCGqa/PF8sDrdnPQjxWv1aQ4NmPnm/xMV4VRO9CjhuViNR9zh9Ll29NcTF9r6IbRJ
         5FKh1fhOAU0ak4GbFDjpbCuNLEl+YUtzQHPrf+7y9/nzg3Safr2cDFxPkz8QZ9aWZXh/
         7Mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624068; x=1768228868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88DqNfpRz47a8554GL/fZsnwwkqupd67qmhEsyeDn/M=;
        b=t9Uu9FpUozT7b6NQXGO2R3OU7yFumkMeq95/81Pcv7zYq7HcAHGF9VXmfW8yrNcIRZ
         EfLlhffG3PuxEQ0h5DSEMFqgK4dRmlQPFIM4fTTtIhtALF1WjdXUfdSeQnIJbAu+0wiz
         PWreeHB/ynIWUNnBkec02MiaVeRCRd5rRSCYAr5L/YNUuLDLT2DNtDaqRS4JwRrk1deo
         kSZfzpfAcaYXyg8JvESwjqyN/saKb7icxgA8fDAgsPF+ajRJrhEtD8fF0nSaizTEUHFj
         0G7OtFPs4TQsY6G1P1uxOSaqVoMHEhAAsJ2Q3ft1Aj3OJhTiaQpSV1ZwwNOEurjwb0bu
         RFlQ==
X-Gm-Message-State: AOJu0YzQqFnnMbgpp0wAh+Kekiuh8UIKoQJFH0H1Dl/dJOOjhsQvNXpA
	IXOH4jBhSVbOJFpjpb7tVkwGIudrxDcmiSAMn0AliM4Yq17S1/41pNcwtkSOZyxbYcH3SxfjMiH
	mp3jF
X-Gm-Gg: AY/fxX7dIOfJ8rVr65JAoKLzaeM6YiLmgjiX1Uh6UbVkGWKNngy6+0YBjZo95ixTzSr
	t+p7nNi4lyBhwh08pkK5Gr0MzCxVzCTFUETTK7TsFRXZYtTE40QRtwV15A1ejsKTnwMygWBfNkH
	xfOfUJYdwop5Yg9hCf2aWSdRsXeuVgIM1VUvSBUdBkxVgZhKVxHZz4FzL+dXa3whCgjK3AFQzEU
	98Gy4S1jGVvxJwgkB/Ut4s+mwtAU0diaSSCfHs5RH1QY3NZE0UXWdejyRd2MfnLpYaojbDtoyzt
	sJCxRzAqlzL+EGSYvrpyfBpfyRzkxCVUV64oDAWJBQ4uB3uxEnIL85rWZOhxi93PIWH0E/z71Mf
	cGYlZPDPE9zq5/Hz53oK415awTaJLHC/pV3gYvBA9wM2GJP06ePZiWP/LmHeeH4MNK8P2qocKNu
	BLDlL2mtGOk9FZfM9Ukdt5uXpSvJU=
X-Google-Smtp-Source: AGHT+IHKrbVsInaXHLhjcnqkUkQWF+mFnt7KaUTOsrFlRVMgRXQB1hA8iwO/wJtEBfsfAdQ3I1FcxA==
X-Received: by 2002:a05:600c:a012:b0:47a:940a:c972 with SMTP id 5b1f17b1804b1-47d1955b72emr689824695e9.4.1767624068218;
        Mon, 05 Jan 2026 06:41:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6ba450e7sm60600605e9.1.2026.01.05.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:41:07 -0800 (PST)
Date: Mon, 5 Jan 2026 17:41:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 39/39]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2009
 kfd_topology_add_device() warn: inconsistent returns 'global
 &topology_lock'.
Message-ID: <202512110217.auM1jJmR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260105144104.SiTgmriOhF_zYJA3_gaU9J1Y-K5oFDUXMI22uA9S66g@z>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   3fe930d3788d26f7593523d883615b9eabe61f40
commit: 0ac954ec7f6c6dd6b7e94340599ba4b788d056d5 [39/39] drm/amdkfd: Fix the warning of array-index-out-of-bounds
config: arm64-randconfig-r073-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110217.auM1jJmR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512110217.auM1jJmR-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2009 kfd_topology_add_device() warn: inconsistent returns 'global &topology_lock'.

vim +2009 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c

5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1809  int kfd_topology_add_device(struct kfd_dev *gpu)
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1810  {
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1811  	uint32_t gpu_id;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1812  	struct kfd_topology_device *dev;
f7ce2fade6e143a Flora Cui              2017-12-08  1813  	struct kfd_cu_info cu_info;
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1814  	int res = 0;
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1815  	struct list_head temp_topology_device_list;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1816  	void *crat_image = NULL;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1817  	size_t image_size = 0;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1818  	int proximity_domain;
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1819  	int i;
b7675b7bbc3c4c6 Graham Sider           2021-11-11  1820  	const char *asic_name = amdgpu_asic_name[gpu->adev->asic_type];
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1821  
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1822  	INIT_LIST_HEAD(&temp_topology_device_list);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1823  
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1824  	gpu_id = kfd_generate_gpu_id(gpu);
79775b627dc49df Kent Russell           2017-08-15  1825  	pr_debug("Adding new GPU (ID: 0x%x) to topology\n", gpu_id);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1826  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1827  	/* Check to see if this gpu device exists in the topology_device_list.
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1828  	 * If so, assign the gpu to that device,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1829  	 * else create a Virtual CRAT for this gpu device and then parse that
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1830  	 * CRAT to create a new topology device. Once created assign the gpu to
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1831  	 * that topology device
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1832  	 */
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1833  	down_write(&topology_lock);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1834  	dev = kfd_assign_gpu(gpu);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1835  	if (!dev) {
46d18d510d78318 Mukul Joshi            2022-04-06  1836  		proximity_domain = ++topology_crat_proximity_domain;
46d18d510d78318 Mukul Joshi            2022-04-06  1837  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1838  		res = kfd_create_crat_image_virtual(&crat_image, &image_size,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1839  						    COMPUTE_UNIT_GPU, gpu,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1840  						    proximity_domain);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1841  		if (res) {
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1842  			pr_err("Error creating VCRAT for GPU (ID: 0x%x)\n",
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1843  			       gpu_id);
46d18d510d78318 Mukul Joshi            2022-04-06  1844  			topology_crat_proximity_domain--;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1845  			return res;

up_write(&topology_lock)?

3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1846  		}
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1847  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1848  		res = kfd_parse_crat_table(crat_image,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1849  					   &temp_topology_device_list,
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1850  					   proximity_domain);
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1851  		if (res) {
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1852  			pr_err("Error parsing VCRAT for GPU (ID: 0x%x)\n",
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1853  			       gpu_id);
46d18d510d78318 Mukul Joshi            2022-04-06  1854  			topology_crat_proximity_domain--;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1855  			goto err;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1856  		}
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1857  
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1858  		kfd_topology_update_device_list(&temp_topology_device_list,
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1859  			&topology_device_list);
4f449311e9aa177 Harish Kasiviswanathan 2017-12-08  1860  
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1861  		dev = kfd_assign_gpu(gpu);
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1862  		if (WARN_ON(!dev)) {
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1863  			res = -ENODEV;
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1864  			goto err;
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1865  		}
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1866  
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1867  		/* Fill the cache affinity information here for the GPUs
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1868  		 * using VCRAT
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1869  		 */
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1870  		kfd_fill_cache_non_crat_info(dev, gpu);
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1871  
8eabaf54cfb34d1 Kent Russell           2017-08-15  1872  		/* Update the SYSFS tree, since we added another topology
8eabaf54cfb34d1 Kent Russell           2017-08-15  1873  		 * device
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1874  		 */
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1875  		res = kfd_topology_update_sysfs();
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1876  		if (!res)
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1877  			sys_props.generation_count++;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1878  		else
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1879  			pr_err("Failed to update GPU (ID: 0x%x) to sysfs topology. res=%d\n",
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1880  						gpu_id, res);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1881  	}
0ac954ec7f6c6dd Ma Jun                 2022-11-02  1882  	up_write(&topology_lock);
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1883  
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1884  	dev->gpu_id = gpu_id;
5b5c4e40a37e858 Evgeny Pinchuk         2014-07-16  1885  	gpu->id = gpu_id;
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1886  
0f28cca87e9afc2 Ramesh Errabolu        2022-05-26  1887  	kfd_dev_create_p2p_links();
0f28cca87e9afc2 Ramesh Errabolu        2022-05-26  1888  
3a87177eb14113b Harish Kasiviswanathan 2017-12-08  1889  	/* TODO: Move the following lines to function

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

