Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7211993BD
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Jun 2025 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845219; cv=none; b=A12WGmsVfk+/zLObPgTclzBuXkRszpywH3Js0bL7jPHqBKk94ytkEkM7f4L4Hoyuj1Ry4+wE+hCaR/xDKXnQPnRiquVK+Jati1bC2bEftFLECHUg1HV39j7j56YPozBx0Hc7n40N3fKKfeu3Bsw2PuYEAe3bPKsILeDsO9EaZ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845219; c=relaxed/simple;
	bh=uqhiVvUTjJUz12WNnC5vQ4AYx38ysdEHyQ+YwgWYwRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ic5Ghzok8rsRJzIKYlDD1CUIIyB7u0mH57yjOSME2hluaZQ+jhtTiMW65izqqlWuAIIWWZFtx8OGJFRNLmb4JWbSvbpAJFWvDyfUJalAcV1DYLp8ZsI8EMfkRs9DPeUsB/tqHc5OQuW1lY55xzRUEw9VBA9LZwC0zdwsrtoHzYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XEBfCz0L; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEBfCz0L"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so5402275e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 01 Jun 2025 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748845215; x=1749450015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tOEMUoWDeDY5mzeOr4SEl8dbwxhrqozXvwOKEHtHeUk=;
        b=XEBfCz0LJYhjP/5kOGahvURO7gsEdGdnFSAJnYs91m0xuxqZqFAveKRRP6MMcEIo5N
         sh69oJf2A/zPpNrPDZKDWH1a6zMWLfIaLYnlYBUhtRwk3rc4gl/UN6V8vwXRSjHK2vOR
         HmOOK4N0NOzLQIcgGze79Lvn2C+jVVo+MpU7+IlH4fJytiISjes+Dl6gnAzsmIgW+uZm
         nK9HG/WgWSagtb2DZiFB3sehPKjk/7C1Gsa62XNCI1iwwima/p5/4b2eq+jG+wjvvVVd
         3O2TI6egMxdTiIzq42Zs9JbXHfn0oqTVTJ7sp/vLbrmpm4zhpzSmZ6bgfNktgxfDz+s4
         X6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845215; x=1749450015;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOEMUoWDeDY5mzeOr4SEl8dbwxhrqozXvwOKEHtHeUk=;
        b=YQlWYva4nGMltNKZ8SVHHZKjkQdgd87QfJe2ozZzIEImD903S0sUKzT7FemaAqQA9P
         sbMozzloqJcvqmPJfMq2bS4amG77MP6iJAva+dFE6qAWEE6sruHkOc1mbMb3fPaapbDe
         bo9YA4Yv8Ce4Qi9azSAjE3gZGI9HUWsraWRAeIgVZ2l9VlFvhg2wlqiq7s+fvwMgmNdw
         0dYSGGyKa+5K4LESzsvq9rmiuekaysKMGFqD/18/asgdiHKTJ1/Mom57M4RVGUPdjmFk
         RKBZM2cW7x0CjyVHxplOTXPFWp41C8oXyMc3WcTBqwem2wOrH2fB1o5m0v7E37ga4rxM
         WG2A==
X-Gm-Message-State: AOJu0YysOkwwhYzSR2U3wpa3UupsM+68Ltpbt+F4DmngtSjPQb5V4Ito
	Si/1bYozDFEqPHHX2WOOxBhL4/eg10OP0C8dcl5l0C12JKJikmWBX04oESmGC5Q50tjNtDxZ+1e
	N8xl/
X-Gm-Gg: ASbGncsdu63GElV83hhvv3etQKuGSOIn96aZsut9g08ukJJFf4uJPzoy6ykjZ3PTE/i
	U5zC35FO1kOmxdxb/GhD55eZYHmI29BjfbHzFcbpCam6FaP24NePjz9NjPZ/8Z4PV/sFP9OhDnS
	zLd0Y+3EgVy1opTfeCKtwrZJ2lfvwwCy8X6dcr29D8JtJXtctQmDfFXh9G/EGWnF6tRm07ArL6O
	IZDEgr/h+fvFwnjtY/mbETzF4f2rUHBo0qiu8/IZakS1QNmuzr15tNVdrRFDoqi1U7xQOu1RzDS
	33HuS+uy5+fF5qkA61hCPkHaux44yJw+whxb2j5d9aY+gngd8wTGx4M=
X-Google-Smtp-Source: AGHT+IEhg9lSTzexUaVbkdcQrdyWsGg7a4BXZ1AHF91UKUvvwVHEH4xwEI9JAg73XATTsIBgax4M7A==
X-Received: by 2002:a05:600c:4f05:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-4511ee13fb8mr65790875e9.18.1748845215311;
        Sun, 01 Jun 2025 23:20:15 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fa24c6sm108973155e9.12.2025.06.01.23.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:20:14 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:20:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rong Tao <rtoax@foxmail.com>, ast@kernel.org,
	daniel@iogearbox.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, rtoax@foxmail.com,
	rongtao@cestc.cn, Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Juntong Deng <juntong.deng@outlook.com>,
	Amery Hung <amery.hung@bytedance.com>,
	Dave Marchevsky <davemarchevsky@fb.com>,
	Hou Tao <houtao1@huawei.com>,
	"(open list:BPF (Safe Dynamic Programs and Tools))" <bpf@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpf: Add bpf_task_cwd_from_pid() kfunc
Message-ID: <202505300432.nZC50gOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_97F8B56B340F51DB604B482FEBF012460505@qq.com>
Message-ID: <20250602062010.2YcQPA84A_QGl1dBCuDB7OLj3lPyKKGDoPsdjzhX-oU@z>

Hi Rong,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Tao/selftests-bpf-Add-selftests-for-bpf_task_cwd_from_pid/20250529-113933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/tencent_97F8B56B340F51DB604B482FEBF012460505%40qq.com
patch subject: [PATCH bpf-next 1/2] bpf: Add bpf_task_cwd_from_pid() kfunc
config: x86_64-randconfig-161-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300432.nZC50gOu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505300432.nZC50gOu-lkp@intel.com/

smatch warnings:
kernel/bpf/helpers.c:2687 bpf_task_cwd_from_pid() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +2687 kernel/bpf/helpers.c

b24383bde5a454 Rong Tao     2025-05-29  2657  __bpf_kfunc int bpf_task_cwd_from_pid(s32 pid, char *buf, u32 buf_len)
b24383bde5a454 Rong Tao     2025-05-29  2658  {
b24383bde5a454 Rong Tao     2025-05-29  2659  	struct path pwd;
b24383bde5a454 Rong Tao     2025-05-29  2660  	char kpath[256], *path;
b24383bde5a454 Rong Tao     2025-05-29  2661  	struct task_struct *task;
b24383bde5a454 Rong Tao     2025-05-29  2662  
b24383bde5a454 Rong Tao     2025-05-29  2663  	if (!buf || buf_len == 0)
b24383bde5a454 Rong Tao     2025-05-29  2664  		return -EINVAL;
b24383bde5a454 Rong Tao     2025-05-29  2665  
b24383bde5a454 Rong Tao     2025-05-29  2666  	rcu_read_lock();
b24383bde5a454 Rong Tao     2025-05-29  2667  	task = pid_task(find_vpid(pid), PIDTYPE_PID);
b24383bde5a454 Rong Tao     2025-05-29  2668  	if (!task) {
b24383bde5a454 Rong Tao     2025-05-29  2669  		rcu_read_unlock();
b24383bde5a454 Rong Tao     2025-05-29  2670  		return -ESRCH;
b24383bde5a454 Rong Tao     2025-05-29  2671  	}
b24383bde5a454 Rong Tao     2025-05-29  2672  	task_lock(task);
b24383bde5a454 Rong Tao     2025-05-29  2673  	if (!task->fs) {
b24383bde5a454 Rong Tao     2025-05-29  2674  		task_unlock(task);
b24383bde5a454 Rong Tao     2025-05-29  2675  		return -ENOENT;

rcu_read_unlock();

b24383bde5a454 Rong Tao     2025-05-29  2676  	}
b24383bde5a454 Rong Tao     2025-05-29  2677  	get_fs_pwd(task->fs, &pwd);
b24383bde5a454 Rong Tao     2025-05-29  2678  	task_unlock(task);
b24383bde5a454 Rong Tao     2025-05-29  2679  	rcu_read_unlock();
b24383bde5a454 Rong Tao     2025-05-29  2680  
b24383bde5a454 Rong Tao     2025-05-29  2681  	path = d_path(&pwd, kpath, sizeof(kpath));
b24383bde5a454 Rong Tao     2025-05-29  2682  	path_put(&pwd);
b24383bde5a454 Rong Tao     2025-05-29  2683  	if (IS_ERR(path))
b24383bde5a454 Rong Tao     2025-05-29  2684  		return PTR_ERR(path);
b24383bde5a454 Rong Tao     2025-05-29  2685  
b24383bde5a454 Rong Tao     2025-05-29  2686  	strncpy(buf, path, buf_len);
b24383bde5a454 Rong Tao     2025-05-29 @2687  	return 0;
b24383bde5a454 Rong Tao     2025-05-29  2688  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

