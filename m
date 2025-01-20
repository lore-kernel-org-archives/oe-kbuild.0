Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80FE1922F5
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360913; cv=none; b=KB0ouI1t7huPKK/GJY2LfyAB3MJ/q6HwtKICkgRZGdMYc8LJ72nMEVtbwtPH/kndL+wj9YnXpTRVOj7jWd4atiZvS0t/soDoNSbpeouHx8+x4Axk1PUZ1RElHdz3HwAlbw7a7FnaM7l6NmI+Y4sVJeMiQSCGcSwlEKM1lCzr1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360913; c=relaxed/simple;
	bh=qNU2pgojq4RxHg/p3aNjSgeJllAWkcFz7GgDPZJb/cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IzPGOxmyNSwSj7MlF0oKHRUIBUeuupYgOJinjwqympTpg2MtcYLQ13F8aaaLn/4iFf20mkIfIrNf61cCA1Z+w+1UMtAGiEa5QDv/8Wj4PnfJT//ROwGPI1rqaEOLjNkr8kx3gFnoTYjHpdCrOAhr500koVoPywS+Vb1ExhQfTx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sM4LeFBM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sM4LeFBM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso25889845e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 00:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737360909; x=1737965709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A09ktfAOPPyu9exFxifvfSR4TKmqpkMAIRIJNi7aCSI=;
        b=sM4LeFBMZPZJKYXwXelGNl2c7nI3Ew2Uz2PswT6ewlQSC/Svi0HM+slYZbJLjO2stz
         CV6CZ8+cTxESHoxlrFyt1Qrr+KSLD6xo/CyQIGF2WImVsfctm1a1HN+9lx8S2KY/A35f
         bvlETsGD5gp6oX+KcIFLoohZ+a0cEtoIx0uAhdfCRMB0qnxhFlMOXKOOBcWtUTWddk49
         1TTR+r5zdNmNOpK60otZqZlarQVCfYPuk+7MR1irpAYbjk70lHLqDagI6WkQplioagWa
         yksqWRC1yDOVbHx5ZrqKv4K0rYp+KQ2qah806+TxXFk3mmX3o7wsH5BlPL3FDh16+D8I
         jNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737360909; x=1737965709;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A09ktfAOPPyu9exFxifvfSR4TKmqpkMAIRIJNi7aCSI=;
        b=MqiRytxXvD08FnE0KaGv6et5yshhC23qIdsxfqdkbVvj8H86HY4e16bjc5hrTURcEF
         h49WFPongb6sLvWL/crz037XIzdz/oPN7Wdr2FXh9bEqpDQH8KWnspUUeWhG6AXy0IiJ
         csxReVFvIuABXbSL0eKJqqqbjQPFJbpnCTA465p6niR9VtoTFshcLzvAR6TsYkVtfR6a
         Ys3+C1YCCAg7c+kkkE741QA2eWApxQyf4Sjiz8SOgCVIQ/AczsHBZv25NTUASWibFAQb
         vIynRHnN8mJJ2cM2omd3Ui/l03/1kiRL1b4U9UyutpKQppTp5ICd1ChtPzzuPS8R60Sk
         UqxQ==
X-Gm-Message-State: AOJu0YzOBWFNqz//7Cc0k8xzmoYW0ckWrZkrLkQ7Q3z8WMvI7D7tNifu
	bzuLRnF08RQpBjIhJu/mjbjed346WioSsMO2tNCnWClTJpHoSsdygw09bAxNYLYptc5ykoJdTWv
	r
X-Gm-Gg: ASbGncuYivYRf15vRQYI4ApJK7tdUlJTqtFZSNVQUpvSCLOoFV1bI8ulrZcq4X5C2dM
	v61oDQEmdc0fMJ+CfsyZGg/3MEF4JPX8tjkEKEAcAJ04WucbKAyRoWrNNhnyVEPVTzGztgnl4b2
	/SPxsDM9OAn++c20+YxgvEr9E/r2SqkB9VaBvUFyt2bclal9wpW/GLINryT+8TANCjaFrA2D+/h
	4zaZG4AcD66mFNXZrewB9nY/3j81LHKgi8mq76x1X202wQ9hX5H7DDA7oEf4ijMcX5pMpfEcOY=
X-Google-Smtp-Source: AGHT+IEWHv9ynMnrEE8ZJOOYjOCTr5BrSCFg9p7EuLheqv8DchREXYYPN0l/9TjEXyDyPhS98pE9uA==
X-Received: by 2002:a05:600c:4452:b0:436:e3ea:64dd with SMTP id 5b1f17b1804b1-437c6b2dd76mr176517855e9.11.1737360909177;
        Mon, 20 Jan 2025 00:15:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890462195sm128375705e9.30.2025.01.20.00.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 00:15:08 -0800 (PST)
Date: Mon, 20 Jan 2025 11:15:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Odelu Kukatla <quic_okukatla@quicinc.com>,
	Mike Tipton <mdptipton@quicinc.com>,
	Vivek Aknurwar <viveka@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V7 1/5] interconnect: core: Add dynamic id allocation
 support
Message-ID: <0bca7854-aa27-48c6-8612-bcecc7b68c65@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111161429.51-2-quic_rlaggysh@quicinc.com>

Hi Raviteja,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raviteja-Laggyshetty/interconnect-core-Add-dynamic-id-allocation-support/20250112-001756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250111161429.51-2-quic_rlaggysh%40quicinc.com
patch subject: [PATCH V7 1/5] interconnect: core: Add dynamic id allocation support
config: arm-randconfig-r072-20250118 (https://download.01.org/0day-ci/archive/20250120/202501201530.UTAPd4lC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501201530.UTAPd4lC-lkp@intel.com/

smatch warnings:
drivers/interconnect/core.c:889 icc_node_create_alloc_id() warn: inconsistent returns 'global &icc_lock'.

vim +889 drivers/interconnect/core.c

65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  867  struct icc_node *icc_node_create_alloc_id(int start_id)
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  868  {
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  869  	struct icc_node *node;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  870  	int id;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  871  
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  872  	mutex_lock(&icc_lock);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  873  
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  874  	node = kzalloc(sizeof(*node), GFP_KERNEL);

Do this allocation before taking the mutex_lock(&icc_lock).  Otherwise
you'd have to unlock before returning.

65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  875  	if (!node)
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  876  		return ERR_PTR(-ENOMEM);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  877  
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  878  	id = idr_alloc(&icc_idr, node, start_id, 0, GFP_KERNEL);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  879  	if (id < 0) {
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  880  		WARN(1, "%s: couldn't get idr\n", __func__);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  881  		kfree(node);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  882  		node = ERR_PTR(id);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  883  		goto out;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  884  	}
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  885  	node->id = id;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  886  out:
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  887  	mutex_unlock(&icc_lock);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  888  
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11 @889  	return node;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  890  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

