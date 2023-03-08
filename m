Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AAC79F0;
	Wed,  8 Mar 2023 16:37:02 +0000 (UTC)
Received: from mail.ispras.ru (unknown [83.149.199.84])
	by mail.ispras.ru (Postfix) with ESMTPSA id 3BD2C40737CA;
	Wed,  8 Mar 2023 16:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 3BD2C40737CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1678293019;
	bh=XJKh/p1kSUE3LVFYIVycWpl1C//df/YgD/SzFuBsZ3k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VsB/TyeAfdEx43Qc8GtkoTdBhP2VzD7whpD8GQn3JDsIEggI5CKVBSyJSC7Ep7Itq
	 ivuVDYW4MOkwSm2ctzBMeBoEBHjjkUZ1JVdXpz2r5ZI2urv17XcMIWkhscBpOALeK6
	 +VEWiiWaL1d84tG4+LY2yawjmzmS61Al9ea98rOE=
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 08 Mar 2023 19:30:19 +0300
From: Evgeniy Baskov <baskov@ispras.ru>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [ardb:efi-x86-nx 10/24] drivers/firmware/efi/libstub/mem.c:170
 efi_adjust_memory_range_protection() error: uninitialized symbol
 'rounded_start'.
In-Reply-To: <8e0bd257-dad0-47e2-8e30-916f9042c77d@kili.mountain>
References: <8e0bd257-dad0-47e2-8e30-916f9042c77d@kili.mountain>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <9c94967d7afa4a1898f8765cb8d14fd8@ispras.ru>
X-Sender: baskov@ispras.ru
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-03-08 19:21, Dan Carpenter wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git 
> efi-x86-nx
> head:   8171142f3e4c96f6be75a6195de59d1607f1bd4b
> commit: 6b4ae58e7147165ec019e3899a5d4d14e0396110 [10/24] efi/libstub:
> Move helper function to related file
> config: loongarch-randconfig-m041-20230305
> (https://download.01.org/0day-ci/archive/20230309/202303090050.RhPPJRPD-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202303090050.RhPPJRPD-lkp@intel.com/
> 
> smatch warnings:
> drivers/firmware/efi/libstub/mem.c:170
> efi_adjust_memory_range_protection() error: uninitialized symbol
> 'rounded_start'.
> drivers/firmware/efi/libstub/mem.c:170
> efi_adjust_memory_range_protection() error: uninitialized symbol
> 'rounded_end'.
> 
> vim +/rounded_start +170 drivers/firmware/efi/libstub/mem.c
> 
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  143  efi_status_t
> efi_adjust_memory_range_protection(unsigned long start,
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  144  						unsigned long 
> size,
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  145  						unsigned long 
> attributes)
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  146  {
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  147  	efi_status_t status;
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  148
> 	efi_gcd_memory_space_desc_t desc;
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  149  	efi_physical_addr_t 
> end, next;
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  150  	efi_physical_addr_t
> rounded_start, rounded_end;
> 
> ^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  151  	efi_physical_addr_t
> unprotect_start, unprotect_size;
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  152
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  153  	if (efi_dxe_table == 
> NULL)
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  154  		return 
> EFI_UNSUPPORTED;
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  155
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  156  	/*
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  157  	 * This function
> should not be used to modify attributes
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  158  	 * other than
> writable/executable.
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  159  	 */
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  160
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  161  	if ((attributes &
> ~(EFI_MEMORY_RO | EFI_MEMORY_XP)) != 0)
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  162  		return 
> EFI_INVALID_PARAMETER;
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  163
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  164  	/*
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  165  	 * Disallow
> simultaniously executable and writable memory
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  166  	 * to inforce W^X
> policy if direct extraction code is enabled.
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  167  	 */
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  168
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25  169  	if ((attributes &
> (EFI_MEMORY_RO | EFI_MEMORY_XP)) == 0) {
> 6b4ae58e714716 Evgeniy Baskov 2022-10-25 @170  		efi_warn("W^X
> violation at [%08lx,%08lx]\n",
> 
> Presumably this prints rounded_start and rounded_end.

Yes, thank you!
I will move the initialization of rounded_start/rounded_end
a few lines higher and that will be enough.

Thanks,
Evgeniy Baskov
