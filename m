Received: from out28-97.mail.aliyun.com (out28-97.mail.aliyun.com [115.124.28.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11755381AF;
	Mon, 19 Jan 2026 06:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768803397; cv=none; b=l/AzRM7qELLb6Ozf1Oa8EvJZ2XblGywgWgpLuL0p/D9HgeXJNzfhi//L9jJYVV6zdyxtMY9tsLzWzshQDZnYnLGE89ml/CzUpPUlXCWRKrEkyGbEn03gkM9tMviutbs3FIw+pMI/9gD5ChvZ0rx63r4xkPkIntoyscFswOj/Gbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768803397; c=relaxed/simple;
	bh=fUuddy/eqLnLSjrqaMq1bsbg8liqO0R3T9K+Nc0lYuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLejCWPLiQrPqOHGi7CPQ3iHZLhZK1GhnYt25MKfyiziGvNpqSj4PvBkuwU66vrAiBxvk+hqxCv3ztwjpb5ytR8Qu0nvASjrNJvYZAIj73px2QVwGJvseZ1fmzb/xBaWZK8jbfDOzlKqzbYDERRt3GTKCPVHV9seJAnSoJh35eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn; spf=pass smtp.mailfrom=bosc.ac.cn; arc=none smtp.client-ip=115.124.28.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bosc.ac.cn
Received: from 172.38.31.119(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.gA-B0Ov_1768803381 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 19 Jan 2026 14:16:22 +0800
Message-ID: <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>
Date: Mon, 19 Jan 2026 14:16:21 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] uio: Add SVA support for PCI devices via
 uio_pci_generic_sva.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@linaro.org, oe-kbuild@lists.linux.dev, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
References: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
 <2026011643-coastline-playtime-0ac5@gregkh>
 <2026011603-dorsal-unblessed-cdb2@gregkh>
From: yaxing guo <guoyaxing@bosc.ac.cn>
In-Reply-To: <2026011603-dorsal-unblessed-cdb2@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/1/16 23:16, Greg KH 写道:
> On Fri, Jan 16, 2026 at 04:15:17PM +0100, Greg KH wrote:
>> On Tue, Dec 23, 2025 at 12:54:09PM +0800, Yaxing Guo wrote:
>>> This patch introduces a new UIO driver, uio_pci_generic_sva, which
>>> extends the functionality of uio_pci_generic by adding support for
>>> Shared Virtual Addressing (SVA) when IOMMU is enabled in the system.
>>>
>>> The key enhancement allows PCI devices to directly use user-space virtual
>>> addresses for DMA operations, eliminating the need for bounce buffers or
>>> explicit IOVA mapping. This is achieved by leveraging the kernel's IOMMU-SVA
>>> subsystem, including process address space attachment, page fault handling,
>>> and shared context management between CPU and device.
>>>
>>> With this driver, userspace applications can perform zero-copy DMA using
>>> native pointers:
>>>
>>>     void *addr = malloc(N);
>>>     set_dma_addr((uint64_t)addr);  // Passing user VA directly
>>>     start_dma();
>>>
>>> The device can now access 'addr' through the IOMMU's PASID-based translation,
>>> provided that the underlying IOMMU hardware (e.g., Intel VT-d 3.1+, AMD-Vi,
>>> ARM SMMU, RISCV IOMMU) and platform support SVA.
>>>
>>> Dependencies:
>>> - CONFIG_IOMMU_SVA must be enabled.
>>> - The platform must support PRI (Page Request Interface) and PASID.
>>> - Device drivers/userspace must handle page faults if demand-paging is used.
>>>
>>> The implementation reuses core logic from uio_pci_generic.c while adding
>>> PASID setting, and integration with the IOMMU SVA APIs.
>>>
>>> Also, add a read-only sysfs attribute 'pasid' to expose the Process Address
>>> Space ID assigned by IOMMU driver when binding an SVA-enabled device.
>>> For details, refer to the ABI documentation for uio_pci_sva driver sysfs attribute
>>> (Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid).
>>>
>>> Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
>>> ---
>>> Changes in v4:
>>>   -- Fix the errors about 'udev' could be null and double free that
>>>      reported by: kernel test robot <lkp@intel.com> and Dan Carpenter <dan.carpenter@linaro.org>
>>>      error report: https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/
>>
>> Where is the changes from previous versions?
>>
>>> +++ b/Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid
>>> @@ -0,0 +1,29 @@
>>> +What:		/sys/bus/pci/drivers/uio_pci_sva/<pci_dev>/pasid
>>> +Date:		September 2025
>>
>> It's not September anymore :)
>>
>>> +module_pci_driver(uio_pci_generic_sva_driver);
>>> +MODULE_VERSION("0.0.01");
>>
>> No need for a module version.
>>
>> Ah, these are all just minor things, let me go queue this up now, can
>> you send a follow-on patch to make these 2 changes?
> 
> Wait, I already took this a while ago, why was this resent?
> 
After the v3 patch submission, I received error reports from Dan 
Carpenter dan.carpenter@linaro.org and the kernel test robot 
lkp@intel.com (see: 
https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/).
In response, I’ve submitted a new version (v4) of the same patch, which 
primarily addresses the issues highlighted in that report (as described 
in the "changes in v4" section of the cover letter).
If there’s anything improper in this process—such as resubmitting 
instead of replying with fixes or other procedural concerns—please let 
me know, and I’ll be happy to correct it accordingly.
Thank you for your guidance!
> confused,
> 
> greg k-h

