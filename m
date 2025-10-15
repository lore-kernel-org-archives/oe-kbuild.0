Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF84A08;
	Wed, 15 Oct 2025 02:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496613; cv=none; b=isaKFq5U7Fi6a0r5QJI/omwy8gn2NRfCXgfhNH0kIIKlvOi2faMNBPdEcP1yeYxYaD4VP3oNhpveOD7xZNgWNQzGMSScas2hY0ZqhZrr8hK70dQIPaJVS61sB1XyMPvw8v700j1i3q6qaPfZjBedMnpR9XnvMcXcuzqR7ILM7OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496613; c=relaxed/simple;
	bh=uZ09AO8FUvS3PHoAN1UIg/EUNrO9xZYhQBj5B5JO7Dc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tuf43eBXPRXYFUrVDqYxNYSuR8aVCZHURaS4LJBRZUQaghbXEk0M4B7ynAJRtDFaoNbWifd0O3xC1Yu/QPp5b33yoIqfoHAfqSPG/qtsptrts/m2DelRwZmX2pa8arwHM8zYDjrqtDjMfJnlScZRJw5rhB/n0287vto/996lSrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0nlJ95+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0nlJ95+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4887CC4CEE7;
	Wed, 15 Oct 2025 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1760496610;
	bh=uZ09AO8FUvS3PHoAN1UIg/EUNrO9xZYhQBj5B5JO7Dc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0nlJ95+Bhw11gF5P6sHbaL3cDIndYHosNII1BXzisn4R0MTRea/CVyK4kVoIPqEaC
	 rSdFH7sBssAq0yh7mRrT041p8MIe7D6d5Fg+2s1zfBHsCznRIrVXYaWSwhv2gQwq/s
	 GYBJCOOVzs/IgvlK3xIdVO1FE74FGqRnXDFnMnxk=
Date: Tue, 14 Oct 2025 19:50:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Pasha Tatashin <pasha.tatashin@soleen.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 13427/13588]
 kernel/liveupdate/kexec_handover.c:978 kho_preserve_vmalloc() warn: missing
 error code 'err'
Message-Id: <20251014195009.9505434cfdcc136503f08df1@linux-foundation.org>
In-Reply-To: <202510100941.GZGMq64U-lkp@intel.com>
References: <202510100941.GZGMq64U-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Oct 2025 11:15:56 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0b2f041c47acb45db82b4e847af6e17eb66cd32d
> commit: f13bb574707674d1113a40e0b6dc4d9a143d2ec1 [13427/13588] liveupdate: kho: move to kernel/liveupdate
> config: x86_64-randconfig-161-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100941.GZGMq64U-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202510100941.GZGMq64U-lkp@intel.com/
> 
> smatch warnings:
> kernel/liveupdate/kexec_handover.c:978 kho_preserve_vmalloc() warn: missing error code 'err'
> 
> vim +/err +978 kernel/liveupdate/kexec_handover.c
> 
> ...
>
> a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  975) 		if (idx == ARRAY_SIZE(chunk->phys)) {
> a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  976) 			chunk = new_vmalloc_chunk(chunk);
> a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  977) 			if (!chunk)
> a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21 @978) 				goto err_free;
> 
> err = -ENOMEM;
> 
> a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  979) 			idx = 0;

Thanks, I'll add this:

--- a/kernel/liveupdate/kexec_handover.c~liveupdate-kho-move-to-kernel-liveupdate-fix
+++ a/kernel/liveupdate/kexec_handover.c
@@ -974,8 +974,10 @@ int kho_preserve_vmalloc(void *ptr, stru
 		chunk->phys[idx++] = phys;
 		if (idx == ARRAY_SIZE(chunk->phys)) {
 			chunk = new_vmalloc_chunk(chunk);
-			if (!chunk)
+			if (!chunk) {
+				err = -ENOMEM;
 				goto err_free;
+			}
 			idx = 0;
 		}
 	}
_

