Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90948635C
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740985576; cv=none; b=Kh+xqY4lKsdpgyTBIamCseJGZAnXObdx37lsrQh/9k3QLMRCqn7s9xuictNnMsEh10UikiyK2ZxDB5Jd6QLSRbjlhTLHWZTp2SSokX8ls3xclnDnQLzQtbT+gNjTh9GoFYIhecAL26kDvWizLA4AwUHuJ8qGdmGLZ5n3fZDmAf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740985576; c=relaxed/simple;
	bh=Rka7/Rx/UAJwBcyQ1ctL/DACSoeBVpoGCkrLxyEqkDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=asA7Vb+7BRTwcP0c5qyPZ6cDJOzd50lPTzkS0HEC7brcIpdi5p0jGoH9nJRrBOM13Ql5RSjZtLD/jd3vPdwWWvu7gYFlMPrs3giVgM+TnJS/84joBtkcEfFGlgtvZSy0QvOweYIsxCyMC4V4t1gFbDExWt8Pa4oj7faeKwZUxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SSw0MuQC; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SSw0MuQC"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaecf50578eso775755266b.2
        for <oe-kbuild@lists.linux.dev>; Sun, 02 Mar 2025 23:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740985573; x=1741590373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WvEeRk3M8QKrsU6ZWqi+zoW7rNpMcZv1dlxRGclyC7A=;
        b=SSw0MuQCy9es/1K2XPyDy5/XcF4AN4UM9iiPzFEHBfrBhKKpu+UXlflIrYQZ2f2+hY
         wPbzM2BeePSl4uJr0f+mkk8Vnkb2Drb7uUiT4SVcedAzPIK2FCGyzLx5UrF7G9k0l8it
         kACgaCIaRe/tHcKmRJIVRj6ijoHHORpHfx3aFZxTmLGok95YUcZea69wM3NALyplrS57
         Kt9CELLUQUv8d7/zAHRSKeuv03dW+MNkO1VlrEx4a6Rvr20pfHPZ7nuQ5A3QY6xshCuH
         7dNqz+g8UTFqPxSqpVUaaHm45lTCqsJBb98i+eoRFAg1VqeCJJ39/BlbR6EeMsbIjksf
         juoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740985573; x=1741590373;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvEeRk3M8QKrsU6ZWqi+zoW7rNpMcZv1dlxRGclyC7A=;
        b=RzZN6LYaSuSd75NPJLMkMQRMlS+k5JuYDpYAdGf+bS/t/R1uC3TvQZYym1PyM0rWOo
         SSJNUeMsogJs4Kh9AlXsyJQ4QYL8yZOd2TXVX6NUWevTfbaW99xkYmWJYgsvy+ASA/dd
         HhW2i64RqTIl18YA4YVY4AdU/zGo9xif+nYs37rJugMm8+yJ+5EFQpMUKl7/DZqHZfoC
         sw8dT3Rq95BzCc1FZnximqJG5eVDxJn08pAy/+apiyq+GdVOtMl6ShiWurbZZAFp9g4O
         x6AXdnvDskq/YxhJx8xfUcLxI3HhCPcl+Mt3+ZwUm7MXYbmnHHdB3QxodaT75xu75SHS
         CYNg==
X-Gm-Message-State: AOJu0YzNPO7dlUxK4tdIIQRKA0ZyXzCbEjFHUlxJrZe9lvJFAFNEltqf
	XIK/J7EnNuYbfUPECVZFkciKn2DPaZxJigkWgDSgm5vnNWuSsSbv0oPTMscxl9XecR40JOdL3jt
	K
X-Gm-Gg: ASbGncs6ttpqeNPo11SWJq/lP76gVJeL6LZNZaLmpufqDKlkbDZ1qNTeQ+ZSW/cZBVF
	3YHJRS+LTb3Jdr6ATrub6jVhZkVI4Z0r0VG8RtVtEAM5IdXyHRT/tK+DHNdoPPoMPPRiWZaYtEp
	fSjbppRiVrcjOy85w3xgnCrXnnEJZQcFzPzsP4ENeGf8L8EWpXIpEzez0YvCpHhVj1vVJzBgD8y
	pbOnZQ+34kN6c5zKmSTtO4tJdge27/XnpUOQuhXsf5hgvlWGa0i5wFki5MJYkL5KKAzGHyc10Hc
	6hH/zXLzxKmC6nwiDQZdtAsDiOx9WABmAP8TE6ZgiP3/wkCa3A==
X-Google-Smtp-Source: AGHT+IE9RaG3JnTWQBOFC+cG5oJLPzGegDPF8j6pgIAxLmaI3dzluH6lmpvCgAJRjLW14fgB2O0LwQ==
X-Received: by 2002:a17:907:9728:b0:abe:e814:ecb4 with SMTP id a640c23a62f3a-abf25f8dd35mr1474577666b.4.1740985572603;
        Sun, 02 Mar 2025 23:06:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c0b9cbfsm769454866b.14.2025.03.02.23.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 23:06:12 -0800 (PST)
Date: Mon, 3 Mar 2025 10:06:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Saeed Mahameed <saeed@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next 12/14] devlink: Throw extack messages on param
 value validation error
Message-ID: <838b1bb7-776f-481a-bda0-015368012040@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228021227.871993-13-saeed@kernel.org>

Hi Saeed,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Saeed-Mahameed/devlink-define-enum-for-attr-types-of-dynamic-attributes/20250228-101818
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250228021227.871993-13-saeed%40kernel.org
patch subject: [PATCH net-next 12/14] devlink: Throw extack messages on param value validation error
config: sparc-randconfig-r071-20250302 (https://download.01.org/0day-ci/archive/20250302/202503022006.eOu80RMF-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503022006.eOu80RMF-lkp@intel.com/

smatch warnings:
net/devlink/param.c:498 devlink_param_value_validate() error: we previously assumed 'param_data' could be null (see line 475)

vim +/param_data +498 net/devlink/param.c

ca557d9df319fed Saeed Mahameed 2025-02-27  461  static int
ca557d9df319fed Saeed Mahameed 2025-02-27  462  devlink_param_value_validate(struct genl_info *info,
ca557d9df319fed Saeed Mahameed 2025-02-27  463  			     enum devlink_param_type type)
ca557d9df319fed Saeed Mahameed 2025-02-27  464  {
ca557d9df319fed Saeed Mahameed 2025-02-27  465  	struct netlink_ext_ack *extack = info->extack;
ca557d9df319fed Saeed Mahameed 2025-02-27  466  	struct nlattr *param_data;
ca557d9df319fed Saeed Mahameed 2025-02-27  467  	int len = 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  468  
ca557d9df319fed Saeed Mahameed 2025-02-27  469  	if (type != DEVLINK_PARAM_TYPE_BOOL &&
ca557d9df319fed Saeed Mahameed 2025-02-27  470  	    GENL_REQ_ATTR_CHECK(info, DEVLINK_ATTR_PARAM_VALUE_DATA))
ca557d9df319fed Saeed Mahameed 2025-02-27  471  		return -EINVAL;
ca557d9df319fed Saeed Mahameed 2025-02-27  472  
ca557d9df319fed Saeed Mahameed 2025-02-27  473  	param_data = info->attrs[DEVLINK_ATTR_PARAM_VALUE_DATA];
ca557d9df319fed Saeed Mahameed 2025-02-27  474  
ca557d9df319fed Saeed Mahameed 2025-02-27 @475  	if (param_data)

This assumes param_data can be NULL

ca557d9df319fed Saeed Mahameed 2025-02-27  476  		len = nla_len(param_data);
ca557d9df319fed Saeed Mahameed 2025-02-27  477  
ca557d9df319fed Saeed Mahameed 2025-02-27  478  	switch (type) {
ca557d9df319fed Saeed Mahameed 2025-02-27  479  	case DEVLINK_PARAM_TYPE_U8:
ca557d9df319fed Saeed Mahameed 2025-02-27  480  		if (len == sizeof(u8))
ca557d9df319fed Saeed Mahameed 2025-02-27  481  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  482  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  483  				       "Expected uint8, got %d bytes", len);
ca557d9df319fed Saeed Mahameed 2025-02-27  484  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  485  	case DEVLINK_PARAM_TYPE_U16:
ca557d9df319fed Saeed Mahameed 2025-02-27  486  		if (len == sizeof(u16))
ca557d9df319fed Saeed Mahameed 2025-02-27  487  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  488  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  489  				       "Expected uint16, got %d bytes", len);
ca557d9df319fed Saeed Mahameed 2025-02-27  490  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  491  	case DEVLINK_PARAM_TYPE_U32:
ca557d9df319fed Saeed Mahameed 2025-02-27  492  		if (len == sizeof(u32))
ca557d9df319fed Saeed Mahameed 2025-02-27  493  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  494  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  495  				       "Expected uint32, got %d bytes", len);
ca557d9df319fed Saeed Mahameed 2025-02-27  496  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  497  	case DEVLINK_PARAM_TYPE_STRING:
ca557d9df319fed Saeed Mahameed 2025-02-27 @498  		len = strnlen(nla_data(param_data), nla_len(param_data));
                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereferences

ca557d9df319fed Saeed Mahameed 2025-02-27  499  
ca557d9df319fed Saeed Mahameed 2025-02-27  500  		if (len < nla_len(param_data) &&
ca557d9df319fed Saeed Mahameed 2025-02-27  501  		    len < __DEVLINK_PARAM_MAX_STRING_VALUE)
ca557d9df319fed Saeed Mahameed 2025-02-27  502  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  503  		NL_SET_ERR_MSG_MOD(extack, "String too long");
ca557d9df319fed Saeed Mahameed 2025-02-27  504  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  505  	case DEVLINK_PARAM_TYPE_BOOL:
ca557d9df319fed Saeed Mahameed 2025-02-27  506  		if (!len)
ca557d9df319fed Saeed Mahameed 2025-02-27  507  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  508  		NL_SET_ERR_MSG_MOD(extack, "Expected flag, got data");
ca557d9df319fed Saeed Mahameed 2025-02-27  509  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  510  	default:
ca557d9df319fed Saeed Mahameed 2025-02-27  511  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  512  				       "Not supported value type %d", type);
ca557d9df319fed Saeed Mahameed 2025-02-27  513  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  514  	}
ca557d9df319fed Saeed Mahameed 2025-02-27  515  	return -EINVAL;
ca557d9df319fed Saeed Mahameed 2025-02-27  516  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

