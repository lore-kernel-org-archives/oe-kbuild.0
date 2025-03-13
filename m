Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4628F1F0E5C;
	Thu, 13 Mar 2025 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741890927; cv=none; b=L6TZ/nypAxU9cw/wBd3cPVRxVmC/I7KiWu2Klj8VeizCCn25wh2m0Vel6dWxeN5Gs4B5ZaGIAqFRrkzb/mb158ezTg7DTL+20Y8brZtdRAECg4RK7kX3LPIMNodIJf5cXBsKia+Gt5rppMgqO7Hry3gHkCMFs8NA4rLi7yNgmsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741890927; c=relaxed/simple;
	bh=nbOvgBh0jcDI3V6QjtI0zbK4uC/YEsPGJkhXblvDu5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPsW2hhe60n3GALV8rive+Ko/J3mOBWTs0edSIkFSfT0/e7IfFU2laQjIVOmv5ycdPjJ8JzIuq9vAwtdXOD6mbX3CRw0mfoCVNdufUtgXTIA+JS0DEWZp55hf+p4z87ACFXNF2jDY9IjbHNrFQz1DsHu99OA8gAJAf3JuvNSpT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=UOJ9ZOaT; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="UOJ9ZOaT"
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id CD97C203342B;
	Thu, 13 Mar 2025 11:35:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CD97C203342B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741890920;
	bh=tNqJX/qEaOMydES5c/dNox4XEByona5+1N1jSjRC9OI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UOJ9ZOaTezeQyFtNXBX+62pQzoScifC62wedW6h0Ny71PmkqPoEqkCFrLjam/1h51
	 BHC3yOLS02Yj2l5z0EZ5xQLDZ4B8ylwU5dkPF7IWuMljiw+wabVr1xLGmBW8y+0BvH
	 ZLniDlIMbEJhIBMa8BjCQoZzOxHCdiwtlIICg0iI=
Message-ID: <cfb17505-fb4a-42c4-91cf-de636a8efa87@linux.microsoft.com>
Date: Thu, 13 Mar 2025 11:35:19 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ
 number from DeviceTree
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com,
 conor+dt@kernel.org, dave.hansen@linux.intel.com, decui@microsoft.com,
 haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
 krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com, lenb@kernel.org,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
 mark.rutland@arm.com, maz@kernel.org, mingo@redhat.com,
 oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
 ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
 tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org,
 yuzenghui@huawei.com, devicetree@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <1283ab3a-a66b-4fe2-9ba4-8d5972daa89b@stanley.mountain>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <1283ab3a-a66b-4fe2-9ba4-8d5972daa89b@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/2025 11:31 AM, Dan Carpenter wrote:
> Hi Roman,

Hi Dan,

Appreciate helping with that very much!

-- 
Thank you,
Roman

> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arm64-kvm-smccc-Introduce-and-use-API-for-detectting-hypervisor-presence/20250308-060639
> base:   3a7f7785eae7cf012af128ca9e383c91e4955354
> patch link:    https://lore.kernel.org/r/20250307220304.247725-9-romank%40linux.microsoft.com
> patch subject: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ number from DeviceTree
> config: arm64-randconfig-r071-20250312 (https://download.01.org/0day-ci/archive/20250313/202503132345.uKNehsnm-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202503132345.uKNehsnm-lkp@intel.com/
> 
> smatch warnings:
> drivers/hv/vmbus_drv.c:2355 vmbus_set_irq() warn: platform_get_irq() does not return zero
> 
> vim +2355 drivers/hv/vmbus_drv.c
> 
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2348  static int __maybe_unused vmbus_set_irq(struct platform_device *pdev)
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2349  {
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2350  	struct irq_data *data;
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2351  	int irq;
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2352  	irq_hw_number_t hwirq;
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2353
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2354  	irq = platform_get_irq(pdev, 0);
> 2e494cbd89c51d1 Roman Kisel    2025-03-07 @2355  	if (irq == 0) {
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2356  		pr_err("VMBus interrupt mapping failure\n");
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2357  		return -EINVAL;
> 
> You can delete this if statement.  It's dead code.  See the comment
> next to platform_get_irq().  I wrote a blog about the history of
> this:
> https://staticthinking.wordpress.com/2023/08/07/writing-a-check-for-zero-irq-error-codes/
> 
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2358  	}
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2359  	if (irq < 0) {
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2360  		pr_err("VMBus interrupt data can't be read from DeviceTree, error %d\n", irq);
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2361  		return irq;
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2362  	}
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2363
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2364  	data = irq_get_irq_data(irq);
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2365  	if (!data) {
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2366  		pr_err("No interrupt data for VMBus virq %d\n", irq);
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2367  		return -ENODEV;
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2368  	}
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2369  	hwirq = irqd_to_hwirq(data);
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2370
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2371  	vmbus_irq = irq;
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2372  	vmbus_interrupt = hwirq;
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2373  	pr_debug("VMBus virq %d, hwirq %d\n", vmbus_irq, vmbus_interrupt);
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2374
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2375  	return 0;
> 2e494cbd89c51d1 Roman Kisel    2025-03-07  2376  }
> 
