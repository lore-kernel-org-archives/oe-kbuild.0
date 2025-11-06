Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA31346783
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Nov 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440869; cv=none; b=lgVq3KgnGBcBLz8ZiVrrnRCOx53hgzhGi5XvRfBqJ5jMkEsCMzC3PIsHFGKPszMMQHhkoxKKZehN8/tpTE/6Se9krjlTHisqWEp56vLvTT+jREhjfxjJzqRfZp9WVhzH9jtTiyaBhbPZdlxP3FyLnNdzDart59NzFzothhTn37o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440869; c=relaxed/simple;
	bh=o+/PQFG3orNQPH2Wmqzbip5DQ+AWN7J8e8scPBdzoHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIe170hvyph2Fe7dRK9OLHP0RahgrfDxtZkIyxT44Ywvos/n4fwxd8t7QXYImRnipoJsXhuIEsNQ4Ig7U50MArcrksdXilvCubLn0lMqEmliz9Pgl9EwPG9PUDmbBwlCiDkF60GrM67guZAND7tvX/3/dL3gbEb1YFn9F8oQu8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cx+XLsuX; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cx+XLsuX"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e9d633b78so181186366b.1
        for <oe-kbuild@lists.linux.dev>; Thu, 06 Nov 2025 06:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762440865; x=1763045665; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MC4EJk+crq3INwyh+anBHhYJkKhseB8yhr9wZcX7VEo=;
        b=cx+XLsuXbkW1/GYZrzx+3Rvr+RmUJoSbfk/O8TmrqWvoospYjjkLpGe7jtygLQBhEP
         Gnv7dJT/BwTSJ/9VP9uwpTQK6PMiRfYvFSwGDrsIFelI0/tTpJ+R0l6bcus23WF1sB9z
         YgsN94JCMxhMqWHfiM6/SHLiZhaUVVOdG0TdvzRY6Gb3auxzDWmWCKqk0ZPdVPy7QhwO
         rPc5G+ZxvI1JLruk36rRAt2sLRVm8t+KsirG1so66hqW+1N1Ja4wS/EcYWb8PyeGbTst
         nSRAwVs4Dg4YWqozk02Xq0NeTNIlTj/dIjaPPb2vYg7++zeq/3fQfEPwPBpZJe+1qaT1
         f4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440865; x=1763045665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MC4EJk+crq3INwyh+anBHhYJkKhseB8yhr9wZcX7VEo=;
        b=YqqAItuvgK+b8hgIjE5OFPo+PvTdRAbL4jViPxIhppszR3iS1ZVe6ppEfGEzHPKbVt
         wMNOJm+NEQ9bBOhyjFeRZdOwJbcG9JyJzvJmGHSvw3jq1bde4EgC/4gbDbuVy9PBYa3J
         5ZAsYG/mb7zmu2FbagpXKMcUINNPWbL4YooVoS1SeKuAo49GQMWqlBOECqL5iHO2TWJx
         QtuDY0F4Pu3YIPdvBO3ybt8fJ9UG3kX87GiMXKemuocx/aASDqVXR1hBh7IuYNE+5swz
         Yyi3CPWnXIulCXwxWeosb0r6vTEcqq5DxRM2tMXu8HXodHAfyVSK/orzS58lvFSAWmMP
         Tdfw==
X-Gm-Message-State: AOJu0YzlLbOFQtwKNddUfUBxskem/1YElEXQVAQ/mlPDy1Z6DqlaAT6C
	UfSHHKjspvUIJr3UJv4as3wfmHRfg+MwFrB8QcbA7WYaLe0/BU0L2P1XBCDO9fuAnVF4BC+MSMw
	0LB3s
X-Gm-Gg: ASbGncuhOuqoLehSHqZVWgpICKZAoSrPhJAFBTY7i6WxZ6w0o/NYaJK82zkqwzHsU/H
	cWRLI4a8iOinQbBrG4xT1FU+KU0L7rboJ5WXayRxgQBSBQm5vxJoLnNLU9hV2Nci0mOwbVptxso
	ANUT39L81ou26FZwpoVgUrBcxKONGsmzRFfD1X+BFxTESIG9mY8zPeUDE5WuHIi8njtVi2sJUqJ
	8DF26437h6Jb1GCR2a2kDymZJb1OEIRN7MXObrTzcBgE5w92PMdHXuMsEBkLDdH5yrvZtuhe4+f
	0ih2lgnIfjelsLXw68ZHdNdtHR40zHUIphFTSzccEi5t4ApcleCbt5CY7VlY8bwGu29aLY1byca
	cE1CbZAj7V2bL4IeMHpnMIs12DAQh84QReZgDzx15Xzs2r95Y1alU6rYVasxcLysn/gFblMdLXa
	GF7gpAGxWK7/AG
X-Google-Smtp-Source: AGHT+IGsGkbjm4cQhd58PPhX8sj6kHaV3UG6B6SZQr32M8vl46qcUsdwyT7k6jVd0sZpwEdnmU+gdA==
X-Received: by 2002:a17:907:7f14:b0:b72:7a86:e497 with SMTP id a640c23a62f3a-b72892ac754mr401480466b.5.1762440865437;
        Thu, 06 Nov 2025 06:54:25 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72896c814esm227285166b.68.2025.11.06.06.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:54:25 -0800 (PST)
Date: Thu, 6 Nov 2025 17:54:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v2 39/58]
 drivers/firmware/riscv/riscv_sbi_sse.c:717 sse_ghes_handler() error: we
 previously assumed 'cb' could be null (see line 718)
Message-ID: <ad9d6bc3-9b91-443d-8799-4709a961b5b5@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v2
head:   41e2962102e2318916f87f0ed7eb297a6b3224d3
commit: 7a78f3d24d5d385aad5e5540aab849569f2335cd [39/58] riscv: Add functions to register ghes having SSE notification
config: riscv-randconfig-r071-20251103 (https://download.01.org/0day-ci/archive/20251104/202511041114.4M7JPo19-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511041114.4M7JPo19-lkp@intel.com/

New smatch warnings:
drivers/firmware/riscv/riscv_sbi_sse.c:717 sse_ghes_handler() error: we previously assumed 'cb' could be null (see line 718)

vim +/cb +717 drivers/firmware/riscv/riscv_sbi_sse.c

7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  712  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  713  {
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  714  	struct sse_ghes_event_data *ev_data = arg;
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  715  	struct sse_ghes_callback *cb = NULL;
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  716  
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29 @717  	list_for_each_entry(cb, &ev_data->callback_list, head) {
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29 @718  		if (cb && cb->ghes && cb->callback) {
                                                                    ^^
This NULL check should be deleted.  List iterators cannot be NULL.

7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  719  			cb->callback(ev_data->event_num, cb->ghes, regs);
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  720  		}
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  721  	}
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  722  
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  723  	return 0;
7a78f3d24d5d38 Himanshu Chauhan 2025-10-29  724  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

