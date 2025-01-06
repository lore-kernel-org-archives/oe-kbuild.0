Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F651DB92A
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160263; cv=none; b=Flu+JZxsWWbOZiKZVyYuSLTPnFX0FcoyVO6qZ9u7YWeTFRLlp5M+318B3cTJoBl1jnGqshYFgaPJnP1PyBzLjzYPYl+MJDh5REoFyU68X3wjY2i/NGIzcvi1bKtARpmvOj985Z1deNfnBrC54IssQFncMdbBKpopY0T/IiKHAqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160263; c=relaxed/simple;
	bh=poUBAiTSvLAiLJyNYp7LsnS6buRg1UY5QZnK69KzTgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrK+E0iwmHhcSebTw3KdFw0mDbYWz+dAp2tV7b6VTzyylN0wP4Yc2DoSMmglUUnnw9qCbqF3dn1tNUM+P9G7+U/YbKaN2bG3DKwktOOlRkuANf7BjsdRL9/iOSp0RExjdGWi1okdN2s3DhlmeyoKFmas2zKx+puUVR6y4c0Bt8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iFgfecCG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFgfecCG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso102585755e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 02:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736160260; x=1736765060; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfheJ1uq+hnvWsDVQrOZqmjqT98YbiIGmgi6cE5dUGA=;
        b=iFgfecCG3ABwADsGd3rmjUC7oCgVXptwivwlJzNsClf3/Kc0crg3QMTgCrfka7QaXV
         UiW3jrW6TAfq/FQ30/6p12DIhPAEl+LYtpBlfdiGL1HlEUZ6zNwZVQ3vNheQzAKWUS4k
         UsL+9S08EgDoCG0jWjYjO6pKxZqMu0ty3pVmkeCzVJkc8CDhZKKPRsFMcxbWK6kBbrOZ
         1k8JAI+NzfzIdn4PUY8ogLXFsGcEey8xYA+55Ks7BFDqRyKdIWLfogg6/7BB0VJvC2PF
         v4uSFjoVvqXc+1r4ZkYJOCfipF/MchaQro+/gh8XLnuSQv/7KP1P6X/nI6M/2Xno5GNw
         gEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160260; x=1736765060;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfheJ1uq+hnvWsDVQrOZqmjqT98YbiIGmgi6cE5dUGA=;
        b=vArNotW8Ke3huqQhwvQ0N2W48n2xn2ewsN0Lcq3uiEhBNKdv18HyQOc+jweRWPAZDr
         vJ0nt3ia9je6qNHqfOmZwRbAaeXMpbLvJz6mNj00MDPTnznKbM0YAE/NwuTkKnB/xQK7
         5Dh5n9Kb4IW+HyYQ8VY5OJm3LDGrgj9AH41nYPjzl2j7ZlWMDUhrA4HozEerWG5QK4UD
         jQ4v7MS3Iegj+faiY/udNAlovHXkgEvbwZ0WAyyFaGEsWAp3h+fZeBSx7vWCDXryd2ff
         idQJZJbsucoBRojoPL7MAidu6lswBHYrmEy5OP/8XRGQ+bQ+At/7FhTK2CuvHgBthPmj
         kmFA==
X-Gm-Message-State: AOJu0YzEZbZacAnKkOUtcIvuwC8TymsRty9ePPRLmb9JbScRDAXU8Z8o
	8DYNebcmW+Tx1/jvItp80V3WwjF5I/j94dj6c9RxPvUy1RMqiPAzmy8OKCYw4zYsxjmpu/x3OkY
	N
X-Gm-Gg: ASbGncvzgLmnNrIH+/7S/RZmQy/jdRLOBJbE56JH3BtOsjwZJJsFE4TUrC6P+sleEZQ
	QTppxaTQzB/exwCNQJczp3cpV6bQgd4Za7F4fRm+z+PcHjCwGa2K/oKg6rqbxkGsEfpWj2TH2kt
	6wX8h5+RRThS5v/J0MRfsbleMOXbq1dJ7Kujzu5PBnft47m5OTFPsxU0fxuI+odJSsb+FuuzPTE
	FOlqYCiUA6ovDOjIKGjOPgub4cqJrNgwMu1smCRHGEFq27T+hqWiNyQ1Q1HdQ==
X-Google-Smtp-Source: AGHT+IEgweQ31mTmzYn5tz13S37h4OM2j/39kLzlIhlEY+9JtccGfECenZXd4Vr/O04ex+Au/odt3Q==
X-Received: by 2002:a05:600c:3b23:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-43668b5e194mr425127095e9.25.1736160259588;
        Mon, 06 Jan 2025 02:44:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436723cb159sm512136895e9.16.2025.01.06.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:44:19 -0800 (PST)
Date: Mon, 6 Jan 2025 13:44:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/for-next 1/15] kernel/trace/trace.c:6111
 tracing_set_tracer() error: uninitialized symbol 'ret'.
Message-ID: <765f3908-f36c-43ae-bb3e-7693e3a823fb@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   cff6d93eab00bacf8b6bffdef775fc2de0273c96
commit: d33b10c0c73adca00f72bf4a153a07b7f5f34715 [1/15] tracing: Switch trace.c code over to use guard()
config: x86_64-randconfig-161-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271654.nJVBuwmF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412271654.nJVBuwmF-lkp@intel.com/

smatch warnings:
kernel/trace/trace.c:6111 tracing_set_tracer() error: uninitialized symbol 'ret'.

vim +/ret +6111 kernel/trace/trace.c

9c5b9d3d65e485 Masami Hiramatsu         2020-01-11  6073  int tracing_set_tracer(struct trace_array *tr, const char *buf)
09d23a1d8a82e8 Steven Rostedt (Red Hat  2015-02-03  6074) {
bc0c38d139ec7f Steven Rostedt           2008-05-12  6075  	struct tracer *t;
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  6076) #ifdef CONFIG_TRACER_MAX_TRACE
34600f0e9c33c9 Steven Rostedt           2013-01-22  6077  	bool had_max_tr;
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  6078) #endif
d33b10c0c73adc Steven Rostedt           2024-12-24  6079  	int ret;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6080  
d33b10c0c73adc Steven Rostedt           2024-12-24  6081  	guard(mutex)(&trace_types_lock);
1027fcb206a0fb Steven Rostedt           2009-03-12  6082  
7a1d1e4b9639ff Steven Rostedt (Google   2024-06-12  6083) 	update_last_data(tr);
7a1d1e4b9639ff Steven Rostedt (Google   2024-06-12  6084) 
a1f157c7a3bb34 Zheng Yejian             2023-09-06  6085  	if (!tr->ring_buffer_expanded) {
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6086  		ret = __tracing_resize_ring_buffer(tr, trace_buf_size,
438ced1720b584 Vaibhav Nagarnaik        2012-02-02  6087  						RING_BUFFER_ALL_CPUS);
73c5162aa362a5 Steven Rostedt           2009-03-11  6088  		if (ret < 0)
d33b10c0c73adc Steven Rostedt           2024-12-24  6089  			return ret;
73c5162aa362a5 Steven Rostedt           2009-03-11  6090  		ret = 0;
73c5162aa362a5 Steven Rostedt           2009-03-11  6091  	}

ret not initialized on else path

73c5162aa362a5 Steven Rostedt           2009-03-11  6092  
bc0c38d139ec7f Steven Rostedt           2008-05-12  6093  	for (t = trace_types; t; t = t->next) {
bc0c38d139ec7f Steven Rostedt           2008-05-12  6094  		if (strcmp(t->name, buf) == 0)
bc0c38d139ec7f Steven Rostedt           2008-05-12  6095  			break;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6096  	}
d33b10c0c73adc Steven Rostedt           2024-12-24  6097  	if (!t)
d33b10c0c73adc Steven Rostedt           2024-12-24  6098  		return -EINVAL;
d33b10c0c73adc Steven Rostedt           2024-12-24  6099  
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6100  	if (t == tr->current_trace)
d33b10c0c73adc Steven Rostedt           2024-12-24  6101  		return 0;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6102  
a35873a0993b4d Tom Zanussi              2019-02-13  6103  #ifdef CONFIG_TRACER_SNAPSHOT
a35873a0993b4d Tom Zanussi              2019-02-13  6104  	if (t->use_max_tr) {
c0a581d7126c0b Waiman Long              2022-09-22  6105  		local_irq_disable();
a35873a0993b4d Tom Zanussi              2019-02-13  6106  		arch_spin_lock(&tr->max_lock);
a35873a0993b4d Tom Zanussi              2019-02-13  6107  		if (tr->cond_snapshot)
a35873a0993b4d Tom Zanussi              2019-02-13  6108  			ret = -EBUSY;
a35873a0993b4d Tom Zanussi              2019-02-13  6109  		arch_spin_unlock(&tr->max_lock);
c0a581d7126c0b Waiman Long              2022-09-22  6110  		local_irq_enable();
a35873a0993b4d Tom Zanussi              2019-02-13 @6111  		if (ret)

Potentially uninitialized

d33b10c0c73adc Steven Rostedt           2024-12-24  6112  			return ret;
a35873a0993b4d Tom Zanussi              2019-02-13  6113  	}
a35873a0993b4d Tom Zanussi              2019-02-13  6114  #endif
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6115) 	/* Some tracers won't work on kernel command line */
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6116) 	if (system_state < SYSTEM_RUNNING && t->noboot) {
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6117) 		pr_warn("Tracer '%s' is not allowed on command line, ignored\n",
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6118) 			t->name);
d33b10c0c73adc Steven Rostedt           2024-12-24  6119  		return 0;
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6120) 	}
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6121) 
607e2ea167e56d Steven Rostedt (Red Hat  2013-11-06  6122) 	/* Some tracers are only allowed for the top level buffer */
d33b10c0c73adc Steven Rostedt           2024-12-24  6123  	if (!trace_ok_for_array(t, tr))
d33b10c0c73adc Steven Rostedt           2024-12-24  6124  		return -EINVAL;
607e2ea167e56d Steven Rostedt (Red Hat  2013-11-06  6125) 
cf6ab6d9143b15 Steven Rostedt (Red Hat  2014-12-15  6126) 	/* If trace pipe files are being read, we can't change the tracer */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

