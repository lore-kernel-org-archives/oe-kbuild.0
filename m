Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8162195FE7
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718628007; cv=none; b=HG4RAVQ7ukMnhyiTp1RSYXepi4hDANxK9lRM28+9hWT4WXmhyhPdiPVhPxn44U3u8VlI31EN+fucKbZq6OaLvzxc5Wbaxl4z6YW1b5xefYA/g7oe29wGuFm1T3SRpUuWizJjka0PkQYexirJpn+G/C+w8YttEll5PIQhpemlcdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718628007; c=relaxed/simple;
	bh=ZLxsnURrc56BEggCT7SD+0+Rz9q8qW0YMtLdksIGfi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=W0+EmlUzp/BCv0qxeMLQQ4VTefVTcF4Ks0LPL3k0d8jGt6U1HZu0NdVyXoGffmS1u7NCmR0BDdbfuwTJYuK13+lnMbbHdalQy0QEl2qDa4QEGzCiySbucY98q6OvZlxStdOWYXn7//MPaAbAnIiHyu1SEU0PkvVqA8kQoyZNNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hb1RJ/Y3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hb1RJ/Y3"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52caebc6137so2027421e87.0
        for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718628004; x=1719232804; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+HRYUPCMJcQBkT1cpfHbyTOHaJe2a6elgfsZtQuCyQ=;
        b=hb1RJ/Y3z4bN7Nxf9d2sVI5mziqTdGvzY+EC5gjjeQv44TOJVuqJWrDsEygPhXopd6
         jagdijsfGEQN3G60IJi64tMsR6ZC9VPiUbkVut0d/zYuWgCS8hJOBFSQnAVapXKs8J6G
         +Zxn7zxyBOIVFWUXxXl4yixrUAz2wxD22BKdiyNJtsitubiDoBt6iLhgpv+FUXhBNZk8
         EFMw8DZvbLi451VEus/ByKe/Grv9Pd29sfqN2Z2V++nnVUkdTiB/a/u8otl8RlHV/uiD
         cQ5HfXXu8N7/q8D4UBwZZw1VxTzdTxSxz6BSMoWZxbMKgugMMM3+BGfl5i0wQKPmMbvw
         qcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718628004; x=1719232804;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+HRYUPCMJcQBkT1cpfHbyTOHaJe2a6elgfsZtQuCyQ=;
        b=Oml0xy/z9A5OeYDxnv07JoyfQGlmeVBrNkQeHMn0KIXQzmjbnKh2nEnKsd4ocZ1ubf
         4syFtcMajern6jkYU25qM/kV8APxX0rMp4edxsIKJRGOhax6MMANdDh+9lgv3a7k9oZZ
         HU6nmsoFQnpg2IERLMM64D1K5IhaaEVbozI/Sos4m0PMO7sQefOV9P7sfJXn5HbDWXlh
         vKm7cjGCHhLykDmWiETirTxgMIeowWfw7cZdGm2dP1ChjbodcjyELbymLqDLvYhY95LO
         xVePLijM7/XR6A/9y3tsD23ckv2UWCN622bxqBR55NasIX0ydjN0s5SLYhBx459KWiVs
         jOHw==
X-Gm-Message-State: AOJu0Yw7vnL9S2KbyEWtxUzg7lwv91Qq+lzoKHZU6D73MG3Unw56GiDD
	rIIBj21DQ8vdVchpSy31KUnWSte3dVHkUyr94lDlpmbd+i1hRv74natCvmNI/h5L/9vor3tVS0d
	Q
X-Google-Smtp-Source: AGHT+IEKA7l6WX6SW03YB8EoOZxMGnJYTWom862f2gBPbXByGN/uJeOvL1EIFy31l26ZxHY1P1j1gQ==
X-Received: by 2002:a19:f809:0:b0:52c:89ff:10bf with SMTP id 2adb3069b0e04-52ca6e999e7mr5401497e87.67.1718628003665;
        Mon, 17 Jun 2024 05:40:03 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4246b67f0aesm27013865e9.45.2024.06.17.05.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:40:03 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:39:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
Message-ID: <71bb6f07-39b8-41b4-a743-66c7c5a6524d@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614040133.24967-2-jason-jh.lin@mediatek.com>

Hi Jason-JH.Lin,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/mailbox-Add-power_get-power_put-API-to-mbox_chan_ops/20240614-120412
base:   linus/master
patch link:    https://lore.kernel.org/r/20240614040133.24967-2-jason-jh.lin%40mediatek.com
patch subject: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
config: x86_64-randconfig-161-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151520.TDnOFFbV-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406151520.TDnOFFbV-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox.c:485 mbox_request_channel() error: 'chan' dereferencing possible ERR_PTR()

vim +/chan +485 drivers/mailbox/mailbox.c

2b6d83e2b8b7de Jassi Brar      2014-06-12  444  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
2b6d83e2b8b7de Jassi Brar      2014-06-12  445  {
2b6d83e2b8b7de Jassi Brar      2014-06-12  446  	struct device *dev = cl->dev;
2b6d83e2b8b7de Jassi Brar      2014-06-12  447  	struct mbox_controller *mbox;
2b6d83e2b8b7de Jassi Brar      2014-06-12  448  	struct of_phandle_args spec;
2b6d83e2b8b7de Jassi Brar      2014-06-12  449  	struct mbox_chan *chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  450  	int ret;
2b6d83e2b8b7de Jassi Brar      2014-06-12  451  
2b6d83e2b8b7de Jassi Brar      2014-06-12  452  	if (!dev || !dev->of_node) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  453  		pr_debug("%s: No owner device node\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  454  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  455  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  456  
2b6d83e2b8b7de Jassi Brar      2014-06-12  457  	mutex_lock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  458  
2b6d83e2b8b7de Jassi Brar      2014-06-12  459  	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
2b6d83e2b8b7de Jassi Brar      2014-06-12  460  				       "#mbox-cells", index, &spec)) {
b6d83e2b8b7de Jassi Brar      2014-06-12  461  		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  462  		mutex_unlock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  463  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  464  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  465  
2d805fc1c6b2ec Benson Leung    2015-05-04  466  	chan = ERR_PTR(-EPROBE_DEFER);
2b6d83e2b8b7de Jassi Brar      2014-06-12  467  	list_for_each_entry(mbox, &mbox_cons, node)
2b6d83e2b8b7de Jassi Brar      2014-06-12  468  		if (mbox->dev->of_node == spec.np) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  469  			chan = mbox->of_xlate(mbox, &spec);
8ed82e23875e60 Mikko Perttunen 2018-11-28  470  			if (!IS_ERR(chan))
2b6d83e2b8b7de Jassi Brar      2014-06-12  471  				break;
2b6d83e2b8b7de Jassi Brar      2014-06-12  472  		}
2b6d83e2b8b7de Jassi Brar      2014-06-12  473  
2b6d83e2b8b7de Jassi Brar      2014-06-12  474  	of_node_put(spec.np);
2b6d83e2b8b7de Jassi Brar      2014-06-12  475  
2d805fc1c6b2ec Benson Leung    2015-05-04  476  	if (IS_ERR(chan)) {
2d805fc1c6b2ec Benson Leung    2015-05-04  477  		mutex_unlock(&con_mutex);
2d805fc1c6b2ec Benson Leung    2015-05-04  478  		return chan;
2d805fc1c6b2ec Benson Leung    2015-05-04  479  	}
2d805fc1c6b2ec Benson Leung    2015-05-04  480  
85a953806557db Elliot Berman   2023-04-10  481  	ret = __mbox_bind_client(chan, cl);
85a953806557db Elliot Berman   2023-04-10  482  	if (ret)
2b6d83e2b8b7de Jassi Brar      2014-06-12  483  		chan = ERR_PTR(ret);

change is set to error pointer

2b6d83e2b8b7de Jassi Brar      2014-06-12  484  
9c57f48cd805b1 Jason-JH.Lin    2024-06-14 @485  	if (chan->mbox->ops->power_put)
                                                            ^^^^^^
Dereferenced on the next line

9c57f48cd805b1 Jason-JH.Lin    2024-06-14  486  		chan->mbox->ops->power_put(chan);
9c57f48cd805b1 Jason-JH.Lin    2024-06-14  487  
2b6d83e2b8b7de Jassi Brar      2014-06-12  488  	mutex_unlock(&con_mutex);
9c57f48cd805b1 Jason-JH.Lin    2024-06-14  489  
2b6d83e2b8b7de Jassi Brar      2014-06-12  490  	return chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  491  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

