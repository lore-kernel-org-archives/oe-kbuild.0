Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525797FBB0
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Feb 2024 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708938716; cv=none; b=XyoHCO3TNObA+ETFLxMw93zguK/iI6uQinhB61S4keOr8P77RKtvdRx5QKJiRS8xndTGx/qFy/+ZADsj/aKZpSQk4TXXBCQy2xD5deFIqP1Sc3+SlpURbMvOTBTMWgkPH2SW61gcf4DgprYHbVeGtvE5dJhL4vxjUFjhJ2nLwKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708938716; c=relaxed/simple;
	bh=nwx7HOwHYXYVYZxZgf2QN5WGV4A1rhbLFDdFeVsTQJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/jOs3kt9sfeDln0kfmMuS8vrgYYxCF7JzEEFsEUg5lDJF52wbuSSNdKcIwSVXdy1LlTIAd376g7KVewjufpXq5ZN3BYTD4UE2YOWlG8ZuDa6kTVX2qiWMXu1PWU6jEvIvZk4XY72P3Y+Lix43Ghd/VL9/sSaVWV9/IeYOvJSG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5y8Ogv/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5y8Ogv/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412a5de8a06so2860495e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 26 Feb 2024 01:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708938711; x=1709543511; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysQLUa1Zf6hnXQfdG00pI0Sl/bUTKIlQlqVo1xQtG4s=;
        b=n5y8Ogv/RJvHFHeAFIdvLQl/HMHhECj6pY0+awaRVQZOsRdUKE/Utto+Z1gronIOmb
         gNWJql/9KweSRGM51vQGR0BFayzn6Yq/Vzitogpetpv3DVhFSSmPn4G2D9VnAXTdLfpK
         BIXkJ5TuiTfaTyrCj4dCb625DVuHmUrFwWOmuqoDDcmWqNczKoVdw2MAQZYnBYxN7yP+
         7/z0/8XhVdYPAe7FXcyzRzPS6OZuMUWth8wuhm1yZHg3TJnbQqVDKJuDYqU87r1lzRDg
         hEMU7extSemnWwn7nHxAEEQSRZO6AblW0T/iDyd7qw8CZBcfxcgQEcfjnxhXtGaJ84EK
         C+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708938711; x=1709543511;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysQLUa1Zf6hnXQfdG00pI0Sl/bUTKIlQlqVo1xQtG4s=;
        b=ssI7UWermlk0UEe1Ss/Rl1l28BqjiuiGzHy8dat/aKjaBl2b29Nur+5fY23u+/PWbJ
         6MDZmAk5LhVSHi/RAUspls7x5VR28ebDJS0zZo1hxN/PKOU9QZhv0PbgrO4qNnprSgdf
         XmHRS5JU+Zt9DDDFVrWK8QoX+rFu2zxCeDefbFW5+cLSUHtf1bhqV9cHdNDneFrOrRkO
         4joO2ZhEbQl9tjNWgzz34GRA+Hocm+obMuR2ZRLAEh+ltZqEImhqzIAIRfT+h27Jlbzy
         FW20OZIpMcMYpGkm3fAAKDOUw3bxIj6XHQv1Wrug000PC04HdlcZOgXIhPtF1YWna6vU
         7h5A==
X-Gm-Message-State: AOJu0YxYFjRMmRP5NP4LPxkYio3IzNYtPpcCHbEMZdv923z7MA9SM3yy
	COkkIXAbAZ+HMzUZtVv+NcTxcIjy0jzKaPiQvGbYEfIPm27zGfNubGJbx8i8CqXmqnQ5mC/ycoM
	Y
X-Google-Smtp-Source: AGHT+IFGg59wl+gFwN3NWUCrPbQh7GGlub76KBKC7/fyF71DEmdVAkrz7TCY/c6lzdthSqyaw8jBlg==
X-Received: by 2002:a05:600c:1910:b0:412:a73b:3cb2 with SMTP id j16-20020a05600c191000b00412a73b3cb2mr805913wmq.20.1708938711169;
        Mon, 26 Feb 2024 01:11:51 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k22-20020a7bc416000000b0041061f094a2sm11191796wmi.11.2024.02.26.01.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:11:50 -0800 (PST)
Date: Mon, 26 Feb 2024 12:11:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ivan Vecera <ivecera@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Simon Horman <horms@kernel.org>
Subject: [linux-next:master 6594/9575]
 drivers/net/ethernet/intel/i40e/i40e_main.c:14729 i40e_veb_release() error:
 uninitialized symbol 'vsi'.
Message-ID: <61c2b186-325f-4c66-bf76-073b9b2dc0f5@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33e1d31873f87d119e5120b88cd350efa68ef276
commit: 08cdde310e2252ea9381a37c3faa2125a5a663a3 [6594/9575] i40e: Fix broken support for floating VEBs
config: arm-randconfig-r081-20240223 (https://download.01.org/0day-ci/archive/20240224/202402241530.mM9AG4Pq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402241530.mM9AG4Pq-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_main.c:14729 i40e_veb_release() error: uninitialized symbol 'vsi'.

vim +/vsi +14729 drivers/net/ethernet/intel/i40e/i40e_main.c

41c445ff0f482b Jesse Brandeburg 2013-09-11  14701  void i40e_veb_release(struct i40e_veb *veb)
41c445ff0f482b Jesse Brandeburg 2013-09-11  14702  {
b1f1b46f466a08 Ivan Vecera      2023-11-24  14703  	struct i40e_vsi *vsi, *vsi_it;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14704  	struct i40e_pf *pf;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14705  	int i, n = 0;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14706  
41c445ff0f482b Jesse Brandeburg 2013-09-11  14707  	pf = veb->pf;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14708  
41c445ff0f482b Jesse Brandeburg 2013-09-11  14709  	/* find the remaining VSI and check for extras */
b1f1b46f466a08 Ivan Vecera      2023-11-24  14710  	i40e_pf_for_each_vsi(pf, i, vsi_it)
b1f1b46f466a08 Ivan Vecera      2023-11-24  14711  		if (vsi_it->uplink_seid == veb->seid) {
08cdde310e2252 Ivan Vecera      2023-11-24  14712  			if (vsi_it->flags & I40E_VSI_FLAG_VEB_OWNER)
b1f1b46f466a08 Ivan Vecera      2023-11-24  14713  				vsi = vsi_it;

Originally when "n == 1" that means "vsi" was initialized.  But now it's
only initialized when I40E_VSI_FLAG_VEB_OWNER is set.

41c445ff0f482b Jesse Brandeburg 2013-09-11  14714  			n++;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14715  		}
b1f1b46f466a08 Ivan Vecera      2023-11-24  14716  
08cdde310e2252 Ivan Vecera      2023-11-24  14717  	/* Floating VEB has to be empty and regular one must have
08cdde310e2252 Ivan Vecera      2023-11-24  14718  	 * single owner VSI.
08cdde310e2252 Ivan Vecera      2023-11-24  14719  	 */
08cdde310e2252 Ivan Vecera      2023-11-24  14720  	if ((veb->uplink_seid && n != 1) || (!veb->uplink_seid && n != 0)) {
41c445ff0f482b Jesse Brandeburg 2013-09-11  14721  		dev_info(&pf->pdev->dev,
41c445ff0f482b Jesse Brandeburg 2013-09-11  14722  			 "can't remove VEB %d with %d VSIs left\n",
41c445ff0f482b Jesse Brandeburg 2013-09-11  14723  			 veb->seid, n);
41c445ff0f482b Jesse Brandeburg 2013-09-11  14724  		return;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14725  	}
41c445ff0f482b Jesse Brandeburg 2013-09-11  14726  
08cdde310e2252 Ivan Vecera      2023-11-24  14727  	/* For regular VEB move the owner VSI to uplink VEB */
41c445ff0f482b Jesse Brandeburg 2013-09-11  14728  	if (veb->uplink_seid) {
08cdde310e2252 Ivan Vecera      2023-11-24 @14729  		vsi->flags &= ~I40E_VSI_FLAG_VEB_OWNER;
                                                                ^^^^^
Uninitialized variable.  It's possible that I40E_VSI_FLAG_VEB_OWNER is
always set, but then why have the check?

41c445ff0f482b Jesse Brandeburg 2013-09-11  14730  		vsi->uplink_seid = veb->uplink_seid;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14731  		if (veb->uplink_seid == pf->mac_seid)
41c445ff0f482b Jesse Brandeburg 2013-09-11  14732  			vsi->veb_idx = I40E_NO_VEB;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14733  		else
41c445ff0f482b Jesse Brandeburg 2013-09-11  14734  			vsi->veb_idx = veb->veb_idx;
41c445ff0f482b Jesse Brandeburg 2013-09-11  14735  	}
41c445ff0f482b Jesse Brandeburg 2013-09-11  14736  
41c445ff0f482b Jesse Brandeburg 2013-09-11  14737  	i40e_aq_delete_element(&pf->hw, veb->seid, NULL);
41c445ff0f482b Jesse Brandeburg 2013-09-11  14738  	i40e_veb_clear(veb);
41c445ff0f482b Jesse Brandeburg 2013-09-11  14739  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

