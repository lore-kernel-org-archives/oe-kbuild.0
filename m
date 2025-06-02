Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B04211C
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Jun 2025 06:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844140; cv=none; b=RtR/9hcNquDLXEh/oPqSjiqcoENkIdeY+eDy2jFskKvoDw4IK/pKOAoU8fzgwkFfoBA8eNtbwbgFmeqZnMQvWZ6NlYD+nV1EOgewfexWZoGwPM923QTPFfpIkX9x6BiXCRd1LEyDsRXsQUnuklI22BCag1lN2hUYI+2hp3OmgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844140; c=relaxed/simple;
	bh=993weCM7BODgq41RFtmFkCsrhwxDzvZ7q/xDU5YIT8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7dFfQmidozpUmrzRR3nlqilDtgXwfjUhRSnqfk2CpgKRcP0QQ0SOM5VaxiBLS3/kxQ4sZijmzaoElnwAdpG4VipVMw1Y01E+E7gCAwAClTFMURKGiJ+OkhZtqU83eQt4fre1v8uWsYjO3ZP3Nha89VCqpA9B+i4MGH2CAk/voE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkdWl8dX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkdWl8dX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso14989705e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 01 Jun 2025 23:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748844136; x=1749448936; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WmvdSwhiDp+Nzphh8osSeIjP+ICe5x4KOHzrotrZYSI=;
        b=QkdWl8dX+NkNe8oqeuaHgWTHG1rhRMXn0zWJTUQ/YCn7q651au0P2M3Gu/8lLxfqOJ
         0eGg9tmWFfAqpVSu21VkhosT9F1yI1H8sWlcZ09YERZbC41o7xJhWdSiDB3Ee1WrMp/s
         qDU7cThuKyG2deTjrUOQRRtLoVMp9/K7LBN4sgRv8GjAzEKBFLUvD0yUxVtbYOLFPc3p
         nPT+pqAgqAp2iN9qil0Ekz3XQ8HhDMZlZbGYcDf9Xzx1IX1mgtZv5ow9zjo1e1a9f57F
         /vDw2q9afZM1BCbli4gohtO3yIRcbJm7wBVC5X4AgHWEbF1xzZAaXS1wScHKY43jNytl
         Aa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844136; x=1749448936;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WmvdSwhiDp+Nzphh8osSeIjP+ICe5x4KOHzrotrZYSI=;
        b=I5o3cI2oU7k9OelRWuhJYGnLl+zBA6ufiBUA0UR47o0xRlE/meT3+U5nWFcGkILlP/
         QnA6YtHGdniFQNCS+1dCtBkjnfc5gcPpd/gEIdM0svOjJ6TZSQTopmvGuWGsYGvGvnQJ
         JVc1ysbIhEfnzjz6UXsMltUfD8sDooZKbHI7hErfR+m3NFltJ9Hvg/QmJEE6ZEtW6Dg6
         0n1WXuqwb4Q+67yrsQCX+H2KPnrpM0o1NKJKSoYEcjrrBqiLJZacB6Kq2yo/88LV1gxB
         JSclOfTs3HTXUfNSg7H5HDb60xADJgNuPXTW3seGDPgq4RuORKGFLIUdODDbtYP3sxcW
         Nbhg==
X-Gm-Message-State: AOJu0Yzmo9ARV6Vo81DyBOzps9T9XVOLh7dm4FDp/15ITwXZKWmbHsZp
	2YEQk4kNybki3KLQMZI93fWL5sMzVBxM6qR8ni/SCS0yQYDxMJj494mdLgI+l579WDx4r24UyEY
	75IQT
X-Gm-Gg: ASbGnctFzhlQ7if2eMUC4ndxJjyfCS4QMA0Pp12flKBvN3KeFDhQhL7Vvjskg5B1MJb
	kubPpHqwceoM3hJB7O6z/xIUMrq1uqjjRt59adEMAsHQlxlanBresDUG5N2yYQj00X9riKgjjsk
	Qk91/+sf9n4ZUjvgtls4z8cplMhkck3ga9cPpdkTyEEVRX0208SC8iTUnCmK4k3h3YIKCao/iIJ
	W2p19kOBjIIEmaCiyJhfdDgIrkaZDfnef7HvmLuffB6pzptWDhl10NeRn0NOlfMzIz7lQz+WUv9
	xZ8oOI0U4gn8ExpIG5y5N8ZbNEn27MlWSjh1qjs+9CImbwZJgr/nRkQXNCMBc3nfaw==
X-Google-Smtp-Source: AGHT+IGCbfTTSyOx5YqB3QQ9uZkEZx1FZ0ZHudKowlPeGeWfVjuLcwljB8+6ql5Gv5x5w3Jh+DSVYw==
X-Received: by 2002:a05:600c:45cc:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-450d87fd9bemr111589155e9.3.1748844136132;
        Sun, 01 Jun 2025 23:02:16 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe73f83sm13225471f8f.49.2025.06.01.23.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:02:15 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:02:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.2 2/17] mm/bpf_oom.c:35 bpf_handle_oom() error:
 uninitialized symbol 'ret'.
Message-ID: <202505290554.VSvO6NLF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250602060211.u1RU0Zk8jFqxTskKNcVADlP2rim4EFm62a2r81mKUms@z>

tree:   https://github.com/rgushchin/linux.git bpfoom.1.2
head:   e3a569772f1fbe667574cb12da7cf500a0c91475
commit: 954f163d5cf03cb8f4ea7c9930265fc327c46a91 [2/17] mm: introduce a bpf hook for OOM handling
config: x86_64-randconfig-161-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290554.VSvO6NLF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505290554.VSvO6NLF-lkp@intel.com/

smatch warnings:
mm/bpf_oom.c:35 bpf_handle_oom() error: uninitialized symbol 'ret'.

vim +/ret +35 mm/bpf_oom.c

954f163d5cf03c Roman Gushchin 2025-04-23  21  bool bpf_handle_oom(struct oom_control *oc)
954f163d5cf03c Roman Gushchin 2025-04-23  22  {
954f163d5cf03c Roman Gushchin 2025-04-23  23  	struct bpf_oom *b = &system_bpf_oom;
954f163d5cf03c Roman Gushchin 2025-04-23  24  	struct bpf_oom_ops *ops;
954f163d5cf03c Roman Gushchin 2025-04-23  25  	int ret, idx;
954f163d5cf03c Roman Gushchin 2025-04-23  26  
954f163d5cf03c Roman Gushchin 2025-04-23  27  	oc->bpf_memory_freed = false;
954f163d5cf03c Roman Gushchin 2025-04-23  28  
954f163d5cf03c Roman Gushchin 2025-04-23  29  	idx = srcu_read_lock(&b->srcu);
954f163d5cf03c Roman Gushchin 2025-04-23  30  	ops = READ_ONCE(b->ops);
954f163d5cf03c Roman Gushchin 2025-04-23  31  	if (ops && ops->handle_out_of_memory)
954f163d5cf03c Roman Gushchin 2025-04-23  32  		ret = ops->handle_out_of_memory(oc);

ret isn't initialized on the else path.

954f163d5cf03c Roman Gushchin 2025-04-23  33  	srcu_read_unlock(&b->srcu, idx);
954f163d5cf03c Roman Gushchin 2025-04-23  34  
954f163d5cf03c Roman Gushchin 2025-04-23 @35  	return !!ret && oc->bpf_memory_freed;
954f163d5cf03c Roman Gushchin 2025-04-23  36  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

