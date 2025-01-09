Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93934201036
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408689; cv=none; b=t6Pa3cKOF0BOWQEcnK2CH1u/WMXpsi2KafdzeO/xGOccDAZHW8HLz4g6Lysqf/r8edZzHS+FhFp/HKDPuNjyjOFOmKNdV5ODtD+TMBdheg646Oib/uHJRU0xJkYKThW4/Klg9kIkKzwE0cOz3yd/IdM5BUUvqpDBBNZxevCjPus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408689; c=relaxed/simple;
	bh=6onrqQYcmrJKr3OUWZOpc+b8eSH0n4nhHqUMyG9mHQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Plk7iJ5/HgfDSLy318nl3yX+VdpmoZjk0Obm+30ptYyts2PDINGEXeoACrzKWzu3jqZcSyFc8+g+ITmh1ZK6dIX+lavuTn9/pKzPgkI5xvrPPYdLQOvv5xj42JNnlN8EnlSN0wq1sJcZDpP9GS6kxIuVl3J0g1hAX67Gs+R0jiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZRExO+P; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZRExO+P"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso6722465e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 08 Jan 2025 23:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736408685; x=1737013485; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hh1x7j7lWYWudfhLYOjBc9jNq9Ri5N5BbraB/aTanEc=;
        b=wZRExO+PDbnmlbn5Z0tW9OSW4sJx4qQ1a6LvexFsc2lV+O2UUjlcMA8vibiq6EGIiN
         hy1103hiijK3bHSvJ3iQMQ5OvkbgMEyhF40S4pwuD8+Dc4yKd85fFzfAbPuXOPfPOnAO
         sECrpCFJoGlOJiXArVGi/iiAHhQMbNq/rL9vVkc7UQMlL6K24pEQoIlL2XCTJWiTaxfD
         E0DfBHp9IUYKGgfLgv0Qjq/N7C7HU8lzkScTXU8aMlQ9mG6pNiDUZRIOqd7deLwhGbWh
         y+vbRGASJp3k6DUfYOk65UXlJWvnRKEKz1xBxC0FycGKeF6GisHNQ0JvrZl220MPIXAv
         7hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408685; x=1737013485;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh1x7j7lWYWudfhLYOjBc9jNq9Ri5N5BbraB/aTanEc=;
        b=DYpkLpkprpsmO6IxtcZXOSFaBf3u2WOD3aUFJFACd9aYoujqKAYZMglUe0NJYk1xL6
         uX9URl507bGJ8dukTjSCm08YoPAf7I3PRpHrfpElkEsyHk/HjlUQPEEDU4XtdUZHcCH6
         jxnOkdfjVlOLHYaofSwgn92Z7o6tPL/mybP9YvJUoiA0Tp3Nd/3r2wtyjvNWObWRCre9
         4pe+y1459jFGlG/FG/Viv91grWnk3MSlpnrsxVfaPQDYrQWUjjGm8zqdDUG00YI6hbw3
         nTYI8hfU49ZSLNkW45yzliondW7bK0O5aYI9O6SZ7wvNXqzkMoSwlue/jw/ob0IPTRA2
         +B9w==
X-Gm-Message-State: AOJu0YxXCIYmNsCMgK3HyzU8f2qU7Z9YYUEXbG4RtLlXUaJNHgYXi3FI
	pBieX6oBtxFqBw19UpZSMMuVt7gSuNIxk9ce85dspeNnzpdkScGEkXHy1x/Szt4GYUBdevBPO3I
	R
X-Gm-Gg: ASbGncvxv4RBUnqE9nscz5zLWZLuBA9n7ius63qTv7DH2cd3jQ+QopdF4sTgzLkugqD
	msgkrGIiWJTGC6REgOG5Ft8joe7Iai2vDxCxZ3HiBPBVTcG4tU/03uGGENDJNGgSvbGcIdOoV/T
	mBmCmDvgTrZffoAK31rBIORNEqq3mPdlBZNr0ZHaz8iMbyvVMcCpzbuMbVXK6aNDQp4ucqtgXlx
	iC6vBr+qi9pW/dvultzmfGJwIvBaT9ngG5lSa3rYlFLSAjzyU83AQMUzplUlw==
X-Google-Smtp-Source: AGHT+IHEZyaIVzclqxdjP4ZOdG6lan/GRGVy2gb2M3EakOZNST5naAVRXF+JitBOxJ6aEWygbw7++A==
X-Received: by 2002:a05:600c:4f52:b0:436:4708:9fb6 with SMTP id 5b1f17b1804b1-436e26e259emr49159755e9.20.1736408684620;
        Wed, 08 Jan 2025 23:44:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6401sm46146425e9.2.2025.01.08.23.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:44:43 -0800 (PST)
Date: Thu, 9 Jan 2025 10:44:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Haren Myneni <haren@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, msuchanek@suse.de,
	mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH 5/6] powerpc/pseries: Add ibm,get-dynamic-sensor-state
 RTAS call support
Message-ID: <b4313bdb-29ba-42c1-9011-4bb558d056ba@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104204652.388720-6-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-HCALLs/20250105-045010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250104204652.388720-6-haren%40linux.ibm.com
patch subject: [PATCH 5/6] powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
config: powerpc64-randconfig-r071-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090552.UzEfb4QU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501090552.UzEfb4QU-lkp@intel.com/

New smatch warnings:
arch/powerpc/platforms/pseries/papr-indices.c:496 papr_dynamic_sensor_ioc_get() warn: inconsistent returns 'global &rtas_ibm_get_dynamic_sensor_state_lock'.

Old smatch warnings:
arch/powerpc/platforms/pseries/papr-indices.c:438 papr_dynamic_indicator_ioc_set() warn: inconsistent returns 'global &rtas_ibm_set_dynamic_indicator_lock'.

vim +496 arch/powerpc/platforms/pseries/papr-indices.c

e44fb25ad9fa03 Haren Myneni 2025-01-04  452  static long papr_dynamic_sensor_ioc_get(struct papr_indices_io_block __user *ubuf)
e44fb25ad9fa03 Haren Myneni 2025-01-04  453  {
e44fb25ad9fa03 Haren Myneni 2025-01-04  454  	struct papr_indices_io_block kbuf;
e44fb25ad9fa03 Haren Myneni 2025-01-04  455  	struct rtas_work_area *work_area;
e44fb25ad9fa03 Haren Myneni 2025-01-04  456  	s32 fwrc, token, ret;
e44fb25ad9fa03 Haren Myneni 2025-01-04  457  	u32 rets;
e44fb25ad9fa03 Haren Myneni 2025-01-04  458  
e44fb25ad9fa03 Haren Myneni 2025-01-04  459  	token = rtas_function_token(RTAS_FN_IBM_GET_DYNAMIC_SENSOR_STATE);
e44fb25ad9fa03 Haren Myneni 2025-01-04  460  	if (token == RTAS_UNKNOWN_SERVICE)
e44fb25ad9fa03 Haren Myneni 2025-01-04  461  		return -ENOENT;
e44fb25ad9fa03 Haren Myneni 2025-01-04  462  
e44fb25ad9fa03 Haren Myneni 2025-01-04  463  	mutex_lock(&rtas_ibm_get_dynamic_sensor_state_lock);
e44fb25ad9fa03 Haren Myneni 2025-01-04  464  	work_area = papr_dynamic_indice_buf_from_user(ubuf, &kbuf);
e44fb25ad9fa03 Haren Myneni 2025-01-04  465  	if (IS_ERR(work_area))
e44fb25ad9fa03 Haren Myneni 2025-01-04  466  		return PTR_ERR(work_area);

Add an unlock, same as with the _set() function.

e44fb25ad9fa03 Haren Myneni 2025-01-04  467  
e44fb25ad9fa03 Haren Myneni 2025-01-04  468  	do {
e44fb25ad9fa03 Haren Myneni 2025-01-04  469  		fwrc = rtas_call(token, 2, 2, &rets,
e44fb25ad9fa03 Haren Myneni 2025-01-04  470  				kbuf.dynamic_param.token,
e44fb25ad9fa03 Haren Myneni 2025-01-04  471  				rtas_work_area_phys(work_area));
e44fb25ad9fa03 Haren Myneni 2025-01-04  472  	} while (rtas_busy_delay(fwrc));
e44fb25ad9fa03 Haren Myneni 2025-01-04  473  
e44fb25ad9fa03 Haren Myneni 2025-01-04  474  	rtas_work_area_free(work_area);
e44fb25ad9fa03 Haren Myneni 2025-01-04  475  	mutex_unlock(&rtas_ibm_get_dynamic_sensor_state_lock);
e44fb25ad9fa03 Haren Myneni 2025-01-04  476  
e44fb25ad9fa03 Haren Myneni 2025-01-04  477  	switch (fwrc) {
e44fb25ad9fa03 Haren Myneni 2025-01-04  478  	case RTAS_IBM_DYNAMIC_INDICE_SUCCESS:
e44fb25ad9fa03 Haren Myneni 2025-01-04  479  		if (put_user(rets, &ubuf->dynamic_param.state))
e44fb25ad9fa03 Haren Myneni 2025-01-04  480  			ret = -EFAULT;
e44fb25ad9fa03 Haren Myneni 2025-01-04  481  		else
e44fb25ad9fa03 Haren Myneni 2025-01-04  482  			ret = 0;
e44fb25ad9fa03 Haren Myneni 2025-01-04  483  		break;
e44fb25ad9fa03 Haren Myneni 2025-01-04  484  	case RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR:	/* No such indicator */
e44fb25ad9fa03 Haren Myneni 2025-01-04  485  		ret = -EOPNOTSUPP;
e44fb25ad9fa03 Haren Myneni 2025-01-04  486  		break;
e44fb25ad9fa03 Haren Myneni 2025-01-04  487  	default:
e44fb25ad9fa03 Haren Myneni 2025-01-04  488  		pr_err("unexpected ibm,get-dynamic-sensor result %d\n",
e44fb25ad9fa03 Haren Myneni 2025-01-04  489  				fwrc);
e44fb25ad9fa03 Haren Myneni 2025-01-04  490  		fallthrough;
e44fb25ad9fa03 Haren Myneni 2025-01-04  491  	case RTAS_IBM_DYNAMIC_INDICE_HW_ERROR:	/* Hardware/platform error */
e44fb25ad9fa03 Haren Myneni 2025-01-04  492  		ret = -EIO;
e44fb25ad9fa03 Haren Myneni 2025-01-04  493  		break;
e44fb25ad9fa03 Haren Myneni 2025-01-04  494  	}
e44fb25ad9fa03 Haren Myneni 2025-01-04  495  
e44fb25ad9fa03 Haren Myneni 2025-01-04 @496  	return ret;
e44fb25ad9fa03 Haren Myneni 2025-01-04  497  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

