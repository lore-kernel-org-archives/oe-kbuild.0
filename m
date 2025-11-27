Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC202FDC35
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764267004; cv=none; b=V/zPjcKiWDhUhWWxOZ9nRKRaFe7jt/Y6nA9s1O34G8FctaPxJP3lweTD8+K2fmY1ZWrwdeXA+K00A7LovYGSe133+8kxGj+QKPn93j3u4zGgTzhk1Q7z42z7BawM9TBkYoHYyQlVNQHO/hXbXfUQ1t+WmyT+JObID5rwXhjI5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764267004; c=relaxed/simple;
	bh=mjIImdNaHtUFvvXlOK6pE8V72hbYBHg+Voc9qEUtsbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VnD36JSXpxMGrBQzBjbzLcXKw5t8Q9AlFU1X2YHXPh2mWRGfkzY9G+8sxpVEpVIuQKySDA/7IiNBzk56z6+yNKimbzkL+JVYKUHEUXztDyzTxfrE5wgZRQnkStosygahZ8jJ4ImproPgRqDC6d9d0IR08P6/KHoAQ5X/5B+UGMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qokUrdTY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qokUrdTY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso735313f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 10:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764266999; x=1764871799; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dx7dLWF3fYt4YAydLoSYihtQG3rPcHN7URxJi8Fj67U=;
        b=qokUrdTYH7oERe5M6fcQoWAt2XdOqAt6iBVxHGjlJ8a5Ude6J64AOa2gofkdaKxRtd
         8YTOXnYRrNp0R9NNmL8HjBs4STmiTqbMPyR15rTJjIzg/IbTtvQ0tLXJUuElglury/LR
         Od1vgFOZpqpdv+CzQEs8gspIVPL+ue7zNRxtIJgtAxpWTPZ5n91bsXj44QRmIc8pOOxk
         IaI+zbGbC8B/sizZXDil32kDU3pbqNgrg0xcSfoANQC5nE7mlGJxmoDKnKgp+uhVppwI
         qi0nm6nnDRAYuDzFCib6VMIbfIRTXtmswfW8Xp8Cc2eUVjuCtW6MlMnvkRm4zE3zX0za
         Wu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266999; x=1764871799;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx7dLWF3fYt4YAydLoSYihtQG3rPcHN7URxJi8Fj67U=;
        b=HcZqgawB4ELKViga0L/6snWb7muAAJwU2veYgHWdPhphbt7rc1keh37y0ZJKWMzoWA
         eq/crZFwIl3bxzBHgN8KaqD+bCJT0bai00/OeBGrSfDB5ZHlaX9ceG8ph4KsRUybPUcl
         2HteP5asSrHiG70GmwzMvrobAW1y99RxpFIZ5OMpSxSdPFjIDhpQuP56LWMELVqptPaB
         Ue2EXRseSYhQQKFdUxhemQJGdlHo2qdMMq6yuvjH3Gc/qeQJxnxgFpHCZEemvgW0r2PW
         CGqLrbzDkZ3d34V1F3EfxzbtfKRDXHLYMPPF+EJ2E5gA9dJdbv8QSVU4eY/HJhVA9epI
         XiVg==
X-Gm-Message-State: AOJu0Yxc+8gC4JEnuXwlNavqRM/CPFnMzVjPL7LZD3gYbuqe0GYslNhx
	nrU9Bj4lfdQRto34iuUBnelq+AXlLqpUycV+K11HyfWxvyp44bL5bD81mPaYFLQRaQw41miduZS
	8D/Bo
X-Gm-Gg: ASbGncuStK8XklsfFHO0wyHdG5wGXjqQuOozzTnKPlrerprEQdY1gkueEL2xSjsulEF
	2BdEZusfIBx3ls3P9ODWn3J9lMMl3rcQ2OSyks2LuMQle82YcR0rF3a99NhlhyXROSjXnG9pugq
	fxYUkAjZl29OPcjFNQJd8xogzYZBnn06G8b1nH6ohaCYtV216toPRqwBpeEtZ5NVPz5iwHyMpOB
	QAd0act89GMVwjsh8jwfW9YmPoS16XJIWTWkBU56+I7viyUHryNEi0cXhAYu6tG9AV4+xAz1Idc
	D0SZT2LvL0B1OQVkrYN1dCMRDhoctcgPZ1Ow0b12siz0ZYQJosrKByrWNynl9INPDgTOT/Kj0xV
	+l2HLJ3ScwSc67q+EfPzmO3g41stR078G0BC+Tx5b2e5GWpNPzDn07WTCh/3o0oZyKzYt65izhC
	ZbUL39kSX+lNyXdjgR
X-Google-Smtp-Source: AGHT+IFj2t3yKW6pPDsFDhEyOjjtQDUGWqwY1Td1Uo8FE8nnLGME1TAIOSoCs2nLoFBFrgBCNM5nDQ==
X-Received: by 2002:a05:6000:208a:b0:42b:3bd2:b2f8 with SMTP id ffacd0b85a97d-42cc1d3543dmr25867134f8f.46.1764266999388;
        Thu, 27 Nov 2025 10:09:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5e3857sm5371663f8f.19.2025.11.27.10.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 10:09:58 -0800 (PST)
Date: Thu, 27 Nov 2025 21:09:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Huisong Li <lihuisong@huawei.com>,
	rafael@kernel.org, lenb@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep.Holla@arm.com, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com, yubowen8@huawei.com, lihuisong@huawei.com
Subject: Re: [PATCH 3/3] ACPI: processor: idle: Update idle states from
 avaiable power information
Message-ID: <202511272353.nOqEau6n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125072933.3706006-4-lihuisong@huawei.com>
Message-ID: <20251127180954.NbMX-x_SbBJ2fo42Qssl_npRx7m3HpNr1GHfADZJK7c@z>

Hi Huisong,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huisong-Li/cpuidle-Add-enable_cpuidle-interface/20251125-153615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251125072933.3706006-4-lihuisong%40huawei.com
patch subject: [PATCH 3/3] ACPI: processor: idle: Update idle states from avaiable power information
config: i386-randconfig-141-20251126 (https://download.01.org/0day-ci/archive/20251127/202511272353.nOqEau6n-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511272353.nOqEau6n-lkp@intel.com/

smatch warnings:
drivers/acpi/processor_idle.c:1339 acpi_processor_power_state_has_changed() error: we previously assumed '_pr' could be null (see line 1339)

vim +/_pr +1339 drivers/acpi/processor_idle.c

a36a7fecfe6071 Sudeep Holla              2016-07-21  1294  int acpi_processor_power_state_has_changed(struct acpi_processor *pr)
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1295  {
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1296  	int cpu;
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1297  	struct acpi_processor *_pr;
3d339dcbb56d8d Daniel Lezcano            2012-09-17  1298  	struct cpuidle_device *dev;
ffff9603ddf90a Huisong Li                2025-11-25  1299  	int ret = 0;
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1300  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1301  	if (disabled_by_idle_boot_param())
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1302  		return 0;
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1303  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1304  	if (!pr->flags.power_setup_done)
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1305  		return -ENODEV;
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1306  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1307  	/*
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1308  	 * FIXME:  Design the ACPI notification to make it once per
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1309  	 * system instead of once per-cpu.  This condition is a hack
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1310  	 * to make the code that updates C-States be called once.
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1311  	 */
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1312  
9505626d7bfeb5 Paul E. McKenney          2012-02-28  1313  	if (pr->id == 0 && cpuidle_get_driver() == &acpi_idle_driver) {
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1314  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1315  		/* Protect against cpu-hotplug */
95ac706744de78 Sebastian Andrzej Siewior 2021-08-03  1316  		cpus_read_lock();
6726655dfdd2dc Jiri Kosina               2014-09-03  1317  		cpuidle_pause_and_lock();
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1318  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1319  		/* Disable all cpuidle devices */
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1320  		for_each_online_cpu(cpu) {
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1321  			_pr = per_cpu(processors, cpu);
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1322  			if (!_pr || !_pr->flags.power_setup_done)
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1323  				continue;
3d339dcbb56d8d Daniel Lezcano            2012-09-17  1324  			dev = per_cpu(acpi_cpuidle_device, cpu);
3d339dcbb56d8d Daniel Lezcano            2012-09-17  1325  			cpuidle_disable_device(dev);
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1326  		}
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1327  
ffff9603ddf90a Huisong Li                2025-11-25  1328  		/*
ffff9603ddf90a Huisong Li                2025-11-25  1329  		 * Update C-state information based on new power information.
ffff9603ddf90a Huisong Li                2025-11-25  1330  		 *
ffff9603ddf90a Huisong Li                2025-11-25  1331  		 * The same idle state is used for all CPUs.
ffff9603ddf90a Huisong Li                2025-11-25  1332  		 * The old idle state may not be usable anymore if fail to get
092a52b5417fd4 Huisong Li                2025-11-25  1333  		 * available ACPI power information from any online CPU.
ffff9603ddf90a Huisong Li                2025-11-25  1334  		 * The cpuidle of all CPUs should be disabled.
ffff9603ddf90a Huisong Li                2025-11-25  1335  		 */
092a52b5417fd4 Huisong Li                2025-11-25  1336  		ret = -ENODEV;
092a52b5417fd4 Huisong Li                2025-11-25  1337  		for_each_online_cpu(cpu) {
092a52b5417fd4 Huisong Li                2025-11-25  1338  			_pr = per_cpu(processors, cpu);
092a52b5417fd4 Huisong Li                2025-11-25 @1339  			if (!_pr && !_pr->flags.power_setup_done)
                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
if _pr is NULL this will crash.  s/&&/||/

092a52b5417fd4 Huisong Li                2025-11-25  1340  				continue;
092a52b5417fd4 Huisong Li                2025-11-25  1341  			ret = acpi_processor_get_power_info(_pr);
092a52b5417fd4 Huisong Li                2025-11-25  1342  			if (!ret) {
092a52b5417fd4 Huisong Li                2025-11-25  1343  				acpi_processor_setup_cpuidle_states(_pr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

