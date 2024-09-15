Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0D1C6F62
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726411603; cv=none; b=jliKb6Fo0iD6rCU+m7UcDYDdB9LEkeqn1wbf79mvulRrO6rQfq9dkREMirGEu9ajH14Md/64QIgv9QvIRWxpIs2vj0JGtc3JUTqQic91whdVRlX4qyTP/DXyU/gFoQUsA/JpRvjpKCUesJQ1ZJ+pg9d7G8U10D6uIkZNYhxeH2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726411603; c=relaxed/simple;
	bh=uibBjiU0hDKK++6/Zoq5P4/I5pvqLw+vYmVEaV8p+KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jygLbGSmXZjAqgbm0aVVXpUKaCX2UNTZevSjerYm5wd5MkN5v25Vwca/OO2d3w+LxItipZ9W/5QGI77iO+sBVl5fCr1s0M+c39GQ3gMy9zoCIc0MVvDq0J16bCpehaNBx/uMm6ZJSvjwcdjqSLkuuzUOZsUVlY6/1RFWDCaUFh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xj7ILnZ/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xj7ILnZ/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42e5e758093so3259575e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726411599; x=1727016399; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U/xp2UpHVeQlbWOUIfTdRaSlecN8RAsU40G0ryVVMCY=;
        b=xj7ILnZ/pPqV4tOkhTPwPR+bxokRv1c9Ls8UG+qq4eSsSjsHL5yBwvfuUVQoE+QC6J
         RqtDU0iMEkfzzgWuiyc0gRg91rr33uilVHtN2GKKO+eBAU5v706Zy8cGAcTeErrk2egS
         29lKyFOrbSEQOcJce0HP+xcN6EmjefaKGllOTr0DawSNUSt6NZ4Tpju3lkAu0oTj+rO0
         NRLzoUtvHVUqQ27pHxStv0x1z5QLgXLoO+WiFkb4lQMkbZSLVZOHox5n7uCtBwy/PCHk
         G4ukDLaXtzL/nlL8WDxedWbuppzPOF6h5Cv4S+reTJzVSz5nUzacMFy4WIo/Ne1WHkk5
         CBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726411599; x=1727016399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/xp2UpHVeQlbWOUIfTdRaSlecN8RAsU40G0ryVVMCY=;
        b=BRO8GumEdYYMr7eCBhJkORGZ+zttCqbHg+dLifZ2Qv2Dh/ivHSB0vNsHlkffF8N58I
         WEMP+cbkI8S7HhlOeJdyd2riCcHf1I6a/B7Jg411xEb3UGHU2WHsxDahIc7MdENivSKC
         LUeiN+I9jWr8Z55YVjHTSpThEMn/guxWQObj7BlLUfWCPPE6vMbo45rGsbU4cKPzuzbQ
         WvkCtepelnUK8pMZZ8V1gkyxpTLvqK13sViYDvverDyfhXfvB9D0omwJLdBnzxuMh/x6
         59D0+ZeaGv/Wlfl3YlJ1f7u3KKNtTg736X6y391D5hUKSbTEg/QBnW3C/DAXDMDUdU3Y
         X1mw==
X-Gm-Message-State: AOJu0YwXjOrVkIETXdFVZmoI/orfASTN+Zot8BFoWQWh/RSetl660fJQ
	k2tChf9tByEXPrjgzBTXc6stI4HtF18tBAtxg+yrZi9E1GCZC/LvkOQ+Vp6Rgw2Hl1a+nwhZZf+
	7
X-Google-Smtp-Source: AGHT+IFgxoyXztYvD6Tk0i9//e9XSuu6cTfT5Or50OUFS5dbb8fgykN4+3B0jp947uTyjRLL7ij8wQ==
X-Received: by 2002:adf:ce0f:0:b0:374:bb32:656c with SMTP id ffacd0b85a97d-378d6241fe1mr5287267f8f.39.1726411598880;
        Sun, 15 Sep 2024 07:46:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22e6540sm50876015e9.21.2024.09.15.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 07:46:38 -0700 (PDT)
Date: Sun, 15 Sep 2024 17:46:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [remoteproc:rpmsg-next 4/4]
 drivers/rpmsg/qcom_glink_native.c:504 qcom_glink_send_open_req() error:
 strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)
Message-ID: <ca187325-4b8e-48fd-8d8a-97d992170693@stanley.mountain>
References: <f2cbe310-64e0-4ee9-98ae-b46d8a2c9340@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2cbe310-64e0-4ee9-98ae-b46d8a2c9340@stanley.mountain>

On Sun, Sep 15, 2024 at 05:40:51PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
> head:   c1ddb29709e675ea2a406e3114dbf5c8c705dd59
> commit: c1ddb29709e675ea2a406e3114dbf5c8c705dd59 [4/4] rpmsg: glink: Avoid -Wflex-array-member-not-at-end warnings
> config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240915/202409152202.xXbeT6sp-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202409152202.xXbeT6sp-lkp@intel.com/
> 
> smatch warnings:
> drivers/rpmsg/qcom_glink_native.c:504 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)
> 
> vim +504 drivers/rpmsg/qcom_glink_native.c
> 
> 835764ddd9af0d Bjorn Andersson       2017-08-24  480  static int qcom_glink_send_open_req(struct qcom_glink *glink,
> 835764ddd9af0d Bjorn Andersson       2017-08-24  481  				    struct glink_channel *channel)
> 835764ddd9af0d Bjorn Andersson       2017-08-24  482  {
> c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  483  	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
> 835764ddd9af0d Bjorn Andersson       2017-08-24  484  	int name_len = strlen(channel->name) + 1;
> 
> How do we know that channel->name is NUL terminated?  I believe it comes from
> qcom_glink_rx_defer() where we call:
> 
> 	qcom_glink_rx_peek(glink, &dcmd->msg, 0, sizeof(dcmd->msg) + extra);

->peek is either glink_rpm_rx_peek() or glink_smem_rx_peek().

regards,
dan carpenter

