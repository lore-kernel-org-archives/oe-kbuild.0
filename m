Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB81448F6
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830542; cv=none; b=fUOiKc+O2O+nuqx+r48WMiuWwntuoc7NWwp5PAL7fTNgMDodMw9lvpCYhaHZ6f8ZlbMDp/Zb+cTHbpvF5lBBT0f7kT5eWlkuja5+cPjr0B9e7NpeA+O0B29Jjyi6dfOoPX6HCUPF1myLZ+XWtYer4tGGM9aTHV0He7kUgMHD7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830542; c=relaxed/simple;
	bh=9RsK3hjU+aOXfQuW5yzHUK/QlMsMm4EqKd31lq6j6B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kTh6z1VX9DIT4ZYj5Wj+E/3efcpBcRKrzSPPwoAGu7fXPrL0iKEz/c8ZbsYpW2qjQqmH1Bb1bwUIWxioQG57SGIeJFuWR2ZmMyeDkG6crM+0uru4xBsgK5vTAWsnsflfXtA1z4zKndpvrITOhTgjZGt4OiK5EhXmF2tjBJ2VBfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsncWAw4; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RsncWAw4"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a51fea60c0bso305374466b.3
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712830538; x=1713435338; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiVmZ6cq6HixfqxYNA972rbKxcwD9JRiQEpuhMop1E8=;
        b=RsncWAw4PUO7dLVkI/13TKAx2dgeaXuxN9PdudgqlpZgtpVMp/IPNg0F2fvRaizT66
         peLwS+TLsCuH9TYXGg5opNz1Xa5mmw4LbNQlb5JxW6WXnA68YL6exzaAvByI3F5U3u5d
         iVPnBIeNZb6tylcGxkR9p/6dPVeg39rdd3c/l7cD+05XbhT+lCdKa2CxcImBEcd8okVI
         JaOhMtBOCkpFYk+WipoR3P6ugrtnuiuJaELXpqZl9qwZ/NF34uYUHJgw98RarBgvo1Su
         1deKsfIlf/Sn6YkRU5oIp/c0i5OlNJUquguk4KLV4jcooRKUXY95U0+OLimlaNtGcMJM
         JfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712830538; x=1713435338;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WiVmZ6cq6HixfqxYNA972rbKxcwD9JRiQEpuhMop1E8=;
        b=mOtDZNxr8Yo8yzA2zz/PrGFU/R3SvqAKcolLozpMr80YILKKjk+EZFlARJGu00Vrb0
         hEtaWicmKirA/MVLA6hFLewQy9+/WskHHsfCfpvFXv4gRK6QbOh8lI27aypmO/lZPVXc
         Cp+Yn9ZUQcDjs7oQSGxr220EoU06SLMl0Tx66TqnYuT7maeeyu8kcCNtafn64S1Jv+Op
         Kt3pmxGYtoYGKnOXtOPDWZhNzrCme70oggh2g5wuXK0noQtijXyF9q1vzindxceq+7qN
         7RsRaxpOOyXNB0WpNkEgVNWoHFLlSkeFu84mgem+hsy1r+N05DFHRNnB+zJuAiOt40hG
         1fhQ==
X-Gm-Message-State: AOJu0YyiM3ut1kMjnpJ9A5i8zl6uVLqLaB1uYKYkDH1Un+pT+XJcW9Yl
	9ZYGRu1br+XWj44rFrNWzKY97fq/mxA77kn4uLNhoVcXXeG12JVse4tsdOUUtOy+htR/jPCtBml
	+
X-Google-Smtp-Source: AGHT+IFpTNg5pJuUDJkIczk50XOHfll1lCLgYdqCedfxH2svtnTfZm/iKGHRjoAl16XU8bYTi1cMfA==
X-Received: by 2002:a17:907:1b1a:b0:a51:abb0:a8a1 with SMTP id mp26-20020a1709071b1a00b00a51abb0a8a1mr5127101ejc.54.1712830537648;
        Thu, 11 Apr 2024 03:15:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id jw9-20020a170906e94900b00a52241b823esm354394ejb.109.2024.04.11.03.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 03:15:37 -0700 (PDT)
Date: Thu, 11 Apr 2024 13:15:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 3454/5042] drivers/dma/fsl-edma-main.c:133
 fsl_edma_xlate() warn: inconsistent returns '&fsl_edma->fsl_edma_mutex'.
Message-ID: <425abe00-438e-4736-98f7-89609789b3d4@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ebf211bb11dfc004a2ff73a9de5386fa309c430
commit: 6aa60f79e6794bbbc571ea4e0501b9fcc26026e2 [3454/5042] dmaengine: fsl-edma: add safety check for 'srcid'
config: i386-randconfig-141-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110915.riwV3ZAC-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404110915.riwV3ZAC-lkp@intel.com/

smatch warnings:
drivers/dma/fsl-edma-main.c:133 fsl_edma_xlate() warn: inconsistent returns '&fsl_edma->fsl_edma_mutex'.

vim +133 drivers/dma/fsl-edma-main.c

d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18   96  static struct dma_chan *fsl_edma_xlate(struct of_phandle_args *dma_spec,
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18   97  		struct of_dma *ofdma)
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18   98  {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18   99  	struct fsl_edma_engine *fsl_edma = ofdma->of_dma_data;
178c81e58e9155 drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-21  100  	struct dma_chan *chan, *_chan;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao     2015-10-30  101  	struct fsl_edma_chan *fsl_chan;
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong   2019-06-25  102  	u32 dmamux_nr = fsl_edma->drvdata->dmamuxs;
af802728e4ab07 drivers/dma/fsl-edma.c      Robin Gong   2019-06-25  103  	unsigned long chans_per_mux = fsl_edma->n_chans / dmamux_nr;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  104  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  105  	if (dma_spec->args_count != 2)
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  106  		return NULL;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  107  
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  108  	mutex_lock(&fsl_edma->fsl_edma_mutex);
178c81e58e9155 drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-21  109  	list_for_each_entry_safe(chan, _chan, &fsl_edma->dma_dev.channels, device_node) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  110  		if (chan->client_count)
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  111  			continue;
211bfef7c2bc8c drivers/dma/fsl-edma.c      Jingchang Lu 2014-07-01  112  		if ((chan->chan_id / chans_per_mux) == dma_spec->args[0]) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  113  			chan = dma_get_slave_channel(chan);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  114  			if (chan) {
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  115  				chan->device->privatecnt++;
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao     2015-10-30  116  				fsl_chan = to_fsl_edma_chan(chan);
cee8cbfc7be8ff drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  117  				fsl_chan->srcid = dma_spec->args[1];
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  118  
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  119  				if (!fsl_chan->srcid) {
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  120  					dev_err(&fsl_chan->pdev->dev, "Invalidate srcid %d\n",
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  121  						fsl_chan->srcid);

mutex_unlock(&fsl_edma->fsl_edma_mutex); before returning

6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  122  					return NULL;
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  123  				}
6aa60f79e6794b drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  124  
cee8cbfc7be8ff drivers/dma/fsl-edma-main.c Frank Li     2024-03-23  125  				fsl_edma_chan_mux(fsl_chan, fsl_chan->srcid,
82d149b86d31e1 drivers/dma/fsl-edma.c      Yuan Yao     2015-10-30  126  						true);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  127  				mutex_unlock(&fsl_edma->fsl_edma_mutex);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  128  				return chan;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  129  			}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  130  		}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  131  	}
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  132  	mutex_unlock(&fsl_edma->fsl_edma_mutex);
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18 @133  	return NULL;
d6be34fbd39b7d drivers/dma/fsl-edma.c      Jingchang Lu 2014-02-18  134  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

