Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D578F6B
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 13:08:29 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fa7cd95dacso40465475e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687784907; x=1690376907;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62WuwPthyx3frxHivYYIjEzLQaMN81s5xNpCAobrBDE=;
        b=DVUjrJHC91hUATmPwoZH/WU8nxm5wKCM1lncY2Hto218fyypm6H19Kt1fMFXou/Mvw
         FJDrtPjXDRetmLKXSS+oF+S+303uW3WvVJa5HLi9/yYQtz0HlzjlbbX7oJ+Aj0es7tgK
         XmJb5v/IComehhS9FxQtVp5+LUNKMhVXIaNU6itq15qvsPTQgGLVk7qphmALJlMSqWit
         TWbJU6ZH5fhXLLoh8kw7naUmL/n7j5PlUhvqlcSFKNhuC0ebTB6kztx343Pmh12LQyXO
         4/YTPJQEjoG1t3Fl3GlDT+YJsKQmtM6Ihjd9sBmMHbDaUhr5bcVpRKul3VQC7kFn4+0s
         250A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687784907; x=1690376907;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62WuwPthyx3frxHivYYIjEzLQaMN81s5xNpCAobrBDE=;
        b=MAYR/nByOrnatqe/MHKrMeNxNUViC5Dy4rKckt2sc0jcPjOfpFUhFiSvkY5HEG6Ezt
         Mh5dvhDij7y5vztymZLlNg5BFdF6lPPd0Ymd1KV8PJ+5TKUW+1znMc2idLSqPTY9icGf
         2VHHBJvj6fuHvb68x3HcJEdmM23ceKKqWFpfsl9sVh2C2zp5zeFI7KHYwwDeWd06O+sW
         gjxHiAljFJxO6kaZhCs8afbqQlfbPleB8cgy6DY4HjuEhvzrVLZxUvJgHP9/v8/BkLqz
         9WL3X4ci+rQWbYvswnpu6LC+q4C4F37/JBNhByaRfoGz4K+4Ti6bkY6E3z4rTiZ+kXxR
         tWPg==
X-Gm-Message-State: AC+VfDzEepNxkbZMWjY3ejFJYmNKDcErmphN0Gkjsa4LG6xycRDg8Ppn
	/PTi0cRj1Pbqovb+FTFB2IWNzef9R4ViJusBIGI=
X-Google-Smtp-Source: ACHHUZ6RpTxrvkYS6LheYRvaPLcFbh+7aHvwkrGR5Nfr0nVT0G1carAq6PLITfLw+axUhPmzL7KF+A==
X-Received: by 2002:a7b:c8c9:0:b0:3f9:b955:5584 with SMTP id f9-20020a7bc8c9000000b003f9b9555584mr13754419wml.34.1687784906625;
        Mon, 26 Jun 2023 06:08:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y12-20020a05600c364c00b003f7f249e7dfsm10690444wmq.4.2023.06.26.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:08:25 -0700 (PDT)
Date: Mon, 26 Jun 2023 16:08:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andrew Halaney <ahalaney@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [vireshk-pm:opp/linux-next 8/8] drivers/opp/of.c:516
 dev_pm_opp_of_find_icc_paths() warn: passing zero to 'dev_err_probe'
Message-ID: <de69e7e7-41bb-4abf-b8d5-dd31f2feec8d@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
head:   fa155f4f834882a79788218aea4914568b41dd0f
commit: fa155f4f834882a79788218aea4914568b41dd0f [8/8] OPP: Use dev_err_probe() when failing to get icc_path
config: openrisc-randconfig-m041-20230625 (https://download.01.org/0day-ci/archive/20230626/202306262008.guNLgjt6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262008.guNLgjt6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306262008.guNLgjt6-lkp@intel.com/

smatch warnings:
drivers/opp/of.c:516 dev_pm_opp_of_find_icc_paths() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +516 drivers/opp/of.c

6d3f922c46f2e9 Georgi Djakov    2020-05-12  477  int dev_pm_opp_of_find_icc_paths(struct device *dev,
6d3f922c46f2e9 Georgi Djakov    2020-05-12  478  				 struct opp_table *opp_table)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  479  {
6d3f922c46f2e9 Georgi Djakov    2020-05-12  480  	struct device_node *np;
45679f9b508f10 Sibi Sankar      2020-05-28  481  	int ret, i, count, num_paths;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  482  	struct icc_path **paths;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  483  
45679f9b508f10 Sibi Sankar      2020-05-28  484  	ret = _bandwidth_supported(dev, opp_table);
6ee70e8c34e37a Nicola Mazzucato 2020-12-08  485  	if (ret == -EINVAL)
6ee70e8c34e37a Nicola Mazzucato 2020-12-08  486  		return 0; /* Empty OPP table is a valid corner-case, let's not fail */
6ee70e8c34e37a Nicola Mazzucato 2020-12-08  487  	else if (ret <= 0)
45679f9b508f10 Sibi Sankar      2020-05-28  488  		return ret;
45679f9b508f10 Sibi Sankar      2020-05-28  489  
45679f9b508f10 Sibi Sankar      2020-05-28  490  	ret = 0;
45679f9b508f10 Sibi Sankar      2020-05-28  491  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  492  	np = of_node_get(dev->of_node);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  493  	if (!np)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  494  		return 0;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  495  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  496  	count = of_count_phandle_with_args(np, "interconnects",
6d3f922c46f2e9 Georgi Djakov    2020-05-12  497  					   "#interconnect-cells");
6d3f922c46f2e9 Georgi Djakov    2020-05-12  498  	of_node_put(np);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  499  	if (count < 0)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  500  		return 0;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  501  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  502  	/* two phandles when #interconnect-cells = <1> */
6d3f922c46f2e9 Georgi Djakov    2020-05-12  503  	if (count % 2) {
6d3f922c46f2e9 Georgi Djakov    2020-05-12  504  		dev_err(dev, "%s: Invalid interconnects values\n", __func__);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  505  		return -EINVAL;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  506  	}
6d3f922c46f2e9 Georgi Djakov    2020-05-12  507  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  508  	num_paths = count / 2;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  509  	paths = kcalloc(num_paths, sizeof(*paths), GFP_KERNEL);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  510  	if (!paths)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  511  		return -ENOMEM;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  512  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  513  	for (i = 0; i < num_paths; i++) {
6d3f922c46f2e9 Georgi Djakov    2020-05-12  514  		paths[i] = of_icc_get_by_index(dev, i);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  515  		if (IS_ERR(paths[i])) {
fa155f4f834882 Andrew Halaney   2023-06-23 @516  			ret = dev_err_probe(dev, ret, "%s: Unable to get path%d\n", __func__, i);

s/ret/PTR_ERR(paths[i])/

6d3f922c46f2e9 Georgi Djakov    2020-05-12  517  			goto err;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  518  		}
6d3f922c46f2e9 Georgi Djakov    2020-05-12  519  	}
6d3f922c46f2e9 Georgi Djakov    2020-05-12  520  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  521  	if (opp_table) {
6d3f922c46f2e9 Georgi Djakov    2020-05-12  522  		opp_table->paths = paths;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  523  		opp_table->path_count = num_paths;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  524  		return 0;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  525  	}
6d3f922c46f2e9 Georgi Djakov    2020-05-12  526  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  527  err:
6d3f922c46f2e9 Georgi Djakov    2020-05-12  528  	while (i--)
6d3f922c46f2e9 Georgi Djakov    2020-05-12  529  		icc_put(paths[i]);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  530  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  531  	kfree(paths);
6d3f922c46f2e9 Georgi Djakov    2020-05-12  532  
6d3f922c46f2e9 Georgi Djakov    2020-05-12  533  	return ret;
6d3f922c46f2e9 Georgi Djakov    2020-05-12  534  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

